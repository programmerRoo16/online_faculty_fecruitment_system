<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Dashboard</title>
<style>
    /* ------------------------------------------------------------------ */
    /* --- SECTION 1: UNIVERSAL BASE STYLES (Applies to ALL pages) --- */
    /* ------------------------------------------------------------------ */

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
    }

    /* Shared Container Style for Login/Update Forms */
    .container {
        width: 90%;
        max-width: 450px; /* Slightly wider than login for the menu */
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 12px var(--shadow-color);
        text-align: center;
        margin-top: 50px; /* Push content down from the top edge */
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

    /* ------------------------------------------------------------------ */
    /* --- SECTION 3: LOGOUT BUTTON & UTILITY --- */
    /* ------------------------------------------------------------------ */
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
    /* --- SECTION 5: HOME PAGE MENU STYLES --- */
    /* ------------------------------------------------------------------ */
    
    .action-menu {
        display: flex;
        flex-direction: column;
        gap: 12px; /* Space between buttons */
        padding: 10px 0;
    }
    
    .recruiter-action-btn {
        display: block;
        width: 100%;
        padding: 15px 5px;
        background-color: var(--primary-color);
        color: white;
        text-decoration: none;
        border-radius: 6px;
        font-size: 1.05em;
        font-weight: bold;
        transition: background-color 0.2s, box-shadow 0.2s;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        text-align: left; /* Align text to the left */
    }
    
    .recruiter-action-btn:hover {
        background-color: #137b8d; /* Darker Teal */
        box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
    }

    /* Special style for the destructive action */
    a[href="deactivateRecruiter"] {
        background-color: var(--error-text); /* Red */
    }
    a[href="deactivateRecruiter"]:hover {
        background-color: #c82333;
    }
    
    /* ---------------------------------------------------- */
    /* --- THEME CONFIGURATION FOR RECRUITER PAGES (TEAL/GREEN) --- */
    h1 { color: #17a2b8; } 
    h3 { color: #17a2b8; font-size: 1.8em; } /* Make the main title bigger */
    :root {
        --primary-color: #17a2b8; /* Teal/Cyan */
        --submit-color: #28a745; 
        --submit-hover-color: #218838;
        --theme-box-shadow: rgba(23, 162, 184, 0.25);
    }
    /* ---------------------------------------------------- */
</style>
</head>
<body>

<div class="top-right-utility">
    <a href="logout" class="logout-btn">Logout</a>
</div>

<div class="container">
    <h1>Online Faculty Recruitment System</h1>
    <hr>
    <h3>Recruiter Dashboard</h3>
    
    <%
    String msg=(String)request.getAttribute("msg");
    if(msg!=null){
    %>
        <div class="message"><%= msg %></div>
    <%
    }
    %>
    <hr>
    
    <div class="action-menu">
        <!-- Profile Management -->
        <a href="updateRecruiter" class="recruiter-action-btn">Update Profile</a>
        <a href="updateRecPassword" class="recruiter-action-btn">Change Password</a>
        
        <!-- Vacancy Management -->
        <a href="addVacancies" class="recruiter-action-btn">Add New Vacancies</a>
        <a href="findVacancy" class="recruiter-action-btn">Update Vacancies</a>
        <a href="deleteVacancies" class="recruiter-action-btn">Delete Vacancies</a>
        <a href="viewVacancies" class="recruiter-action-btn">View All Posted Vacancies</a>
        
        <!-- Candidate Management -->
        <a href="viewAppliedCandidate" class="recruiter-action-btn">View Applied Candidates</a>
        
        <!-- Account Management (Destructive Action) -->
        <a href="deactivateRecruiter" class="recruiter-action-btn">Deactivate Account</a>
    </div>
</div>
</body>
</html>