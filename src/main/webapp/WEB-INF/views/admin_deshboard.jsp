<%@page import="com.roo.pojo.AppliedVacancy"%>
<%@page import="com.roo.pojo.Vacancy"%>
<%@page import="com.roo.pojo.Recruiter"%>
<%@page import="com.roo.pojo.Candidate"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | OFRS</title>
    
    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* --- THEME VARIABLES (Teal/Cyan - Matching Candidate/Recruiter) --- */
        :root {
            --primary-color: #0f766e; /* Teal */
            --primary-light: #14b8a6; 
            --primary-hover: #0d9488;
            --secondary-color: #64748B; /* Slate Gray */
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
        .logout-btn:hover { background-color: #fee2e2 !important; }

        /* --- MAIN CONTENT --- */
        .main-content {
            flex: 1;
            overflow-y: auto;
            padding: 30px;
        }

        /* Top Bar */
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .user-welcome h2 { font-size: 24px; color: var(--text-dark); }
        .user-welcome p { color: var(--secondary-color); font-size: 14px; margin-top: 5px; }

        .profile-bubble {
            width: 45px; height: 45px; border-radius: 50%;
            background-color: var(--primary-color); color: white;
            display: flex; justify-content: center; align-items: center;
            font-weight: bold; font-size: 18px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        /* --- STATS CARDS --- */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4 cards for Admin */
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: var(--white);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            border: 1px solid var(--border-color);
        }

        .card h3 { font-size: 13px; color: var(--secondary-color); font-weight: 600; text-transform: uppercase; }
        .card .number { font-size: 28px; font-weight: 700; color: var(--text-dark); margin-top: 10px; }
        .card-icon { align-self: flex-end; margin-top: -20px; color: var(--primary-light); font-size: 20px; opacity: 0.5; }

        /* --- SECTIONS & TABLES --- */
        .section-card {
            background: var(--white);
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            margin-bottom: 40px;
            border: 1px solid var(--border-color);
            overflow: hidden;
        }

        .section-header {
            padding: 20px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #fafafa;
        }

        .section-header h3 { margin: 0; color: var(--text-dark); font-size: 16px; }

        .table-responsive { overflow-x: auto; }

        table { width: 100%; border-collapse: collapse; min-width: 900px; }
        th, td { padding: 15px 20px; text-align: left; border-bottom: 1px solid var(--border-color); vertical-align: middle; }
        th { background-color: #F8FAFC; color: var(--secondary-color); font-size: 12px; text-transform: uppercase; font-weight: 600; }
        td { color: var(--text-dark); font-size: 14px; }
        tr:last-child td { border-bottom: none; }
        tr:hover { background-color: #F8FAFC; }

        /* --- BADGES --- */
        .badge { padding: 4px 10px; border-radius: 20px; font-size: 11px; font-weight: 600; display: inline-block; }
        .badge-info { background-color: #e0f2fe; color: #0284c7; }
        .badge-warning { background-color: #ffedd5; color: #c2410c; }
        .badge-success { background-color: #dcfce7; color: #15803d; }
        .badge-danger { background-color: #fee2e2; color: #b91c1c; }

        /* --- ACTION BUTTONS --- */
        .btn-group { display: flex; gap: 5px; }
        
        .btn-icon {
            border: none;
            width: 32px; height: 32px;
            border-radius: 6px;
            display: flex; align-items: center; justify-content: center;
            cursor: pointer;
            transition: all 0.2s;
            font-size: 13px;
        }

        .btn-approve { background-color: #dcfce7; color: #15803d; }
        .btn-approve:hover { background-color: #bbf7d0; }
        
        .btn-view { background-color: #e0f2fe; color: #0284c7; }
        .btn-view:hover { background-color: #bae6fd; }
        
        .btn-delete { background-color: #fee2e2; color: #b91c1c; }
        .btn-delete:hover { background-color: #fecaca; }
        
        .btn-disabled { background-color: #f1f5f9; color: #94a3b8; cursor: not-allowed; }

        /* Update Password Form Style */
        .form-inline {
            display: flex;
            gap: 15px;
            padding: 20px;
            align-items: flex-end;
        }
        .form-group { flex: 1; }
        .form-group label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 5px; color: var(--text-dark); }
        .form-group input { width: 100%; padding: 10px; border: 1px solid var(--border-color); border-radius: 6px; outline: none; }
        .btn-update { background-color: var(--primary-color); color: white; padding: 10px 20px; border: none; border-radius: 6px; cursor: pointer; font-weight: 600; }

    </style>
</head>
<body>

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="logo">
            <i class="fa-solid fa-shield-halved"></i> &nbsp; OFRS Admin
        </div>
        <ul class="nav-links">
            <li><a href="#" class="active"><i class="fa-solid fa-gauge-high"></i> Dashboard</a></li>
            
            <li class="section-label">User Management</li>
            <li><a href="#candidates"><i class="fa-solid fa-users"></i> Candidates</a></li>
            <li><a href="#recruiters"><i class="fa-solid fa-user-tie"></i> Recruiters</a></li>
            
            <li class="section-label">Content</li>
            <li><a href="#vacancies"><i class="fa-solid fa-briefcase"></i> Vacancies</a></li>
            <li><a href="#applications"><i class="fa-solid fa-file-lines"></i> Applications</a></li>
            
            <li class="section-label">Settings</li>
            <li><a href="#security"><i class="fa-solid fa-lock"></i> Security</a></li>
        </ul>
        <div style="margin-top: auto;">
            <a href="logout_Admin" class="logout-btn"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main-content">
        
        <div class="top-bar">
            <div class="user-welcome">
                <h2>Admin Dashboard</h2>
                <p>Overview of system activity and user management.</p>
            </div>
            <div class="profile-bubble">A</div>
        </div>

        <%
            List<Candidate> cList = (List<Candidate>)request.getAttribute("candidateList");
            List<Recruiter> rList = (List<Recruiter>)request.getAttribute("recruiterList");
            List<Vacancy> vList = (List<Vacancy>)request.getAttribute("vacancyList");
            List<AppliedVacancy> aList = (List<AppliedVacancy>)request.getAttribute("appVacancyList");
            
            int cCount = (cList != null) ? cList.size() : 0;
            int rCount = (rList != null) ? rList.size() : 0;
            int vCount = (vList != null) ? vList.size() : 0;
            int aCount = (aList != null) ? aList.size() : 0;
        %>

        <!-- STATS CARDS -->
        <div class="stats-grid">
            <div class="card">
                <h3>Candidates</h3>
                <div class="number"><%= cCount %></div>
                <div class="card-icon"><i class="fa-solid fa-users"></i></div>
            </div>
            <div class="card">
                <h3>Recruiters</h3>
                <div class="number"><%= rCount %></div>
                <div class="card-icon"><i class="fa-solid fa-user-tie"></i></div>
            </div>
            <div class="card">
                <h3>Active Vacancies</h3>
                <div class="number"><%= vCount %></div>
                <div class="card-icon"><i class="fa-solid fa-briefcase"></i></div>
            </div>
            <div class="card">
                <h3>Total Applications</h3>
                <div class="number"><%= aCount %></div>
                <div class="card-icon"><i class="fa-solid fa-file-contract"></i></div>
            </div>
        </div>

        <!-- 1. MANAGE CANDIDATES -->
        <div class="section-card" id="candidates">
            <div class="section-header">
                <h3>Manage Candidates</h3>
            </div>
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if(cCount > 0) { for(Candidate c : cList) { %>
                        <tr>
                            <td style="font-weight: 500;"><%= c.getFname() + " " + c.getLname() %></td>
                            <td><%= c.getEmail() %></td>
                            <td><%= c.getContact() %></td>
                            <td>
                                <% if(c.isVerified()) { %>
                                    <span class="badge badge-success">Verified</span>
                                <% } else { %>
                                    <span class="badge badge-warning">Pending</span>
                                <% } %>
                            </td>
                            <td>
                                <form action="action_admin" method="post" class="btn-group">
                                    <input type="hidden" name="email" value="<%=c.getEmail()%>">
                                    
                                    <% if(!c.isVerified()) { %>
                                        <button class="btn-icon btn-approve" name="action" value="approve" title="Approve"><i class="fa-solid fa-check"></i></button>
                                    <% } else { %>
                                        <button class="btn-icon btn-disabled" disabled><i class="fa-solid fa-check-double"></i></button>
                                    <% } %>
                                    
                                    <button class="btn-icon btn-view" name="action" value="view" title="View Profile"><i class="fa-solid fa-eye"></i></button>
                                    <button class="btn-icon btn-delete" name="action" value="delete" title="Remove"><i class="fa-solid fa-trash"></i></button>
                                </form>
                            </td>
                        </tr>
                        <% } } else { %>
                            <tr><td colspan="5" style="text-align:center; padding:20px; color:#777;">No candidates found.</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 2. MANAGE RECRUITERS -->
        <div class="section-card" id="recruiters">
            <div class="section-header">
                <h3>Manage Recruiters</h3>
            </div>
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>Institution Name</th>
                            <th>Email</th>
                            <th>Type</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if(rCount > 0) { for(Recruiter r : rList) { %>
                        <tr>
                            <td style="font-weight: 500;"><%= r.getName() %></td>
                            <td><%= r.getEmail() %></td>
                            <td><span class="badge badge-info"><%= r.getRecruiter() %></span></td>
                            <td>
                                <% if(r.isVerified()) { %>
                                    <span class="badge badge-success">Verified</span>
                                <% } else { %>
                                    <span class="badge badge-warning">Pending</span>
                                <% } %>
                            </td>
                            <td>
                                <form action="action_recruiter" method="post" class="btn-group">
                                    <input type="hidden" name="email" value="<%=r.getEmail()%>">
                                    
                                    <% if(!r.isVerified()) { %>
                                        <button class="btn-icon btn-approve" name="action" value="approve" title="Approve"><i class="fa-solid fa-check"></i></button>
                                    <% } else { %>
                                        <button class="btn-icon btn-disabled" disabled><i class="fa-solid fa-check-double"></i></button>
                                    <% } %>
                                    
                                    <button class="btn-icon btn-view" name="action" value="view" title="View Details"><i class="fa-solid fa-eye"></i></button>
                                    <button class="btn-icon btn-delete" name="action" value="delete" title="Remove"><i class="fa-solid fa-trash"></i></button>
                                </form>
                            </td>
                        </tr>
                        <% } } else { %>
                            <tr><td colspan="5" style="text-align:center; padding:20px; color:#777;">No recruiters found.</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 3. MANAGE VACANCIES -->
        <div class="section-card" id="vacancies">
            <div class="section-header">
                <h3>Active Vacancies</h3>
            </div>
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>Post</th>
                            <th>Recruiter</th>
                            <th>Posted On</th>
                            <th>Openings</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if(vCount > 0) { for(Vacancy v : vList) { %>
                        <tr>
                            <td style="font-weight: 500;"><%= v.getPost() %></td>
                            <td><%= v.getRecruiter() %></td>
                            <td><%= v.getAdvDate() %></td>
                            <td style="text-align:center;"><%= v.getNoVacancy() %></td>
                            <td>
                                <form action="action_vacancy" method="post" class="btn-group">
                                    <input type="hidden" name="vid" value="<%=v.getVacancyId()%>">
                                    <button class="btn-icon btn-view" name="action" value="view" title="View"><i class="fa-solid fa-external-link-alt"></i></button>
                                    <button class="btn-icon btn-delete" name="action" value="delete" title="Delete"><i class="fa-solid fa-trash-alt"></i></button>
                                </form>
                            </td>
                        </tr>
                        <% } } else { %>
                            <tr><td colspan="5" style="text-align:center; padding:20px; color:#777;">No active vacancies.</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 4. ACCOUNT SECURITY -->
        <div class="section-card" id="security">
            <div class="section-header">
                <h3>Admin Password Update</h3>
            </div>
            <form action="updateAdminPassword" method="Post" class="form-inline">
                <div class="form-group">
                    <label>Current Password</label>
                    <input type="password" name="oldPassword" placeholder="Current password">
                </div>
                <div class="form-group">
                    <label>New Password</label>
                    <input type="password" name="newPassword" placeholder="New password">
                </div>
                <div class="form-group">
                    <label>Confirm Password</label>
                    <input type="password" name="conformPassword" placeholder="Confirm password">
                </div>
                <button type="submit" class="btn-update">Update</button>
            </form>
        </div>

    </div>

</body>
</html>