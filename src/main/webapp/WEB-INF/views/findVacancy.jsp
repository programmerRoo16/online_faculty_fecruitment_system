<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Vacancies</title>
<style>
   

    :root {
        --light-bg: #f0f4f8;
        --shadow-color: rgba(0, 0, 0, 0.1);
        --neutral-color: #555;
        --error-bg: #f8d7da;
        --error-border: #f5c6cb;
        --error-text: #dc3545;
    }
    
    body {
        font-family: 'Verdana', sans-serif;
        background-color: var(--light-bg);
        color: #333;
        margin: 0;
        padding: 40px 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 100vh;
        position: relative; 
        justify-content: center; /* Center the container card vertically */
    }

    /* Shared Container Style for Login/Update Forms */
    .container {
        width: 90%;
        max-width: 400px; /* Default for login forms */
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 12px var(--shadow-color);
        text-align: center;
        margin: auto; /* Center forms vertically in the available space */
    }

    /* Common Header and Rule Styles */
    hr {
        border: 0;
        height: 1px;
        background-color: #ddd;
        margin: 15px 0;
    }
    
    h1 {
        margin-bottom: 5px;
        font-size: 2.5em;
    }

    h3 {
        color: var(--neutral-color);
        margin-top: 5px;
        margin-bottom: 20px;
        font-size: 1.5em;
    }
    
    /* Shared Message Display Style */
    .message {
        font-weight: bold;
        padding: 10px;
        margin: 15px 0;
        border-radius: 5px;
        color: var(--error-text);
        background-color: var(--error-bg); 
        border: 1px solid var(--error-border);
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="date"],
    input[type="tel"] {
        width: 100%;
        padding: 12px;
        margin-bottom: 15px;
        border: 1px solid #ced4da;
        border-radius: 4px;
        box-sizing: border-box;
        transition: border-color 0.3s, box-shadow 0.3s;
    }

    /* Focus State - Uses the theme color */
    input:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 0 0.2rem var(--theme-box-shadow);
        outline: none;
    }
    
    /* Universal Submit Button Style */
    input[type="submit"] {
        background-color: var(--submit-color);
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 1.1em;
        width: 100%;
        transition: background-color 0.3s;
        margin-top: 15px;
    }

    input[type="submit"]:hover {
        background-color: var(--submit-hover-color);
    }
    
    .logout-btn {
        display: inline-block;
        padding: 10px 15px;
        background-color: #7f8c8d; /* Neutral Gray */
        color: white;
        text-decoration: none;
        border-radius: 4px;
        font-size: 0.95em;
        font-weight: bold;
        transition: background-color 0.3s, transform 0.1s;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .logout-btn:hover {
        background-color: #5d6d7e;
        transform: translateY(-1px);
    }

    .top-right-utility {
        position: absolute;
        top: 20px;
        right: 20px;
        z-index: 1000;
    }
    
    /* ------------------------------------------------------------------ */
    /* --- SECTION 4: SPECIFIC PAGE LAYOUTS --- */
    /* ------------------------------------------------------------------ */
    
    /* 4B: Home and Registration Links */
    .home-link-btn {
        display: inline-block;
        margin-top: 25px;
        padding: 8px 15px;
        color: white;
        background-color: var(--neutral-color);
        border-radius: 4px;
        text-decoration: none;
        transition: background-color 0.3s;
    }
    .home-link-btn:hover {
        background-color: #333;
    }

    h1 { color: #17a2b8; } 
    h3 { color: #17a2b8; font-size: 1.8em; } /* Set title color */
    :root {
        --primary-color: #17a2b8; /* Teal/Cyan */
        --submit-color: #28a745; /* Green submit button */
        --submit-hover-color: #218838;
        --theme-box-shadow: rgba(23, 162, 184, 0.25);
    }
    /* ---------------------------------------------------- */
</style>
</head>
<body>

<!-- LOGOUT BUTTON -->
<div class="top-right-utility">
    <a href="logout" class="logout-btn">Logout</a>
</div>

<div class="container">
    <h1>Online Faculty Recruitment System</h1>
    <hr>
    <h3>Find Vacancy to Update</h3>
    <hr>
    
    <!-- Optional message display -->
    <%
    String msg=(String)request.getAttribute("msg");
    if(msg!=null){
    %>
        <div class="message"><%= msg %></div>
    <%
    }
    %>

    <form action="getVacancy" method="post">
        <input type="text" name="vId" placeholder="Enter Vacancy ID (e.g., V1001)">
        <p style="margin: 10px 0; color: var(--neutral-color);">— OR —</p>
        <input type="text" name="post" placeholder="Enter Post Name (e.g., Professor)">
        
        <input type="submit" value="SEARCH VACANCY">
    </form>
    
    <a href="recruiterHome" class="home-link-btn">Back to Dashboard</a>
</div>
</body>
</html>