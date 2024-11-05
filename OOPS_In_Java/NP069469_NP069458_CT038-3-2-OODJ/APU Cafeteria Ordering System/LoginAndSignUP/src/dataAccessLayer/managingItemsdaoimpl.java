package dataAccessLayer;

import businessLogicLayer.managingItems;
import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;

public class managingItemsdaoimpl implements managingItemsdao {

    @Override
    public void addbtnum(managingItems sn, managingItems item, managingItems price) {
        String sn1 = item.getSn();
        String itemName = String.valueOf(item.getItems());
        int price1 = item.getPrice();

        try {
            BufferedWriter bw = new BufferedWriter(new FileWriter("Menu.txt", true));
            bw.write(sn1 + "," + itemName + "," + price1);
            bw.newLine();
            bw.flush();
            bw.close();
        } catch (IOException ex) {
            Logger.getLogger(managingItemsdaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void readbtnum(managingItems Reafilez) {
        ArrayList<ArrayList<String>> info = new ArrayList();
        String details;
        try {
            BufferedReader rbn = new BufferedReader(new FileReader("Menu.txt"));
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
            Logger.getLogger(managingItemsdaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(managingItemsdaoimpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deletebtnum(managingItems item) {
        // Implement deletion logic here
    }

    @Override
    public void Updatebtnum(managingItems Updatewala) {
        ArrayList<String> tempArray = new ArrayList<>();
        try (FileReader fr = new FileReader("Menu.txt")) {

            Scanner reader = new Scanner(fr);
            String line;
            String[] lineArr;

            while ((line = reader.nextLine()) != null) {
                lineArr = line.split(",");
                if (lineArr[0].equals(Updatewala.getSn())) {
                    tempArray.add(
                            Updatewala.getSn() + "," + Updatewala.getItems() + "," + Updatewala.getPrice());
                } else {
                    tempArray.add(line);

                }
                fr.close();
            }

        } catch (Exception e) {
        }

        try {
            try (PrintWriter pr = new PrintWriter("Menu.txt")) {
                for (String str : tempArray) {
                    pr.println(str);
                }
            }
        } catch (FileNotFoundException e) {
        }
    }
}

