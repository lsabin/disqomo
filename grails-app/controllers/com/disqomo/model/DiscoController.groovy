package com.disqomo.model


import groovyx.net.http.*
import static groovyx.net.http.ContentType.*
import static groovyx.net.http.Method.*



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DiscoController {

    static allowedMethods = [save: "POST", nuevo: "POST", update: "PUT", delete: "DELETE"]


    def nuevo() {
        def artista = params.artista
        def thumb = params.thumb
        def urlImagen = params.imagen
        def titulo = params.titulo

        println "parametros: ${params}............"

        Disco disco = new Disco(artista: artista,
            titulo: titulo,
            urlImagen: urlImagen,
            urlThumb: thumb,
            prettyUrl: 'una-url-reducida')

        //Obtiene bytes de la imagen
        byte[] bytes = obtieneBytesImagen(urlImagen)
        disco.imagen = bytes
        disco.imagenThumb = bytes
        println "guarda el disco ${disco.titulo}............"
        println "con una imagen de ${bytes.size()}............"

        //Transforma la imagen para tener una versión thumb

        disco.validate()
        if (disco.hasErrors()) {

            println "hay errores.............${disco.errors.allErrors.size()}"


            disco.errors.allErrors.each {
               println it
            }

            redirect(action:"index")  
        } else {
            disco.save(flush:true)
            redirect(action:"index")    
        }


   }


   byte[] obtieneBytesImagen(String urlImagen) {

        byte[] bytesImagen


        if (urlImagen) {

            def http = new HTTPBuilder( urlImagen )

            http.request(Method.GET, ContentType.BINARY) {req ->
                headers.'User-Agent' = 'Mozilla/5.0'
                headers.'Accept' = 'application/octet-stream'
                response.'200' = {resp, binary ->
                    log.info(resp.statusLine)
                    def data = binary.bytes //binary in this case is an instance of InputStream
                    //log.info ("datos: ${data?.size()}")
                    bytesImagen = data
                }
     
                response.failure = {resp ->
                    log.error("Unexpected error: ${resp.statusLine.statusCode} : ${resp.statusLine.reasonPhrase}")
                    log.error(uri.query)
                    log.error(uri.toString())
     
                }
            }  

        }

        return bytesImagen      

   }


    def discoImage() {
      def dsco = Disco.get(params.id)
      if (!dsco || !dsco.imagen) {
        response.sendError(404)
        return;
      }
      //response.setContentType(dsco.avatarType)
      response.setContentLength(dsco.imagen.size())
      OutputStream out = response.getOutputStream();
      out.write(dsco.imagen);
      out.close();
    }


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Disco.list(params), model:[discoInstanceCount: Disco.count()]
    }

    def show(Disco discoInstance) {
        respond discoInstance
    }

    def create() {
        respond new Disco(params)
    }

    @Transactional
    def save(Disco discoInstance) {
        if (discoInstance == null) {
            notFound()
            return
        }

        if (discoInstance.hasErrors()) {
            respond discoInstance.errors, view:'create'
            return
        }

        discoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'discoInstance.label', default: 'Disco'), discoInstance.id])
                redirect discoInstance
            }
            '*' { respond discoInstance, [status: CREATED] }
        }
    }

    def edit(Disco discoInstance) {
        respond discoInstance
    }

    @Transactional
    def update(Disco discoInstance) {
        if (discoInstance == null) {
            notFound()
            return
        }

        if (discoInstance.hasErrors()) {
            respond discoInstance.errors, view:'edit'
            return
        }

        discoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Disco.label', default: 'Disco'), discoInstance.id])
                redirect discoInstance
            }
            '*'{ respond discoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Disco discoInstance) {

        if (discoInstance == null) {
            notFound()
            return
        }

        discoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Disco.label', default: 'Disco'), discoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'discoInstance.label', default: 'Disco'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
