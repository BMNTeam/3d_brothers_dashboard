<!--  Modal content for Create New -->
<div class="modal fade create-job-modal" tabindex="-1" role="dialog" aria-labelledby="create-modal-label" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="create-modal-label">Create New Render Job</h4>
            </div>
            <div class="modal-body">
                <form class="create-job-form">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="label-input">
                                <label for="package-dropdown">Package</label>
                                <select id="package-dropdown">
                                    <option>-- Select Package --</option>
                                </select>
                            </div>
                            <div class="label-input">
                                <label for="name-input">Name</label>
                                <input type="text" placeholder="Default equal with scene name" />
                            </div>
                            <div class="label-input">
                                <label for="frame-range-input">Frame Range</label>
                                <input type="number" />
                                <span class="md md-info-outline info-button" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tooltip on top"></span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="label-input">
                                <label for="scene-input">Scene</label>
                                <select id="package-dropdown">
                                    <option>-- Select Package --</option>
                                </select>
                            </div>
                            <div class="label-input">
                                <label for="scene-input">Scene</label>
                                <select id="scene-dropdown">
                                    <option>-- Select Scene --</option>
                                </select>
                            </div>
                            <div class="label-input">
                                <label for="budget-input">Budget</label>
                                <input type="number" placeholder="Default equal with scene name" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="label-input render">
                                <label for="draft-checkbox">Render Video Draft</label>
                                <input type="checkbox" id="draft-checkbox" />
                                <span class="extra-info">This option is available for animations with more than 30 frames. This will render a video playing at 30 fps and it's to be used for versioning your renders and gathering fast feedback. It's a free feature for all user categories while it is still in beta testing.</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <p class="pane-title">
                                <span class="title-text">Draft Details <span class="indicator"><span class="fa fa-angle-down"></span><span class="fa fa-angle-up hide"></span></span></span>
                            </p>
                        </div>
                        <div class="pane-content">
                            <div class="col-sm-6">
                                <div class="label-input">
                                    <label for="artist-input">Artist Name</label>
                                    <input type="text" placeholder="Name of the artist who created or setup the scene" />
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="label-input">
                                    <label for="version-input">Version</label>
                                    <input type="text" placeholder="Scene Version" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                        <div class="form-buttons pull-right">
                            <button id="create-button">Create</button>
                            <button id="create-submit-button">Create &amp; Submit</button>
                        </div>
                    </div>
                </form>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>