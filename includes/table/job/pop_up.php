<div class="bmn-overlay--wrapper ">

    <div class="job-details animated">
        <div class="row">
            <div class="col-sm-3">
                <ul class="expanded-list">
                    <li class="job-id">Job ID: #2</li>
                    <li class="job-name">Job Name: Riding Motorcycle Cam 1</li>
                    <li class="job-software">Software: 3DS Max</li>
                    <li class="job-scene-name">Scene Name: RidingMotorcycle.max</li>
                    <li class="job-renderer">Renderer: V-Ray</li>
                    <li class="job-plugins">3rd Party Plugins: V-Ray</li>
                    <li class="job-resolution">Render Resolution: 1920 x 1080</li>
                    <li class="job-start-date">Start Date: 08/24/2016</li>
                    <li class="job-completion-date">Completion Date: 08/24/2016</li>
                    <li class="job-render-time">Render Time: 21h 6m 18s</li>
                </ul>
            </div>
            <div class="col-sm-3">

                <div class="frame-image">
                    <div class="full-image-wrapper" style="background-image: url('assets/images/frame-placeholder.jpg')">

                        <div class="view-on-hover--description">
                            <div class="row">
                                <div class="col-md-4 frame-text">Frame#: 0</div>
                                <div class="col-md-5 render-time">Render Time: 4s</div>
                                <div class="col-md-3 "><a href="assets/images/frame-placeholder.jpg" class="pop-up--image"><i class="fa fa-arrows-alt fr full-screen--icon"></i></a></div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <div class="col-sm-3">
                <div class="widget-chart text-center">
                    <div data-sparckline="[0, 23, 43, 35, 44, 45, 56, 37, 40]" class="job-chart sparklines"></div>
                    <ul class="list-inline">
                        <li>
                            <h5 class="text-muted m-t-20">Credit Used</h5>
                            <h4 class="m-b-0">450c</h4>
                        </li>
                        <li>
                            <h5 class="text-muted m-t-20">Frames</h5>
                            <h4 class="m-b-0">10450 / 10450</h4>
                        </li>
                        <li>
                            <h5 class="text-muted m-t-20">Progress</h5>
                            <h4 class="m-b-0">Completed</h4>
                        </li>
                        <li>
                            <h5 class="text-muted m-t-20">Final Cost</h5>
                            <h4 class="m-b-0">450c</h4>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="status-and-actions">
                    <a class="job-details-closer"></a>
                    <div class="status">
                        <span class="status-label">Status:</span>
                        <span class="label label-info">Completed</span>
                    </div>
                    <div class="status clearfix">
                        <span class="status-label">Actions:</span>
                        <div class="expanded-buttons">
                            <a class="pause-render bmm-pause-render-corrections"><span class="action-button pause-button "><i class="md md-pause md-play"></i></span>Pause Rendering</a> <br>
                            <a class="stop-render"><span class="action-button stop-button"><i class="fa fa-stop-circle-o"></i></span>Stop Rendering</a> <br>
                            <a class="video-preview"><span class="action-button preview-button"><i class="fa fa-youtube-play "></i></span>Video Preview</a> <br>
                            <a class="download-output"><span class="action-button download-button"><i class="fa fa-download"></i></span>Download All Output</a> <br>
                            <a class="clone-job"><span class="action-button clone-button"><i class=" ti-files"></i></span>Clone Job</a> <br>
                            <a class="delete-job"><span class="action-button delete-button"><i class=" ti-trash"></i></span>Delete Job and Frames</a> <br>
                        </div>
                    </div>
                    <div class="status budget">
                        <span class="status-label">Budget:</span>
                        <input type="text" disabled="disabled" class="job-budget-input bmn-fix budget-input" value="$1700" name="budget-value"/>
                        <span class="status-label nf p-l-10">Override:</span>
                        <input type="checkbox" class="budget-checkbox" />
                    </div>
                </div>
            </div>
        </div>

        <!--Pagination table-->
        <table class="table frames-table pagination-table">
            <thead>
            <tr>
                <th>#</th>
                <th>Average CPU</th>
                <th>Peak CPU</th>
                <th>Average RAM</th>
                <th>Peak RAM</th>
                <th>Render Time</th>
                <th>Cost</th>
                <th>Actions</th>
            </tr>
            </thead>

            <tbody>

           <?php for( $i=0; $i<=12; $i++):?>
            <tr>
                <td data-image-url="http://google.com<?php echo $i; ?>/"><?php echo $i; ?></td>
                <td>45%</td>
                <td>91%</td>
                <td>4 GB</td>
                <td>4 GB</td>
                <td>4s</td>
                <td>0.06c</td>
                <td><a class="pause-render"><span class="action-button download-button"><i
                                    class="fa fa-download"></i></span></a></td>
            </tr>

           <?php endfor?>
            </tbody>
        </table><!--pagination table-->

    </div>

</div>
