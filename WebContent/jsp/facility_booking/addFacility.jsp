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

        /* Add Facility Form Styles */
        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="submit"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"] {
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
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to Facility Booking System</h1>
    </header>

    <main>
        <section id="add-facility">
            <h2>Add a Facility</h2>
            <form action="<%=request.getContextPath()%>/lct/facility/add" method="post" modelAttribute="facility">
                <label for="facility-name">Facility Name:</label>
                <input type="text" id="facility-name" name="name" required>

                <label for="facility-location">Location:</label>
                <input type="text" id="facility-location" name="location" required>
                
                 <label for="facility-location">Property:</label>
                <input type="text" id="facility-location" name="property_name" required>

                <input type="submit" value="Add Facility">
            </form>
        </section>

        <!-- Other sections for booking form, booking status, etc. can be added here -->

    </main>

    <footer>
        &copy; 2024 Facility Booking System
    </footer>
</body>
</html>
