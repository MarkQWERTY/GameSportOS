import tkinter as tk
from tkinter import font

class Calculadora:
    def __init__(self, root):
        self.root = root
        self.root.title("Calculadora")
        self.root.resizable(0, 0)
        
        # Configurar fuente más grande
        self.fuente = font.Font(size=15)
        
        # Variable para almacenar la operación
        self.operacion = ""
        
        # Pantalla de la calculadora
        self.pantalla = tk.Entry(root, font=self.fuente, borderwidth=5, 
                                justify="right", state='readonly')
        self.pantalla.grid(row=0, column=0, columnspan=4, padx=10, pady=10, ipady=10)
        
        # Creación de botones
        self.crear_botones()
        
    def crear_botones(self):
        # Configuración de botones
        botones = [
            ('7', 1, 0), ('8', 1, 1), ('9', 1, 2), ('/', 1, 3),
            ('4', 2, 0), ('5', 2, 1), ('6', 2, 2), ('*', 2, 3),
            ('1', 3, 0), ('2', 3, 1), ('3', 3, 2), ('-', 3, 3),
            ('0', 4, 0), ('C', 4, 1), ('=', 4, 2), ('+', 4, 3)
        ]
        
        # Crear botones en la interfaz
        for (texto, fila, columna) in botones:
            boton = tk.Button(self.root, text=texto, font=self.fuente, 
                             padx=20, pady=20, command=lambda t=texto: self.click_boton(t))
            boton.grid(row=fila, column=columna, sticky="nsew")
        
        # Ajustar tamaño de columnas y filas
        for i in range(5):
            self.root.grid_rowconfigure(i, weight=1)
        for i in range(4):
            self.root.grid_columnconfigure(i, weight=1)
    
    def click_boton(self, valor):
        if valor == 'C':
            self.operacion = ""
        elif valor == '=':
            try:
                # Evaluar la operación matemática
                resultado = str(eval(self.operacion))
                self.operacion = resultado
            except:
                self.operacion = "Error"
        else:
            # Concatenar el valor al string de la operación
            self.operacion += str(valor)
        
        # Actualizar pantalla
        self.actualizar_pantalla()
    
    def actualizar_pantalla(self):
        # Habilitar temporalmente para modificar
        self.pantalla.config(state='normal')
        self.pantalla.delete(0, tk.END)
        self.pantalla.insert(0, self.operacion)
        self.pantalla.config(state='readonly')

def calc():
    root = tk.Tk()
    calculadora = Calculadora(root)
    root.mainloop()