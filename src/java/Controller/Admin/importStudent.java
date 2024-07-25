package Controller.Admin;



import Model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author tranm
 */
@WebServlet(name = "importStudent", urlPatterns = {"/importstudent"})
@MultipartConfig // Thêm chú thích này để xử lý các yêu cầu multipart/form-data
public class importStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Your GET handling code here
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part filePart = request.getPart("file");
        File file = new File(System.getProperty("java.io.tmpdir") + filePart.getSubmittedFileName());
        filePart.write(file.getAbsolutePath());

        try (FileInputStream fis = new FileInputStream(file); Workbook workbook = new XSSFWorkbook(fis)) {
            Sheet sheet = workbook.getSheetAt(0);
            for (Row row : sheet) {
                if (row.getRowNum() == 0) {
                    continue;
                }
                Student student = new Student();

                student.setName(row.getCell(0).getStringCellValue());
                student.setPass(row.getCell(1).getStringCellValue());
                student.setEmail(row.getCell(2).getStringCellValue());
                student.setCccd(row.getCell(3).getStringCellValue());
                student.setMajor(row.getCell(4).getStringCellValue());
                student.setCourse(row.getCell(5).getStringCellValue());
                student.setAddress(row.getCell(6).getStringCellValue());

                student.setDob(row.getCell(7).getStringCellValue());
                student.setGender(row.getCell(8).getStringCellValue());
                student.setEthnicity(row.getCell(9).getStringCellValue());
                student.setNation(row.getCell(10).getStringCellValue());
                student.setPhone_num(row.getCell(11).getStringCellValue());
                student.setRelative_name(row.getCell(12).getStringCellValue());
                student.setRelative_contact(row.getCell(13).getStringCellValue());
                student.setStatus(row.getCell(14).getStringCellValue());

                insertDatabase(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("mess", "Upload success");
        request.getRequestDispatcher("admin/admin.jsp?type=viewstudent").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public importStudent() {
        connectDB();
    }

    protected Connection cnn; // Connect to database
    PreparedStatement stm; // Execute SQL statements
    ResultSet rs; // Store and process data

    // Initialize database connection
    private void connectDB() {
        try {
            // Thay đổi các thông số kết nối cho phù hợp
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            cnn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ISP392;user=sa;password=123");
            if (cnn != null) {
                System.out.println("Connection successful");
            } else {
                System.out.println("Connection failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void insertDatabase(Student data) {
        try {
            String sql = "INSERT INTO [dbo].[Users]\n"
                    + "           ([role], [users_name], [pass], [email], [cccd], [major], [course], [address], [dob], [gender], [ethnicity], [nation], [phone_number], [relative_name], [relatives_contact], [status])\n"
                    + "     VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stm = cnn.prepareStatement(sql);

            stm.setString(1, "0");
            stm.setString(2, data.getName());
            stm.setString(3, data.getPass());
            stm.setString(4, data.getEmail());
            stm.setString(5, data.getCccd());
            stm.setString(6, data.getMajor());
            stm.setString(7, data.getCourse());
            stm.setString(8, data.getAddress());
            stm.setDate(9, Date.valueOf(data.getDob()));
            stm.setString(10, data.getGender());
            stm.setString(11, data.getEthnicity());
            stm.setString(12, data.getNation());
            stm.setString(13, data.getPhone_num());
            stm.setString(14, data.getRelative_name());
            stm.setString(15, data.getRelative_contact());
            stm.setString(16, data.getStatus());

            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
