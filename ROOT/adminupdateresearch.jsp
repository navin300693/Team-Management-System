
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.root.function.ResearchStudentFunction"%>
<%@include file="jsp/adminheader.jsp" %>

<%
String researchId = request.getParameter("id");
if (researchId != null) {

}
%>
            <div class="container-fluid">
			
				<div class="row">
				<div class="col-sm-2">
				</div>
					<div class="col-sm-8">
					<%
					if (researchId == null) {
					%>
            	    <h1>Add Research Student</h1>
						<form action="research/insert" method="post" autocomplete="off" onsubmit="return ValidationEvent()">
						  <div class="form-group">
						  <label>Registration Id</label>
							<input type="text" class="form-control" placeholder="Registration ID *" id="regId" name="regId">
						  </div>
						  <div class="form-group">
						  <label>First Name</label>
							<input type="text" class="form-control" placeholder="First Name *" id="firstname" name="firstname">
						  </div>
						  <div class="form-group">
						  <label>Last Name</label>
							<input type="text" class="form-control" placeholder="Last Name" id="lastname" name="lastname">
						  </div>
						  <div class="form-group" style="display:none;">
						  <label>Mobile</label>
							<input type="text" class="form-control" placeholder="Mobile" id="mobile" name="mobile">
						  </div>
						  <div class="form-group">
						  <label>Email</label>
							<input type="email" class="form-control" placeholder="Email *" id="email" name="email">
						  </div>
						  <div class="form-group">
						  <label>Password</label>
							<input type="text" class="form-control" placeholder="Password *" id="password" name="password">
						  </div>
						  <div class="form-group">
						  <label>Course</label>
							<input type="text" class="form-control" placeholder="Course *" id="course" name="course">
						  </div>
						  
						  <div class="form-group">
						  <label>Year</label>
							<input type="text" class="form-control" placeholder="Year *" id="year" name="year">
						  </div>
						  
						  <button type="submit" class="col-sm-4 btn btn-default">Add</button>
						</form> 
					<% } else { 
						String researchStudent = ResearchStudentFunction.listResearchStudentById(researchId);
						JSONObject researchStudentJsonObject = new JSONObject(researchStudent);
						JSONArray researchStudentJsonArray = researchStudentJsonObject.getJSONArray("Data");
						ArrayList<JSONObject> result = new ArrayList<>();
						result.add(researchStudentJsonArray.getJSONObject(0));
					%>
					 <h1>Update Research Student</h1>
						<form action="research/update" method="post" autocomplete="off" onsubmit="return ValidationEvent()">
						  <div class="form-group">
						  <label>Registration Id</label>
						  	<input type="hidden" id="researchId" name="researchId" value="<%=result.get(0).get("Id") %>">
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
						  <div class="form-group" style="display:none;">
						  <label>Mobile</label>
							<input type="text" class="form-control" placeholder="Mobile *" id="mobile" name="mobile" value="<%=result.get(0).get("Mobile") %>">
						  </div>
						  <div class="form-group">
						  <label>Email</label>
							<input type="email" class="form-control" placeholder="Email *" id="email" name="email" value="<%=result.get(0).get("Email") %>">
						  </div>
						  <div class="form-group">
						  <label>Password</label>
							<input type="text" class="form-control" placeholder="Password *" id="password" name="password" value="<%=result.get(0).get("Password") %>">
						  </div>
						  <div class="form-group">
						  <label>Course</label>
							<input type="text" class="form-control" placeholder="Course *" id="course" name="course" value="<%=result.get(0).get("Course") %>">
						  </div>
						  
						  <div class="form-group">
						  <label>Year</label>
							<input type="text" class="form-control" placeholder="Year *" id="year" name="year" value="<%=result.get(0).get("Year") %>">
						  </div>
						  
						  
						  <button type="submit" class="col-sm-4 btn btn-default">Update</button>
						</form> 
						<% } %>
					</div>
					
				</div>
				
            </div>

<%@include file="jsp/adminfooter.jsp" %>   
<script>
$("#liUpdateResearch").addClass("active");
$("#liUpdateResearch").css("display", "block");



if (getParameterByName("isSuccess") != null) {
	
	swal(getParameterByName("Response"));
}

function ValidationEvent()
{
	   if($('#regId').val().length == 0)
	   {
		   swal("Register Number Required");
		   return false;
	   }
	   else if($('#firstName').val().length == 0)
	   {
		   swal("First Name Required");
		   return false;
	   }
	   else if($('#email').val().length == 0)
	   {
		   swal("Email Required");
		   return false;
	   }
	   else if($('#password').val().length == 0)
	   {
		   swal("Password Required");
		   return false;
	   }
	   else if($('#course').val().length == 0)
	   {
		   swal("Course Required");
		   return false;
	   }
	   else if($('#year').val().length == 0)
	   {
		   swal("Year Required");
		   return false;
	   }
		   
	   else
		   return true;
	   
}
</script>
