<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.root.function.ForumFunction"%>
<%@include file="jsp/adminheader.jsp" %>   
<%

String forumIdDeactive = request.getParameter("deactive");
String forumIdActive = request.getParameter("active");

if (forumIdDeactive != null) {
	ForumFunction.deactive(forumIdDeactive);
}

if (forumIdActive != null) {
	ForumFunction.active(forumIdActive);
}


String forum = ForumFunction.listAllFourm();
JSONObject forumJsonObject = new JSONObject(forum);
JSONArray forumJsonArray = forumJsonObject.getJSONArray("Data");

%>
            <div class="container-fluid">
			
				<div class="row">
					<div class="col-sm-12">
            	    <h1>Managing Forum</h1>
						
						<table id="example" class="table table-striped table-bordered" style="width:100%">
					        <thead>
					            <tr>
					                <th>S.No.</th>
					                <th>RegID</th>
					                <th>Title</th>
					                <th>Message</th>
					                <th>FileName</th>
					                <th>Created Date</th>
					                <th>Status</th>
					            </tr>
					        </thead>
					        <tbody>
					        <%
					        	for(int i=0; i<forumJsonArray.length(); i++)
								{
									ArrayList<JSONObject> result = new ArrayList<>();
									result.add(forumJsonArray.getJSONObject(i));
								%>
								 <tr>
					                <td><%=(i+1) %></td>
					                <td><%=result.get(0).get("ProfileId") %></td>
					                <td><label id="title<%=result.get(0).get("ForumId") %>"><%=result.get(0).get("Title") %></label></td>
					                <td><label id="message<%=result.get(0).get("ForumId") %>"><%=result.get(0).get("Message") %></label></td>
					                <% if(!result.get(0).get("FileName").equals("0")) { %>
					                <td><a href="/uploadFiles/<%=result.get(0).get("FileName") %>"  target="_blank" class="btn-href"><%=result.get(0).get("FileName") %></a></td>
					                <%} else { %>
					                <td></td>
					                <%} %>
					                <td><%=result.get(0).get("CreatedDate") %></td>
					                <td>
					                <button onclick="updateForum(<%=result.get(0).get("ForumId") %>)" class="btn-update" style="background-color:blue;">Update</button>
					                
					                <% if(result.get(0).getInt("Status") == 0) { %>
									<a href="#" onclick="active(<%=result.get(0).get("ForumId") %>)" class="btn-delete">DeActive</a>
									<%} else { %>
									<a href="#" onclick="deactive(<%=result.get(0).get("ForumId") %>)" class="btn-update">Active</a>
									<% } %>
									</td>
					            </tr>
					            
								<%} %>
								
					           
					            </tbody>
					       </table>
					</div>
					
				</div>
				
            </div>
<script>


function deactive(id){
	
	swal({
		  title: 'Are you sure?',
		  text: "To Deactive",
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, Deactive it!'
		}).then((result) => {
		  if (result.value) {
			  location.href="?deactive="+id
		  }
		})
		
}


function active(id){
	
	swal({
		  title: 'Are you sure?',
		  text: "To Active",
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, Active it!'
		}).then((result) => {
		  if (result.value) {
			  location.href="?active="+id
		  }
		})
		
}

</script>


	<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Post Forum</h4>
      </div>
      <div class="modal-body row">
        <form action="forum/update" method="post" autocomplete="off" onsubmit="return ValidationEvent()" class="col-sm-12" enctype="multipart/form-data">
		  <div class="form-group"><input type="hidden" class="form-control" placeholder="Title" id="forumid" name="forumid">
			<input type="text" class="form-control" placeholder="Title" id="title" name="title">
		  </div>
		  <div class="form-group">
			<textarea class="form-control" placeholder="Message" id="message" name="message"></textarea>
		  </div>
		  <div class="form-group">
			<label>Select File</label>
			<input type="file" id="file" name="file">
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
$("#liForumPost").addClass("active");

$(document).ready(function() {
    $('#example').DataTable();
} );

function updateForum(id)
{
	$('#forumid').val(id);
	$('#title').val($("#title"+id).html());
	$('#message').val($("#message"+id).html());
	$("#myModal").modal('show');
}
</script>