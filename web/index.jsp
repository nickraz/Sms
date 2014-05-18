<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Отправить СМС Николаю Разилову</title>
    </head>
    <body>
        <div id="content">
            <form method="POST">
                <%
                    request.setCharacterEncoding("utf-8");
                    String name = request.getParameter("name");
                    String message = request.getParameter("message");
                    if (name != null && message != null) {
                        if (!name.trim().equals("") && !message.trim().equals("")) {
                            out.print("<script>alert('Че-то есть');</script>");
                            message = message.replace(" ", "+");
                            URL url = new URL("http://sms.ru/sms/send?api_id=0806be6f-b55d-3614-c937-7713a28f5061&to=79118888888&text="+message);
                            URLConnection con = url.openConnection();
                            BufferedReader in = new BufferedReader(
                                    new InputStreamReader(
                                            con.getInputStream()));
                        }
                    }
                %>
                <p>Ваше имя:</p>
                <p><input type="text" placeholder="Ваше имя" name="name"></p>
                <p>Сообщение:</p>
                <p><textarea placeholder="Сообщение" name="message" style="width: 500px; height: 200px;"></textarea></p>
                <p><input type="submit" value="Отправить"></p>
            </form>
        </div>
    </body>
</html>
