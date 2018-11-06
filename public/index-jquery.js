/* global $, axios, ENV */

$(document).ready(function() {

  var text;

  $('#info').click(function() {
    $('#notice').toggle();
  });

  $('.brackets').hover(function() {
    $(this).toggleClass('magnify');
  });

});