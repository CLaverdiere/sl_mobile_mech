# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  items = $('.appointment-container')
  $('#search').bind "keyup", ->
    search_str = $(this).val().toLowerCase()

    items.each -> 
      if $(this).attr('class').toLowerCase().indexOf(search_str) == -1
        $(this).fadeOut 'fast'
      else $(this).fadeIn 'fast'

  $(document).on 'click', '.appointment-container', ->
    $(".extra-info", this).toggle 'fast'

