import tkinter as tk
from tkinter import messagebox
import time
import os
import subprocess
import webs
import calc
from PIL import Image, ImageTk

class MarkOS:
    def __init__(self, root):
        self.root = root
        self.root.title("MarkOS")
        self.root.attributes("-fullscreen", True)
        self.root.configure()

        self.load_background("resources/walla.jpeg")
        
        # Configuración del grid
        self.root.grid_rowconfigure(0, weight=1)
        self.root.grid_rowconfigure(1, weight=0)
        self.root.grid_columnconfigure(0, weight=1)
        
        self.create_apps_section()
        self.create_taskbar()
        self.update_clock()
    
    def load_background(self, image_path):
        try:
            # Cargar imagen y redimensionar a la pantalla
            self.bg_image = Image.open(image_path)
            self.bg_photo = ImageTk.PhotoImage(self.bg_image.resize(
                (self.root.winfo_screenwidth(), self.root.winfo_screenheight()),
                Image.LANCZOS
            ))
            
            # Crear canvas para el fondo
            self.canvas = tk.Canvas(self.root, highlightthickness=0)
            self.canvas.grid(row=0, column=0, rowspan=2, sticky="nsew")
            self.canvas.create_image(0, 0, image=self.bg_photo, anchor="nw")
            
            # Traer los otros elementos al frente
            self.root.lower(self.canvas)
            
        except Exception as e:
            print(f"Error cargando fondo: {e}")
            # Fondo por defecto si falla la imagen
            self.root.configure(bg='gray33')

    def create_apps_section(self):
        main_frame = tk.Frame(self.root, bg='', bd=0)  # Fondo transparente
        main_frame.grid(row=0, column=0, sticky="nsew")
        
        inner_frame = tk.Frame(main_frame, bg='', bd=0)  # Fondo transparente
        inner_frame.pack(expand=True, padx=100, pady=100)
        
        for i in range(2):
            inner_frame.grid_rowconfigure(i, weight=1)
            inner_frame.grid_columnconfigure(i, weight=1)
        
        # Botones con funciones asignadas (corregida la coma faltante)
        apps = [
            ("⚙️ Configuración", self.open_settings),
            ("🌐 Navegador", self.open_browser),
            ("📁 Archivos", self.open_file_manager),
            ("📟 Terminal", self.open_terminal),
            ("🧮 Calculadora", self.open_calc)
        ]
        
        btn_style = {
            'font': ('Segoe UI', 18),
            "bg": "gray",
            'fg': 'white',
            'bd': 0,
            'relief': 'flat',
            'highlightthickness': 0
        }
        
        for i, (app, command) in enumerate(apps):
            row, col = divmod(i, 2)
            btn = tk.Button(inner_frame, text=app, **btn_style, command=command)
            btn.grid(row=row, column=col, padx=30, pady=30, sticky="nsew")
            
            btn.bind("<Enter>", lambda e, b=btn: b.config(bg='gray30'))
            btn.bind("<Leave>", lambda e, b=btn: b.config(bg='gray20'))
    
    def create_taskbar(self):
        taskbar = tk.Frame(self.root, bg='seagreen2', height=50)
        taskbar.grid(row=1, column=0, sticky="sew")
        
        # Botón Inicio con menú
        start_btn = tk.Menubutton(taskbar, text=" Inicio ", bg='seagreen2', fg='white',
                                font=('Segoe UI', 10, 'bold'), bd=0, relief='flat')
        start_menu = tk.Menu(start_btn, tearoff=0, bg='gray20', fg='white')
        
        # Menú de energía
        power_menu = tk.Menu(start_menu, tearoff=0, bg='gray20', fg='white')
        power_menu.add_command(label="Apagar", command=self.shutdown)
        power_menu.add_command(label="Reiniciar", command=self.reboot)
        
        start_menu.add_cascade(label="Energía", menu=power_menu)
        start_menu.add_command(label="Salir", command=self.root.quit)
        start_btn.config(menu=start_menu)
        start_btn.pack(side='left', padx=10)
        
        # Área de aplicaciones abiertas
        tk.Frame(taskbar, bg='seagreen2').pack(side='left', expand=True)
        
        # Hora y fecha
        self.time_label = tk.Label(taskbar, font=('Segoe UI', 10, 'bold'), 
                                 bg='seagreen2', fg='white')
        self.time_label.pack(side='right', padx=15)
    
    def update_clock(self):
        self.time_label.config(text=time.strftime("%H:%M | %d/%m/%Y"))
        self.root.after(1000, self.update_clock)
    
    # Funciones de los botones
    def open_settings(self):
        messagebox.showinfo("Configuración", "Sistema de configuración abierto")
    
    def open_browser(self):
        try:
            webs.launch()
        except Exception as e:
            messagebox.showerror("Error", f"No se pudo abrir el navegador: {str(e)}")
    
    def open_file_manager(self):
        try:
            # Implementación multiplataforma para gestor de archivos
            if os.name == 'nt':  # Windows
                os.startfile(os.path.expanduser("~"))
            else:  # Linux/Mac
                subprocess.Popen(["xdg-open", os.path.expanduser("~")])
        except Exception as e:
            messagebox.showerror("Error", f"No se pudo abrir el gestor de archivos: {str(e)}")
    
    def open_terminal(self):
        try:
            # Implementación multiplataforma para terminal
            if os.name == 'nt':  # Windows
                os.system("start cmd")
            else:  # Linux/Mac
                subprocess.Popen(["x-terminal-emulator"])
        except Exception as e:
            messagebox.showerror("Error", f"No se pudo abrir la terminal: {str(e)}")
    
    def open_calc(self):
        try:
            calc.calc()
        except Exception as e:
            messagebox.showerror("Error", f"No se pudo abrir la calculadora: {str(e)}")
    
    # Funciones de energía
    def shutdown(self):
        if messagebox.askyesno("Apagar", "¿Desea apagar el sistema?"):
            try:
                if os.name == 'nt':  # Windows
                    os.system("shutdown /s /t 1")
                else:  # Linux/Mac
                    os.system("shutdown now")
            except Exception as e:
                messagebox.showerror("Error", f"No se pudo apagar el sistema: {str(e)}")
    
    def reboot(self):
        if messagebox.askyesno("Reiniciar", "¿Desea reiniciar el sistema?"):
            try:
                if os.name == 'nt':  # Windows
                    os.system("shutdown /r /t 1")
                else:  # Linux/Mac
                    os.system("reboot")
            except Exception as e:
                messagebox.showerror("Error", f"No se pudo reiniciar el sistema: {str(e)}")

if __name__ == "__main__":
    root = tk.Tk()
    app = MarkOS(root)  # Cambiado de 'os' a 'app' para evitar conflicto con módulo os
    root.mainloop()