import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;
public class InserRecordForm2 
{
	JFrame fr=new JFrame("Insert Form");
	JLabel [] la=new JLabel[4];
	JTextField [] tb=new JTextField[4];
	JButton bt=new JButton("Save Record");
	PreparedStatement ps,ps1;
	public InserRecordForm2()
	{
		fr.setSize(500,500);
		fr.setLocationRelativeTo(null);
		fr.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		fr.setResizable(false);
		addComponents();
		dbConnection();
		fr.setVisible(true);
	}
	private void addComponents()
	{
		fr.setLayout(null);
		int y=50;
		String [] arr= {"Id","name","price","quantity"};
		Font fo=new Font("arial",0,19);
		for(int i=0;i<4;i++)
		{
			la[i]=new JLabel("Enter product "+arr[i]);
			la[i].setBounds(20,y,200,30);
			la[i].setFont(fo);
			fr.add(la[i]);
			tb[i]=new JTextField();
			tb[i].setBounds(220,y,250,30);
			tb[i].setFont(fo);
			fr.add(tb[i]);
			y+=70;
		}
		bt.setBounds(175,350,150,30);
		fr.add(bt);
		bt.addActionListener(new SaveListener());
	}
	private void dbConnection()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava","root","mysql");
			ps=cn.prepareStatement("insert into product values(?,?,?,?)");
			ps1=cn.prepareStatement("select * from productinfo where pid=?");
			System.out.println("Connected...");
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
	private boolean isNumeric(String value)
	{
		for(int i=0;i<value.length();i++)
		{
			char ch=value.charAt(i);
			if(ch<48 || ch>57)
				return false;
		}
		return true;
	}
	class SaveListener implements ActionListener
	{
		public void actionPerformed(ActionEvent e) 
		{
			String pid=tb[0].getText();
			String name=tb[1].getText();
			String price=tb[2].getText();
			String qty=tb[3].getText();
			if(pid.equals("") ||name.equals("")||price.equals("")||qty.equals(""))
			{
				JOptionPane.showMessageDialog(fr,"All values are required");
				return;
			}
			if(pid.length()!=4)
			{
				JOptionPane.showMessageDialog(fr,"Product id length should be 4 only");
				return;
			}
			char ch=pid.charAt(0);
			if(ch!='p' && ch!='P')
			{
				JOptionPane.showMessageDialog(fr,"Product id value must begin with P followed by 3 digits");
				return;
			}
			if(!isNumeric(pid.substring(1)))
			{
				JOptionPane.showMessageDialog(fr,"Product id value must begin with P followed by 3 digits");
				return;
			}
			pid=pid.replace('p','P');
			try
			{
				ps1.setString(1,pid);
				ResultSet rst=ps1.executeQuery();
				if(rst.next())
				{
					JOptionPane.showMessageDialog(fr,"Product with id "+pid+" already exists");
					return;
				}
				ps.setString(1,pid);
				ps.setString(2,name);
				ps.setString(3,price);
				ps.setString(4,qty);
				ps.executeUpdate();
				JOptionPane.showMessageDialog(fr,"Product record hae been saved successfully");
			}
			catch(Exception ex)
			{
				System.out.println(ex);
			}
		}
	}
	public static void main(String[] args) 
	{
		new InserRecordForm2();
	}
}
