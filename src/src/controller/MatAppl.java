package controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import mat.IFesBes1;
import mat.IFrontConnector;
import mat.Matt;
import mat.MattData;
import mat.Notification;
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
	static private int GMT_TIME_ZONE=41;
	private double[] timeShifts = {-12,-11,-10,-9,-8,-8,-7,-7,-7,-6,-6,-6,-6,-5,-5,-5,-4,-4,-4,-4,-3.5,-3,-3,-3,-3,-2,-1,-1,0,0,1,1,1,1,1,2,2,2,2,2,2,2,2,2,3,3,3,3,3.5,4,4,4,4.5,5,5,5.5,5.5,5.75,6,6,6.5,7,7,8,8,8,8,8,9,9,9,9.5,9.5,10,10,10,10,10,11,12,12,13};
	
	@Autowired
	IFesBes1 ifesbes1;
	@Autowired
	IFrontConnector connector;
	
	@RequestMapping({"/"})
	public String login() {
		return "loginon";
	}

	@RequestMapping({"/buf"})
	public String buf(@RequestParam ("tablename") String firstName,Model model) {
		model.addAttribute("buf", firstName);
		return "buf";
	}

/*	@RequestMapping({"/invitationMatt"})
	public String invitationMatt(@RequestParam ("table") String mattId4Matt,Model model) {
		 // int tableId=Integer.parseInt(mattId4Matt);
		  int tableId=106;
		  oldMatt=ifesbes1.getMatt(tableId);
		  String mattToJson4URL = oldMatt.matt2browser();
		  int m_nwek=(oldMatt.getData().getnDays())/7-1;
		  String m_nameMatt=oldMatt.getData().getName();
		  int timeSlotStr=oldMatt.getData().getTimeSlot();
		  String dateStr = new SimpleDateFormat("d.M.y").format(oldMatt.getData().getStartDate());		  
		  String dateEnd = new SimpleDateFormat("d.M.y").format(getDateAfter(oldMatt.getData().getStartDate(), oldMatt.getData().getnDays()));
		  String nameSozd=null;
		  
		  model.addAttribute("matJSON", mattToJson4URL);
		  model.addAttribute("userName", userName);
		  model.addAttribute("nameSozd", nameSozd);
		  model.addAttribute("tableId", tableId);
		  model.addAttribute("name", m_nameMatt);
		  model.addAttribute("nWek", m_nwek);
		  model.addAttribute("ts"+timeSlotStr, "selected");
		  model.addAttribute("startDate",dateStr);
		  model.addAttribute("endDate",dateEnd);
		  model.addAttribute("download",connector.getAvailableCalendars(userName));
		return "invitationMatt";
	}*/
	
	@RequestMapping(value = "socialsetiinvitation", method = RequestMethod.POST)
	public @ResponseBody String socialSetiInvitation(@RequestParam(value = "seti", required = false) String seti,
								@RequestParam(value = "tableid", required = false) String tableId,
								@RequestParam(value = "values", required = false) String values){
		String mattToJSON;
		int tableIdInt=Integer.parseInt(tableId);
		if (!values.equals("")){HashMap<String, List<String>> hmOne=new HashMap<String, List<String>>();
	    	String[] sendseti = values.split(";");
	    	List<String>l1 = new ArrayList<String>();
	    	    for (String lang : sendseti) {
	    		    l1.add(lang);
	    	    }
	    	hmOne.put(seti, l1);
			oldMatt=ifesbes1.updateInvitationMatt(tableIdInt, userName, hmOne);
			mattToJSON = oldMatt.matt2browser();
	    }else {
	    	oldMatt=ifesbes1.getMatt(tableIdInt);
	    	mattToJSON=oldMatt.matt2browser();
	    }	    
		return mattToJSON;
	}
	
	@RequestMapping({"/invitations"})///notifications
	  public String showInvitations(Model model){
	   List<Notification> listNotifications=ifesbes1.getNotifications(userName);
	   List<String[]> listStrBuff=new ArrayList<String[]>();
	   String strMattId="";
	   String nameOfUser="";
	   String strMattName="";
	   Integer mattId;
	   for(Notification notifInfo:listNotifications){
	    String[] strBuf=new String[3];
	    
	    mattId=notifInfo.mattId;
	    if(mattId!=null){
	     strMattId=mattId.toString();
	    }
	    strBuf[0]=strMattId;
	    
	    nameOfUser=notifInfo.nameOfUser;
	    if(nameOfUser!=null){
	     strBuf[1]=nameOfUser;
	    } else{strBuf[1]="";}
	    
	    strMattName=notifInfo.mattName;
	    if(strMattName!=null){
	     strBuf[2]=strMattName;
	    } else{strBuf[2]="";}
	    
	    listStrBuff.add(strBuf);   
	   }
	   model.addAttribute("listNotifications", listStrBuff);
	   model.addAttribute("name",m_name);
	   model.addAttribute("userName",userName);
	   model.addAttribute("email",userEmail);
	   return "invitations";
	  }
//-----------------Account settings
	@RequestMapping({"/accountsettings"})
	public String accountSettings (Model model) {
		 String[] dataGoogle = new String[0];
		 String[] authorizedSN = null;
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
    	 model.addAttribute("GoogleAuth", "disabled");
    	 model.addAttribute("FacebookAuth", "disabled");
    	 model.addAttribute("AppleAuth", "disabled");
    	 model.addAttribute("TwitterAuth", "disabled");
    	 model.addAttribute("WindowsAuth", "disabled");
	     for(int i=0; i<authorizedSN.length; i++){
//	    	 model.addAttribute(authorizedSN[i]+"Auth", "");
	    	 model.addAttribute(authorizedSN[i]+"Ch", "checked");
	    	 authSN.put(authorizedSN[i], true);	    	 
	     }
	//Add Person attributes
	     model.addAttribute("username", userName);
	     model.addAttribute("name", m_name);
	     model.addAttribute("email", userEmail);
	     model.addAttribute("tz"+user.getTimeZone(), "selected");
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
		String name = request.getParameter("firstname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String password1 = request.getParameter("password1");
		String timeZoneStr = request.getParameter("timeZone");
		if(timeZoneStr!=null) {
			int timeZone = Integer.parseInt(timeZoneStr);
			user.setTimeZone(timeZone);
		}
		if(name!=null && !name.equals("")) user.setName(name);
		if(email!=null && email.contains("@")) user.setEmail(email);
		if(password!=null && !password.equals("") && password.equals(password1))
			user.setPassword(password);
		try {
			resultSave = ifesbes1.updateProfile(user);
		} catch (Exception e) {
			model.addAttribute("exception", "don't update profile");
		}
//		System.out.println(resultSave);
		return homereturn (model);
	}
//-------------------Create Matt
	@RequestMapping({"/dom"})
	public String dom (Model model) {
		model.addAttribute("userName",userName);
		model.addAttribute("name",m_name);
	return createMatt2(model);
	}
	
	@RequestMapping({"/createMatt2"})
	public String createMatt2(Model model){
	//----for creating MATT from the very beginning----
		String mattToJSON=null;
		String name = " ";
		Date startDate = startDate(null);
		String dateStr =new SimpleDateFormat("d.M.y").format(startDate);
		String dateEnd = new SimpleDateFormat("d.M.y").format(endDate(null));
		int startHour = 0;
		int endHour = 24;
		int timeSlot =60;
		String password = null;
		mat.MattData data = new MattData(name,7,startDate,startHour,endHour,timeSlot,password);
		mattName=name;//----???----for creating URL
		  ArrayList<Boolean> newTabList=new ArrayList<Boolean>();
		  int slotsNumber=(60/timeSlot)*(endHour-startHour)*7;
		  for(int i=0;i<slotsNumber;i++){
		   newTabList.add(true);
		  }
		  oldMatt=new Matt();
		  oldMatt.setData(data);
		  oldMatt.setSlots(newTabList);
		  mattToJSON = oldMatt.matt2browser();
	/*	mattName=name;//----???----for creating URL
		oldMatt=ifesbes1.createMatt(data, userName);
		mattToJSON = oldMatt.matt2browser();  */
		addingAtributes(model,name,null,dateStr,dateEnd,Integer.toString(startHour),Integer.toString(endHour),Integer.toString(timeSlot),mattToJSON);
		model.addAttribute("download",connector.getAvailableCalendars(userName));
		return "createMatt2";
	}
	private HashMap<String, List<String>> getAvailableCalendars(String userName2) {
	    HashMap<String, List<String>> hmOne = new HashMap<String, List<String>>();
	    List<String>l1 = new ArrayList<String>();
	    l1.add("one");
	    l1.add("two");
	    l1.add("three");
	    l1.add("four");
	    l1.add("five");
	    hmOne.put("Google", l1);
	    l1 = new ArrayList<String>();
	    l1.add("home");
	    l1.add("work");
	    hmOne.put("Apple", l1);
	    l1 = new ArrayList<String>();
	    l1.add("home1");
	    l1.add("work1");
	    l1.add("work2");
	    hmOne.put("Facebook", l1);    
		return hmOne;
	}
	private static Calendar getFirstWeekDayTime(Calendar calendar){
		int weekDay = calendar.get(Calendar.DAY_OF_WEEK);
	    switch(weekDay) {
	    case 1:
	        weekDay = -6;
	        break;
	    case 2:
	        weekDay = 0;
	        break;
	    case 3:
	        weekDay = -1;
	        break;
	    case 4:
	        weekDay = -2;
	        break;
	    case 5:
	        weekDay = -3;
	        break;
	    case 6:
	        weekDay = -4;
	        break;
	    case 7:
	        weekDay = -5;
	        break;
	    }
	    calendar.add(Calendar.DAY_OF_MONTH, weekDay);
		return calendar;	
	}
private Date startDate(Date date) {
	if (date==null) date = new Date();
	Calendar calendar= new GregorianCalendar();
	calendar.setTime(date);	
	return getFirstWeekDayTime(calendar).getTime();
	}
private Date endDate(Date date) {
	if (date==null)date= new Date();
	Calendar calendar= new GregorianCalendar();
	calendar.setTime(date);	
	calendar = getFirstWeekDayTime(calendar);
    calendar.add(Calendar.DAY_OF_MONTH, 6);
	return calendar.getTime();
	}
@RequestMapping(value = "ajaxjson", method = RequestMethod.POST)
public @ResponseBody  void ajaxjson(@RequestParam(value = "mattjson", required = false) String mattjson){
		newTablJSON=mattjson;
}
@RequestMapping(value = "nWek", method = RequestMethod.GET)
public @ResponseBody  String nWek(@RequestParam(value = "dateStr", required = false) String dateStr,
		@RequestParam(value = "dateEnd", required = false) String dateEnd){
		int nWek = 0;
		Date start = null;
		Date end = null;
		try {
			start = new SimpleDateFormat("d.M.y").parse(dateStr);
			end = new SimpleDateFormat("d.M.y").parse(dateEnd);
		} catch (ParseException e) {
			e.printStackTrace();
		}
			long d1=endDate(end).getTime();
			long d2=startDate(start).getTime();
			nWek=(int) ((d1-d2)/((1000*60*60*24)+1)/7);
		String buf=Integer.toString(nWek);
		return buf;
}
@RequestMapping(value = "newJson", method = RequestMethod.GET)
public @ResponseBody String newJson(@RequestParam(value = "dateStr", required = false) String dateStr,
		@RequestParam(value = "dateEnd", required = false) String dateEnd,
		@RequestParam(value = "timeSlotStr", required = false) String timeSlotStr,
		@RequestParam(value = "mattName", required = false) String mattname){
		String mattToJSON=null;
		Date start = null;
		Date end = null;
		Date dateStr1 = null;
		int nDays=7;
		try {
			start = new SimpleDateFormat("d.M.y").parse(dateStr);
			end = new SimpleDateFormat("d.M.y").parse(dateEnd);
			dateStr1=startDate(start);
		} catch (ParseException e) {
			e.printStackTrace();
		}
			long d1=endDate(end).getTime();
			long d2=startDate(start).getTime();
			nDays=(int) ((d1-d2)/(1000*60*60*24)+1);
		int startHour = 0;
		int endHour = 24;
		int timeSlot =Integer.parseInt(timeSlotStr);
		String password = null;
		mat.MattData data = new MattData(mattname,nDays,dateStr1,startHour,endHour,timeSlot,password);
		mattName=mattname;//----???----for creating URL
		  ArrayList<Boolean> newTabList=new ArrayList<Boolean>();
		  int slotsNumber=(60/timeSlot)*(endHour-startHour)*nDays;
		  for(int i=0;i<slotsNumber;i++){
		   newTabList.add(true);
		  }
		  oldMatt=new Matt();
		  oldMatt.setData(data);
		  oldMatt.setSlots(newTabList);
		  mattToJSON = oldMatt.matt2browser();  
	//	oldMatt=ifesbes1.createMatt(data, userName);
	//	mattToJSON = oldMatt.matt2browser();
	return mattToJSON;
}
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
/*System.out.println(name);
System.out.println(startDate);
System.out.println(dateEnd);
System.out.println(nDays);
System.out.println(startHour);
System.out.println(endHour);
System.out.println(timeSlot);*/
		String password = null;
		mat.MattData data = new MattData(name,nDays,startDate,startHour,endHour,timeSlot,password);
		mattName=name;//----???----for creating URL
	//	oldMatt=ifesbes1.createMatt(data, userName);
//System.out.println(oldMatt.getSlots().toString());
		mattToJSON = oldMatt.matt2browser();  
//System.out.println(mattToJSON);
		addingAtributes(model,name,nDaysStr,dateStr,dateEnd,startHourStr,endHourStr,timeSlotStr,mattToJSON);
		return "saveMatt";
	}
@RequestMapping({"/download"})
public String download(HttpServletRequest request,@RequestParam ("table") String m_mattname, Model model){
	HashMap<String, List<String>> hmOne=connector.getAvailableCalendars(userName);
	Iterator<String>  it=hmOne.keySet().iterator();
	while(it.hasNext()){
		String element = it.next();
		String languages[] = request.getParameterValues(element);
	if (languages != null) {
	    List<String>l1 = new ArrayList<String>();
	    for (String lang : languages) {
		    l1.add(lang);
	    }
		oldMatt.getData().setDownloadCalendars(element, l1);
	}
	}
	newTabList=new ArrayList<Boolean>();
	newTabList=Matt.fromBrowser2ArrayList(newTablJSON);
	newMatt = new Matt();
	oldMatt.getData().setName(m_mattname);
	mattName=m_mattname;
	newMatt.setData(oldMatt.getData());
	newMatt.setSlots(newTabList);
	int id=ifesbes1.saveMatt(newMatt,userEmail);
	ifesbes1.saveMatt(newMatt,userEmail);
	String buf=Integer.toString(id);	
	return  action_edit(buf,model);
}

	@RequestMapping({"/saveMatt"})
	public String saveMattData(@RequestParam ("table") String m_mattname, Model model){
		newTabList=new ArrayList<Boolean>();
		newTabList=Matt.fromBrowser2ArrayList(newTablJSON);
		newMatt = new Matt();
		oldMatt.getData().setName(m_mattname);
		mattName=m_mattname;
		newMatt.setData(oldMatt.getData());
		newMatt.setSlots(newTabList);
		ifesbes1.saveMatt(newMatt,userEmail);
		return  homereturn (model);
    }
	   
	@RequestMapping({"/viewMatt"})
	 public String viewMatt(@RequestParam ("table") String mattId4Matt,Model model){
	  int tableId=Integer.parseInt(mattId4Matt);
	  Matt matt4Sharing=ifesbes1.getMatt(tableId);
	  String mattToJson4URL = matt4Sharing.matt2browser();
	  int m_nwek=(matt4Sharing.getData().getnDays())/7-1;
	  String m_nameMatt=matt4Sharing.getData().getName();
	  model.addAttribute("matJSON", mattToJson4URL);
	  model.addAttribute("userName", userName);
	  model.addAttribute("name", m_nameMatt);
	  model.addAttribute("nWek", m_nwek);
	  return "viewMatt2";
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
	public String person(@RequestParam ("username_2") String firstName,/*@RequestParam ("lastName") String lastName,*/
			@RequestParam ("email_2") String email,@RequestParam ("create_a_password_2") String password,Model model) {
		Person pers = new Person(firstName, email, password, GMT_TIME_ZONE);
		
		if (ifesbes1.setProfile(pers)==Response.IN_ACTIVE) {
			model.addAttribute("email","EMAIL incorrect!");
			return "registry";}
		return "loginon";
	}
	@RequestMapping({"/homereturn"})
	public String homereturn (Model model){
		model.addAttribute("name",m_name);
		model.addAttribute("userName",userName);
		model.addAttribute("email",userEmail);
		model.addAttribute("matt",ifesbes1.getMattNames(userName));
//		model.addAttribute("SNdisabl",getAuthorizedSocial());
//		model.addAttribute("SNchek",getSocial());
		return "home";	
	}
	@RequestMapping({"/home"})
	public String home(@RequestParam ("name") String name,@RequestParam ("password") String password,Model model) {
		if (ifesbes1.matLogin(name,password)==Response.NO_PASSWORD_MATCHING || ifesbes1.matLogin(name,password)==Response.NO_REGISTRATION || ifesbes1.matLogin(name,password)==Response.IN_ACTIVE){
			return "loginon";}
	//	m_name=pers.getFirstName()+" "+pers.getLastName();
		user=ifesbes1.getProfile(name);
		userName=user.getEmail();
		userEmail=user.getEmail();
		m_name=user.getName();
		model.addAttribute("name",m_name);
		model.addAttribute("userName",userName);
		model.addAttribute("email",userEmail);
		model.addAttribute("matt",ifesbes1.getMattNames(userName));
		return "home";
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
	   return "loginon";
	 }
	

	@RequestMapping({"/mail"})
	public String mail(@RequestParam ("table") String table,Model model){
		String [] buf = connector.getContacts(userName, connector.getAuthorizedSocialNames(userName));
		model.addAttribute("getmail",buf);
		model.addAttribute("table",table);
		return "mailContacts";
	}
	
	@RequestMapping({"/send"})
	public String sendEmail(@RequestParam ("table") String table,@RequestParam ("hiddenemail") String hiddenemail,Model model){
	    String[] sendEmails = hiddenemail.split(";");
	    String send= "http://localhost:8080/myavailabletime/viewMatt?table="+table+"&username="+userName;
	    connector.shareByMail(send.replaceAll(" ", "%20"), sendEmails, userName, IFrontConnector.GOOGLE);	
		return homereturn(model);
	}

	@RequestMapping({"/invitation"})
	public String invitation(@RequestParam ("table") String table,Model model){
		String [] buf = connector.getContacts(userName, connector.getAuthorizedSocialNames(userName));
		model.addAttribute("getmail",buf);
		model.addAttribute("table",table);
		return "mailContactsInvitation";
	}
	
	@RequestMapping({"/sendInvitation"})
	public String sendInvitation(HttpServletRequest request, @RequestParam ("table") String table,@RequestParam ("hiddenemail") String hiddenemail,Model model){
		String mattIdStr=request.getParameter("table");
		int mattId=Integer.parseInt(mattIdStr);
	    String[] sendEmails = hiddenemail.split(";");
	    ifesbes1.setGuests(mattId, sendEmails);	
		return homereturn(model);
	}
//Created by Konstantin Dvoyashov. Calling form Set Appointment
	@RequestMapping({"/setAppointment"})
	public String set_appointment (@RequestParam ("table") String mattId4Matt,Model model) {
		  int tableId=Integer.parseInt(mattId4Matt);
System.out.println(tableId);
		  oldMatt=ifesbes1.getMatt(tableId);
System.out.println(oldMatt.toString());
System.out.println("old ID: "+oldMatt.getData().getMattId());
		  String mattToJson4URL = oldMatt.matt2browser();
System.out.println(mattToJson4URL);		  
		  int m_nwek=(oldMatt.getData().getnDays())/7-1;
		  String m_nameMatt=oldMatt.getData().getName();
		  int timeSlotStr=oldMatt.getData().getTimeSlot();
		  String dateStr =new SimpleDateFormat("d.M.y").format(oldMatt.getData().getStartDate());		  
		  String dateEnd = new SimpleDateFormat("d.M.y").format(getDateAfter(oldMatt.getData().getStartDate(), oldMatt.getData().getnDays()));
		  model.addAttribute("matJSON", mattToJson4URL);
		  model.addAttribute("userName", userName);
		  model.addAttribute("name", m_nameMatt);
		  model.addAttribute("nWek", m_nwek);
		  model.addAttribute("ts"+timeSlotStr, "selected");
		  model.addAttribute("startDate",dateStr);
		  model.addAttribute("endDate",dateEnd);
		  return "setAppointment";
	}
//Created by Konstantin Dvoyashov. This function calls onClick Set Appointment button Set Appointment form
	@RequestMapping({"/setAppoSave"})
	public String saveAppointmentData(HttpServletRequest request, @RequestParam ("table") String m_mattname, Model model){
		newTabList=new ArrayList<Boolean>();
		newTabList=Matt.fromBrowser2ArrayList(newTablJSON);
		newMatt = new Matt();
		//oldMatt.getData().setName(m_mattname);
		mattName=m_mattname;
		newMatt.setData(oldMatt.getData());
		newMatt.setSlots(newTabList);
		ifesbes1.saveMatt(newMatt,userEmail);
		
//		String mattIdStr=request.getParameter("table");
System.out.println("idnew: "+newMatt.getData().getMattId());
System.out.println("idold: "+oldMatt.getData().getMattId());
//		int mattId=Integer.parseInt(mattIdStr);
		String[] guests = ifesbes1.getGuests(newMatt.getData().getMattId());
System.out.println(guests.toString());
System.out.println(userName);
System.out.println(newMatt.getSlots().toString());
		connector.setEvent(guests, userName, newMatt);
		
		
		return  homereturn (model);
    }
	/////////////////////////////////////////////////////////////
		
	@RequestMapping(value = "setsocialseti", method = RequestMethod.GET)
	public @ResponseBody void setMattCalendarSocialseti(@RequestParam(value = "seti", required = false) String seti){
			ifesbes1.updateMatCalendarInSN(userName, seti);
	}
	@RequestMapping(value = "email", method = RequestMethod.GET)
	public @ResponseBody String setEmail(@RequestParam(value = "email", required = false) String email){
		StringBuffer buf= new StringBuffer();
		buf.append(ifesbes1.ifEmailExistsInDB(email));
		return buf.toString();	
	}
	@RequestMapping({"/removematt"})
	public String removeMATT(HttpServletRequest request,Model model){
		String mattIdStr=request.getParameter("table");
		int mattId=Integer.parseInt(mattIdStr);
		ifesbes1.removeMatt(mattId);
		return homereturn(model);
	}
	@RequestMapping({"/action_edit"})
	public String action_edit (@RequestParam ("table") String mattId4Matt,Model model) {
		  int tableId=Integer.parseInt(mattId4Matt);
		  oldMatt=ifesbes1.getMatt(tableId);
		  String mattToJson4URL = oldMatt.matt2browser();
		  int m_nwek=(oldMatt.getData().getnDays())/7-1;
		  String m_nameMatt=oldMatt.getData().getName();
		  int timeSlotStr=oldMatt.getData().getTimeSlot();
		  String dateStr =new SimpleDateFormat("d.M.y").format(oldMatt.getData().getStartDate());		  
		  String dateEnd = new SimpleDateFormat("d.M.y").format(getDateAfter(oldMatt.getData().getStartDate(), oldMatt.getData().getnDays()));
		  model.addAttribute("matJSON", mattToJson4URL);
		  model.addAttribute("userName", userName);
		  model.addAttribute("name", m_nameMatt);
		  model.addAttribute("nWek", m_nwek);
		  model.addAttribute("ts"+timeSlotStr, "selected");
		  model.addAttribute("startDate",dateStr);
		  model.addAttribute("endDate",dateEnd);
		return "editMatt2";
	}
	private static Date getDateAfter(Date date, int days) {
		Calendar calendar= new GregorianCalendar();
		calendar.setTime(date);
		calendar.add(GregorianCalendar.DAY_OF_YEAR, days-1);
		return calendar.getTime();
	}
	@RequestMapping({"/upload_matt"})
	public String upload_matt(HttpServletRequest request,Model model){
		String mattIdStr=request.getParameter("table");
		int mattId=Integer.parseInt(mattIdStr);
System.out.println("mattId "+mattId);
		Matt curentMatt = ifesbes1.getMatt(mattId);
		List<String> uploadSN = new ArrayList<String>();
		uploadSN.add(userName);
		curentMatt.getData().setUploadCalendars(IFrontConnector.GOOGLE, uploadSN);
System.out.println("uploadCalendars "+curentMatt.getData().getUploadCalendars(IFrontConnector.GOOGLE));
		connector.uploadMatt(userName, curentMatt);
		return homereturn(model);
	}
	@RequestMapping({"/getMatt4EditNotif"})
	  public String getMatt4EditNotif(HttpServletRequest request, Model model){   
	   String strMattId=request.getParameter("table");
	   Integer mattId=Integer.parseInt(strMattId);
	   Matt matt4EditNotif=ifesbes1.getMatt(mattId);
	   int nWeeks=(matt4EditNotif.getData().getnDays())/7-1;
	   int timeSlot=matt4EditNotif.getData().getTimeSlot();
	   String dateStr =new SimpleDateFormat("d.M.y").format(matt4EditNotif.getData().getStartDate());
	   String dateEnd = new SimpleDateFormat("d.M.y").format(getDateAfter(matt4EditNotif.getData().getStartDate(), matt4EditNotif.getData().getnDays()));
	   Notification notif=null;
	   String nameSozd=null;
	   model.addAttribute("matJSON", matt4EditNotif.matt2browser());
	   model.addAttribute("tableId", mattId);
	   model.addAttribute("userName", userName);
	   model.addAttribute("nameSozd", nameSozd);
	   model.addAttribute("name", matt4EditNotif.getData().getName());
	   model.addAttribute("nWek", nWeeks);
	   model.addAttribute("ts"+timeSlot, "selected");
	   model.addAttribute("startDate",dateStr);
	   model.addAttribute("endDate",dateEnd);
	   model.addAttribute("download",connector.getAvailableCalendars(userName));
	   return "invitationMatt";
	   
	  }		

}
