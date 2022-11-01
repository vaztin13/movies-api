<?php

require_once "./helpers/AuthHelper.php";



class MovieTypeModel {

    private $db;
    private $authHelper;

    function __construct() {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=movie;charset=utf8', 'root', '');
    }

    function getMovieTypes() {
        $sentence = $this->db->prepare("SELECT * FROM movie_type");
        $sentence->execute();
        return $sentence->fetchAll(PDO::FETCH_OBJ);
    }

    function getMovieType($id) {
        $sentence = $this->db->prepare("SELECT * FROM movie_type WHERE id = ?");
        $sentence->execute(array($id));
        return $sentence->fetch(PDO::FETCH_OBJ);
    }

    function createMovieType($genre, $description) {
        $sentence = $this->db->prepare("INSERT INTO movie_type (genre,description) VALUES(?,?)");
        $sentence->execute(array($genre, $description));
    }

    function updateMovieType($id, $genre, $description) {
        $sentence = $this->db->prepare("UPDATE movie_type SET genre = ?, description = ? WHERE id = ?");
        $sentence->execute(array($genre, $description, $id));
    }

    function deleteMovieType($movieTypeId) {
        $sentence = $this->db->prepare("DELETE FROM movie_type WHERE id = ?");
        $sentence->execute(array($movieTypeId));
    }

    function filter($id) {
        $sentence = $this->db->prepare("SELECT * FROM movies WHERE genre_type_id = ?");
        $sentence->execute(array($id));
        $movies = $sentence->fetchAll(PDO::FETCH_OBJ);
        return $movies;
    }

}