<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% HttpSession sesion = request.getSession(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aerolinea Project</title>
        <link rel="stylesheet" type="text/css" href="/AerolineaProject16/css/reset.css" />
        <link rel="stylesheet" type="text/css" href="/AerolineaProject16/css/main.css" media="screen" />        
        <link rel="stylesheet" type="text/css" href="/AerolineaProject16/css/tabla.css" />    
    </head>
    <body>
        <div id="header">
            <h1>Aerolínea DSi</h1><br/>
            <h2>A Example Project for Learning</h2>
            <img src="/AerolineaProject16/iconos/logo.png" />
        </div>
        <div id="sesion">            
            <h2>Usuario: <%= sesion.getAttribute("Nombre") %>
                <strong>[<%= sesion.getAttribute("Usuario") %>]</strong> | 
                <a href="/AerolineaProject16/logout.jsp">Cerrar Sesión</a>
            </h2>            
        </div>        
        <div id="menu">
            <ul>
                <li><a href="/AerolineaProject16/principal.jsp">Home</a></li>
                <li><a href="/AerolineaProject16/usuarios/usuarios_consulta.jsp">Usuarios</a></li>
                <li><a href="#">Aeropuertos</a></li>
                <li><a href="#">Aviones</a></li>
                <li><a href="#">Vuelos</a></li>
                <li><a href="/AerolineaProject16/paises/paises_consulta.jsp">Paises</a></li>
                <li><a href="#">Roles</a></li>
            </ul>
        </div>
        <div id="content">

