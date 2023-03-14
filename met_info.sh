#!/bin/bash
opt="$1"
opt2=0
section=""
route="./"

addInfo() {
    echo "¿Cuál es el nombre del concepto?"
    read concept
    echo "Por favor, ingrese la información relacionada al concepto $concept."
    read info
    echo "[$concept].- $info." >> $route
    echo "Añadido correctamente"
}
search() {
    echo "Ingrese el concepto a buscar"
    read aux
    grep -wi "[$aux]" $route
}
deleteInfo() {
    echo "Concepto a eliminar: "
    read concept
    sed -i "/\[$concept\]/d" $route
    echo "El concepto $concept fue borrado"
}
readInfo() {
    cat $route
}

submenu(){
    aux=0
    echo "Usted esta en la sección $section. Seleccione la opción que desea utilizar.

            1.- Agregar información
            2.- Buscar
            3.- Eliminar información
            4.- Leer base de información.
            5.- Volver al menu inicial
            6.- Salir"
    read aux
    case $aux in
        1)
            addInfo
            goBack
        ;;
        2)
            search
            goBack
        ;;

        3)
            deleteInfo
            goBack
        ;;
        4)
            readInfo
            goBack
        ;;
        5)
            menu
        ;;
        6)
            exit 0
        ;;
        *)
            echo "Opción no válida"
        ;;
    esac
    
}

goBack(){
    echo " "
    echo "Ingresa 1 para regresar al menú anterior" 
    echo "Cualquier otra para finalizar"
    read par
    if [ $par -eq 1 ]; then
        submenu
    else
        echo "Fin del programa."
        exit 0
    fi

}

menu(){
    #caso donde no se reciba un parámetro válido
    if [ $opt != "-a" ] && [ $opt != "-t" ]; then       #como es una cadena usamos != en lugar de -ne
    echo "Error: Parámetro desconocido"
    exit 1
    fi

    opt2=0
    section=""
    route="./"
    if [ $opt == "-a" ]; then
    route+="agile/"  
    echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:
            1.- SCRUM
            2.- X.P.
            3.- Kanban
            4.- Crystal"
    read opt2
    case $opt2 in
        1)
            section+="Metodologías ágiles, SCRUM"
            route+="scrum.inf" 
            submenu
            ;;
        2)
            section+="Metodologías ágiles, X.P."
            route+="xp.inf"
            submenu
            ;;
        3)
            section+="Metodologías ágiles, Kanban"
            route+="kanban.inf"
            submenu
            ;;
        4)
            section+="Metodologías ágiles, Crystal"
            route+="crystal.inf"
            submenu
            ;;
        *)
            echo "Opción no válida"
            exit 1
            ;;
    esac

    fi

    #caso -t metodologías tradicionales
    if [ $opt == "-t" ]; then
    route+="tradi/"      
    echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:
                1.- Cascada
                2.-Espiral
                3.-Modelo V"
    read opt2
    case $opt2 in
        1)
            section+="Metodologías tradicionales, Cascada"
            route+="cascada.inf" 
            submenu
            ;;
        2)
            section+="Metodologías tradicionales, Espiral" 
            route+="espiral.inf"
            submenu
            ;;
        3)
            section+="Metodologías tradicionales, Modelo V" 
            route+="modeloV.inf"
            submenu
            ;;
        *)
            echo "Opción no válida"
            exit 1
            ;;
    esac

    fi
}

menu
