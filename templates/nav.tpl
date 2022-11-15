<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">IMDV</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="home">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        Generos
                    </a>
                    <ul class="dropdown-menu">
                        {foreach from=$genreType item=genre}
                            <li><a class="dropdown-item" href="filter/{$genre->id}">{$genre->genre}</a></li>
                        {/foreach}
                    </ul>
                </li>
                {if !isset($smarty.session.USER_EMAIL)}
                    <li class="nav-item">
                        <a class="nav-link" href="login">Login</a>
                    </li>
                {else}
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout({$smarty.session.USER_EMAIL})</a>
                    </li>
                {/if}
            </ul>
        </div>
    </div>
</nav>