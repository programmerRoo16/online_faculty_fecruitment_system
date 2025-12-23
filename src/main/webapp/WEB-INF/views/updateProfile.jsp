<%@page import="com.roo.pojo.Candidate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile | Candidate Portal</title>
    
    <!-- Fonts and Icons -->
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
        }

        /* Header */
        .page-header {
            margin-bottom: 25px;
        }
        .page-header h2 { font-size: 22px; color: var(--text-dark); }
        .page-header p { color: var(--secondary-color); font-size: 14px; }

        /* Form Card */
        .form-card {
            background: var(--white);
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            padding: 30px;
            border: 1px solid var(--border-color);
            max-width: 800px;
        }

        .form-section-title {
            font-size: 16px;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid var(--border-color);
        }

        /* Grid Layout */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 30px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-group.full-width {
            grid-column: span 2;
        }

        label {
            font-size: 13px;
            font-weight: 500;
            color: var(--secondary-color);
        }

        input, select, textarea {
            padding: 10px 14px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            font-size: 14px;
            color: var(--text-dark);
            transition: border-color 0.2s, box-shadow 0.2s;
            width: 100%;
        }

        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(15, 118, 110, 0.1);
        }

        /* Readonly Field Styling */
        input[readonly] {
            background-color: #f8fafc;
            color: #94a3b8;
            cursor: not-allowed;
        }

        /* Button */
        .btn-update {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .btn-update:hover {
            background-color: var(--primary-hover);
        }

        /* Error Box */
        .alert-box {
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-size: 14px;
        }
        .alert-error { background-color: #FEE2E2; color: #991B1B; border: 1px solid #FCA5A5; }

    </style>
</head>
<body>

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="logo">
            <i class="fa-solid fa-graduation-cap"></i> Candidate Portal
        </div>
        <ul class="nav-links">
            <li><a href="candidate_deshboard"><i class="fa-solid fa-grid-2"></i> Dashboard</a></li>
            <li><a href="seeAllVacancies"><i class="fa-solid fa-magnifying-glass"></i> Find Jobs</a></li>
            <li><a href="viewApplieVacancies"><i class="fa-solid fa-file-circle-check"></i> Applications</a></li>
            
            <li class="section-label">Account</li>
            <!-- Active State -->
            <li><a href="updateProfile" class="active"><i class="fa-solid fa-user-gear"></i> My Profile</a></li>
            <li><a href="updatePassword"><i class="fa-solid fa-lock"></i> Security</a></li>
            <li><a href="deactivate" style="color: #ef4444;"><i class="fa-solid fa-trash-can"></i> Deactivate</a></li>
        </ul>
        <ul class="nav-links" style="flex-grow: 0;">
             <li><a href="logout" class="logout-btn"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a></li>
        </ul>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main-content">
        
        <div class="page-header">
            <h2>Profile Settings</h2>
            <p>Update your personal information and academic details.</p>
        </div>

        <%
        // Retrieve Session Data
        Candidate candidate = (Candidate)session.getAttribute("candidate");

        if (candidate != null) {
        %>
        
        <form action="update" method="post" class="form-card" enctype="multipart/form-data">
            
            <!-- SECTION 1: Personal Details -->
            <div class="form-section-title">Personal Information</div>
            
            <div class="form-grid">
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" name="fname" value="<%=candidate.getFname()%>" required>
                </div>
                
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="lname" value="<%=candidate.getLname()%>" required>
                </div>
                
                <div class="form-group">
                    <label>Email Address</label>
                    <!-- Readonly to prevent login issues. Remove 'readonly' if you want it editable -->
                    <input type="email" name="email" value="<%=candidate.getEmail()%>" readonly title="Email cannot be changed">
                </div>
                
                <div class="form-group">
                    <label>Contact Number</label>
                    <input type="tel" name="contact" value="<%=candidate.getContact()%>" required>
                </div>

                <div class="form-group">
                    <label>Gender</label>
                    <select name="gender">
                        <option value="Male" <%= "Male".equalsIgnoreCase(candidate.getGender()) ? "selected" : "" %>>Male</option>
                        <option value="Female" <%= "Female".equalsIgnoreCase(candidate.getGender()) ? "selected" : "" %>>Female</option>
                        <option value="Other" <%= "Other".equalsIgnoreCase(candidate.getGender()) ? "selected" : "" %>>Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Date of Birth</label>
                    <input type="date" name="date" value="<%=candidate.getDate()%>" required>
                </div>

                <div class="form-group full-width">
                    <label>Residential Address</label>
                    <input type="text" name="address" value="<%=candidate.getAddress()%>" required>
                </div>
            </div>

            <!-- SECTION 2: Academic Details -->
            <div class="form-section-title">Academic & Professional Details</div>
            
            <div class="form-grid">
                <div class="form-group">
                    <label>Highest Qualification</label>
                    <input type="text" name="qualification" value="<%=candidate.getQualification()%>" placeholder="e.g. Ph.D. in Computer Science" required>
                </div>
                <input type="hidden" name="password" value="<%=candidate.getPassword()%>">
                <div class="form-group">
                    <label>Experience (Years)</label>
                    <input type="number" step="0.1" name="experience" value="<%=candidate.getExperience()%>" placeholder="e.g. 5.5" required>
                </div>
            </div>
             <div class="form-group">
                    <label>Resume</label>
                    <input type="file"  name="resume" value="<%=candidate.getFileData()%>"required>
                </div>
            
            <div style="display: flex; justify-content: flex-end; margin-top: 20px;">
                <button type="submit" class="btn-update">
                    <i class="fa-solid fa-floppy-disk"></i> Save Changes
                </button>
            </div>

        </form>

        <%
        } else {
        %>
            <div class="alert-box alert-error">
                <i class="fa-solid fa-triangle-exclamation"></i> 
                <strong>Session Expired:</strong> Please <a href="login.jsp" style="color: inherit; text-decoration: underline;">log in again</a> to view your profile.
            </div>
        <% } %>

    </div>

</body>
</html>