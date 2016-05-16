// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(function() {
  $(".panel-btn").click(function(){
    var clickPanel = $("+.panel",this);
    clickPanel.toggle();
    $(".panel").not(clickPanel).slideUp(0);
    
    
    return false;
  });
});

$(function() {
  $(".haguruma-btn").click(function(){
    var clickPanel = $("+.haguruma",this);
    clickPanel.toggle();
    $(".haguruma").not(clickPanel).slideUp(0);
    
    
    return false;
  });
});


$(function() {
    $("#tab td").click(function() {
        var num = $("#tab td").index(this);
        $(".content_wrap").addClass('disnon');
        $(".content_wrap").eq(num).removeClass('disnon');
        $("#tab td").removeClass('select');
        $(this).addClass('select')
    });
});



