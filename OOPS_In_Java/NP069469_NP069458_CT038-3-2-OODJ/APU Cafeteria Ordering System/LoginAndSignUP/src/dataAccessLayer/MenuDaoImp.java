/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dataAccessLayer;

import businessLogicLayer.Items;
//import gui.FrmDeleteItems;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PastaMonster
 */
public class MenuDaoImp implements MenuDao {

    @Override
    public void viewMenu(Items a) {
    }

    @Override
    public ArrayList<String> getAllItems() {
        ArrayList<String> fileData = new ArrayList<>();
        FileReader fr;
        try {
            fr = new FileReader("Menu.txt");

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

