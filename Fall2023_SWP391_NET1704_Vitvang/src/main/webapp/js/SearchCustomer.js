/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function () {

function AddCusForm() {
$('#addNewCus').on('click', function () {
$('#formcus').append(`
               <form action="MainController">
                <input type="text" class="form-control" placeholder="Customer ID" name="txtUserID" > <br>
                <input type="text" class="form-control" placeholder="Customer Name" name="txtName"> <br>
                <input type="number" class="form-control" placeholder="Phone Number" name="txtPhoneNumber"> <br>
                <fieldset>
                    <select name="txtGender" class="form-control">
                        <option value="M" selected>Male</option>
                        <option value="F">Female</option>
                    </select>
                </fieldset> <br>
                <input type="text" class="form-control" placeholder="Adress" name="txtAdress"> <br>
                <input type="date" class="form-control" placeholder="BirthDate" name="txtBirthDate"><br>
                <input type="email" class="form-control" placeholder="Email" name="txtEmail"><br>
                <input type="email" class="form-control" placeholder="Account Username" name="txtUsername"><br>
                <input type="email" class="form-control" placeholder="Account Password" name="txtPassword"><br>
                <input type="hidden" class="form-control"  name="txtRoleID" value="4"><br>
         
                <button class="btn btn-md btn-primary" name = "btACtion" type="button" value = "New Customer">
                              Add new customer
                         </button>

                </form>
                
        `);
        });
}

}); 