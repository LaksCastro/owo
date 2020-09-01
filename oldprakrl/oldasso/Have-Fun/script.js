$(document).ready(function(){

    $(".legenda").css("display", "-webkit-box").css("-webkit-box-orient","vertical").css("-webkit-line-clamp","1").css("overflow","hidden");
    $(".titulo").css("display", "-webkit-box").css("-webkit-box-orient","vertical").css("-webkit-line-clamp","2").css("overflow","hidden");
    $(".resumo").css("display", "-webkit-box").css("-webkit-box-orient","vertical").css("-webkit-line-clamp","3").css("overflow","hidden");

    $(".carousel-container").slick({
        dots: true,
        adaptiveHeight: true,
        autoplay: true,
        arrows: false,
        mobileFirst: true,
        responsive: [{
            breakpoint: 1199,
            settings:{
                slidesToShow: 3,
                slidesToScroll: 3
            }
        },{
            breakpoint: 599,
            settings:{
                slidesToShow: 2,
                slidesToScroll: 2
            }
        }]
    });
    $(".carousel-container-card").slick({
        autoplay: true,
        arrows: false,
        mobileFirst: true,
        slidesToShow: 2,
        slidesToScroll: 2,
        responsive: [{
            breakpoint: 1199,
            settings:{
                slidesToShow: 6,
                slidesToScroll: 6
            }
        },{
            breakpoint: 849,
            settings:{
                slidesToShow: 5,
                slidesToScroll: 5
            }
        },{
            breakpoint: 699,
            settings:{
                slidesToShow: 4,
                slidesToScroll: 4
            }
        },{
            breakpoint: 359,
            settings:{
                slidesToShow: 3,
                slidesToScroll: 3
            }
        }]
    });



    let headerBars = $(".header-menu-sm");

    let submenuContainer = $(".submenu-container");
    let submenuContainerClose = $(".submenu-container-close");
    let submenuContainerBg = $(".submenu-container-bg");

    let headerDesktop = $(".header-content-bg");
    let headerIcons = $(".header-icons"); //pega todos os icones
    let headerIcon = $(".header-icons:first-child"); //pega o primeiro icone (serve apenas para o breakpoint de 600)

    if(window.innerWidth >= 1000){
        headerIconDesactive();
        let headerIconHref = undefined;

        headerIcons.click(function(){
            submenuContainer.css("visibility", "visible").css("opacity", "1");
            submenuContainerBg.css("width", "45%").css("display", "block");

            headerIcon = $(this); //ta com o onjeto do icone clicado no momento
            let headerIconActiveHref = headerIcon.attr("href"); //ta com o href do icone clicado no momento

            if(headerIconHref !== undefined){
                if(headerIconActiveHref === headerIconHref){
                    headerIconDesactive();
                    headerElementsHidden();
                }
                else{
                    headerIconDesactive();
                    headerIconHref = headerIconActiveHref;

                    headerIcon.addClass("header-icons-active");
                    $(headerIconActiveHref).css("display", "block").css("opacity", "1");
                }
            }
            else{
                headerIconDesactive();
                headerIconHref = headerIconActiveHref;

                headerIcon.addClass("header-icons-active");
                $(headerIconActiveHref).css("display", "block").css("opacity", "1");
            }

        });
        submenuContainerClose.click(function(){
            headerIconDesactive();
            headerElementsHidden();
        });
        function headerIconDesactive(){
            headerIcons.removeClass("header-icons-active");
            $(".submenu-content-bg").css("display", "none").css("opacity", "0");
        }
        function headerElementsHidden(){
            submenuContainerBg.css("width", "0").css("display", "none");
            submenuContainer.css("visibility", "hidden").css("opacity", "0");
        }
    }
    headerBars.click(function(){
        testando();
    });
    function testando(){
        let headerIconActiveHref = headerIcon.attr("href"); //pega o href do icone ativo no momento

        if(window.innerWidth >= 600){

            if(headerDesktop.css("opacity") === "0"){
                headerIcon.addClass("header-icons-active");

                headerDesktop.css("visibility", "visible").css("opacity", "1");
                submenuContainer.css("visibility", "visible").css("opacity", "1");
                submenuContainerBg.css("width", "45%").css("display", "block");
                $(headerIconActiveHref).css("display", "block").css("opacity", "1");

                headerIcons.click(function(e){
                    e.preventDefault();

                    let headerIconHref = $(this)/*(headerIcon)*/.attr("href"); //HEADERICONID TÁ EXATAMENTE COM O VALOR DO HREF

                    if (headerIconHref === headerIconActiveHref && window.innerWidth < 1000){
                        headerIcon = $(this);
                        headerElementsHidden();
                    }
                    else{
                        headerIconDesactive();
                        headerIconActiveHref = headerIconHref;
                        headerIcon = $(this);
                        $(this).addClass("header-icons-active");
                        $(headerIconActiveHref).css("display", "block").css("opacity", "1");
                    }
                });
                submenuContainerClose.click(function(){
                    headerIconDesactive();
                    headerElementsHidden();
                });
                function headerIconDesactive(){
                    headerIcons.removeClass("header-icons-active");
                    $(".submenu-content-bg").css("display", "none").css("opacity", "0");
                }
            }
            else{
                headerElementsHidden();
            }
            function headerElementsHidden(){
                submenuContainerBg.css("width", "0").css("display", "none");
                submenuContainer.css("visibility", "hidden").css("opacity", "0");
                headerDesktop.css("visibility", "hidden").css("opacity", "0");
            }

        }
        else{
            if(submenuContainer.css("opacity") === "1"){
                $(this).css("transform", "rotate(0)").css("transition", "all 200ms ease-in-out");
                $(".header-submenuContainer-sm path").css("fill", "white").css("transition", "all 200ms ease-in-out");
                submenuContainer.css("visibility", "hidden").css("opacity", "0").css("transition", "all 200ms ease-in-out");
            }
            else{
                $(this).css("transform", "rotate(50grad)").css("transition", "all 200ms ease-in-out");
                $(".header-submenuContainer-sm path").css("fill", "#d85366").css("transition", "all 200ms ease-in-out");
                submenuContainer.css("visibility", "visible").css("opacity", "1").css("transition", "all 200ms ease-in-out");
            }
        }
    }



    $(".hero-search-icon").click(function(){
        $(this).css("transform", "translateY(-200%)").css("opacity", "0").css("transition", "all 200ms ease-in-out");
        setTimeout(function(){
            $(".hero-form").css("transform", "translateY(0)").css("opacity", "1").css("transition", "all 200ms ease-in-out");
        }, 200);
    });

    $(function() {
        $("a[href^='#']").bind('click', function(event) {
            let $anchor = $(this);
            $('html, body').stop().animate({ scrollTop: $($anchor.attr('href')).offset().top }, 1000, 'swing');
        });
    });


});

onscroll = function() {
    let elements = document.querySelectorAll(".carousel-container");
    let height = parseInt(innerHeight);

    for (let x = 0; x <= elements.length - 1; x++) {
        let elementTop = parseInt(elements[x].getBoundingClientRect().top);
        if (elementTop <= height) {
            $(elements[x]).css('transform', 'translateY(0)').css('opacity', '1').css('transition', 'all 400ms ease-in-out');
        }
    }

    let scrollY = parseInt(window.scrollY);

    if(scrollY >= height) {
        $(".ancora-inicio").css('visibility', 'visible').css('opacity', '0.9').css('transition', 'all 300ms ease-in-out');
    }
    else{
        $(".ancora-inicio").css('visibility', 'hidden').css('opacity', '0').css('transition', 'all 300ms ease-in-out');
    }
};
