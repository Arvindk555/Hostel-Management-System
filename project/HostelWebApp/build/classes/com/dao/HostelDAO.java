package com.dao;

import com.model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class HostelDAO {

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        String url = "jdbc:mysql://localhost:3308/hosteldb";
        String username = "root";
        String password = "";

        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, username, password);
    }

    public boolean addStudent(Student s) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO HostelStudents(StudentID, StudentName, RoomNumber, AdmissionDate, FeesPaid, PendingFees) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, s.getStudentID());
            ps.setString(2, s.getStudentName());
            ps.setString(3, s.getRoomNumber());
            ps.setDate(4, s.getAdmissionDate());
            ps.setDouble(5, s.getFeesPaid());
            ps.setDouble(6, s.getPendingFees());
            ps.executeUpdate();
            
            return true;
        } catch (SQLIntegrityConstraintViolationException e) {
            // This exception is thrown when studentID already exists
            System.out.println("Duplicate StudentID detected: " + e.getMessage());
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
            
        }
    }

    public void updateStudent(Student s) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE HostelStudents SET StudentName=?, RoomNumber=?, AdmissionDate=?, FeesPaid=?, PendingFees=? WHERE StudentID=?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getStudentName());
            ps.setString(2, s.getRoomNumber());
            ps.setDate(3, s.getAdmissionDate());
            ps.setDouble(4, s.getFeesPaid());
            ps.setDouble(5, s.getPendingFees());
            ps.setInt(6, s.getStudentID());
            ps.executeUpdate();
        }
    }

    public void deleteStudent(int studentID) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM HostelStudents WHERE StudentID=?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, studentID);
            ps.executeUpdate();
        }
    }

    public List<Student> getAllStudents() throws SQLException, ClassNotFoundException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Student s = extractStudentFromResultSet(rs);
                list.add(s);
            }
        }
        return list;
    }

    public List<Student> getStudentsWithPendingFees() throws SQLException, ClassNotFoundException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE PendingFees > 0";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Student s = extractStudentFromResultSet(rs);
                list.add(s);
            }
        }
        return list;
    }

    public List<Student> getStudentsByRoom(String roomNumber) throws SQLException, ClassNotFoundException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE RoomNumber = ?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, roomNumber);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Student s = extractStudentFromResultSet(rs);
                    list.add(s);
                }
            }
        }
        return list;
    }

    public List<Student> getStudentsByDateRange(Date startDate, Date endDate) throws SQLException, ClassNotFoundException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE AdmissionDate BETWEEN ? AND ?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, new java.sql.Date(startDate.getTime()));
            ps.setDate(2, new java.sql.Date(endDate.getTime()));
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Student s = extractStudentFromResultSet(rs);
                    list.add(s);
                }
            }
        }
        return list;
    }

    private Student extractStudentFromResultSet(ResultSet rs) throws SQLException {
        Student s = new Student();
        s.setStudentID(rs.getInt("StudentID"));
        s.setStudentName(rs.getString("StudentName"));
        s.setRoomNumber(rs.getString("RoomNumber"));
        s.setAdmissionDate(rs.getDate("AdmissionDate"));
        s.setFeesPaid(rs.getDouble("FeesPaid"));
        s.setPendingFees(rs.getDouble("PendingFees"));
        return s;
    }
}
