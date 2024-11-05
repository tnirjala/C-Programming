
package businessLogicLayer;

import java.util.ArrayList;

public class managingUser {

    private String Username, Password, Email, Designation, Userid;
    private int Phone;

    ArrayList<ArrayList<String>> Data = new ArrayList();

    public ArrayList<ArrayList<String>> getData() {
        return Data;
    }

    public void setData(ArrayList<ArrayList<String>> Data) {
        this.Data = Data;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getUserid() {
        return Userid;
    }

    public void setUserid(String Userid) {
        this.Userid = Userid;
    }

    public int getPhone() {
        return Phone;
    }

    public void setPhone(int Phone) {
        this.Phone = Phone;
    }

    public String getDesignation() {
        return Designation;
    }

    public void setDesignation(String Designation) {
        this.Designation = Designation;
    }


}
