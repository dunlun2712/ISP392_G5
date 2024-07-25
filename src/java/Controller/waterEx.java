/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Model.water;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author DELL
 */
@WebServlet(name = "water", urlPatterns = {"/water"})
@MultipartConfig
public class waterEx extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("admin/water.jsp").forward(request, response);
    }

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
                water ex = new water();
                ex.setUsage_type(row.getCell(0).getStringCellValue());
                ex.setRoom_id(row.getCell(1).getStringCellValue());
                ex.setCreation_date(new Date(row.getCell(2).getDateCellValue().getTime()));
                ex.setExpiration_date(new Date(row.getCell(3).getDateCellValue().getTime()));
                ex.setSemester(row.getCell(4).getStringCellValue());
                ex.setMeter_number(row.getCell(5).getStringCellValue());
                ex.setNew_reading(row.getCell(6).getNumericCellValue());
                ex.setOld_reading(row.getCell(7).getNumericCellValue());
                ex.setConsumption(row.getCell(8).getNumericCellValue());
                insertDatabase(ex);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("mess", "Upload sucess");
        
        response.sendRedirect("waterimport");
    }

    private void insertDatabase(water data) {
        DBContext dbContext = new DBContext();
        try (Connection connection = dbContext.getConnection()) {
            String sql = "INSERT INTO Water (room_id,usage_type,creation_date,"
                    + "expiration_date,semester,"
                    + "meter_number,new_reading,old_reading,consumption)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);  
            statement.setString(1, data.getRoom_id());
            statement.setString(2, data.getUsage_type());
            statement.setDate(3, data.getCreation_date());
            statement.setDate(4, data.getExpiration_date());
            statement.setString(5, data.getSemester());
            statement.setString(6, data.getMeter_number());
            statement.setDouble(7, data.getNew_reading());
            statement.setDouble(8, data.getOld_reading());
            statement.setDouble(9, data.getConsumption());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
