<?php

class AuthHelper {

    function __construct() {
    
    }

    function checkLoggedIn() {
        session_start();
        if (!isset($_SESSION['USER_EMAIL'])) { //check rol para borrar/edit/add
            header("Location: " . BASE_URL . "login"); 
            die;
        }
    }

    //ADDED
/*     function getLoggedRole() {
        if (!isset($_SESSION)) {
            session_start();
        }
        if (isset($_SESSION["role"]) && !empty($_SESSION["role"])) {
            return $_SESSION["role"];
        }
        return null;
    } */
}
