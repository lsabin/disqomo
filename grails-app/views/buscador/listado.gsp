<html ng-app="discos">
<head>
    <title>disqomo - buscador</title>
    <meta name="layout" content="main" />
</head>
<body>


      <section class="discos-portada">
        <div class="container">
        <div class="row">
        <p></p>

        <div class="col-xs-12 col-md-5 callout">
          <p>Descubre nuevos discos para disfrutar recomendados por aficionados como tú y haz tus propias recomendaciones para que el mundo escuche ese disco tan especial.
          </p>

          <p>
            <a href="#" class="btn btn-primary btn-lg btn-block">REGISTRATE PARA PARTICPAR</a>
          </p>


          
        </div>

        <div class="col-xs-6 col-md-6 col-md-offset-1 tabla-discos">
          <div class="cabecera-ultimos-discos">Los últimos recomendados</div>
          

               <g:each in="${listaDiscos}" var="disco" status="i">
                <g:if test="${i % 3 == 0}">
                    <g:if test="${i > 0}"></div></g:if>
                    <div class='row fila-discos'>
                </g:if>

                        <div class="col-xs-6 col-md-4">
                          <div class="caja-disco">
                            <img class="disco-img img-thumbnail"   
                                src="${createLink(controller:'disco', action:'discoImage', id:disco.ident())}" />   
                            <div class="nombre-disco">
                                ${disco.titulo} <br/> ${disco.artista}
                            </div>
                          </div>

                        <!--
                          <div class="contenthover">
                                <h3>${disco.titulo}</h3>
                                <p>${disco.artista} </p>
                          </div>                      
                         --> 
                        
                        </div>   

               </g:each> 



        </div>




      </div>
      </div>



      </section>



</body>
</html>