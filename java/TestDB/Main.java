package com.kobqd;

import oracle.jdbc.pool.OracleDataSource;

import java.sql.*;

public class Main {
    public static final String CONNECTION_STRING = "jdbc:oracle:thin:@//localhost:1521/orclpdb";
    public static final String USER = "hr";
    public static final String PASSWORD = "hr";

    public static final String TABLE_CONTACTS = "contacts";
    public static final String COLUMN_NAME = "name";
    public static final String COLUMN_PHONE = "phone";
    public static final String COLUMN_EMAIL = "email";

    public static void main(String[] args) {
//        try(Connection conn = DriverManager.getConnection
//                ("jdbc:oracle:thin:@//localhost:1521/orclpdb","hr","hr")){
        try{
//            OracleDataSource ods = new OracleDataSource();
//            String url = "jdbc:oracle:thin:@//localhost:1521/orclpdb";
//            ods.setURL(url);
//            ods.setUser("hr");
//            ods.setPassword("hr");
//            Connection conn = ods.getConnection();
//            Connection conn = DriverManager.getConnection
//                    ("jdbc:oracle:thin:@//localhost:1521/orclpdb","hr","hr");
//            Connection conn = DriverManager.getConnection
//                    ("jdbc:oracle:thin:@//localhost:1521/orclpdb","hr","hr");
            Connection conn = DriverManager.getConnection
                    (CONNECTION_STRING,USER,PASSWORD);
            //conn.setAutoCommit(false);
            Statement statement = conn.createStatement();
            String statementStr = ""
            + "declare \n"
            + "v_sql LONG;\n"
            + "begin\n"
            + "v_sql:='Create table contacts (name VARCHAR2(100), phone NUMBER, email NVARCHAR2(100))';\n"
            + "execute immediate v_sql;\n"
            + "EXCEPTION\n"
            + "WHEN OTHERS THEN\n"
            + "IF SQLCODE = -955 THEN\n"
                    +"NULL; -- suppresses ORA-00955 exception\n"
                    +"ELSE\n"
            +"RAISE;\n"
            +"END IF;\n"
            +"END;";
            statement.execute(statementStr);
//            statement.execute("Insert into contacts values ('Jane','4829484','jane@somewhere.com')");
//            statement.execute("Insert into contacts values ('Fido','9038','dog@email.com')");

//            statement.execute("Select * from contacts");
//            ResultSet results = statement.getResultSet();
            ResultSet results = statement.executeQuery("Select * from " + TABLE_CONTACTS);
            while (results.next()){
                System.out.println(results.getString(COLUMN_NAME) + " " +
                                   results.getInt(COLUMN_PHONE) + " " +
                                   results.getString(COLUMN_EMAIL));
            }
            results.close();

            //statement.execute("Create table contacts (name VARCHAR2(100), phone NUMBER, email NVARCHAR2(100))");
            //conn.rollback();
            statement.close();
            conn.close();
        }catch (SQLException e){
            System.out.println("Somrthing went wrong: " + e.getMessage());
        }
    }
}
