<?php

$class = $_POST['class'];

if ($class == 'user') {
    include 'apiUser.php';
    $api = new ApiUser();

        if (isset($_POST['method'])) {

            $m = $_POST['method'];
            
            if ($m == 'userAll') {
                $api->getAll();
            }else if ($m == 'login') {
                $item = array(
                    'usuario' => $_POST['usuario'],
                    'contrasena' => $_POST['password'],
                );
                $api->login($item);

            }else if ($m == 'addUser') {
                $item = array(
                    'id_rol' => $_POST['id_rol'],
                    'nombre' => $_POST['nombre'],
                    'apellidos' => $_POST['apellidos'],
                    'edad' => $_POST['edad'],
                    'usuario' => $_POST['usuario'],
                    'email' => $_POST['email'],
                    'foto' => $_POST['foto'],
                    'contrasena' => $_POST['contrasena'],
                );
                $api->addUser($item);

            }else if ($m == 'emailUser') {
                $item = array(
                    'email' => $_POST['email'],
                    'usuario' => $_POST['usuario'],
                );
                $api->emailUser($item);
            }else if($m == 'deleteUser'){
                $item = array(
                    'id_usuario' => $_POST['id_usuario'],
                ); 
                $api->deleteUser($item);

            }else if ($m == 'updateUser') {
                $item = array(
                    'id_usuario' => $_POST['id_usuario'],
                    'nombre' => $_POST['nombre'],
                    'apellidos' => $_POST['apellidos'],
                    'edad' => $_POST['edad'],
                    'usuario' => $_POST['usuario'],
                    'email' => $_POST['email'],
                    'foto' => $_POST['foto'],
                    'contrasena' => $_POST['contrasena'],
                );
                $api->updateUser($item);
            }else if ($m == 'userI') {
                $item = array(
                    'id_usuario' => $_POST['id_usuario'],
                );
                $api->getById($item);
            }
        }else{
            echo json_encode('Error');
        }
}else if ($class == 'news') {
    include 'apiNews.php';
    $apiNew = new ApiNews();
    
    if (isset($_POST['method'])) {

        $m = $_POST['method'];
        
        if ($m == 'getAllNews') {
            $apiNew->getAllNews();
        }else if ($m == 'addNew') {
            $item = array(
                'titulo' => $_POST['titulo'],
                'contenido' => $_POST['contenido'],
                'id_usuario' => $_POST['id_usuario'],
            );
            $apiNew->addNew($item);
        }else if($m == 'updateNew') {
            $item = array(
                'id_new' => $_POST['id_new'],
                'titulo' => $_POST['titulo'],
                'contenido' => $_POST['contenido'],
            );
            $apiNew->updateNew($item);
        }else if($m == 'getByIdNew') {
             $item = array(
                 'id_new' => $_POST['id_new']
             );
             $apiNew->getById($item);
        }else if($m == 'deleteNew') {
            $item = array(
                'id_new' => $_POST['id_new'],
            );
            $apiNew->deleteNew($item);
        }



    }else {
        echo 'Error';
    }
}

?>