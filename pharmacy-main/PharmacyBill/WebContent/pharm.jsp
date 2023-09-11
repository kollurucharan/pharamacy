<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*,pack.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <script>
        window.addEventListener("message", function(event) {
            const receivedValue = event.data; // The value sent from the popup window
            addRecord(receivedValue);
        });
    </script>
</head>
<body>
<%ArrayList<Medicine> alist=(ArrayList<Medicine>)request.getAttribute("alist"); 
String bil=(String)request.getAttribute("billno");
%>
	<center>
		<h1>Pharmacy</h1>
		<label>Bill Number :<input type="text" id="bill" value=<%=bil %>></label>
		<label>Bill Date  :<input type="date" id="date"></label><br></br>
		<label>Patient Name:<input type="text" id="patient"></label>
		<label>Doctor Name:<input type="text" id="doctor"></label><br></br>
		<h2>Medicine Details</h2>
		<table id="table" border=1>
			<thead>
				<th>Medicine_name</th>
				<th>Batch no</th>
				<th>Expire Date</th>
				<th>Medicine_qty</th>
				<th>Medicine_price</th>
				<th>Remove</th>
			</thead>
			<tbody id="container">
			</tbody>
		</table>
		
		
		<input type="button" onclick="openPopup()" value="Add"></br></br>
			<label>Total Amount :<input type="text" id="total" ></label>
			
		<button onclick="payment()">make Payment</button>
	</center>
	 <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
function payment(){
	var amt=document.getElementById("total").value;
	if(amt==0){
		alert("select atleast one medicine");
	}
    var options = {
      "key": "rzp_test_4jwnZunhRo2Y9N",
      "amount": amt* 100, // Convert amount to minor currency units (e.g., paise for INR)
      "currency": "INR",
      // Rest of your options...
      "handler": function (response) {
        alert(response.razorpay_payment_id);
      },
      // Rest of your options...
    };
    var rzp1 = new Razorpay(options);
    rzp1.open();
    e.preventDefault();
}

var tot=0;
function openPopup() {
    var url = "http://localhost:8080/PharmacyBill/search";

    var features = "width=500,height=300,left=100,top=100";

    var popupWindow = window.open(url, "_blank", features);

    if (!popupWindow) {
        alert("Pop-up window was blocked by your browser's pop-up blocker.");
    }
}
function addRecord(data){
	<%for(Medicine m:alist){%>
	var x="<%=m.getMedName()%>";
	if(x===data){
		console.log("x=data");
		var tab = document.getElementById("table");
		var row = tab.insertRow();
		var name = row.insertCell(0);
		var btach = row.insertCell(1);
		var expdate = row.insertCell(2);
		var qty = row.insertCell(3);
		var price = row.insertCell(4);
		var remove = row.insertCell(5);
		price.textContent='<%=m.getPrice()%>';
		var qt=document.createElement("input");
		qt.value=1;
		var prev=Number(qt.value);
		tot+=Number('<%=m.getPrice()%>');
		document.getElementById("total").value=tot;
		qt.addEventListener("input",function(event){
			var com=Number(event.target.value);
			var temp='<%=m.getPrice()%>';
			price.innerText=temp* qt.value;
			if(com>prev){
			tot+=Number(temp);
			}else if(prev>com){
				tot-=Number(temp);
			}else{
				console.log("same");
			}
			document.getElementById("total").value=tot;
			prev=com;
		});
		qt.type = "number";
		qt.min = 1;
		name.textContent='<%=m.getMedName()%>';
		btach.textContent='<%=m.getBatchNo()%>';
		expdate.textContent='<%=m.getDate()%>';
		qty.appendChild(qt);
		remove.innerHTML='<button onclick="deleteRow(this.parentNode.parentNode)">remove</button>';
	}
	<%}%>
}

function deleteRow(row) {
    const table = document.getElementById('table');
    var row=table.rows[row.rowIndex];
    var col=row.cells[4].textContent;
    console.log(col);
    tot-=col;
    console.log(tot);
    document.getElementById("total").value=tot;
    table.deleteRow(row.rowIndex);
  }

	</script>
</body>
</html>