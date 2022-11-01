{include file='templates/admin/header.tpl'}
<main id="main">
    <section class="container p-3">
        <h3>{if isset($index)}Modificar {$movieTypes[$index -1]->genre}{else}Agregar categoría{/if}</h3>
        <form action="admin/createMovieType" method="POST" class="row">
            <input type="hidden" name="id" value="{if isset($index)}{$movieTypes[$index -1]->id}{/if}">
            <div class="col-md-3 p-3">
                <label for="genre" class="form-label">Nombre:</label>
                <input type="text" name="genre" id="genre" class="form-control"
                    value="{if isset($index)}{$movieTypes[$index -1]->genre}{/if}" required>
            </div>
            <div class="col-md-3 p-3">
                <label for="description" class="form-label">Descripción:</label>
                <textarea class="form-control" name="description" id="description"
                    rows="3">{if isset($index)}{$movieTypes[$index -1]->description}{/if}</textarea>
            </div>
            <div class="d-grid justify-content-md-end">
                <input type="submit" value="{if isset($index)}Modificar{else}Agregar{/if}"
                    class="btn btn-success btn-sm">
            </div>
        </form>
    </section>
    <section class="container table-responsive p-3">
        <h3>Lista de categorías</h3>
        <table class="table align-middle">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Genero</th>
                    <th scope="col">Descripción</th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$movieTypes item=movieType}
                    <tr>
                        <th scope="row">{$movieType->id}</th>
                        <td>{$movieType->genre}</td>
                        <td>{$movieType->description}</td>
                        <td><a href="admin/manage-movie-types/{counter}" type="button"
                                class="btn btn-warning btn-sm">Modificar</a></td>
                        <td><a href="admin/deleteMovieType/{$movieType->id}" type="button"
                                class="btn btn-danger btn-sm">Borrar</a></td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </section>
</main>
{include file='templates/admin/footer.tpl'}