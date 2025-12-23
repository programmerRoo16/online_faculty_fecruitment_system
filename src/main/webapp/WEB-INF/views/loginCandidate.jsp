<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Candidate Login | OFRS</title>

<!-- Fonts and Icons -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
    /* --- THEME VARIABLES (Matching Recruiter Page) --- */
    :root {
        --primary-color: #0f766e; /* Teal */
        --primary-hover: #0d9488;
        --background-color: #F1F5F9;
        --white: #ffffff;
        --text-dark: #1E293B;
        --text-light: #64748B;
        --border-color: #E2E8F0;
        --danger-bg: #FEF2F2;
        --danger-text: #DC2626;
        --danger-border: #FECACA;
        --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
    }

    * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

    body {
        background-color: var(--background-color);
        display: flex;
        min-height: 100vh;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    /* --- AUTH CARD --- */
    .auth-card {
        background-color: var(--white);
        width: 100%;
        max-width: 400px; /* Standard width for login */
        padding: 40px;
        border-radius: 16px;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--border-color);
    }

    .auth-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .logo {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 50px;
        height: 50px;
        background-color: #ccfbf1; /* Light Teal */
        color: var(--primary-color);
        border-radius: 12px;
        font-size: 24px;
        margin-bottom: 15px;
    }

    .auth-header h2 {
        color: var(--text-dark);
        font-size: 24px;
        font-weight: 700;
        margin-bottom: 8px;
    }

    .auth-header p {
        color: var(--text-light);
        font-size: 14px;
    }

    /* --- FORM STYLING --- */
    form {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    .form-group {
        display: flex;
        flex-direction: column;
        gap: 6px;
    }

    label {
        font-size: 13px;
        font-weight: 600;
        color: var(--text-dark);
    }

    input {
        padding: 12px 16px;
        border: 1px solid var(--border-color);
        border-radius: 8px;
        font-size: 14px;
        color: var(--text-dark);
        background-color: var(--white);
        transition: all 0.2s;
        outline: none;
        width: 100%;
    }

    input:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 0 3px rgba(15, 118, 110, 0.1);
    }

    /* Submit Button */
    .btn-submit {
        background-color: var(--primary-color);
        color: white;
        font-weight: 600;
        padding: 14px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 15px;
        transition: background-color 0.2s;
        margin-top: 10px;
    }

    .btn-submit:hover {
        background-color: var(--primary-hover);
    }

    /* Message Box */
    .message-box {
        background-color: var(--danger-bg);
        color: var(--danger-text);
        padding: 12px;
        border-radius: 8px;
        border: 1px solid var(--danger-border);
        font-size: 14px;
        text-align: center;
        margin-bottom: 20px;
    }

    /* --- FOOTER --- */
    .auth-footer {
        margin-top: 25px;
        text-align: center;
        font-size: 14px;
        color: var(--text-light);
        border-top: 1px solid var(--border-color);
        padding-top: 20px;
    }

    .auth-footer a {
        color: var(--primary-color);
        text-decoration: none;
        font-weight: 600;
    }

    .auth-footer a:hover {
        text-decoration: underline;
    }

    .home-link {
        display: block;
        text-align: center;
        margin-top: 15px;
        font-size: 13px;
        color: var(--text-light);
        text-decoration: none;
    }
    .home-link:hover { color: var(--text-dark); }

</style>
</head>
<body>

    <div class="auth-card">
        <div class="auth-header">
            <div class="logo">
                <i class="fa-solid fa-user-graduate"></i>
            </div>
            <h2>Candidate Login</h2>
            <p>Welcome back! Please login to continue.</p>
        </div>

        <%
        String msg=(String)request.getAttribute("msg");
        if(msg!=null){
        %>
            <div class="message-box">
                <i class="fa-solid fa-circle-exclamation"></i> <%= msg %>
            </div>
        <%
        }
        %>

        <form action="candidateLogin" method="post">
            
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn-submit">Login</button>
        </form>

        <div class="auth-footer">
            Don't have an account? <a href="index">Register here</a>
            <a href="home" class="home-link"><i class="fa-solid fa-arrow-left"></i> Back to Home</a>
        </div>
    </div>

</body>
</html>