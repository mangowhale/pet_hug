package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.LatLng;

public class LatLngRowMapper implements RowMapper<LatLng>{

	@Override
	public LatLng mapRow(ResultSet rs, int rowNum) throws SQLException {
		LatLng latLng = new LatLng();
		latLng.setLat(rs.getString(1));
		latLng.setLng(rs.getString(2));
		latLng.setTitle(rs.getString(3));
		latLng.setContentSeq(rs.getString(4));
		latLng.setP1(rs.getString(5));
		latLng.setPartName(rs.getString(6));
		return latLng;
	}

}
