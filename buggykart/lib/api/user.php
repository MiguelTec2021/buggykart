<?php

include 'db.php';

class User extends DB{

    function getUsers(){
        $query = $this->connect()->query('SELECT * FROM usuarios');
        
        return $query;
    }

    function login($user){
        $query = $this->connect()->prepare("SELECT id_usuario, id_rol FROM usuarios WHERE usuario = :usuario AND contrasena = :contrasena");
        $query->execute(['usuario' => $user['usuario'], 'contrasena' => $user['contrasena']]);
        return $query;
    }

    function user($user){
        $query = $this->connect()->prepare("SELECT id_usuario, usuarios.id_rol, usuarios.nombre, apellidos, edad, usuario, email, foto, rol.nombre as nombrerol FROM usuarios INNER JOIN rol ON usuarios.id_rol=rol.id_rol WHERE id_usuario = :id_usuario");
        $query->execute(['id_usuario' => $user['id_usuario']]);
        return $query;
    }

    function addUser($user){
        $rol = 2;
        $foto = $user['foto'];
        if ($foto=='') {
            $foto = 'd.png';
        }
        $query = $this->connect()->prepare("INSERT INTO usuarios (id_rol, nombre, apellidos, edad, usuario, email, foto, contrasena) VALUES (:id_rol, :nombre, :apellidos, :edad, :usuario, :email, :foto, :contrasena)");
        $query->execute([
            'id_rol'=> $user['id_rol'], 
            'nombre'=> $user['nombre'], 
            'apellidos'=> $user['apellidos'], 
            'edad' => $user['edad'], 
            'usuario' => $user['usuario'], 
            'email' => $user['email'], 
            'foto' => $foto, 
            'contrasena' => $user['contrasena'],
        ]);
        if ($query) {
            echo '1';
        }else{
            echo '0';
        }
        // return $query;
    }

    function emailUser($user){
        $query = $this->connect()->prepare("SELECT email, usuario FROM usuarios WHERE email = :email OR usuario = :usuario");
        $query->execute(['email' => $user['email'], 'usuario' => $user['usuario']]);
        return $query;
    }

    function deleteUser($user){
        $query = $this->connect()->prepare("DELETE FROM usuarios WHERE id_usuario = :id_usuario");
        $query->execute(['id_usuario' => (int) $user['id_usuario']]);
        return $query;
    }

    function updateUser($user){
        $query = $this->connect()->prepare("UPDATE usuarios SET nombre = :nombre, apellidos = :apellidos, edad = :edad, usuario = :usuario, email = :email, foto = :foto, contrasena = :contrasena WHERE id_usuario = :id_usuario");
        $query->execute(['nombre' => $user['nombre'], 'apellidos' => $user['apellidos'], 'edad' => $user['edad'], 'usuario' => $user['usuario'], 'email' => $user['email'], 'foto' => $user['foto'], 'contrasena' => $user['contrasena'], 'id_usuario' => $user['id_usuario']]);
        return $query;
    }
}


?>