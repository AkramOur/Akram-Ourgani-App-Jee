package com.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Categorie;
import com.model.Livre;


public class LivreManager {
	
	public int addCategorie(String catName) {
        
		DBinteraction.connect();
		String sql = "insert into categorie(catName) values ( '"+catName+"')";
		int nb = DBinteraction.Maj(sql);
		DBinteraction.disconnect();
		return nb;
	}
	public int addLivre(String titre, String auteur, Categorie cat) {
        
		DBinteraction.connect();
		String sql = "insert into livre(titre,auteur,idCat) values ( '"+titre+"' , '"+auteur+"' , '"+cat.getId()+"')";
		int nb = DBinteraction.Maj(sql);
		DBinteraction.disconnect();
		return nb;
	}
	
	public Categorie findcategorieById(int id) {
		
		Categorie c = null;
		DBinteraction.connect();
		ResultSet rs = DBinteraction.select("select * from categorie where id = "+id);
		try {
			if(rs.next()) {
				c = new Categorie();
				c.setId(rs.getInt(1));
				c.setCatName(rs.getNString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBinteraction.disconnect();
		return c;
	}

	public Categorie findcategorieByName(String catName) {
		
		Categorie c = null;
		DBinteraction.connect();
		ResultSet rs = DBinteraction.select("select * from categorie where catName = '"+catName+"'");
		try {
			if(rs.next()) {
				c = new Categorie();
				c.setId(rs.getInt(1));
				c.setCatName(rs.getNString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBinteraction.disconnect();
		return c;
	}
	

	
	public List<Categorie> AllCategories() {
		java.util.List<Categorie> cat = new ArrayList<Categorie>();
		DBinteraction.connect();
		ResultSet rs = DBinteraction.select("select * from categorie ");
		try {
			while(rs.next()) {
				Categorie c = new Categorie();
				c.setId(rs.getInt(1));
				c.setCatName(rs.getNString(2));
				cat.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBinteraction.disconnect();
		return cat;
	}
	
	public List<Livre> livreParCat(int id) {
		java.util.List<Livre> lv = new ArrayList<Livre>();
		DBinteraction.connect();
		ResultSet rs = DBinteraction.select("select * from livre where idCat = "+id);
		try {
			while(rs.next()) {
				Livre l = new Livre();
				l.setId(rs.getInt(1));
				l.setTitre(rs.getNString(2));
				l.setAuteur(rs.getNString(3));
				Categorie c = findcategorieById(id);
				l.setCat(c);
				lv.add(l);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBinteraction.disconnect();
		return lv;
	}
	
	public List<Livre> livreParAut(String auteur) {
		java.util.List<Livre> lv = new ArrayList<Livre>();
		DBinteraction.connect();
		ResultSet rs = DBinteraction.select("select * from livre where auteur = '"+auteur+"'");
		try {
			while(rs.next()) {
				Livre l = new Livre();
				l.setId(rs.getInt(1));
				l.setTitre(rs.getString(2));
				l.setAuteur(rs.getString(3));
				int idCat = rs.getInt(4);
				l.setCat(findcategorieById(idCat));
				lv.add(l);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBinteraction.disconnect();
		return lv;
	}
	
	public Livre findLivreById(int id) {
		
		Livre v = null;
		DBinteraction.connect();
		ResultSet rs = DBinteraction.select("select * from livre where id = "+id);
		try {
			if(rs.next()) {
				v = new Livre();
				v.setId(rs.getInt(1));
				v.setTitre(rs.getString(2));
				v.setAuteur(rs.getString(3));
				v.setCat(findcategorieById(rs.getInt(4)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBinteraction.disconnect();
		return v;
	}
	
	public List<Livre> Allivres() {
		java.util.List<Livre> lv = new ArrayList<Livre>();
		DBinteraction.connect();
		ResultSet rs = DBinteraction.select("select * from livre ");
		try {
			while(rs.next()) {
				Livre l = new Livre();
				l.setId(rs.getInt(1));
				l.setTitre(rs.getNString(2));
				l.setAuteur(rs.getNString(3));
				int idCat = rs.getInt(4);
				l.setCat(findcategorieById(idCat));
				lv.add(l);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBinteraction.disconnect();
		return lv;
	}
}
