
package dataAccessLayer;

import businessLogicLayer.managingUser;
import java.io.IOException;
import java.util.ArrayList;
public interface managingUserdao
{

    void addbtnum(managingUser Username,managingUser Password,managingUser Phone,managingUser Designation,
                  managingUser User_id,managingUser Email);
    void readbtnum(managingUser Reafilez);
    void deletebtnum(managingUser Useridz);
    void Updatebtnum(managingUser updatewala);
}