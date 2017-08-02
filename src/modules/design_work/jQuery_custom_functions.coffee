###
  Hide or show element with custom animation from animateCss
  @param animationFunctionIn string function to show element
  @param animationFunctionOut function to hide element
  @return void
###
(($) ->

  $.fn.hideOrShow = (animationFunctionIn, animationFunctionOut) ->
    popUpWindow = $(this)
    if ! popUpWindow.hasClass(animationFunctionIn)
      popUpWindow.changeZIndex('1')
      popUpWindow.addClass(animationFunctionIn)
      popUpWindow.removeClass(animationFunctionOut)
    else
      popUpWindow.changeZIndex('-1')
      popUpWindow.addClass(animationFunctionOut)
      popUpWindow.removeClass(animationFunctionIn)
)(jQuery)



###
  Function scroll to element
  @param jQuery object type
###
(($) ->
  $.fn.scrollToElement = (jobDetails) ->
    positionOfElementToScroll = jobDetails.offset().top - 80
    $("body").animate( { scrollTop: positionOfElementToScroll }, 600)


)(jQuery)


###
  Easy zIndex changing function
  @param zIndex sting index to set for current element
###
(($) ->

  $.fn.changeZIndex = (zIndex) ->
    $(this).css('z-index', zIndex)

)(jQuery)



###
  Animate element with sending animations parameters
  uses only if it's child element of $this
  @element string element to find as a child
  @param animationFunctionIn string function to show element
  @param animationFunctionOut function to hide element
  @return void
  @use hideOrShow() function
###
(($) ->
  $.fn.animateElement = ( element,animationFunctionIn, animationFunctionOut) ->
    $(this).click ->
      popUpWindow = $(this).parent().parent().find(element)
      popUpWindow.hideOrShow(animationFunctionIn, animationFunctionOut)

)(jQuery)



###
  Hide element if click was outside of him
  @param elementToSearch string with ". or #" element which click hide function automatic
  @param elementToHide string with ". or #" element which would be hidden after success
  @param functionToHide string animation function OUT
  @param classToRemove string with "." class removed after success
###

(($) ->
  $.fn.hideElementOnOutsideClick = (elementToSearch, elementToHide, functionToHide, classToRemove) ->

    self = $(this)

    elementToSearch = elementToSearch
    elementToHide  = elementToHide
    functionToHide = functionToHide
    classToRemove = classToRemove

    self.on 'click', (event) ->
      if event.target.className != elementToSearch && ! isHoveredDashboard
        $(elementToHide).addClass(functionToHide).changeZIndex('-1').removeClass(classToRemove)
)(jQuery)



###
  Function specific for Jobs table  extend table on element clicked
  @param event type event
###
(($) ->
  $.fn.maximazeMinimazeTable = (event) ->
    event.preventDefault()
    self = $(this)
    divToSearch = self.parents('td')
    trToExpand = divToSearch.parent('tr')
    wrapper = trToExpand.find('.bmn-overlay--wrapper').toggleClass('active')

    jobDetails = divToSearch.find('.job-details')
    jobDetailsHeight = jobDetails.height()
    wrapper.height(jobDetailsHeight+ 80 + "px")

    trToExpand.css('height', jobDetailsHeight+80 + 'px')
    #custom animated classes
    #jobDetails.hideOrShow('fadeIn', 'fadeOut')
    self.scrollToElement(jobDetails)
    if ! wrapper.hasClass('active')
      wrapper.css('height', '0')
#      trToExpand.css('height', "20px")
      trToExpand.height("20px")


)(jQuery)

#Add image URL and other data information to image-wrapper
#element
(($) ->
  $.fn.changeImageAndLink = (elementWhereChange) ->
    self = $(this)
    imageWrapper = self.parents('tr.to-expand').find('.full-image-wrapper')
    #elementWhereChange
    td = self.find('td')
    frameID = self.find('td').eq(0).text()
    imageUrl = td.attr('data-image-url')
    renderTime = self.find('td').eq(5).text()


    #setImage
    imageWrapper.css( 'background-image', "url('#{imageUrl}')" )
    #Change frame number
    imageWrapper.find('.frame-text').text("Frame: #{frameID}")
    #Change pop-up image URL
    imageWrapper.find('a.pop-up--image').attr('href', imageUrl)
    #RenderTime
    imageWrapper.find('.render-time').text('Render Time: '+ renderTime)

    console.dir(frameID)
    console.dir(imageUrl)
    console.dir(imageWrapper)

)(jQuery)

(($) ->
  $.fn.overrideBudget = () ->
    self = $(this)
    wrapper = self.parent('.budget')
    budgetInput = wrapper.find('.job-budget-input')
    if budgetInput.attr('disabled')
      budgetInput.removeAttr('disabled')
    else
      budgetInput.attr('disabled', 'disabled')
)(jQuery)

