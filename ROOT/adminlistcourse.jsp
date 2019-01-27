
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.root.function.CourseStudentFunction"%>
<%@include file="jsp/adminheader.jsp" %>
<%

String courseId = request.getParameter("id");

if (courseId != null) {
	CourseStudentFunction.deleteCourseStudent(courseId);
}

String courseStudent = CourseStudentFunction.listCourseStudent();
JSONObject courseStudentJsonObject = new JSONObject(courseStudent);
JSONArray courseStudentJsonArray = courseStudentJsonObject.getJSONArray("Data");

%>

            <div class="container-fluid">
			
				<div class="row">
					<div class="col-sm-12">
            	    <h1>List Registered Team</h1>
						
						<table id="example" class="table table-striped table-bordered" style="width:100%">
					        <thead>
					            <tr>
					                <th>S.No.</th>
					                <th>RegID</th>
					                <th>Name</th>
					                <th>Team Name</th>
					                <th>Team Members</th>
					                <th>Option</th>
					            </tr>
					        </thead>
					        <tbody >
					        <%
					        	for(int i=0; i<courseStudentJsonArray.length(); i++)
								{
									ArrayList<JSONObject> result = new ArrayList<>();
									result.add(courseStudentJsonArray.getJSONObject(i));
								%>
					            <tr >
					                <td style="vertical-align:middle"><%=(i+1) %></td>
					                <td style="vertical-align:middle"><%=result.get(0).get("RegId") %></td>
					                <td style="vertical-align:middle"><%=result.get(0).get("FirstName") %></td>
					                <td style="vertical-align:middle"><%=result.get(0).get("TeamName") %></td>
					                <td style="vertical-align:middle"><%=result.get(0).get("Member") %></td>
					                 <td style="vertical-align:middle">
					                <a href="#" onclick="deactive(<%=result.get(0).get("Id") %>)" class="btn-delete">Deactive</a>
					                </td>
					            </tr>
					            <%} %>
					            </tbody>
					       </table>
					</div>
					
				</div>
				
            </div>


<%@include file="jsp/adminfooter.jsp" %>   

<script>

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

$("#liListCourse").addClass("active");

$(document).ready(function() {
    $('#example').DataTable();
} );

</script>