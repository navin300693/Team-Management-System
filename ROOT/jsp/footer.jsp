		 </div>
        <!-- /#page-content-wrapper -->

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


</script>
</body>
</html>