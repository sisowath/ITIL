<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advanced Search JSP Page</title>
    </head>
    <body>
        <h1>Recherce avancée</h1>
        <form action="./controller?action=advancedSearch" method="post">
            <table border="1px solid black">
                <tr>
                    <td>Mots-clés dans titre : </td>
                    <td><input type="text" name="keywordInTitle"/></td>
                    <td><input type="submit" value="Rechercher"/></td>
                </tr>
                <tr>
                    <td>auteur(s) : </td>
                    <td><input type="text" name="author"/></td>
                    <td><input type="submit" value="Rechercher"/></td>
                </tr>
                <tr>
                    <td>Type de document : </td>
                    <td><input type="text" name="keyword"/></td>
                    <td><input type="submit" value="Rechercher"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
