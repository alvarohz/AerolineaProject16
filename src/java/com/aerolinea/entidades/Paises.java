package com.aerolinea.entidades;

public class Paises extends Entidad {
    
    private Integer idpais;
    private String pais;

    public Paises() {
        init();
    }

    public Paises(Integer idpais) {
        init();
        this.idpais = idpais;
    }
    public Paises(String pais) {
        init();
        this.pais = pais;
    }
    
    public Paises(Integer idpais, String pais) {
        init();
        this.idpais = idpais;
        this.pais = pais;
    }

    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "idpais";
    }

    public Integer getIdpais() {
        return idpais;
    }

    public void setIdpais(Integer idpais) {
        this.idpais = idpais;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
    
    
}

