<!DOCTYPE html>
<html lang="en">
<head>
  <title>Project</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.19.1/sweetalert2.css">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.19.1/sweetalert2.js"></script>
</head>
<body>
<div class=" text-center">
  <a href="index"><img class="logo" src="img/logo.jpg"></img></a>
  <h1>Course Student</h1>
  <div class="row">
  
	<div class="col-sm-4">
	</div>
	
    <div class="col-sm-4 login_panel" id="lp">
	  <form action="course/check" method="post" autocomplete="off" onsubmit="return ValidationEvent()">
		  <div class="form-group">
			<input type="text" class="form-control" placeholder="Registration ID *" id="regId" name="regId">
		  </div>
		  <div class="form-group">
			<input type="text" class="form-control" placeholder="Family Name *" id="firstName" name="firstName">
		  </div>
		  
		  <button type="submit" class="col-sm-4 btn btn-default">Submit</button>
		</form> 

	</div>
	
	
	<div class="col-sm-4 register_panel" id="rp">
	  <form action="course/insert" method="post" id="formPost" autocomplete="off" onsubmit="return ValidationTeam()">
		  <div class="form-group">
			<input type="text" class="form-control" placeholder="Registration ID *" id="RegId" name="RegId" readonly>
		  </div>
		  <div class="form-group">
			<input type="text" class="form-control" placeholder="Family Name *" id="FirstName" name="FirstName" readonly>
		  </div>
		  
		  <hr>
		  <label>Team Name</label>
		  <div class="form-group">
			<input type="text" class="form-control" placeholder="Team Name *" id="teamName" name="teamName">
		  </div>
		  
		  <div class="form-group">
			<b>Team Members [Registration ID]</b>
		  </div>
		  
		  <div class="form-group col-sm-7">
			<input type="text" class="form-control" placeholder="Registration ID_Member 1 *" id="member1" name="member1">
		  </div>
		  <div class="form-group col-sm-5">
			<input type="text" class="form-control" placeholder="Family Name *" id="name1" name="name1">
		  </div>
		  
		  <div class="form-group col-sm-7">
			<input type="text" class="form-control" placeholder="Registration ID_Member 2 *" id="member2" name="member2">
		  </div>
		  <div class="form-group col-sm-5">
			<input type="text" class="form-control" placeholder="Family Name*" id="name2" name="name2">
		  </div>
		  
		  <div class="form-group col-sm-7">
			<input type="text" class="form-control" placeholder="Registration ID_Member 3" id="member3" name="member3">
		  </div>
		  <div class="form-group col-sm-5">
			<input type="text" class="form-control" placeholder="Family Name" id="name3" name="name3">
		  </div>
		  
		  <div class="form-group col-sm-7">
			<input type="text" class="form-control" placeholder="Registration ID_Member 4" id="member4" name="member4">
		  </div>
		  <div class="form-group col-sm-5">
			<input type="text" class="form-control" placeholder="Family Name" id="name4" name="name4">
		  </div>
		  
		  
		  
		  <button type="submit" class="col-sm-4 btn btn-default">Submit</button>
		</form> 

	</div>
    
  </div>
  
</div>
</body>

<script>



function getParameterByName(name, url) {
	if (!url)
		url = window.location.href;
	name = name.replace(/[\[\]]/g, "\\$&");
	var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex
			.exec(url);
	if (!results)
		return null;
	if (!results[2])
		return '';
	return decodeURIComponent(results[2].replace(/\+/g, " "));
}

$(document).ready(function(e) {
	window.history.replaceState(null, null, window.location.pathname);
});




if (getParameterByName("isSuccess") == "true") {
	document.getElementById("rp").style.display = "block";
	document.getElementById("lp").style.display = "none";
	$("#RegId").val(getParameterByName("regId"));
	$("#FirstName").val(getParameterByName("firstName"));
}
else{
	document.getElementById("rp").style.display = "none";
}

if (getParameterByName("isSuccess") != null) {
	
	swal(getParameterByName("Response"));
}
function ValidationTeam()
{
	   if($('#teamName').val().length == 0)
	   {
		   swal("Team Name Required");
		   return false;
	   }
	   else if($('#member1').val().length == 0)
	   {
		   swal("Atleast Two Team Members Required");
		   return false;
	   }
	   else if($('#name1').val().length == 0)
	   {
		   swal("Member's Family Name Required");
		   return false;
	   }
	   else if($('#member2').val().length == 0)
	   {
		   swal("Atleast Two Team Members Required");
		   return false;
	   }
	   else if($('#name2').val().length == 0)
	   {
		   swal("Member's Family Name Required");
		   return false;
	   }
	   else if($('#teamName').val().length != 0)
	   {
		   var count = 0;
		   		var formData = {
		            "teamName": $('#teamName').val()
		        };
				
		        $.ajax({
		            url: "course/checkTeamName",
		            type: "post",
		            data: formData,
		            success: function(data) {
		            	if(data == "1")
		            	{
		            	   swal("Team Name already registered.");
		         		   return false;
		            	}
		            	else
		            	{
		            		/* Team Member 1 */
		            			var formData = {
		        		            "member": $('#member1').val(),
		        		            "membername": $('#name1').val()
		        		        };

		        		        $.ajax({
		        		            url: "course/checkTeamMember",
		        		            type: "post",
		        		            data: formData,
		        		            dataType: 'json',
		        		            success: function(data) {
		        		            	if(data.Count != "0")
		        		            	{
		        		            		swal(data.Data);
		        		         		   return false;
		        		            	}
		        		            	else
		        		            	{
		        		            		/* Team Member 2 */
		    		            			var formData = {
		    		        		            "member": $('#member2').val(),
		    		        		            "membername": $('#name2').val()
		    		        		        };

		    		        		        $.ajax({
		    		        		            url: "course/checkTeamMember",
		    		        		            type: "post",
		    		        		            data: formData,
		    		        		            dataType: 'json',
		    		        		            success: function(data) {
		    		        		            	if(data.Count != "0")
		    		        		            	{
		    		        		            	   swal(data.Data);
		    		        		         		   return false;
		    		        		            	}
		    		        		            	else
		    		        		            	{
		    		        		            		/* Team Member 3 */
		    		    		            			var formData = {
		    		    		        		            "member": $('#member3').val(),
		    		    		        		            "membername": $('#name3').val()
		    		    		        		        };

		    		    		        		        $.ajax({
		    		    		        		            url: "course/checkTeamMember",
		    		    		        		            type: "post",
		    		    		        		            data: formData,
		    		    		        		            dataType: 'json',
		    		    		        		            success: function(data) {
		    		    		        		            	if(data.Count != "0")
		    		    		        		            	{
		    		    		        		            	   swal(data.Data);
		    		    		        		         		   return false;
		    		    		        		            	}
		    		    		        		            	else
		    		    		        		            	{
		    		    		        		            		/* Team Member 4 */
		    		    		    		            			var formData = {
		    		    		    		        		            "member": $('#member4').val(),
		    		    		    		        		            "membername": $('#name4').val()
		    		    		    		        		        };

		    		    		    		        		        $.ajax({
		    		    		    		        		            url: "course/checkTeamMember",
		    		    		    		        		            type: "post",
		    		    		    		        		            data: formData,
		    		    		    		        		            dataType: 'json',
		    		    		    		        		            success: function(data) {
		    		    		    		        		            	if(data.Count != "0")
		    		    		    		        		            	{
		    		    		    		        		            	   swal(data.Data);
		    		    		    		        		         		   return false;
		    		    		    		        		            	}
		    		    		    		        		            	else
		    		    		    		        		            	{
		    		    		    		        		            		document.getElementById("formPost").submit();
		    		    		    		        		            	}
		    		    		    		        		            }
		    		    		    		        		        });
		    		    		        		            	}
		    		    		        		            }
		    		    		        		        });
		    		        		            	}
		    		        		            }
		    		        		        });
		        		            	}
		        		            }
		        		        });
		            	}
		            }
		        });
		       return false;
	   }  
	   else
		   return true;
	   
}

function ValidationEvent()
{
	   if($('#regId').val().length == 0)
	   {
		   swal("Registered ID Required");
		   return false;
	   }
	   else if($('#firstName').val().length == 0)
	   {
		   swal("Family Name Required");
		   return false;
	   }
		   
	   else
		   return true;
	   
}

</script>
</html>
