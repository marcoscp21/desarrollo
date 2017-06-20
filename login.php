<?php

require("connection/mysql_connect.php");

$error = "";
if(isset($_POST['submitted'])){

  $errors = array();

  if(empty($_POST['usuario'])){
    $errors[] = 'Olvidaste poner tu usuario';
  }else{
    $u = $_POST['usuario'];
  }

  if(empty($_POST['password'])){
    $errors[] = 'Olvidaste poner tu password';
  }else{
    $p = md5($_POST['password']);
    //$p = escape_data($_POST['password']);
  } 

  if(empty($errors)){
    $query = "SELECT idusuario, usuario, permiso FROM usuario WHERE usuario='$u' AND password='$p'";
    $result = mysqli_query($dbc, $query);

    $row = mysqli_fetch_array($result, MYSQL_NUM);

    if($row){
      $_SESSION['id'] = $row[0];
      $_SESSION['usuario'] = $row[1];
      $_SESSION['permiso'] = $row[2];

      $rol = $_SESSION['permiso'] ;

      if ($rol == 1) {

        echo '<script type="text/javascript">window.location="director/index.php";</script>';

      }elseif ($rol == 2) {

        echo '<script type="text/javascript">window.location="profesor/index.php";</script>';

      }elseif ($rol == 3) {
        echo '<script type="text/javascript">window.location="tutor/index.php";</script>';

      }
    }else{
      $error = '<div class="alert alert-warning alert-dismissible text-center" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <strong>Error!</strong><br> El usuario y/o password son incorrectos, intenta otra vez. 
                </div>';
    }
  }

  mysqli_close($dbc);

}else{
  $errors = NULL;
}

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Login al sistema || Padres Online</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
      .footer {
        position: absolute;
        bottom: 0;
        width: 100%;
        /* Set the fixed height of the footer here */
        height: 50px;
        padding-top: 10px;
        background-color: rgba(3,51,91,0.5);
        color: #ccc;
      }

    </style>
</head>
<body>
        <body>
            <div class="container">
                <div class="row vertical-offset-60">
                    <div class="col-md-4 col-md-offset-4">
                        <a href="index.html"><h2 class="text-center titulo">Padres Online</h2></a>
                        <div class="panel panel-default">
                            <div class="panel-heading">                                
                                <div class="row-fluid user-row">
                                    <h2 class="text-center">Bievenido/a</h2>
                                    <p class="text-center">Por favor ingresa tu usuario y contraseña para acceder al sistema.</p>
                                </div>
                                <?php echo $error; ?>
                            </div>
                            <div class="panel-body">
                                <form accept-charset="UTF-8" class="form-signin" method="post" action="login.php">
                                  <fieldset>
                                    <input type="text" class="form-control" placeholder="usuario" id="usuario" name="usuario">
                                    <input type="password" class="form-control" placeholder="Password" id="password" name="password" >
                                    <br>
                                    <input type="hidden" name="submitted" value="TRUE">
                                    <input class="btn btn-lg btn-success btn-block" type="submit" id="submit" value="Ingresar »">
                                  </fieldset>
                                </form>
                                <hr>
                                <!--
                                <p class="text-center"><a href="recuperar_password.php">¿Has olvidado tu contraseña?</a></p>
                                -->
                                <?php include('includes/version.php'); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

             <script>

                $(document).ready( function(){

                  $('#ima').hide();
                  $('#ima').fadeIn(3000);
                }
                )

            </script>
</body>
</html>
