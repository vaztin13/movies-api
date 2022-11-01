<?php

require_once "controller/MovieController.php";
require_once "controller/MovieTypeController.php";
require_once "controller/LoginController.php";


define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

if (!empty($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = 'home';
}

$params = explode('/', $action);

$movieController = new MovieController();
$movieTypeController = new MovieTypeController();
$loginController = new LoginController();

switch ($params[0]) {
    case 'login':
        $loginController->login();
        break;
    case 'logout':
        $loginController->logout();
        break;
    case 'verify':
        $loginController->verifyLogin();
        break;
    case 'home':
        $movieController->showHome();
        break;
    case 'view-movie':
        $movieController->viewMovie($params[1]);
        break;
    case 'filter':
        $movieTypeController->filter($params[1]);    
    case 'admin':
        switch ($params[1]) {
            case 'manage-movies':
                $movieController->showManageMovies(isset($params[2]) ? intval($params[2]) : null);
                break;
            case 'manage-movie-types':
                $movieTypeController->showManageMovieTypes(isset($params[2]) ? intval($params[2]) : null);
                break;
            case 'addMovieToDB':
                $movieController->addMovieToDB();
                break;
            case 'deleteMovie':
                $movieController->deleteMovie($params[2]);
                break;
            case 'createMovieType':
                $movieTypeController->createMovieType();
                break;
            case 'deleteMovieType':
                $movieTypeController->deleteProductType($params[2]); 
                break;   
        }
        break;
    default:
        echo ('404 page not found');
        break;
}
