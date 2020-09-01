$(document).ready(function(){
    var login = $("#login");
    var cadastro = $("#cadastro");

    var optionContainer = $("#account-option");

    var loginContainer = $("#account-login");
    var cadastroContainer =  $("#account-cadastro");

    var backLogin = $("#back-login");
    var backCadastro = $("#back-cadastro");

    login.click(function(){
        optionContainer.fadeToggle("normal");
        loginContainer.fadeToggle("normal");
    });
    backLogin.click(function(){
        optionContainer.fadeToggle("normal");
        loginContainer.fadeToggle("normal");
    });
    cadastro.click(function(){
        optionContainer.fadeToggle("normal");
        cadastroContainer.fadeToggle("normal");
    });
    backCadastro.click(function(){
        optionContainer.fadeToggle("normal");
        cadastroContainer.fadeToggle("normal");
    });

    //======================================

    var inputList = $(".input");

    inputList.focus(function(){
        var target = $(this).closest('.input-container');
    });
    inputList.focusout(function(){
        var target = $(this).closest('.input-container');
    });

    //===================================

    var iconPassList = $(".icon-pass");

    iconPassList.click(function(e){
        e.preventDefault();
        var target = $(this).attr("href");

        $(target).attr("type") == "password" ? $(target).attr("type", "text") : $(target).attr("type", "password");
    });
});