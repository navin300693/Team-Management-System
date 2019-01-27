<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.root.function.ChatFunction"%>
<%@include file="jsp/adminheader.jsp" %>

<%

String researchId = request.getParameter("id");
if (researchId != null) {
	
}

String researchStudent = ChatFunction.listResearchStudent();
JSONObject researchStudentJsonObject = new JSONObject(researchStudent);
JSONArray researchStudentJsonArray = researchStudentJsonObject.getJSONArray("Data");

%>

            <div class="container-fluid" style="margin-top: -25px;">
            	<div class="row wrap">
				
				<section class="left">
						<div class="profile">
								<p class="chat-title">Private Chat Room</p>
								<div class="icons">
								</div>
						</div>
						<div class="wrap-search">
								<div class="search">
										<i class="fa fa-search fa" aria-hidden="true"></i>
										<input type="text" class="input-search" id="search" placeholder="Search" autocomplete="off">
								</div>
						</div>
						<div class="contact-list">
						

							<ul class="chat-nav">
								<%
					        	for(int i=0; i<researchStudentJsonArray.length(); i++)
								{
									ArrayList<JSONObject> result = new ArrayList<>();
									result.add(researchStudentJsonArray.getJSONObject(i));
								%>
								
								<li class="filterSearch" id="lichat<%=result.get(0).get("Id") %>">
									<a href="masterChat?id=<%=result.get(0).get("Id") %>"><label id="chatname<%=result.get(0).get("Id") %>"><%=result.get(0).get("FirstName") %></label></a>
								</li>
								
								<%} %>
								
							</ul>
						</div>
				</section>

				<section class="right">
						<div class="chat-head">
								<input type="hidden" id="regid">
								<p class="chat-title" id="chatName"></p>
								<div style="position: absolute;width: 100%;margin-left: 50%;padding: 18px;">
								<form style="display: none;" id="attach" name="attach" method="post" action="chat/messageAttach" enctype="multipart/form-data">
								<input type="hidden" id="toid" name="toid">
								<label>
									<i class="fa fa-paperclip fa-lg" aria-hidden="true" style="cursor: pointer;">
										<input type="file" id="file" name="file" accept="image/*" style="display: none;">
									</i>
    							</label> 
    
								</form>
								</div>
						</div>
						<div class="wrap-chat">
								<div class="chat" id="chatbox">
								
									
									
								
								</div>
								<div class="information"></div>
						</div>
						<div class="wrap-message">
								<i class="fa fa-smile-o fa-lg" aria-hidden="true"></i>
								<div class="message">
										<input type="text" class="input-message" placeholder="Message" id="chatmessage" onkeypress="return keypress(event)">
								</div>
								<i class="fa fa-send fa-lg" aria-hidden="true" id="sentMessage" onclick="sentmessage()" style="cursor: pointer;"></i>
						</div>
				</section>
				
				</div>
            </div>
      
      <div style="display:none;" id="hiddenchat">
      
      								<div class="chat-from">
									<span class="name">Name</span>
									<span class="right">Datetime</span>
									<div class="panel arrow_box_left">
									  <div class="panel-body"></div>
									  <div class="panel-image"></div>
									  <div class="panel-footer-chat"></div>
									</div>
									</div>
									
									<div class="chat-to">
									<span class="name">Datetime</span>
									<span class="right">Name</span>
									<div class="panel arrow_box_right">
									  <div class="panel-body"></div>
									  <div class="panel-image"></div>
									  <div class="panel-footer-chat"></div>
									</div>
									</div>
									
      </div>
<%@include file="jsp/adminfooter.jsp" %>         
<script>


$("#liChat").addClass("active");

$(document).ready(function(){
	  $("#search").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
		$('.filterSearch').each(function(){
		   if($(this).text().toUpperCase().indexOf(value.toUpperCase()) != -1){
			   $(this).show();
		   }
		   else
			{
			$(this).hide();
			}
		});
	  });	  
});

function keypress(evt){
	var charCode = (evt.which) ? evt.which : event.keyCode;
	if (charCode == 13)
		sentmessage();
	return true;
}

if (getParameterByName("id") != null) {
	$("#chatName").text("Research Student: "+$("#chatname"+getParameterByName("id")).text());
	$("#attach").css("display","block");
	$("#regid").val(getParameterByName("id"));
	
	$("#toid").val(getParameterByName("id"));
	
	$("#lichat"+getParameterByName("id")).addClass("active_chat");
	
	$("#chatbox").html("");
	init_sync();
	sync();
	
}

function sentmessage()
{
	    
	if($("#chatmessage").val().length != 0)
	{
		var formData = {
            "fromid": "<%=session.getAttribute("MasterId") %>",
            "toid":$("#regid").val(),
            "message":$("#chatmessage").val()
        };

        $.ajax({
            url: "chat/message",
            type: "post",
            data: formData,
            success: function(data) {
            	init_sync();
            }
        });
	}
        
 }
 

$('#file').change(function(){
	
	document.attach.submit();
	
});
 
 
function init_sync(){

	var formData = {
            "fromid": "<%=session.getAttribute("MasterId") %>",
            "toid":$("#regid").val()
        };

 $.ajax({
        url: "chat/viewmessage",
        type: "post",
        data: formData,
        dataType: 'json',
        success: function(data) {
        	
        		 $("#chatbox").html("");
        	
	        	 $.each(data.Data, function(index, element) {
	        		 var chatMsgBaseCopy;
	        		 if(element.FromProfileId == "<%=session.getAttribute("MasterId") %>")
	        		{
	        			 chatMsgBaseCopy = $("#hiddenchat").find(".chat-to").clone();
	        			 $(chatMsgBaseCopy).find(".right").html(element.CreatedDate);
	        			 $(chatMsgBaseCopy).find(".name").html(element.FromName);
	        			 if(element.Message == "0")
	        				 $(chatMsgBaseCopy).find(".panel-image").html('<a href="/uploadFiles/'+element.Image+'" target="_blank"><img src="/uploadFiles/'+element.Image+'" style="margin-left: 30%;" height="100px" width="100px"></a>');
	        			 else
	        				 $(chatMsgBaseCopy).find(".panel-body").html(element.Message);
	        			 if(element.Status == 0)
	        				 $(chatMsgBaseCopy).find(".panel-footer-chat").html('<i class="fa fa-close"></i>');
	        			 else
	        				 $(chatMsgBaseCopy).find(".panel-footer-chat").html('<i class="fa fa-check"></i>');
	         		     $("#chatbox").append($(chatMsgBaseCopy));
	        		}
	        		 else
	        		 {
	        			 chatMsgBaseCopy = $("#hiddenchat").find(".chat-from").clone();
	        			 $(chatMsgBaseCopy).find(".right").html(element.CreatedDate);
	        			 $(chatMsgBaseCopy).find(".name").html(element.ToName);
	        			 if(element.Message == "0")
	        				 $(chatMsgBaseCopy).find(".panel-image").html('<a href="/uploadFiles/'+element.Image+'" target="_blank"><img src="/uploadFiles/'+element.Image+'" style="margin-left: 30%;" height="100px" width="100px"></a>');
	        			 else
	        				 $(chatMsgBaseCopy).find(".panel-body").html(element.Message);
	        			 if(element.Status == "0")
	        				 $(chatMsgBaseCopy).find(".panel-footer-chat").html('<i class="fa fa-close"></i>');
	        			 else
	        				 $(chatMsgBaseCopy).find(".panel-footer-chat").html('<i class="fa fa-check"></i>');
	         		     $("#chatbox").append($(chatMsgBaseCopy));
	        		 }
	        		 document.getElementById("chatbox").scrollTop = document.getElementById("chatbox").scrollHeight
	        		 $("#chatmessage").val("")
	             });
        	 
        }
    });
}
 
setInterval(function() {
	console.log("sync");
	sync()
	}, 5000);
 
 function sync(){

		var formData = {
	            "fromid": "<%=session.getAttribute("MasterId") %>",
	            "toid":$("#regid").val()
	        };
	
	 $.ajax({
	        url: "chat/viewmessage",
	        type: "post",
	        data: formData,
	        dataType: 'json',
	        success: function(data) {
	        	
	        	if(data.NewMessage == "1")
	        	{
	        		 $("#chatbox").html("");
	        	
		        	 $.each(data.Data, function(index, element) {
		        		 
		        		 var chatMsgBaseCopy;
		        		 if(element.FromProfileId == "<%=session.getAttribute("MasterId") %>")
		        		{
		        			 chatMsgBaseCopy = $("#hiddenchat").find(".chat-to").clone();
		        			 $(chatMsgBaseCopy).find(".right").html(element.CreatedDate);
		        			 $(chatMsgBaseCopy).find(".name").html(element.FromName);
		        			 if(element.Message == "0")
		        				 $(chatMsgBaseCopy).find(".panel-image").html('<a href="/uploadFiles/'+element.Image+'" target="_blank"><img src="/uploadFiles/'+element.Image+'" style="margin-left: 30%;" height="100px" width="100px"></a>');
		        			 else
		        				 $(chatMsgBaseCopy).find(".panel-body").html(element.Message);
		        			 if(element.Status == 0)
		        				 $(chatMsgBaseCopy).find(".panel-footer-chat").html('<i class="fa fa-close"></i>');
		        			 else
		        				 $(chatMsgBaseCopy).find(".panel-footer-chat").html('<i class="fa fa-check"></i>');
		         		     $("#chatbox").append($(chatMsgBaseCopy));
		        		}
		        		 else
		        		 {
		        			 chatMsgBaseCopy = $("#hiddenchat").find(".chat-from").clone();
		        			 $(chatMsgBaseCopy).find(".right").html(element.CreatedDate);
		        			 $(chatMsgBaseCopy).find(".name").html(element.ToName);
		        			 if(element.Message == "0")
		        				 $(chatMsgBaseCopy).find(".panel-image").html('<a href="/uploadFiles/'+element.Image+'" target="_blank"><img src="/uploadFiles/'+element.Image+'" style="margin-left: 30%;" height="100px" width="100px"></a>');
		        			 else
		        				 $(chatMsgBaseCopy).find(".panel-body").html(element.Message);
		        			 if(element.Status == "0")
		        				 $(chatMsgBaseCopy).find(".panel-footer-chat").html('<i class="fa fa-close"></i>');
		        			 else
		        				 $(chatMsgBaseCopy).find(".panel-footer-chat").html('<i class="fa fa-check"></i>');
		         		     $("#chatbox").append($(chatMsgBaseCopy));
		        		 }
		        		 document.getElementById("chatbox").scrollTop = document.getElementById("chatbox").scrollHeight
		        		 $("#chatmessage").val("")
		             });
	        	}
	        	 
	        }
	    });
 }
</script>