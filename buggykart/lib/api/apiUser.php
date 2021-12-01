<?php

include_once 'user.php';

class ApiUser{

    function getAll(){
        $user = new User();
        $users = array();

        $res = $user->getUsers();

        if ($res->rowCount()) {
            while($row = $res->fetch(PDO::FETCH_ASSOC)){
                $item = array(
                  'id_usuario' => (int) $row['id_usuario'],
                  'id_rol' => (int) $row['id_rol'],
                  'nombre' => $row['nombre'], 
                  'apellidos' => $row['apellidos'], 
                  'edad' => $row['edad'], 
                  'usuario' => $row['usuario'], 
                  'email' => $row['email'], 
                  'foto' => $row['foto'], 
                  'contrasena' => $row['contrasena'], 
                );
                array_push(($users), $item);
            }

            printJSON($users);
        }else{
            error('No hay elementos');
        }
    }

    function login($item){
        $user = new User();
        $userv = array();
        $res = $user->login($item);
        if ($res->rowCount()) {
            $row = $res->fetch();
                $item = array(
                    'id_usuario' => (int) $row['id_usuario'],
                    'id_rol' => (int) $row['id_rol'],
                );
            array_push($userv, $item);
            printJSON($userv);
        }else{
            echo "0";
        }
    }

    function addUser($item){
        $user = new User();
        $user->addUser($item);
    }

    function emailUser($item){
        $user = new User;
        $res = $user->emailUser($item);
    
        if ($res->rowCount()) {
            echo "1";
        }else{
            echo "0";
        }
    }

    function deleteUser($item){
        $user = new User();
        $res = $user->deleteUser($item);

        if ($res) {
            echo '1';
        }else {
            echo '0';
        }
    }

    function updateUser($item){
        $user = new User();
        $res = $user->updateUser($item);
        if ($res) {
            echo '1';
        }else{
            echo '0';
        }
    }

    function getById($item){
        $user = new User();
        $res = $user->user($item);
        if ($res->rowCount()==1) {
            $row = $res->fetch();
                $item = array(
                    'id_usuario' => (int) $row['id_usuario'],
                    'id_rol' => (int) $row['id_rol'],
                    'nombre' => $row['nombre'],
                    'apellidos' => $row['apellidos'],
                    'edad' => $row['edad'],
                    'usuario' => $row['usuario'],
                    'email' => $row['email'],
                    'foto' => $row['foto'],
                    'rol' => $row['nombrerol'],
                );
            // array_push($item);
            printJSON($item);
        }
    }
}

    function printJSON($array){
        echo json_encode($array);
    }

    function error($mensaje){
        echo json_encode($mensaje);
    }

?>