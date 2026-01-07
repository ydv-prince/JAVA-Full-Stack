package FileUpload;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/Download")
public class Download extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String query = "select * from file_upload";
    private static final String download = "select * from file_upload where id=?";

    public Download() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String id = request.getParameter("id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/employee", "root", "12345");

            if (id == null) {

            	pw.println("<html><body>");
            	pw.println("<h2>File List</h2>");
            	pw.println("<table border='1'>");
            	pw.println("<tr>");
            	pw.println("<th>ID</th>");
            	pw.println("<th>File Name</th>");
            	pw.println("<th>View</th>");
            	pw.println("<th>Download</th>");
            	pw.println("<th>Delete</th>");
            	pw.println("</tr>");


                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                	pw.println("<tr>");

                	pw.println("<td>" + rs.getInt("id") + "</td>");
                	pw.println("<td>" + rs.getString("file_name") + "</td>");

                	// VIEW
                	pw.println("<td>");
                	pw.println("<a href='View?id=" + rs.getInt("id") + "' target='_blank'>");
                	pw.println("<button>View</button>");
                	pw.println("</a>");
                	pw.println("</td>");

                	// DOWNLOAD
                	pw.println("<td>");
                	pw.println("<a href='Download?id=" + rs.getInt("id") + "'>");
                	pw.println("<button>Download</button>");
                	pw.println("</a>");
                	pw.println("</td>");

                	// DELETE
                	pw.println("<td>");
                	pw.println("<a href='Delete?id=" + rs.getInt("id") + "' "
                	        + "onclick=\"return confirm('Are you sure?')\">");
                	pw.println("<button style='color:red'>Delete</button>");
                	pw.println("</a>");
                	pw.println("</td>");

                	pw.println("</tr>");

                }

                pw.println("</table>");
                pw.println("</body></html>");

                rs.close();
                ps.close();

            } else {

                PreparedStatement ps = con.prepareStatement(download);
                ps.setInt(1, Integer.parseInt(id));

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    response.setContentType(rs.getString("file_type"));
                    response.setHeader(
                            "Content-Disposition",
                            "attachment;filename=\"" + rs.getString("file_name") + "\""
                    );

                    InputStream in = rs.getBinaryStream("file_data");
                    ServletOutputStream out = response.getOutputStream();

                    byte[] buffer = new byte[4096];
                    int byteRead;

                    while ((byteRead = in.read(buffer)) != -1) {
                        out.write(buffer, 0, byteRead);
                    }

                    in.close();
                    out.close();
                }

                rs.close();
                ps.close();
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
