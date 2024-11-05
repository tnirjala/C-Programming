
package dataAccessLayer;

import businessLogicLayer.Order;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;
import javax.swing.JOptionPane;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.time.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class orderHistorydaoimpl implements orderHistorydao {


    @Override
    public void order(Order o) {
        boolean found = false;
        try {
            File f = new File("Menu.txt");
            Scanner myScanner = new Scanner(f);
            myScanner.useDelimiter("[,\n]");
            while (myScanner.hasNext() && !found) {
                String sn = myScanner.next();
                String name = myScanner.next();
                String price = myScanner.next();

                if (o.getItemName().equals(name)) {
                    found = true;
                }
                if (found) {
                    System.out.println("found");
                    System.out.println(sn + name + price);
                    String numericInput = price.replaceAll("[^\\d]", "");
                    int i = Integer.parseInt(numericInput);
                    int intQuantity = Integer.parseInt(o.getQuantity());
                    int ord = i * intQuantity;
                    JOptionPane.showMessageDialog(null, "Your total order price :Rs." + ord + "," + " " + "and payment mode is :" + " " + o.getPay());
                    try {
                        String billName = o.getBillName();
                        FileWriter fw = new FileWriter("Order_History.txt", true);
                        BufferedWriter bw = new BufferedWriter(fw);
                        bw.newLine();
                        bw.write(billName + "," + name + "," + o.getQuantity() + "," + ord + "," + o.getPay() + "," + LocalDate.now());
                        bw.close();

                    } catch (IOException e) {
                    }

                } else {
                    System.out.println("no found");
                    //JOptionPane.showMessageDialog(null, "Item not found!");
                }
            }
            if (!found) {
                JOptionPane.showMessageDialog(null, "Item not found!");
            }
        } catch (FileNotFoundException e) {
        }
    }

//    public ArrayList<String> customerTable() {
//        ArrayList<String> fileData = new ArrayList<>();
//        FileReader fr;
//        try {
//            fr = new FileReader("Customer_Details.txt");
//
//            BufferedReader br = new BufferedReader(fr);
//            String line;
//            while ((line = br.readLine()) != null) {
//                fileData.add(line);
//            }
//
//        } catch (FileNotFoundException ex) {
//            Logger.getLogger(MenuDaoImp.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (IOException ex) {
//            Logger.getLogger(MenuDaoImp.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        return fileData;
//    }

}

