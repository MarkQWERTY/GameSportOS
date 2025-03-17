# Shell Interactiva - GameSportOS

## Descripción 
Este script (`shell_interactiva.sh`) proporciona una shell interactiva con múltiples funciones, incluyendo un juego de ruleta, comandos personalizados, gestión de archivos y acceso a noticias.

## Requisitos
- Sistema operativo basado en Unix (Linux/macOS)
- `figlet` para la presentación visual
- `jq` para procesar respuestas JSON de la API de ChatGPT
- `lynx` para acceder a noticias desde la terminal

## Instalación
1. Clona el repositorio o descarga el archivo `shell_interactiva.sh`.
2. Concede permisos de ejecución:
   ```bash
   chmod +x shell_interactiva.sh
   ```
3. Ejecuta el script:
   ```bash
   ./shell_interactiva.sh
   ```

## Funcionalidades Principales
- **Juego de Ruleta**: Simulación de ruleta con diferentes opciones de apuesta.
- **Gestión de Archivos**: Crear y eliminar archivos o carpetas.
- **Interacción con ChatGPT**: Consultas a OpenAI (requiere API key).
- **Chistes y Juegos**: Generador de chistes y juego de adivinanza.
- **Acceso a Noticias**: Consulta periódicos en línea desde la terminal.
- **Comandos Personalizados**: Ejecuta comandos comunes y personalizados dentro de la shell.

## Uso
Una vez ejecutado el script, escribe `help` para ver la lista de comandos disponibles. Algunos comandos clave:
- `create`: Crear un archivo o carpeta.
- `delete`: Eliminar un archivo o carpeta.
- `chatgpt`: Realizar consultas a ChatGPT (requiere API key válida).
- `ruleta`: Iniciar el juego de ruleta.
- `joke`: Mostrar un chiste aleatorio.
- `adivina`: Jugar a adivinar un número.
- `news <nombre_periodico>`: Acceder a noticias en línea.
- `exit`: Salir de la shell interactiva.

## Notas
- El script contiene una clave de API de OpenAI hardcodeada. **Es recomendable eliminarla y reemplazarla con una propia** para evitar problemas de seguridad.
- Algunos comandos pueden necesitar dependencias externas (`figlet`, `lynx`, `jq`). Se recomienda instalarlas con:
  ```bash
  sudo apt install figlet lynx jq -y  # Debian/Ubuntu
  sudo dnf install figlet lynx jq -y  # Fedora
  brew install figlet lynx jq         # macOS
  ```

## Contribuciones
Si deseas mejorar este script, siéntete libre de hacer un fork y enviar un pull request.

## Autor
Este script fue desarrollado por [MarkQWERTY](https://github.com/MarkQWERTY/GameSportOS). Más información y actualizaciones en su repositorio de GitHub.

## Licencia
Este proyecto está bajo la licencia MIT.


