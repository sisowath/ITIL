package com.itil.entites;

public class User {
            // atribut(s)
    private int id;
    private String username;
    private String password;
    private String role;
            // methode(s)
    // constructeur(s)
    public User(int id, String username, String password, String role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
    }
    public User() {
        this(1, "<no username>", "<no password>", "<no role>");
    }
    // accesseur(s)
    public int getId() { return id; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getRole() { return role; }
    // mutateur(s)
    public boolean setId(int id) {
        this.id = id;
        return true;
    }
    public boolean setUsername(String username) {
        this.username = username;
        return true;
    }
    public boolean setPassword(String password) {
        this.password = password;
        return true;
    }
    public boolean setRole(String role) {
        this.role = role;
        return true;
    }
    // autre(s)      
}
