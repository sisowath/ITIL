package com.itil.dao.implementation;

import com.itil.entites.User;
import com.itil.jdbc.dao.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class UserDao extends Dao<User> {

    public UserDao(Connection c) {
        super(c);
    }

    @Override
    public boolean create(User x) {
        String req =    "INSERT INTO user (`username`, `password`) " + 
                        "VALUES ('" + x.getUsername() + "','" +  x.getPassword() + "')";
        /*
            Le id est auto_increment. Donc, pas besoin de mettre comme paramètre.
            Il y a un statut par défaut à tous les nouveaux abonnés : player
        */
        Statement stm = null;
        try {
            stm = cnx.createStatement();
            int n = stm.executeUpdate(req);
            if (n > 0) {
                stm.close();
                return true;
            }
        } catch (SQLException exp) {
			
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {                
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

    @Override
    public boolean delete(User x) {        
        Statement stm = null;
        try {
            stm = cnx.createStatement();
            int n = stm.executeUpdate("DELETE FROM user WHERE id = " + x.getId());
            if (n > 0) {
                stm.close();
                return true;
            }
        } catch (SQLException exp) {
        
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

    @Override 
    public User read(String username) {        
        PreparedStatement stm = null;
        //Statement stm = null;
        try {            
            //stm = cnx.createStatement();
            //ResultSet r = stm.executeQuery("SELECT * FROM user WHERE username = '" + username + "'");
            //Avec requête paramétrée :
            stm = cnx.prepareStatement("SELECT * FROM user WHERE username = ?");
            stm.setString(1,username);
            ResultSet r = stm.executeQuery();
            if (r.next()) {
                User c = new User();
                c.setId(r.getInt("id"));
                c.setUsername(r.getString("username"));
                c.setPassword(r.getString("password"));
                c.setStatut(r.getString("statut"));
                c.setEmail(r.getString("email"));
                c.setDescription(r.getString("description"));
                c.setFerraille(r.getInt("ferraille"));
                c.setPrestige(r.getInt("prestige"));
                r.close();
                stm.close();
                return c;
            }
        } catch (SQLException exp) {
			
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {            
                    e.printStackTrace();
                }
            }
        }
        return null;
    }
    public int readIdByUsername(String username) {        
        PreparedStatement stm = null;
        try {            
            stm = cnx.prepareStatement("SELECT id FROM user WHERE username = ?");
            stm.setString(1,username);
            ResultSet r = stm.executeQuery();
            if (r.next()) {                
                r.close();
                stm.close();
                return r.getInt("id");
            }
        } catch (SQLException exp) {
			
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {            
                    e.printStackTrace();
                }
            }
        }
        return 0;
    }
    public List<User> readBestPlayers() {//source de : http://www.developerfusion.com/code/1751/limit-the-number-of-rows-returned/
        Statement stm = null;
        List<User> listeDesMeilleursJoueurs = new ArrayList<User>();
        try {            
            stm = cnx.createStatement();
            ResultSet r = stm.executeQuery("SELECT * FROM `user` ORDER BY `prestige` DESC LIMIT 10");
            while (r.next()) {
                User c = new User(r.getInt("id"), r.getString("username"), 
                                r.getString("password"), r.getString("statut"), 
                                r.getString("email"), r.getString("description"),
                                r.getInt("ferraille"), r.getInt("prestige"));
                listeDesMeilleursJoueurs.add(c);
            }
            r.close();
            stm.close();
            return listeDesMeilleursJoueurs;
        } catch (SQLException exp) {
			
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {            
                    e.printStackTrace();
                }
            }
        }
        return null;      
    }
// U P D A T E    
    @Override
    public boolean update(User x) {
        Statement stm = null;
        try {
            String req =    "UPDATE user SET username = '" + x.getUsername() + 
                            "', password = '" + x.getPassword() + "', statut = '" + x.getStatut() +
                            " WHERE id = " + x.getId() + "";
            stm = cnx.createStatement();
            int n = stm.executeUpdate(req);
            if (n > 0) {
                stm.close();
                return true;
            }
        } catch (SQLException exp) {
			
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {            
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

    @Override
    public List<User> findAll() {
        List<User> liste = new LinkedList<User>();
        try {
            Statement stm = cnx.createStatement();
            ResultSet r = stm.executeQuery("SELECT * FROM user");
            while (r.next()) {
                User c = new User(r.getInt("id"), r.getString("username"), 
                                r.getString("password"), r.getString("statut"), 
                                r.getString("email"), r.getString("description"),
                                r.getInt("ferraille"), r.getInt("prestige"));
                liste.add(c);
            }
            r.close();
            stm.close();
        } catch (SQLException exp) {
            
        }
        return liste;
    }
}