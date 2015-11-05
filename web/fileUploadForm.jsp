<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1px soldi black">
            <tr>
                <td>Select a file to upload: </td>
                <td>
                    <form action="UploadServlet" method="post" enctype="multipart/form-data">
                        <input type="file" name="file" size="50" />
                        <input type="submit" value="Upload File" />
                    </form>                
                </td>
            </tr>
        </table>                
    </body>
</html>
