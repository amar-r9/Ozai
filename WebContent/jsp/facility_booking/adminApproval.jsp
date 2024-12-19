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
    <title>Admin Approval</title>
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

        .approve-btn, .reject-btn {
            padding: 5px 10px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration:none;
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
    </style>
</head>
<body>
    <header>
        <h1>Admin Approval</h1>
    </header>

    <main>
        <section>
            <h2>Booking Requests</h2>
            <table>
                <thead>
                    <tr>
                        <th>Facility</th>
                        <th>User</th>
                        <th>Booking Date</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                 <c:forEach items="${bookingList}" var="bookingObj">
                    <tr>
                        <td>${bookingObj.facility_name}</td>
                        <td>${bookingObj.user_name}</td>
                        <td>${bookingObj.booking_date}</td>
                        <td>${bookingObj.start_time}</td>
                        <td>${bookingObj.end_time}</td>
                        <td>
                            <a href="<%=request.getContextPath() %>/lct/facility/adminApproval/${bookingObj.id}__Approved" class="approve-btn">Approve</a>
                            <a href="<%=request.getContextPath() %>/lct/facility/adminApproval/${bookingObj.id}__Rejected" class="reject-btn">Reject</a>
                        </td>
                    </tr>
                    </c:forEach>
                    <!-- Add more booking request rows as needed -->
                </tbody>
            </table>
        </section>

        <!-- Add more sections for additional content if needed -->

    </main>

    <footer>
        &copy; 2024 Facility Booking System
    </footer>
</body>
</html>
