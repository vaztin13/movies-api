{include file="templates/header.tpl"}
{include file='templates/nav.tpl'}



<div class="container">

    <div class="d-flex justify-content-center" id="index-title">
        <h1>{$indexTitle}</h1>
    </div>

    <div class="d-flex align-content-stretch flex-wrap">

        {foreach from=$movies item=$movie}
            <table>
                <thead>
                    <tr>
                        <th id="title-index" colspan="2"><a href="view-movie/{$movie->id}">{$movie->title} - ({$movie->year})</a></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a href="view-movie/{$movie->id}"><img src="static/images/{$movie->image}" alt="{$movie->title}"></a></td>
                    </tr>
                    <tr>
                        <td id="genre-index">{$genreType[$movie->genre_type_id - 2]->genre}</td>
                    </tr>
                </tbody>

            </table>

        {/foreach}

    </div>
</div>
{include file="templates/footer.tpl"}