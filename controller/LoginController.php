<?php
require_once "./model/UserModel.php";
require_once "./view/LoginView.php";


class LoginController {

    private $model;
    private $view;

    function __construct() {
        $this->model = new UserModel();
        $this->view = new LoginView();
    }


    function login() {
        $this->view->showLogin();
    }

    function logout() {
        session_start();
        session_destroy();
        $this->view->showLogin("Logged Out");

        //mostrar mensaje por pantalla y redirigir a home
    }

    function verifyLogin() {
        $email = $_POST['email'];
        $password = $_POST['password'];

        // Obtengo el usuario de la base de datos
        $user = $this->model->getUser($email);

        // Si el usuario existe y las contraseñas coinciden
        if ($user && password_verify($password, $user->password)) {

            session_start();
            $_SESSION['USER_ID'] = $user->id;
            $_SESSION['USER_EMAIL'] = $user->email;
            $_SESSION['IS_LOGGED'] = true;

            header("Location: " . BASE_URL);
        } else {
            $this->view->showLogin("Acceso denegado");
        }
    }
}
