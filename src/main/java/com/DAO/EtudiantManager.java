package com.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Etudiant;

public class EtudiantManager {

	public int addEtudiant(String nom, String prenom, String email,String pass) {
        
		DBinteraction.connect();
		String sql = "insert into etudiant(nom,prenom,email,password) values ( '"+nom+"' , '"+prenom+"' , '"+email+"','"+pass+"' )";
		int nb = DBinteraction.Maj(sql);
		DBinteraction.disconnect();
		return nb;
	}
	public Etudiant authentification(String email , String Pass) {
		
		Etudiant et = null; 
		DBinteraction.connect();
		ResultSet r = DBinteraction.select("select * from etudiant where email = '"+email+"' and password = '"+Pass+"'");
		try {
			if(r.next()) {
				et = new Etudiant();
				et.setId(r.getInt(1));
				et.setNom(r.getNString(2));
				et.setPrenom(r.getNString(3));
				et.setEmail(r.getNString(4));
				et.setPassword(r.getNString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBinteraction.disconnect();
		return et;
	}
}
