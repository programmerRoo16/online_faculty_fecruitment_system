<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings - Candidate Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #4F46E5;
            --secondary-color: #64748B;
            --background-color: #F1F5F9;
            --white: #ffffff;
            --text-dark: #1E293B;
            --border-color: #E2E8F0;
            --danger: #EF4444;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

        body { background-color: var(--background-color); display: flex; height: 100vh; }

        /* Reuse Sidebar Styles (Condensed for brevity) */
        .sidebar { width: 260px; background: var(--white); border-right: 1px solid var(--border-color); padding: 20px; display: flex; flex-direction: column; }
        .logo { font-size: 24px; font-weight: 700; color: var(--primary-color); margin-bottom: 40px; display: flex; align-items: center; gap: 10px; }
        .nav-links { list-style: none; flex: 1; }
        .nav-links a { text-decoration: none; color: var(--secondary-color); padding: 12px 16px; display: flex; gap: 12px; border-radius: 8px; margin-bottom: 5px; transition: 0.3s; }
        .nav-links a:hover, .nav-links a.active { background: #EEF2FF; color: var(--primary-color); }

        /* Main Content */
        .main-content { flex: 1; padding: 30px; overflow-y: auto; }
        
        .page-header { margin-bottom: 25px; }
        .page-header h2 { font-size: 24px; color: var(--text-dark); }

        /* TABS Styling */
        .tabs { display: flex; gap: 20px; border-bottom: 1px solid var(--border-color); margin-bottom: 30px; }
        .tab-btn {
            background: none; border: none; padding: 10px 0; margin-right: 15px;
            font-size: 14px; font-weight: 500; color: var(--secondary-color);
            cursor: pointer; position: relative;
        }
        .tab-btn.active { color: var(--primary-color); font-weight: 600; }
        .tab-btn.active::after {
            content: ''; position: absolute; bottom: -1px; left: 0; width: 100%; height: 2px; background: var(--primary-color);
        }

        /* Form Container */
        .settings-container { background: var(--white); padding: 30px; border-radius: 12px; box-shadow: 0 1px 3px rgba(0,0,0,0.05); max-width: 800px; }

        .tab-content { display: none; }
        .tab-content.active { display: block; animation: fadeIn 0.3s; }

        @keyframes fadeIn { from { opacity: 0; transform: translateY(5px); } to { opacity: 1; transform: translateY(0); } }

        /* Form Elements */
        .form-group { margin-bottom: 20px; }
        .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        
        label { display: block; font-size: 13px; font-weight: 500; color: var(--text-dark); margin-bottom: 8px; }
        
        input, textarea, select {
            width: 100%; padding: 10px 12px; border: 1px solid var(--border-color);
            border-radius: 6px; font-size: 14px; color: var(--text-dark); outline: none; transition: 0.2s;
        }
        input:focus, textarea:focus { border-color: var(--primary-color); box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1); }
        textarea { resize: vertical; min-height: 100px; }

        /* Profile Photo Section */
        .profile-photo-upload { display: flex; align-items: center; gap: 20px; margin-bottom: 30px; }
        .current-photo { width: 80px; height: 80px; border-radius: 50%; background: var(--primary-color); color: white; display: flex; align-items: center; justify-content: center; font-size: 24px; font-weight: bold; }
        .upload-btn { background: var(--white); border: 1px solid var(--border-color); padding: 8px 16px; border-radius: 6px; font-size: 13px; cursor: pointer; color: var(--text-dark); transition: 0.2s; }
        .upload-btn:hover { background: #f8fafc; }

        /* Buttons */
        .btn-primary { background: var(--primary-color); color: white; border: none; padding: 10px 24px; border-radius: 6px; font-weight: 500; cursor: pointer; }
        .btn-primary:hover { background: #4338ca; }

        .btn-danger { background: #FEE2E2; color: #991B1B; border: 1px solid #FECACA; padding: 10px 24px; border-radius: 6px; font-weight: 500; cursor: pointer; }
        .btn-danger:hover { background: #FECACA; }

        /* Danger Zone (Account Deletion) */
        .danger-zone { margin-top: 40px; border: 1px solid #FECACA; background: #FEF2F2; padding: 20px; border-radius: 8px; }
        .danger-zone h3 { font-size: 16px; color: #991B1B; margin-bottom: 5px; }
        .danger-zone p { font-size: 13px; color: #B91C1C; margin-bottom: 15px; }

    </style>
</head>
<body>

    <div class="sidebar">
        <div class="logo"><i class="fa-solid fa-briefcase"></i> JobPortal</div>
        <ul class="nav-links">
            <li><a href="#"><i class="fa-solid fa-grid-2"></i> Dashboard</a></li>
            <li><a href="#"><i class="fa-solid fa-user"></i> My Profile</a></li>
            <li><a href="#"><i class="fa-solid fa-magnifying-glass"></i> Find Jobs</a></li>
            <li><a href="#"><i class="fa-solid fa-file-lines"></i> Applications</a></li>
            <li><a href="#" class="active"><i class="fa-solid fa-gear"></i> Settings</a></li>
        </ul>
    </div>

    <div class="main-content">
        
        <div class="page-header">
            <h2>Account Settings</h2>
        </div>

        <div class="tabs">
            <button class="tab-btn active" onclick="switchTab('profile')">Edit Profile</button>
            <button class="tab-btn" onclick="switchTab('security')">Password & Security</button>
        </div>

        <div class="settings-container">
            
            <div id="profile" class="tab-content active">
                
                <div class="profile-photo-upload">
                    <div class="current-photo">AL</div>
                    <div>
                        <label style="margin-bottom: 5px;">Profile Picture</label>
                        <button class="upload-btn">Upload new photo</button>
                        <div style="font-size: 12px; color: #94a3b8; margin-top: 5px;">JPG, GIF or PNG. Max size 800K</div>
                    </div>
                </div>

                <form>
                    <div class="form-row">
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" value="Alex L." placeholder="Enter your full name">
                        </div>
                        <div class="form-group">
                            <label>Professional Headline</label>
                            <input type="text" value="Senior Java Developer" placeholder="e.g. UX Designer">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Email Address</label>
                            <input type="email" value="alex@example.com" readonly style="background-color: #f8fafc; cursor: not-allowed;">
                        </div>
                        <div class="form-group">
                            <label>Phone Number</label>
                            <input type="tel" value="+1 555 000 1234">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Short Bio</label>
                        <textarea placeholder="Tell companies a little about yourself...">Experienced developer with a passion for building scalable web applications...</textarea>
                    </div>

                    <div class="form-group">
                        <label>Resume / CV</label>
                        <input type="file" style="padding: 8px;">
                    </div>

                    <div style="text-align: right; margin-top: 20px;">
                        <button type="button" class="btn-primary">Save Changes</button>
                    </div>
                </form>
            </div>

            <div id="security" class="tab-content">
                
                <h3 style="margin-bottom: 20px; font-size: 16px;">Change Password</h3>
                
                <form>
                    <div class="form-group">
                        <label>Current Password</label>
                        <input type="password" placeholder="Enter current password">
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label>New Password</label>
                            <input type="password" placeholder="Enter new password">
                        </div>
                        <div class="form-group">
                            <label>Confirm New Password</label>
                            <input type="password" placeholder="Confirm new password">
                        </div>
                    </div>

                    <div style="text-align: right; margin-bottom: 40px;">
                        <button type="button" class="btn-primary">Update Password</button>
                    </div>
                </form>

                <div class="danger-zone">
                    <h3>Deactivate Account</h3>
                    <p>This will hide your profile from recruiters and withdraw all active applications. You can reactivate by logging in anytime.</p>
                    <button class="btn-danger">Deactivate My Account</button>
                </div>

            </div>

        </div>
    </div>

    <script>
        function switchTab(tabName) {
            // Hide all tab contents
            const contents = document.querySelectorAll('.tab-content');
            contents.forEach(content => content.classList.remove('active'));

            // Deactivate all tab buttons
            const buttons = document.querySelectorAll('.tab-btn');
            buttons.forEach(btn => btn.classList.remove('active'));

            // Activate specific tab and button
            document.getElementById(tabName).classList.add('active');
            
            // Find the button that was clicked (simple logic)
            const clickedBtn = Array.from(buttons).find(btn => btn.innerText.toLowerCase().includes(tabName === 'profile' ? 'profile' : 'security'));
            if(clickedBtn) clickedBtn.classList.add('active');
        }
    </script>
</body>
</html>