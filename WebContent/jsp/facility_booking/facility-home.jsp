<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facility Booking System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        h1 {
            margin: 0;
            font-size: 24px;
        }

        main {
            padding: 20px;
        }

        section {
            margin-bottom: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
        }

        h2 {
            margin-top: 0;
            font-size: 20px;
        }

        /* Facility Listing Styles */
        .facility {
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }

        /* Booking Form Styles */
        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"],
        input[type="time"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"] {
            padding: 10px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        /* Booking Status Styles */
        #calendar {
            /* Add styles for calendar display */
        }

        /* Footer Styles */
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px;
        }
        
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}

    </style>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        h1 {
            margin: 0;
            font-size: 24px;
        }

        main {
            padding: 20px;
        }

        section {
            margin-bottom: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
        }

        h2 {
            margin-top: 0;
            font-size: 20px;
        }

        /* Form Styles */
        form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"],
        input[type="time"],
        select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"] {
            padding: 10px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        /* Footer Styles */
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        
         /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #333;
            color: #fff;
        }
        
         .anchor_btn {
            padding: 5px 10px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration:none;
        }
        
         
        
    </style>    
</head>
<body>
    <header>
        <h1>Welcome to Facility Booking System</h1>
    </header>

    <main>
        <section id="facilities">
            <h2>Available Facilities</h2>
            <!-- Facility listing will be displayed here -->
           
            <table width="100%">
            <thead>
            	<tr>
            	<th>Select</th>
            	<th>Name</th>
            	<th>location</th>
            	<th>Property</th>
            	</tr>
            	</thead>
            	 <tbody>
            	 <c:forEach items="${facilityList}" var="facilityObj" varStatus="facilityStatus">
					   <tr>
					   <td><input type="checkbox" id="facility" name="facility" value="${facilityObj.id}" onclick="setFacilityIds()"/></td>
					      <td>${facilityObj.name}</td>
					      <td>${facilityObj.location}</td>
					      <td>${facilityObj.property_name}</td>													        													        
					    </tr>
				</c:forEach>
				</tbody>
            </table>
            <br />
             <a href="<%=request.getContextPath()%>/lct/facility/add" class="anchor_btn">Add New Facility</a>
             <a id="delete_btn" href="<%=request.getContextPath()%>/lct/facility/delete" class="anchor_btn">Delete</a>
            <br />
            <script type="text/javascript">
    	function setFacilityIds(){
    		let checkboxes = document.getElementsByName('facility');
            let result = "";
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    result += checkboxes[i].value
                        + "_";
                }
            }
           
            let url="<%=request.getContextPath()%>/lct/facility/delete/"+result;  
            //alert("url:"+url);
            document.getElementById("delete_btn").href=url;       
    	}
    	</script>
        </section>

        <section id="booking-form">
            <h2>Book a Facility</h2>
            <!-- Booking form will be displayed here -->
            <section>
            <h2>Book a Facility</h2>
            <form action="<%=request.getContextPath()%>/lct/facility/facilityBooking" method="post"  modelAttribute="FACILITY_BOOKINGS">
                <label for="facility_id">Facility Name:</label>
                <select id="facility_id" name="facility_id" required>
                    <option value="">Select Facility</option>
                    <c:forEach items="${facilityList}" var="facilityObj">
                    <option value="${facilityObj.id}">${facilityObj.name}</option>
                    </c:forEach>                    
                    <!-- Add more facility options as needed -->
                </select>
				
                <label for="booking_date">Booking Date:</label>
                <input type="date" id="booking_date" name="booking_date" required>

                <label for="start_time">Start Time:</label>
                <input type="time" id="start_time" name="start_time" required> 

                <label for="end_time">End Time:</label>
                <input type="time" id="end_time" name="end_time" required>

                <input type="submit" value="Submit Booking">
            </form>
        </section>
        </section>

        <section id="booking-status">
            <h2>Booking Status</h2>
            <!-- Booking status/calendar will be displayed here -->
            <table>
            <thead>
            	<tr>
            		<th>booking Id</th>
            		<th>facility</th>
            		<th>user</th>
            		<th>booking date</th>
            		<th>start time</th>
            		<th>end time</th>
            		<th>booking status</th>
            	</tr>
           </thead>
           <tbody>
             <c:forEach items="${bookingList}" var="bookingObj">
                   <tr>
                   		<td>${bookingObj.id}</td>
                   		<td>${bookingObj.facility_name}</td>
                   		<td>${bookingObj.user_name}</td>
                   		<td>${bookingObj.booking_date}</td>
                   		<td>${bookingObj.start_time}</td>
                   		<td>${bookingObj.end_time}</td>
                   		<td>${bookingObj.status}</td>
                   </tr>
                    </c:forEach>  
                    </tbody>
                     </table>  
                     <br />
        </section>
    </main>

    <footer>
        &copy; 2024 Facility Booking System
    </footer>
</body>
</html>
