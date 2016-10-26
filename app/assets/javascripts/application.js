// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require materialize-sprockets


$(document).ready(function () {
    var items = 1;
    $("#newevent").click(function () {
        items++;
        $("#newevent").append("<div class='row'><div class='input-field col s8'><input name='item_name[" + items + "]' type='text'><label class='active'>Item needed</label></div><div class='input-field col s4'><input name='item_quantity[" + items + "]' type='text'><label class='active'>Quantity</label></div></div>")
    });
    $("#addrow").click(function () {
        items++;
        $("#newevent").append("<div class='row'><div class='input-field col s8'><input name='item_name[" + items + "]' type='text'><label class='active'>Item needed</label></div><div class='input-field col s4'><input name='item_quantity[" + items + "]' type='text'><label class='active'>Quantity</label></div></div>")
    });
});