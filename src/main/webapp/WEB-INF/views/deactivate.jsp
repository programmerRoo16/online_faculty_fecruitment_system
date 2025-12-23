<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deactivate Account | Candidate Portal</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* --- THEME VARIABLES (Teal/Cyan + Danger Red) --- */
        :root {
            --primary-color: #0f766e;
            --secondary-color: #64748B;
            --background-color: #F1F5F9;
            --white: #ffffff;
            --text-dark: #1E293B;
            --border-color: #E2E8F0;
            --danger: #EF4444;       /* Main color for this page */
            --danger-bg: #FEF2F2;
            --danger-hover: #DC2626;
            --danger-border: #FECACA;
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

        .nav-links a:hover {
            background-color: #ccfbf1; 
            color: var(--primary-color);
        }

        /* Specific styling for the active Deactivate link */
        .nav-links a.active-danger {
            background-color: var(--danger-bg);
            color: var(--danger);
            font-weight: 600;
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
            align-items: center; /* Center content for this specific page */
            justify-content: center;
        }

        /* Danger Card */
        .danger-card {
            background: var(--white);
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            padding: 40px;
            border: 1px solid var(--border-color);
            max-width: 500px;
            width: 100%;
            text-align: center;
            border-top: 5px solid var(--danger);
        }

        .icon-wrapper {
            width: 80px;
            height: 80px;
            background-color: var(--danger-bg);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
        }

        .icon-wrapper i {
            font-size: 32px;
            color: var(--danger);
        }

        h1 {
            color: var(--text-dark);
            font-size: 24px;
            margin-bottom: 10px;
        }

        p.warning-text {
            color: var(--secondary-color);
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        /* Action Buttons */
        .button-group {
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        .btn {
            padding: 12px 24px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            border: none;
            transition: all 0.2s;
            flex: 1;
        }

        .btn-confirm {
            background-color: var(--danger);
            color: white;
            box-shadow: 0 2px 5px rgba(239, 68, 68, 0.3);
        }

        .btn-confirm:hover {
            background-color: var(--danger-hover);
            transform: translateY(-1px);
        }

        .btn-cancel {
            background-color: var(--background-color);
            color: var(--secondary-color);
            border: 1px solid var(--border-color);
        }

        .btn-cancel:hover {
            background-color: #e2e8f0;
            color: var(--text-dark);
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
            <li><a href="updatePassword"><i class="fa-solid fa-lock"></i> Security</a></li>
            <li><a href="deactivate" class="active-danger"><i class="fa-solid fa-trash-can"></i> Deactivate</a></li>
        </ul>
        <ul class="nav-links" style="flex-grow: 0;">
             <li><a href="logout" class="logout-btn"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
        
        <div class="danger-card">
            <div class="icon-wrapper">
                <i class="fa-solid fa-triangle-exclamation"></i>
            </div>
            
            <h1>Deactivate Account</h1>
            <p class="warning-text">
                Are you sure you want to deactivate your account? <br>
                This action will remove your profile from search results. You may not be able to recover your data.
            </p>

            <form action="deactivateAccount" method="post" class="button-group">
                <button type="button" onclick="window.location.href='candidateHome'" class="btn btn-cancel">
                    No, Cancel
                </button>
                
                <button type="submit" name="button" value="yes" class="btn btn-confirm">
                    Yes, Deactivate
                </button>
            </form>
        </div>

    </div>

</body>
</html>