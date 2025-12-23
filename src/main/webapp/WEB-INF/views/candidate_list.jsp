<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Candidates - Senior Math Teacher</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { background: #F1F5F9; font-family: 'Inter', sans-serif; display: flex; margin: 0; height: 100vh; }
        .sidebar { width: 260px; background: white; border-right: 1px solid #E2E8F0; padding: 20px; display: flex; flex-direction: column; }
        .logo { color: #4F46E5; font-size: 22px; font-weight: 700; margin-bottom: 40px; }
        .nav-links { list-style: none; padding: 0; }
        .nav-links a { text-decoration: none; color: #64748B; padding: 12px; display: block; border-radius: 8px; font-weight: 500; display: flex; gap: 10px; align-items: center; }
        .nav-links a.active { background: #EEF2FF; color: #4F46E5; }
        
        .main { flex: 1; padding: 30px; overflow-y: auto; }
        
        /* Header Area */
        .breadcrumb { font-size: 13px; color: #64748B; margin-bottom: 10px; }
        .breadcrumb a { color: #4F46E5; text-decoration: none; }
        
        .job-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; }
        .job-title { font-size: 24px; font-weight: 700; color: #1E293B; }
        
        /* Filters */
        .filter-bar { background: white; padding: 15px; border-radius: 8px; border: 1px solid #E2E8F0; margin-bottom: 20px; display: flex; gap: 15px; }
        .filter-select { padding: 8px; border: 1px solid #E2E8F0; border-radius: 6px; font-size: 13px; }
        
        /* Table */
        .table-card { background: white; border-radius: 12px; border: 1px solid #E2E8F0; overflow: hidden; }
        table { width: 100%; border-collapse: collapse; }
        th { background: #F8FAFC; text-align: left; padding: 15px; font-size: 12px; color: #64748B; text-transform: uppercase; font-weight: 600; border-bottom: 1px solid #E2E8F0; }
        td { padding: 15px; border-bottom: 1px solid #E2E8F0; color: #334155; font-size: 14px; vertical-align: middle; }
        
        /* Interactive Status Dropdown */
        .status-badge { padding: 6px 10px; border-radius: 20px; border: 1px solid #E2E8F0; background: white; cursor: pointer; font-size: 13px; outline: none; }
        .status-badge.new { color: #4F46E5; background: #EEF2FF; border-color: #C7D2FE; }
        .status-badge.hire { color: #166534; background: #DCFCE7; border-color: #86EFAC; }
        
        .btn-icon { background: none; border: none; color: #64748B; cursor: pointer; font-size: 16px; margin-left: 10px; }
        .btn-icon:hover { color: #4F46E5; }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo"><i class="fa-solid fa-building-columns"></i> EduRecruit</div>
        <ul class="nav-links">
            <li><a href="recruiter_dashboard.html"><i class="fa-solid fa-chart-line"></i> Dashboard</a></li>
            <li><a href="#" class="active"><i class="fa-solid fa-users"></i> Applicants</a></li>
        </ul>
    </div>

    <div class="main">
        <div class="breadcrumb">
            <a href="recruiter_dashboard.html">Dashboard</a> / Job: Senior Math Teacher
        </div>
        
        <div class="job-header">
            <div class="job-title">Applicants for: Senior Math Teacher</div>
            <button style="background: white; border: 1px solid #E2E8F0; padding: 8px 16px; border-radius: 6px; cursor: pointer;">
                <i class="fa-solid fa-download"></i> Export CSV
            </button>
        </div>

        <div class="filter-bar">
            <select class="filter-select">
                <option>All Statuses</option>
                <option>New</option>
                <option>Interviewing</option>
                <option>Hired</option>
            </select>
            <input type="text" placeholder="Search candidate name..." class="filter-select" style="width: 250px;">
        </div>

        <div class="table-card">
            <table>
                <thead>
                    <tr>
                        <th>Candidate Name</th>
                        <th>Applied Date</th>
                        <th>Email</th>
                        <th>Resume</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><strong>Alice Johnson</strong></td>
                        <td>Oct 25, 2023</td>
                        <td>alice.j@example.com</td>
                        <td><a href="#" style="color: #4F46E5; text-decoration: none;"><i class="fa-solid fa-file-pdf"></i> Resume.pdf</a></td>
                        <td>
                            <select class="status-badge new">
                                <option>New</option>
                                <option>Shortlisted</option>
                                <option>Rejected</option>
                            </select>
                        </td>
                        <td>
                            <button class="btn-icon" title="View Profile"><i class="fa-solid fa-eye"></i></button>
                            <button class="btn-icon" title="Email Candidate"><i class="fa-solid fa-envelope"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Mark Smith</strong></td>
                        <td>Oct 22, 2023</td>
                        <td>mark.s@example.com</td>
                        <td><a href="#" style="color: #4F46E5; text-decoration: none;"><i class="fa-solid fa-file-word"></i> CV.docx</a></td>
                        <td>
                            <select class="status-badge hire">
                                <option>Shortlisted</option>
                                <option selected>Interviewing</option>
                                <option>Hired</option>
                            </select>
                        </td>
                        <td>
                            <button class="btn-icon"><i class="fa-solid fa-eye"></i></button>
                            <button class="btn-icon"><i class="fa-solid fa-envelope"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>