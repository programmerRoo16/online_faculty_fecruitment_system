<%@page import="com.roo.pojo.Recruiter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post New Vacancy | OFRS</title>
    
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
        .form-card {
            background: var(--white);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            border: 1px solid var(--border-color);
            max-width: 900px; /* Limit width for readability */
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .full-width { grid-column: 1 / -1; }

        label {
            font-size: 13px;
            font-weight: 600;
            color: var(--text-dark);
        }

        input[type="text"], input[type="date"], input[type="email"] {
            padding: 12px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s;
            background-color: #fff;
        }

        input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(15, 118, 110, 0.1);
        }

        input[readonly] {
            background-color: #F8FAFC;
            color: var(--secondary-color);
            cursor: not-allowed;
        }

        .section-divider {
            grid-column: 1 / -1;
            border-top: 1px solid var(--border-color);
            margin: 10px 0;
            padding-top: 10px;
            font-size: 12px;
            font-weight: 700;
            color: var(--secondary-color);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        /* --- BUTTONS --- */
        .form-actions {
            grid-column: 1 / -1;
            display: flex;
            gap: 15px;
            margin-top: 10px;
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

    </style>
</head>
<body>

    <div class="sidebar">
        <div class="logo">
            <i class="fa-solid fa-briefcase"></i> OFRS Recruiter
        </div>
        <ul class="nav-links">
            <li><a href="recruiter_deshboard"><i class="fa-solid fa-gauge-high"></i> Dashboard</a></li>
            <li><a href="addVacancies" class="active"><i class="fa-solid fa-plus-circle"></i> Post New Vacancy</a></li>
            <li><a href="viewVacancies"><i class="fa-solid fa-list-check"></i> Manage Vacancies</a></li>
            <li><a href="viewAppliedCandidate"><i class="fa-solid fa-users-viewfinder"></i> Applicants</a></li>
            
            <li style="margin-top: 20px; margin-bottom: 10px; font-size: 11px; text-transform: uppercase; color: #94a3b8; padding-left: 16px;">Account</li>
            <li><a href="updateRecruiter"><i class="fa-solid fa-user-pen"></i> Update Profile</a></li>
            <li><a href="updateRecPassword"><i class="fa-solid fa-lock"></i> Change Password</a></li>
            <li><a href="deactivateRecruiter" style="color: #ef4444;"><i class="fa-solid fa-trash-can"></i> Deactivate</a></li>
        </ul>
        <ul class="nav-links" style="flex-grow: 0;">
             <li><a href="logout" class="logout-btn"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a></li>
        </ul>
    </div>

    <% Recruiter recruiter=(Recruiter)session.getAttribute("recruiter"); %>

    <div class="main-content">
        
        <div class="page-header">
            <h2>Post New Vacancy</h2>
            <p>Create a new job listing to attract potential candidates.</p>
        </div>

        <div class="form-card">
            <form action="vacanciesAdd" method="post" class="form-grid">
                
                <div class="section-divider">Job Details</div>

                <div class="form-group full-width">
                    <label>Job Title / Post</label>
                    <input type="text" name="post" placeholder="e.g. Senior Professor, Lab Assistant" required>
                </div>

                <div class="form-group">
                    <label>Department / Subject</label>
                    <input type="text" name="subjects" placeholder="e.g. Computer Science" required>
                </div>
                <div class="form-group">
                    <label>Location</label>
                    <input type="text" name="location" placeholder="e.g. Block A, Main Campus" required>
                </div>

                <div class="form-group">
                    <label>Number of Vacancies</label>
                    <input type="text" name="vacancy" placeholder="e.g. 05" required>
                </div>
                <div class="form-group">
                    <label>Salary / Compensation</label>
                    <input type="text" name="salary" placeholder="e.g. 50,000 - 80,000 INR" required>
                </div>

                <div class="form-group full-width">
                    <label>Eligibility Criteria</label>
                    <input type="text" name="critearia" placeholder="e.g. Ph.D. with 5 years experience required" required>
                </div>

                <div class="section-divider">Important Dates</div>

                <div class="form-group">
                    <label>Advertisement Date</label>
                    <input type="date" name="advdate" required>
                </div>
                <div class="form-group">
                    <label>Application Deadline</label>
                    <input type="date" name="lastdate" required>
                </div>

                <div class="section-divider">Recruiter Information (Auto-filled)</div>

                <div class="form-group">
                    <label>Recruiter Name</label>
                    <input type="text" name="nameOfRecruiter" value="<%=recruiter.getName()%>" readonly>
                </div>
                <div class="form-group">
                    <label>Institution Type</label>
                    <input type="text" name="recruiter" value="<%=recruiter.getRecruiter()%>" readonly>
                </div>
                <div class="form-group full-width">
                    <label>Contact Email</label>
                    <input type="email" name="email" value="<%=recruiter.getEmail()%>" readonly>
                </div>

                <div class="form-actions">
                    <input type="submit" value="Publish Vacancy" class="btn-submit">
                    <a href="recruiterHome" class="btn-cancel">Cancel</a>
                </div>

            </form>
        </div>

    </div>

</body>
</html>