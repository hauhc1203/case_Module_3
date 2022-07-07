package model;

public class Account {
    private int idAccount;
    private String phoneNumber;
    private String passWord;
    private String fullName;
    private String role="user";

    public Account() {
    }

    public Account(String phoneNumber, String passWord, String fullName) {
        this.phoneNumber = phoneNumber;
        this.passWord = passWord;
        this.fullName = fullName;
    }

    public Account(int idAccount,String phoneNumber, String passWord, String fullName, String role) {
        this.idAccount=idAccount;
        this.phoneNumber = phoneNumber;
        this.passWord = passWord;
        this.fullName = fullName;
        this.role = role;
    }

    public int getIdAccount() {
        return idAccount;
    }

    public void setIdAccount(int idAccount) {
        this.idAccount = idAccount;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
