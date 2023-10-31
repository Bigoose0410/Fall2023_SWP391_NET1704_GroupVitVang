/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener('DOMContentLoaded', function () {
     // Add an event listener to the button with class 'toggle-button'
     document.querySelector('.toggle-button').addEventListener('click', function () {
          // Toggle the display property of the 'material_table' section
          document.querySelector('.material_table').classList.toggle('show-table');
     });

     // Add an event listener to the button with class 'toggle-button1'
     document.querySelector('.toggle-button1').addEventListener('click', function () {
          // Toggle the display property of the 'process_table' section
          document.querySelector('.process_table').classList.toggle('show-table');
     });
});

