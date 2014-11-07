ready = ->
  iedetect = (v) ->
    r = RegExp("msie" + ((if not isNaN(v) then ("\\s" + v) else "")), "i")
    r.test navigator.userAgent

  $.fn.fullpage
    scrollOverflow: false
    afterRender: ->
      $("#video")[0].play()
      return

  # Wait until the video meta data has loaded
  $("#section0 video").on "loadedmetadata", ->
    $width = undefined # Width and height of screen
    $height = undefined
    $vidwidth = @videoWidth # Width of video (actual width)
    $vidheight = @videoHeight # Height of video (actual height)
    $aspectRatio = $vidwidth / $vidheight # The ratio the video's height and width are in
    (adjSize = -> # Create function called adjSize
      $width = $(window).width() # Width of the screen
      $height = $(window).height() # Height of the screen
      $boxRatio = $width / $height # The ratio the screen is in
      $adjRatio = $aspectRatio / $boxRatio # The ratio of the video divided by the screen size

      # Set the container to be the width and height of the screen
      $("#section0").css
        width: $width + "px"
        height: $height + "px"

      if $boxRatio < $aspectRatio # If the screen ratio is less than the aspect ratio..
        # Set the width of the video to the screen size multiplied by $adjRatio
        $vid = $("#section0 video").css(width: $width * $adjRatio + "px")
      else

        # Else just set the video to the width of the screen/container
        $vid = $("#section0 video").css(width: $width + "px")
      return
    )() # Run function immediately

    # Run function also on window resize.
    $(window).resize adjSize
    $("#video")[0].play()
    return




$(document).ready(ready)
$(document).on('page:load', ready)
