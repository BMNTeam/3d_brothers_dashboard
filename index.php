<?php require 'includes/header_start.php'; ?>

<link href="../plugins/jquery-circliful/css/jquery.circliful.css" rel="stylesheet" type="text/css" />

<?php require 'includes/header_end.php'; ?>



<!-- Page-Title -->
<div class="row">
    <div class="col-sm-12">
        <div class="page-title-box">

            <h4 class="page-title">Welcome to CGIFarm Dashboard!</h4>
        </div>
    </div>
</div>






<div class="row">
    <div class="col-lg-6">
        <div class="card-box">

            <div class="widget-chart text-center">
                <div class="btn-group pull-left m-b-20 fix-chart-on-tablet">
                    <button type="button" class="btn btn-default dropdown-toggle waves-effect" data-toggle="dropdown" aria-expanded="false"> 
                        CGIFarm 3D Logo / Camera 1 Drop <span class="caret"></span> </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">Dropdown link 1</a></li>
                        <li><a href="#">Dropdown link 2</a></li>
                        <li><a href="#">Dropdown link 3</a></li>
                    </ul>
                </div>
                <div id="sparkline5" class="sparklines"></div>
                <ul class="list-inline m-t-15">
                    <li>
                        <h5 class="text-muted m-t-20">Credit Used</h5>
                        <h4 class="m-b-0">0.6</h4>
                    </li>
                    <li>
                        <h5 class="text-muted m-t-20">Frames</h5>
                        <h4 class="m-b-0">20 / 5540</h4>
                    </li>
                    <li>
                        <h5 class="text-muted m-t-20">Progress</h5>
                        <h4 class="m-b-0">0.36%</h4>
                    </li>
                    <li>
                        <h5 class="text-muted m-t-20">~ Final Cost</h5>
                        <h4 class="m-b-0">166</h4>
                    </li>
                </ul>
            </div>
        </div>

    </div>

    <div class="col-lg-6">
        <div class="card-box">
            <h4 class="header-title m-t-0 m-b-30">Monthly Number of Frames</h4>

            <div class="widget-chart text-center">
                <div id="sparkline6" class="sparklines" ></div>
                <ul class="list-inline m-t-15">
                    <li>
                        <h5 class="text-muted m-t-20">Total Frames</h5>
                        <h4 class="m-b-0">104500</h4>
                    </li>
                    <li>
                        <h5 class="text-muted m-t-20">Average Frame Cost</h5>
                        <h4 class="m-b-0">3</h4>
                    </li>
                    <li>
                        <h5 class="text-muted m-t-20">Total Cost</h5>
                        <h4 class="m-b-0">313 500</h4>
                    </li>
                </ul>
            </div>
        </div>

    </div>


</div>
<!-- end row -->




<div class="row">
    <div class="col-lg-12">
        <div class="card-box">
            <h4 class="header-title m-t-0">Latest Projects</h4>
            <p class="text-muted m-b-25 font-13">
                Everything is according to plan...
            </p>

            <?php include_once('includes/table/job/table_jobs.php'); ?>
        </div>
    </div>
    <!-- end col -12 -->


</div>
<!-- end row -->






<?php require 'includes/footer_start.php' ?>



<?php require 'includes/footer_end.php' ?>
