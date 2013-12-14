

var myModule = angular.module('discos', []);

myModule.controller('MainCtrl', function($scope, serverHelper) {
    //$scope.currentStory;
    $scope.artista = "";
    $scope.titulo = "";
    $scope.count = 0;
    $scope.discosEncontrados = [];
    $scope.discoSeleccionado;

    jQuery(".imagen-detalle").hide();
   



    $scope.buscaDiscos = function() {


        jQuery(".imagen-detalle").hide();

        $('.discos-portada').slideUp({duration:500, easing: 'swing'});

        //jQuery("#resultados").hide();

        $('.seccion-resultados-discos').slideDown({duration:500, easing: 'swing'});
        
        $(".cabecera-resultados").slideUp({duration:500, easing: 'swing'});
        $("#resultados").slideUp('slow');
        $('#boton-mas').hide();


        jQuery("#spinner").show();
        jQuery("#spinner").spin({radius: 60, length: 40, width:20});


        
 

 
        var handleSuccess = function(data, status) {
            var resultado = data;
            var discos = resultado;

            $scope.discosEncontrados = [];

            if (discos) {

                

                for (var i=0;i<discos.length; i++) {
                    //var artistaTitulo = discos[i].title.split(" - ");

                    $scope.discosEncontrados.push({
                        artista: discos[i].artista, 
                        titulo: discos[i].titulo, 
                        anho: "xxxx",
                        thumb: discos[i].thumb, 
                        imagen: discos[i].imagen});
                }


                //jQuery("#resultados").show();
                jQuery("#spinner").spin(false);
                jQuery("#spinner").hide();



                //$('.seccion-resultados-discos').show();
                //$('.seccion-resultados-discos').slideDown('slow');
                $('#boton-mas').show();
                jQuery('.cabecera-resultados').fadeIn(1000);
                jQuery('#resultados').fadeIn(1000);
                


                //$(".cabecera-resultados").ScrollTo({duration:1000, easing:'swing'});

                $(".imaxe-disco").on('load', function() {
                    $(this).fadeIn(3000);  
                    console.log("imaxe: " + $(this)); 
                }).each(function() {
                  if(this.complete) {
                    $(this).load();
                  } 
                });  

            }



        };

        serverHelper.buscaDiscosGS($scope.artista, $scope.titulo).success(handleSuccess);

    }; // fin buscaDiscos


    $scope.selecciona = function(disco) {


        var body = $("body, html");
        var top = body.scrollTop() // Get position of the body
        if (top != 0) {
            body.animate({scrollTop :0}, '500','swing', function(){
                
            });
        }
        
        //jQuery(".imagen-detalle").fadeOut();
        jQuery(".imagen-detalle").hide();
        
        

        
        //jQuery("#error-carga").hide();

        $scope.discoSeleccionado = disco;

        //jQuery(".img-detail").load(function() {
            jQuery(".imagen-detalle").fadeIn();    
        //});



        
        //Buscar detalles del disco
    };


} );


myModule.factory('serverHelper', function($http) {
    var buscaDiscosGS = function(artista, titulo) {


        return $http({method: 'GET', 
                url: '/disqomo/buscador/buscaDisco',
                params: {titulo: titulo, artista: artista}});

    };

    var detalleDisco = function(uri) {


        return $http( {method: 'GET', url: uri} );

    };


    return { buscaDiscosGS: buscaDiscosGS, detalleDisco: detalleDisco };

});



