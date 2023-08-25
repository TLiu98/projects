
// script.js
$(document).ready(function() {

    // Attach event handlers
    $("#home").click(goHome);
    $("#blog").click(goBlog);

    function goHome() {
        $("#home").addClass("nav-active");
        $("#blog").removeClass("nav-active");
        $("#home1").show();
    }

    function goBlog() {
        $("#blog").addClass("nav-active");
        $("#home").removeClass("nav-active");
        $("#home1").hide();
    }
});



    // $.get("https://blog.imlazy.ink:233/index.php/feed/", function (data) {
    //     $('#blogs').empty();
    //     $(data).find('item').each(function () {
    //         var $item = $(this);
    //         var title = $item.find('title').text();
    //         var link = $item.find('link').text();
    //         //var description = $item.find('description').text();
    //         //var pubDate = $item.find('pubDate').text();
    //         var html = "<div class=\"box-item\">";
    //         html += "<b>" + title + "</b>";
    //         //html += "<em>" + timeString(pubDate) + "</em>";
    //         //html += "<p>" + description + "</p >";
    //         html += "&nbsp;&nbsp;->&nbsp;&nbsp;Read More";
    //         html += "</div>";
    //
    //         $('#blogs').append(html);
    //     });
    // });


