package com.roo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.roo.daoImpl.VacancyDaoImpl;
import com.roo.pojo.Recruiter;
import com.roo.pojo.Vacancy;
@Controller
public class VacancyController {
	@Autowired
    private VacancyDaoImpl  vacancyDaoImpl;
	
	@GetMapping("addVacancies")
	public String getaddVacancies() {
		return "addVacancies";
	}
	@GetMapping("updateVacancies")
	public String getupdateVacancies() {
		return "updateVacancies";
	}
	@GetMapping("deleteVacancies")
	public String getdeleteVacancies() {
		return "deleteVacancies";
	}
	@GetMapping("viewVacancies")
	public String getviewVacancies(Model m,HttpSession session){
		Recruiter recruiter=(Recruiter)session.getAttribute("recruiter");
		List<Vacancy> list=vacancyDaoImpl.viewVacancies(recruiter.getEmail());
		m.addAttribute("list",list);
		return "viewVacancies";
	}
    
	@GetMapping("findVacancy")
	public String findlVacancy() {
		return "findVacancy";
	}

	/*Vacancy Add*/
	@PostMapping("vacanciesAdd")
	public String addvacancy(@RequestParam("post")String post,
			                 @RequestParam("subjects")String subject,
			                 @RequestParam("location")String location,
			                 @RequestParam("critearia")String criteria,
			                 @RequestParam("vacancy")int vacancy,
			                 @RequestParam("salary")String salary,
			                 @RequestParam("advdate")String advdate,
			                 @RequestParam("lastdate")String lastdate,
			                 @RequestParam("email")String email,
			                 @RequestParam("recruiter")String recruiter,
			                 @RequestParam("nameOfRecruiter")String nameofRecruiter,Model m)
	{
		Vacancy vacancy2=new Vacancy(post, subject, location, criteria,vacancy,salary, advdate, lastdate, email, recruiter, nameofRecruiter);
		if(vacancyDaoImpl.addVacancy(vacancy2))
		{
			m.addAttribute("msg","Vacancy added successfully");
			
			return "redirect:/recruiter_deshboard";
		}
		else
		{
			m.addAttribute("msg","vacancy can not be added");
			return "redirect:/recruiterHome";
		}
	}

	/*Delete Vacancy*/
	@PostMapping("vacanciesDelete")
	public String deleteVacancy(@RequestParam("vId") int vId, Model m)
	{
		if(vacancyDaoImpl.deleteVacancy(vId))
		{
		    m.addAttribute("msg","Vacancy Deleted Successfully");
		    return "redirect:/viewVacancies";
	}
		else
		{
			m.addAttribute("msg","Vacancy can not be deleted");
			return "redirect:/viewVacancies";
		}
	}

	/*find vacancy*/
	@PostMapping("getVacancy")
	public String getVacancy(@RequestParam("vId")int vId,Model model)
	{
		Vacancy vacancy=vacancyDaoImpl.findVacancy(vId);
		if(vacancy!=null)
		{
			model.addAttribute("vacancy", vacancy);
			return "updateVacancies";
		}
		else
		{
			model.addAttribute("msg", "Vacancy can not be found");
			return "findVacancy";
		}
	}

	/*Update Vacancy*/

	@PostMapping("vacancyUpdate")
	public String vacancyUpdate(@RequestParam("vId")int vId,
			                 @RequestParam("post")String post,
			                 @RequestParam("subjects")String subject,
			                 @RequestParam("location")String location,
			                 @RequestParam("critearia")String criteria,
			                 @RequestParam("vacancy")int vacancy,
			                 @RequestParam("salary")String salary,
			                 @RequestParam("advdate")String advdate,
			                 @RequestParam("lastdate")String lastdate,
			                 @RequestParam("email")String email,
			                 @RequestParam("recruiter")String recruiter,
			                 @RequestParam("nameOfRecruiter")String nameofRecruiter,Model m)
	{
		Vacancy vacancy2=new Vacancy(vId,post, subject, location, criteria,vacancy,salary, advdate, lastdate, email, recruiter, nameofRecruiter);
		if(vacancyDaoImpl.updateVacancy(vacancy2))
		{
			m.addAttribute("msg","Vacancy updated successfully");
			return "redirect:/viewVacancies";
		}
		else
		{
			m.addAttribute("msg","vacancy can not be updated");
			return "redirect:/viewVacancies";
		}
	}

}
