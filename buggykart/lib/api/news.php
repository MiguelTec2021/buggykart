<?php

include 'db.php';

class News extends DB{

    function getAllNews(){
        $query = $this->connect()->query("SELECT id_new, titulo, contenido, noticias.foto, noticias.id_usuario, fecha, usuarios.nombre as usuario FROM noticias INNER JOIN usuarios ON noticias.id_usuario=usuarios.id_usuario");
        return $query;
    }

    function addNews($new){

        $foto = 'd.png';
        $fecha = (String) date("Y-m-d");
        // echo $fecha;
        $query = $this->connect()->prepare("INSERT INTO noticias (titulo, contenido, foto, fecha, id_usuario) VALUES (:titulo, :contenido, :foto, :fecha, :id_usuario)");
        $query->execute(['titulo' => $new['titulo'],'contenido' => $new['contenido'],'foto' => $foto,'fecha' => $fecha,'id_usuario' => $new['id_usuario']]);
        return $query;
    }

    function updateNew($new){
        $fecha = (String) date("Y-m-d");
        $query = $this->connect()->prepare("UPDATE noticias SET titulo = :titulo, contenido = :contenido, fecha = :fecha WHERE id_new = :id_new");
        $query->execute(['titulo' => $new['titulo'], 'contenido' => $new['contenido'], 'fecha' => $fecha, 'id_new' => $new['id_new']]);
        return $query;
    }

    function getById($new){
        $query = $this->connect()->prepare("SELECT * FROM noticias WHERE id_new = :id_new");
        $query->execute(['id_new' => $new['id_new']]);
        return $query;
    }

    function deleteNew($new){
        $query = $this->connect()->prepare("DELETE FROM noticias WHERE id_new = :id_new");
        $query->execute(['id_new' => $new['id_new']]);
        return $query;
    }

}

?>