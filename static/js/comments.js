"use strict";

document.addEventListener("DOMContentLoaded", function(event) {
    const BASE_URL = "http://localhost/movies-api/api/comments";
    
    let form = document.querySelector("#form");
    if (form) {
        form.addEventListener("submit", postComment);
    }
    
    let commentsView = document.querySelector("#comments");
    if (commentsView) {
        getComments();
    }


    /**
     * Postea un comentario
     */
    async function postComment(e) {
        console.log(`Posting comment.`);
        e.preventDefault();
        let formData = new FormData(this);
        let comment = {
            movie_id : formData.get("movie_id"),
            user_id : formData.get("user_id"),
            name : formData.get("name"),
            comment : formData.get("comment"),
            rating : formData.get("rating")
        };
        try {
            const response = await fetch(BASE_URL, { 
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(comment)
            });
            if (response.ok) {
                let json = await response.text();
                console.log(json);
                getComments();
            } else {
                console.log("Status de respuesta inválido");
            }
        } catch(e) {
            console.log(e);
        }    
    }


    /**
     * Busca comentarios y los muestra
     */
    async function getComments() {
        fetchComments(null, null, null);
    }

    /**
     * Busca comentarios x rating
     */
    let search = document.querySelector("#search");
    if (search) {
        search.addEventListener("click", async function () {
            let searchBy = document.querySelector("#searchBy").value;
            console.log(`Searching comments searchBy=${searchBy}.`);
            fetchComments(searchBy, null, null);
        });
    }
    

    /**
     * "Ordenar" ordena los comentarios por el criterio y dirección seleccionados
     */
    let sort = document.querySelector("#sort");
    if (sort) { 
        sort.addEventListener("click", async function () {
            let sortBy = document.querySelector("#sortBy").value;
            let order = document.querySelector("#order").value;
            fetchComments(null, sortBy, order);
        });
    }

    /**
     * Return url to get
     */
    async function fetchComments(searchBy, sortBy, order) {
        console.log(`Fetching comments searchBy=${searchBy},sortBy=${sortBy},order=${order}.`);
        try {
            let commentsView = document.querySelector("#comments");
            commentsView.innerHTML = `<tr>
                                        <td colspan="4">Loading comments...</td>
                                    </tr>`;
            let url = getUrl(searchBy, sortBy, order);
            console.log(url);
            const response = await fetch(url);
            if (response.ok) {
                let comments = await response.json();
                console.log(comments);
                showComments(comments);
            } else {
                console.log("Status de respuesta inválido");
            }
        } catch(e) {
            console.log(e);
        }    
    }

    /**
     * Return to get url sortBy - order
     */
    function getUrl(searchBy, sortBy, order) {
        let url = BASE_URL;
        if (searchBy || sortBy && order) {
            url += `?`;
            if (searchBy) {
                url += `rating=${searchBy}&`
            }
            if (sortBy && order) {
                url+=`sortBy=${sortBy}&order=${order}`;
            }
        }
        return url;
    }


    function showComments(comments) {
        let html = "<ul>";
        for (let index = 0; index < comments.length; index++) {
            const comment = comments[index];
            html += `<li><p>Comentario #${comment.id} Autor:${comment.name} Rating:${comment.rating}</p><p>${comment.comment}</p></li>`
        }
        html += "</ul>";
        commentsView.innerHTML = html;   
    }

});
