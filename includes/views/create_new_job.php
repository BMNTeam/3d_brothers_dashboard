<!--  Modal content for Create New -->
<div class="modal fade create-job-modal"  id="create-job-modal" tabindex="-1" role="dialog" aria-labelledby="create-modal-label" aria-hidden="true" style="display: none;">
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
                                <select name="package" id="package-dropdown" style="width: 65%;" class="select2_jobs">
                                    <option>-- Select Package --</option>
                                    <option>Package 1</option>
                                    <option>Package 2</option>
                                    <option>Package 3</option>
                                    <option>Package 4</option>
                                    <option>Package 5</option>
                                </select>
                            </div>
                            <div class="label-input">
                                <label for="name-input">Name</label>
                                <input name="name" type="text" placeholder="Default equal with scene name" />
                            </div>
                            <div class="label-input">
                                <label for="frame-range-input">Frame Range</label>
                                <input name="frame-range" type="text" />
                                <span class="md md-info-outline info-button" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tooltip on top"></span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="label-input">
                                <label for="scene-input">Scene</label>
                                <select name="scene"  style="width: 65%;" class="select2_jobs">
                                    <option>-- Select Scene --</option>
                                    <option>Scene 1</option>
                                    <option>Scene 2</option>
                                    <option>Scene 3</option>
                                    <option>Scene 4</option>
                                    <option>Scene 5</option>
                                    <option>Scene 6</option>
                                    <option>Scene 7</option>
                                </select>
                            </div>
                            <div class="label-input">
                                <label for="scene-input">Camera</label>
                                <select name="camera" style="width: 65%;" class="select2_jobs">
                                    <option>-- Select Camera --</option>
                                    <option>Camera 1</option>
                                    <option>Camera 2</option>
                                    <option>Camera 3</option>
                                    <option>Camera 4</option>
                                    <option>Camera 5</option>
                                    <option>Camera 6</option>
                                    <option>Camera 7</option>
                                </select>
                            </div>
                            <div class="label-input">
                                <label for="budget-input">Budget</label>
                                <input name="Budget" type="text" placeholder="Default equal with scene name" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="label-input render">
                                <label for="draft-checkbox">Render Video Draft</label>
                                <input name="render-video-drafts" type="checkbox" id="draft-checkbox" />
                                <span class="extra-info">This option is available for animations with more than 30 frames. This will render a video playing at 30 fps and it's to be used for versioning your renders and gathering fast feedback. It's a free feature for all user categories while it is still in beta testing.</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                           <div class="pane-content--wrapper clearfix">

                               <p class="pane-title">
                                   <span class="title-text">Draft Details <span class="indicator"><span class="fa fa-angle-down"></span><span class="fa fa-angle-up hide"></span></span></span>
                               </p>
                               <div class="pane-content">
                                   <div class="col-sm-6">
                                       <div class="label-input">
                                           <label for="artist-input">Artist Name</label>
                                           <input name="artist" type="text" placeholder="Name of the artist who created or setup the scene" />
                                       </div>
                                   </div>
                                   <div class="col-sm-6">
                                       <div class="label-input">
                                           <label for="version-input">Version</label>
                                           <input name="version" type="text" placeholder="Scene Version" />
                                       </div>
                                   </div>
                               </div>
                           </div>

                           </div>

                    </div>
                    <div class="clearfix">
                        <div class="form-buttons pull-right bmn-jobs--buttons">
                            <button id="create-button" name="create" class="create--button">Create</button>
                            <button id="create-submit-button" name="create_and_submit">Create &amp; Submit</button>
                        </div>
                    </div>
                </form>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->