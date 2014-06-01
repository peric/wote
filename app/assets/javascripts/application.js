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
//= require turbolinks
//= require_tree .
//= require bootstrap.min
//= require spin.min
//= require ladda.min

$(function() {
    // Gets the form and adds proper action to it
    var getForm = function($that) {
        var url   = $that.data('url');
        var $form = $that.closest('form');

        $form.attr('action', url);

        return $form;
    }

    $('.vote-downvote').click(function(e) {
        e.preventDefault();

        var $form = getForm($(this));

        $form.submit();
    });

    $('.vote-upvote').click(function(e) {
        e.preventDefault();

        var $form = getForm($(this));

        $form.submit();
    });

   /* $('.understand').click(function(e) {

    });*/

    Ladda.bind('.understand');
});
