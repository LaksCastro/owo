$(document).ready(function(){

    $('.carousel-container-hero').slick({
        arrows: false,
        dots: false,
        mobileFirst: true,
        autoplaySpeed: 1500,
        autoplay: true,
        responsive: [
            {
                breakpoint: 950,
                settings: {
                    slidesToShow: 4,
                    slidesToScroll: 4
                }
            },
            {
                breakpoint: 728,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3
                }
            },
            {
                breakpoint: 460,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 320,
                settings: {
                    centerMode: true,
                }
            }
            // You can unslick at a given breakpoint now by adding:
            // settings: "unslick"
            // instead of a settings object
        ]
    });

    //======================================

    var socialIcon = $("#social-icon");
    var menuSocial = $("#menu-social");
    var containerSocial = $("#container-social");

    socialIcon.click(function(){
        menuSocial.slideToggle(300, function(){
            $("#menu-social a").slideToggle(0);
            menuSocial.css("display") == "none" ? containerSocial.css("opacity", "0") : containerSocial.css("opacity", "1");
        });
    });

    //=======================================

    var menuIcon = $("#menu-icon");
    var menuContainer = $("#menu-container");
    var menuContent = $("#menu-content");
    var closeMenu = $("#close-menu");

    menuIcon.click(function(){
        menuContainer.css("width") == "0px" ? showMenu() : hideMenu();
    });
    closeMenu.click(function(){
        hideMenu();
    });

    function showMenu(){
        menuContainer.animate({
            width: "100%",
        }, "slow", "swing", function(){
            menuContent.fadeToggle("normal");
        });
    }
    function hideMenu(){
        menuContent.fadeToggle("normal", function(){
            menuContainer.animate({
                width: "0px",
            }, "slow", "swing");
        });
    }

    //======================================

    var toTop = $("#to-top");
    window.onscroll = function(){
        if(window.scrollY > window.innerHeight){
            toTop.fadeIn(500);
            toTop.css("display", "flex");
        }
        else{
            toTop.fadeOut(500);}
    };
    $('a[href^="#"]').on('click', function(e) {
        e.preventDefault();
        var id = $(this).attr('href'),
            targetOffset = $(id).offset().top;

        $('html, body').animate({
            scrollTop: targetOffset - 100
        }, 500);
    });
});