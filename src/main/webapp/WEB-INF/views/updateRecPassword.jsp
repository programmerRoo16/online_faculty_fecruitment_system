<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password | OFRS</title>
    
    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* --- BASE THEME (MATCHING DASHBOARD) --- */
        :root {
            --primary-color: #0f766e; /* Teal */
            --primary-light: #14b8a6; 
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
        .logout-btn { color: var(--danger) !important; cursor: pointer; }

        /* --- MAIN CONTENT --- */
        .main-content {
            flex: 1;
            overflow-y: auto;
            padding: 30px;
        }

        .page-header {
            margin-bottom: 25px;
        }
        .page-header h2 { font-size: 24px; color: var(--text-dark); }
        .page-header p { color: var(--secondary-color); font-size: 14px; margin-top: 5px; }

        /* --- FORM CARD DESIGN --- */
        .form-container {
            max-width: 500px; /* Narrower for password forms */
            margin: 0 auto 0 0; /* Align left but keep width constrained */
        }

        .form-card {
            background: var(--white);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            border: 1px solid var(--border-color);
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
            margin-bottom: 20px;
        }

        label {
            font-size: 13px;
            font-weight: 600;
            color: var(--text-dark);
        }

        input[type="password"] {
            padding: 12px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s;
            background-color: #fff;
            width: 100%;
        }

        input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(15, 118, 110, 0.1);
        }

        /* --- BUTTONS --- */
        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 10px;
            border-top: 1px solid var(--border-color);
            padding-top: 20px;
        }

        .btn-submit {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            font-size: 14px;
            transition: background 0.2s;
            flex: 1;
        }
        .btn-submit:hover { background-color: #0d9488; }

        .btn-cancel {
            background-color: white;
            color: var(--text-dark);
            border: 1px solid var(--border-color);
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        .btn-cancel:hover { background-color: #F8FAFC; }

        /* --- MESSAGE BOX --- */
        .message-box {
            padding: 12px 15px;
            border-radius: 8px;
            margin-bottom: 25px;
            font-size: 14px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .msg-error {
            background-color: #FEF2F2;
            color: var(--danger);
            border: 1px solid #FECACA;
        }
        
        .msg-success {
            background-color: #ECFDF5;
            color: var(--success);
            border: 1px solid #A7F3D0;
        }

    </style>
</head>
<body>

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="logo">
            <i class="fa-solid fa-briefcase"></i> OFRS Recruiter
        </div>
        <ul class="nav-links">
            <li><a href="recruiter_deshboard"><i class="fa-solid fa-gauge-high"></i> Dashboard</a></li>

            <li><a href="addVacancies"><i class="fa-solid fa-plus-circle"></i> Post New Vacancy</a></li>
            <li><a href="viewVacancies"><i class="fa-solid fa-list-check"></i> Manage Vacancies</a></li>
            <li><a href="viewAppliedCandidate"><i class="fa-solid fa-users-viewfinder"></i> Applicants</a></li>
            
            <li style="margin-top: 20px; margin-bottom: 10px; font-size: 11px; text-transform: uppercase; color: #94a3b8; padding-left: 16px;">Account</li>
            <li><a href="updateRecruiter"><i class="fa-solid fa-user-pen"></i> Update Profile</a></li>
            <li><a href="updateRecPassword" class="active"><i class="fa-solid fa-lock"></i> Change Password</a></li>
            <li><a href="deactivateRecruiter" style="color: #ef4444;"><i class="fa-solid fa-trash-can"></i> Deactivate</a></li>
        </ul>
        <ul class="nav-links" style="flex-grow: 0;">
             <li><a href="logout" class="logout-btn"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a></li>
        </ul>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main-content">
        
        <div class="page-header">
            <h2>Security Settings</h2>
            <p>Update your password to keep your account secure.</p>
        </div>

        <div class="form-container">
            
            <%
            String msg = (String)request.getAttribute("msg");
            if(msg != null) {
                // Simple logic to check if message implies success or failure
                boolean isSuccess = msg.toLowerCase().contains("success");
                String msgClass = isSuccess ? "msg-success" : "msg-error";
                String icon = isSuccess ? "fa-circle-check" : "fa-circle-exclamation";
            %>
                <div class="message-box <%= msgClass %>">
                    <i class="fa-solid <%= icon %>"></i> <%= msg %>
                </div>
            <% } %>

            <div class="form-card">
                <form action="passwordRecUpdate" method="post">
                    
                    <div class="form-group">
                        <label>Current Password</label>
                        <input type="password" name="old" placeholder="Enter your current password" required>
                    </div>

                    <div class="form-group">
                        <label>New Password</label>
                        <input type="password" name="new" placeholder="Enter new strong password" required>
                    </div>

                    <!-- Actions -->
                    <div class="form-actions">
                        <button type="submit" class="btn-submit">Update Password</button>
                        <a href="recruiterHome" class="btn-cancel">Cancel</a>
                    </div>

                </form>
            </div>
            
            <p style="margin-top: 20px; font-size: 13px; color: var(--secondary-color); line-height: 1.5;">
                <i class="fa-solid fa-shield-halved"></i> 
                <strong>Security Tip:</strong> Use a combination of uppercase letters, numbers, and special characters to make your password stronger.
            </p>
        </div>

    </div>

</body>
</html>