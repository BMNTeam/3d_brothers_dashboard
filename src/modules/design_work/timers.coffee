FirstGraphArray1 = []
FirstGraphArray2 = []
SecondGraphArray = []


if (hasSparklines)
  getFirstGraph = () ->
    $.get('includes/json.php',{"graph":"1"}).done (data) ->
      console.dir(data)
      parsed = $.parseJSON(data)
      console.dir(parsed)
      FirstGraphArray1 = parsed.array1
      FirstGraphArray2 = parsed.array2
      $('#sparkline5').bmnSparklineFirst(parsed.array1, parsed.array2)


  getSecondGraph = () ->
    $.get('includes/json.php',{"graph":"2"}).done (data) ->
      console.dir(data)
      parsed = $.parseJSON(data)
      console.dir(parsed)
      SecondGraphArray = parsed.array1
      $('#sparkline6').bmnSparklineSecond(parsed.array1)

  getFirstGraph()
  getSecondGraph()

  if hasJob == true
    setInterval(getSecondGraph, 30000)

  setInterval(getFirstGraph,30000)


