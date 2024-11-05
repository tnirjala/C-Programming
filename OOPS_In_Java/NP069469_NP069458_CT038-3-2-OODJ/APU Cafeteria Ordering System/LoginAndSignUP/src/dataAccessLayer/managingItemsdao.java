
package dataAccessLayer;

import businessLogicLayer.managingItems;
import java.io.IOException;
import java.util.ArrayList;
public interface managingItemsdao
{
    void addbtnum(managingItems sn,managingItems item,managingItems price);

//    void addbtnum(managingItems items);

    void readbtnum(managingItems Reafilez);
    void deletebtnum(managingItems Useridz);
    void Updatebtnum(managingItems updatewala);

}