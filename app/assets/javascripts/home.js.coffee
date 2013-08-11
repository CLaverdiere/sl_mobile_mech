# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Add hover color to all links
$ ->
  $(document).on 'mouseenter', 'a', ->
    $(this).addClass "hover-color"
  $(document).on 'mouseleave', 'a', ->
    $(this).removeClass "hover-color"
