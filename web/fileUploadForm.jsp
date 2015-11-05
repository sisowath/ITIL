<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="./controller?action=televersement" enctype="multipart/form-data" >
            <table border="1px solid black">
                <tr>
                    <td>File : </td>
                    <td><input type="file" name="file" id="file" /></td>
                    <td><input type="submit" value="Upload" name="upload" id="upload" /></td>
                </tr>
            </table>
        </form> 
        <!--
        <table border="1px soldi black">
            <tr>
                <td>Select a file to upload: </td>
                <td><form action="./controller?action=televersement" method="post" enctype="multipart/form-data"><input type="file" name="file" size="200" /></td>
                <td><input type="submit" value="Upload File" /></form></td>
            </tr>
        </table> 
        -->
    </body>
</html>