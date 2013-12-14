<html ng-app="discos">
<head>
    <title>disqomo - buscador</title>
    <meta name="layout" content="main" />
</head>
<body>


<div class="buscador"  ng-controller="MainCtrl" style="min-height: 600px; background: #535a6c;
    color: #a1a9bb;">
<section class="discos-portada buscador">
<div class="container">


    <div class="row">
    <div class="col-xs-12 col-md-12">
        <h1 class="cabecera super-cabecera">Busca el disco</h1>
        <h2 class="sub-cabecera">que quieres recomendar</h2>

    </div> <!-- fin columna de formulario de busqueda -->
    </div> <!-- fin row -->


    <div class="row">
    <div class="col-xs-10 col-md-10">

            <input type="text" class="buscador" placeholder="Título" name="titulo" 
                ng-model="titulo" />
    </div>

    <div class="col-xs-2 col-md-2">

            <button type="button" class="btn btn-primary btn-lg btn-block boton-busqueda" ng-click="buscaDiscos()">
                <span class="glyphicon glyphicon-search"></span>
            </button>
    </div>


        
    </div> <!-- fin row -->

</div> <!--fin container -->
</section>


<section class="extra-portada seccion-resultados-discos" style="min-height:600px;">

<div class="cabecera-resultados">
<div class="container">
    <div class="row">
        <div class="col-xs-10 col-md-10 " >
            Resultados
        </div>

        <div class="col-xs-2 col-md-2" >
            <button type="button" id="boton-mas" class="btn btn-primary btn-lg btn-block boton-mas">
                Buscar de nuevo    
            </button>
        </div>
    </div>
</div>
</div>

<div class="row">

    <div class="col-xs-12 col-md-12" id="spinner" style="height:600px" >
    </div>
</div>

<div class="container">

<div class="row">


   <div class="col-xs-7 col-md-7" id="resultados" >

        <div class="row disco-lista" ng-repeat="disco in discosEncontrados">
            <div class="col-xs-2 col-md-2 " >
                <img src="{{disco.imagen}}" class="img-thumbnail imaxe-disco" />
            </div>        
            <div class="col-xs-8 col-md-8" >
                <p>Artista: {{disco.thumb}}</p>
                <p>Título: {{disco.resource_url}}</p>
                <p>Año: {{disco.anho}}</p>
                
            </div>  

            <div class="col-xs-2 col-md-2" >
                <button type="button" class="btn btn-primary boton-seleccion" ng-click="selecciona(disco)">Seleccionar </button>
            </div>  


        </div>
        
   </div> <!-- fin columna de resultados -->

   <!-- columna de disco seleccionado -->

    <div class="col-xs-12 col-xs-offset-1 col-md-4 col-md-offset-1 imagen-detalle">
        <img src="{{discoSeleccionado.imagen}}" class="img-thumbnail img-detail" />
        <div>{{discoSeleccionado.titulo}}</div>
        <div>{{discoSeleccionado.artista}}</div>


            <g:form url="[action:'nuevo', controller:'disco']" method="POST" class="form-horizontal">

                <g:textField  name="artista" id="artista" ng-model="discoSeleccionado.artista" style="display:none;" />
                <g:textField name="titulo" id="titulo" ng-model="discoSeleccionado.titulo" style="display:none;" />

                <g:textField name="thumb" id="thumb" ng-model="discoSeleccionado.thumb" style="display:none;" />
                <g:textField name="imagen" id="imagen" ng-model="discoSeleccionado.imagen" style="display:none;" />

                <input type="submit" value="Submit" class="btn btn-primary btn-block">
         
            </g:form>


    </div>

</div> <!-- fin row resultados -->
</div> <!-- fin container -->
</section>

</div> <!-- fin buscador -->


</body>
</html>