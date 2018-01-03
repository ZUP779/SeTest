package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckReg extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CheckReg() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		boolean flag = false;
		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String pwd = request.getParameter("user_password");
		String pho = request.getParameter("user_phone1");
		boolean male = (request.getParameter("user_male") != null) ? true : false;
		boolean type = (request.getParameter("user_p") != null) ? true : false;
		//System.out.print(Umale);
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Soft_item","sa", "yepeng");
			if( type == false){
				
				CallableStatement ic=conn.prepareCall("{call select_U_R_info(?)}");//调用存储过程
				ic.setString(1, email);//设置存储过程的参数
				ResultSet rs = ic.executeQuery();//获得结果
				
				//判断是否ur表
				while(rs.next()){
					if( rs.getString(1).equals(pwd) == true && rs.getString(2).equals(email) == true){
						flag = true;
						break;
					}
				}
				
				/*
				@U_R_Pwd varchar(50),
				@U_R_Email varchar(50),
				@U_R_Tel varchar(20),
				@U_R_Nick varchar(50),
				@U_R_Sco int,
				@U_R_QQ  varchar(50)
				 */
				if( flag == false){
					ic=conn.prepareCall("{call insert_U_R_info(?,?,?,?,?,?)}");
					ic.setString(1, pwd);
					ic.setString(2, email);
					ic.setString(3, pho);
					ic.setString(4, name);
					ic.setInt(5, 0);
					ic.setString(6, "");
					ic.execute();
					session.setAttribute("tel", pho);
					session.setAttribute("nick", name);
					session.setAttribute("sco", 0);
					session.setAttribute("qq", "");
					session.setAttribute("info", "");
					session.setAttribute("school", "");
					session.setAttribute("login", "ur");
					session.setAttribute("email", email);
					session.setAttribute("pho", pho);
					rs.close();
					conn.close();
					response.sendRedirect("/SeTest/index.jsp");
				}
			}
			else{
				//判断up表
				CallableStatement ic2=conn.prepareCall("{call select_U_P_info(?)}");//调用存储过程
				ic2.setString(1, email);//设置存储过程的参数
				ResultSet rs = ic2.executeQuery();//获得结果
				
				//判断是否是
				while(rs.next()){
					if( rs.getString(1).equals(pwd) == true && rs.getString(2).equals(email) == true){
						flag = true;
						break;
					}
				}
				
				/*
				@U_P_Pwd  varchar(50),       
				@U_P_Email varchar(50) ,        
				@U_P_Tel varchar(20),       
				@U_P_Nick varchar(50), 
				@U_P_Sco int,
				@U_P_School varchar(50),
				@U_P_Info  varchar(500),       
				@U_P_Label varchar(50),
				@U_R_QQ varchar(50)
				*/
				if( flag == false){
					ic2=conn.prepareCall("{call insert_U_P_info(?,?,?,?,?,?,?,?,?)}");
					ic2.setString(1, pwd);
					ic2.setString(2, email);
					ic2.setString(3, pho);
					ic2.setString(4, name);
					ic2.setInt(5, 0);
					ic2.setString(6, "");
					ic2.setString(7, "");
					ic2.setString(8, "");
					ic2.setString(9, "");
					ic2.execute();
					rs.close();
					conn.close();
					session.setAttribute("login", "up");
					session.setAttribute("email", email);
					session.setAttribute("tel", pho);
					session.setAttribute("nick", name);
					session.setAttribute("sco", 0);
					session.setAttribute("qq", "");
					session.setAttribute("info", "");
					session.setAttribute("school", "");
					session.setAttribute("pho", pho);
					response.sendRedirect("/SeTest/index.jsp");
				}
			}
			//flag == true 存在相同条目
			response.sendRedirect("/SeTest/Login.jsp");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
