#!/bin/bash

start(){
    echo "Starting . . ."
    sleep 5
    clear
    echo "____________________________________________________________________________"
    figlet -c "GameSportOS"
    echo "____________________________________________________________________________"
    echo ""
    echo "Bienvenido, $USER a la GameSportOS interactiva."
    echo -e "\e[38;5;51m"
    echo "  _____________________________________________________________"
    echo " /                                                             \\"
    echo "|                      Comandos Disponibles                     |"
    echo "|_______________________________________________________________|"
    echo "|                                                               |"
    echo "|  ·create     : Crea una carpeta o archivo.                    |"
    echo "|  ·delete     : Elimina una carpeta o archivo.                 |"
    echo "|  ·joke       : Muestra un chiste aleatorio.                   |"
    echo "|  ·adivina    : Adivina un número del 1 al 10.                 |"
    echo "|  ·<comando cmd>  : Ejecuta cualquier comando de la consola.   |"
    echo "|  ·date       : Muestra la hora.                               |"
    echo "|  ·ruleta     : Juega a la ruleta en la terminal.              |"
    echo "|  ·news       : Accede a un periodico o página web.            |"
    echo "|  ·help       : Muestra este menú de ayuda.                    |"    
    echo "|  ·exit       : Sale de la shell interactiva.                  |"
    echo "|                                                               |"
    echo "|  Más informacion en https://github.com/MarkQWERTY/GameSportOS |"
    echo " \\_____________________________________________________________/"
    echo -e "\e[0m"
}

game(){
    numeros_rojos=(1 3 5 7 9 12 14 16 18 19 21 23 25 27 30 32 34 36)
    primerafila=(1 4 7 10 13 16 19 22 25 28 31 34)
    segundafila=(2 5 8 11 14 17 20 23 26 29 32 35)
    tercerafila=(3 6 9 12 15 18 21 24 27 30 33 36)
    clear
    echo -e "\e[38;5;51m"
    echo "  _____________________________________________________________"
    echo " /                                                             \\"
    echo "|                           Roulete                             |"
    echo "|_______________________________________________________________|"
    echo "|                                                               |"
    echo "|    1 4 7 10 13 16 19 22 25 28 31 34 1ºFila (y)                |"
    echo "|  0 2 5 8 11 14 17 20 23 26 29 32 35 2ºFila (u)                |"
    echo "|    3 6 9 12 15 18 21 24 27 30 33 36 3ºFila (i)                |"                            
    echo "|_______________________________________________________________|"
    echo "| 1-18 (q) | Par (p) | Rojo (r) | Negro (n)|Impar (i)| 19-36 (w)|"
    echo "|__________|_________|__________|__________|_________|__________|"
    echo "|     1-12 (e)   |         13-24 (t)        |    25-36   (y)    |"
    echo "|________________|__________________________|___________________|"
    echo "|                                                               |"
    echo "|                       Saldo: $saldo                              |"
    echo "|                                                               |"
    echo "|  Más informacion en https://github.com/MarkQWERTY/GameSportOS |"
    echo " \\_____________________________________________________________/"
    echo -e "\e[0m"
    
    read -p "Seleccione que apuesta desea hacer: " apuesta
    read -p "Seleccione que cantidad desea apostar: " cantidad

    echo ""
    echo "No Va Más"
    echo "27 10 25 29 12 8 19 31 18 6 21 33 16 4 23 35 14"
    echo "0                                             2"
    echo "1                                             0"
    echo "13 36 24 3 15 34 22 5 17 32 20 7 11 30 26 9  28"

    sleep 5
    
    saldo=$(($saldo-$cantidad))
    numero_aleatorio=$((0 + RANDOM % 36))
    isrojo=0
    is1=0
    is2=0
    is3=0
    divisible=$numero_aleatorio%2
    
    echo "Numero saliente: $numero_aleatorio"
    
    for num in "${numeros_rojos[@]}"; do
        if [[ $num -eq $numero_aleatorio ]]; then
            isrojo=1
            break
        fi
    done

    for num in "${primerafila[@]}"; do
        if [[ $num -eq $numero_aleatorio ]]; then
            is1=1
            break
        fi
    done

    for num in "${segundafila[@]}"; do
        if [[ $num -eq $numero_aleatorio ]]; then
            is2=1
            break
        fi
    done

    for num in "${tercerafila[@]}"; do
        if [[ $num -eq $numero_aleatorio ]]; then
            is3=1
            break
        fi
    done
    
    if [[ $numero_aleatorio -eq $apuesta ]]; then
        cantidad=$((cantidad * 36))
        saldo=$(($saldo+$cantidad))
    elif [[ $divisible -eq 0 && $apuesta == "p" ]]; then
        cantidad=$((cantidad * 2))
        saldo=$(($saldo+$cantidad))
    elif [[ $divisible -ne 0 && $apuesta == "i" ]]; then
        cantidad=$((cantidad * 2))
        saldo=$(($saldo+$cantidad))
    elif [[ $numero_aleatorio -gt 18 && $apuesta == "w" ]]; then
        cantidad=$((cantidad * 2))
        saldo=$(($saldo+$cantidad))
    elif [[ $numero_aleatorio -lt 19 && $apuesta == "q" ]]; then
        cantidad=$((cantidad * 2))
        saldo=$(($saldo+$cantidad))
    elif [[ $isrojo -eq 1 && $apuesta == "r" ]]; then
        cantidad=$((cantidad * 2))
        saldo=$(($saldo+$cantidad))
    elif [[ $isrojo -ne 1 && $apuesta == "n" ]]; then
        cantidad=$((cantidad * 2))
        saldo=$(($saldo+$cantidad))
    elif [[ $is1 -eq 1 && $apuesta == "y" ]]; then
        cantidad=$((cantidad * 3))
        saldo=$(($saldo+$cantidad))
    elif [[ $is2 -eq 1 && $apuesta == "u" ]]; then
        cantidad=$((cantidad * 3))
        saldo=$(($saldo+$cantidad))
    elif [[ $is3 -eq 1 && $apuesta == "i" ]]; then
        cantidad=$((cantidad * 3))
        saldo=$(($saldo+$cantidad))
    elif [[ $numero_aleatorio -le 12 && $apuesta == "e" ]]; then
        cantidad=$((cantidad * 2))
        saldo=$(($saldo+$cantidad))
    elif [[ $numero_aleatorio -le 24 && $numero_aleatorio -ge 13 && $apuesta == "t" ]]; then
        cantidad=$((cantidad * 2))
        saldo=$(($saldo+$cantidad))
    elif [[ $numero_aleatorio -ge 25 && $apuesta == "y" ]]; then
        cantidad=$((cantidad * 2))
        saldo=$(($saldo+$cantidad))
    else
        echo "No has ganado nada :("
    fi
    
    echo "Saldo: $saldo"
    otra="Y"
    while [[ $saldo -gt 0 ]]; do  
        read -p "Quiere jugar otra vez(Y/n): " otra
        if [[ "$otra" == "n" ]]; then
            echo "Se fini"
            break
        fi
        if [[ $saldo -le 0 ]]; then
            otra="n"
            echo "Te has quedado sin saldo. Suerte la proxima"
            break
        fi
        game
    done
    echo "a tu puta casa ssubnormal"
    sleep 3
    clear
}
roulete(){
    clear
    figlet "Roulete"
    read -p "Seleccione el saldo para empezar: " saldo
    if [[ $saldo -ge 1 ]]; then  
        game
    else
        echo "ERROR: Saldo invalido"
    fi
}
create() {
    read -p "¿Qué desea crear? (1) Carpeta  (2) Archivo: " opcion

    if [ "$opcion" == "1" ]; then
        echo -n "Ingrese la ruta de la carpeta a crear: "
        read ruta
        mkdir -p "$ruta"
        echo "Carpeta '$ruta' creada con éxito."
    elif [ "$opcion" == "2" ] ; then
        echo -n "Ingrese la ruta completa del archivo a crear: "
        read archivo
        touch "$archivo"
        echo "Archivo '$archivo' creado con éxito."
    else
        echo "Error: Opción no valida"
    fi  
}

delete() {
    read -p "¿Qué desea eliminar? (1) Carpeta  (2) Archivo: " opcionu

    if [[ $opcionu == "1" ]]; then
        read -p "Ingrese la ruta de la carpeta a eliminar: " routed 
        if [[ -d "$routed" ]]; then
            rmdir "$routed"
            echo "Carpeta '$routed' eliminada con éxito."
        else
            echo "Error: La carpeta '$routed' no existe."
        fi
    elif [[ $opcionu == "2" ]]; then
        read -p "Ingrese la ruta del archivo a eliminar: " routea
        if [[ -p "$routea" ]]; then
            rm "$routea"
            echo "Archivo '$routea' eliminada con éxito."
        else
            echo "Error: El archivo '$routea' no existe."
        fi
    else
        echo "Error: Opcion invalida"
    fi
}

help() {
    clear
    echo -e "\e[38;5;51m"
    echo "  _____________________________________________________________"
    echo " /                                                             \\"
    echo "|                     Comandos Disponibles                      |"
    echo "|_______________________________________________________________|"
    echo "|                                                               |"
    echo "|  ·create     : Crea una carpeta o archivo.                    |"
    echo "|  ·delete     : Elimina una carpeta o archivo.                 |"
    # echo "|  ·chatgpt    : Haz una pregunta a ChatGPT (API KEY necesaria) |"
    echo "|  ·joke       : Muestra un chiste aleatorio.                   |"
    echo "|  ·adivina    : Adivina un número del 1 al 10.                 |"
    echo "|  ·<comando cmd>  : Ejecuta cualquier comando de la consola.   |"
    echo "|  ·date       : Muestra la hora.                               |"
    echo "|  ·ruleta     : Juega a la ruleta en la terminal.              |"
    echo "|  ·news       : Accede a un periodico o página web.            |"
    echo "|  ·help       : Muestra este menú de ayuda.                    |"    
    echo "|  ·exit       : Sale de la shell interactiva.                  |"
    echo "|                                                               |"
    echo "|  Más informacion en https://github.com/MarkQWERTY/GameSportOS |"
    echo " \\_____________________________________________________________/"
    echo -e "\e[0m"
}

joke() {
    chistes=(
        "— ¿Cuál es el animal más friki?
        — El *pingüino*, porque siempre lleva Linux."

        "Un programador muere y va al cielo. Dios le dice:
        — Puedes elegir entre el Cielo o el Infierno.
        — ¿Puedo ver el código fuente primero?"

        "— ¿Por qué Java nunca es invitado a las fiestas?
        — Porque siempre llega con demasiada *carga*."

        "— ¿Qué le dice un bit al otro bit?
        — Nos vemos en el bus."

        "— ¿Por qué los programadores prefieren la oscuridad?
        — Porque la luz atrae *bugs*."

        "Un sysadmin en su lecho de muerte susurra:
        — 'sudo resucitar'."

        "— ¿Por qué los programadores odian el verano?
        — Porque el calor hace que sus ventiladores trabajen más y ellos menos."

        "— ¿Cómo se despide un programador?
        — ¡Hasta el *return*!."

        "— Mamá, mamá, en el colegio me llaman programador.
        — ¿Y tú qué les dices?
        — printf('Me da igual');"
    )

    total=${#chistes[@]}
    indice=$((RANDOM % total))

    echo "${chistes[$indice]}"
}
adivina() {
    num=$((RANDOM % 10 + 1))
    intentos=3
    echo "🎲 Estoy pensando en un número del 1 al 10. ¡Intenta adivinarlo!"
    while [[ $intentos -gt 0 ]]; do
        read -p "Ingresa tu número: " guess
        if [[ $guess -eq $num ]]; then
            echo "🎉 ¡Correcto! Adivinaste el número."
            return
        else
            ((intentos--))
            if [[ $intentos -gt 0 ]]; then
                echo "❌ Incorrecto. Te quedan $intentos intentos."
            fi
        fi
    done
    echo "💀 Te quedaste sin intentos. El número era $num."
}
tiempo() {
    hora=$(date +"%H:%M")
    fecha=$(date +"%d/%m/%Y")
    horaasc=$(toilet -f future "$hora")
    fechascii=$(toilet -f future "$fecha")

    echo "______________"
    echo "$horaasc"
    echo "______________"
}

news(){
	if [ "$2" = "marca" || "$1" = "marca" ]; then
    	lynx "http://marca.com//"  
	elif [ "$2" = "as" || "$1" = "as" ]; then
    	lynx "https://as.com/"  
	elif [ "$2" = "elespanol" || "$1" = "elespanol" ]; then
    	hlynx "https://www.elespanol.com/"
	elif [ "$2" = "eldebate" || "$1" = "eldebate" ]; then
		lynx "https://www.eldebate.com/"
	elif [ "$2" = "20minutos" || "$1" = "20minutos" ]; then
		lynx "https://www.20minutos.es/"
	elif [ "$2" = "elpais" || "$1" = "elpais" ]; then
		lynx "https://elpais.com/"
	elif [ "$2" = "help" || "$1" = "help" ]; then
		clear
        echo -e "\e[38;5;51m"
        echo "  _____________________________________________________________"
        echo " /                                                             \\"
        echo "|                     Periodicos Disponibles                    |"
        echo "|_______________________________________________________________|"
        echo "|                                                               |"
        echo "|  ·El País : elpais                                            |"
        echo "|  ·Marca   : marca                                             |"
        echo "|  ·AS      : as                                                |"
        echo "|  ·20 minutos : 20minutos                                      |"
        echo "|  ·El Español: elespanol                                       |"
        echo "|  ·El debate: eldebate                                         |"
        echo "|  ·La razón: larazon                                           |"
        echo "|  ·Hola: hola                                                  |"
        echo "|  ·Cualquier Periodico: -p https://paginaweb.com               |"    
        echo "|                                                               |"
        echo "|  Más informacion en https://github.com/MarkQWERTY/GameSportOS |"
        echo " \\_____________________________________________________________/"
        echo -e "\e[0m"
    else
        lynx "$2"
    fi
}

if [[ $1 == "" ]]; then
    start
    while true; do
        # Definir colores ANSI
        USUARIO_COLOR="\e[38;5;206m"  # Rosa
        UBICACION_COLOR="\e[38;5;51m"  # Celeste
        RESET_COLOR="\e[0m"           # Reset de color

        # Mostrar prompt con colores
        read -p "$(echo -e "$(date +"%H:%M") ${USUARIO_COLOR}$(whoami)@$(hostname)${RESET_COLOR}:${UBICACION_COLOR}$(pwd)${RESET_COLOR}$ ")" input

        if [ "$input" = "create" ]; then
            create
        elif [ "$input" = "delete" ]; then
            delete
        elif [ "$input" = "chatgpt" ]; then
            chatgpt
        elif [ "$input" = "news" ]; then
            news
        elif [ "$input" = "help" ]; then
            help
        elif [ "$input" = "joke" ]; then
            joke
        elif [ "$input" = "adivina" ]; then
            adivina
        elif [ "$input" = "hora" ]; then
            tiempo
        elif [ "$input" = "ruleta" ]; then
            roulete
        elif [ "$input" = "secreto" ]; then
            bash "santiago_abascal.sh"
        elif [ "$input" = "exit" ]; then
            echo "Saliendo de la shell..."
            break
        elif [[ "$input" =~ ^cd\ .* ]]; then
            directorio="${input:3}"
            cd "$directorio" 2>/dev/null || echo "Error: No se pudo cambiar al directorio '$directorio'"
        else
            # Ejecutar cualquier comando de la consola
            eval "$input" 2>/dev/null || echo "Error: Comando no reconocido o falló su ejecución."
        fi
    done

elif [[ $1 == "install" ]]; then
    install
elif [[ $1 == "delete" ]]; then
    uninstall
elif [[ $1 == "chatgpt" ]]; then
    chatgpt
elif [[ $1 == "help" ]]; then
    help
elif [[ $1 == "joke" ]]; then
    joke
elif [[ $1 == "adivina" ]]; then
    adivina
elif [[ $1 == "hora" ]]; then
    tiempo
elif [[ $1 == "ruleta" ]]; then
    roulete
elif [[ $1 == "news" ]]; then
    news
elif [[ $1 == "ilovepodemita" ]]; then
    bash "santiago_abascal.sh"
fi

