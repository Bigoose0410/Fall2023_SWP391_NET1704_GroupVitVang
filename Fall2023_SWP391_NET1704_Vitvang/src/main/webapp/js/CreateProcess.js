/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener('DOMContentLoaded', function() {
  // Get a reference to the "New Step" button
  var newStepButton = document.querySelector('.btn-1');

  // Get a reference to the dashboard1 section
  var dashboard1 = document.querySelector('.dashboard1');

  // Add an event listener to the "New Step" button
  newStepButton.addEventListener('click', function() {
      // Toggle the display property of the dashboard1 section
      dashboard1.style.display = 'block';
  });
});

