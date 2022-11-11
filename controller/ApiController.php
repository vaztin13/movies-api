<?php

require_once "./model/ApiCommentModel.php";
require_once "./view/ApiView.php";



class ApiController {

    private $model;
    private $view;


    function __construct() {
        $this->model = new ApiCommentModel();
        $this->view = new ApiView();
    }

    function getAll() {
        
        $sortBy = $_GET['sortBy'] ?? null;
        $order = $_GET['order'] ?? null;

        $page = $_GET['page'] ?? null;
        $limit = $_GET['limit'] ?? null;
        
        $offset = $page * $limit - $limit;
        
        //filtra x genero
        
        if (isset($_GET["rating"])) {
            if ($_GET["rating"] > 5) {
                return $this->view->response("El 'rating' no debe ser mayor a '5'", 400);
            }
            
            else if ($_GET["rating"] < 1) {
                return $this->view->response("El 'rating' no debe ser menor que '1'", 400);
            }

            else {
            $comments = $this->model->findCommentsByRating($_GET["rating"]); 
            }
        }
            
        // sortBy & order (ASC/DESC) 

        else if (isset($sortBy)) {
            if ($this->model->isValid($sortBy)) {
                if (isset($order) && !in_array($order, ['ASC', 'DESC'])) {
                    $this->view->response("El order debe ser 'ASC' o 'DESC' (Respetando mayúsculas)", 400);
                    return;
                }
                if (isset($order)) {
                    $comments = $this->model->sortAndOrder($sortBy, $order);
                }
                else {
                    $comments = $this->model->sortAndOrder($sortBy, 'ASC'); //si no selecciona el order, automaticamente pasa ASC
                }
            } else {
                return $this->view->response("El campo $sortBy no existe.", 400);
            }
        }
        
        // paginacion

        else if ((!isset($page) && isset($limit)) || (isset($page) && !isset($limit))) { // error en caso de no tener alguno de los parametros
            $this->view->response("Tanto 'page' como 'limit' deben ser parámetros", 400);
            return;
        }
         
        else if (isset($page) && !ctype_digit($page)) { // error en caso de que page no sea un int
            $this->view->response("Page tiene que ser un entero (valor mínimo = 1)", 400);
            return;
        }
        
        else if (isset($limit) && !ctype_digit($limit)) { // error en caso de que limit no sea un int
            $this->view->response("Limit tiene que ser un entero (valor mínimo = 1)", 400);
            return;
        }

        else if ($offset < 0) {
            return $this->view->response("Page tiene que tener un valor mínimo de 1", 400);
        }
        
        else if (isset($page) && isset($limit)) { 
            $comments = $this->model->paginate($page, $limit, $offset);
        }  

        else {
            $comments = $this->model->getComments();
        }
        return $this->view->response($comments, 200);
    }
    
    function get($params = null) { 
        $commentID = $params[":ID"];
        $comment = $this->model->getComment($commentID);
        if ($comment) {
            return $this->view->response($comment, 200);
        } else {
            return $this->view->response("El comentario con el id '$commentID' no existe", 404);
        }
    }
    
    function delete($params = null) {
        $commentID = $params[":ID"];
        $comment = $this->model->getComment($commentID);
        
        if ($comment) {
            $this->model->deleteComment($commentID);
            return $this->view->response("El comentario con el id '$commentID' fue borrado con exito", 200);
        } else {
            return $this->view->response("El comentario con el id '$commentID' no existe", 404);
        }
    }
        
    function post($params = null) {
        $body = $this->getBody();
        $this->validatePost($body); // valida inputs
        // $id = $this->model->addComment(); $id != 0 & 
        
        if (($body->rating <= 5)) {
            $id = $this->model->addComment($body->comment, $body->user_id, $body->name, $body->movie_id, $body->rating);
            $this->view->response("El comentario fue añadido con el id '$id'.", 201);
       } else if (($body->rating > 5)) {
            $this->view->response("El 'rating' debe ser menor o igual a 5.", 400);
            die;
       } else {
            $this->view->response("El comentario no pudo ser creado.", 500);
        }
    }
    
    function put($params = null) {
        $commentID = $params[":ID"];
        $body = $this->getBody();
        //faltan validaciones
        
        $comment = $this->model->getComment($commentID);
        
        if ($comment) {
            $this->model->updateComment($commentID, $body->comment, $body->user_id, $body->name, $body->movie_id, $body->rating);
            return $this->view->response("El comentario con el id '$commentID' fue actualizado correctamente", 200);
        } else {
            return $this->view->response("El comentario con el id '$commentID' no existe", 404);
        }
    }

    private function getBody() {
        $bodyString = file_get_contents("php://input");
        return json_decode($bodyString);
    }

    private function validatePost($body) {
        if (empty($body->comment) 
            || empty($body->user_id) 
            || empty($body->name) 
            || empty($body->movie_id)
            || empty($body->rating)) {
            $this->view->response("Uno de los campos se encuentra vacio", 400);
            die;
        }
    }

}