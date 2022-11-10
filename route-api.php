<?php

require_once 'libraries/Router.php';
require_once 'controller/ApiController.php';

// crea el router
$router = new Router();

// define la tabla de ruteo
$router->addRoute('comments', 'GET', 'ApiController', 'getAll');
$router->addRoute('comments/:ID', 'GET', 'ApiController', 'get');
$router->addRoute('comments/:ID', 'DELETE', 'ApiController', 'delete');
$router->addRoute('comments/:ID', 'PUT', 'ApiController', 'put');
$router->addRoute('comments', 'POST', 'ApiController', 'post');

// rutea
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
