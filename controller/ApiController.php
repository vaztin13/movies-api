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
 
    function getAll($params = null) { //falta añadir logica para 404
        $movies = $this->model->getMovies();
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






}