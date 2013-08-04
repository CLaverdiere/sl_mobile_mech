# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Add hover color to all links
$ ->
  $("a").hover (->
    $(this).addClass "hover-color"
    ), ->
    $(this).removeClass "hover-color"
