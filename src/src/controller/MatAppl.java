package controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import mat.IFesBes1;
import mat.IFrontConnector;
import mat.Matt;
import mat.MattData;
import mat.Person;
import mat.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping({"/"})
public class MatAppl {
	String m_name;
	String userName;
	String userEmail;
//--------------------------------------------SZS
	mat.MattData data;
	String mattName=null;
	String newTablJSON=null;
	Matt oldMatt=null;
	Matt newMatt=null;
	ArrayList<Boolean> newTabList;	
//--------------------------------------------SZE
	@Autowired
	IFesBes1 ifesbes1;
	@Autowired
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
		return "createMatt";
	}
//--------------------------------------------SZS
/*	@RequestMapping({"/createMatt"})
	public String createMattData(HttpServletRequest request, Model model){
	//----for creating MATT from the very beginning----
		String mattToJSON=null;
		String name = request.getParameter("mattName");
		String nDaysStr=request.getParameter("nDays");
		int nDays = Integer.parseInt(request.getParameter(nDaysStr));//number of days
		String dateStr = request.getParameter("startDate");
		Date startDate = null;
		try {
			startDate = new SimpleDateFormat("dd/MM/yyyy").parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String dateEnd = request.getParameter("endDate");
		String startHourStr=request.getParameter("startHour");
		int startHour = Integer.parseInt(startHourStr);
		String endHourStr=request.getParameter("endHour");
		int endHour = Integer.parseInt(endHourStr);
		String timeSlotStr=request.getParameter("timeSlot");
		int timeSlot = Integer.parseInt(timeSlotStr); //in minutes
		String password = null;
		mat.MattData data = new MattData(name,nDays,startDate,startHour,endHour,timeSlot,password);
		mattName=name;//----???----for creating URL
		oldMatt=ifesbes1.createMatt(data, userName);
		mattToJSON = oldMatt.mattToJson();  
		addingAtributes(model,name,nDaysStr,dateStr,dateEnd,startHourStr,endHourStr,timeSlotStr,mattToJSON);
		return "saveMatt";
	}
	
	@RequestMapping({"/saveMatt"})
	public String saveMattData(HttpServletRequest request, Model model){
		String name = request.getParameter("mattName");
		String nDaysStr=request.getParameter("nDays");
		String dateStr = request.getParameter("startDate");
		String dateEnd = request.getParameter("endDate");
		String startHourStr=request.getParameter("startHour");
		String endHourStr=request.getParameter("endHour");
		String timeSlotStr=request.getParameter("timeSlot");
	 
		//----for saving new MATT to DataBase after user correction----
		newTabList=new ArrayList<Boolean>();
		newTablJSON=request.getParameter("newTabl");
		//newTablJSON.replaceAll("[]{}",",");//needs in special cases
		newTabList=Matt.fromBrowser2Matt(newTablJSON);
		newMatt.setData(oldMatt.getData());
		newMatt.setSlots(newTabList);
		ifesbes1.saveMatt(oldMatt,newMatt,userName);
		addingAtributes(model,name,nDaysStr,dateStr,dateEnd,startHourStr,endHourStr,timeSlotStr,newTablJSON);
		return "savedMatt";
    }
	   
	 //----for viewing sharing MATT from URL----
	@RequestMapping({"/viewMatt"})
	public String viewMatt(HttpServletRequest request,Model model){
		String userName4Matt=request.getParameter("username");
		String mattName=request.getParameter("table");
	  
		Matt matt4Sharing=ifesbes1.getMatt(mattName, userName4Matt);
		String mattToJson4URL = matt4Sharing.matt2browser();
		model.addAttribute("JSON", mattToJson4URL);
		return "viewMatt";//name of JSP viewing file
	}
	 
	private void addingAtributes(Model model,String name,String nDaysStr, 
			String dateStr,String dateEnd,String startHourStr,String endHourStr,
			String timeSlotStr,String mattToJSON){
		model.addAttribute("JSON", mattToJSON);
		model.addAttribute("mattName",name);
		model.addAttribute("nDays",nDaysStr);
		model.addAttribute("startDate",nDaysStr);
		model.addAttribute("endDate",dateEnd);
		model.addAttribute("startHour",startHourStr);
		model.addAttribute("endHour",endHourStr);
		model.addAttribute("timeSlot",timeSlotStr);
	}*/
//--------------------------------------------SZE

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
		model.addAttribute("name",m_name);
		model.addAttribute("userName",userName);
		model.addAttribute("email",userEmail);
		model.addAttribute("matt",ifesbes1.getMattNames(userName));
		model.addAttribute("google",getMatt());
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
		m_name=pers.getName();
		model.addAttribute("name",name);
		model.addAttribute("userName",userName);
		model.addAttribute("email",userEmail);
		model.addAttribute("matt",ifesbes1.getMattNames(userName));
		model.addAttribute("google",getMatt());
		return "home";
	}
	
	private String getMatt() {
	//	String[] mas=ifesbes1.getMattNames(userName);
		String[] mas=connector.getAuthorizedSocialNames(userName);
		ArrayList<String> list = new ArrayList<String>();
		for (int i=0;i<mas.length;i++)
			list.add(mas[i]);
		
		return "false";
	}
	@RequestMapping({"/registry"})
	public String registry(){
		return "registry";
	}
	@RequestMapping({"/activate"})
	 public String activate(HttpServletRequest request){
		String user=request.getParameter("user");
		String hash=request.getParameter("hash");
		  ifesbes1.setActive(user,hash);
	   return "login";
	 }
	@RequestMapping({"/mail"})
	public String mail(Model model){
		String [] buf=connector.getContacts(userName, ifesbes1.getProfile(userName).getSnNames());
		for (int i=0;i<buf.length;i++)
		System.out.println(buf[i]);
		model.addAttribute("getmail",buf);
		return "mailContacts";
	}
}
