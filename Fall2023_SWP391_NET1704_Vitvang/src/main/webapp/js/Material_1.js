document.addEventListener('DOMContentLoaded', function () {
    // Get the 'New Step' button element
    const newStepButton = document.querySelector('.btn-1');
  
    // Get the step form element
    const stepForm = document.querySelector('.tablesorter-custom1');
  
    // Add an event listener to the 'New Step' button
    newStepButton.addEventListener('click', function () {
        // Toggle the visibility of the step form
        if (stepForm.style.display === 'none' || stepForm.style.display === '') {
            stepForm.style.display = 'block';
        } else {
            stepForm.style.display = 'none';
        }
    });
  });