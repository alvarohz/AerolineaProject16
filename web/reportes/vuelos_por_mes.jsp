<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.aerolinea.procesos.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet" type="text/css" href="/AerolineaProject3/css/tabla.css" media="screen" />        
<script src="http://www.highcharts.com/lib/jquery-1.7.2.js" type="text/javascript"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/data.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>        
<script>
    $(function () {
    $('#container').highcharts({
        data: {
            table: document.getElementById('table01')
        },
        chart: {
            type: 'column'
        },
        title: {
            text: 'Ejemplo con AerolineaProject'
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: 'No. de  Vuelos'
            }
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }
    });
});
</script>
    </head>
    <body>
        <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
        <%
    Conexion conn = new ConexionPool();
    Operaciones.setConexion(conn);
    
    String sql = "SELECT monthname(fecha) as mes,"
+ " count(idvuelo) as vuelos,"
+ " (select count(*) from vuelos"
+ " where estado = 'DISPONIBLE' and"
+ " monthname(fecha) = monthname(v.fecha))"
+ " as disponibles"
+ " FROM vuelos v"
+ " group by monthname(fecha) order by fecha asc";
    
    //array que alamcena el resultado de la consulta SQL
    String[][] vuelos = Operaciones.consultar(sql);
  
    //declaracion de cabeceras a usar en la tabla HTML
    String[] cabeceras = new String[]{
      "Mes",
      "No. Vuelos",
      "Disponibles"
    };
        //variable de tipo Tabla para generar la Tabla HTML
    Tabla tab = new Tabla(vuelos, //array que contiene los datos
          "60%", //ancho de la tabla px | % 
          Tabla.STYLE.TABLE01, //estilo de la tabla
          Tabla.ALIGN.CENTER,  // alineacion de la tabla
          cabeceras); //array con las cabeceras de la tabla

    //imprime la tabla en pantalla
        String tabla01 = tab.getTabla();
        out.println(tabla01);
            
            %>
    </body>
</html>
