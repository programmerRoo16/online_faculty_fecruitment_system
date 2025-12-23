<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Institution Profile</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        /* Shared Styles */
        body { background: #F1F5F9; font-family: 'Inter', sans-serif; display: flex; margin: 0; height: 100vh; }
        .sidebar { width: 260px; background: white; border-right: 1px solid #E2E8F0; padding: 20px; display: flex; flex-direction: column; }
        .logo { color: #4F46E5; font-size: 22px; font-weight: 700; margin-bottom: 40px; display: flex; align-items: center; gap: 10px; }
        .nav-links { list-style: none; padding: 0; }
        .nav-links a { text-decoration: none; color: #64748B; padding: 12px; display: block; border-radius: 8px; margin-bottom: 5px; font-weight: 500; display: flex; align-items: center; gap: 10px; }
        .nav-links a.active { background: #EEF2FF; color: #4F46E5; }
        
        .main { flex: 1; padding: 30px; overflow-y: auto; }
        .page-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; }
        
        /* Profile Specifics */
        .profile-card { background: white; border-radius: 12px; border: 1px solid #E2E8F0; padding: 30px; max-width: 800px; }
        .logo-upload { display: flex; align-items: center; gap: 20px; margin-bottom: 30px; }
        .logo-preview { width: 80px; height: 80px; background: #EEF2FF; border-radius: 8px; display: flex; align-items: center; justify-content: center; color: #4F46E5; font-size: 30px; border: 1px dashed #4F46E5; }
        .btn-outline { border: 1px solid #E2E8F0; background: white; padding: 8px 16px; border-radius: 6px; cursor: pointer; color: #1E293B; }
        
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 20px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 8px; color: #1E293B; }
        input, textarea, select { width: 100%; padding: 10px; border: 1px solid #E2E8F0; border-radius: 6px; outline: none; font-family: inherit; box-sizing: border-box; }
        textarea { height: 120px; resize: vertical; }
        
        .save-btn { background: #4F46E5; color: white; border: none; padding: 12px 24px; border-radius: 6px; font-weight: 600; cursor: pointer; }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo"><i class="fa-solid fa-building-columns"></i> EduRecruit</div>
        <ul class="nav-links">
            <li><a href="recruiter_dashboard.html"><i class="fa-solid fa-chart-line"></i> Dashboard</a></li>
            <li><a href="#" class="active"><i class="fa-solid fa-university"></i> Institution Profile</a></li>
            <li><a href="post_job.html"><i class="fa-solid fa-briefcase"></i> My Jobs</a></li>
        </ul>
    </div>

    <div class="main">
        <div class="page-header">
            <h2>Edit Institution Profile</h2>
        </div>

        <div class="profile-card">
            <div class="logo-upload">
                <div class="logo-preview"><i class="fa-solid fa-image"></i></div>
                <div>
                    <label>Institution Logo</label>
                    <button class="btn-outline">Upload New Logo</button>
                    <div style="font-size: 12px; color: #94a3b8; margin-top: 5px;">Recommended size: 200x200px</div>
                </div>
            </div>

            <form>
                <div class="form-grid">
                    <div class="form-group">
                        <label>Institution Name</label>
                        <input type="text" value="MIT School of Technology">
                    </div>
                    <div class="form-group">
                        <label>Website URL</label>
                        <input type="url" value="https://mit.edu">
                    </div>
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label>Establishment Year</label>
                        <input type="number" value="1995">
                    </div>
                    <div class="form-group">
                        <label>Student Count</label>
                        <select>
                            <option>1 - 500</option>
                            <option selected>500 - 1000</option>
                            <option>1000+</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label>About the Institution</label>
                    <textarea>We are a leading technology institute focused on holistic education...</textarea>
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <input type="text" value="123 Education Lane, Springfield, IL">
                </div>

                <div style="text-align: right;">
                    <button type="button" class="save-btn">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>