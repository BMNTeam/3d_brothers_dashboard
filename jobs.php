<?php require 'includes/header_start.php'; ?>

<link href="../plugins/jquery-circliful/css/jquery.circliful.css" rel="stylesheet" type="text/css" />

<?php require 'includes/header_end.php'; ?>


<div class="row">
    <h2 class="page-title" id="jobs_page">Jobs Page</h2>
    <a class="upload-modal-launcher pull-right" href="#upload" data-toggle="modal" data-target=".create-job-modal">Create New</a>
</div>

    <?php include_once('includes/views/create_new_job.php'); ?>

<div class="row">
    <div class="col-sm-12 jobs-paginate">
        <?php include_once('includes/table/job/table_jobs.php'); ?>
    </div>
</div>
    
<?php require 'includes/footer_start.php' ?>

<!-- circliful Chart -->
<script src="assets/plugins/jquery-circliful/js/jquery.circliful.min.js"></script>




<?php require 'includes/footer_end.php' ?>