<?php

class ApiCommentModel { 

    private $db;

    function __construct() {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=movie;charset=utf8', 'root', '');
    }

    // API


    // GET

    function getComments() {    
        $sentence = $this->db->prepare("SELECT * from comment");
        $sentence->execute();
        $comments = $sentence->fetchAll(PDO::FETCH_OBJ);
        return $comments;
    }

    // GET/:ID

    function getComment($id) {  
        $sentence = $this->db->prepare("SELECT * from comment WHERE id = ?");
        $sentence->execute(array($id));
        $comment = $sentence->fetch(PDO::FETCH_OBJ);
        return $comment;
    }

    // POST

    function addComment($comment, $user_id, $name, $movie_id, $rating){
        $sentence = $this->db->prepare("INSERT INTO comment(comment, user_id, name, movie_id, rating) VALUES(?, ?, ?, ?, ?)");
        $sentence->execute(array($comment, $user_id, $name, $movie_id, $rating)); //Esto modifica orden de ejecucion en db
        return $this->db->lastInsertId(); 
    }

    // PUT/:ID

    function updateComment($id ,$comment, $user_id, $name, $movie_id, $rating) {
        $sentence = $this->db->prepare("UPDATE comment SET comment = ?, user_id = ?, name = ?, movie_id = ?, rating = ? WHERE id = ?");
        $sentence->execute(array($comment, $user_id, $name, $movie_id, $rating, $id));                                                    
    }
    
    // DELETE/:ID

    function deleteComment($id) {
        $sentence = $this->db->prepare("DELETE FROM comment WHERE id = ? ");
        $sentence->execute(array($id));
    }
    
    // FILTER

    function findCommentsByRating($genre) {
        $sentence = $this->db->prepare("SELECT * FROM comment WHERE rating = ?");
        $sentence->execute(array($genre));
        $comments = $sentence->fetchAll(PDO::FETCH_OBJ);
        return $comments; 
    }

    // PAGINATE

    function paginate($page, $limit, $offset) {
        $sentence = $this->db->prepare("SELECT * FROM comment LIMIT $limit OFFSET $offset");
        $sentence->execute();
        $comments = $sentence->fetchAll(PDO::FETCH_OBJ);
        return $comments; 
    }

    // SORT & ORDER

    function sortAndOrder($sortBy, $order) {
        $sentence = $this->db->prepare("SELECT * FROM comment ORDER BY $sortBy $order");
        $sentence->execute();
        $comments = $sentence->fetchAll(PDO::FETCH_OBJ);
        return $comments; 
    }

    // validaciones

    function isValid($field) {
        return in_array($field, ['id', 'comment', 'user_id', 'name', 'movie_id', 'rating']);
    }

    function getMovieId($id) {
        $sentence = $this->db->prepare("SELECT * FROM comment WHERE movie_id = ?");
        $sentence->execute(array($id));
        $comments = $sentence->fetchAll(PDO::FETCH_OBJ);
        return $comments; 
    }

}