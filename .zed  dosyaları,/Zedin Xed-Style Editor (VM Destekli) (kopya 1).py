import flet as ft
import subprocess
import tempfile
import os
import time

def main(page: ft.Page):
    page.title = "Zedin Editör - Linux Mint Style"
    page.theme_mode = ft.ThemeMode.LIGHT
    page.window_width = 1100
    page.window_height = 800
    
    # Dosya yolu takibi
    current_file = [None]

    # --- EDİTÖR AYARLARI ---
    editor = ft.TextField(
        multiline=True,
        expand=True,
        value='// Zedin v5.0 VM Test\ndegisken x = 10;\nyaz "Sayı: " + metine(x);\n\nfonk selamla(n) {\n    yaz "Merhaba " + n;\n}\nselamla("Dünya");',
        text_style=ft.TextStyle(size=14, font_family="DejaVu Sans Mono, Consolas, monospace"),
        bgcolor="#ffffff",
        border_color="transparent",
        cursor_color="#212121",
        content_padding=ft.padding.all(20),
    )

    cikti_alani = ft.TextField(
        multiline=True,
        read_only=True,
        expand=True,
        text_style=ft.TextStyle(size=12, font_family="monospace", color="#333333"),
        bgcolor="#f4f4f4",
        border_color="transparent",
    )

    durum_cubugu = ft.Text("Hazır", size=11, color="#555555")

    # --- VM ÇALIŞTIRMA MANTIĞI ---
    def run_zedin(is_vm=False):
        if not editor.value.strip(): return
        
        durum_cubugu.value = "Zedin çalışıyor..."
        page.update()

        # Geçici dosya oluştur (.zed uzantılı)
        with tempfile.NamedTemporaryFile(mode='w', suffix='.zed', delete=False) as tf:
            tf.write(editor.value)
            temp_path = tf.name

        start_time = time.time()
        try:
            # Buradaki "zedin" senin derlediğin C++ dosyasının adı olmalı
            # Eğer sistem yolunda değilse "./zedin" yapmalısın
            cmd = ["./zedin"] 
            if is_vm: cmd.append("--vm") # Bytecode/VM modu için
            cmd.append(temp_path)

            process = subprocess.run(cmd, capture_output=True, text=True, timeout=10)
            
            elapsed = int((time.time() - start_time) * 1000)
            
            # Çıktıyı formatla
            final_output = process.stdout
            if process.stderr:
                final_output += "\n--- HATA ---\n" + process.stderr
            
            cikti_alani.value = final_output + f"\n\n[İşlem {elapsed}ms içinde tamamlandı]"
        except FileNotFoundError:
            cikti_alani.value = "HATA: 'zedin' yorumlayıcısı bulunamadı! Lütfen C++ kodunu derleyip editörle aynı klasöre koyun."
        except Exception as e:
            cikti_alani.value = f"Sistem Hatası: {str(e)}"
        finally:
            if os.path.exists(temp_path):
                os.unlink(temp_path)
        
        durum_cubugu.value = "Hazır"
        page.update()

    # --- ÜST MENÜ VE TOOLBAR ---
    page.appbar = ft.AppBar(
        leading=ft.Icon(ft.icons.CODE, color="#4caf50"),
        title=ft.Text("Zedin v5.0 (VM Edition)", size=16, weight="bold"),
        bgcolor="#f8f9fa",
        actions=[
            ft.TextButton("Çalıştır", icon=ft.icons.PLAY_ARROW, on_click=lambda _: run_zedin(False)),
            ft.TextButton("VM Modu", icon=ft.icons.FLASH_ON, on_click=lambda _: run_zedin(True)),
            ft.VerticalDivider(),
            ft.IconButton(ft.icons.SETTINGS_OUTLINED),
        ]
    )

    # --- ANA DİZAYN (XED STYLE) ---
    # Sol tarafta satır numarası gibi duran ama aslında boşluk sağlayan ince bir sütun
    line_gutter = ft.Container(width=40, bgcolor="#f0f0f0")

    main_layout = ft.Column([
        # Üst Araç Çubuğu
        ft.Container(
            content=ft.Row([
                ft.IconButton(ft.icons.FILE_OPEN, tooltip="Aç"),
                ft.IconButton(ft.icons.SAVE, tooltip="Kaydet"),
                ft.VerticalDivider(),
                ft.IconButton(ft.icons.UNDO),
                ft.IconButton(ft.icons.REDO),
            ]),
            padding=5, bgcolor="#eeeeee"
        ),
        # Orta Kısım (Editor)
        ft.Row([
            ft.Container(content=editor, expand=True),
        ], expand=True),
        # Alt Panel (Çıktı / Konsol)
        ft.Container(
            content=ft.Column([
                ft.Divider(height=1, color="#cccccc"),
                ft.Row([ft.Text(" Konsol Çıktısı", size=11, weight="bold")], bgcolor="#e0e0e0"),
                cikti_alani
            ]),
            height=200,
        ),
        # Durum Çubuğu
        ft.Container(
            content=ft.Row([
                durum_cubugu,
                ft.Container(expand=True),
                ft.Text("Zedin-Lisp | UTF-8", size=11)
            ]),
            padding=ft.padding.symmetric(horizontal=10),
            height=25,
            bgcolor="#f0f0f0"
        )
    ], expand=True, spacing=0)

    page.add(main_layout)

ft.app(target=main)
