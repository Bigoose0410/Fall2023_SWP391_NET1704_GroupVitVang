$(document).ready(function() {
    var $table1 = $('.tablesorter-custom');
    
    // Search functionality for the first table
    $('.search1 input').on('input', function() {
        var searchString = $(this).val().toLowerCase();
        var columnIndex = $(this).data('column');
        
        var tableRows = $table1.find('tbody tr');
        
        tableRows.each(function() {
            var cellText = $(this).find('td').eq(columnIndex).text().toLowerCase();
            
            if (cellText.includes(searchString)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });
    
    var $table2 = $('.tablesorter-custom1');
    
    // Search functionality for the second table
    $('.search2 input').on('input', function() {
        var searchString = $(this).val().toLowerCase();
        var columnIndex = $(this).data('column');
        
        var tableRows = $table2.find('tbody tr');
        
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