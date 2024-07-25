package Controller.Admin;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import dal.DBContext;
import Dao.ElectricDAO;
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
import java.sql.Date;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.electric;
import org.apache.poi.ss.usermodel.CellType;

/**
 *
 * @author DELL
 */
@WebServlet(urlPatterns = {"/upload1"})
@MultipartConfig
public class upload1 extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part filePart = request.getPart("file");
        File file = new File(System.getProperty("java.io.tmpdir") + filePart.getSubmittedFileName());
        filePart.write(file.getAbsolutePath());

        try (FileInputStream fis = new FileInputStream(file); Workbook workbook = new XSSFWorkbook(fis)) {
            Sheet sheet = workbook.getSheetAt(0);
            for (Row row : sheet) {
                if (row.getRowNum() == 0) { // Skip header row
                    continue;
                }
                electric data = new electric();
                data.setRoom_id(row.getCell(0).getStringCellValue());
                data.setUsage_type(row.getCell(1).getStringCellValue());
                data.setCreation_date(new Date(row.getCell(2).getDateCellValue().getTime()));
                data.setExpiration_date(new Date(row.getCell(3).getDateCellValue().getTime()));
                data.setSemester(row.getCell(4).getStringCellValue());
                data.setMeter_number(row.getCell(5).getStringCellValue());
                data.setConsumption(row.getCell(6).getNumericCellValue());
                data.setOld_number(row.getCell(7).getNumericCellValue());
                data.setNew_number(row.getCell(8).getNumericCellValue());
                insertDatabase(data);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("elecimport");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void insertDatabase(electric data) {
        DBContext dbContext = new DBContext();
        try (Connection connection = dbContext.getConnection()) {
            String sql = "INSERT INTO Electricity (room_id,usage_type, creation_date, expiration_date, "
                    + "semester, meter_number, consumption, old_number, new_number)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, data.getRoom_id());
            statement.setString(2, data.getUsage_type());
            statement.setDate(3, data.getCreation_date());
            statement.setDate(4, data.getExpiration_date());
            statement.setString(5, data.getSemester());
            statement.setString(6, data.getMeter_number());
            statement.setDouble(7, data.getConsumption());
            statement.setDouble(8, data.getOld_number());
            statement.setDouble(9, data.getNew_number());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
