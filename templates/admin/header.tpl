<!DOCTYPE html>
<html lang="en">

<head>
    <base href="{BASE_URL}" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>IMDV Admin</title>
</head>

<body>
    <!-- Header -->
    <header class="container p-3">
        <nav>
            <h1>IMDV Admin</h1>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <a href="home" class="btn btn-primary btn-sm">Home</a>
                {if $active != null}
                    <a href="logout" class="btn btn-outline-danger btn-sm">Logout</a>
                {/if}
            </div>
            {if $active != null}
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a href="admin/manage-movies"
                            class="nav-link text-dark {if $active == 'manage-movies'}active{/if}">Administrar Peliculas</a>
                    </li>
                    <li class="nav-item"><a href="admin/manage-movie-types"
                            class="nav-link text-dark {if $active == 'manage-movie-types'}active{/if}">Administrar
                            Categorías</a>
                    </li>
                    {* <li class="nav-item"><a href="admin/manageUsers" class="nav-link text-dark {if $active == 'manageUsers'}active{/if}">Administrar Usuarios</a></li> *}
                </ul>
            {/if}
        </nav>
</header>