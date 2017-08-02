#=require design_work/vars.coffee
#=require design_work/jQuery_custom_functions.coffee
#=require design_work/ajax.coffee
#=require design_work/timers.coffee
#=require design_work/packages.coffee
#=require classes/deletedTable.coffee


$('div').hideElementOnOutsideClick("md md-menu fix-position", '.click-action', 'fadeOut', 'fadeIn')

$('.md.md-menu').animateElement( '.click-action', 'fadeIn', 'fadeOut' )

#Animation for table
$('.openButton').click (event) ->
  $(this).maximazeMinimazeTable(event)

#Tables animation on the dashboard
$('.job-details-closer').click (event) ->
  $(this).maximazeMinimazeTable(event)

#Magnific pop-up image on the dashboard
$('.pop-up--image').magnificPopup
  type: 'image'
  closeOnContentClick: true
  mainClass: 'mfp-img-mobile'
  image: verticalFit: true

#Hardcoded charts --need a little work

$('.job-chart').bmnSparklineFirst()

#Windows resize charts
$(window).resize (e) ->
  $('.job-chart').bmnSparklineFirst([0, 23, 43, 35, 44, 45, 56, 37, 40])
  $('#sparkline5').bmnSparklineFirst(FirstGraphArray1, FirstGraphArray2)
  $('#sparkline6').bmnSparklineSecond(SecondGraphArray)


if isDashboard || isJobsPage
  $('.expanded.to-expand').find('.pause-button').click (e) ->
    self = $(this)
    e.preventDefault()
    self.toggleClass('active')



#Dropzone plugin initialization
myDropzone = new Dropzone '#dropzone',
  dictDefaultMessage: ""
  maxFilesize: 99999
  addRemoveLinks: true
  autoProcessQueue: false
  uploadMultiple: false
  init: ->
    this.on "addedfile", (file)  ->
      this.addName(file)
      $(this).workWithTable(file)
    this.on "sending", (file, xhr, formData) ->
      newPackagesName = $('#package-name-input').val()
      isChecked = 0
      if $('#prefix-checkbox:checked').length > 0
        isChecked = 1
      formData.append("prefix",newPackagesName)
      formData.append("checked", isChecked)
      formData.append("package_name", file.newFileName)
    this.on "success", (file, response) ->
      console.dir(response)
    this.on "uploadprogress", (file, progress, bytesSent) ->
      value = file
      #if prefix checked
      isChecked = 0
      if currentFile != file.name
        #Get current number of rows
        rowNumber = bidEditableTable.datatable.rows().data().length

        if $('#prefix-checkbox:checked').length > 0
          isChecked = 1

        #Get current date
        fileUploadDate = new Date()
        lastModifiedDate = new Date(value.lastModified)
        #New name if not empty
        name  = value.name
        name = name.substr(0, name.indexOf('.'))

        if value.newFileName != undefined
          name = value.newFileName
        if isChecked == 1
          prefix = $('#package-name-input').val()
          name = prefix + name

        #Check if this file already added to the table
        currentFile = file.name
        #Add rows to big table
        row = bidEditableTable.datatable.row.add [
          "#{rowNumber + 1}"
          "#{name}"
          "#{Math.round(value.size/1000)} KB"
          "-"
          "-"
          "-"
          "-"
          "#{fileUploadDate.getDate()}/#{fileUploadDate.getMonth() + 1 }/#{fileUploadDate.getFullYear()}"
          "#{lastModifiedDate.getDate()}/#{lastModifiedDate.getMonth() + 1}/#{lastModifiedDate.getFullYear()}"
          "<span class='progress-status'>Uploading</span><div class='progress'><div class='progress-bar progress-bar-primary progress-bar-striped active' role='progressbar' aria-valuenow='82' aria-valuemin='0' aria-valuemax='100' style='width: 82%;'><span class='sr-only'>82% Complete</span></div></div>"
          "<a data-target='#message-info--wrapper' href='#message-info--wrapper' data-toggle='modal' class='package-info'><span class='action-button info-button'><i
          class='md md-info'></i></span></a>

           <a class='delete-job remove-row'><span class='action-button delete-button'><i class='ti-trash'></i></span></a>"
        ]
          .draw()

      $(row.node()).find('td').eq(9).find('div.progress-bar').css('width', Math.round(progress)+'%')
      if progress >= 99
        $(row.node()).find('td').eq(9).html('<span class="label label-info">Completed</span>')

#Clean buds with auto crating table when plugin initialized
$('#upload-table-body').html('')


#Change file name in the table
$('#package-name-input').on "keyup",() ->
  $(this).changeValueOnClick('#upload-table-body','#prefix-checkbox' )

#When check box on packages upload pop-up checked
#then simulate KeyUp on the input
$('#prefix-checkbox').click () ->
  $('#package-name-input').trigger('keyup')



#Code for test

$('#upload-table-body').find('tr').click () ->
  @.editableTable.rowEdit()



#Initialization select plugin
$('#select').select2({
  dropdownParent: $('#message-info--wrapper')
})

$('.select2_jobs').select2({
  containerCssClass: "job-margin-left--select2"
  dropdownParent: $('#create-job-modal')
})



#Add packages to main table on submit and clean the table
$('#package-submit').click () ->
  self = @
  #When upload button pushed
  myDropzone.processQueue()
  $('button.close').trigger('click')
  $('#packages-upload').hide()
  editableTable.datatable.clear().draw()

#Jobs page

#Hide show additional drafts information
$('#draft-checkbox').click ->
  $('.pane-content--wrapper').toggleClass('active')

#
#Data table section
#

#Work with active row
$('.job-details tbody').on 'click', 'tr',  ->
  self = $(this)
  $('.job-details .dataTables_wrapper tbody tr').each ->
    $(this).removeClass('actived')
  if $(this).hasClass('selected')
    $(this).removeClass('selected')
  else
    paginationTable.datatable.$('tr.selected').removeClass('selected')
    $(this).addClass('selected')
    $(this).changeImageAndLink()


#Override budget
$('.budget-checkbox').click () ->
  $(this).overrideBudget()

if $('.jobs-frames').exists()
  $('.jobs-frames').html('Frames:')