<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Password | Candidate Portal</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* --- THEME VARIABLES (Teal/Cyan) --- */
        :root {
            --primary-color: #0f766e;
            --primary-light: #14b8a6; 
            --primary-hover: #0d9488;
            --secondary-color: #64748B;
            --background-color: #F1F5F9;
            --white: #ffffff;
            --text-dark: #1E293B;
            --border-color: #E2E8F0;
            --danger: #EF4444;
            --success: #10B981;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

        body {
            background-color: var(--background-color);
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        /* --- SIDEBAR --- */
        .sidebar {
            width: 260px;
            background-color: var(--white);
            border-right: 1px solid var(--border-color);
            display: flex;
            flex-direction: column;
            padding: 20px;
        }

        .logo {
            font-size: 20px;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 40px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .nav-links { list-style: none; flex-grow: 1; }
        .nav-links li { margin-bottom: 5px; }
        .nav-links a {
            text-decoration: none;
            color: var(--secondary-color);
            padding: 12px 16px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 500;
            transition: all 0.3s ease;
            font-size: 14px;
        }

        .nav-links a:hover, .nav-links a.active {
            background-color: #ccfbf1; 
            color: var(--primary-color);
        }
        
        .section-label {
            font-size: 11px;
            text-transform: uppercase;
            color: #94a3b8;
            padding-left: 16px;
            margin: 20px 0 10px;
            font-weight: 600;
        }

        .logout-btn { color: var(--danger) !important; cursor: pointer; }

        /* --- MAIN CONTENT --- */
        .main-content {
            flex: 1;
            overflow-y: auto;
            padding: 30px;
            display: flex;
            flex-direction: column;
        }

        /* Header */
        .page-header {
            margin-bottom: 25px;
        }
        .page-header h2 { font-size: 22px; color: var(--text-dark); }
        .page-header p { color: var(--secondary-color); font-size: 14px; }

        /* Password Card */
        .password-card {
            background: var(--white);
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            padding: 40px;
            border: 1px solid var(--border-color);
            max-width: 500px; /* Narrower for password forms */
            width: 100%;
            align-self: flex-start; /* Aligns card to the left-top */
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-size: 13px;
            font-weight: 500;
            color: var(--secondary-color);
            display: block;
            margin-bottom: 8px;
        }

        input[type="password"] {
            padding: 12px 14px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            font-size: 14px;
            color: var(--text-dark);
            width: 100%;
            transition: all 0.2s;
        }

        input[type="password"]:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(15, 118, 110, 0.1);
        }

        /* Button */
        .btn-submit {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 12px;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
            font-size: 14px;
            width: 100%;
            margin-top: 10px;
        }
        
        .btn-submit:hover {
            background-color: var(--primary-hover);
        }

        /* Message Box */
        .message-box {
            padding: 12px 16px;
            border-radius: 6px;
            margin-bottom: 25px;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 10px;
            background-color: #ecfdf5; /* Light Green Background Default */
            color: #065f46;
            border: 1px solid #a7f3d0;
        }
        
        /* You can add logic to change this class to red if it's an error */
        .message-box.error {
            background-color: #fff1f2;
            color: #9f1239;
            border-color: #fecdd3;
        }

    </style>
</head>
<body>

    <div class="sidebar">
        <div class="logo">
            <i class="fa-solid fa-graduation-cap"></i> Candidate Portal
        </div>
        <ul class="nav-links">
            <li><a href="candidate_deshboard"><i class="fa-solid fa-grid-2"></i> Dashboard</a></li>
            <li><a href="seeAllVacancies"><i class="fa-solid fa-magnifying-glass"></i> Find Jobs</a></li>
            <li><a href="viewApplieVacancies"><i class="fa-solid fa-file-circle-check"></i> Applications</a></li>
            
            <li class="section-label">Account</li>
            <li><a href="updateProfile"><i class="fa-solid fa-user-gear"></i> My Profile</a></li>
            <li><a href="updatePassword" class="active"><i class="fa-solid fa-lock"></i> Security</a></li>
            <li><a href="deactivate" style="color: #ef4444;"><i class="fa-solid fa-trash-can"></i> Deactivate</a></li>
        </ul>
        <ul class="nav-links" style="flex-grow: 0;">
             <li><a href="logout" class="logout-btn"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
        
        <div class="page-header">
            <h2>Security Settings</h2>
            <p>Ensure your account stays safe by updating your password regularly.</p>
        </div>

        <div class="password-card">
            
            <%
            String msg = (String)request.getAttribute("msg");
            if(msg != null){
                // Simple logic: if message contains "Success" use green, otherwise red
                // This logic is purely visual; adjust based on your controller strings
                String alertClass = msg.toLowerCase().contains("success") ? "" : "error";
                String icon = msg.toLowerCase().contains("success") ? "fa-circle-check" : "fa-circle-exclamation";
            %>
                <div class="message-box <%= alertClass %>">
                    <i class="fa-solid <%= icon %>"></i> <%= msg %>
                </div>
            <%
            }
            %>

            <form action="passwordUpdate" method="post">
                <div class="form-group">
                    <label>Current Password</label>
                    <input type="password" name="old" placeholder="••••••••" required>
                </div>

                <div class="form-group">
                    <label>New Password</label>
                    <input type="password" name="new" placeholder="••••••••" required>
                </div>

                <button type="submit" class="btn-submit">
                    Change Password
                </button>
            </form>
        </div>

    </div>

</body>
</html>