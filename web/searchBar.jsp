<link rel="stylesheet" type="text/css" href="./js/styleForSearchBar.css">
<div id="searchBar">
    <form>
        <table border="1px solid black" id="searchBarTable">
            <tr>
                <td class="searchBarTd">Chercher un document : </td>
                <td class="searchBarTd"><input id="searchBarInputText" type="text" name="keyword"/></td>
                <td class="searchBarTd">
                    <input type="hidden" name="action" value="search"/>
                    <input id="searchBarInputSubmit" type="submit" value="Trouver" formaction="./controller" formmethod="get"/>
                </td>                
            </tr>
        </table>        
    </form>
</div>