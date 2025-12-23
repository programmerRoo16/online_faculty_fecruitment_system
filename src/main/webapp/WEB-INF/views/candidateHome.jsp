<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate Registration | OFRS</title>
<!-- Font Awesome for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
    /* 1. Basic Reset and Page Setup */
    body {
        font-family: 'Verdana', sans-serif;
        background-color: #f0f4f8; /* Soft background */
        color: #333;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center; /* Center content horizontally */
        min-height: 100vh;
        justify-content: center; /* Center content vertically if space allows */
    }

    /* 2. Header and Titles */
    h1 {
        color: #17a2b8; /* Professional Teal/Cyan color */
        margin-bottom: 5px;
        font-size: 2em;
    }

    h3 {
        color: #555;
        margin-top: 5px;
        margin-bottom: 20px;
        font-size: 1.5em;
    }

    /* 3. Form Container */
    .form-container {
        width: 90%;
        max-width: 450px; /* Slightly wider for the longer form */
        background-color: #fff;
        padding: 40px 30px;
        margin-top: 20px;
        margin-bottom: 40px;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        text-align: center;
    }

    /* 4. Input and Select Styling */
    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="date"],
    select {
        width: 100%;
        padding: 12px;
        margin-bottom: 15px;
        border: 1px solid #ced4da;
        border-radius: 4px;
        box-sizing: border-box; /* Include padding in width calculation */
        transition: border-color 0.3s, box-shadow 0.3s;
        font-family: 'Verdana', sans-serif; /* Ensure font consistency */
    }
    
    select {
        /* Adjust for visual uniformity with text inputs */
        appearance: none; 
        background-color: #fff;
        /* Custom arrow icon */
        background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23000000%22%20d%3D%22M287%2069.4L146.2%20208.7L5.4%2069.4h281.6z%22%2F%3E%3C%2Fsvg%3E");
        background-repeat: no-repeat, repeat;
        background-position: right 0.7em top 50%, 0 0;
        background-size: 0.65em auto, 100%;
        cursor: pointer;
    }

    input:focus, select:focus {
        border-color: #17a2b8;
        box-shadow: 0 0 0 0.2rem rgba(23, 162, 184, 0.25);
        outline: none;
    }
    
    /* File Input Styling */
    input[type="file"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px dashed #ced4da; /* Dashed border for file upload area */
        border-radius: 4px;
        box-sizing: border-box;
        background-color: #f8f9fa;
        cursor: pointer;
        font-size: 0.9em;
    }
    
    /* 5. Submit Button Styling */
    input[type="submit"] {
        background-color: #17a2b8; /* Teal color for submit */
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 1.1em;
        width: 100%;
        transition: background-color 0.3s;
        margin-top: 10px;
        margin-bottom: 20px;
        font-family: 'Verdana', sans-serif;
    }

    input[type="submit"]:hover {
        background-color: #138496; /* Darker teal on hover */
    }

    /* 6. Link Styling */
    .form-container a {
        color: #17a2b8;
        text-decoration: none;
        font-weight: bold;
        display: block; /* Make links block level for spacing */
        margin-top: 15px;
        transition: color 0.3s;
        font-size: 0.95em;
    }

    .form-container a:hover {
        color: #138496;
        text-decoration: underline;
    }
    
    /* Specific style for Home Link to differentiate */
    .home-link {
        color: #6c757d !important; /* Muted grey */
        font-weight: normal !important;
        font-size: 0.9em !important;
        display: inline-flex !important;
        align-items: center;
        gap: 5px;
    }
    .home-link:hover {
        color: #333 !important;
        text-decoration: none !important;
    }

    /* Horizontal Rules */
    hr {
        border: 0;
        height: 1px;
        background-color: #ddd;
        margin: 15px 0;
    }
    
    /* Labels for specific inputs */
    .input-label {
        display: block;
        text-align: left;
        margin-bottom: 5px;
        font-weight: bold;
        color: #555;
        font-size: 0.9em;
    }
</style>
</head>
<body>
    <div class="form-container">
        <h1>Online Faculty Recruitment System</h1>
        <hr>
        <h3>Candidate Registration</h3>
        <hr>

        <form action="register" method="post" enctype="multipart/form-data">
            
            <input type="text" name="fname" placeholder="First Name" required>
            <input type="text" name="lname" placeholder="Last Name" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Create Password" required>
            
            <label class="input-label" for="gender">Gender</label>
            <select id="gender" name="gender" required>
                <option value="" disabled selected>Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>

            <label class="input-label" for="date-input">Date of Birth</label>
            <input type="date" id="date-input" name="date" required>
            
            <input type="text" name="address" placeholder="Full Address">
            <input type="text" name="contact" placeholder="Contact Number">
            
            <input type="text" name="qualification" placeholder="Highest Qualification (e.g. Ph.D.)">
            <input type="text" name="experience" placeholder="Years of Experience">
            
            <label class="input-label" for="resume">Upload Resume (PDF)</label>
            <input type="file" name="resume" id="resume" accept=".pdf">
            
            <input type="submit" value="Register Now">
        </form>
        
        <a href="loginCandidate">Already Registered? Login here</a>
        
        <!-- Home Page Button -->
        <a href="index.jsp" class="home-link">
            <i class="fa-solid fa-arrow-left"></i> Back to Home
        </a>
    </div>
</body>
</html>