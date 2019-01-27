<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.root.function.ResearchStudentFunction"%>
<%@include file="jsp/adminheader.jsp" %>  

<%

String researchStudent = ResearchStudentFunction.listImport();
JSONObject researchStudentJsonObject = new JSONObject(researchStudent);
JSONArray researchStudentJsonArray = researchStudentJsonObject.getJSONArray("Data");

%>

 
            <div class="container-fluid">
                <h1>Registered Students</h1>
			
				<div class="row">
					<div style="float:right;">
					<a href="#!" data-toggle="modal" data-target="#myModal" class="btn btn-default">Import CSV File</a>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-2">
					</div>
					<div class="col-sm-8">
						<table id="example" class="table table-striped table-bordered" style="width:100%">
					        <thead>
					            <tr>
					                <th>S.No.</th>
					                <th>RegID</th>
					                <th>Family Name</th>
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
					                <td><%=result.get(0).get("FullName") %></td>
					            </tr>
					            <%} %>
					            
					        </tbody>
					       </table>
						
					</div>
				</div>
				
            </div>


	<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Import CSV</h4>
      </div>
      <div class="modal-body row">
        <form action="research/importCSV" method="post" onsubmit="" enctype="multipart/form-data" class="col-sm-12">
		  <div class="form-group">
			<input type="file" class="form-control" id="myfile" name="myfile">
		  </div>
		  <button type="submit" class="col-sm-4 btn btn-default">Submit</button>
		</form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<%@include file="jsp/adminfooter.jsp" %>   

<script>
$("#liImport").addClass("active");

$(document).ready(function() {
    $('#example').DataTable();
} );

if (getParameterByName("isSuccess") != null) {
	
	swal(getParameterByName("Response"));
}
</script>