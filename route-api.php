<?php

require_once 'libraries/Router.php';
require_once 'controller/ApiController.php';

// crea el router
$router = new Router();

// define la tabla de ruteo
$router->addRoute('movies', 'GET', 'ApiController', 'getAll');
//$router->addRoute('tareas', 'POST', 'ApiController', 'crearTarea');
$router->addRoute('movies/:ID', 'GET', 'ApiController', 'get');

// rutea
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
