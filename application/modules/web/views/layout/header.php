<header>
    <div class=" fluid-container top-head  pb-0">
        <div class="row top-text text-white">
            <div class="col-xs-12 col-sm-6 col-md-6">
                <div class="row top-class">
                    <div class="col-xs-12 col-sm-3 col-md-6 w-39">
                        <i class="fas fa-phone-alt"></i>
                        <a href="#" class="ancer">+39 090.673782</a>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <i class="far fa-envelope head" style="color: #d0dcf1;"></i>
                        <a href="#" class="ancer">info@giuntabus.com</a>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 text-end">
                <a href="">II mio account</a>
            </div>
        </div>
    </div>
</header>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-white head-second">
    <div class="container pl-90">
        <a class="navbar-brand" href="#"><img  src="<?= base_url();?>website/images/logo_sito_footer.png" /></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="pl-125 collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav  mb-2 mb-lg-0 d-flex">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<?=base_url(); ?>">HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="<?=base_url('web/guintabus'); ?>">GIUNTABUS SRL</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        ORARI
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item plane-text" href="<?=base_url('web/MessinaPellegrino'); ?>">Messina-Pellegrino</a></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item plane-text" href="<?=base_url('web/MilazzoMessina'); ?>">Milazzo-Messina</a></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item plane-text" href="<?=base_url('web/MessinaMilazzo'); ?>">Messina-Milazzo</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="<?=base_url('web/MilazzoAeroportoCatania'); ?>">MILAZZO – AEROPORTO CATANIA</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="<?=base_url('web/contact'); ?>">CONTATTI</a>
                </li>
            </ul>
            <form class="d-flex">
                <i class="fa fa-search" data-bs-toggle="modal" data-bs-target="#searchModal"></i>
            </form>
        </div>
    </div>
</nav>