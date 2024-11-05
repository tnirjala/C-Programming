
package dataAccessLayer;

import presentationLayer.managerHome;
import presentationLayer.Usermanagement;
import businessLogicLayer.managingUser;
import java.io.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
public class managingUserdaoimpl implements managingUserdao {
    public void addbtnum(managingUser Username, managingUser Password, managingUser Phone,
                         managingUser Designation, managingUser User_id, managingUser Email) {
        String Usern, Pass, Desig, Mail, userid;
        int num;

        Usern = Username.getUsername();
        Pass = Password.getPassword();
        num = Phone.getPhone();
        Desig = Designation.getDesignation();
        Mail = Email.getEmail();
        userid = User_id.getUserid();


        try {
            BufferedWriter bw = new BufferedWriter(new FileWriter("Login.txt", true));
            bw.write(userid + "," + Usern + "," + Pass + "," + num + "," + Mail + "," + Desig);
            bw.newLine();
            bw.flush();
            bw.close();

        } catch (IOException ex) {
            Logger.getLogger(managingUserdaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void readbtnum(managingUser Reafilez) {
        ArrayList<ArrayList<String>> info = new ArrayList();
        String details;

        try {
            BufferedReader rbn = new BufferedReader(new FileReader("Login.txt"));
            while ((details = rbn.readLine()) != null) {
                ArrayList<String> numdata = new ArrayList();
                StringTokenizer st = new StringTokenizer(details, ",");
                int sr = st.countTokens();

                for (int j = 0; j < sr; j++) {

                    if (j == 6) {
                        st.nextToken();

                    } else {
                        numdata.add(st.nextToken());
                    }
                }

                info.add(numdata);
            }
            Reafilez.setData(info);
            rbn.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(managingUserdaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(managingUserdaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deletebtnum(managingUser Useridz) {

    }

    public void Deletebtnum(managingUser Usernam) throws IOException {
    }

    @Override
    public void Updatebtnum(managingUser Updatewala) {

        ArrayList<String> tempArray = new ArrayList<>();
        try (FileReader fr = new FileReader("Login.txt")) {

            Scanner reader = new Scanner(fr);
            String line;
            String[] lineArr;

            while ((line = reader.nextLine()) != null) {
                lineArr = line.split(",");
                if (lineArr[0].equals(Updatewala.getUserid())) {
                    tempArray.add(
                            Updatewala.getUserid() + "," + Updatewala.getUsername() + "," + Updatewala.getPassword() + "," + Updatewala.getPhone() + "," + Updatewala.getEmail() + "," + Updatewala.getDesignation());
                } else {
                    tempArray.add(line);

                }
                fr.close();
            }

        } catch (Exception e) {
        }

        try {
            try (PrintWriter pr = new PrintWriter("Login.txt")) {
                for (String str : tempArray) {
                    pr.println(str);
                }
            }
        } catch (FileNotFoundException e) {
        }
    }
}






