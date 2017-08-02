#Editable table class to sort and remove data from
#the table

class EditableTable
  constructor: (@tableId, @columnsNumber) ->
  hello: @tableId
  options:
    addButton: '#addToTable'
    table: @tableId

    #datatable part
    dom: null
    columns: null
    paginate: false
    filter: false
    info: false
    pageLength: 5
    pagingType: "full_numbers"


    dialog:
      uploadForm: ''
      wrapper: '#dialog'
      cancelButton: '#dialogCancel'
      confirmButton: '#dialogConfirm'
  initialize: ->
    @setVars().build().events()
    return
  setVars: ->
    @$table = $(@options.table)
    @$addButton = $(@options.addButton)
    # dialog
    @dialog = {}
    @dialog.$uploadForm = $(@options.dialog.uploadForm)
    @dialog.$wrapper = $(@options.dialog.wrapper)
    @dialog.$cancel = $(@options.dialog.cancelButton)
    @dialog.$confirm = $(@options.dialog.confirmButton)
    this
  build: ->
    dom = "<'row'<'col-sm-6'l><'col-sm-6'f>>" +
      "<'row'<'col-sm-12'tr>>" +
      "<'row'<'col-sm-5'i><'col-sm-7'p>>"
    if @options.dom?
      dom = @options.dom
    @datatable = @$table.DataTable(
      'language':
        'decimal': ''
        'searchPlaceholder': '#'
        'emptyTable': 'No data available in table'
        'info': 'Showing _START_ to _END_ of _TOTAL_ entries'
        'infoEmpty': 'Showing 0 to 0 of 0 entries'
        'infoFiltered': '(filtered from _MAX_ total entries)'
        'infoPostFix': ''
        'thousands': ','
        'lengthMenu': 'Show _MENU_ entries'
        'loadingRecords': 'Loading...'
        'processing': 'Processing...'
        'zeroRecords': 'No matching records found'
        'paginate':
          'first': '<<'
          'last': '>>'
          'next': '>'
          'previous': '<'
      'bPaginate': @options.paginate
      'pagingType': @options.pagingType
      'dom': dom
      'pageLength': 5
      'bFilter': @options.filter
      "bLengthChange": true
      "bAutoWidth" : false
      "bProcessing": true
      'bInfo': @options.info
      "lengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]]
      'search': {
          'smart':false
          'regular':  '^0$'
        }
      aoColumns: if @options.columns == null
        [
          {'width': "5%"}
          {'width': "5%"}
          {'width': "50%"}
          {'width': "5%"}

        ]
      else
        @options.columns

    )
    window.dt = @datatable
    this
  events: ->
    _self = this
    @$table.on('click', 'a.save-row', (e) ->
      e.preventDefault()
      _self.rowSave $(this).closest('tr')
      return
    ).on('click', 'a.cancel-row', (e) ->
      e.preventDefault()
      _self.rowCancel $(this).closest('tr')
      return
    ).on('click', 'a.edit-row', (e) ->
      e.preventDefault()
      _self.rowEdit $(this).closest('tr')
      return
    ).on 'click', 'a.remove-row', (e) ->
      e.preventDefault()
      $row = $(this).closest('tr')
      $table = $(this).closest('tbody')
      _self.dialog.$uploadForm.css('z-index', '999')
      $.magnificPopup.open
        items:
          src: _self.options.dialog.wrapper
          type: 'inline'
        preloader: false
        modal: true
        callbacks:
          change: ->
            _self.dialog.$confirm.on 'click', (e) ->
              e.preventDefault()
              #Number of rows before removing
              $rowsBeforeRemoving = $table.find('tr').size()
              #remove ro
              _self.rowRemove $row

              #Find row number to delete element
              removeNumber = $row.find('td').first().html()

              $(myDropzone.files[removeNumber-1]._removeLink)[0].click()
              $.magnificPopup.close()
              _self.dialog.$uploadForm.css('z-index', '9999')
              removedFilesCounter++
              #Hide table if no elements inside
              console.dir($table.find('tr').size())
              if  $rowsBeforeRemoving == 1
                $table.closest('table').slideUp(300)
              return
            return
          close: ->
            _self.dialog.$confirm.off 'click'
            _self.dialog.$uploadForm.css('z-index', '9999')
            return
      return
    @$addButton.on 'click', (e) ->
      e.preventDefault()
      _self.rowAdd()
      return
    @dialog.$cancel.on 'click', (e) ->
      e.preventDefault()
      $.magnificPopup.close()
      return
    this
  rowAdd: ->
    @$addButton.attr 'disabled': 'disabled'
    actions = undefined
    data = undefined
    $row = undefined
    actions = [
      '<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>'
      '<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>'
      '<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>'
      '<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>'
    ].join(' ')
    data = @datatable.row.add([
      ''
      ''
      ''
      actions
    ])
    $row = @datatable.row(data[0]).nodes().to$()
    $row.addClass('adding').find('td:last').addClass 'actions'
    @rowEdit $row
    @datatable.order([
      0
      'asc'
    ]).draw()
    # always show fields
    return
  rowCancel: ($row) ->
    _self = this
    $actions = undefined
    i = undefined
    data = undefined
    data = @datatable.row($row.get(0)).data()
    @datatable.row($row.get(0)).data data
    $actions = $row.find('td.actions')
    if $actions.get(0)
       @rowSetActionsDefault $row
    @datatable.draw()
    return
  rowEdit: ($row) ->
    _self = this
    data = undefined
    data = @datatable.row($row.get(0)).data()
    $row.children('td').each (i) ->
      $this = $(this)
      if $this.hasClass('actions')
        _self.rowSetActionsEditing $row
      else
        $this.html '<input type="text" class="form-control input-block" value="' + data[i] + '"/>'
      return
    return
  rowSave: ($row) ->
    _self = this
    $actions = undefined
    values = []
    $td = $row.find('td:first').text()
    #Now work for package name not a ZIP
    $tdNewName = $row.find('td').eq(2).find('input').val()

    myDropzone.files[$td-1].newFileName = $tdNewName
    if $row.hasClass('adding')
      @$addButton.removeAttr 'disabled'
      $row.removeClass 'adding'
    values = $row.find('td').map(->
      $this = $(this)
      if $this.hasClass('actions')
        _self.rowSetActionsDefault $row
        _self.datatable.cell(this).data()
      else
        $.trim $this.find('input').val()
    )
    @datatable.row($row.get(0)).data values
    $actions = $row.find('td.actions')
    if $actions.get(0)
      @rowSetActionsDefault $row
    @datatable.draw()
    return
  rowRemove: ($row) ->
    if $row.hasClass('adding')
      @$addButton.removeAttr 'disabled'
    @datatable.row($row.get(0)).remove().draw()
    return
  rowSetActionsEditing: ($row) ->
    $row.find('.on-editing').removeClass 'hidden'
    $row.find('.on-default').addClass 'hidden'
    return
  rowSetActionsDefault: ($row) ->
    $row.find('.on-editing').addClass 'hidden'
    $row.find('.on-default').removeClass 'hidden'
    return

#Axtend class for big table
class BigEditableTable extends EditableTable
  build: ->
    @datatable = @$table.DataTable(
      'language':
        'decimal': ''
        'emptyTable': 'No data available in table'
        'info': 'Showing _START_ to _END_ of _TOTAL_ entries'
        'infoEmpty': 'Showing 0 to 0 of 0 entries'
        'infoFiltered': '(filtered from _MAX_ total entries)'
        'infoPostFix': ''
        'thousands': ','
        'lengthMenu': 'Show _MENU_ entries'
        'loadingRecords': 'Loading...'
        'processing': 'Processing...'
        'zeroRecords': 'No matching records found'
        'paginate':
          'first': '<<'
          'last': '>>'
          'next': '>'
          'previous': '<'
      'bPaginate': true
      'bFilter': false
      'iDisplayLength': 5
      "bLengthChange": true
      "bAutoWidth" : false
      'pagingType': 'full_numbers'
      'bInfo': true
      "lengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]]

      aoColumns: [
        null
        null
        null
        null
        null
        null
        null
        null
        null
        null
        { 'bSortable': false, 'width': '60px'}
      ])
    window.dt = @datatable
    this
  events: ->
    _self = this
    @$table.on('click', 'a.save-row', (e) ->
      e.preventDefault()
      _self.rowSave $(this).closest('tr')
      return
    ).on('click', 'a.cancel-row', (e) ->
      e.preventDefault()
      _self.rowCancel $(this).closest('tr')
      return
    ).on('click', 'a.edit-row', (e) ->
      e.preventDefault()
      _self.rowEdit $(this).closest('tr')
      return
    ).on 'click', 'a.remove-row', (e) ->
      e.preventDefault()
      $row = $(this).closest('tr')
      $.magnificPopup.open
        items:
          src: _self.options.dialog.wrapper
          type: 'inline'
        preloader: false
        modal: true
        callbacks:
          change: ->
            _self.dialog.$confirm.on 'click', (e) ->
              e.preventDefault()
              _self.rowRemove $row
              $.magnificPopup.close()
              return
            return
          close: ->
            _self.dialog.$confirm.off 'click'
            return
      return
    @$addButton.on 'click', (e) ->
      e.preventDefault()
      _self.rowAdd()
      return
    @dialog.$cancel.on 'click', (e) ->
      e.preventDefault()
      $.magnificPopup.close()
      return
    this



if isDashboard != null
#Initiate and test the class with important data
  editableTable = new EditableTable
  editableTable.options.table = "#packages-upload"
  editableTable.options.dialog.uploadForm = "#modal-packages"
  editableTable.initialize()
  editableTable.datatable.
    on('order.dt search.dt delete.dt', ->
      editableTable.datatable.column(0,
        search: 'applied'
        delete: 'applied'
        order: 'applied').nodes().each (cell, i) ->
          cell.innerHTML = i + 1
      return
      return
    ).draw()



#Initiate big table part
#This table on the packages page
  bidEditableTable = new BigEditableTable
  bidEditableTable.options.table = "#datatable-editable-packages"
  bidEditableTable.initialize()

#Searchable table on the Dashboard and Jobs pages
if ! isPackagesPage
  paginationTable = new EditableTable
  paginationTable.options.table = ".pagination-table"
  paginationTable.options.columns = [
    { 'bSearchable': true }
    { 'bSearchable': false }
    { 'bSearchable': false }
    { 'bSearchable': false }
    { 'bSearchable': false }
    { 'bSearchable': false }
    { 'bSearchable': false }
    { 'bSearchable': false, 'bSortable': false }


  ]
  #Set filter and search options
  paginationTable.options.dom = '<<"row"<".col-sm-5"<".jobs-frames">><"col-sm-7"fl>><t><<"row"<"col-sm-6"i><"col-sm-6"p>>>'
  paginationTable.options.paginate = true
  paginationTable.options.filter = true
  paginationTable.options.info = true

  paginationTable.initialize()
  #Enable and configure pagination
  paginationTable.datatable.iDisplayLength = 5


  paginationJobs = new EditableTable
  paginationJobs.options.table = '.jobs-paginate .job-table'
  paginationJobs.options.columns = [
    null
    null
    null
    null
    null
    null
    null
    null
    null
    null
    { 'bSortable': false, 'width': '100px'}
  ]
  paginationJobs.options.dom = "<'row'<'col-sm-6'l><'col-sm-6'f>>" + "<'row'<'col-sm-12'tr>>" + "<'row'<'col-sm-5'i><'col-sm-7'p>>"
  paginationTable.options.filter = false
  paginationJobs.initialize()


#Search exact the same value in the table


###$('.dataTables_filter input').unbind().bind 'keyup', ->
  searchTerm = @value.toLowerCase()
  regex = '\\b' + searchTerm + '\\b'
  paginationTable.datatable.rows().search(regex, true, false).draw()
  return###

