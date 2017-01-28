<%@page import="java.util.HashMap"%>
<%@page import="com.aerolinea.procesos.*"%>
<%@page import="com.aerolinea.entidades.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Ejemplo uso de capa de negocios<br>
        <% 
            
            ConexionPool conn = new ConexionPool();
            try{
       
                conn.conectar();

                if (conn.getConexion()!=null)
                    out.print("conexion ok<Br>");
                else
                    out.print("not ok<br>");
                
                Operaciones.setConexion(conn);
                
                //INSERCION
//                Paises p = new Paises();
//                p.setPais("ISRAEL");
//                
//                if (Operaciones.insertar(p)>0)
//                    out.print("insercion ok");
//                else
//                    out.print("fallo la insercion");
        
                //MODIFICACION
//                Paises pp = new Paises("FRANCIA");
//                if (Operaciones.actualizar(pp,"14")>0)
//                    out.print("actualizacion ok");
//                else
//                    out.print("fallo la insercion");

                //ELIMINACION
//                if (Operaciones.eliminar(new Paises(),"15")>0)
//                    out.print("eliminar ok");
//                else
//                    out.print("fallo la insercion");

                //CONSULTA
                HashMap<String, String> mp = new HashMap();
                mp = Operaciones.getRegistro(new Paises(), "14");
                
                out.print("<br>id: "+mp.get("idpais"));
                out.print("<br>pais: "+mp.get("pais"));
        
                conn.desconectar();
            }catch(Exception e){
                conn.desconectar();
            }
        %>
    </body>
</html>
