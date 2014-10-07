package controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import mat.IFesBes1;
import mat.IFrontConnector;
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
	String name;
	String userName;
	String userEmail;
	
	@Autowired
	IFesBes1 ifesbes1;
	IFrontConnector connector;
	
	@RequestMapping({"/"})
	public String login() {
		return "login";
	}
	@RequestMapping({"/buf"})
	public String buf() {
		return "buf";
	}
	@RequestMapping({"/accountsetings"})
	public String accountsetings (Model model) {
		 String[] data = new String[0];
	        try {
	            data = connector.getApplicationData(IFrontConnector.GOOGLE);
	        } catch (Exception e) {
	            e.getMessage();
	        }
	        String clientID = data[IFrontConnector.INDEX_ID];
	        StringBuffer scopes = new StringBuffer();
	        for (int i = IFrontConnector.INDEX_SCOPES; i < data.length; i++) {
	            scopes.append(data[i]);
	            scopes.append(" ");
	        }

	        //Add attributes to read from google_signin.jsp
	        model.addAttribute("id", clientID);
	        model.addAttribute("scopes", scopes);

	    return "account_setings";
	}
	@RequestMapping({"/resauto"})
	 public String login(String code, String access_token, Model model) {
	  System.out.println("A code: "+code);
	  System.out.println("A access_token: "+access_token);
	        if (code!=null) {
	            try {
	             connector.authorize(userName, IFrontConnector.GOOGLE, code);
	            } catch (RuntimeException e) {
	                model.addAttribute("error", e.getMessage());
	                return "error_form";
	            }
	        }
	        return homereturn(model);
	 }
	@RequestMapping({"/dom"})
	public String dom (Model model) {
		model.addAttribute("userName",userName);
		return "creatMatt";
	}
	@RequestMapping({"/person"})
	public String person(@RequestParam ("firstName") String firstName,/*@RequestParam ("lastName") String lastName,*/
			@RequestParam ("email") String email,@RequestParam ("password") String password,Model model) {
		String [] buf=new String[0];
		Person pers = new Person(firstName,/*lastName,*/ buf , email, password);
		
		if (ifesbes1.setProfile(pers)==Response.IN_ACTIVE) {
			model.addAttribute("email","EMAIL incorrect!");
			return "registry";}
		return "login";
	}
	@RequestMapping({"/homereturn"})
	public String homereturn (Model model){
		model.addAttribute("name",name);
		model.addAttribute("userName",userName);
		model.addAttribute("email",userEmail);
		model.addAttribute("matt",getMatt());
		return "home";	
	}
	@RequestMapping({"/home"})
	public String home(@RequestParam ("name") String name,@RequestParam ("password") String password,Model model) {
		if (ifesbes1.matLogin(name,password)==Response.NO_PASSWORD_MATCHING){
			model.addAttribute("password","password incorrect!");
			return "login";}
		if (ifesbes1.matLogin(name,password)==Response.NO_REGISTRATION){
			model.addAttribute("name","name or email incorrect!");
			return "login";}
		if (ifesbes1.matLogin(name,password)==Response.IN_ACTIVE){
			model.addAttribute("aktiv","no aktiv!");
			return "login";
		}
	//	userName=pers.getFirstName()+" "+pers.getLastName();
		Person pers=ifesbes1.getProfile(name);
		userName=pers.getEmail();
		userEmail=pers.getEmail();
		name=pers.getName();
		model.addAttribute("name",name);
		model.addAttribute("userName",userName);
		model.addAttribute("email",userEmail);
		model.addAttribute("matt",getMatt());
		return "home";
	}
	
	private String[] getMatt() {
		String[] mas=ifesbes1.getMattNames(userName);
		ArrayList<String> list = new ArrayList<String>();
		for (int i=0;i<mas.length;i++)
			list.add(mas[i]);
		return mas;
	}
	@RequestMapping({"/registry"})
	public String registry(){
		return "registry";
	}
	@RequestMapping({ "/activate" })
	 public String activate(HttpServletRequest request){
		String user=request.getParameter("user");
		String hash=request.getParameter("hash");
		  ifesbes1.setActive(user,hash);
	   return "login";
	 }
	
}
