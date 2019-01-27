<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.root.function.ResearchStudentFunction"%>
<%@include file="jsp/adminheader.jsp" %>

<%

String researchId = request.getParameter("id");
if (researchId != null) {
	ResearchStudentFunction.deleteResearchStudent(researchId);
}

String researchStudent = ResearchStudentFunction.listResearchStudent();
JSONObject researchStudentJsonObject = new JSONObject(researchStudent);
JSONArray researchStudentJsonArray = researchStudentJsonObject.getJSONArray("Data");

%>

            <div class="container-fluid">
			
				<div class="row">
					<div class="col-sm-12">
            	    <h1>List Research Student</h1>
						
						<table id="example" class="table table-striped table-bordered" style="width:100%">
					        <thead>
					            <tr>
					                <th>S.No.</th>
					                <th>RegID</th>
					                <th>Name</th>
					                <th>Email</th>
					                <th>Password</th>
					                <th>Course</th>
					                <th>Year</th>
					                <th>Option</th>
					            </tr>
					        </thead>
					        <tbody>
					        <%
					        	for(int i=0; i<researchStudentJsonArray.length(); i++)
								{
									ArrayList<JSONObject> result = new ArrayList<>();
									result.add(researchStudentJsonArray.getJSONObject(i));
								%>
					            <tr>
					                <td><%=(i+1) %></td>
					                <td><%=result.get(0).get("RegId") %></td>
					                <td><%=result.get(0).get("FirstName") %></td>
					                <td><%=result.get(0).get("Email") %></td>
					                <td><%=result.get(0).get("Password") %></td>
					                <td><%=result.get(0).get("Course") %></td>
					                <td><%=result.get(0).get("Year") %></td>
					                <td>
					                <a href="updateResearch?id=<%=result.get(0).get("Id") %>" class="btn-update">Update</a>
					                <a href="#" onclick="deactive(<%=result.get(0).get("Id") %>)" class="btn-delete">Deactive</a>
					                </td>
					     	     </tr>
					          <%} %>
					            </tbody>
					       </table>
					</div>
					
				</div>
				
            </div>



<script>
$("#liListResearch").addClass("active");

$(document).ready(function() {
    $('#example').DataTable();
} );

function deactive(id){
	
	swal({
		  title: 'Are you sure?',
		  text: "To Deactive",
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, deactive it!'
		}).then((result) => {
		  if (result.value) {
			  location.href="?id="+id
		  }
		})
		
}

</script>

<%@include file="jsp/adminfooter.jsp" %>   