<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.root.function.ForumFunction"%>
<%@include file="jsp/header.jsp" %>   
<%

String forum = ForumFunction.listFourm();
JSONObject forumJsonObject = new JSONObject(forum);
JSONArray forumJsonArray = forumJsonObject.getJSONArray("Data");

%>

            <div class="container-fluid">
                <h1>Public Forum</h1>
			
				<div class="row">
					<div style="float:right;">
					<a href="#!" data-toggle="modal" data-target="#myModal" class="btn btn-default">New Forum</a>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-2">
					</div>
					<div class="col-sm-8">
					
					 			<%
					        	for(int i=0; i<forumJsonArray.length(); i++)
								{
									ArrayList<JSONObject> result = new ArrayList<>();
									result.add(forumJsonArray.getJSONObject(i));
								%>
					            	<div class="panel panel-default">
									  <div class="panel-heading"><%=result.get(0).get("Title") %></div>
									  <div class="panel-body"><%=result.get(0).get("Message") %></div>
									  <div class="panel-footer">Post on : <%=result.get(0).get("CreatedDate") %>
									  <span style="float:right;">
									   <% if(!result.get(0).get("FileName").equals("0")) { %>
					               		<a href="/uploadFiles/<%=result.get(0).get("FileName") %>"  target="_blank" class="btn-href"><%=result.get(0).get("FileName") %></a>
					                	<%}  %>
									  </span>
									  </div>
									</div>
								<%} %>
					            
					            
						
						<div class="panel panel-default">
						  <div class="panel-footer" align="center"><a href="" class="btn btn-default"><<</a>  <a href="" class="btn btn-default">>></a></div>
						</div>
						
					</div>
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
        <h4 class="modal-title">Post Forum</h4>
      </div>
      <div class="modal-body row">
        <form action="forum/add" method="post" autocomplete="off" onsubmit="return ValidationEvent()" class="col-sm-12" enctype="multipart/form-data">
		  <div class="form-group">
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


<%@include file="jsp/footer.jsp" %>   

<script>
$("#liForum").addClass("active");


if (getParameterByName("isSuccess") != null) {
	
	swal(getParameterByName("Response"));
}


function ValidationEvent()
{
	   if($('#title').val().length == 0)
	   {
		   swal("Title Required");
		   return false;
	   }
	   else if($('#message').val().length == 0)
	   {
		   swal("Message Required");
		   return false;
	   }
		   
	   else
		   return true;
	   
}

</script>