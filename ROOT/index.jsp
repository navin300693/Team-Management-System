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
<div class="jumbotron text-center">
  <h1>Welcome To</h1>
  <p>Team Management Project!</p> 
</div>
  
<div class="container">
  <div class="row">
    <a href="masterlogin" class="col-sm-3 home_btn">
      Master
    </a>
	 <a href="login" class="col-sm-4 home_btn">
      Research students
    </a>
	<a href="register" class="col-sm-4 home_btn">
      Course students
    </a>
  </div>
</div>

</body>


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

</script>

</html>