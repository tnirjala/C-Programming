package presentationLayer;
import javax.swing.*;
public class video extends JFrame{
    video(){
        super("APU Cafeteria Management System");
        ImageIcon imageIcon=new ImageIcon(ClassLoader.getSystemResource("Icons_Used/Starting.gif"));
        JLabel label=new JLabel(imageIcon);
        label.setBounds(0,0,858,750);
        add(label);
        setLayout(null);
        setLocation(300,80);
        setSize(858,750);
        setVisible(true);
        try{
            Thread.sleep(4000);
            new Login().setVisible(true);
            dispose();
            setVisible(false);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        new video();
    }
}

