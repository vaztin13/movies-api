<?php

require_once "./libraries/smarty-4.2.1/libs/Smarty.class.php";
require_once "./helpers/AuthHelper.php";

class MovieView {

    private $smarty;

    function __construct() {
        $this->smarty = new Smarty();
    }

    function showMovies($movies, $genreType) { //refactoring smarty
        session_start(); //para q muestre logout y admin
        $this->smarty->assign('indexTitle', 'Todas las películas');
        $this->smarty->assign('movies', $movies);
        $this->smarty->assign('genreType', $genreType);
        //$this->smarty->assign('index', $index); //add
        $this->smarty->display('templates/index.tpl');
    }

    function showHomeLocation() {
        header("Location: " . BASE_URL . "home");
    }




    function showManageMovies($movies, $genreType, $index) {
        $this->smarty->assign('active', 'manage-movies');
        $this->smarty->assign('movies', $movies);
        $this->smarty->assign('genreType', $genreType);
        $this->smarty->assign('index', $index);
        $this->smarty->display('templates/admin/manageMovies.tpl');
    }

    function goToManageMovies() {
        header("Location: ".BASE_URL."admin/manage-movies");
    }

    function showManageMovieTypes($movieTypes, $index) {
        $this->smarty->assign('active', 'manage-movie-types');
        $this->smarty->assign('movieTypes', $movieTypes);
        $this->smarty->assign('index', $index);
        $this->smarty->display('templates/admin/manageMovieTypes.tpl');
    }

    function goToManageMovieTypes() {
        header("Location: ".BASE_URL."admin/manage-movie-types");
    }

    function showMovie($movie, $movies, $genreType) {
        $this->smarty->assign('genreType', $genreType);
        $this->smarty->assign('movies', $movies);
        $this->smarty->assign('movie', $movie);
        $this->smarty->display('templates/showMovie.tpl');
    }

    function showFilteredGenres($movies, $genreType) {
        $this->smarty->assign('genreType', $genreType);
        $this->smarty->assign('movies', $movies);
        $this->smarty->display('templates/showGenre.tpl');
    }

    function showOptions($genre) {
        $this->smarty->assign('genre', $genre);
        $this->smarty->display('templates/index.tpl');
    }

    function showLoginLocation() {
        header("Location: " . BASE_URL . "login");
    }

    function errorOnDelete() {
        $this->smarty->display('templates/error-delete.tpl');
    }
}
