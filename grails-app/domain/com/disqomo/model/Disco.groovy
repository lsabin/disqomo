package com.disqomo.model

class Disco {
    String titulo
    String artista
    String urlImagen
    String urlThumb
    byte[] imagen
    byte[] imagenThumb
    //recomendaciones: recomendaciones, 
    String prettyUrl
    Date dateCreated

    static constraints = {
        imagen(nullable:true, maxSize: 1024*1024)
        imagenThumb(nullable:true, maxSize: 1024*1024)
    }
}
