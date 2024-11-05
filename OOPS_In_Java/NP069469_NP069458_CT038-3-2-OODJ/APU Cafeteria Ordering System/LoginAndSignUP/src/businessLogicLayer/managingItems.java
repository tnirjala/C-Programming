
package businessLogicLayer;

import java.util.ArrayList;

public class managingItems {

    private String sn, item;
    private int price;
    ArrayList<ArrayList<String>> Data = new ArrayList();

    public ArrayList<ArrayList<String>> getData() {
        return Data;
    }

    public void setData(ArrayList<ArrayList<String>> Data) {
        this.Data = Data;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getItems() {
        return item;
    }

    public void setItems(String item) {
        this.item = item;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }


}
