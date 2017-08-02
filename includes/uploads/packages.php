<?php require 'includes/header_start.php'; ?>

<link href="../plugins/jquery-circliful/css/jquery.circliful.css" rel="stylesheet" type="text/css" />

<?php require 'includes/header_end.php'; ?>


<div class="row">
    <h2 class="page-title" id="#packages_form">Package Uploading Page</h2>
    <a class="upload-modal-launcher pull-right" href="#upload" data-toggle="modal" data-target=".upload-package-modal">Create New</a>
    

    <?php include_once('includes/views/packages-info.php'); ?>
    
    <div class="table-responsive">
                <table class="table " id="datatable-editable-packages">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Package Name</th>
                        <th>Size</th>
                        <th>Software</th>
                        <th>Total Rendered Frames</th>
                        <th>Total Time</th>
                        <th>Cost</th>
                        <th>Upload Date</th>
                        <th>Last Render</th>
                        <th>Status</th>
                        <th class="actions">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>CGIFarm Logo</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>10/24/2016</td>
                        <td>-</td>
                        <td><span class="label label-warning">Rendering</span></td>
                        <td>
                            <a data-target="#message-info--wrapper" href="#message-info--wrapper" data-toggle="modal" class="package-info"><span class="action-button info-button"><i
                                            class="md md-info"></i></span></a>
                            <a class="delete-job remove-row"><span class="action-button delete-button"><i
                                            class="ti-trash"></i></span></a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Girl On Fire</td>
                        <td>2 GB</td>
                        <td>3DS Max</td>
                        <td>10450</td>
                        <td>21h 6m 18s</td>
                        <td>450c</td>
                        <td>08/24/2016</td>
                        <td>09/24/2016</td>
                        <td><span class="label label-info">Completed</span></td>
                        <td>
                            <a data-target="#message-info--wrapper" href="#message-info--wrapper" data-toggle="modal" class="package-info"><span class="action-button info-button"><i
                                            class="md md-info"></i></span></a>
                            <a class="delete-job remove-row"><span class="action-button delete-button"><i
                                            class="ti-trash"></i></span></a>
                        </td>
                    </tr>


                    </tbody>
                </table>
    </div>
</div>
    <div id="dialog" class="modal-block mfp-hide">
        <section class="panel panel-info panel-color">
            <header class="panel-heading">
                <h2 class="panel-title">Are you sure?</h2>
            </header>
            <div class="panel-body">
                <div class="modal-wrapper">
                    <div class="modal-text">
                        <p>Are you sure that you want to delete this?</p>
                    </div>
                </div>

                <div class="row m-t-20">
                    <div class="col-md-12 text-right">
                        <button id="dialogConfirm" class="btn btn-primary waves-effect waves-light bmn-team--confirm">Confirm</button>
                        <button id="dialogCancel" class="btn btn-default waves-effect">Cancel</button>
                    </div>
                </div>
            </div>

        </section>
    </div>


<?php require 'includes/footer_start.php' ?>
<script src="assets/plugins/custombox/dist/custombox.min.js"></script>
<script src="assets/plugins/custombox/dist/legacy.min.js"></script>


<script src="assets/plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
<script src="assets/plugins/jquery-datatables-editable/jquery.dataTables.js"></script>
<script src="assets/plugins/datatables/dataTables.bootstrap.js"></script>
<script src="assets/plugins/tiny-editable/mindmup-editabletable.js"></script>
<script src="assets/plugins/tiny-editable/numeric-input-example.js"></script>

<script src="assets/pages/datatables.editable.init.js"></script>

<script>
    $('#mainTable').editableTableWidget().numericInputExample().find('td:first').focus();
    $('#job-table').editableTableWidget();//.numericInputExample().find('td:first').focus();
    $('.upload-table').editableTableWidget();
    $('.package-table').editableTableWidget();
</script>

<?php require 'includes/footer_end.php' ?>