var userAgent = window.navigator.userAgent.toLowerCase();
if (userAgent.indexOf('msie') != -1
 || userAgent.indexOf('trident') != -1) {
 window.location.replace("https://gigaplus.makeshop.jp/yostarshop/test/do_not_use_ie.html");
}


$(function () {

 
 //---------------------------------------------------------
 // dropdown navi
 //---------------------------------------------------------
 var scrollpos = 0;
 $('.dropdown-switch').on('click', function () {
  if ($('body').hasClass('fixed')) {
   $('body').removeClass('fixed').css({
    'top': 0
   });
   window.scrollTo(0, scrollpos);
  } else {
   scrollpos = $(window).scrollTop();
   $('body').addClass('fixed').css({
    'top': -scrollpos
   });
  }
  return false;
 });

 $('body').on('click', function (e) {
  if ($(e.target).closest('.dropdown-nav').length === 0 && $('body').hasClass('fixed')) {
   $('body').removeClass('fixed').css({
    'top': 0
   });
   window.scrollTo(0, scrollpos);
   return false;
  }
 });



 //---------------------------------------------------------
 // page top button
 //---------------------------------------------------------
 let pagetop = $('#data-pagetop');
 // ボタン非表示
  pagetop.hide();
  // 300px スクロールしたらボタン表示
  $(window).scroll(function () {
   if ($(this).scrollTop() > 300) {
    pagetop.fadeIn();
   } else {
    pagetop.fadeOut();
   }
  });
  pagetop.click(function () {
  $('body, html').animate({ scrollTop: 0 }, 500);
  return false;
  });

 
 
});

 //---------------------------------------------------------
 // dropdown navi sp
 //---------------------------------------------------------
/*
$('#data-spnav .spnav-category-list a').click(function() {
 var child = $(this).siblings();
 if (child.length > 0) {
  if (child.is(':visible')) {
   return true;
  } else {
   child.slideToggle();
   return false;
  }
 }
 });
*/



$(function () {
 $(".spnav-category-list-child").hide();

 $("#data-spnav .spnav-category-item.has-category > a").on("click", function() {
  if($(this).hasClass('active')){
  } else {
   event.preventDefault();
  }
  $($(this).next(".spnav-category-list-child")).slideToggle();
  $(".spnav-category-list-child li").removeClass("active");//追加部分
  $(this).toggleClass("active");//追加部分
 });
 
});

