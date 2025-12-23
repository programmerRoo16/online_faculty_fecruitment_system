<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - Faculty Recruitment</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* --- CSS Variables from Reference --- */
        :root {
            --primary-color: #4F46E5; /* Indigo */
            --primary-hover: #4338ca;
            --secondary-color: #64748B; /* Slate Gray */
            --background-color: #F1F5F9;
            --white: #ffffff;
            --text-dark: #1E293B;
            --border-color: #E2E8F0;
            --success: #10B981;
            --danger: #EF4444;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: var(--background-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        /* --- Landing Container --- */
        .landing-container {
            width: 100%;
            max-width: 1000px;
            text-align: center;
        }

        .header-section {
            margin-bottom: 50px;
        }

        .logo-icon {
            font-size: 48px;
            color: var(--primary-color);
            margin-bottom: 20px;
            display: inline-block;
            background: #EEF2FF;
            padding: 20px;
            border-radius: 50%;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: var(--text-dark);
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 10px;
            letter-spacing: -0.025em;
        }

        .tagline {
            color: var(--secondary-color);
            font-size: 1.125rem;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }

        /* --- Action Cards Grid --- */
        .role-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            margin-top: 20px;
        }

        /* --- Card Styling (Based on Reference .card & .job-card) --- */
        .role-card {
            background: var(--white);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 40px 30px;
            text-decoration: none;
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }

        .role-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            border-color: var(--primary-color);
        }

        .card-icon {
            width: 70px;
            height: 70px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            margin-bottom: 20px;
            transition: background 0.3s ease;
        }

        .role-title {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 10px;
        }

        .role-desc {
            color: var(--secondary-color);
            font-size: 0.9rem;
            line-height: 1.5;
            margin-bottom: 25px;
        }

        .action-link {
            margin-top: auto;
            font-weight: 600;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* --- Specific Card Themes --- */
        
        /* Candidate Card (Primary Indigo) */
        .role-card.candidate .card-icon {
            background-color: #EEF2FF;
            color: var(--primary-color);
        }
        .role-card.candidate .action-link { color: var(--primary-color); }
        .role-card.candidate:hover .card-icon { background-color: var(--primary-color); color: var(--white); }

        /* Recruiter Card (Success Green) */
        .role-card.recruiter .card-icon {
            background-color: #ECFDF5;
            color: var(--success);
        }
        .role-card.recruiter .action-link { color: var(--success); }
        .role-card.recruiter:hover .card-icon { background-color: var(--success); color: var(--white); }
        .role-card.recruiter:hover { border-color: var(--success); }

        /* Admin Card (Rose/Purple - Replaces Fuchsia/Maroon) */
        .role-card.admin .card-icon {
            background-color: #FFF1F2;
            color: #BE123C; /* Rose 700 */
        }
        .role-card.admin .action-link { color: #BE123C; }
        .role-card.admin:hover .card-icon { background-color: #BE123C; color: var(--white); }
        .role-card.admin:hover { border-color: #BE123C; }

        /* --- Footer --- */
        .footer-note {
            margin-top: 50px;
            color: var(--secondary-color);
            font-size: 0.85rem;
        }

    </style>
</head>
<body>

    <div class="landing-container">
        
        <div class="header-section">
            <div class="logo-icon">
                <i class="fa-solid fa-university"></i>
            </div>
            <h1>Faculty Recruitment System</h1>
            <p class="tagline">The premium platform connecting top academic talent with the world's leading institutions.</p>
        </div>

        <div class="role-grid">
            
            <a href="index" class="role-card candidate">
                <div class="card-icon">
                    <i class="fa-solid fa-user-graduate"></i>
                </div>
                <h2 class="role-title">Candidate</h2>
                <p class="role-desc">Looking for a faculty position? Register here to browse vacancies and track applications.</p>
                <div class="action-link">
                    Proceed as Candidate <i class="fa-solid fa-arrow-right"></i>
                </div>
            </a>

            <a href="recruiterRegistration" class="role-card recruiter">
                <div class="card-icon">
                    <i class="fa-solid fa-briefcase"></i>
                </div>
                <h2 class="role-title">Recruiter</h2>
                <p class="role-desc">Hiring talent? Register your institution to post vacancies and manage candidates.</p>
                <div class="action-link">
                    Proceed as Recruiter <i class="fa-solid fa-arrow-right"></i>
                </div>
            </a>

            <a href="adminLogin" class="role-card admin">
                <div class="card-icon">
                    <i class="fa-solid fa-shield-halved"></i>
                </div>
                <h2 class="role-title">Administrator</h2>
                <p class="role-desc">System administrators login here to manage users, settings, and reports.</p>
                <div class="action-link">
                    Login as Admin <i class="fa-solid fa-arrow-right"></i>
                </div>
            </a>

        </div>

        <div class="footer-note">
            &copy; 2023 Faculty Recruitment System. All rights reserved.
        </div>
    </div>

</body>
</html>