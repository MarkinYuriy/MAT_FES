package model;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import mat.IFesBes1;
import mat.IBackConnector;
import mat.Matt;
import mat.MattData;
import mat.Person;
import mat.Response;

public class test implements IFesBes1, IBackConnector {
	@Autowired

	Response resp;

	@Override
	public int setProfile(Person person) {
		// TODO Auto-generated method stub
		return resp.OK;
	}

	@Override
	public int updateProfile(Person person) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int matLogin(String username, String password) {
		// TODO Auto-generated method stub
		return resp.OK;
	}

	@Override
	public String[] getMattNames(String username) {
		// TODO Auto-generated method stub
		String[]buf={"Table 1","Table 2","Table 3","Table 4 "};
		return buf;
	}

	@Override
	public Matt createMatt(MattData data, String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Matt getMatt(String mattName, String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean saveMatt(Matt mattOld, Matt mattNew, String username) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeMatt(String mattName, String username) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Person getProfile(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setActive(String username, String hashcode) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Boolean> getSlots(String username, String[] snNames,
			MattData interval) throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setMatCalendar(String username, String[] snNames,
			List<Matt> matts) {
		// TODO Auto-generated method stub
		
	}

}
