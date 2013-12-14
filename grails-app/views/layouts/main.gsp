<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en" class="no-js" ng-app="discos">
<!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="disqomo"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'disqomo.css')}" type="text/css">
	    <link href='http://fonts.googleapis.com/css?family=Kreon:300,400,700|Kameron:400,700|Lato:400,300,700,900|Nunito:400,700,300' rel='stylesheet' type='text/css'>

		<g:layoutHead/>
		<g:javascript library="application"/>		

		<r:require module="jquery"/>

		<r:layoutResources />
	</head>
	<body>

    <header>
    <div class="navbar navbar-default navbar-discos navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">disqomo</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="#about"><div>Lista</div><div class="abajo">de discos</div></a></li>

          </ul>
          <ul class="nav navbar-nav navbar-right">
			  <li><a href="/busca">NUEVO DISCO</a></li> 
			  <li><a href="#">Perfil deu suarioSesion</a></li>
			  <li><a href="/login">LOGIN</a></li>
            	<li><a href="/registro">REGISTRO</a></li>
          </ul>

        </div><!--/.nav-collapse -->
      </div>
    </div>
  </header>


		<g:layoutBody/>








		<r:layoutResources />



    <footer>
      ESTE ES EL FOOTER
    </footer>


    <!-- Placed at the end of the document so the pages load faster -->
    <!-- <script src="assets/js/jquery.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    -->

    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.contenthover.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'angular.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'spin.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.spin.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-scrollto.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'app4.js')}"></script>



    <script type="text/javascript">

    jQuery(function() {

        jQuery('#resultados').hide();
        jQuery('.seccion-resultados-discos').hide();
        jQuery('.contenthover').css('display','none');

        //Funcion para buscar de nuevo
        jQuery('#boton-mas').click(function() {

          jQuery(".imagen-detalle").hide();


          jQuery('.discos-portada').slideDown({duration:500, easing: 'swing'});

          jQuery('.seccion-resultados-discos').slideUp({duration:500, easing: 'swing'});
          //jQuery(".cabecera-resultados").slideUp({duration:500, easing: 'swing'});
          //jQuery("#resultados").slideUp('slow');

          jQuery('#boton-mas').hide();
        });






    });

    </script>




	</body>
</html>
