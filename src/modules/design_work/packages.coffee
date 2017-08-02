(($) ->
  #Add elements to the uploading package page
  #@param file string file that have been uploaded
  $.fn.workWithTable = (file)->
    self = $(this)

    #Number of table to calculate id
    numberOfRows = $('#upload-table-body').find('tr').size()

    #Delete remove or edit links
    actions = [
      '<a href="#" class="package-button save hidden on-editing save-row"><span class="action-button"><i class="fa fa-save"></i></span></a>'
      '<a href="#" class="package-button cancel hidden on-editing cancel-row"><span class="action-button delete-button"><i class="fa fa-times"></i></span></a>'
      '<a href="#" class="package-button edit on-default edit-row"><span class="action-button"><i class="fa fa-pencil"></i></span></a>'
      '<a href="#" class="package-button delete-job remove-row on-default"><span class="action-button delete-button"><i class="ti-trash"></i></span></a>'
    ].join(' ')

    extensionName = file.name
    extensionName = extensionName.substring(0, extensionName.indexOf('.'))

    #Insert the row to the table
    editableTable.datatable.row.add [
      "#{numberOfRows}"
      "#{file.name}"
      "#{extensionName}"
      actions
    ]
        .draw()

    #Give users ability only change 3rd column value
    $row = $('#upload-table-body').find('tr').each ->
      self = $(this)
      self.find('td:last').addClass 'actions'
      self.find('td:first').addClass 'actions'
      self.find('td').eq(1).addClass 'actions'

    #If it's just initialization then remove data
    #from table
    if file.name != 'm'
      $('#packages-upload').slideDown(300)


  #Function change file name when user type information
  #on the packages uploaded pop-up page
  #@param tableToFind string jQuery found object table where change
  #@param paramToCheck string jQuery element to check if use as a prefix
  $.fn.changeValueOnClick = (tableToFind, paramToCheck) ->
    input = $(this)
    if $(tableToFind).exists()
      $(tableToFind).find('tr').each () ->
        self = $(this)
        value = input.val()
        #Save value to turn back name if prefix offed
        oldValue = editableTable.datatable.cell( self.find('td').eq(1)).data()
        oldValue = oldValue.substr(0, oldValue.indexOf('.'))

        if $(paramToCheck+':checked').size()>0
          value = value + '_' + oldValue
          editableTable.datatable.cell(self.find('td').eq(2)).data(value)
        else
          editableTable.datatable.cell(self.find('td').eq(2)).data(oldValue)

  $.fn.doAlert = () ->
    alert(1)
)(jQuery)