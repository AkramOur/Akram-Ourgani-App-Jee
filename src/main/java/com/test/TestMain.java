package com.test;

import com.DAO.DBinteraction;
import com.DAO.EtudiantManager;
import com.DAO.LivreManager;
import com.model.Categorie;
import com.model.Etudiant;
import com.mysql.cj.jdbc.jmx.LoadBalanceConnectionGroupManagerMBean;

public class TestMain {
//addEtudiant(String nom, String prenom, String email,String pass)
	public static void main(String[] args) {
		EtudiantManager mg = new EtudiantManager();
//		int nb = mg.addEtudiant("Akram", "Ourgani", "Akram.ourgano", "123456789123Aa");
//		System.out.print(nb);
/*		Etudiant e = mg.authentification("a.o@gm.com", "klsdcm");
		if(e != null) {
			System.out.print(e.getNom());
		}else {
			System.out.print("non");
		}*/
		LivreManager lm = new LivreManager();
/*		int n = lm.addCategorie("Cuisine");
		System.out.print(n);*/
		lm.addCategorie("Economie & Affaires");
		Categorie c = lm.findcategorieByName("Cuisine");
		int nn = lm.addLivre("Art de la table", "akr", c);
		System.out.print(nn);
		
	}

}
