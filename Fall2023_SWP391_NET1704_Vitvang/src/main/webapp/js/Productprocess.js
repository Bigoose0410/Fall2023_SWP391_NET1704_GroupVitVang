function confirmAdd() {
     var confirmed = confirm("Are you sure you want to add?");

     if (confirmed) {
          document.getElementById('addForm').submit(); // Submit the form if confirmed
     }
}