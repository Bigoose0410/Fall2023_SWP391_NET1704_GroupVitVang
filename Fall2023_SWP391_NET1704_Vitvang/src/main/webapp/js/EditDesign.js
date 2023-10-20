/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener('DOMContentLoaded', function () {
     // Get the 'New Step' button element
     const newStepButton = document.querySelector('.custom-btn.btn-1');

     // Get the process form element
     const processForm = document.querySelector('.tablesorter-custom1');

     // Add an event listener to the 'New Step' button
     newStepButton.addEventListener('click', function () {
          // Toggle the visibility of the process form
          processForm.style.display = 'block';
     });
});

