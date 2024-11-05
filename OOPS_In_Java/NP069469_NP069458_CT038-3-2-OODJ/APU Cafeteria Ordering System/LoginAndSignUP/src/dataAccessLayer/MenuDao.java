/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dataAccessLayer;

import businessLogicLayer.Items;
import java.util.ArrayList;

/**
 *
 * @author PastaMonster
 */
public interface MenuDao {
    void viewMenu(Items a);
    public ArrayList<String> getAllItems();
    
}
