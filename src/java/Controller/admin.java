/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.AccDao;
import Dao.StudentDao;
import Model.Account;
import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.stream.Collectors;

@WebServlet(name = "admin", urlPatterns = {"/admin"})
public class admin extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        if (acc == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        String type = request.getParameter("type");
        String searchQuery = request.getParameter("search");
        String searchColumn = request.getParameter("column");

        StudentDao d = new StudentDao();
        ArrayList<Student> student = d.getAllStudent();

        if (searchQuery != null && !searchQuery.isEmpty() && searchColumn != null && !searchColumn.isEmpty()) {
            String searchQueryLower = searchQuery.toLowerCase();
            student = (ArrayList<Student>) student.stream()
                    .filter(s -> {
                        if ("all".equals(searchColumn)) {
                            return s.getName().toLowerCase().contains(searchQueryLower)
                                    || s.getId().toLowerCase().contains(searchQueryLower)
                                    || s.getGender().toLowerCase().contains(searchQueryLower)
                                    || s.getEmail().toLowerCase().contains(searchQueryLower)
                                    || s.getDob().toLowerCase().contains(searchQueryLower)
                                    || s.getCccd().toLowerCase().contains(searchQueryLower)
                                    || s.getMajor().toLowerCase().contains(searchQueryLower)
                                    || s.getCourse().toLowerCase().contains(searchQueryLower)
                                    || s.getAddress().toLowerCase().contains(searchQueryLower)
                                    || s.getEthnicity().toLowerCase().contains(searchQueryLower)
                                    || s.getNation().toLowerCase().contains(searchQueryLower)
                                    || s.getPhone_num().toLowerCase().contains(searchQueryLower)
                                    || s.getRelative_name().toLowerCase().contains(searchQueryLower)
                                    || s.getRelative_contact().toLowerCase().contains(searchQueryLower)
                                    || s.getCreate_date().toLowerCase().contains(searchQueryLower)
                                    || s.getUpdate_date().toLowerCase().contains(searchQueryLower)
                                    || s.getStatus().toLowerCase().contains(searchQueryLower);
                        } else {
                            switch (searchColumn) {
                                case "name":
                                    return s.getName().toLowerCase().contains(searchQueryLower);
                                case "id":
                                    return s.getId().toLowerCase().contains(searchQueryLower);
                                case "gender":
                                    return s.getGender().toLowerCase().contains(searchQueryLower);
                                case "email":
                                    return s.getEmail().toLowerCase().contains(searchQueryLower);
                                case "dob":
                                    return s.getDob().toLowerCase().contains(searchQueryLower);
                                case "cccd":
                                    return s.getCccd().toLowerCase().contains(searchQueryLower);
                                case "major":
                                    return s.getMajor().toLowerCase().contains(searchQueryLower);
                                case "course":
                                    return s.getCourse().toLowerCase().contains(searchQueryLower);
                                case "address":
                                    return s.getAddress().toLowerCase().contains(searchQueryLower);
                                case "ethnicity":
                                    return s.getEthnicity().toLowerCase().contains(searchQueryLower);
                                case "nation":
                                    return s.getNation().toLowerCase().contains(searchQueryLower);
                                case "phone_num":
                                    return s.getPhone_num().toLowerCase().contains(searchQueryLower);
                                case "relative_name":
                                    return s.getRelative_name().toLowerCase().contains(searchQueryLower);
                                case "relative_contact":
                                    return s.getRelative_contact().toLowerCase().contains(searchQueryLower);
                                case "create_date":
                                    return s.getCreate_date().toLowerCase().contains(searchQueryLower);
                                case "update_date":
                                    return s.getUpdate_date().toLowerCase().contains(searchQueryLower);
                                case "status":
                                    return s.getStatus().toLowerCase().contains(searchQueryLower);
                                default:
                                    return false;
                            }
                        }
                    })
                    .collect(Collectors.toList());
        }

        session.setAttribute("data", student);
        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("searchColumn", searchColumn);
        if (type != null) {
            switch (type) {
                case "viewstudent":

                    request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
                    break;
                case "viewmanager":
                    searchQuery = request.getParameter("search");
                    String searchStatus = request.getParameter("status");
                    AccDao accDao = new AccDao();
                    ArrayList<Account> account;
                    if ((searchQuery != null && !searchQuery.isEmpty()) || (searchStatus != null && !searchStatus.isEmpty())) {
                        account = accDao.searchAccounts(searchQuery != null ? searchQuery : "", searchStatus != null ? searchStatus : "");
                    } else {
                        account = accDao.getAllAcc();
                    }
                    request.setAttribute("data", account);
                    request.getRequestDispatcher("admin/viewmanager.jsp").forward(request, response);
                    break;
                default:
                    // Handle other cases if needed
                    break;
            }
        } else {
            request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String save = (String) request.getParameter("save");

        switch (save) {
            case "update_acc":
                AccDao accDao = new AccDao();
                ArrayList<Account> accounts = accDao.getAllAcc();
                for (Account account : accounts) {
                    String email = account.getEmail();
                    int newRole = '0';
                    String newStatus = request.getParameter("status_" + email);
                    if (request.getParameter("role_" + email) != null) {
                        newRole = Integer.parseInt(request.getParameter("role_" + email));
                    }
                    if (newStatus != null && (!newStatus.equals(account.getStatus()) || newRole != Integer.parseInt(account.getRole()))) {
                        accDao.updateAcc(email, newRole, newStatus);
                    }
                }
                // After updating, redirect back to the view manager page
                response.sendRedirect(request.getContextPath() + "/admin?type=viewmanager");
                break;
            case "update_student":
                StudentDao dao = new StudentDao();
                ArrayList<Student> students = dao.getAllStudent();

                for (Student i : students) {
                    String newStatus = request.getParameter("status_" + i.getId());
                    if (newStatus != null && !newStatus.equals(i.getStatus())) {
                        i.setStatus(newStatus);
                        dao.updateStudentStatus(i.getId(), newStatus);
                    }
                }
                response.sendRedirect("admin?type=viewstudent&search=s&column=all&dorm=");

                break;

        }

    }
}
