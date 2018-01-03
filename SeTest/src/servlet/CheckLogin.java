package servlet;

import java.io 

.IOException;
import java.io 

.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.opensymphony.xwork2.ActionContext;
public class CheckLogin extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CheckLogin() {
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
		
		boolean flag = false;
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String  Email = request.getParameter("user_name");
		String  Pwd = request.getParameter("user_password");
		String tel = "";
		String nick = "";
		int sco = 0;
		String qq = "";
		String info = "";
		String school = "";
		//System.out.println(Email);
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Soft_item","sa", "yepeng");
			
			CallableStatement ic=conn.prepareCall("{call select_U_R_info(?)}");//调用存储过程
			ic.setString(1, Email);//设置存储过程的参数
			ResultSet rs = ic.executeQuery();//获得结果
			//判断是否ur表
			while(rs.next()){
				//System.out.println(rs.getString(1));
				if( rs.getString(1).equals(Pwd) == true && rs.getString(2).equals(Email) == true){
					tel = rs.getString(3);
					nick = rs.getString(4);
					sco = rs.getInt(5);
					qq = rs.getString(6);
					flag = true;
					break;
				}
			}
			
			if( flag == true){
				session.setAttribute("login", "ur");
				session.setAttribute("email", Email);
				session.setAttribute("pho", tel);
				session.setAttribute("nick", nick);
				session.setAttribute("sco", sco);
				session.setAttribute("qq", qq);
				session.setAttribute("info", info);
				session.setAttribute("school", school);
				rs.close();
				conn.close();
				response.sendRedirect("/SeTest/index.jsp");
			}
			
			//判断up表
			if( flag == false){
				ic=conn.prepareCall("{call select_U_P_info(?)}");//调用存储过程
				ic.setString(1, Email);//设置存储过程的参数
				rs = ic.executeQuery();//获得结果
				
				//判断是否是
				while(rs.next()){
					//System.out.println(rs.getString(1));
					if( rs.getString(1).equals(Pwd) == true && rs.getString(2).equals(Email) == true){
						tel = rs.getString(3);
						nick = rs.getString(4);
						sco = rs.getInt(5);
						school = rs.getString(6);
						info = rs.getString(7);
						qq = rs.getString(9);
						flag = true;
						break;
					}
				}
			}
			rs.close();
			conn.close();
			if( flag == true){
				session.setAttribute("login", "up");
				session.setAttribute("email", Email);
				session.setAttribute("pho", tel);
				session.setAttribute("nick", nick);
				session.setAttribute("sco", sco);
				session.setAttribute("qq", qq);
				session.setAttribute("info", info);
				session.setAttribute("school", school);
				response.sendRedirect("/SeTest/index.jsp");
			}
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
