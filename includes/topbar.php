<!-- Begin page -->
        <div id="wrapper">
        
            <!-- Top Bar Start -->
            <div class="topbar">

                <!-- LOGO -->
                <div class="topbar-left">
                    <div class="text-center">
                        <a href="index.php" class="logo"><span>CGIFarm Dashboard</span></a>
                    </div>
                </div>

                <!-- Navbar -->
                <div class="navbar navbar-default" role="navigation">
                    <div class="container">
                        <div class="">
                            <div class="pull-left">
                                <button class="button-menu-mobile open-left waves-effect">
                                    <i class="md md-menu"></i>
                                </button>
                                <span class="clearfix"></span>
                            </div>

                            <ul class="nav navbar-nav hidden-xs">

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle waves-effect" data-toggle="dropdown"
                                       role="button" aria-haspopup="true" aria-expanded="false">Quick Actions <span
                                            class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#upload" data-toggle="modal" data-target=".upload-package-modal">Upload Package</a></li>
                                        <li><a href="#upload" data-toggle="modal" data-target=".create-job-modal">Create Job</a></li>
                                    </ul>
                                </li>
                            </ul>


                            <ul class="nav navbar-nav navbar-right pull-right">

                                <li class="dropdown hidden-xs">
                                    <a href="#" data-target="#" class="dropdown-toggle waves-effect waves-light"
                                       data-toggle="dropdown" aria-expanded="true">
                                        <i class="md md-notifications"></i> <span
                                            class="badge badge-xs badge-pink">3</span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-lg">
                                        <li class="text-center notifi-title">Notification</li>
                                        <li class="list-group nicescroll notification-list">
                                            <!-- list item-->
                                            <a href="javascript:void(0);" class="list-group-item">
                                                <div class="media">
                                                    <div class="pull-left p-r-10">
                                                        <em class="fa fa-diamond noti-primary"></em>
                                                    </div>
                                                    <div class="media-body">
                                                        <h5 class="media-heading">A new order has been placed A new
                                                            order has been placed</h5>
                                                        <p class="m-0">
                                                            <small>There are new settings available</small>
                                                        </p>
                                                    </div>
                                                </div>
                                            </a>

                                            <!-- list item-->
                                            <a href="javascript:void(0);" class="list-group-item">
                                                <div class="media">
                                                    <div class="pull-left p-r-10">
                                                        <em class="fa fa-cog noti-warning"></em>
                                                    </div>
                                                    <div class="media-body">
                                                        <h5 class="media-heading">New settings</h5>
                                                        <p class="m-0">
                                                            <small>There are new settings available</small>
                                                        </p>
                                                    </div>
                                                </div>
                                            </a>

                                            <!-- list item-->
                                            <a href="javascript:void(0);" class="list-group-item">
                                                <div class="media">
                                                    <div class="pull-left p-r-10">
                                                        <em class="fa fa-bell-o noti-success"></em>
                                                    </div>
                                                    <div class="media-body">
                                                        <h5 class="media-heading">Updates</h5>
                                                        <p class="m-0">
                                                            <small>There are <span class="text-primary">2</span> new
                                                                updates available
                                                            </small>
                                                        </p>
                                                    </div>
                                                </div>
                                            </a>

                                        </li>

                                        <li>
                                            <a href="javascript:void(0);" class=" text-right">
                                                <small><b>See all notifications</b></small>
                                            </a>
                                        </li>

                                    </ul>
                                </li>
                                <li class="hidden-xs">
                                    <a href="#" class="right-bar-toggle waves-effect waves-light"><i
                                            class="md md-settings"></i></a>
                                </li>

                            </ul>
                        </div>
                        <!--/.nav-collapse -->
                    </div>
                </div>
            </div>
            <!-- Top Bar End -->


            <!-- ========== Left Sidebar Start ========== -->
            <div class="left side-menu">
                <div class="sidebar-inner slimscrollleft">

                    <div id="sidebar-menu">
                        <ul>
                            <li class="menu-title">Main</li>

                            <li>
                                <a href="index.php" class="waves-effect waves-primary"><i
                                        class="md md-dashboard"></i><span> Dashboard </span></a>
                            </li>
                            
                            <li>
                                <a href="packages.php" class="waves-effect waves-primary"><i
                                        class="glyphicon glyphicon-folder-close"></i><span> Packages </span></a>
                            </li>
                            
                            <li>
                                <a href="jobs.php" class="waves-effect waves-primary bmn-hover"><i
                                        ><svg version="1.0" id="jobs-icon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                              width="22px" height="22px" viewBox="0 0 22 22" enable-background="new 0 0 22 22" xml:space="preserve">
<g>
    <path d="M11,9.7c0,0.5,0,0.9,0,1.4c-0.2-0.1-0.4-0.1-0.6-0.2c-0.9-0.5-1.8-1-2.8-1.6C7.6,9.2,7.4,9.2,7.3,9.1c0,0.9,0.1,1.8,0,2.7
		c-0.1,1.1,0.2,1.8,1.3,2.3c0.8,0.4,1.6,0.9,2.4,1.4c0-1.5,0-3,0-4.4c0.3-0.1,0.6-0.2,0.8-0.4c2.6-1.5,5.3-3,7.9-4.5
		C19.8,6.1,20,6,20.2,5.9c0,0.2,0,0.3,0,0.4c0,3.3,0,6.6,0,9.9c0,0.5-0.2,0.7-0.6,1c-2.7,1.5-5.4,3.1-8.1,4.6
		c-0.4,0.2-0.8,0.2-1.2,0c-2.7-1.5-5.4-3.1-8-4.6c-0.4-0.3-0.6-0.6-0.6-1.1c0-3.5,0-6.9,0-10.4c0-0.5,0.2-0.8,0.6-1
		c2.8-1.5,5.5-3.1,8.2-4.7C10.8,0,11.1,0,11.3,0.1c2.7,1.5,5.4,3.1,8.1,4.6c0,0,0.1,0.1,0.2,0.1c-0.2,0.1-0.3,0.2-0.4,0.3
		c-2.6,1.5-5.2,3-7.8,4.4C11.2,9.6,11.1,9.6,11,9.7c0-1.2,0-2.3,0-3.6C9.9,6.7,8.9,7.3,7.9,8c0.8,0.5,1.6,0.9,2.4,1.3
		C10.5,9.4,10.7,9.5,11,9.7z M10.9,20.7c0-0.1,0.1-0.1,0.1-0.2c0-0.8-0.1-1.6,0-2.4c0.1-1-0.2-1.5-1.1-2c-0.9-0.4-1.7-1-2.6-1.5
		c0,1.3,0,2.6,0,3.8c0,0.1,0.1,0.2,0.2,0.3C8.6,19.4,9.7,20.1,10.9,20.7z M6.1,12.5c0-1.4,0-2.7,0-4C6,8.4,6,8.3,5.9,8.3
		C5,7.7,4,7.2,3,6.6c0,1.4,0,2.7,0,4c0,0.1,0.1,0.2,0.1,0.2C4.1,11.3,5,11.9,6.1,12.5z M3,12.1c0,1.4,0,2.6,0,3.8
		c0,0.1,0.1,0.3,0.3,0.4c0.5,0.3,1.1,0.6,1.6,0.9c0.4,0.2,0.8,0.4,1.2,0.7c0-1.3,0-2.5,0-3.8c0-0.1-0.1-0.3-0.2-0.3
		C4.9,13.3,4,12.7,3,12.1z M3.6,5.5c1,0.5,1.8,1,2.7,1.6C6.6,7.2,6.8,7.2,7,7c0.5-0.4,1.1-0.7,1.7-1c0.3-0.2,0.6-0.4,1-0.6
		c-1-0.5-1.9-1-2.8-1.5c-0.1-0.1-0.3,0-0.4,0C5.5,4.4,4.6,4.9,3.6,5.5z M10.9,4.6c0-1.1,0-2.2,0-3.3C9.9,1.9,9,2.4,8,3
		C9,3.6,9.9,4.1,10.9,4.6z"/>
</g>
</svg>
                                    </i><span> Jobs </span></a>
                            </li>


                            <li class="menu-title">Account</li>

                            <li>
                                <a href="credits.php" class="waves-effect waves-primary"><i
                                        class="fa fa-credit-card-alt"></i><span> 3000 Credits </span></a>
                            </li>

                            <li>
                                <a href="memory.php" class="waves-effect waves-primary"><i
                                        class="fa fa-hdd-o "></i><span> 498 GB Available </span></a>
                            </li>

                            <li>
                                <a href="purchase.php" class="waves-effect waves-primary bmn-hover"><i
                                        ><svg version="1.0" id="purchase-icon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                              width="22px" height="22px" viewBox="0 0 22 22" enable-background="new 0 0 22 22" xml:space="preserve">
<g>
    <path fill="#D9D9D9" d="M7.5,3L7.5,3C7.5,3,7.5,3,7.5,3C7.3,3,7.2,3,7,3c0,0,0,0,0,0C7.2,3,7.3,3,7.5,3L7.5,3z"/>
    <path fill="#A0A0A0" d="M19.7,14.8c-0.1,0.2,0,0.3,0,0.5c0,0.1,0,0.2,0,0.4c-0.2-0.2-0.3-0.3-0.5-0.4c-0.4-0.2-0.9-0.5-1.3-0.7
		c-0.5-0.3-1-0.5-1.6-0.6c-1-0.2-2-0.2-3-0.2c-0.3,0-0.6,0-0.9,0c-0.3,0-0.5,0.2-0.4,0.6c0,0.1,0.1,0.2,0.1,0.3
		c0.3,0.3,0.6,0.5,1,0.5c0.7,0,1.5,0.2,2.2,0.3c0.2,0,0.3,0.1,0.5,0.2c0,0-0.1,0-0.1,0c-0.7,0.2-1.4,0.5-2.1,0.7
		c-0.5,0.2-1.1,0.3-1.7,0.3c-1,0-1.9-0.2-2.8-0.6c-0.3-0.1-0.5-0.3-0.8-0.3c-0.3-0.1-0.5,0-0.8,0.1c-0.4,0.2-0.5,0.7-0.2,1.1
		c0.1,0.1,0.2,0.2,0.3,0.2c1.5,1.2,3.3,1.8,5.2,1.9c1.1,0,2.2-0.2,3.3-0.3c0.9-0.1,1.7-0.3,2.6-0.3c0.4,0,0.7,0,1-0.2
		c0,0.1,0,0.3,0,0.4C19.6,17.3,19.7,16.1,19.7,14.8z"/>
    <path fill="#A0A0A0" d="M11,8.6c-0.2-0.6-0.5-1-1.1-1.2C9.2,7.2,8.7,6.8,8.1,6.3C7.9,6.2,7.9,5.9,7.9,5.7C8,5.4,8.2,5.2,8.5,5.2
		c0.4-0.1,0.8,0,1.1,0.2c0.3,0.2,0.6,0.4,1,0.5C11.1,6,11.7,6,12.3,6c0.1,0,0.2,0,0.2-0.1c0-0.1,0-0.1-0.1-0.2
		c-0.6-0.5-1.2-1-1.7-1.6c-0.2-0.2-0.5-0.4-0.8-0.5c-0.5-0.1-1-0.3-1.5-0.4C8.1,3.1,7.8,3,7.5,3h0C7.3,3,7.2,3,7,3
		C6.8,3,6.6,3.1,6.4,3.1c-0.5,0.1-1,0.3-1.6,0.5c-0.5,0.1-1,0.3-1.6,0.2c-0.3,0-0.4,0-0.4,0.4c0,0,0,0.1,0,0.1c0,0.8,0,1.6,0,2.4
		c0,0.4,0.1,0.5,0.5,0.5c0.1,0,0.1,0,0.2,0c0.4,0,0.8,0.1,1.2,0.3c0.2,0.1,0.4,0.2,0.6,0.3c1.7,0.7,3.4,1,5.2,1.5
		C10.9,9.3,11.2,9,11,8.6z"/>
    <path fill="#A0A0A0" d="M10.4,6.7c0,0-0.1,0-0.1,0.1c0,0.1,0,0.1,0.1,0.1c0.3,0.3,0.6,0.4,1,0.4c2.2,0,4.4,0,6.6,0
		c0.3,0,0.5,0.1,0.5,0.4c0,1.3,0,2.6,0,3.9c0,0.4-0.1,0.5-0.5,0.5c-1.7,0-3.4,0-5.2,0c-1.2,0-2.4,0-3.6,0c-0.3,0-0.4-0.1-0.4-0.4
		c0-0.7,0-1.5,0-2.2c0-0.1,0-0.2,0-0.2c0-0.1-0.2-0.2-0.4-0.2C8.3,8.9,8.2,9,8.3,9.2c0,0.5,0,0.9,0,1.4c0,0.5,0,0.9,0,1.4
		c0,0.5,0.1,0.6,0.6,0.6c0,0,0,0,0.1,0c1.6,0,3.1,0,4.7,0c1.5,0,2.9,0,4.4,0c0.2,0,0.4,0,0.6,0c0.3,0,0.4-0.1,0.4-0.4
		c0-0.1,0-0.1,0-0.2c0-0.7,0-1.3,0-2c0-0.9,0-1.8,0-2.7c0-0.5-0.1-0.6-0.6-0.6c-2.6,0-5.2,0-7.7,0C10.6,6.7,10.5,6.7,10.4,6.7z"/>
    <path fill="#353535" d="M2.6,3.6c0-0.3-0.1-0.4-0.4-0.4c-0.2,0-0.4,0-0.6,0c-0.4,0-0.9,0-1.3,0c-0.1,0-0.2,0-0.3,0.2
		c0,0.2,0,0.4,0,0.5c0,0.8,0,1.6,0,2.3c0,0.4,0,0.9,0,1.3c0,0.2,0.1,0.3,0.3,0.4c0.6,0,1.2,0,1.8,0c0.3,0,0.4-0.1,0.4-0.4
		c0-0.2,0-0.4,0-0.5c0-0.6,0-1.3,0-1.9C2.6,4.6,2.6,4.1,2.6,3.6z"/>
    <path fill="#353535" d="M22,15.2c0-0.1,0-0.3,0-0.4c0-0.2-0.1-0.2-0.2-0.2c-0.1,0-0.2,0-0.4,0c-0.4,0-0.9,0-1.3,0
		c-0.3,0-0.3,0.1-0.4,0.3c0,1.3,0,2.5,0,3.8c0,0.2,0.1,0.3,0.3,0.3c0.3,0,0.6,0,1,0c0.2,0,0.5,0,0.7,0c0.2,0,0.3-0.1,0.3-0.3
		c0,0,0-0.1,0-0.1C22,17.4,22,16.3,22,15.2z"/>
    <path fill="#434343" d="M13.7,10.5c-0.1-0.1-0.2-0.2-0.2-0.3c0-0.1-0.1-0.1-0.2-0.1c-0.2,0-0.4,0.1-0.6,0.1c-0.1,0-0.1,0-0.1,0.2
		c0.1,0.5,0.5,0.7,0.9,0.8c0.1,0,0.2,0,0.3,0.1c0.1,0.1,0,0.2,0,0.3c0,0,0,0.1,0.1,0.1c0.2,0.1,0.3,0,0.3-0.2c0,0,0-0.1,0-0.1
		c0-0.1,0-0.1,0.1-0.1c0.1,0,0.2,0,0.3-0.1c0.4-0.1,0.8-0.5,0.8-0.9c0-0.5-0.2-0.8-0.7-1c-0.1-0.1-0.3-0.1-0.5-0.2
		c-0.1,0-0.1-0.1-0.1-0.1c0-0.2,0-0.3,0-0.5c0.1,0,0.2,0.1,0.2,0.2c0,0.1,0.1,0.1,0.2,0.1c0.1,0,0.3,0,0.4-0.1
		c0.3-0.1,0.4-0.1,0.2-0.4c0,0,0,0,0,0c-0.2-0.3-0.5-0.4-0.8-0.4c-0.1,0-0.1,0-0.1-0.1c0-0.1,0-0.1-0.1-0.1c0,0-0.1,0-0.1,0
		c-0.1,0-0.1,0-0.1,0.1c0,0.1,0,0.1-0.1,0.1c-0.2,0-0.3,0.1-0.5,0.1c-0.4,0.2-0.5,0.5-0.5,0.9c0,0.4,0.2,0.6,0.6,0.8
		c0.1,0.1,0.3,0.1,0.4,0.1c0.1,0,0.1,0.1,0.1,0.1C13.8,10.1,13.8,10.3,13.7,10.5C13.8,10.5,13.8,10.5,13.7,10.5z"/>
</g>
</svg></i><span> Purchase Credit </span></a>
                            </li>

                            <li>
                                <a href="support.php" class="waves-effect waves-primary"><i
                                        class="ti-headphone-alt"></i><span> Support </span></a>
                            </li>


                        </ul>
                        <div class="clearfix"></div>
                    </div>

                    <div class="clearfix"></div>

                </div>


            </div>
            <!-- Left Sidebar End -->

            <?php include_once('includes/views/create_new_job.php'); ?>
            <?php include_once('includes/views/upload_package.php'); ?>


            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->                      
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container">
