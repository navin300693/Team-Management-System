<!DOCTYPE html>
<html lang="en">
<head>
  <title>Project</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.19.1/sweetalert2.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.19.1/sweetalert2.js"></script>
  
</head>
<body>

<div class=" text-center">
<a href="index"><img class="logo" src="img/logo.jpg"></img></a>
  <h1>Login</h1>
  <div class="row">
  
	<div class="col-sm-4">
	</div>
	
    <div class="col-sm-4 login_panel" >
	  <form action="login/admin" method="post" autocomplete="off" onsubmit="return ValidationEvent()">
		  <div class="form-group">
			<input type="email" class="form-control" placeholder="Email" id="email" name="email">
		  </div>
		  <div class="form-group">
			<input type="password" class="form-control" placeholder="Password" id="password" name="password">
		  </div>
		  <button type="submit" class="col-sm-4 btn btn-default">Submit</button>
		</form> 

	</div>
    
  </div>
  
</div>
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
  
if (getParameterByName("isSuccess") != null) {
	
	swal(getParameterByName("Response"));
}

function ValidationEvent()
{
	   if($('#email').val().length == 0)
	   {
		   swal("Email Required");
		   return false;
	   }
	   else if($('#password').val().length == 0)
	   {
		   swal("Password Required");
		   return false;
	   }
		   
	   else
		   return true;
	   
}
</script>
</body>
</html>
