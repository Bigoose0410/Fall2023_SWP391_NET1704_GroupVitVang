/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Duyệt qua mỗi button

 $('#toggleBtn-0').click(function() {
  //var index = $(this).closest('tr').index(); 
  $('#expand-0').toggleClass('hidden');
});

$('#toggleBtn-1').click(function() {
  //var index = $(this).closest('tr').index(); 
  $('#expand-1').toggleClass('hidden');
});
$('#toggleBtn-2').click(function() {
  //var index = $(this).closest('tr').index(); 
  $('#expand-2').toggleClass('hidden');
});
$('#toggleBtn-3').click(function() {
  //var index = $(this).closest('tr').index(); 
  $('#expand-3').toggleClass('hidden');
});
// Lưu trạng thái mở/đóng ban đầu
var isOpen = true; 

// Xử lý sự kiện click button
$('button').click(function() {

  // Lấy index button
  var index = $(this).data('index');

  // Toggle class để mở/đóng row chi tiết
  $('#expand-' + index).toggleClass('hidden');

  // Lấy icon eye tương ứng
  var eye = $(this).find('i'); 
  
  // Kiểm tra trạng thái để đổi icon
  if(isOpen) {
    eye.removeClass('uil-eye').addClass('uil-eye-slash');
  }
  else {
    eye.removeClass('uil-eye-slash').addClass('uil-eye');
  }
  
  // Đảo trạng thái 
  isOpen = !isOpen;

});