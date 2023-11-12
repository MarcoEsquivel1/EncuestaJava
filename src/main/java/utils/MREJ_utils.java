package utils;

public class MREJ_utils {

    public static String convertSexo(int sexo){
        if(sexo == 1){
            return "Masculino";
        }else{
            return "Femenino";
        }
    }

    public static String convertDep_fav(int dept){
        if (dept == 1){
            return "Futbol";
        }else if(dept == 2){
            return "Basquetbol";
        }else if(dept == 3){
            return "Jockey";
        }else if(dept == 4){
            return "Beisbol";
        }else if(dept == 5){
            return "Golf";
        }else {
            return "Otro";
        }
    }

    public static String convertNivel_estudio(int nivel){
        if (nivel == 1){
            return "Basico";
        }else if(nivel == 2){
            return "Intermedio";
        }else if(nivel == 3){
            return "Superior";
        }else {
            return "Otro";
        }
    }

    public static String convertTema_fav(int tema) {
        if (tema == 1){
            return "Televisión";
        }else if (tema == 2){
            return "Cocina";
        }else if(tema == 3){
            return "Tecnologia";
        }else if(tema == 4){
            return "Musica";
        }else if(tema == 5){
            return "Deportes";
        }else {
            return "Otro";
        }
    }
}
