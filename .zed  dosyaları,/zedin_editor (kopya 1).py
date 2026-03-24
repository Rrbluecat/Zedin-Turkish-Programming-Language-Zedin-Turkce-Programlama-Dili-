import flet as ft
import subprocess
import tempfile
import os
import time

def main(page: ft.Page):
    page.title = "Zedin Editör"
    page.theme_mode = ft.ThemeMode.DARK
    page.bgcolor = "#1e1e1e"
    page.padding = 0
    page.window_width = 900
    page.window_height = 650

    dosya_yolu = [None]

    def zedin_bul():
        for yol in ["zedin", os.path.expanduser("~/bin/zedin"),
                    os.path.expanduser("~/zedin/zedin")]:
            try:
                subprocess.run([yol, "--help"], capture_output=True, timeout=2)
                return yol
            except:
                pass
        return "zedin"

    zedin = zedin_bul()

    editor = ft.TextField(
        multiline=True,
        expand=True,
        value='degisken x = 42;\nyaz x;\n\nfonk merhaba(isim) {\n    yaz "Merhaba " + isim;\n}\nmerhaba("Zedin");',
        text_style=ft.TextStyle(size=14, font_family="Courier New", color="#d4d4d4"),
        bgcolor="#1e1e1e",
        border_color="transparent",
        focused_border_color="transparent",
        cursor_color="#ffffff",
        content_padding=ft.padding.all(12),
    )

    cikti = ft.TextField(
        multiline=True,
        read_only=True,
        expand=True,
        value="Zedin Editör hazır.\nCtrl+Enter → Çalıştır\n",
        text_style=ft.TextStyle(size=13, font_family="Courier New", color="#9cdcfe"),
        bgcolor="#252526",
        border_color="transparent",
        focused_border_color="transparent",
        content_padding=ft.padding.all(12),
    )

    durum = ft.Text("Hazır", color="#ffffff", size=12)
    dosya_etiket = ft.Text("program.zed", color="#cccccc", size=12)

    def calistir(vm=False):
        kod = editor.value or ""
        if not kod.strip():
            cikti.value = "Kod boş!\n"
            page.update()
            return
        durum.value = "Çalışıyor..."
        page.update()
        with tempfile.NamedTemporaryFile(mode='w', suffix='.zed', delete=False) as f:
            f.write(kod)
            tmp = f.name
        t = time.time()
        try:
            cmd = [zedin] + (["--vm"] if vm else []) + [tmp]
            r = subprocess.run(cmd, capture_output=True, text=True, timeout=15)
            ms = int((time.time() - t) * 1000)
            sonuc = r.stdout or ""
            if r.stderr:
                sonuc += r.stderr
            if not sonuc.strip():
                sonuc = "(çıktı yok)\n"
            sonuc += f"\n── {ms}ms ──\n"
            cikti.value = sonuc
        except Exception as ex:
            cikti.value = f"Hata: {ex}\n"
        finally:
            os.unlink(tmp)
        durum.value = "Hazır"
        page.update()

    def dosya_ac_sonuc(e):
        if e.files:
            f = e.files[0]
            dosya_yolu[0] = f.path
            dosya_etiket.value = f.name
            with open(f.path, 'r', encoding='utf-8') as d:
                editor.value = d.read()
            page.update()

    def dosya_kaydet_sonuc(e):
        if e.path:
            dosya_yolu[0] = e.path
            dosya_etiket.value = os.path.basename(e.path)
            with open(e.path, 'w', encoding='utf-8') as f:
                f.write(editor.value or "")
            durum.value = "Kaydedildi"
            page.update()

    def kaydet(e=None):
        if dosya_yolu[0]:
            with open(dosya_yolu[0], 'w', encoding='utf-8') as f:
                f.write(editor.value or "")
            durum.value = "Kaydedildi"
            page.update()
        else:
            kaydet_dialog.save_file(file_name="program.zed",
                                    allowed_extensions=["zed"])

    ac_dialog = ft.FilePicker()
    ac_dialog.on_result = dosya_ac_sonuc
    kaydet_dialog = ft.FilePicker()
    kaydet_dialog.on_result = dosya_kaydet_sonuc
    page.overlay.extend([ac_dialog, kaydet_dialog])

    def klavye(e):
        if e.ctrl and e.key == "Enter":
            calistir(False)
        elif e.ctrl and e.key == "S":
            kaydet()

    page.on_keyboard_event = klavye

    page.add(
        ft.Column([
            ft.Container(
                content=ft.Row([
                    ft.Text("Zedin", color="#4fc3f7", size=16,
                            weight=ft.FontWeight.BOLD),
                    ft.Container(width=8),
                    dosya_etiket,
                    ft.Container(expand=True),
                    ft.TextButton("📂 Aç",
                        on_click=lambda e: ac_dialog.pick_files(
                            allowed_extensions=["zed","txt"]),
                        style=ft.ButtonStyle(color="#cccccc")),
                    ft.TextButton("💾 Kaydet",
                        on_click=kaydet,
                        style=ft.ButtonStyle(color="#cccccc")),
                    ft.Container(width=8),
                    ft.ElevatedButton("▶ Çalıştır",
                        on_click=lambda e: calistir(False),
                        bgcolor="#0066cc", color="#ffffff", height=32),
                    ft.ElevatedButton("⚡ VM",
                        on_click=lambda e: calistir(True),
                        bgcolor="#cc3300", color="#ffffff", height=32),
                ], vertical_alignment=ft.CrossAxisAlignment.CENTER),
                bgcolor="#333333",
                padding=ft.padding.symmetric(horizontal=12, vertical=6),
            ),
            ft.Row([
                ft.Container(content=editor, expand=True, bgcolor="#1e1e1e"),
                ft.VerticalDivider(width=1, color="#555555"),
                ft.Container(
                    content=ft.Column([
                        ft.Container(
                            content=ft.Row([
                                ft.Text("Çıktı", color="#888888", size=12),
                                ft.Container(expand=True),
                                ft.TextButton("Temizle",
                                    on_click=lambda e: (
                                        setattr(cikti, 'value', '') or page.update()),
                                    style=ft.ButtonStyle(color="#888888")),
                            ]),
                            bgcolor="#252526",
                            padding=ft.padding.symmetric(horizontal=8, vertical=4),
                        ),
                        ft.Container(content=cikti, expand=True),
                    ], spacing=0),
                    width=350,
                    bgcolor="#252526",
                ),
            ], expand=True, spacing=0,
               vertical_alignment=ft.CrossAxisAlignment.STRETCH),
            ft.Container(
                content=ft.Row([
                    ft.Text("Zedin v5.0", color="#ffffff", size=11),
                    ft.Text("|", color="#888888", size=11),
                    durum,
                ], spacing=8),
                bgcolor="#0066cc",
                padding=ft.padding.symmetric(horizontal=12, vertical=3),
                height=24,
            ),
        ], expand=True, spacing=0)
    )

ft.app(target=main)
