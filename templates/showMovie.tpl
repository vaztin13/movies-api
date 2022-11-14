{include file="templates/header.tpl"}
{include file='templates/nav.tpl'}


<div id="back">
    <a class="btn btn-outline-info" href="home">Volver</a>
</div>

<div class="container">
    <div class="d-flex align-items-center">
        <div class="flex-shrink-0">
            <img src="static/images/{$movie->image}" alt="{$movie->title}">
        </div>
        <div class="flex-grow-1 ms-3">
            <h1>{$movie->title}</h1>
            <h3>{$movie->director}</h3>
            <h4>{$movie->year}</h4>
            <h2 id="movie-plot">{$movie->plot}</h2>

        </div>
    </div>
</div>

<div class="container">
    <div class="comments">

        <div class="text-comment">
            <p>Dejanos tu review</p>
        </div>


        <form data-bitwarden-watching="1" id="form">
            
            <div class="mb-3">
                <label for="name" class="form-label">Nombre</label>
                <input type="hidden" id="movie_id" name="movie_id" value="{$movie->id}" required>
                <input type="hidden" id="user_id" name="user_id" value="{$user_id}" required>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            
            <div class="mb-3">
                <div class="rate">
                    <input type="radio" id="star5" name="rating" value="5" />
                    <label for="star5" title="text">5 stars</label>
                    <input type="radio" id="star4" name="rating" value="4" />
                    <label for="star4" title="text">4 stars</label>
                    <input type="radio" id="star3" name="rating" value="3" />
                    <label for="star3" title="text">3 stars</label>
                    <input type="radio" id="star2" name="rating" value="2" />
                    <label for="star2" title="text">2 stars</label>
                    <input type="radio" id="star1" name="rating" value="1" />
                    <label for="star1" title="text">1 star</label>
                </div>
            </div>
            
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">Tu comentario</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="comment" required></textarea>
            </div>

            <button type="submit" class="btn btn-primary">Enviar</button>

        </form>


        <div>
            <label for="searchBy">Rating:</label>
            <select id="searchBy">
                <option value="5">5</option>
                <option value="4">4</option>
                <option value="3">3</option>
                <option value="2">2</option>
                <option value="1">1</option>
            </select>
            <button id="search">Buscar</button>
        </div>

        <div class="comments-api">
            <h5>Comentarios</h5>

            <div id="comments">

            </div>

            <select id="sortBy">
                <option value="rating">Rating</option>
            </select>

            <select id="order">
                <option value="ASC">↑</option>
                <option value="DESC">↓ </option>
            </select>

            <button id="sort">Ordenar</button>
        </div>
    </div>
</div>


{include file="templates/footer.tpl"}