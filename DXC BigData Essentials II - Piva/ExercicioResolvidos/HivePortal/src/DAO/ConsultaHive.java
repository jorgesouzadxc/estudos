package DAO;

import java.sql.*;

public class ConsultaHive {		
	public String getConsultaHive(){
		
		StringBuilder sb = new StringBuilder();
		String driverName = "org.apache.hive.jdbc.HiveDriver";
		try {
			Class.forName(driverName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try{
			Connection con = DriverManager.getConnection("jdbc:hive2://127.0.0.1:10000/aeroporto","cloudera", "cloudera");
			Statement stmt = con.createStatement();
			String sql;

			sql = "select * from AEROPORTO.FLIGHT_DELAYS limit 200";
			ResultSet res = stmt.executeQuery(sql);
			sb.append("<table border=1><tr>");
			sb.append("<th>YEAR</th>");
			sb.append("<th>MONTH</th>");
			sb.append("<th>DAYOFMONTH</th>");
			sb.append("<th>FLIGHTNUM</th>");
			sb.append("<th>AIRTIME</th>");
			sb.append("<th>ARRDELAY</th>");
			sb.append("<th>DEPDELAY</th>");
			sb.append("<th>ORIGIN</th>");
			sb.append("<th>DEST</th>");
				
			sb.append("</tr>");
			while (res.next()) {
				sb.append("<tr>");
				sb.append("<td>" + String.valueOf(res.getString(1)) + "</td>");
				sb.append("<td>" + String.valueOf(res.getString(2)) + "</td>");
				sb.append("<td>" + String.valueOf(res.getString(3)) + "</td>");
				sb.append("<td>" + String.valueOf(res.getString(4)) + "</td>");
				sb.append("<td>" + String.valueOf(res.getString(5)) + "</td>");
				sb.append("<td>" + String.valueOf(res.getString(6)) + "</td>");
				sb.append("<td>" + String.valueOf(res.getString(7)) + "</td>");
				sb.append("<td>" + String.valueOf(res.getString(8)) + "</td>");
				sb.append("<td>" + String.valueOf(res.getString(9)) + "</td>");
				sb.append("</tr>");
			}
			sb.append("</table>");
		} catch(Exception e){
			sb.append("Erro:"+e.getMessage());
		}
		return sb.toString();
	}
}
