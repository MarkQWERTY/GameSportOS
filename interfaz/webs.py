import sys
from PyQt5.QtCore import QUrl
from PyQt5.QtWidgets import (QApplication, QMainWindow, QToolBar, 
                             QLineEdit, QPushButton, QVBoxLayout, 
                             QWidget, QStatusBar)
from PyQt5.QtWebEngineWidgets import QWebEngineView


class Browser(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Navegador Python")
        self.setGeometry(100, 100, 1024, 768)
        
        # Configurar la vista web
        self.browser = QWebEngineView()
        self.browser.setUrl(QUrl("https://www.google.com"))
        
        # Barra de navegación
        navbar = QToolBar()
        self.addToolBar(navbar)
        
        # Botón de retroceso
        back_btn = QPushButton("←")
        back_btn.clicked.connect(self.browser.back)
        navbar.addWidget(back_btn)
        
        # Botón de avance
        forward_btn = QPushButton("→")
        forward_btn.clicked.connect(self.browser.forward)
        navbar.addWidget(forward_btn)
        
        # Botón de recargar
        reload_btn = QPushButton("↻")
        reload_btn.clicked.connect(self.browser.reload)
        navbar.addWidget(reload_btn)
        
        # Barra de direcciones
        self.url_bar = QLineEdit()
        self.url_bar.returnPressed.connect(self.navigate_to_url)
        navbar.addWidget(self.url_bar)
        
        # Botón de ir
        go_btn = QPushButton("Ir")
        go_btn.clicked.connect(self.navigate_to_url)
        navbar.addWidget(go_btn)
        
        # Conectar señal de cambio de URL
        self.browser.urlChanged.connect(self.update_url)
        
        # Barra de estado
        self.status = QStatusBar()
        self.setStatusBar(self.status)
        
        # Configurar layout
        layout = QVBoxLayout()
        layout.addWidget(self.browser)
        
        container = QWidget()
        container.setLayout(layout)
        self.setCentralWidget(container)
    
    def navigate_to_url(self):
        url = self.url_bar.text()
        if not url.startswith("http"):
            url = "http://" + url
        self.browser.setUrl(QUrl(url))
    
    def update_url(self, q):
        self.url_bar.setText(q.toString())
        self.url_bar.setCursorPosition(0)


def launch():
    app = QApplication(sys.argv)
    app.setApplicationName("Navegador Python")
    
    browser = Browser()
    browser.show()
    
    sys.exit(app.exec_())