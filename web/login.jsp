<%@page import="com.aerolinea.entidades.Entidad"%>
<%@page import="com.aerolinea.entidades.Usuarios"%>
<%@page import="com.aerolinea.procesos.Operaciones"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.aerolinea.procesos.ConexionPool"%>
<%@page import="com.aerolinea.procesos.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
   String usuario = request.getParameter("txtUsuario");
   String clave = request.getParameter("txtClave");   
   if (usuario==null)
       usuario = "";
   if (clave==null)
       clave = "";
   Conexion conn = new ConexionPool();
   Operaciones.setConexion(conn);
   if (conn == null){
       response.sendRedirect("index.jsp?error=1");
   }
   else
   {
       HttpSession sesion = request.getSession();       
       HashMap<String, String> hpUsuario = new HashMap();
       hpUsuario = Operaciones.getRegistro(new Usuarios(), usuario);
       if (hpUsuario.get("idusuario")!=null){
           //out.println(hpUsuario.get("clave"));
           //out.println(Entidad.getHash(clave));
           if (hpUsuario.get("clave").equals(Entidad.getHash(clave))){
            sesion.setAttribute("Usuario",hpUsuario.get("idusuario"));
            sesion.setAttribute("Nombre",hpUsuario.get("nombres")+" "+
                    hpUsuario.get("apellidos"));
            sesion.setAttribute("Rol",hpUsuario.get("idrol"));
            response.sendRedirect("principal.jsp");
           }else{
               response.sendRedirect("index.jsp?error=0");
           }
       }
       else
       {
           response.sendRedirect("index.jsp?error=0");
       }
   }
%>

