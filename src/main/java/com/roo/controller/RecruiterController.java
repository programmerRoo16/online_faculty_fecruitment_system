package com.roo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.roo.daoImpl.RecruiterDaoImpl;
import com.roo.pojo.AppliedVacancy;
import com.roo.pojo.Candidate;
import com.roo.pojo.Recruiter;
import com.roo.pojo.Vacancy;

@Controller
public class RecruiterController {
@Autowired		
private RecruiterDaoImpl recruiterDaoImpl;
	
@RequestMapping("recruiterRegistration")
public String getRecruiterReg() {
	return "recruiterRegistration";
}
@RequestMapping("home")
public String getHome(){
	return "home";
}
//------------------------------------------

@RequestMapping("post_vacancy")
public String getPostMapping() {
	return "post_vacancy";
}
//------------------------------------------
@RequestMapping("logout")
public String getLogout(HttpSession session){
	
	session.invalidate();
	return "home";
}
@GetMapping("updateRecruiter")
public String getupdateRecruiter() {
	return "updateRecruiter";
}
@GetMapping("updateRecPassword")
public String getupdateRecPassword() {
	return "updateRecPassword";
}
@GetMapping("deactivateRecruiter")
public String getdeactivateRecruiter() {
	return "deactivateRecruiter";
}

@GetMapping("recruiterLogin")
public String getlogin() {
	return "recruiterLogin";
}

/*Recruiter Registration*/
@PostMapping("registerRecruiter")
public String registerRecruiter(@RequestParam("name") String name,
		               @RequestParam("recType") String rec,
					   @RequestParam("email") String email,
			     	   @RequestParam("password") String password,
			     	   @RequestParam("contact") String contact,
       				   @RequestParam("address") String address,
       				   Model model)
{
	Recruiter recruiter=new Recruiter(name, rec, email, password, contact, address, false);
	if(recruiterDaoImpl.registerRecruit(recruiter))
	{   
		model.addAttribute("msg","Registeration Succesfull can login");
		return "recruiterLogin";
	}
	else
	{
		model.addAttribute("msg","Registeration unsuccesfull");
		return "recruiterRegistration";
	}
}
/*Updating Profile*/
@PostMapping("updateRecProfile")
public String updateRecruiter(@RequestParam("name") String name,
		               @RequestParam("recType") String rec,
					   @RequestParam("email") String email,
			     	   @RequestParam("password") String password,
			     	   @RequestParam("contact") String contact,
       				   @RequestParam("address") String address,
       				   Model model)
{
	Recruiter recruiter=new Recruiter(name, rec, email, password, contact, address, false);
	if(recruiterDaoImpl.updateProfile(recruiter))
	{   
		model.addAttribute("msg","Profile Updated Succesfully");
		return "redirect:/recruiter_deshboard";
	}
	else
	{
		model.addAttribute("msg","Profile updation unsuccesfull");
		return "updateRecruiter";
	}
}
@PostMapping("deactivateRec")
public String deactivate(@RequestParam("button") String button,HttpServletRequest request,HttpSession session, Model m) {
	if(button.equals("yes")){
		Recruiter recruiter=(Recruiter)session.getAttribute("recruiter");
	   if(recruiterDaoImpl.deleteProfile(recruiter)){
		   session.invalidate();
		   m.addAttribute("msg","Profile Deactivated");
		   return "recruiterLogin";
	   }
	   else {
		   m.addAttribute("msg","Profile Not Deactivated");
		   return "recruiter_deshboard";
	   }
	}else
	{
	return "recruiter_deshboard";
	}
	}

/*Recruiter login*/
@PostMapping("loginRecruiter")
public String candidateLogin(@RequestParam("email") String email,@RequestParam("password") String password,Model m,HttpSession session, HttpServletRequest request)
{
	Recruiter recruiter=recruiterDaoImpl.checkRecruiter(email, password);
	session = request.getSession(false);
	if(session!=null)
	{
		session.invalidate();
	}
	session = request.getSession(true);
	if(recruiter!=null) {
		session.setAttribute("recruiter", recruiter);
		return "redirect:/recruiter_deshboard";
	}
	else {
		m.addAttribute("msg","Email or Password is wrong");
		return "recruiterLogin";
	}
}


@RequestMapping("recruiter_deshboard")
public String getRecruiterDesh(HttpSession session,Model m) {
	Recruiter recruiter=(Recruiter)session.getAttribute("recruiter");
	List<AppliedVacancy> appliedVacancy=recruiterDaoImpl.viewCandidate(recruiter);
	List<Vacancy> vacancyList=recruiterDaoImpl.viewVacancies(recruiter.getEmail());
	m.addAttribute("applicantList",appliedVacancy);
	m.addAttribute("vacancyList",vacancyList);
	return "recruiter_deshboard";
}

/*Change password*/
@PostMapping("passwordRecUpdate")
public String updateRecUpdate(@RequestParam("old")String oldPassword,
		                     @RequestParam("new")String newPassword,Model m,HttpSession session)
{  
	Recruiter recruiter=(Recruiter)session.getAttribute("recruiter");
	if(recruiterDaoImpl.updatePassword(oldPassword, newPassword, recruiter.getEmail()))
	{
		m.addAttribute("msg", "Password Changed Successfull");
		return "redirect:/recruiter_deshboard";
	}
	else
	{
		m.addAttribute("msg", "Password can not be Changed");
		return "updateRecPassword";
	}
}

}