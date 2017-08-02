module.exports = pixelAdmin =
  javascripts: [
    # Bootstrap
    'libs/bootstrap-3.1.1/transition.js'
    'libs/bootstrap-3.1.1/alert.js'
    'libs/bootstrap-3.1.1/button.js'
    'libs/bootstrap-3.1.1/carousel.js'
    'libs/bootstrap-3.1.1/collapse.js'
    'libs/bootstrap-3.1.1/dropdown.js'
    'libs/bootstrap-3.1.1/modal.js'
    'libs/bootstrap-3.1.1/tooltip.js'
    'libs/bootstrap-3.1.1/popover.js'
    'libs/bootstrap-3.1.1/scrollspy.js'
    'libs/bootstrap-3.1.1/tab.js'
    'libs/bootstrap-3.1.1/affix.js'

    # PixelAdmin
    # PixelAdmin App
    'utils.coffee'
    'app.coffee'
    'events.coffee'

    # Touch devices
    'libs/fastclick-0.6.11.js'
    'libs/jquery.event.move-1.3.6.js'
    'libs/jquery.event.swipe-0.5.js'

    # External plugins
    'libs/jquery.vague-0.0.4.js'
    'libs/select2-3.4.5/select2.js'

    # jQuery UI
    'libs/jquery-ui-1.10.4/jquery.ui.core.js'
    'libs/jquery-ui-1.10.4/jquery.ui.widget.js'
    'libs/jquery-ui-1.10.4/jquery.ui.mouse.js'
    'libs/jquery-ui-1.10.4/jquery.ui.position.js'
    'libs/jquery-ui-1.10.4/jquery.ui.sortable.js'
    'libs/jquery-ui-1.10.4/jquery.ui.slider.js'
    'libs/jquery-ui-1.10.4/jquery.ui.accordion.js'
    'libs/jquery-ui-1.10.4/jquery.ui.menu.js'
    'libs/jquery-ui-1.10.4/jquery.ui.autocomplete.js'
    'libs/jquery-ui-1.10.4/jquery.ui.spinner.js'
    'libs/jquery-ui-1.10.4/jquery.ui.progressbar.js'
    'libs/jquery-ui-1.10.4/jquery.ui.tabs.js'

    # PixelAdmin App Components and Plugins
    'components/main-navbar.coffee'
    'components/main-menu.coffee'
    'components/alert.coffee'
    'plugins/switcher.coffee'
    'plugins/limiter.coffee'
    'plugins/expanding-input.coffee'
    'plugins/wizard.coffee'
    'plugins/file-input.coffee'
    'plugins/tasks.coffee'
    'plugins/rating.coffee'
    'libs/pixel-slimscroll.js', # Slimscroll, optimized for the main menu 
                                # dropdowns / Navbar collapse Plugins
    'libs/bootstrap-datepicker-1.3.0/bootstrap-datepicker.js'
    'libs/bootstrap-timepicker-0.2.5.js'

    'libs/bootstrap-tabdrop.js'
    'libs/jquery.minicolors-2.1.1.js'
    'libs/jquery.maskedinput-1.3.1.js'
    'libs/jquery.autosize-1.18.4.js'
    'libs/bootbox.min-4.2.0.js'
    'libs/jquery.growl-1.1.5.js'
    'libs/jquery.knob-1.2.7.js'
    'libs/jquery.sparkline-2.1.2.js'
    'libs/jquery.easypiechart-2.1.5.js'
    'libs/jquery.slimscroll-1.3.2.js'

    'libs/moment-2.5.1.js'
    'libs/bootstrap-datepaginator-1.1.0.js'

    'libs/bootstrap-editable-1.5.1/bootstrap-editable.js'
    'libs/bootstrap-editable-1.5.1/inputs-ext/address/address.js'
    'libs/bootstrap-editable-1.5.1/inputs-ext/typeaheadjs/lib/typeahead.js'
    'libs/bootstrap-editable-1.5.1/inputs-ext/typeaheadjs/typeaheadjs.js'

    'libs/jquery.validate-1.11.1/jquery.validate.js'
    'libs/jquery.validate-1.11.1/additional-methods.js'

    'libs/jquery-datatables-1.10.0/jquery.datatables.js'
    'libs/jquery-datatables-1.10.0/datatables.bootstrap3.js'

    'libs/dropzone-amd-module-3.8.4.js'
    'libs/dropzone-3.8.4.js'

    'libs/summernote-0.5.1/summernote.js'

    'libs/bootstrap-markdown-2.2.1/markdown.js'
    'libs/bootstrap-markdown-2.2.1/to-markdown.js'
    'libs/bootstrap-markdown-2.2.1/bootstrap-markdown.js'

    'libs/raphael-2.1.2.min.js'
    'libs/morris-0.5.0.js'

    'libs/jquery.flot-0.8.2/jquery.flot.js'
    'libs/jquery.flot-0.8.2/jquery.flot.pie.js'
    'plugins/flot.coffee'

    # PixelAdmin Extensions
    'extensions/modal.coffee'
    'extensions/bootstrap-datepicker.coffee'
    'extensions/bootstrap-timepicker.coffee'
    'extensions/bootstrap-datepaginator.coffee'
    'extensions/bootstrap-tabdrop.coffee'
    'extensions/jquery.validate.coffee'
    'extensions/jquery.knob.coffee'
    'extensions/jquery.sparklines.coffee'

    # jQuery UI Extras
    #'extensions/jquery-ui-extras.coffee' # This line is required
    # 'libs/jquery-ui-1.10.4/jquery.ui.tooltip.js'
    #'libs/jquery-ui-1.10.4/jquery.ui.datepicker.js'
    #'extensions/jquery-ui.datepicker.coffee'
  ]

  ieJS: [
    'libs/respond.min.js'
    'libs/excanvas.js'
  ]

  stylesheets: [
      'libs/bootstrap-3.1.1/bootstrap.less'
      'pixel-admin.less'
      'pixel-admin-less/widgets/widgets.less'
      'pixel-admin-less/pages/pages.less'
      'pixel-admin-less/themes/themes.less'
      'pixel-admin-less/rtl/rtl.less'
  ]
