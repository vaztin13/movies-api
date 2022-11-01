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
 
    function getAll($params = []) { //falta añadir logica para 404
        $movies = $this->model->getMovies();
        return $this->view->response($movies, 200);
    }

    function get($params = []) { //falta añadir logica para 404
        $movieID = $params[":ID"];
        $movie = $this->model->getMovie($movieID);
        return $this->view->response($movie, 200);
    }






}