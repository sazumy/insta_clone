// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require popper
//= require rails-ujs
//= require activestorage
//= require bootstrap-material-design/dist/js/bootstrap-material-design.js
//= require swiper/swiper-bundle.js
//= require_tree .

$(function() {
  $('.swiper-container').each(function(index){
    $(this).attr('id', 'slide-' + index );

    new Swiper('#slide-' + index, {
      loop: true,

      // If we need pagination
      pagination: {
        el: '.swiper-pagination',
      },

      // Navigation arrows
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      }
    })
  })
})

function checkInput(){
  var columns = $('#js_search_form').serializeArray(),
        q = ""

  $.each(columns, function(index, col){
    if (col.name === "utf8") return
    q += col.value
    return q
  })

  if (q == "") {
    location.href = "/"
    return false
  }
}
