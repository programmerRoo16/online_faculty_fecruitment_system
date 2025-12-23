<%@page import="com.roo.pojo.Vacancy"%>
<%@page import="com.roo.pojo.Recruiter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Vacancies | OFRS</title>
    
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
        .logout-btn { color: var(--danger) !important; cursor: pointer; }

        /* --- MAIN CONTENT --- */
        .main-content {
            flex: 1;
            overflow-y: auto;
            padding: 30px;
        }

        .page-header {
            margin-bottom: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .page-header h2 { font-size: 24px; color: var(--text-dark); }
        .page-header p { color: var(--secondary-color); font-size: 14px; margin-top: 5px; }

        .btn-add-new {
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: background 0.2s;
        }
        .btn-add-new:hover { background-color: #0d9488; }

        /* --- TABLE DESIGN --- */
        .table-card {
            background: var(--white);
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            border: 1px solid var(--border-color);
            overflow: hidden;
        }

        .table-responsive {
            width: 100%;
            overflow-x: auto;
        }

        table { width: 100%; border-collapse: collapse; min-width: 1200px; }
        
        th, td {
            padding: 16px 20px;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
            vertical-align: middle;
        }

        th {
            background-color: #F8FAFC;
            color: var(--secondary-color);
            font-size: 12px;
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 0.5px;
            white-space: nowrap;
        }

        td { color: var(--text-dark); font-size: 14px; }
        
        tr:hover { background-color: #F8FAFC; }

        /* Status & Badges */
        .date-badge {
            background-color: #F1F5F9;
            color: var(--secondary-color);
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
            white-space: nowrap;
        }

        /* Action Buttons */
        .btn-edit {
            background-color: #e0f2fe;
            color: #0284c7; /* Blue */
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 13px;
            cursor: pointer;
            transition: background 0.2s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .btn-edit:hover { background-color: #bae6fd; }

        .btn-delete {
            background-color: #fee2e2;
            color: #dc2626; /* Red */
            padding: 8px 12px;
            border-radius: 6px;
            font-size: 13px;
            text-decoration: none;
            margin-left: 5px;
            display: inline-flex;
            align-items: center;
            transition: background 0.2s;
        }
        .btn-delete:hover { background-color: #fecaca; }

        .no-data {
            padding: 50px;
            text-align: center;
            color: var(--secondary-color);
        }
        .no-data i { font-size: 40px; color: #cbd5e1; margin-bottom: 15px; }

    </style>
</head>
<body>

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="logo">
            <i class="fa-solid fa-briefcase"></i> OFRS Recruiter
        </div>
        <ul class="nav-links">
            <li><a href="recruiter_deshboard"><i class="fa-solid fa-gauge-high"></i> Dashboard</a></li>
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
        
        <div class="page-header">
            <div>
                <h2>Manage Vacancies</h2>
                <p>View and update your active job postings.</p>
            </div>
            <a href="addVacancies" class="btn-add-new">
                <i class="fa-solid fa-plus"></i> Post New Vacancy
            </a>
        </div>

        <%
            @SuppressWarnings("unchecked")
            List<Vacancy> list = (List<Vacancy>)request.getAttribute("list");
        %>

        <div class="table-card">
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 50px;">ID</th>
                            <th>Post Title</th>
                            <th>Subject / Dept</th>
                            <th>Location</th>
                            <th>Openings</th>
                            <th>Salary</th>
                            <th>Key Dates</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        if (list != null && list.size() > 0) {
                            for(int i=0; i<list.size(); i++) {
                                Vacancy vacancy = list.get(i);
                        %>
                        <tr>
                            <td>#<%=vacancy.getVacancyId()%></td>
                            <td>
                                <span style="font-weight: 600; color: var(--text-dark);">
                                    <%=vacancy.getPost()%>
                                </span>
                            </td>
                            <td><%=vacancy.getSubject()%></td>
                            <td><%=vacancy.getLocation()%></td>
                            <td style="text-align: center;">
                                <span style="font-weight: 600; color: var(--primary-color);">
                                    <%=vacancy.getNoVacancy()%>
                                </span>
                            </td>
                            <td><%=vacancy.getSalary()%></td>
                            <td>
                                <div style="display: flex; flex-direction: column; gap: 4px;">
                                    <span class="date-badge">Adv: <%=vacancy.getAdvDate()%></span>
                                    <span class="date-badge" style="background-color: #fee2e2; color: #991b1b;">End: <%=vacancy.getLastDate()%></span>
                                </div>
                            </td>
                            <td>
                                <div style="display: flex; align-items: center;">
                                    <!-- Edit Button linking to controller to fetch data -->
                                    <form action="getVacancy" method="post">
                           <button name="vId" value="<%=vacancy.getVacancyId()%>" class="btn-edit"><i class="fa-solid fa-pen"></i> </button>
                           </form>
                                    
                                    <!-- Optional Delete Button (comment out if not needed) -->
                                   <form action="vacanciesDelete" method="post">
                                    <button name="vId" value="<%=vacancy.getVacancyId()%>" class="btn-delete"><i class="fa-solid fa-trash"></i> </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <% 
                            } 
                        } else { 
                        %>
                        <tr>
                            <td colspan="8" class="no-data">
                                <i class="fa-regular fa-folder-open"></i>
                                <h3>No Vacancies Found</h3>
                                <p>You haven't posted any jobs yet. Create your first vacancy now.</p>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

</body>
</html>