// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require ckeditor/init
//= require jquery_nested_form
//= require dataTables/jquery.dataTables
//= require ahoy
//= require md5
//= require bootstrap
//= require modernizr.custom
//= require zoomSlider
//= require demos
//= require Gruntfile
//= require html5shiv.min
//= require jquery.desoslide.min
//= require jquery.smooth-scroll
//= require lightbox-2.6.min
//= require jquery.mixitup
//= require jquery.eachStep.min


$(document).ready(function() {
  $('#search-tour .tour-search-box').click(function(){
    $('#search-tour').toggleClass('show-tour-search-box');
    $('#reserv').removeClass('show-reservation-box');
    
  });
  $('#reserv .reserv-box').click(function(){
    $('#reserv').toggleClass('show-reservation-box');
    $('#search-tour').removeClass('show-tour-search-box');
  });
});
