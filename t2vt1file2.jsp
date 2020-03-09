<%@page import="network.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CTAC</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="css/creative.min.css" rel="stylesheet">



</head>

<body id="page-top">

    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">CTAC</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="t2home.jsp">Home</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="t2vt1file.jsp">Cross Tenants Files</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="t2authen.jsp">Authentication Requests</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="t2vdownhis.jsp">Download History</a>
                    </li>
					<li>
                        <a class="page-scroll" href="t2log.jsp">Logout</a>
                    </li>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
       <div class="header-content">
            <div class="header-content-inner">
			<center>
                <h1 id="homeHeading">Cross Tenant Files</h1>
                <hr>
                        <table style="width: 900px" border="1">
                            <tr>
                                <th style="color:#ffffff;font-size: 15px">Owner Id</th>
                                <th style="color:#ffffff;font-size: 15px">Owner Name</th>
                                <th style="color:#ffffff;font-size: 15px">File Id</th>
                                <th style="color:#ffffff;font-size: 15px">File Name</th>
                                <th style="color:#ffffff;font-size: 15px">Description</th>
                                <th style="color:#ffffff;font-size: 15px">Date & Time</th>
                                <th style="color:#ffffff;font-size: 15px">Request</th>
                                <th style="color:#ffffff;font-size: 15px">Download</th>
                            </tr>
                            <%
                                String oid = (String) session.getAttribute("t1id");
                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;

                                try {
                                    con = DbConnection.getConnection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from fileupload");
                                    while (rs.next()) {


                            %>
                            <tr>
                                <td style="color: ffffff;font-size: 15px"><%=rs.getString("oid")%></td>
                                <td style="color: ffffff;font-size: 15px"><%=rs.getString("oname")%></td>
                                <td style="color: ffffff;font-size: 15px"><%=rs.getString("id")%></td>
                                <td style="color: ffffff;font-size: 15px"><%=rs.getString("filename")%></td>
                                <td style="color: ffffff;font-size: 15px"><%=rs.getString("des")%></td>
                                <td style="color: ffffff;font-size: 15px"><%=rs.getString("dtime")%></td>
                                <td><a href="t2req.jsp?tenant=<%=rs.getString("tenant")%>&fid=<%=rs.getString("id")%>&oid=<%=rs.getString("oid")%>&filename=<%=rs.getString("filename")%>&fpolicy=<%=rs.getString("policy")%>&fskey=<%=rs.getString("skey")%>"><font style="color: ffffff;font-size: 15px">Request</font></a></td>
                                <td><a href="download.jsp?tenant=<%=rs.getString("tenant")%>&fid=<%=rs.getString("id")%>&oid=<%=rs.getString("oid")%>&filename=<%=rs.getString("filename")%>&fpolicy=<%=rs.getString("policy")%>&fskey=<%=rs.getString("skey")%>"><font style="color: ffffff;font-size: 15px">Download</font></a></td>
                            </tr>
                             <%}
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }

                        %>
                        </table>
				</center>
            </div>
        </div>
    </header>


    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/creative.min.js"></script>

</body>

</html>
