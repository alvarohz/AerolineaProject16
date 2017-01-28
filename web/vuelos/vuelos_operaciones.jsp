<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.aerolinea.procesos.*"%>
<%@page import="com.aerolinea.entidades.*"%>
<%
    Conexion conn = new ConexionPool();
    Operaciones.setConexion(conn);

    //variable para manejar el ID en una eliminacion
    String id = null;    
    
    //operacion eliminar
    if (request.getParameter("id")!=null){
        id = request.getParameter("id");
        //recuperar el origen seleccionado para enviarlo
        //nuevamente
        HashMap hpVuelo = Operaciones.getRegistro(new Vuelos(), id);
        String idorigen = hpVuelo.get("idorigen").toString();
        HashMap hpOrigen = Operaciones.getRegistro(new Aeropuertos(), idorigen);
        String origen = hpOrigen.get("aeropuerto").toString();
        //---------------------------------------------------------
        
        int result = Operaciones.eliminar(new Vuelos(), id);
        if (result>0)
            //redirecciona y envia el codigo del mensaje ademas
            //envia el origen seleccionado
            response.sendRedirect("vuelos.jsp?result="+Operaciones.OK_ELIMINAR
                    +"&idorigen="+idorigen+"&origen="+origen);
        else
            response.sendRedirect("vuelos.jsp?result="+Operaciones.ERROR_ELIMINAR
                    +"&idorigen="+idorigen+"&origen="+origen);
    
    // verifica si es registro nuevo
    }else if (request.getParameter("sw_nuevo")!=null){
        //operacion insertar
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        String idorigen = request.getParameter("txtIdorigen");
        String origen = request.getParameter("txtOrigen");
        String iddestino = request.getParameter("txtIddestino");
        String fecha = request.getParameter("txtFecha");
        String estado = "DISPONIBLE"; //el estado del vuelo para hacer reservaciones
        String idavion = request.getParameter("txtIdavion");
        
        Vuelos v = new Vuelos(fecha, 
                estado, 
                Integer.parseInt(idorigen), 
                Integer.parseInt(idavion), 
                Integer.parseInt(iddestino));
        
        if (sw_nuevo==1){
            int result = Operaciones.insertar(v);
            if (result>0)
            //redirecciona y envia el codigo del mensaje ademas
            //envia el origen seleccionado                
                response.sendRedirect("vuelos.jsp?result="+Operaciones.OK_INSERTAR
                        +"&idorigen="+idorigen+"&origen="+origen);
            else
                response.sendRedirect("vuelos.jsp?result="+Operaciones.ERROR_INSERTAR
                        +"&idorigen="+idorigen+"&origen="+origen);
        }else{
            response.sendRedirect("vuelos.jsp");
        }
    }else{
        response.sendRedirect("vuelos.jsp");
    }
%>
