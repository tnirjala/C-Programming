/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package businessLogicLayer;

public class Items {
    private String id;
    private String name;
    private String price;
    private int sn;
    public Items(String id, String name, String price, int sn) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.sn = sn;
    }
    public Items() {
        this.id="";
        this.name="";
        this.price="";
        this.sn = 0;
    }

    public int getSn() {
        return sn;
    }

    public void setSn(int sn) {
        this.sn = sn;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
    
    
}
