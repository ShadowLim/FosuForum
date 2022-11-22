package cn.lbj.forum.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

public class DBUtil {

    private static Properties properties = new Properties();  // 用于获取 dbConfig.properties 的参数
    private static String driver = null;
    private static String url = null;
    private static String user = null;
    private static String pwd = null;


    static {
        try {
//            FileInputStream fis = new FileInputStream("db.properties");
//            properties.load(fis);
            properties.load(DBUtil.class.getClassLoader().getResourceAsStream("db.properties"));
            driver = properties.getProperty("driver");
            Class.forName(driver);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection(){
        Connection conn = null;
        try{
            String url = properties.getProperty("url");
            String user = properties.getProperty("user");
            String pwd = properties.getProperty("pwd");
            conn = DriverManager.getConnection(url, user, pwd);
        } catch (Exception e){
            e.printStackTrace();
        }
        return conn;
    }

    public static void close(ResultSet rs, Statement st, Connection conn){
        try {
            if(rs!=null) rs.close();
            if(st!=null) st.close();
            if(conn!=null) conn.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        System.out.println(getConnection());
    }

}
