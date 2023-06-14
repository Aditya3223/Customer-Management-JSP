import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
public class InsertRecordForm 
{
	JFrame fr=new JFrame("Insert Form");
	JLabel [] la=new JLabel[4];
	JTextField [] tb=new JTextField[4]; 
	JButton bt=new JButton("Save Record");
	PreparedStatement ps;
	public InsertRecordForm()
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
			String query="insert into product values(?,?,?,?)";
			ps=cn.prepareStatement(query);
			System.out.println("Connected...");
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
	class SaveListener implements ActionListener
	{
		public void actionPerformed(ActionEvent e) 
		{
			try
			{
				ps.setString(1,tb[0].getText());
				ps.setString(2,tb[1].getText());
				ps.setString(3,tb[2].getText());
				ps.setString(4,tb[3].getText());
				ps.executeUpdate();
				JOptionPane.showMessageDialog(fr,"Product record has been saved successfully");
			}
			catch(Exception ex)
			{
				System.out.println(ex);
			}
		}
	}
	public static void main(String[] args) 
	{
		new InsertRecordForm();
	}

}
