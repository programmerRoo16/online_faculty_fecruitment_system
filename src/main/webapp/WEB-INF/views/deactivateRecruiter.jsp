<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deactivate Account | OFRS</title>
    
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
            --danger-hover: #DC2626;
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
        
        /* Specific style for active deactivate link */
        .nav-links a.danger-active {
            background-color: #FEF2F2;
            color: var(--danger);
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

        /* --- DANGER ZONE CARD --- */
        .danger-container {
            max-width: 550px;
            margin: auto; /* Center vertically and horizontally in the available space */
            text-align: center;
        }

        .warning-card {
            background: var(--white);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            border: 1px solid #FECACA; /* Light Red Border */
        }

        .icon-wrapper {
            width: 80px;
            height: 80px;
            background-color: #FEF2F2;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 20px auto;
        }

        .icon-wrapper i {
            font-size: 32px;
            color: var(--danger);
        }

        h2 {
            color: var(--text-dark);
            margin-bottom: 10px;
            font-size: 22px;
        }

        p {
            color: var(--secondary-color);
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        /* --- BUTTONS --- */
        .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        button {
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            min-width: 120px;
        }

        .btn-confirm {
            background-color: var(--danger);
            color: white;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        }
        .btn-confirm:hover { background-color: var(--danger-hover); }

        .btn-cancel {
            background-color: white;
            color: var(--text-dark);
            border: 1px solid var(--border-color);
        }
        .btn-cancel:hover { background-color: #F8FAFC; border-color: #CBD5E1; }

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
            <li><a href="updateRecPassword"><i class="fa-solid fa-lock"></i> Change Password</a></li>
            <!-- Active Danger State -->
            <li><a href="deactivateRecruiter" class="danger-active"><i class="fa-solid fa-trash-can"></i> Deactivate</a></li>
        </ul>
        <ul class="nav-links" style="flex-grow: 0;">
             <li><a href="logout" class="logout-btn"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a></li>
        </ul>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main-content">
        
        <div class="danger-container">
            <div class="warning-card">
                <div class="icon-wrapper">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                </div>
                
                <h2>Deactivate Account?</h2>
                <p>
                    Are you sure you want to deactivate your account?<br>
                    This action will hide your profile and posted vacancies from candidates.
                </p>

                <form action="deactivateRec" method="post" class="action-buttons">
                    <!-- Value 'no' acts as cancel, 'yes' acts as confirm -->
                    <button type="submit" name="button" value="no" class="btn-cancel">No, Keep it</button>
                    <button type="submit" name="button" value="yes" class="btn-confirm">Yes, Deactivate</button>
                </form>
            </div>
            
            <div style="margin-top: 20px;">
                <a href="recruiterHome" style="color: var(--secondary-color); font-size: 13px; text-decoration: none;">
                    <i class="fa-solid fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>
        </div>

    </div>

</body>
</html>