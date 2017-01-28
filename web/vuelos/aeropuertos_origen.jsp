<%@page import="com.aerolinea.procesos.*"%>
<%@page import="com.aerolinea.entidades.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/reset.css"/>
        <link rel="stylesheet" href="../css/main.css"/>
        <link rel="stylesheet" href="../css/tabla.css"/>
        <style>
            #table01 td{ padding-top: 8px; cursor: pointer}
        </style>
        <title>Origenes</title>
    </head>
    <body>
        <div id="contenido" style="padding: 10px">
        <h1>Aeropuertos Origen</h1>
<%
    Conexion conn = new ConexionPool();
    Operaciones.setConexion(conn);
    
    //consulta SQL para mostrar todos los aeropuertos
    String sql = "select idaeropuerto, aeropuerto, pais, ciudad "            
            + " from aeropuertos a, paises p"
            + " where a.idpais = p.idpais";
    //array qye almacena todos los aeropuertos
    String[][] aeropuertos =
    Operaciones.consultar(sql);
  
    //cabeceras de la tabla
    String[] cabeceras = new String[]{
      "Idaeropuerto",
      "Aeropuerto",
      "País",
      "Ciudad"
    };
    
    //variable de tipo Tabla para generar la Tabla HTML
    Tabla tab = new Tabla(aeropuertos, //array que contiene los datos
          "95%", //ancho de la tabla px | % 
          Tabla.STYLE.TABLE01, //estilo de la tabla
          Tabla.ALIGN.LEFT,  // alineacion de la tabla
          cabeceras); //array con las cabeceras de la tabla
   
    //hace la fila seleccionable
    tab.setFilaSeleccionable(true);
    //asigna un metodo javascript para se ejecutado al hacer click en 
    //un fila, por defecto es: _seleccionar
    tab.setMetodoFilaSeleccionable("_Seleccionar_");
    //pagina para seleccion
    tab.setPaginaSeleccionable("");
    //columnas seleccionables
    tab.setColumnasSeleccionables(new int[]{0,1,2,3});
    tab.setPie("Resultado Aeropuertos");
    
    //imprime tabla en pantalla
        String tabla01 = tab.getTabla();
        out.println(tabla01);
    %>
    
    <script>
        //funcion javascript que se ejecuta al hacer click en una fila
        //recibe un elemento de tipo fila como parametro: row
        function _Seleccionar_(row){
            
            //recupera el idorigen de la fila, en la celda 0
            idorigen = row.cells[0].childNodes[0].innerHTML;
            //recupera nombre del origen de la fila, en la celda 1    
            origen = row.cells[1].childNodes[0].innerHTML;
            //redirecciona hacia vuelos.jsp con los valores obtenidos
            //de idorigen y origen
            window.opener.location.href=
                    "vuelos.jsp"+"?idorigen="+idorigen+"&origen="+origen;
            //cierra la ventana
            window.close();
        }       
    </script> 
    </div>
    </body>
</html>
