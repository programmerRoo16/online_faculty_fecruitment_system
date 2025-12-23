<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Institution</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { background: #F8FAFC; font-family: 'Inter', sans-serif; display: flex; align-items: center; justify-content: center; min-height: 100vh; margin: 0; }
        .register-card { background: white; padding: 40px; border-radius: 16px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1); width: 100%; max-width: 500px; }
        .logo-area { text-align: center; margin-bottom: 30px; color: #4F46E5; font-size: 24px; font-weight: 800; }
        h2 { color: #1E293B; margin-bottom: 10px; text-align: center; }
        p { color: #64748B; text-align: center; margin-bottom: 30px; font-size: 14px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; font-size: 13px; font-weight: 600; color: #475569; margin-bottom: 8px; }
        input, select { width: 100%; padding: 12px; border: 1px solid #E2E8F0; border-radius: 8px; outline: none; box-sizing: border-box; font-size: 14px; }
        input:focus { border-color: #4F46E5; ring: 2px solid #4F46E5; }
        .btn-primary { width: 100%; background: #4F46E5; color: white; padding: 12px; border: none; border-radius: 8px; font-weight: 600; cursor: pointer; font-size: 15px; margin-top: 10px; }
        .btn-primary:hover { background: #4338ca; }
        .note { font-size: 12px; color: #64748B; background: #F1F5F9; padding: 12px; border-radius: 6px; margin-top: 20px; text-align: center; }
        .login-link { text-align: center; margin-top: 20px; font-size: 14px; }
        .login-link a { color: #4F46E5; text-decoration: none; font-weight: 600; }
    </style>
</head>
<body>
    <div class="register-card">
        <div class="logo-area">EduRecruit</div>
        <h2>Partner Registration</h2>
        <p>Create an account for your School or College.</p>
        
        <form>
            <div class="form-group">
                <label>Institution Name</label>
                <input type="text" placeholder="e.g. Springfield High School">
            </div>
            
            <div class="form-group">
                <label>Institution Type</label>
                <select>
                    <option>School (K-12)</option>
                    <option>College / University</option>
                    <option>Vocational Institute</option>
                </select>
            </div>

            <div class="form-group">
                <label>Official Email Address</label>
                <input type="email" placeholder="admin@school.edu">
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" placeholder="Create a secure password">
            </div>

            <button type="button" class="btn-primary">Submit for Approval</button>
        </form>

        <div class="note">
            <strong>Note:</strong> Your account requires manual verification by our admins. You will receive an email once approved.
        </div>

        <div class="login-link">
            Already have an account? <a href="#">Log in</a>
        </div>
    </div>
</body>
</html>