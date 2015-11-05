package com.itil.dao.implementation;

import com.itil.entites.Document;
import com.itil.jdbc.dao.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class DocumentDao extends Dao<Document> {
    
    public DocumentDao(Connection c) {
        super(c);
    }

    @Override
    public boolean create(Document x) {
        String req =    "INSERT INTO document (`titre`, `auteur`, `dateDeCreation`, `path`, `format`, `keyword`) " + 
                        "VALUES ('" + x.getTitre() + "','" + x.getAuteur() + "', '" + x.getDateDeCreation() + "','" +  
                        x.getPath() + "', '" + x.getFormat() + "','" + x.getKeyword() + "')";
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
    public boolean delete(Document x) {        
        Statement stm = null;
        try {
            stm = cnx.createStatement();
            int n = stm.executeUpdate("DELETE FROM document WHERE id = " + x.getId());
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
    public Document read(String username) {        
        PreparedStatement stm = null;
        try {            
            stm = cnx.prepareStatement("SELECT * FROM document WHERE titre = ?");
            stm.setString(1,username);
            ResultSet r = stm.executeQuery();
            if (r.next()) {
                Document c = new Document();
                c.setId( r.getInt("id") );
                c.setTitre( r.getString("titre"));
                c.setAuteur( r.getString("auteur"));
                c.setDateDeCreation( r.getString("dateDeCreation"));
                c.setPath( r.getString("path"));
                c.setFormat( r.getString("format"));
                c.setKeyword( r.getString("keyword"));
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
    public Document read(int id) {        
        PreparedStatement stm = null;
        try {            
            stm = cnx.prepareStatement("SELECT * FROM document WHERE id = ?");
            stm.setInt(1,id);
            ResultSet r = stm.executeQuery();
            if (r.next()) {
                Document c = new Document();
                c.setId( r.getInt("id") );
                c.setTitre( r.getString("titre"));
                c.setAuteur( r.getString("auteur"));
                c.setDateDeCreation( r.getString("dateDeCreation"));
                c.setPath( r.getString("path"));
                c.setFormat( r.getString("format"));
                c.setKeyword( r.getString("keyword"));
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
// U P D A T E    
    @Override
    public boolean update(Document x) {
        Statement stm = null;
        try {
            String req =    "UPDATE document SET titre = '" + x.getTitre() + 
                            "', auteur = '" + x.getAuteur() + "', dateDeCreation = '" + x.getDateDeCreation() +
                            "', path = '" + x.getPath() + "', format = '" + x.getFormat() + 
                            "', keyword = '" + x.getKeyword() + "'" +
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
    public List<Document> findAll() {
        List<Document> liste = new LinkedList<Document>();
        try {
            Statement stm = cnx.createStatement();
            ResultSet r = stm.executeQuery("SELECT * FROM document");
            while (r.next()) {
                Document c = new Document(r.getInt("id"), r.getString("titre"), r.getString("auteur"), r.getString("dateDeCreation"), r.getString("path"), r.getString("format"), r.getString("keyword"));
                liste.add(c);
            }
            r.close();
            stm.close();
        } catch (SQLException exp) {
            
        }
        return liste;
    }
    public List<Document> findAllByRole(String role) {
        PreparedStatement stm = null;                     
        List<Document> liste = new LinkedList<Document>();
        try {
            if("admin".equals( role ) ) {
                stm = cnx.prepareStatement("SELECT * FROM document");
            } else if("user".equals( role ) ) {
                stm = cnx.prepareStatement("SELECT * FROM document WHERE format = ?");
                stm.setString(1,".pdf");
            }                
            ResultSet r = stm.executeQuery();
            while (r.next()) {
                Document c = new Document(r.getInt("id"), r.getString("titre"), r.getString("auteur"), r.getString("dateDeCreation"), r.getString("path"), r.getString("format"), r.getString("keyword"));
                liste.add(c);
            }            
            r.close();
            stm.close();
            return liste;
        } catch (SQLException exp) {
            
        }
        return null;
    }
}