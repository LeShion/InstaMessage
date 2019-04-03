package clases;

/**
 *
 * @author John
 */
public class Validador {
    
    public boolean isUsernameOrPasswordValid(String $cadena){
        char[] cadena = $cadena.toLowerCase().toCharArray();
    //Se comprueba la Longitud
if(cadena.length <= 6){
    return false;
}
for (int i=0; i<cadena.length; i++){
    // Se comprueba que no existan caracteres especiales que puedan ser usados en SQL Injection o perjudicar la consulta.
    if(cadena[i] == ' '
            || cadena[i] == '='
            || cadena[i] == '?'
            || cadena[i] == '+'
            || cadena[i] == '*'
            || cadena[i] == '-'
            || cadena[i] == '%'
            || cadena[i] == '/'
            || cadena[i] == '.'
            || cadena[i] == ','
            || cadena[i] == ';'
            || cadena[i] == '!'
            || cadena[i] == '<'
            || cadena[i] == '>'
            || cadena[i] == ':'){
        return false;
    }
}
        return true;
    }
}
