#------------------------------------------------------------------------------
$(document).ready ->

  # For playing short audio.  Can not handle pausing.
  # Assume that file specified is an mp3. If mp3 is not supported, then fallback
  # to ogg if supported.  Assume ogg or m4a file is in same location.
  #------------------------------------------------------------------------------
  $('.dm_audio_button').on 'click', ->
    audio = new Audio()
    audio.src = $(this).data('src')
    audio.play();

