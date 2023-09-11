<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*,pack.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>medicines</h1>
<%ArrayList<Medicine> alist=(ArrayList<Medicine>)request.getAttribute("alist");%>
<input type="text" id="search" placeholder="enter the medicine name">
<select id="sel">
<option>---</option>
        <% for (Medicine med : alist) { %>
            <option value="<%= med.getMedName() %>"><%= med.getMedName() %></option>
        <% } %>
    </select> 
    <script>
    var searchInput = document.getElementById("search");
    var selectElement = document.getElementById("sel");
    var originalOptions = selectElement.innerHTML;

    searchInput.addEventListener("input", function() {
        var inputValue = searchInput.value.trim().toLowerCase();
        selectElement.innerHTML = originalOptions;

        if (inputValue !== "") {
            var options = selectElement.getElementsByTagName("option");
            for (var i = 0; i < options.length; i++) {
                var optionText = options[i].textContent.toLowerCase();
                if (optionText.indexOf(inputValue) === -1) {
                    options[i].style.display = "none";
                } else {
                    options[i].style.display = "block";
                }
            }
        }
    });
    selectElement.addEventListener("change",function(){
    	var xx=selectElement.value;
    	console.log(xx);
    	window.opener.postMessage(xx,"*");
    	window.close();
    })
    </script>
</body>
</html>
