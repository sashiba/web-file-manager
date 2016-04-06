$(document).ready(function(){
 $("ul.topnav a").hover(function(){
    $(this).parent().find("ul.subnav").slideDown('fast').show();
 }, function(){
      $(this).parent().find("ul.subnav").slideUp('slow');
    });
});

