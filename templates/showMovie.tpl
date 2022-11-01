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




{include file="templates/footer.tpl"}