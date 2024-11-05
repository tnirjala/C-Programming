/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dataAccessLayer;

import java.util.ArrayList;

public interface FeedbackDao {

    void GiveFeedback( String userId,String name, String feed);

    void ReceiveFeedback(String userId, String name, String feed);

    public ArrayList<String> viewFeedback();
}

