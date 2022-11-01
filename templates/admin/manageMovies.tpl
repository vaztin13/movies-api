{include file='templates/admin/header.tpl'}
<main id="main">
    <section class="container p-3">
        <h3>{if isset($index)}Modificar {$movies[$index -1]->title}{else}Agregar pelicula{/if}</h3>
        <form action="admin/addMovieToDB" method="POST" class="row">
            <input type="hidden" name="id" value="{if isset($index)}{$movies[$index -1]->id}{/if}">
            <div class="col-md-3 p-3">
                <label for="title" class="form-label">Titulo pelicula</label>
                <input type="text" name="title" class="form-control" id="name"
                    value="{if isset($index)}{$movies[$index -1]->title}{/if}" required>
            </div>
            <div class="col-md-3 p-3">
                <label for="image" class="form-label">Imagen</label>
                <input type="text" name="image" class="form-control" id="image"
                    value="{if isset($index)}{$movies[$index -1]->image}{/if}">
            </div>
            <div class="col-md-3 p-3">
                <label for="plot">Sinopsis</label>
                <textarea class="form-control" name="plot" id="plot"
                    rows="3">{if isset($index)}{$movies[$index -1]->plot}{/if}</textarea>
            </div>
            <div class="col-md-3 p-3">
                <label for="genreType" class="form-label">Genero</label>
                <select name="genre_type_id" class="form-select">
                    {foreach from=$genreType item=genre}
                        <option value="{$genre->id}" {if isset($index) && $movies[$index -1]->genre_type_id == $genre->id}
                            selected {/if}>
                            {$genre->genre}
                        </option>
                    {/foreach}
                </select>
            </div>
            <div class="col-md-3 p-3">
                <label for="year">Año</label>
                <input type="text" class="form-control" name="year" id="year"
                    value="{if isset($index)}{$movies[$index -1]->year}{/if}" required>
            </div>
            <div class="col-md-3 p-3">
                <label for="director">Director</label>
                <input type="text" class="form-control" name="director" id="director"
                    value="{if isset($index)}{$movies[$index -1]->director}{/if}" required>
            </div>
            <div class="d-grid justify-content-md-end">
                <input type="submit" value="{if isset($index)}Modificar{else}Agregar{/if}"
                    class="btn btn-success btn-sm">
            </div>
        </form>
    </section>
    <section class="container table-responsive p-3">
        <h3>Lista de productos</h3>
        <table class="table align-middle">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Titulo</th>
                    <th scope="col">Imagen</th>
                    <th scope="col">Sinopsis</th>
                    <th scope="col">Categoría</th>
                    <th scope="col">Año</th>
                    <th scope="col">Director</th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$movies item=movie}
                    <tr>
                        <th scope="row">{$movie->id}</th>
                        <td>{$movie->title}</td>
                        <td>{$movie->image}</td>
                        <td>{$movie->plot}</td>
                        {* <td>{$movie->year}</td> *}
                        <td>{$genreType[$movie->genre_type_id - 2]->genre}</td>
                        <td>{$movie->year}</td>
                        <td>{$movie->director}</td>
                        <td><a href="admin/manage-movies/{counter}" type="button"
                                class="btn btn-warning btn-sm">Modificar</a></td>
                        <td><a href="admin/deleteMovie/{$movie->id}" type="button" class="btn btn-danger btn-sm">Borrar</a>
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </section>
</main>
{include file='templates/admin/footer.tpl'}