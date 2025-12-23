package com.roo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.roo.daoImpl.AdminDaoImpl;
import com.roo.daoImpl.CandidateDaoImpl;
import com.roo.pojo.Admin;
import com.roo.pojo.AppliedVacancy;
import com.roo.pojo.Candidate;
import com.roo.pojo.Recruiter;
import com.roo.pojo.Vacancy;

@Controller
public class AdminController {
	
	@Autowired
	private AdminDaoImpl adminDaoImpl;
	
	@GetMapping("adminLogin")
	public String getAdminLogin() {
		return "adminLogin";
	}
	
	@GetMapping("admin_deshboard")
	public String getAdminDeshboard(Model m) {
		List<Candidate> candidateList=adminDaoImpl.getCandidate();
		List<Recruiter> recruiterList=adminDaoImpl.getRecruiter();
	    List<Vacancy> vacancyList=adminDaoImpl.getVacancy();
	    List<AppliedVacancy> appVacancyList=adminDaoImpl.getAppliedVacancy();
	    if(candidateList!=null && recruiterList!=null && vacancyList!=null) {
	    	   m.addAttribute("candidateList", candidateList);
	    	   m.addAttribute("recruiterList",recruiterList);
	    	   m.addAttribute("vacancyList",vacancyList);
	    	   m.addAttribute("appVacancyList",appVacancyList);
	    	   return "admin_deshboard";
	    }
	    else {
	    	   return "adminLogin";
	    }
	}
	
	@RequestMapping("view_resume")
	public void getResume(@RequestParam("email")String email,HttpServletResponse response)throws IOException {
		Candidate candidate=adminDaoImpl.viewCandidate(email);
		if(candidate!=null && candidate.getFileData()!=null) {
			response.setContentType("application/pdf");
			String fileName=candidate.getEmail()+".pdf";
			response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "\"");
	        
			ServletOutputStream out=response.getOutputStream();
			out.write(candidate.getFileData());
			out.flush();
			out.close();
		}
	}
	@PostMapping("updateAdminPassword")
	public String updateAdminPassword(@RequestParam("oldPassword")String oldPassword,
			@RequestParam("newPassword")String newPassword,
			@RequestParam("conformPassword")String conformPassword,Model m) {
		if(!conformPassword.equals(newPassword)) {
			m.addAttribute("msg","conform password Doesnt match");
			return "redirect:/admin_deshboard";
		}
		else {
			if(adminDaoImpl.updatePassword(newPassword)) {
				m.addAttribute("msg","Password Upadated Successfully");
				return "redirect:/admin_deshboard";
			}
			else {
				m.addAttribute("msg","confirm password Doesnt match");
				return "redirect:/admin_deshboard";
			}
		}
	}
	
	@PostMapping("loginAdmin")
	public String adminLogin(@RequestParam("username")String username,
			                 @RequestParam("password")String password,
			                 HttpSession session,
			                 HttpServletRequest request,Model m) {
		session=request.getSession(false);
		if(session!=null) {
		session.invalidate();
		}
		session=request.getSession(true);
		if(adminDaoImpl.checkAdmin(username, password)) {
			session.setAttribute("username",username);
			return "redirect:/admin_deshboard";
		}
		else {
			m.addAttribute("msg","invalide Username or Password");
			return "adminLogin";
		}
	}
	@GetMapping("logout_Admin")
	public String logoutAdmin(HttpSession session,HttpServletRequest request) {
		session=request.getSession();
		session.invalidate();
		return "home";
	}
	
	@PostMapping("action_admin")
	public String actionByAdmin(@RequestParam("email")String email,@RequestParam("action")String action,Model m)
	{
		switch (action) {
		case "approve":
			if(adminDaoImpl.approveCandidate(email)) {
				m.addAttribute("approved","true");
			     return "redirect:/admin_deshboard";
			}else {
				m.addAttribute("approved","false");
			     return "redirect:/admin_deshboard";
			}
        case "view":
        	       Candidate candidate=adminDaoImpl.viewCandidate(email);
			  if(candidate!=null)
			  {
				  m.addAttribute("candidate",candidate);
				  return "redirect:/view_resume?email="+candidate.getEmail();
			  }
			  else {
				  return "redirect:/admin_deshboard";
			  }
        case "delete":
			    adminDaoImpl.deleteCandidate(email);
				return "redirect:/admin_deshboard";
			
		}
		return "null";
	}
	
	@PostMapping("action_recruiter")
	public String actionForRecruiter(@RequestParam("email")String email,@RequestParam("action")String action,Model m)
	{
		switch (action) {
		case "approve":
			if(adminDaoImpl.approveRecruiter(email)) {
				m.addAttribute("approved","true");
			     return "redirect:/admin_deshboard";
			}else {
				m.addAttribute("approved","false");
			     return "redirect:/admin_deshboard";
			}
        case "view":
        	       Recruiter recruiter=adminDaoImpl.viewRecruiter(email);
			  if(recruiter!=null)
			  {
				  m.addAttribute("candidate",recruiter);
				  return "viewCandidate";
			  }
			  else {
				  return "redirect:/admin_deshboard";
			  }
        case "delete":
			    adminDaoImpl.deleteRecruiter(email);
				return "redirect:/admin_deshboard";
			
		}
		return "null";
	}
	@PostMapping("action_vacancy")
	public String actionForVacancy(@RequestParam("vid")int vid,@RequestParam("action")String action,Model m)
	{
		switch (action) {
		        case "view":
        	       List<Vacancy> vacancyList=adminDaoImpl.getVacancy();
			  if(vacancyList!=null)
			  {
				  m.addAttribute("list",vacancyList);
				  return "viewVacancies";
			  }
			  else {
				  return "redirect:/admin_deshboard";
			  }
        case "delete":
			    adminDaoImpl.deleteVacancy(vid);
				return "redirect:/admin_deshboard";
			
		}
		return "null";
	}
}
