<%@page import="org.root.function.MasterFunction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@include file="jsp/adminheader.jsp" %>

<%
String masterId = session.getAttribute("MasterId").toString();

String master = MasterFunction.listMasterById(masterId);
JSONObject masterJsonObject = new JSONObject(master);
JSONArray masterJsonArray = masterJsonObject.getJSONArray("Data");
ArrayList<JSONObject> result = new ArrayList<>();
result.add(masterJsonArray.getJSONObject(0));
%>
            <div class="container-fluid">
			
				<div class="row">
					<div class="col-sm-8">
                <h1>Profile Details</h1>
						<form action="master/update" method="post" autocomplete="off">
						  <div class="form-group" style="display:none;">
						  	<label>Registration Id</label>
						  	<input type="hidden" id="masterId" name="masterId" value="<%=result.get(0).get("Id") %>">
							<input type="text" class="form-control" placeholder="Registration ID *" id="regId" name="regId" value="<%=result.get(0).get("RegId") %>">
						  </div>
						  <div class="form-group">
						  <label>First Name</label>
							<input type="text" class="form-control" placeholder="First Name *" id="firstname" name="firstname" value="<%=result.get(0).get("FirstName") %>">
						  </div>
						  <div class="form-group">
						  <label>Last Name</label>
							<input type="text" class="form-control" placeholder="Last Name" id="lastname" name="lastname" value="<%=result.get(0).get("LastName") %>">
						  </div>
						  <div class="form-group">
						  <label>Mobile</label>
							<input type="text" class="form-control" placeholder="Mobile *" id="mobile" name="mobile" value="<%=result.get(0).get("Mobile") %>">
						  </div>
						  <div class="form-group">
						  <label>Email</label>
							<input type="email" class="form-control" placeholder="Email *" id="email" name="email" value="<%=result.get(0).get("Email") %>">
						  </div>
						  
						  	<button type="submit" class="col-sm-4 btn btn-default">Update</button>
						</form> 
						
					</div>
					
					<div class="col-sm-4">
					<h1>Update Password</h1>
					 <form action="master/passwordupdate" method="post" autocomplete="off" onsubmit="return ValidationEvent()">
					  <div class="form-group">
					  <input type="hidden" id="masterId" name="masterId" value="<%=result.get(0).get("Id") %>">
						<input type="password" class="form-control" placeholder="Old Password" id="oldpassword" name="oldpassword">
					  </div>
					  <div class="form-group">
						<input type="password" class="form-control" placeholder="New Password" id="newpassword" name="newpassword">
					  </div>
					  <button type="submit" class="col-sm-4 btn btn-default">Update</button>
					</form> 
					
					</div>
				</div>
				
            </div>

<%@include file="jsp/adminfooter.jsp" %>   

<script>
$("#liProfile").addClass("active");

if (getParameterByName("isSuccess") != null) {
	
	swal(getParameterByName("Response"));
}

function ValidationEvent()
{
	   if($('#oldpassword').val().length == 0)
	   {
		   swal("Old Password Required");
		   return false;
	   }
	   else if($('#newpassword').val().length == 0)
	   {
		   swal("New Password Required");
		   return false;
	   }   
	   else
		   return true;
	   
}
</script>
