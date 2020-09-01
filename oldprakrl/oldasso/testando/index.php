<?php
session_start();
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>

    <title>SGate; Home</title>

    <meta charset="UTF-8">
    <meta name="author" content="Laks Castro">
    <meta name="description" content="Página inicial do site SGate;">
    <meta name="keywords" content="sgate, ;, web, desenvolvimento, artigos, css, html, javascript, jquery, programacao">
    <meta name="robots" content="index,follow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- jquery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- script local -->
    <script type="text/javascript" src="script/script-index.js"></script>

    <!--Font Awesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Alegreya+SC&display=swap" rel="stylesheet">


    <!-- slick -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.css">

    <!-- stylesheet local -->
    <link rel="stylesheet" href="stylesheet/css/stylesheet-index.css">

</head>
<body id="body">



<header id="header-container-top" class="header-container-top header">
    <div class="foto-autor">
        <img src="img/foto-autor.png" alt="Foto do Autor">
    </div>
    <div class="autor">
        <p>Laks Castro</p>
        <p>Desenvolvedor Front-End</p>
    </div>
</header>

<header id="header-container-bottom" class="header-container-bottom header">
    <button id="menu-icon" class="fas fa-bars header-bars"></button>
    <button id="social-icon" class="fas fa-share-alt header-bars"></button>

    <label class="display-none" for="search">Pesquisar</label>
    <form action="" method="get" class="search-form" target="_blank" >
        <div class="input-container">
            <input id="search" class="input-search" type="search" value="" name="pesquisa" required placeholder="Pesquisar" title="Pesquisar">
            <button class="fas fa-search submit-icon" type="submit"></button>
        </div>
    </form>
</header>

<a href="#body" id="to-top" class="fas fa-angle-up"></a>

<div class="menu-container" id="menu-container">
    <div class="menu-content" id="menu-content">
        <a class="far fa-times-circle" id="close-menu" href="#"></a>

        <div class="menu-content-block-container">

            <div class="menu-content-block-content">
                <p>Aqui vem o título 1</p>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
            </div>
            <div class="menu-content-block-content">
                <p>Aqui vem o título 1</p>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
            </div>
            <div class="menu-content-block-content">
                <p>Aqui vem o título 1</p>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
            </div>
            <div class="menu-content-block-content">
                <p>Aqui vem o título 1</p>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
            </div>
            <div class="menu-content-block-content">
                <p>Aqui vem o título 1</p>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
            </div>
            <div class="menu-content-block-content">
                <p>Aqui vem o título 1</p>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
            </div>
            <div class="menu-content-block-content">
                <p>Aqui vem o título 1</p>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
            </div>
            <div class="menu-content-block-content">
                <p>Aqui vem o título 1</p>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
                <a href="#">Link número 1</a>
            </div>

        </div>
    </div>
</div>

<div class="menu-social" id="menu-social">

    <div id="container-social">
        <a href="#" class="fab fa-pinterest-p"></a>
        <a href="#" class="fab fa-google"></a>
        <a href="#" class="fab fa-twitter"></a>
        <a href="#" class="fab fa-youtube"></a>
    </div>

</div>

<div class="container">

    <div class="hero-container">
        <div class="carousel-container-hero">
            <a href="#" class="carousel-content">
                <div class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-unlock icon-free"></i>
                        <img class="carousel-img" src="img/html5-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text">
                        <p class="text-nowrap">Aprenda jQuery</p>
                        <h1 class="text-nowrap">NODE.JS</h1>
                        <h2>Curso de jQuery completo para inciantes</h2>
                    </div>
                </div>
            </a>

            <div class="carousel-content">
                <a href="#" class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-unlock icon-free"></i>
                        <img class="carousel-img" src="img/css3-logo.svg" alt="Imagem 1">
                    </div>
                    <div class="carousel-text">
                        <p class="text-nowrap">Aprenda jQuery</p>
                        <h1 class="text-nowrap">NODE.JS</h1>
                        <h2>Curso de jQuery completo para inciantes</h2>
                    </div>

                </a>
            </div>

            <div class="carousel-content">
                <a href="#" class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-unlock icon-free"></i>
                        <img class="carousel-img" src="img/electron-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text">
                        <p class="text-nowrap">Aprenda jQuery</p>
                        <h1 class="text-nowrap">NODE.JS</h1>
                        <h2>Curso de jQuery completo para inciantes</h2>
                    </div>
                </a>
            </div>

            <div class="carousel-content">
                <a href="#" class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-unlock icon-free"></i>
                        <img class="carousel-img" src="img/react-logo.svg" alt="Imagem 1">
                    </div>
                    <div class="carousel-text">
                        <p class="text-nowrap">Aprenda jQuery</p>
                        <h1 class="text-nowrap">NODE.JS</h1>
                        <h2>Curso de jQuery completo para inciantes</h2>
                    </div>
                </a>
            </div>

            <div class="carousel-content">
                <a href="#" class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-unlock icon-free"></i>
                        <img class="carousel-img" src="img/jquery.jpg" alt="Imagem 1">
                    </div>
                    <div class="carousel-text">
                        <p class="text-nowrap">Aprenda jQuery</p>
                        <h1 class="text-nowrap">NODE.JS</h1>
                        <h2>Curso de jQuery completo para inciantes</h2>
                    </div>
                </a>
            </div>

            <div class="carousel-content">
                <a href="#" class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-unlock icon-free"></i>
                        <img class="carousel-img" src="img/nodejs-logo.jpg" alt="Imagem 1">
                    </div>
                    <div class="carousel-text">
                        <p class="text-nowrap">Aprenda jQuery</p>
                        <h1 class="text-nowrap">NODE.JS</h1>
                        <h2>Curso de jQuery completo para inciantes</h2>
                    </div>
                </a>
            </div>
        </div>
    </div>



    <div class="artigos-container">

        <div class="trending-container">
            <h1 class="division-title">TRENDING</h1>

            <div class="trending-content-container">
                <div class="bloco-medio"></div>
                <div id="pequeno-1" class="bloco-pequeno"></div>
                <div id="pequeno-2" class="bloco-pequeno"></div>
                <div class="bloco-grande"></div>
            </div>

        </div>


        <div class="artigos-content-container">
            <h1 class="division-title">HTML 5 e CSS3</h1>
            <a href="#" class="carousel-content artigos-content">
                <div class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-clock icon-time icon-artigo"> 11min</i>
                        <i class="fab fa-js-square icon-tecnologia icon-artigo"></i>
                        <p class="icon-nivel icon-artigo">Iniciante</p>
                        <i class="fas fa-unlock icon-pag icon-artigo"></i>
                        <img class="carousel-img" src="img/html5-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text text-artigos">
                        <p>Contruindo um carousel com Slick</p>
                        <h1>Slick: aprenda a usar este framework tão poderoso</h1>
                        <h2>Customizável do início ao fim</h2>
                    </div>
                </div>
            </a>
            <a href="#" class="carousel-content artigos-content">
                <div class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-clock icon-time icon-artigo"> 11min</i>
                        <i class="fab fa-js-square icon-tecnologia icon-artigo"></i>
                        <p class="icon-nivel icon-artigo">Iniciante</p>
                        <i class="fas fa-unlock icon-pag icon-artigo"></i>
                        <img class="carousel-img" src="img/html5-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text text-artigos">
                        <p>Contruindo um carousel com Slick</p>
                        <h1>Slick: aprenda a usar este framework tão poderoso</h1>
                        <h2>Customizável do início ao fim</h2>
                    </div>
                </div>
            </a>
            <a href="#" class="carousel-content artigos-content">
                <div class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-clock icon-time icon-artigo"> 11min</i>
                        <i class="fab fa-js-square icon-tecnologia icon-artigo"></i>
                        <p class="icon-nivel icon-artigo">Iniciante</p>
                        <i class="fas fa-unlock icon-pag icon-artigo"></i>
                        <img class="carousel-img" src="img/html5-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text text-artigos">
                        <p>Contruindo um carousel com Slick</p>
                        <h1>Slick: aprenda a usar este framework tão poderoso</h1>
                        <h2>Customizável do início ao fim</h2>
                    </div>
                </div>
            </a>
            <a href="#" class="carousel-content artigos-content">
                <div class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-clock icon-time icon-artigo"> 11min</i>
                        <i class="fab fa-js-square icon-tecnologia icon-artigo"></i>
                        <p class="icon-nivel icon-artigo">Iniciante</p>
                        <i class="fas fa-unlock icon-pag icon-artigo"></i>
                        <img class="carousel-img" src="img/html5-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text text-artigos">
                        <p>Contruindo um carousel com Slick</p>
                        <h1>Slick: aprenda a usar este framework tão poderoso</h1>
                        <h2>Customizável do início ao fim</h2>
                    </div>
                </div>
            </a>
            <h1 class="division-title">HTML 5 e CSS3</h1>
            <a href="#" class="carousel-content artigos-content">
                <div class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-clock icon-time icon-artigo"> 11min</i>
                        <i class="fab fa-js-square icon-tecnologia icon-artigo"></i>
                        <p class="icon-nivel icon-artigo">Iniciante</p>
                        <i class="fas fa-unlock icon-pag icon-artigo"></i>
                        <img class="carousel-img" src="img/html5-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text text-artigos">
                        <p>Contruindo um carousel com Slick</p>
                        <h1>Slick: aprenda a usar este framework tão poderoso</h1>
                        <h2>Customizável do início ao fim</h2>
                    </div>
                </div>
            </a>
            <a href="#" class="carousel-content artigos-content">
                <div class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-clock icon-time icon-artigo"> 11min</i>
                        <i class="fab fa-js-square icon-tecnologia icon-artigo"></i>
                        <p class="icon-nivel icon-artigo">Iniciante</p>
                        <i class="fas fa-unlock icon-pag icon-artigo"></i>
                        <img class="carousel-img" src="img/html5-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text text-artigos">
                        <p>Contruindo um carousel com Slick</p>
                        <h1>Slick: aprenda a usar este framework tão poderoso</h1>
                        <h2>Customizável do início ao fim</h2>
                    </div>
                </div>
            </a>
            <a href="#" class="carousel-content artigos-content">
                <div class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-clock icon-time icon-artigo"> 11min</i>
                        <i class="fab fa-js-square icon-tecnologia icon-artigo"></i>
                        <p class="icon-nivel icon-artigo">Iniciante</p>
                        <i class="fas fa-unlock icon-pag icon-artigo"></i>
                        <img class="carousel-img" src="img/html5-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text text-artigos">
                        <p>Contruindo um carousel com Slick</p>
                        <h1>Slick: aprenda a usar este framework tão poderoso</h1>
                        <h2>Customizável do início ao fim</h2>
                    </div>
                </div>
            </a>
            <a href="#" class="carousel-content artigos-content">
                <div class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-clock icon-time icon-artigo"> 11min</i>
                        <i class="fab fa-js-square icon-tecnologia icon-artigo"></i>
                        <p class="icon-nivel icon-artigo">Iniciante</p>
                        <i class="fas fa-unlock icon-pag icon-artigo"></i>
                        <img class="carousel-img" src="img/html5-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text text-artigos">
                        <p>Contruindo um carousel com Slick</p>
                        <h1>Slick: aprenda a usar este framework tão poderoso</h1>
                        <h2>Customizável do início ao fim</h2>
                    </div>
                </div>
            </a>
            <h1 class="division-title">HTML 5 e CSS3</h1>
            <a href="#" class="carousel-content artigos-content">
                <div class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-clock icon-time icon-artigo"> 11min</i>
                        <i class="fab fa-js-square icon-tecnologia icon-artigo"></i>
                        <p class="icon-nivel icon-artigo">Iniciante</p>
                        <i class="fas fa-unlock icon-pag icon-artigo"></i>
                        <img class="carousel-img" src="img/html5-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text text-artigos">
                        <p>Contruindo um carousel com Slick</p>
                        <h1>Slick: aprenda a usar este framework tão poderoso</h1>
                        <h2>Customizável do início ao fim</h2>
                    </div>
                </div>
            </a>
            <a href="#" class="carousel-content artigos-content">
                <div class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-clock icon-time icon-artigo"> 11min</i>
                        <i class="fab fa-js-square icon-tecnologia icon-artigo"></i>
                        <p class="icon-nivel icon-artigo">Iniciante</p>
                        <i class="fas fa-unlock icon-pag icon-artigo"></i>
                        <img class="carousel-img" src="img/html5-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text text-artigos">
                        <p>Contruindo um carousel com Slick</p>
                        <h1>Slick: aprenda a usar este framework tão poderoso</h1>
                        <h2>Customizável do início ao fim</h2>
                    </div>
                </div>
            </a>
            <a href="#" class="carousel-content artigos-content">
                <div class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-clock icon-time icon-artigo"> 11min</i>
                        <i class="fab fa-js-square icon-tecnologia icon-artigo"></i>
                        <p class="icon-nivel icon-artigo">Iniciante</p>
                        <i class="fas fa-unlock icon-pag icon-artigo"></i>
                        <img class="carousel-img" src="img/html5-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text text-artigos">
                        <p>Contruindo um carousel com Slick</p>
                        <h1>Slick: aprenda a usar este framework tão poderoso</h1>
                        <h2>Customizável do início ao fim</h2>
                    </div>
                </div>
            </a>
            <a href="#" class="carousel-content artigos-content">
                <div class="carousel-content-container">
                    <div class="img-carousel-container">
                        <i class="fas fa-clock icon-time icon-artigo"> 11min</i>
                        <i class="fab fa-js-square icon-tecnologia icon-artigo"></i>
                        <p class="icon-nivel icon-artigo">Iniciante</p>
                        <i class="fas fa-unlock icon-pag icon-artigo"></i>
                        <img class="carousel-img" src="img/html5-logo.png" alt="Imagem 1">
                    </div>
                    <div class="carousel-text text-artigos">
                        <p>Contruindo um carousel com Slick</p>
                        <h1>Slick: aprenda a usar este framework tão poderoso</h1>
                        <h2>Customizável do início ao fim</h2>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>




</body>
</html>
