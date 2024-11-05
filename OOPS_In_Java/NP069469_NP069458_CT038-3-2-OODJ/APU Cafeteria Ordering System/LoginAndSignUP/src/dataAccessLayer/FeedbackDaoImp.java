
package dataAccessLayer;

import java.io.BufferedReader;
import javax.swing.JOptionPane;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FeedbackDaoImp implements FeedbackDao {

    @Override
    public void GiveFeedback( String userId,String name, String feed) {
        try {
            File file = new File("Feedback.txt");
            if (!file.createNewFile()) {
                try {
                    FileWriter a = new FileWriter(file, true);
                    try ( BufferedWriter writer = new BufferedWriter(a)) {
                        writer.newLine();
                        writer.write( userId+","+name + "," + feed);
                        writer.flush();
                        writer.close();
                        JOptionPane.showMessageDialog(null, "Saved");
                    }
                } catch (IOException e) {
                    System.out.println("error");
                }
            } else {
                System.out.println("File already created");
            }
        } catch (IOException e) {
            System.out.println("error");
        }

    }

    @Override
    public void ReceiveFeedback(String userId, String name, String feed) {

        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<String> viewFeedback() {
        ArrayList<String> fileData = new ArrayList<>();
        FileReader fr;
        try {
            fr = new FileReader("Feedback.txt");

            BufferedReader br = new BufferedReader(fr);
            String line;
            while ((line = br.readLine()) != null) {
                fileData.add(line);
            }

        } catch (FileNotFoundException ex) {
            Logger.getLogger(MenuDaoImp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(MenuDaoImp.class.getName()).log(Level.SEVERE, null, ex);
        }

        return fileData;
    }
}
