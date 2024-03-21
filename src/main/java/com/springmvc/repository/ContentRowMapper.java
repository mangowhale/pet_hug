package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Content;

public class ContentRowMapper implements RowMapper<Content>{

	@Override
	public Content mapRow(ResultSet rs, int rowNum) throws SQLException {
		Content content = new Content();
		
		content.setContentSeq(rs.getString(1));
		content.setAreaName(rs.getString(2));
		content.setPartName(rs.getString(3));
		content.setTitle(rs.getString(4));
		content.setKeyword(rs.getString(5));
		content.setAddress(rs.getString(6));
		content.setLatitude(rs.getString(7));
		content.setLongitude(rs.getString(8));
		content.setTel(rs.getString(9));
		content.setUsedTime(rs.getString(10));
		content.setHomePage(rs.getString(11));
		content.setContent(rs.getString(12));
		content.setProvisionSupply(rs.getString(13));
		content.setPetFacility(rs.getString(14));
		content.setRestaurant(rs.getString(15));
		content.setParkingLog(rs.getString(16));
		content.setMainFacility(rs.getString(17));
		content.setUsedCost(rs.getString(18));
		content.setPolicyCautions(rs.getString(19));
		content.setEmergencyResponse(rs.getString(20));
		content.setMemo(rs.getString(21));
		content.setBathFlag(rs.getString(22));
		content.setProvisionFlag(rs.getString(23));
		content.setPetFlag(rs.getString(24));
		content.setPetWeight(rs.getString(25));
		content.setDogBreed(rs.getString(26));
		content.setEmergencyFlag(rs.getString(27));
		content.setEntranceFlag(rs.getString(28));
		content.setParkingFlag(rs.getString(29));
		content.setInOutFlag(rs.getString(30));
		content.setP1(rs.getString(31));
		content.setP2(rs.getString(32));
		content.setP3(rs.getString(33));
		content.setP4(rs.getString(34));
		content.setP5(rs.getString(35));
		content.setP6(rs.getString(36));
		content.setP7(rs.getString(37));
		content.setP8(rs.getString(38));
		content.setP9(rs.getString(39));
		content.setP10(rs.getString(40));
		content.setReview_num(rs.getInt(41));
		content.setStar_avg(rs.getInt(42));
		
		return content;
	}

}
