<?php

require_once "./view/MovieView.php";

class MovieTypeController {

    private $movieTypeModel;
    private $movieModel;
    private $authHelper;
    private $view;

    function __construct() {
        $this->movieTypeModel = new MovieTypeModel();
        $this->movieModel = new MovieModel();
        $this->authHelper = new AuthHelper();
        $this->view = new MovieView();
    }

    function showManageMovieTypes($index) {
        $this->authHelper->checkLoggedIn();
        $movieTypes = $this->movieTypeModel->getMovieTypes($index);
        $this->view->showManageMovieTypes($movieTypes, $index);
    }

    function createMovieType() {
        $this->authHelper->checkLoggedIn();
        $movieTypeId = $_POST['id'] !== '' ? $_POST['id'] : null;
/*         if (!isset($_POST['genre']) 
            || !isset($_POST['description']) 
            || !isset($_POST['price1'])) {
            $this->view->goToManageMovieTypes();
            die;
        } */
        if (is_null($movieTypeId)) {
            $this->movieTypeModel->createMovieType($_POST['genre'], $_POST['description']);
        } else {
            $this->movieTypeModel->updateMovieType($movieTypeId, $_POST['genre'], $_POST['description']);
        }
        $this->view->goToManageMovieTypes();
    }

    function deleteProductType($movieTypeId) {
        $this->authHelper->checkLoggedIn();
        $movies = $this->movieTypeModel->filter($movieTypeId);
        if (count($movies) > 0) {
            $this->view->errorOnDelete();
        } else {
            $this->movieTypeModel->deleteMovieType($movieTypeId);
            $this->view->goToManageMovieTypes();
        }
    }

    function filter($id) {
        session_start();
        //$movies = $this->model->getMovies();
        $genreType = $this->movieTypeModel->getMovieTypes();
        $movies = $this->movieTypeModel->filter($id);
        $this->view->showFilteredGenres($movies, $genreType);
    }
}
