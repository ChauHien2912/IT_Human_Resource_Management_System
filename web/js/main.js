$(document).ready(function () {
    $("#sidebarCollapse").on("click", function () {
        $("#sidebar").toggleClass("active");
        $(this).toggleClass("active");
    });

    // Xử lý sự kiện khi nhấp vào mục lớn có class "collapse"
    $("li > a[data-bs-toggle='collapse']").on("click", function (e) {
        e.preventDefault(); // Prevent the default behavior of the anchor tag
        var submenu = $(this).next(".collapse");
        submenu.collapse("toggle");
        e.stopPropagation(); // Stop the event from propagating to the parent collapsible element
    });

    // Xử lý sự kiện khi nhấp vào bất kỳ đâu trên trang
    $(document).on("click", function (e) {
        if (!$(e.target).closest("#sidebar").length && !$(e.target).closest(".collapse").length) {
            // Collapse the submenu when clicking outside of it
            $(".collapse").collapse("hide");
        }
    });
});

$(document).ready(function () {
    $(".includeButton").click(function () {
        var url = $(this).data("url");
        $.ajax({
            url: url,
            success: function (result) {
                $("#includedContent").html(result);
            }
        });
    });
});
function loadContent(url) {
    $.ajax({
        url: url,
        success: function (result) {
            $(".main #includedContent").html(result);
        }
    });
}