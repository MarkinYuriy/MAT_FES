package controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mat.IFesBes1;
import mat.IFrontConnector;
import mat.Matt;
import mat.MattData;
import mat.Person;
import mat.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("session")
@RequestMapping({"/"})
public class MatAppl {
	String m_name;
	String userName;
	String userEmail;
	
//--------------------------------------------SZB
	//mat.MattData data;// should be or not?
	String mattName=null;
	String newTablJSON=null;
	Matt oldMatt=null;
	Matt newMatt=null;
	ArrayList<Boolean> newTabList;	
//--------------------------------------------SZE
	
	private Person user;
	
	@Autowired
	IFesBes1 ifesbes1;
	@Autowired
	IFrontConnector connector;
	
	@RequestMapping({"/"})
	public String login() {
		return "login";
	}
	@RequestMapping({"/buf"})
	public String buf(@RequestParam ("tablename") String firstName,Model model) {
		  model.addAttribute("buf", firstName);
		return "buf";
	}
//-----------------Account settings
	@RequestMapping({"/accountsettings"})
	public String accountSettings (Model model) {
		 String[] dataGoogle = new String[0];
		 String[] authorizedSN = null;
		 String[] choosedSN = null;
		 HashMap<String, Boolean> authSN = new HashMap<String, Boolean>();
	//Add Authorize attributes
	     try {
	    	 dataGoogle = connector.getApplicationData(IFrontConnector.GOOGLE);
	     } catch (Exception e) {
	    	 e.getMessage();
	     }
	     String clientIDGoogle = dataGoogle[IFrontConnector.INDEX_ID];
	     StringBuffer scopesGoogle = new StringBuffer();
	     for (int i = IFrontConnector.INDEX_SCOPES; i < dataGoogle.length; i++) {
	    	 scopesGoogle.append(dataGoogle[i]);
	    	 scopesGoogle.append(" ");
	     }
	     model.addAttribute("idGoogle", clientIDGoogle);
	     model.addAttribute("scopesGoogle", scopesGoogle);
	//Add Social Networks attributes
	     try {
	    	 authorizedSN = connector.getAuthorizedSocialNames(userName);
	    	 user = ifesbes1.getProfile(userName);
	     } catch (Exception e) {
	    	 e.getMessage();
	     }
	     choosedSN = user.getSnNames();
    	 model.addAttribute("GoogleAuth", "disabled");
    	 model.addAttribute("FacebookAuth", "disabled");
    	 model.addAttribute("AppleAuth", "disabled");
    	 model.addAttribute("TwitterAuth", "disabled");
    	 model.addAttribute("WindowsAuth", "disabled");
	     for(int i=0; i<authorizedSN.length; i++){
	    	 model.addAttribute(authorizedSN[i]+"Auth", "");
	    	 authSN.put(authorizedSN[i], true);	    	 
	     }
	     for(int j=0; j<choosedSN.length; j++)
	    	 if(authSN.get(choosedSN[j])!=null && authSN.get(choosedSN[j]))
	    		 model.addAttribute(choosedSN[j]+"Ch", "checked");
	//Add Person attributes
	     model.addAttribute("username", userName);
	     model.addAttribute("name", m_name);
	     model.addAttribute("email", userEmail);
	     return "account_settings";
	}
	@RequestMapping({"/resauto"})
	 public String resultAuthorization(String code, String access_token, Model model) {
/*		System.out.println("A code: "+code);
		System.out.println("A access_token: "+access_token);*/
		if (code!=null) {
			try {
				connector.authorize(userName, IFrontConnector.GOOGLE, code);
			} catch (RuntimeException e) {
				model.addAttribute("error", e.getMessage());
				return "error_form";
			}
		}
		return accountSettings(model);
	}
	
	@RequestMapping({"/savesettings"})
	public String saveSettings(HttpServletRequest request, Model model) {
		int resultSave = -1;
/*		String name = request.getParameter("firstname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String password1 = request.getParameter("password1");
*/		String googleCheck = request.getParameter("google_check");
		String appleCheck = request.getParameter("apple_check");
		String windowsCheck = request.getParameter("windows_check");
		String facebookCheck = request.getParameter("facebook_check");
		String twitterCheck = request.getParameter("twitter_check");
		ArrayList<String> sN = new ArrayList<String>();
/*		if(name!=null && !name.equals("")) user.setName(name);
		if(email!=null && email.contains("@")) user.setEmail(email);
		if(password!=null && !password.equals("*******") && password.equals(password1))
			user.setPassword(password);*/
		if(googleCheck!=null && googleCheck.equals("on")) sN.add(connector.GOOGLE);
		if(appleCheck!=null && appleCheck.equals("on")) sN.add(connector.APPLE);
		if(windowsCheck!=null && windowsCheck.equals("on")) sN.add(connector.WINDOWS);
		if(facebookCheck!=null && facebookCheck.equals("on")) sN.add(connector.FACEBOOK);
		if(twitterCheck!=null && twitterCheck.equals("on")) sN.add(connector.TWITTER);
		user.setSnNames(sN.toArray(new String[sN.size()]));
		try {
			resultSave = ifesbes1.updateProfile(user);
		} catch (Exception e) {
			e.getMessage();
		}
		System.out.println(resultSave);
		return homereturn (model);
	}
//-------------------Create Matt
	@RequestMapping({"/dom"})
	public String dom (Model model) {
		model.addAttribute("userName",userName);
		model.addAttribute("name",m_name);
		return "createMatt";
	}
//--------------------------------------------SZS
	@RequestMapping({"/createMatt"})
	public String createMattData(HttpServletRequest request, Model model){
	//----for creating MATT from the very beginning----
		String mattToJSON=null;
		String name = request.getParameter("mattName");
		String nDaysStr=request.getParameter("nDays");
		int nDays = Integer.parseInt(nDaysStr);//number of days
		String dateStr = request.getParameter("startDate");
		Date startDate = null;
		try {
			startDate = new SimpleDateFormat("d.M.y").parse(dateStr);
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
System.out.println(name);
System.out.println(startDate);
System.out.println(dateEnd);
System.out.println(nDays);
System.out.println(startHour);
System.out.println(endHour);
System.out.println(timeSlot);
		String password = null;
		mat.MattData data = new MattData(name,nDays,startDate,startHour,endHour,timeSlot,password);
		mattName=name;//----???----for creating URL
		oldMatt=ifesbes1.createMatt(data, userName);
System.out.println(oldMatt.getSlots().toString());
		mattToJSON = oldMatt.matt2browser();  
System.out.println(mattToJSON);
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
	 
		//----for saving new MATT to DataBase after user's correction----
		newTabList=new ArrayList<Boolean>();
		newTablJSON=request.getParameter("mattToJSON");
System.out.println(newTablJSON);
		newTabList=Matt.fromBrowser2ArrayList(newTablJSON);
		newMatt = new Matt();
		newMatt.setData(oldMatt.getData());
		newMatt.setSlots(newTabList);
		ifesbes1.saveMatt(oldMatt,newMatt,userEmail);//!!!for now using userEmail,but in the specification userName!!!
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
		model.addAttribute("matJSON", mattToJson4URL);
		return "viewMatt";//name of JSP viewing file
	}
	 
	private void addingAtributes(Model model,String name,String nDaysStr, 
			String dateStr,String dateEnd,String startHourStr,String endHourStr,
			String timeSlotStr,String mattToJSON){
		model.addAttribute("name", m_name);
		model.addAttribute("userName", userName);
		model.addAttribute("matJSON", mattToJSON);
		model.addAttribute("mattName",name);
		model.addAttribute("nd"+nDaysStr, "selected");
		model.addAttribute("startDate",dateStr);
		model.addAttribute("endDate",dateEnd);
		model.addAttribute("sh"+startHourStr, "selected");
		model.addAttribute("eh"+endHourStr, "selected");
		model.addAttribute("ts"+timeSlotStr, "selected");
	}
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
		model.addAttribute("SNdisabl",getAuthorizedSocial());
		model.addAttribute("SNchek",getSocial());
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
	//	m_name=pers.getFirstName()+" "+pers.getLastName();
		user=ifesbes1.getProfile(name);
		userName=user.getEmail();
		userEmail=user.getEmail();
		m_name=user.getName();
		model.addAttribute("name",m_name);
		model.addAttribute("userName",userName);
		model.addAttribute("email",userEmail);
		model.addAttribute("matt",ifesbes1.getMattNames(userName));
		model.addAttribute("SNdisabl",getAuthorizedSocial());
		model.addAttribute("SNchek",getSocial());
		return "home";
	}
	
	private String getSocial() {
		String []mas=user.getSnNames();
//		String[] mas={"Apple","Facebook","Twitter","Windows"};
		StringBuffer txt = new StringBuffer();
		txt.append('[');
		for (int i = 0; i < mas.length; i++) {
			txt.append('"');
			txt.append(mas[i]);
			txt.append('"');
	        if (i!=mas.length-1) txt.append(',');
	    }
		txt.append(']');
			
		return txt.toString();
	}
	private String  getAuthorizedSocial() {
		String []mas=connector.getAuthorizedSocialNames(userName);
//		String[] mas={"Apple","Facebook","Twitter","Windows"};
		StringBuffer txt = new StringBuffer();
		txt.append('[');
		for (int i = 0; i < mas.length; i++) {
			txt.append('"');
			txt.append(mas[i]);
			txt.append('"');
	        if (i!=mas.length-1) txt.append(',');
	    }
		txt.append(']');
			
		return txt.toString();
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
	public String mail(@RequestParam ("table") String table,Model model){
		String [] buf = connector.getContacts(userName, user.getSnNames());
		model.addAttribute("getmail",buf);
		model.addAttribute("table",table);
		return "mailContacts";
	}
	
	@RequestMapping({"/send"})
	public String sendEmail(@RequestParam ("table") String table,@RequestParam ("hiddenemail") String hiddenemail,Model model){
	String[] sendEmails = hiddenemail.split(";");
//		for (int i=0;i<sendEmails.length;i++){
//			System.out.println(i);
//			System.out.println(sendEmails[i]);
//		}
	String send= "http://localhost:8080/myavailabletime/viewMatt?table="+table+"&username="+userName;
	connector.shareByMail(send, sendEmails, userName, connector.GOOGLE);
		
		return homereturn(model);
	}
	@RequestMapping(value = "socialseti", method = RequestMethod.GET)
	public @ResponseBody String processAJAXRequest(@RequestParam(value = "seti", required = false) String seti,@RequestParam(value = "value", required = false) String value){
		String [] buf=user.getSnNames();
		if (value.equals("true")){
			String [] buf1=new String [buf.length+1];
			for (int i=0;i<buf.length;i++){
				buf1[i]=buf[i];
			}
			buf1[buf.length]=seti;
			user.setSnNames(buf1);
		}
		if (value.equals("false")){
			String [] buf2=new String [buf.length-1];
			int l=0;
			for (int i=0;i<buf.length;i++){
				if (!buf[i].equals(seti)){
					buf2[l++]=buf[i];
				}
			}
			user.setSnNames(buf2);
		}
		ifesbes1.updateProfile(user);
//		System.out.println(seti);
//		System.out.println(value);
		String response=value;
		return response;
	}
			
}
