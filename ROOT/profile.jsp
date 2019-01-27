<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.root.function.ResearchStudentFunction"%>
<%@include file="jsp/header.jsp" %>

<%
String researchId = session.getAttribute("RegId").toString();

String researchStudent = ResearchStudentFunction.listResearchStudentByRegId(researchId);
JSONObject researchStudentJsonObject = new JSONObject(researchStudent);
JSONArray researchStudentJsonArray = researchStudentJsonObject.getJSONArray("Data");
ArrayList<JSONObject> result = new ArrayList<>();
result.add(researchStudentJsonArray.getJSONObject(0));
%>

            <div class="container-fluid">
			
				<div class="row">
					<div class="col-sm-8">
                <h1>Profile Details</h1>
						<form>
						  <div class="form-group">
						  	<input type="hidden" id="researchId" name="researchId" value="<%=result.get(0).get("Id") %>">
							<input type="text" class="form-control" readonly placeholder="Registation ID *" id="regId" name="regId" value="<%=result.get(0).get("RegId") %>">
						  </div>
						  <div class="form-group">
							<input type="text" class="form-control" readonly placeholder="First Name *" id="firstname" name="firstname" value="<%=result.get(0).get("FirstName") %>">
						  </div>
						  <div class="form-group">
							<input type="text" class="form-control" readonly placeholder="Last Name" id="lastname" name="lastname" value="<%=result.get(0).get("LastName") %>">
						  </div>
						  <div class="form-group" style="display:none;">
							<input type="text" class="form-control" readonly placeholder="Mobile *" id="mobile" name="mobile" value="<%=result.get(0).get("Mobile") %>">
						  </div>
						  <div class="form-group">
							<input type="email" class="form-control" readonly placeholder="Email *" id="email" name="email" value="<%=result.get(0).get("Email") %>">
						  </div>
						  <div class="form-group">
							<input type="text" class="form-control" readonly placeholder="Course *" id="course" name="course" value="<%=result.get(0).get("Course") %>">
						  </div>
						  
						  <div class="form-group">
							<input type="text" class="form-control" readonly placeholder="Year *" id="year" name="year" value="<%=result.get(0).get("Year") %>">
						  </div>
						  
						</form> 
						
					</div>
					
					<div class="col-sm-4">
					<h1>Update Password</h1>
					 <form action="research/passwordupdate" method="post" autocomplete="off" onsubmit="return ValidationEvent()">
					  <div class="form-group">
					  	<input type="hidden" id="researchId" name="researchId" value="<%=result.get(0).get("Id") %>">
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
        </div>

<%@include file="jsp/footer.jsp" %>


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