/* global $, axios, ENV */

$(document).ready(function() {

  var text;

  $('#info').click(function() {
    $('#notice').toggle();
  });

  $('.brackets').hover(function() {
    $(this).toggleClass("magnify");
  });

  $('#left-bracket').click(function() {
    var input = $('textarea');
    input.val(input.val() + "{" );
  });

  $('#right-bracket').click(function() {
    var input = $('textarea');
    input.val(input.val() + "}" );
  });

});