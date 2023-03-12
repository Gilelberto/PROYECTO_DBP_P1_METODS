#!/bin/bash
opt="$1"
opt2=0
section=""
met_id=0   #esta se usará en conjunto a opt2 para una función que maneje los archivos de la sección

#caso donde no se reciba un parámetro válido
if [ $opt != "-a" ] && [ $opt != "-t" ]; then       #como es una cadena usamos != en lugar de -ne
 echo "Error: Parámetro desconocido"
 exit 1
fi

#caso -a metodologías ágiles
if [ $opt == "-a" ]; then      
 echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:
            1.- SCRUM
            2.- X.P.
            3.- Kanban
            4.- Crystal"
 read opt2
 case $opt2 in
    1)
        section+="Metodologías ágiles, SCRUM" 
        echo "Se encuentra en la sección: $section"
        ;;
    2)
        section+="Metodologías ágiles, X.P."
        echo "Se encuentra en la sección: $section"
        ;;
    3)
        section+="Metodologías ágiles, Kanban"
        echo "Se encuentra en la sección: $section"
        ;;
    4)
        section+="Metodologías ágiles, Crystal"
        echo "Se encuentra en la sección: $section"
        ;;
    *)
        echo "Opción no válida"
        exit 1
        ;;
 esac

fi

#caso -t metodologías tradicionales
if [ $opt == "-t" ]; then      
 echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:
            1.- Cascada
            2.-Espiral
            3.-Modelo V"
 read opt2
 case $opt2 in
    1)
        section+="Metodologías tradicionales, Cascada" 
        echo "Se encuentra en la sección: $section"
        ;;
    2)
        section+="Metodologías tradicionales, Espiral" 
        echo "Se encuentra en la sección: $section"
        ;;
    3)
        section+="Metodologías tradicionales, Modelo V" 
        echo "Se encuentra en la sección: $section"
        ;;
    *)
        echo "Opción no válida"
        exit 1
        ;;
 esac
 
fi