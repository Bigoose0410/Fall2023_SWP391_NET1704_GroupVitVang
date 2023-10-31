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

// Mở form popup
document.getElementById('addBtn').addEventListener('click', function() {
  document.getElementById('popupForm').classList.remove('hidden');
  document.getElementById('overlay').classList.remove('hidden');
});

// Đóng form popup
document.getElementById('closeBtn').addEventListener('click', function() {
  document.getElementById('popupForm').classList.add('hidden');  
});
const closeBtn = document.getElementById('closeBtn');

closeBtn.addEventListener('click', () => {
  document.getElementById('popupForm').classList.add('hidden');
   document.getElementById('overlay').classList.add('hidden'); 
});


