/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function() {
    var $table = $('.tablesorter-custom');

    // Search functionality
    $('.search input').on('input', function() {
        var searchString = $(this).val().toLowerCase();
        var columnIndex = $(this).data('column');

        var tableRows = $table.find('tbody tr');

        tableRows.each(function() {
            var cellText = $(this).find('td').eq(columnIndex).text().toLowerCase();

            if (cellText.includes(searchString)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });
});

