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

    Ladda.bind('.understand');
});