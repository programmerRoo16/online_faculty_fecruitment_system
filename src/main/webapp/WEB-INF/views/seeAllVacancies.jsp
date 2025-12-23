<%@page import="com.roo.pojo.Vacancy"%>
<%@page import="com.roo.pojo.Candidate"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Jobs | Candidate Portal</title>
    
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
            --warning: #F59E0B;
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

        /* Header Area */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }
        .page-header h2 { font-size: 22px; color: var(--text-dark); }
        .page-header p { color: var(--secondary-color); font-size: 14px; }

        /* Table Card */
        .table-container {
            background: var(--white);
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            overflow: hidden;
            border: 1px solid var(--border-color);
        }

        table { width: 100%; border-collapse: collapse; min-width: 1000px; }
        th, td { padding: 16px 20px; text-align: left; border-bottom: 1px solid var(--border-color); vertical-align: middle; }
        
        th { 
            background-color: #F8FAFC; 
            color: var(--secondary-color); 
            font-size: 12px; 
            text-transform: uppercase; 
            font-weight: 600; 
            letter-spacing: 0.5px;
        }
        
        td { color: var(--text-dark); font-size: 14px; }
        tr:last-child td { border-bottom: none; }
        tr:hover { background-color: #fcfcfc; }

        /* Custom Column Styles */
        .job-title { font-weight: 600; color: var(--text-dark); display: block; }
        .recruiter-name { font-size: 12px; color: var(--secondary-color); display: block; margin-top: 2px; }
        .location-text { color: var(--secondary-color); font-size: 13px; }
        
        .vacancy-badge {
            background-color: #e0f2fe;
            color: #0284c7;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .deadline-box {
            font-size: 12px;
        }
        .deadline-alert { color: var(--danger); font-weight: 600; }
        .deadline-normal { color: var(--secondary-color); }

        /* Action Button */
        .btn-apply {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .btn-apply:hover { background-color: var(--primary-hover); }

        /* Empty State */
        .empty-state {
            padding: 60px;
            text-align: center;
        }
        .empty-state i { font-size: 48px; color: #cbd5e1; margin-bottom: 15px; }
        .empty-state h3 { font-size: 18px; color: var(--text-dark); margin-bottom: 5px; }
        .empty-state p { color: var(--secondary-color); }

    </style>
</head>
<body>

    <div class="sidebar">
        <div class="logo">
            <i class="fa-solid fa-graduation-cap"></i> Candidate Portal
        </div>
        <ul class="nav-links">
            <li><a href="candidate_deshboard"><i class="fa-solid fa-grid-2"></i> Dashboard</a></li>
            <li><a href="seeAllVacancies" class="active"><i class="fa-solid fa-magnifying-glass"></i> Find Jobs</a></li>
            <li><a href="viewApplieVacancies"><i class="fa-solid fa-file-circle-check"></i> Applications</a></li>
            
            <li class="section-label">Account</li>
            <li><a href="updateProfile"><i class="fa-solid fa-user-gear"></i> My Profile</a></li>
            <li><a href="updatePassword"><i class="fa-solid fa-lock"></i> Security</a></li>
            <li><a href="deactivate" style="color: #ef4444;"><i class="fa-solid fa-trash-can"></i> Deactivate</a></li>
        </ul>
        <ul class="nav-links" style="flex-grow: 0;">
             <li><a href="logout" class="logout-btn"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
        
        <div class="page-header">
            <div>
                <h2>Available Vacancies</h2>
                <p>Browse active faculty positions and apply today.</p>
            </div>
            </div>

        <div class="table-container">
            <%
            List<Vacancy> list = (List<Vacancy>)request.getAttribute("list");

            if (list != null && list.size() > 0) {
            %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Job Role / Recruiter</th>
                        <th>Subject</th>
                        <th>Location</th>
                        <th>Criteria</th>
                        <th>Vacancies</th>
                        <th>Salary</th>
                        <th>Deadlines</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Vacancy vacancy : list) { %>
                    <tr>
                        <td style="color: var(--secondary-color); font-family: monospace;">#<%=vacancy.getVacancyId()%></td>
                        <td>
                            <span class="job-title"><%=vacancy.getPost()%></span>
                            <span class="recruiter-name">By: <%=vacancy.getNameOfRecruiter()%></span>
                        </td>
                        <td><%=vacancy.getSubject()%></td>
                        <td>
                            <span class="location-text">
                                <i class="fa-solid fa-location-dot"></i> <%=vacancy.getLocation()%>
                            </span>
                        </td>
                        <td>
                            <div style="max-width: 200px; font-size: 13px;"><%=vacancy.getCriteria()%></div>
                        </td>
                        <td style="text-align: center;">
                            <span class="vacancy-badge"><%=vacancy.getNoVacancy()%> Open</span>
                        </td>
                        <td style="font-weight: 500;"><%=vacancy.getSalary()%></td>
                        <td>
                            <div class="deadline-box">
                                <div class="deadline-normal">Adv: <%=vacancy.getAdvDate()%></div>
                                <div class="deadline-alert">End: <%=vacancy.getLastDate()%></div>
                            </div>
                        </td>
                        <td>
                            <form action="apllyVacancy" method="post" style="margin: 0;">
                                <button type="submit" class="btn-apply" name="vid" value="<%=vacancy.getVacancyId()%>">
                                    Apply <i class="fa-solid fa-paper-plane"></i>
                                </button>
                            </form>
                        </td>
                    </tr> 
                    <% } %>
                </tbody>
            </table>
            <% } else { %>
                <div class="empty-state">
                    <i class="fa-regular fa-folder-open"></i>
                    <h3>No Job Openings Found</h3>
                    <p>There are currently no vacancies listed. Please check back later!</p>
                </div>
            <% } %>
        </div>

    </div>

</body>
</html>