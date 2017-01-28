<%@page import="java.util.HashMap"%>
<%@page import="com.aerolinea.procesos.*"%>
<%@page import="com.aerolinea.entidades.*"%>
<%
    //Creamos una variable para manejar la conexion al pool
    Conexion conn = new ConexionPool();
    //Enviamos la variable de conexion a la clase operaciones
    Operaciones.setConexion(conn);
    //variable HashMap para obtener el registro del pais 
    //en base a un ID cuando se requiera modificacion
    HashMap pais;   
    String id = null;
    //bandera para manejar el tipo de operacion 
    //insertar=1, actualizar=0
    int sw_nuevo;
    //se verifica si hay un ID de pais enviado
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        //obtenemos el registro del pais en base al ID
        pais = Operaciones.getRegistro(new Paises(), id);
        //indica modificacion
        sw_nuevo = 0;
    }else{
        //indica insercion
        sw_nuevo = 1;
        pais = null;
    }
    %>
<%@include file="../_top.jsp"%>
<h1>Paises</h1>
<br/>
<form name="form_paises" onsubmit="return validar();" action="paises_operaciones.jsp" method="POST">
    <input type="hidden" name="sw_nuevo" value="<%= sw_nuevo %>"/>
    <table border="0" id="table" style="width: 50%">
    <thead>
        <tr>
            <th colspan="">Complete la informaci�n<br><br></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>ID Pa�s</td>
            <td><input type="text" name="txtIdpais" value="<%= pais!=null?pais.get("idpais"):"" %>" readonly="readonly" /></td>
        </tr>
        <tr>
            <td>Nombre Pa�s</td>
<td><input type="text" name="txtPais" id="txtPais" value="<%= pais!=null?pais.get("pais"):"" %>" /></td>
        </tr>            
    </tbody>
    </table>
    <br/>    
<div class="buttons">
    <ul>
        <li><input type="submit" value="Guardar" name="guardar"/></li>
        <li><a href="paises_consulta.jsp">Regresar</a></li>
    </ul>
</div>                     
</form>
 <script>
    function validar(){
	var pais = document.getElementById('txtPais');		
	if (pais.value.length==0){
                pais.focus();			
                alert("Digite nombre del pa�s");
            return false;
	}			
	
	return true;
    }                
</script>
<%@include file="../_down.jsp"%>

