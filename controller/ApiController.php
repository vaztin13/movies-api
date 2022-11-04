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

    function getAll(){
        if (isset($_GET["genre_type_id"])) {
            $movies = $this->model->findMoviesByGenre($_GET["genre_type_id"]); //filtra x genero
        } elseif (isset($_GET["sortBy"]) && isset($_GET["sortDirection"])) {
            if ($_GET["sortBy"] == "id") { // ordena manera ascendente o descendiente x ID
                if ($_GET["sortDirection"] == "ASC") { // ?sortDirection=ASC&sortBy=id
                    $movies = $this->model->findMoviesSortedByIdAsc();
                } elseif ($_GET["sortDirection"] == "DESC") { // ?sortDirection=DESC&sortBy=id
                    $movies = $this->model->findMoviesSortedByIdDesc();
                }
            } elseif ($_GET["sortBy"] == "year") { //  ordena manera ascendente o descendiente x categoria "year"
                if ($_GET["sortDirection"] == "ASC") { // ?sortDirection=ASC&sortBy=year
                    $movies = $this->model->findMoviesSortedByYearAsc();
                } elseif ($_GET["sortDirection"] == "DESC") { // ?sortDirection=DESC&sortBy=year
                    $movies = $this->model->findMoviesSortedByYearDesc();
                }
            } 
        } else {
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

    private function getBody() {
        $bodyString = file_get_contents("php://input");
        return json_decode($bodyString);
    }
 
    function post($params = null) {
        $body = $this->getBody();
        $id = $this->model->addMovie($body->title, $body->genre_type_id, $body->image, $body->plot, $body->year, $body->director);
        //return $this->db->lastInsertId();
       
        //añadir validaciones con funcion aparte

        if ($id != 0) {
            $this->view->response("La pelicula fue añadida con el id '$id'.", 200);
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


}