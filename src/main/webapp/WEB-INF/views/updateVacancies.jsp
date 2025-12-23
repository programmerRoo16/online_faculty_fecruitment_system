<%@page import="com.roo.pojo.Vacancy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Vacancy | OFRS</title>
    
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
            max-width: 900px;
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

        .error-message {
            text-align: center;
            padding: 40px;
            color: var(--secondary-color);
        }
        .error-message h3 { color: var(--text-dark); margin-bottom: 10px; }

    </style>
</head>
<body>

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="logo">
            <i class="fa-solid fa-briefcase"></i> OFRS Recruiter
        </div>
        <ul class="nav-links">
            <li><a href="recruiterHome"><i class="fa-solid fa-gauge-high"></i> Dashboard</a></li>
            <li><a href="addVacancies"><i class="fa-solid fa-plus-circle"></i> Post New Vacancy</a></li>
            <li><a href="viewVacancies" class="active"><i class="fa-solid fa-list-check"></i> Manage Vacancies</a></li>
       
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

    <!-- MAIN CONTENT -->
    <div class="main-content">
        
        <% 
        Vacancy vacancy=(Vacancy)request.getAttribute("vacancy");
        if(vacancy!=null) {
        %>

        <div class="page-header">
            <h2>Update Vacancy Details</h2>
            <p>Modify the details of your existing job posting.</p>
        </div>

        <div class="form-card">
            <form action="vacancyUpdate" method="post" class="form-grid">
                
                <div class="section-divider">Job Information</div>

                <!-- ID (Hidden Logic / Readonly) -->
                <div class="form-group">
                    <label>Vacancy ID</label>
                    <input type="text" name="vId" value="<%=vacancy.getVacancyId()%>" readonly style="background-color: #e2e8f0;">
                </div>

                <!-- Post Title -->
                <div class="form-group">
                    <label>Job Title / Post</label>
                    <input type="text" name="post" value="<%=vacancy.getPost()%>" required>
                </div>

                <!-- Subject & Location -->
                <div class="form-group">
                    <label>Department / Subject</label>
                    <input type="text" name="subjects" value="<%=vacancy.getSubject()%>" required>
                </div>
                <div class="form-group">
                    <label>Location</label>
                    <input type="text" name="location" value="<%=vacancy.getLocation()%>" required>
                </div>

                <!-- Vacancy & Salary -->
                <div class="form-group">
                    <label>Number of Vacancies</label>
                    <input type="text" name="vacancy" value="<%=vacancy.getNoVacancy()%>" required>
                </div>
                <div class="form-group">
                    <label>Salary / Compensation</label>
                    <input type="text" name="salary" value="<%=vacancy.getSalary()%>" required>
                </div>

                <!-- Criteria (Full Width) -->
                <div class="form-group full-width">
                    <label>Eligibility Criteria</label>
                    <input type="text" name="critearia" value="<%=vacancy.getCriteria()%>" required>
                </div>

                <div class="section-divider">Important Dates</div>

                <!-- Dates -->
                <div class="form-group">
                    <label>Advertisement Date</label>
                    <input type="date" name="advdate" value="<%=vacancy.getAdvDate()%>" required>
                </div>
                <div class="form-group">
                    <label>Application Deadline</label>
                    <input type="date" name="lastdate" value="<%=vacancy.getLastDate()%>" required>
                </div>

                <div class="section-divider">Recruiter Information (Read-Only)</div>

                <!-- Read-only Fields -->
                <div class="form-group">
                    <label>Recruiter Name</label>
                    <input type="text" name="nameOfRecruiter" value="<%=vacancy.getNameOfRecruiter()%>" readonly>
                </div>
                <div class="form-group">
                    <label>Institution Type</label>
                    <input type="text" name="recruiter" value="<%=vacancy.getRecruiter()%>" readonly>
                </div>
                <div class="form-group full-width">
                    <label>Contact Email</label>
                    <input type="email" name="email" value="<%=vacancy.getEmail()%>" readonly>
                </div>

                <!-- Actions -->
                <div class="form-actions">
                    <input type="submit" value="Update Vacancy" class="btn-submit">
                    <a href="viewVacancies" class="btn-cancel">Cancel</a>
                </div>

            </form>
        </div>

        <% } else { %>
            <div class="error-message">
                <i class="fa-solid fa-triangle-exclamation" style="font-size: 40px; color: #cbd5e1; margin-bottom: 20px;"></i>
                <h3>No Vacancy Found</h3>
                <p>We couldn't retrieve the vacancy details. Please select a vacancy from the dashboard.</p>
                <br>
                <a href="recruiterHome" class="btn-submit" style="text-decoration: none;">Back to Dashboard</a>
            </div>
        <% } %>

    </div>

</body>
</html>