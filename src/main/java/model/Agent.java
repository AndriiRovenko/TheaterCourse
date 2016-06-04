package model;

/**
 * Created by andrew on 6/4/16.
 */
public class Agent {
    private int id;
    private String firstName;
    private String lastName;
    private String phone;
    private String mail;
    private String edrpu;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getEdrpu() {
        return edrpu;
    }

    public void setEdrpu(String edrpu) {
        this.edrpu = edrpu;
    }
}
