// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.tools.min
//= require_tree .

$(document).ready(function() {
  changeSelected($('li.selected_category > a'))
})


function changeSelected(elem, toogle) {
    var parent = elem.parent().parent();
    var oElem = elem.next();
    var oe = $(elem.parent()).detach();
    parent.prepend(oe);
    $(oElem).slideToggle();
}

//$(document).ready(function() {
//
//    menu = '.side_menu';
//    frezee = false;
//    center = {'left' : 0, 'top' : 0};
//    enter = {'left' : 0, 'top' : 0};
//
//    function showMenu() {
//        $(menu).css('background-color', 'goldenrod');
//        enter = $(menu).position();
//        $('#side_menu').show();
//        $('.menu_title').hide();
//
//    }
//
//    function hideMenu() {
//        $(menu).css('background-color', 'black');
//        $('#side_menu').hide();
//        $('.menu_title').show();
//        frezee = false;
//    }
//
//    $(menu).mouseenter(function() {
//        showMenu();
//        frezee = true;
//    })
//
//    $(menu).mouseleave(function(event) {
//        size = {'width' : $(menu).width(), 'height' : $(menu).height()};
//        hideMenu();
//        nsize = {'width' : $(menu).width(), 'height' : $(menu).height()};
//
//        center = {'left' : event.pageX - enter.left - xcoeff * (size.width - nsize.width), 'top' : event.pageY - enter.top - ycoeff * (size.height - nsize.height)};
//    })
//
//    $(document).mousemove(function(event) {
//        if (!frezee)
//            $(menu).css({'left' : event.pageX - center.left, 'top' : event.pageY - center.top});
//    });
//});
