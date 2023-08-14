var btnId = 0;

$(document).ready(() => {
    $("#add").click(() => {
        $("#view2").append("<button id=" + ++btnId + " style='border-color: grey;'>" + $('#input').val() + "</button>");
    });

    $("#delete").click(() => {
        $("#" + btnId--).remove();
    });

    $("#change").click(() => {
        $("#" + btnId--).text($('#input').val());
    });
});