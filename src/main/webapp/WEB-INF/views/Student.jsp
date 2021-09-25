<%@page contentType="text/html;charset=ISO-8859-9" pageEncoding="ISO-8859-9" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="./base.jsp"%>

<script>
	$(document).ready(function() {
		getAllrecord();
		
		$('#saveStudent').show();
		$('#updateStudent').hide();
		$('#idfield').hide();
		
		$('#saveStudent').click(function() {
			if (inputControl()){
				$.ajax({
					type : "POST",
					url : "insertStudent",
					data : {
						name : $("#name").val(),
						age : $("#age").val(),
						course : $("#course").val()
					},
					success : function(result) {
						getAllrecord();
						$('#studentForm')[0].reset()
					},
					error : function(err) {
						alert("error " + err)
					}
				});
			}else {
				alert("You will not leave any free space.")
			}
		});
	});
	var data = "";
	function getAllrecord() {
		$.ajax({
					type : "GET",
					url : "getAllStudent",
					success : function(response) {
						data = response
						 $('.tr').remove();
						for (i = 0; i < data.length; i++) {
							$("#studentTable")
									.append(
											'<tr class="tr"> <td>'
													+ data[i].id
													+ '</td> <td>'
													+ data[i].name
													+ '</td> <td>'
													+ data[i].age
													+ '</td> <td>'
													+ data[i].course
													+ '</td> <td><input type="button" class="btn btn-warning" onclick="editStudent('
													+ data[i].id
													+ ')"  value="Edit"></input></td> <td> <input type="button" class="btn btn-danger" onclick="deleteStudent('
													+ data[i].id
													+ ');" value="Delete"></input></td> </tr>');
						}
					},
					error : function(err) {
						alert("error " + err)
						console.log(err)
					}
				});
	}
	function editStudent(id) {
		$.ajax({
			type : "GET",
			url : "getByStudent/" + id,
			dataType : 'json',
			success : function(response) {

				$("#id").val(response.id), $("#name").val(response.name), $(
						"#age").val(response.age), $("#course").val(
						response.course)

				$('#saveStudent').hide();
				$('#updateStudent').show();
				$('#idfield').show();
			},
			error : function(err) {
				alert("error " + err)
			}
		});
	}
	function updateStudentbtn() {
		if (inputControl()){
			$.ajax({
				type : "POST",
				url : "updateStudent",
				data : {
					id : $("#id").val(),
					name : $("#name").val(),
					age : $("#age").val(),
					course : $("#course").val()
				},
				success : function(result) {
					getAllrecord();

					showBody();
				},
				error : function(err) {
					alert("error is" + err)
				}
			});
		}else {
			alert("You will not leave any free space.")
		}


	}
	function showBody(){
		$('#saveStudent').show();
		$('#updateStudent').hide();
		$('#idfield').hide();
		$('#studentForm')[0].reset()
	}

	function deleteStudent(id) {
		$.ajax({
			url : "deleteStudent/" + id,
			success : function(response) {
				getAllrecord();
				showBody();
			},
			error : function(err) {
				alert("error is" + err)
			}
		});
	}
	function inputControl() {
		var age = document.getElementById("age").value;
		var course = document.getElementById("course").value;
		var  name = document.getElementById("name").value;

		if (age != "" && course != "" && name != ""){
			return true;
		}else {
			return false;
		}

	}

</script>

</head>
<body>

	<div class="container mt-5">
		<form id="studentForm" name="studentform">
			<div class="row">
				<div class="col-6">
					<h3>Student Form</h3>


					<div class="row" id="idfield">
						<div class="col">
							<div class="form-group">
								<label for="id">ID</label>
								<input type="text" readonly="readonly" class="form-control" id="id" name="id">
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col">
							<div class="form-group">
								<label for="name">Name</label>
								<input type="text" class="form-control" id="name" name="name" placeholder="Enter Name"/>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col">
							<div class="form-group">
								<label for="age">Age</label>
								<input type="number" class="form-control" id="age" name="age" placeholder="Enter Age"/>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col">
							<div class="form-group">
								<label for="name">Course</label>
								<input type="text" class="form-control" id="course" name="course" placeholder="Enter Course"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<button type="button" id="saveStudent" class="btn btn-primary">Submit</button>
							<button type="button" id="updateStudent"
								onclick="updateStudentbtn()" class="btn btn-primary">Update</button>
						</div>
					</div>

					<h3>Students</h3>
					
					 <br>
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Age</th>
								<th scope="col">Course</th>
								<th scope="col">Edit</th>
								<th scope="col">Delete</th>
							</tr>
						</thead>
						<tbody id="studentTable">

						</tbody>
					</table>


				</div>

			</div>
		</form>
	</div>

</body>
</html>