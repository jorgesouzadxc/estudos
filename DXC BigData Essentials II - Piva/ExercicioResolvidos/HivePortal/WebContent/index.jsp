
<%@page import="DAO.ConsultaHive"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hive Connection</h1>
 	    <% ConsultaHive cv = new ConsultaHive();
		   out.print(cv.getConsultaHive());
		%>
    </body>
</html>