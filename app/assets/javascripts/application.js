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
//= require bootstrap
//= require angular
//= require ui-bootstrap
//= require_self
//= require offenses

var readyCallback = function() {
    $('header nav ul li ul').addClass('dropdown-menu');
    $('header nav ul li ul').parent().addClass('dropdown');
    $('header nav ul li.dropdown').children('a').addClass('dropdown-toggle');
    $('header nav ul li.dropdown').children('a').html(function(index, text){
        return text + ' <b class="caret"></b>';
    });

    $('header nav ul li ul').prev().attr('data-toggle','dropdown');
    $('header nav ul li ul').children('li').removeClass('active');
};

$(document).ready(readyCallback);

HuntThemDown = window.HuntThemDown || (window.HuntThemDown = {});

app = angular.module('HuntThemDown', ['ui.bootstrap']);
