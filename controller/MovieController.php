<?php
require_once "./model/MovieModel.php";
require_once "./model/MovieTypeModel.php";
require_once "./view/MovieView.php";
require_once "./helpers/AuthHelper.php";


class MovieController {

    private $model;
    private $movieTypeModel;
    private $view;
    private $authHelper;

    function __construct() {
        $this->movieTypeModel = new MovieTypeModel();
        $this->model = new MovieModel();
        $this->view = new MovieView();
        $this->authHelper = new authHelper();
    }

    function showHome() {
        //session_start();
        //$this->authHelper->checkLoggedIn(); //se tiene q poner en todas las paginas menos en login controller para evitar bucle de 
                                // redireccionamiento
        $movies = $this->model->getMovies();
        $genreType = $this->movieTypeModel->getMovieTypes(); //llamo funcion sql que selecciona categoria
        $this->view->showMovies($movies, $genreType);

    }



    function addMovieToDB() {
        $this->authHelper->checkLoggedIn();
        $movieId = $_POST['id'] !== '' ? $_POST['id'] : null;
/*         if (!isset($_POST['title']) 
            || !isset($_POST['plot']) 
            || !isset($_POST['image']) 
            || !isset($_POST['genreTypeId']) ) {
            $this->view->goToManageMovies();
            die;
        } */
        if (is_null($movieId)) {
            $title = $_POST['title'];
            $genre = $_POST['genre_type_id'];
            $image = $_POST['image'];
            $plot = $_POST['plot'];
            $year = $_POST['year'];
            $director = $_POST['director'];
            $this->model->addMovie($title, $genre, $image, $plot, $year, $director);
        } else {
            $this->model->updateMovie($movieId, $_POST['title'], $_POST['genre_type_id'], $_POST['image'], $_POST['plot'], $_POST['year'], $_POST['director']);
        }
        $this->view->goToManageMovies();
    }



    function showManageMovies($index) {
        $this->authHelper->checkLoggedIn();
        $movies = $this->model->getMovies();
        $genreType = $this->movieTypeModel->getMovieTypes(); //CATEGORIA
        $this->view->showManageMovies($movies, $genreType, $index);
    }

    function deleteMovie($id) {
        $this->authHelper->checkLoggedIn();
        $this->model->deleteMovieFromDB($id);
        $this->view->goToManageMovies();
    }

    function viewMovie($id) {
        //$this->authHelper->checkLoggedIn(); //usuario deslogeado puede ver detalles
        $genreType = $this->movieTypeModel->getMovieTypes();
        $movies = $this->movieTypeModel->filter($id);
        $moviesSelected = $this->model->getMovie($id);
        $this->view->showMovie($moviesSelected, $movies, $genreType);
    }

    function showGenreTypes() {
        $movies = $this->model->getMovies();
        $genreType = $this->movieTypeModel->getMovieTypes();
        $this->view->showMovies($genreType, $movies);
    }

}