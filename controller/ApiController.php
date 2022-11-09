<?php

require_once "./model/MovieModel.php";
require_once "./model/MovieTypeModel.php";
require_once "./view/ApiView.php";



class ApiController {

    private $model;
    private $movieTypeModel;
    private $view;


    function __construct() {
        $this->movieTypeModel = new MovieTypeModel();
        $this->model = new MovieModel();
        $this->view = new ApiView();
    }
 
    /*     function getAll($params = null) { //falta añadir logica para 404
        $movies = $this->model->getMovies();
        return $this->view->response($movies, 200);
    } */

    function getAll() {
        
        $sortBy = $_GET['sortBy'] ?? null;
        $order = $_GET['order'] ?? null;

        $page = $_GET['page'] ?? null;
        $limit = $_GET['limit'] ?? null;
        
        //filtra x genero
        
        if (isset($_GET["genre_type_id"])) {
            $movies = $this->model->findMoviesByGenre($_GET["genre_type_id"]); 
        } // falta else para tomar errores
        
        // sortBy & order (ASC/DESC) 

        else if (isset($sortBy)) {
            if ($this->model->isValid($sortBy)) {
                if (isset($order) && !in_array($order, ['ASC', 'DESC'])) {
                    $this->view->response("El order debe ser 'ASC' o 'DESC' (Respetando mayúsculas)", 400);
                    return;
                }
                if (isset($order)) {
                    $movies = $this->model->sortAndOrder($sortBy, $order);
                }
                else {
                    $movies = $this->model->sortAndOrder($sortBy, 'ASC'); //si no selecciona el order, automaticamente pasa ASC
                }
            } else {
                $this->view->response("El campo $sortBy no existe.", 400);
            }
        }
        
        // paginacion

        else if ((!isset($page) && isset($limit)) || (isset($page) && !isset($limit))) { // error en caso de no tener alguno de los parametros
            $this->view->response("Tanto 'page' como 'limit' deben ser parámetros", 400);
            return;
        }
         
        else if (isset($page) && !ctype_digit($page)) { // error en caso de que page no sea un int
            $this->view->response("Page tiene que ser un entero (valor mínimo = 0)", 400);
            return;
        }
        
        else if (isset($limit) && !ctype_digit($limit)) { // error en caso de que limit no sea un int
            $this->view->response("Limit tiene que ser un entero (valor mínimo = 1)", 400);
            return;
        }

        else if (isset($page) && isset($limit)) { 
            $movies = $this->model->paginate($page, $limit);
        }  
        
                
        else {
            $movies = $this->model->getMovies();
        }
        return $this->view->response($movies, 200);
    }
    
    function get($params = null) { 
        $movieID = $params[":ID"];
        $movie = $this->model->getMovie($movieID);
        if ($movie) {
            return $this->view->response($movie, 200);
        } else {
            return $this->view->response("La pelicula con el id '$movieID' no existe", 404);
        }
    }
    
    function delete($params = null) {
        $movieID = $params[":ID"];
        $movie = $this->model->getMovie($movieID);
        
        if ($movie) {
            $this->model->deleteMovieFromDB($movieID);
            return $this->view->response("La pelicula con el id '$movieID' fue borrada con exito", 200);
        } else {
            return $this->view->response("La pelicula con el id '$movieID' no existe", 404);
        }
    }
        
    function post($params = null) {
        $body = $this->getBody();
        $this->validatePost($body); // valida inputs
        $id = $this->model->addMovie($body->title, $body->genre_type_id, $body->image, $body->plot, $body->year, $body->director);
        //return $this->db->lastInsertId(); borrar model en comentarios
          
        if ($id != 0) {
            $this->view->response("La pelicula fue añadida con el id '$id'.", 201);
        } else {
            $this->view->response("La pelicula no pudo ser creada.", 500);
        }
    }
    
    function put($params = null) {
        $movieID = $params[":ID"];
        $body = $this->getBody();
        
        //faltan validaciones
        
        $movie = $this->model->getMovie($movieID);
        
        if ($movie) {
            $this->model->updateMovie($movieID, $body->title, $body->genre_type_id, $body->image, $body->plot, $body->year, $body->director);
            return $this->view->response("La pelicula con el id '$movieID' fue actualizada correctamente", 200);
        } else {
            return $this->view->response("La pelicula con el id '$movieID' no existe", 404);
        }
    }

    private function getBody() {
        $bodyString = file_get_contents("php://input");
        return json_decode($bodyString);
    }

    private function validatePost($body) {
        if (empty($body->title) 
            || empty($body->genre_type_id) 
            || empty($body->image) 
            || empty($body->plot)
            || empty($body->year)
            || empty($body->director)) {
            $this->view->response("Uno de los campos se encuentra vacio", 400);
            die;
        }
    }
    
}