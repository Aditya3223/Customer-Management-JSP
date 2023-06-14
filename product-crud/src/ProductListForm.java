import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.sql.*;
public class ProductListForm 
{
	JFrame fr=new JFrame("Product List");
	JTable ta;
	DefaultTableModel model=new DefaultTableModel();
	public ProductListForm()
	{
		fr.setSize(500,500);
		fr.setLocationRelativeTo(null);
		fr.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		fr.setResizable(false);
		ta=new JTable(model);
		JScrollPane pa=new JScrollPane(ta);
		fr.add(pa);
		populateData();
		fr.setVisible(true);
	}
	private void populateData()
	{
		model.addColumn("Product Id");
		model.addColumn("Product name");
		model.addColumn("Product price");
		model.addColumn("Product quantity");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava","root","mysql");
			Statement st=cn.createStatement();
			ResultSet rst=st.executeQuery("select * from product");
			while(rst.next())
			{
				Object [] data= {rst.getString(1),rst.getString(2),rst.getString(3),rst.getString(4)};
				model.addRow(data);
			}
		}
		catch(Exception ex) 
		{
			System.out.println(ex);
		}
	}
	public static void main(String[] args) 
	{
		new ProductListForm();
	}
}
