<!DOCTYPE html>
<html lang="pt-br">
<head>

    <title>SGate; Account</title>

    <meta charset="UTF-8">
    <meta name="author" content="Laks Castro">
    <meta name="description" content="Página simples e minimalista para cadastro e login de usuários do site">
    <meta name="keywords" content="login, cadastro, sign, up, in, entrar, conta, account, minha, sgate, ;">
    <meta name="robots" content="index,follow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <!-- jquery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- script local -->
    <script type="text/javascript" src="script/script-formulario.js"></script>


    <!--Font Awesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Alegreya+SC&display=swap" rel="stylesheet">


    <!-- stylesheet local -->
    <link rel="stylesheet" href="stylesheet/css/stylesheet-formulario.css">

</head>
<body>

<div id="account-option" class="viewport">
    <div class="container">
        <i class="fas fa-user-circle icon"></i>

        <ul class="buttons-container">
            <li><a id="login" class="button-link" href="#">Login</a></li>
            <li><a id="cadastro" class="button-link" href="#">Cadastro</a></li>
        </ul>

        <ul class="float-left">
            <li><a class="fab fa-google" href="#"></a></li>
            <li><a class="fab fa-facebook-f" href="#"></a></li>
            <li><a class="fab fa-twitter" href="#"></a></li>
        </ul>
    </div>
</div>
<div id="account-login" class="viewport">
    <div class="container">
        <nav id="back-login" class="back-container fas fa-angle-left"></nav>
        <h1 class="title">Login</h1>
        <form class="account-form" action="" method="post">
            <label for="email">E-mail</label>
            <div class="input-container">
                <i class="fas fa-envelope input-icon"></i>
                <input autofocus autocomplete="false" type="email" class="input" id="email" title="Digite seu e-mail" placeholder="Seu e-mail" required name="email" value="">
            </div>

            <label for="senha">Senha</label>
            <div class="input-container">
                <i class="fas fa-key input-icon"></i>
                <input autocomplete="false" type="password" class="input" id="senha" title="Crie sua senha" placeholder="Digite sua senha" required name="senha" value="">
                <a href="#senha" class="fas fa-eye input-icon icon-pass"></a>
            </div>

            <a class="esqueci-senha" href="#">Forget password?</a>

            <button type="submit" class="submit">Login</button>
        </form>
    </div>
</div>
<div id="account-cadastro" class="viewport">
    <div class="container">
        <nav id="back-cadastro" class="back-container fas fa-angle-left"></nav>
        <h1 class="title">Cadastro</h1>
        <form class="account-form" action="" method="post">
            <label for="email-cadastro">E-mail</label>
            <div class="input-container">
                <i class="fas fa-envelope input-icon"></i>
                <input autofocus autocomplete="false" type="email" class="input" id="email-cadastro" title="Digite seu e-mail" placeholder="Seu E-mail" required name="email" value="">
            </div>
            <label for="username">Usuário</label>
            <div class="input-container">
                <i class="fas fa-user-plus input-icon"></i>
                <input autocomplete="false" type="text" class="input" id="username" title="Crie um nome de usuário" placeholder="Crie um nome de usuário" required name="username" value="">
            </div>
            <label for="senha-cadastro">Senha</label>
            <div class="input-container">
                <i class="fas fa-key input-icon"></i>
                <input autocomplete="false" type="password" class="input" id="senha-cadastro" title="Crie sua senha" placeholder="Crie sua senha" required name="senha" value="">
                <a href="#senha-cadastro" class="fas fa-eye input-icon icon-pass"></a>
            </div>
            <a class="esqueci-senha" href="#">Forget password?</a>
            <button type="submit" class="submit">Login</button>
        </form>
    </div>
</div>
</body>
</html>