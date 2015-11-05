package com.itil.entites;

public class Document {
        // attribut(s)
    private int id;
    private String titre;
    private String path;
    private String format;
    private String keyword;
        // methode(s)
    // constructeur(s)
    public Document(int id, String titre, String path, String format, String keyword) {
        this.id = id;
        this.titre = titre;
        this.path = path;
        this.format = format;
        this.keyword = keyword;
    }
    public Document() {
        this(1, "no titre", "no path", "no format", "no keyword");
    }
    // accesseur(s)
    public int getId() {
        return id;
    }
    public String getTitre() {
        return titre;
    }
    public String getPath() {
        return path;
    }
    public String getFormat() {
        return format;
    }
    public String getKeyword() {
        return keyword;
    }
    // mutateur(s)
    public void setId(int id) {
        this.id = id;
    }
    public void setTitre(String titre) {
        this.titre = titre;
    }
    public void setPath(String path) {
        this.path = path;
    }
    public void setFormat(String format) {
        this.format = format;
    }
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
    // autre(s)       
}
