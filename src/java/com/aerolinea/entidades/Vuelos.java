package com.aerolinea.entidades;

public class Vuelos extends Entidad {    
    private Integer idvuelo;
    private String fecha;
    private String estado;
    private Integer idorigen;
    private Integer idavion;
    private Integer iddestino;

    public Vuelos() {
        init();
    }

    public Vuelos(Integer idvuelo) {
        init();
        this.idvuelo = idvuelo;
    }
    
    public Vuelos(String fecha, String estado,
            Integer idorigen, Integer idavion, Integer iddestino) {
        init();
        this.fecha = fecha;
        this.estado = estado;
        this.idorigen = idorigen;
        this.idavion = idavion;
        this.iddestino = iddestino;
    }
    
    public Vuelos(Integer idvuelo, String fecha, String estado,
            Integer idorigen, Integer idavion, Integer iddestino) {
        init();
        this.idvuelo = idvuelo;
        this.fecha = fecha;
        this.estado = estado;
        this.idorigen = idorigen;
        this.idavion = idavion;
        this.iddestino = iddestino;
    }

    private void init(){
        AUTO_INCREMENT = true;
        PRIMARY_KEY = "idvuelo";
    }
    
    public Integer getIdvuelo() {
        return idvuelo;
    }

    public void setIdvuelo(Integer idvuelo) {
        this.idvuelo = idvuelo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }


    public Integer getIdorigen() {
        return idorigen;
    }

    public void setIdorigen(Integer idorigen) {
        this.idorigen = idorigen;
    }

    public Integer getIdavion() {
        return idavion;
    }

    public void setIdavion(Integer idavion) {
        this.idavion = idavion;
    }

    public Integer getIddestino() {
        return iddestino;
    }

    public void setIddestino(Integer iddestino) {
        this.iddestino = iddestino;
    }
    
}
