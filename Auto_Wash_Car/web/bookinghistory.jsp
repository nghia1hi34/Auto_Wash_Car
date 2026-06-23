<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
    Double finalPrice = (Double) session.getAttribute("FINAL_PRICE");

    if (finalPrice != null) {
%>
        <h2 style="color:green">
            Total Price: <%= finalPrice %> VND
        </h2>
<%
        session.removeAttribute("FINAL_PRICE");
    } else {
%>
        <h2 style="color:red">No booking data found!</h2>
<%
    }
%>

</body>
</html>