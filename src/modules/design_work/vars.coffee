(($) ->
  $.fn.exists = () ->
    if this.length>0
     true
    else
     false
)(jQuery)

hasJob = if $('.table .job-table tbody')?
    true
  else
    false
hasSparklines = $('.sparklines').exists()

isJobsPage = $('#jobs_page').exists()
isPackagesPage =$('#packages_form').exists()

#graphs
FirstGraphArray1 = []
FirstGraphArray2 = []
SecondGraphArray = []

#Uploaded files array values
removedFilesCounter = 0

#Pages
isDashboard = false
if $('#sparkline5').exists()
  isDashboard = true

#Check if pop-up on dashboard hovered
isHoveredDashboard = false
if $('.click-action.animated').exists()
  $('.click-action.animated').hover ->
    isHoveredDashboard = true
  ,->
    isHoveredDashboard = false
#Current file uploading
currentFile = ''