<?php

require_once 'libraries/Router.php';
require_once 'controller/ApiController.php';

// crea el router
$router = new Router();

// define la tabla de ruteo
$router->addRoute('movies', 'GET', 'ApiController', 'getAll');
$router->addRoute('movies/:ID', 'GET', 'ApiController', 'get');
$router->addRoute('movies/:ID', 'DELETE', 'ApiController', 'delete');
$router->addRoute('movies/:ID', 'PUT', 'ApiController', 'put');
$router->addRoute('movies', 'POST', 'ApiController', 'post');

// rutea
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
