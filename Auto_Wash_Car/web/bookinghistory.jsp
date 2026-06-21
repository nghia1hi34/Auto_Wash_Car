<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
out.println("<h3>DEBUG SESSION DATA</h3>");

java.util.Enumeration<String> names = session.getAttributeNames();

while (names.hasMoreElements()) {
    String name = names.nextElement();
    Object value = session.getAttribute(name);

    out.println("<p>" + name + " = " + value + "</p>");
}
%>
</body>
</html>