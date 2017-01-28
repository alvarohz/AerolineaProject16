<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.aerolinea.procesos.*"%>
<%@page import="com.aerolinea.entidades.*"%>
<%
    Conexion conn = new ConexionPool();
    Operaciones.setConexion(conn);
if (request.getParameter("sw_nuevo")!=null){
        //operacion insertar
        int sw_nuevo = Integer.parseInt(request.getParameter("sw_nuevo"));
        String idusuario = request.getParameter("txtIdusuario");
        String nombres = request.getParameter("txtNombres");
        String apellidos = request.getParameter("txtApellidos");
        String telefono = request.getParameter("txtTelefono");
        String email = request.getParameter("txtEmail");
        String clave = request.getParameter("txtClave");        
        String idrol = request.getParameter("cmbIdrol");
        String idpais = request.getParameter("cmbIdpais");
        
        Usuarios u = new Usuarios(idusuario, 
                nombres.toUpperCase(), 
                apellidos.toUpperCase(), 
                email, 
                telefono, 
                Usuarios.getHash(clave), 
                Integer.parseInt(idrol), 
                Integer.parseInt(idpais));
        
        if (sw_nuevo==1){
            int result = Operaciones.insertar(u);
            if (result>0)
                response.sendRedirect("usuarios_consulta.jsp?result="+Operaciones.OK_INSERTAR);
            else
                response.sendRedirect("usuarios_consulta.jsp?result="+Operaciones.ERROR_INSERTAR);
        }
}else{
        response.sendRedirect("usuarios_consulta.jsp");
}

%>

