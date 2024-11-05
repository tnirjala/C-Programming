
package dataAccessLayer;

import businessLogicLayer.loginDetails;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class loginDetailsdaoimpl implements loginDetailsdao {
public boolean checkuser(loginDetails Usern, loginDetails Passwrd, loginDetails Design) {
    boolean fund = false;
    try {
        File file = new File("Login.txt");
        if (!file.exists()) {
            file.createNewFile(); // Create the file if it doesn't exist
        }

        BufferedReader readbr = new BufferedReader(new FileReader(file));
        String line = null;
        String[] splt = null;

        while ((line = readbr.readLine()) != null) {
            splt = line.split(",");
            if (splt[1].equals(Usern.getUsername()) && splt[2].equals(Passwrd.getPassword()) && splt[5].equals(Design.getDesignation())) {
                fund = true;
                break;
            }
        }
        readbr.close();
        return fund;
    } catch (FileNotFoundException ex) {
        Logger.getLogger(loginDetailsdaoimpl.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IOException ex) {
        Logger.getLogger(loginDetailsdaoimpl.class.getName()).log(Level.SEVERE, null, ex);
    }
    return false;
}
//public boolean checkuser(loginDetails Usern, loginDetails Passwrd, loginDetails Design) {
//    boolean found = false;
//    BufferedReader reader = null;
//
//    try {
//        File file = new File("Login.txt");
//        if (!file.exists()) {
//            file.createNewFile(); // Create the file if it doesn't exist
//        }

//        reader = new BufferedReader(new FileReader(file));
//        String line;
//
//        while ((line = reader.readLine()) != null) {
//            String[] parts = line.split(",");
//            if (parts.length >= 3) { // Ensure the line has at least three parts
//                String usernameFromFile = parts[0].trim();
//                String passwordFromFile = parts[1].trim();
//                String designationFromFile = parts[2].trim();
//
//                if (usernameFromFile.equals(Usern.getUsername()) &&
//                        passwordFromFile.equals(Passwrd.getPassword()) &&
//                        designationFromFile.equals(Design.getDesignation())) {
//                    found = true;
//                    break;
//                }
//            }
//        }
//    } catch (IOException ex) {
//        ex.printStackTrace();
//    } finally {
//        try {
//            if (reader != null) {
//                reader.close();
//            }
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        }
//    }
//
//    return found;
//}
}
