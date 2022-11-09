<?php

class MovieModel {


    private $db;

    function __construct() {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=movie;charset=utf8', 'root', '');
    }


    function getMovies() {    
        $sentence = $this->db->prepare("SELECT * from movies");
        $sentence->execute();
        $movies = $sentence->fetchAll(PDO::FETCH_OBJ);
        return $movies;
    }

    function addMovie($title, $genre, $image, $plot, $year, $director){
        $sentence = $this->db->prepare("INSERT INTO movies(title, genre_type_id, plot, image, year, director) VALUES(?, ?, ?, ?, ?, ?)");
        $sentence->execute(array($title, $genre, $plot, $image, $year, $director)); //Esto modifica orden de ejecucion en db
        return $this->db->lastInsertId(); //BORRAR MODEL COMENTARIOS
    }

    function updateMovie($id ,$title, $genreType, $image, $plot, $year, $director) {
        $sentence = $this->db->prepare("UPDATE movies SET title = ?, plot = ?, image = ?, genre_type_id = ?, year = ?, director = ? WHERE id = ?");
        $sentence->execute(array($title, $plot, $image, $genreType, $year, $director, $id));                                                    
    }

    function deleteMovieFromDB($id) {
        $sentence = $this->db->prepare("DELETE FROM movies WHERE id = ? ");
        $sentence->execute(array($id));
    }

    function getMovie($id) {  
        $sentence = $this->db->prepare("SELECT * from movies WHERE id = ?");
        $sentence->execute(array($id));
        $movie = $sentence->fetch(PDO::FETCH_OBJ);
        return $movie;
    }



    // API

    function findMoviesByGenre($genre) {
        $sentence = $this->db->prepare("SELECT * FROM movies WHERE genre_type_id = ?");
        $sentence->execute(array($genre));
        $movies = $sentence->fetchAll(PDO::FETCH_OBJ);
        return $movies; 
    }

    function paginate($page, $limit) {
        $sentence = $this->db->prepare("SELECT * FROM movies LIMIT $limit OFFSET $page");
        $sentence->execute();
        $movies = $sentence->fetchAll(PDO::FETCH_OBJ);
        return $movies; 
    }

    function sortAndOrder($sortBy, $order) {
        $sentence = $this->db->prepare("SELECT * FROM movies ORDER BY $sortBy $order");
        $sentence->execute();
        $movies = $sentence->fetchAll(PDO::FETCH_OBJ);
        return $movies; 
    }

    // validaciones

    function isValid($field) {
        return in_array($field, ['id', 'title', 'plot', 'genre_type_id', 'year', 'director']);
    }


}