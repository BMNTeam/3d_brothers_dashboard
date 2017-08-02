(($)->

  $.fn.bmnSparklineFirst = (array1, array2) ->
    if !hasSparklines
      return
    self = $(this)
    data = self.data('sparckline')
    if data != undefined
      array1 = data
    console.dir(array1+ "this data")
    $(self).sparkline array1,
      type: 'line'
      width: $(self).width()
      height: '165'
      chartRangeMax: 50
      lineColor: '#3bafda'
      fillColor: 'rgba(59,175,218,0.3)'
      highlightLineColor: 'rgba(0,0,0,.1)'
      highlightSpotColor: 'rgba(0,0,0,.2)'
    $(self).sparkline array2,
      type: 'line'
      width: $(self).width()
      height: '165'
      chartRangeMax: 40
      lineColor: '#5d9cec'
      fillColor: 'rgba(93, 156, 236, 0.3)'
      composite: true
      highlightLineColor: 'rgba(0,0,0,.1)'
      highlightSpotColor: 'rgba(0,0,0,.2)'

  $.fn.bmnSparklineSecond = (array1) ->
    if !hasSparklines
      return
    self = $(this)
    $(self).sparkline array1,
      type: 'bar'
      height: '165'
      barWidth: '10'
      barSpacing: '3'
      barColor: '#3bafda'
)(jQuery)
