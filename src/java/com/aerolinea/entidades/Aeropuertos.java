package com.aerolinea.entidades;

public class Aeropuertos extends Entidad {    
    private Integer idaeropuerto;    
    private String aeropuerto;    
    private String ciudad;    
    private Integer idpais;

    public Aeropuertos() {
        init();
    }        

    public Aeropuertos(int idaeropuerto) {
        init();
        this.idaeropuerto = idaeropuerto;        
    }

    public Aeropuertos(String aeropuerto, String ciudad, Integer idpais) {
        init();
        this.aeropuerto = aeropuerto;
        this.ciudad = ciudad; 
        this.idpais = idpais;
    }
    
    public Aeropuertos(int idaeropuerto, String aeropuerto, String ciudad, Integer idpais) {
        init();
        this.idaeropuerto = idaeropuerto;
        this.aeropuerto = aeropuerto;
        this.ciudad = ciudad;  
        this.idpais = idpais;
    }
    
    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "idaeropuerto";
    }

    public int getIdaeropuerto() {
        return idaeropuerto;
    }

    public void setIdaeropuerto(int idaeropuerto) {
        this.idaeropuerto = idaeropuerto;
    }

    public String getAeropuerto() {
        return aeropuerto;
    }

    public void setAeropuerto(String aeropuerto) {
        this.aeropuerto = aeropuerto;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }   

    public Integer getIdpais() {
        return idpais;
    }

    public void setIdpais(Integer idpais) {
        this.idpais = idpais;
    }
    
}
