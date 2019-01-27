<!DOCTYPE html>
<html lang="en">
<head>
  <title>Project</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/chat.css">
  <link href="css/simple-sidebar.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.19.1/sweetalert2.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.19.1/sweetalert2.js"></script>
  
</head>

<%

if(session.getAttribute("RegId")== null)
	 response.sendRedirect("/");
%>

<body>
<div id="wrapper" class="toggled">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="forum">
                        University
                    </a>
                </li>
                <li id="liForum">
                    <a href="forum">Public Forum</a>
                </li>
                <li id="liListForum">
                    <a href="forumposts">My Post</a>
                </li>
                <li id="liChat">
                    <a href="chat">Private Chat Room</a>
                </li>
                <li id="liProfile">
                    <a href="profile">Profile</a>
                </li>
                <li>
                    <a href="index">Log Out</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">