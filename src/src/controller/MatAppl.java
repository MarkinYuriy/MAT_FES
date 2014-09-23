package controller;

import javax.servlet.http.HttpServletRequest;

import mat.IFesBes1;
import mat.Person;
import mat.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping({"/","/"})
public class MatAppl {
	String userName;
	String userEmail;
	
	@Autowired
	IFesBes1 fesbes1;
	Response resp;
	Person pers;
	
	@RequestMapping({"/"})
	public String login() {
		return "login";
	}
	@RequestMapping({"/buf"})
	public String buf() {
		return "buf";
	}
	@RequestMapping({"/person"})
	public String person(@RequestParam ("firstName") String firstName,/*@RequestParam ("lastName") String lastName,*/
			@RequestParam ("email") String email,@RequestParam ("password") String password,Model model) {
		Person pers = new Person(firstName,/*lastName,*/ null , email, password);
		
		if (fesbes1.setProfile(pers)==resp.IN_ACTIVE) {
			model.addAttribute("email","EMAIL incorrect!");
			return "registry";}
		return "login";
	}
	@RequestMapping({"/home"})
	public String home(@RequestParam ("name") String name,@RequestParam ("password") String password,Model model) {
		if (fesbes1.matLogin(name,password)==resp.NO_PASSWORD_MATCHING){
			model.addAttribute("password","password incorrect!");
			return "login";}
		if (fesbes1.matLogin(name,password)==resp.NO_REGISTRATION){
			model.addAttribute("name","name or email incorrect!");
			return "login";}
	//	userName=pers.getFirstName()+" "+pers.getLastName();
		userName=pers.getName();
		userEmail=pers.getEmail();
		model.addAttribute("userName",userName);
		model.addAttribute("email",userEmail);
		return "home";
	}
	@RequestMapping({"/registry"})
	public String registry(){
		return "registry";
	}
	@RequestMapping({ "/activate" })
	 public String activate(HttpServletRequest request){
		String user=request.getParameter("user");
		String hash=request.getParameter("hash");
		  fesbes1.setActive(user,hash);
	   return "login";
	 }
}
