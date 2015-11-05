<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="./controller" enctype="multipart/form-data">
            Nom :<input type="text" name="nom" id="nom" /><br/>
            Photo :<input type="file" name="photo" id="photo" /><br/>
            <input type="hidden" name="action" value="televersement"/>
            <input type="submit" value="Go" name="go" id="go" />
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