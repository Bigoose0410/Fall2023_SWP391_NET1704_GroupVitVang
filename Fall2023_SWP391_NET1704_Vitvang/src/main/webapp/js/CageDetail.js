/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener('DOMContentLoaded', function() {
    // Add an event listener to the button with class 'toggle-button' in dashboard
    document.querySelector('.dashboard .toggle-button').addEventListener('click', function() {
        // Toggle the display property of the 'dashboard1' section
        document.querySelector('.dashboard1').style.display = 'block';
        // Hide the toggle button in dashboard
        this.style.display = 'none';
    });

    // Add an event listener to the button with class 'toggle-button' in dashboard1
    document.querySelector('.dashboard1 .toggle-button').addEventListener('click', function() {
        // Toggle the display property of the 'dashboard1' section
        document.querySelector('.dashboard1').style.display = 'none';
        // Show the toggle button in dashboard
        document.querySelector('.dashboard .toggle-button').style.display = 'block';
    });
});

document.addEventListener('DOMContentLoaded', function() {
    // Add an event listener to the button with class 'toggle-button1' in dashboard
    document.querySelector('.dashboard .toggle-button1').addEventListener('click', function() {
        // Toggle the display property of the 'dashboard2' section
        document.querySelector('.dashboard2').style.display = 'block';
        // Hide the toggle button in dashboard
        this.style.display = 'none';
    });

    // Add an event listener to the button with class 'toggle-button1' in dashboard1
    document.querySelector('.dashboard2 .toggle-button1').addEventListener('click', function() {
        // Toggle the display property of the 'dashboard2' section
        document.querySelector('.dashboard2').style.display = 'none';
        // Show the toggle button in dashboard
        document.querySelector('.dashboard .toggle-button1').style.display = 'block';
    });
});

