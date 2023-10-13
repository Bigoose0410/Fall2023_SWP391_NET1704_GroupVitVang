/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function () {
     var rowIdx = 0;
     var optionList = [];
     $('#addBtn').on('click', function () {
     $.ajax({
             type: 'GET',
             url: 'http://localhost:8080/Fall2023_SWP391_NET1704_Vitvang/ListCageController',
             success: function (response) {
//               optionList = response.data;
             var htmlelement = document.getElementById("addproduct");
                     htmlelement.appendChild(response);
             },
             error: function (response) {
             console.log(response);
             }
     });

     });

     $('#cage-tbody').on('click', '.remove', function () {
          var child = $(this).closest('tr').nextAll();
          child.each(function () {
               var id = $(this).attr('id');
               var idx = $(this).children('.row-index').children('p');
               var dig = parseInt(id.substring(1));
               idx.html(`Row ${dig - 1}`);
               $(this).attr('id', `R${dig - 1}`);
          });
          $(this).closest('tr').remove();
          rowIdx--;
     });
});


