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
        <title>Aviones</title>
    </head>
    <body>
        <div id="contenido" style="padding: 10px">
        <h1>Listado de Aviones</h1>
<%
    Conexion conn = new ConexionPool();
    Operaciones.setConexion(conn);
    String sql = "select idavion, descripcion, capacidad "            
            + " from aviones";
    
    String[][] aviones =
    Operaciones.consultar(sql);
  
    String[] cabeceras = new String[]{
      "Idavion",
      "Avion",
      "Capacidad"
    };
    Tabla tab = new Tabla(aviones, //array que contiene los datos
          "95%", //ancho de la tabla px | % 
          Tabla.STYLE.TABLE01, //estilo de la tabla
          Tabla.ALIGN.LEFT,  // alineacion de la tabla
          cabeceras); //array con las cabeceras de la tabla
   
    tab.setFilaSeleccionable(true);
    tab.setMetodoFilaSeleccionable("_Seleccionar_");
    tab.setPaginaSeleccionable("");
    tab.setColumnasSeleccionables(new int[]{0,1,2,3});
    tab.setPie("Resultado Aeropuertos");
        String tabla01 = tab.getTabla();
        out.println(tabla01);
    %>
    
    <script>
        //funcion javascript que se ejecuta al hacer click en una fila
        //recibe un elemento de tipo fila como parametro: row
        function _Seleccionar_(row){               
            //recupera el idavion de la fila, en la celda 0
            idavion = row.cells[0].childNodes[0].innerHTML;
            //recupera descripcion del avion de la fila, en la celda 1
            avion = row.cells[1].childNodes[0].innerHTML; 
            //asigna a las cajas de texto de la ventana padre los valores
            //obtenidos
            window.opener.document.getElementById("txtIdavion").value=idavion;
            window.opener.document.getElementById("txtAvion").value=avion;
            //cierra la ventana
            window.close();
        }       
    </script> 
    </div>
    </body>
</html>
