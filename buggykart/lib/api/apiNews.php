<?php
include_once 'news.php';

class ApiNews{

    function getAllNews(){
        $new = new News();
        $news = array();

        $res = $new->getAllNews();

        if ($res->rowCount()) {
            while($row = $res->fetch(PDO::FETCH_ASSOC)){
                $item = array(
                    'id_new' => (int) $row['id_new'],
                    'titulo' => $row ['titulo'],
                    'contenido' => $row['contenido'],
                    'foto' => $row['foto'],
                    'fecha' => $row['fecha'],
                    'id_usuario' => $row['id_usuario'],
                    'usuario' => $row['usuario']
                );
                array_push(($news), $item);
            }
            printJSON($news);
        }else{
            error('No hay regsitros');
        }
    }
    

    function addNew($item){
        $new = new News();
        $res = $new->addNews($item);
        if ($res) {
            echo '1';
        }else{
            echo '0';
        }
    }

    function updateNew($item){
        $new = new News();
        $res = $new->updateNew($item);
        if ($res) {
            echo '1';
        }else {
            echo '0';
        }
    }

    function getById($item){
        $new = new News();
        $res = $new->getById($item);
        if ($res->rowCount()==1) {
            $row = $res->fetch();
            $item = array(
                'id_new' => $row['id_new'],
                'titulo' => $row['titulo'],
                'contenido' => $row['contenido']
            );
            printJSON($item);
        }

    }

    function deleteNew($item){
        $new = new News();
        $res = $new->deleteNew($item);
        if ($res) {
            echo "1";
        }else {
            echo '0';
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