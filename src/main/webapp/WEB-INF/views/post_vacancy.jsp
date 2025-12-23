<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Post New Vacancy</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        /* Reusing core styles for consistency */
        body { background: #F1F5F9; font-family: 'Inter', sans-serif; display: flex; margin: 0; height: 100vh; }
        .sidebar { width: 260px; background: white; border-right: 1px solid #E2E8F0; padding: 20px; display: flex; flex-direction: column; }
        .logo { color: #4F46E5; font-size: 22px; font-weight: 700; margin-bottom: 40px; }
        .nav-links { list-style: none; padding: 0; }
        .nav-links a { text-decoration: none; color: #64748B; padding: 12px; display: block; border-radius: 8px; font-weight: 500; display: flex; gap: 10px; align-items: center; }
        .nav-links a.active { background: #EEF2FF; color: #4F46E5; }
        
        .main { flex: 1; padding: 30px; overflow-y: auto; }
        
        /* Form Styling */
        .form-container { background: white; border-radius: 12px; padding: 30px; border: 1px solid #E2E8F0; max-width: 900px; margin: 0 auto; }
        h2 { margin-top: 0; margin-bottom: 25px; color: #1E293B; }
        
        .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        label { display: block; font-size: 13px; font-weight: 600; color: #334155; margin-bottom: 8px; }
        input, select, textarea { width: 100%; padding: 12px; border: 1px solid #E2E8F0; border-radius: 8px; margin-bottom: 20px; font-family: 'Inter', sans-serif; box-sizing: border-box; }
        input:focus, textarea:focus { border-color: #4F46E5; outline: none; }
        
        .btn-submit { background: #4F46E5; color: white; padding: 12px 30px; border: none; border-radius: 6px; font-weight: 600; cursor: pointer; font-size: 15px; }
        .btn-cancel { background: white; color: #64748B; padding: 12px 30px; border: 1px solid #E2E8F0; border-radius: 6px; font-weight: 600; cursor: pointer; margin-right: 10px; }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo"><i class="fa-solid fa-building-columns"></i> EduRecruit</div>
        <ul class="nav-links">
            <li><a href="recruiter_dashboard.html"><i class="fa-solid fa-chart-line"></i> Dashboard</a></li>
            <li><a href="institution_profile.html"><i class="fa-solid fa-university"></i> Institution Profile</a></li>
            <li><a href="#" class="active"><i class="fa-solid fa-briefcase"></i> Post Vacancy</a></li>
        </ul>
    </div>

    <div class="main">
        <div class="form-container">
            <h2><i class="fa-solid fa-pen-to-square"></i> Post New Vacancy</h2>
            
            <form>
                <div class="form-row">
                    <div>
                        <label>Job Title</label>
                        <input type="text" placeholder="e.g. Senior Math Teacher">
                    </div>
                    <div>
                        <label>Department</label>
                        <input type="text" placeholder="e.g. Mathematics">
                    </div>
                </div>

                <div class="form-row">
                    <div>
                        <label>Employment Type</label>
                        <select>
                            <option>Full-Time</option>
                            <option>Part-Time</option>
                            <option>Contract</option>
                        </select>
                    </div>
                    <div>
                        <label>Salary Range</label>
                        <input type="text" placeholder="e.g. $40,000 - $50,000 / year">
                    </div>
                </div>

                <label>Job Description</label>
                <textarea rows="6" placeholder="Describe role responsibilities..."></textarea>

                <label>Requirements & Qualifications</label>
                <textarea rows="5" placeholder="e.g. Masters Degree in Math, 5 years experience..."></textarea>

                <div class="form-row">
                    <div>
                        <label>Closing Date</label>
                        <input type="date">
                    </div>
                    <div>
                        <label>Status</label>
                        <select>
                            <option>Active (Publish Now)</option>
                            <option>Draft</option>
                        </select>
                    </div>
                </div>

                <div style="margin-top: 10px; border-top: 1px solid #E2E8F0; padding-top: 20px; text-align: right;">
                    <button type="button" class="btn-cancel">Cancel</button>
                    <button type="button" class="btn-submit">Post Vacancy</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>