<!DOCTYPE html>
<html lang="en">
<head>
  <title>Project</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/chat.css">
  <link href="css/simple-sidebar.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.19.1/sweetalert2.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.19.1/sweetalert2.js"></script>
  
</head>
<body>
<%

if(session.getAttribute("MasterId")== null)
	 response.sendRedirect("/");
%>

<div id="wrapper" class="toggled">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="dashboard">
                        University
                    </a>
                </li>
                <li id="liDashboard">
                    <a href="dashboard">Public Forum</a>
                </li>
                <li id="liForumPost">
                    <a href="forumPost">Managing Forum</a>
                </li>
                <hr>
                <li id="liAddResearch">
                    <a href="addResearch">Add Research Student</a>
                </li>
                <li id="liUpdateResearch" style="display:none;">
                    <a href="#">Update Research Student</a>
                </li>
                <li id="liListResearch">
                    <a href="listResearch">List Research Student</a>
                </li>
                <li id="liChat">
                    <a href="masterChat">Private Chat Room</a>
                </li>
                <hr>
                <li id="liImport">
                    <a href="import">Registered Students</a>
                </li>
                <li id="liListCourse">
                    <a href="listCourse">List Registered Team</a>
                </li>
                <hr>
                <li id="liProfile">
                    <a href="masterprofile">Profile</a>
                </li>
                <li>
                    <a href="index">Log Out</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">