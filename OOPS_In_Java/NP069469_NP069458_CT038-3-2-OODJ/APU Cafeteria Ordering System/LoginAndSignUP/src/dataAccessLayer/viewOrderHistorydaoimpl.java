package dataAccessLayer;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import javax.swing.JOptionPane;
public class viewOrderHistorydaoimpl extends viewOrderHistorydao {
    public ArrayList<String> viewHistory() {
        ArrayList<String> fileData = new ArrayList<>();
        FileReader fr;
        try {
            fr = new FileReader("Order_History.txt");

            BufferedReader br = new BufferedReader(fr);
            String line;
            while ((line = br.readLine()) != null) {
                fileData.add(line);
            }

        } catch (FileNotFoundException ex) {
            System.out.println("No such file found");
        } catch (IOException ex) {
            System.out.println("No such file found");
        }

        return fileData;
    }

}
