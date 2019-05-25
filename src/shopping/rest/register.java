package shopping.rest;

import java.sql.SQLException;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import org.json.simple.*;
import org.json.simple.parser.*;

import shopping.model.*;
import shopping.service.*;

@Path("/user")
public class register {
	
	@POST
	@Path("/register")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	
	public String myMethod(String re) throws ClassNotFoundException,SQLException,ParseException {
		
		JSONParser jp = new JSONParser();
		JSONObject jobj = (JSONObject) jp.parse(re);
		
		// create object user
		User user =  new User();

		user.setFname(jobj.get("fname").toString());
		user.setLname(jobj.get("lname").toString());
		user.setEmail(jobj.get("email").toString());
		user.setPhone(jobj.get("phone").toString());
		user.setPassword(jobj.get("pass1").toString());
		
		registerService register = new registerService();
		register.register(user);
		
		JSONObject json = new JSONObject();
		json.put("success", Integer.toString(register.getSuccess()));
		
		return json.toString();
		
	}
	
	@POST
	@Path("/login")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	
	public String login(String re) throws ClassNotFoundException,SQLException,ParseException {
		
		JSONParser jp = new JSONParser();
		JSONObject jobj = (JSONObject) jp.parse(re);
		
		// create object user
		User user =  new User();
		
		//insert post value 
		user.setEmail(jobj.get("email").toString());
		user.setPassword(jobj.get("password").toString());
		
		registerService register = new registerService();
		register.login(user);
		
		JSONObject json = new JSONObject();
		json.put("success", Integer.toString(register.getSuccess()));
		
		return json.toString();
		
	}

}
