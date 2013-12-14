package com.disqomo

import com.disqomo.model.Disco

import groovyx.net.http.*
import static groovyx.net.http.ContentType.*
import static groovyx.net.http.Method.*

class BuscadorController {

    def index() { }

    def listado() {

        def listaDiscos = Disco.list(max:9)

        respond listaDiscos, model:[discoInstanceCount: Disco.count()]


    }


    def buscaDisco() {


        def discos = []

        def titulo = params.titulo



        def resultados = []
        def http = new HTTPBuilder( 'http://api.discogs.com/database/search' )

        http.request( GET, JSON ) {
          //uri.path = '/search'
          uri.query = [ q: "${titulo}", type: "release", per_page: "5"]

          headers.'User-Agent' = 'disqomoClient/1.0 +http:/disqomo.appspot.com'

          // response handler for a success response code:
          response.success = { resp, json ->
    
                println "estado respuesta: ${resp.status}"

                println "json : ${json.results}"

                if (json.results) {
                    resultados = json.results
                }

                json.results.each {
                  println "  ${it}"
                }


          }

          // handler for any failure status code:
          response.failure = { resp ->
            println "Unexpected error: ${resp.statusLine.statusCode} : ${resp.statusLine.reasonPhrase}"
          }
        }


        if (resultados) {
            resultados.each{resultado->
                def disco = obtieneDetallesDisco(resultado.resource_url)

                if (disco) { 
                    discos << disco 
                }
                
            }
        }



        render(contentType: "application/json") {
            discos
        }



    }


    def obtieneDetallesDisco(String url) {

        def disco = [:]


        def http = new HTTPBuilder( url )

        http.request( GET, JSON ) {
          headers.'User-Agent' = 'disqomoClient/1.0 +http:/disqomo.appspot.com'

          // response handler for a success response code:
          response.success = { resp, json ->
    
                println resp.statusLine

                println "json : ${json}"

                if (json) {
            
                    String urlImagen = obtieneImagenPrincipal(json.images)

                    if (urlImagen) {
                        disco.imagen = urlImagen
                        disco.titulo = json.title
                        disco.thumb = json.thumb
                        disco.artista = "artista x"  
                    } 
                }

          }

          // handler for any failure status code:
          response.failure = { resp ->
            println "Unexpected error: ${resp.statusLine.statusCode} : ${resp.statusLine.reasonPhrase}"
          }

        } 


        return disco       

    }



    def obtieneImagenPrincipal(def imagenes) {
        String urlImagen = ""

        imagenes.each {
            def tipo = it.type
            if (tipo == 'primary') {
                def urlImg = it.resource_url

                if (urlImg) {
                    urlImagen = obtieneImagen(urlImg)
                }
            }

        }

        return urlImagen

    }    


    def obtieneImagen(String url) {

        String urlImagen = ""

        def http = new HTTPBuilder( url )


        /*http.request( GET, TEXT ) { req ->
              headers.'User-Agent' = "Mozilla/5.0 Firefox/3.0.4"
             
              response.success = { resp, reader ->
                    urlImagen = url
              }
        }*/
   
    /*
        http.get(contentType: ContentType.BINARY) { resp, reader ->             
            if (resp.status == 200) urlImagen = url
        }  

        */


        http.request(Method.GET, ContentType.BINARY) {req ->
            headers.'User-Agent' = 'Mozilla/5.0'
            headers.'Accept' = 'application/octet-stream'
            response.'200' = {resp, binary ->
                log.info(resp.statusLine)
                def data = binary.bytes //binary in this case is an instance of InputStream
                log.info ("datos: ${data?.size()}")
                urlImagen = url
            }
 
            response.failure = {resp ->
                log.error("Unexpected error: ${resp.statusLine.statusCode} : ${resp.statusLine.reasonPhrase}")
                log.error(uri.query)
                log.error(uri.toString())
 
                //throw new Exception("There was an error retrieving the file")
            }
        }        

        return urlImagen

    }
}
