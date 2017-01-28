<%@page import="com.aerolinea.procesos.*" %>
<%@page import="com.aerolinea.entidades.*" %>
<%
    //se capturan las variables del origen para todos los vuelos
    //si ya ha sido seleccionado un origen
    String idorigen = request.getParameter("idorigen");
    String origen = request.getParameter("origen");
%>    
<%@include file="../_top.jsp"%>
<script>
function abrirVentana (URL){
    //funcion javascript para abrir un subventana para realizar
    //busquedas, se le pasa la pagina a mostrar como parametro
    window.open(URL,"ventana1","width=700,height=400,scrollbars=YES,statusbar=YES,top=150,left=300")
}
</script>
        <h1>Registro de Vuelos</h1><br><br>
        <form name="main" method="post" action="vuelos_operaciones.jsp">
            <input type="hidden" name="sw_nuevo" value="1"/>
            <br>
            Seleccione Aeropuerto Origen 
            <input type="text" name="txtIdorigen" value="<%=idorigen!=null?idorigen:"" %>" size="3" readonly="readonly">
            <input type="text" name="txtOrigen" value="<%=origen!=null?origen:"" %>" size="50" readonly="readonly">
            <input type="button" class="boton" value="..." onclick="abrirVentana('aeropuertos_origen.jsp');">                       
            <a href="/AerolineaProject16/reportes/reporte_vuelos.jsp" target="_blank">Ver Reporte</a>
            <br><br><br><br>
            <hr>
            <br>
            Fecha y Hora:            
            <input type="datetime-local" name="txtFecha" size="25">            
            Avion:  
            <input type="text" name="txtIdavion" id="txtIdavion" size="2" readonly="readonly">
            <input type="text" name="txtAvion" id="txtAvion" readonly="readonly">
            <input type="button" value="..." class="boton" onclick="abrirVentana('aviones_busqueda.jsp');">           
            

            Destino :
            <input type="text" name="txtIddestino" id="txtIddestino" size="2" readonly="readonly">
            <input type="text" name="txtDestino" id="txtDestino" readonly="readonly">
            <input type="button" value="..." class="boton" onclick="abrirVentana('aeropuertos_destino.jsp');">            
            <input type="submit" value="Agregar" class="boton">
        </form><br><br>
<div id="mensajes" 
     style="width: 95%;text-align: center; height: 14px">
<%
    //se captura el codigo del mensaje
    String result = request.getParameter("result");
    if (result!=null){
        int r = Integer.parseInt(result);
        //obtiene uno de los mensajes definidos en operaciones
        //y lo muestra
        out.println(Operaciones.getMensaje(r));
    }    
%>
</div>        
<%
    Conexion conn = new ConexionPool();
    Operaciones.setConexion(conn);
    
    //consulta SQL que muestra los vuelos para el destino seleccionado
    String sql = "select idvuelo, v.fecha, o.aeropuerto, d.aeropuerto, "
            + "a.descripcion,a.capacidad, v.estado "
            + " from vuelos v, aeropuertos o, aeropuertos d, aviones a"
            + " where v.idorigen = o.idaeropuerto and"
            + " v.iddestino = d.idaeropuerto and a.idavion = v.idavion and"
            + " v.idorigen = " + idorigen;
    
    //array que alamcena el resultado de la consulta SQL    
    String[][] vuelos =
    Operaciones.consultar(sql);
  
    //cabeceras a mostrar en la tabla
    String[] cabeceras = new String[]{
      "Idvuelo",
      "Fecha y Hora",
      "Origen",
      "Destino",
      "Avion",
      "Capacidad",
      "Estado"
    };
    
    //variable de tipo Tabla para generar la Tabla HTML
    Tabla tab = new Tabla(vuelos, //array que contiene los datos
          "100%", //ancho de la tabla px | % 
          Tabla.STYLE.TABLE01, //estilo de la tabla
          Tabla.ALIGN.LEFT,  // alineacion de la tabla
          cabeceras); //array con las cabeceras de la tabla
  
    //boton eliminar
    tab.setEliminable(true);
    //sin boton modificar
    tab.setModificable(false);
    //pagina para eliminar
    tab.setPaginaEliminable("vuelos_operaciones.jsp");
    //icono eliminar
    tab.setIconoEliminable("../iconos/delete.png");        
    //columnas seleccionables
    tab.setColumnasSeleccionables(new int[]{0});
    //pie de tabla
    tab.setPie("Resultado Vuelos");
    
    //imprime la tabla en pantalla
        String tabla01 = tab.getTabla();
        out.println(tabla01);
    %>
<%@include file="../_down.jsp"%>

