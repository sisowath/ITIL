<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="./controller" enctype="multipart/form-data" >
            <table border="1px solid black">
                <tr>
                    <td>File : </td>
                    <td><input type="file" name="file" id="file" /></td>                    
                </tr>
                <tr>
                    <td>Auteur : </td>
                    <td><input type="text" name="auteur"/></td>
                </tr>
                <tr>
                    <td>Type de document : </td>
                    <td><input type="text" name="typeDeDocument"/></td>
                </tr>
                <tr>
                    <td>Date de création : </td>
                    <td><input type="date"</td>
                </tr>
                <tr>
                    <td><input type="hidden" name="action" value="televersement"/></td>
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