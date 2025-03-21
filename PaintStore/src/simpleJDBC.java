import java.sql.* ;
import java.util.ArrayList;
import java.util.Scanner;

class simpleJDBC {
    private static Connection con;
    private static Statement statement;
    private static Scanner scanner;

    private static final String SOCS_USER = "SOCSUSER";
    private static final String SOCS_PASSWD = "SOCSPASSWD";
    private static final String WELCOME_MESSAGE = "Paint Store Management System";
    private static final String SELECT_OPTION = "Please Enter Your Option: ";
    private static final String TAB = "\t";
    private static final ArrayList<String> OPTIONS = new ArrayList<String>() {{
        add("List sales generated by every store");
        add("Add new Employee");
        add("Search for a product by name substring");
        add("Change the discount percentage of a product");
        add("Issue refund for online purchase");
        add("Biggest purchase in every store");
    }};
    private static final ArrayList<Runnable> HANDLERS = new ArrayList<>() {{
        add(() -> {
            try {
                String query =
                """
                WITH TEMP_INSTORE AS (
                SELECT STORE.s_id, s_address, COALESCE(SUM(amount), 0) AS total_amount
                FROM STORE
                LEFT JOIN EMPLOYEE ON STORE.s_id = EMPLOYEE.s_id
                LEFT JOIN INSTORE ON EMPLOYEE.e_id = INSTORE.e_id
                LEFT JOIN PURCHASE ON INSTORE.p_id = PURCHASE.p_id
                GROUP BY STORE.s_id, s_address
                ),
                TEMP_ONLINE AS (
                SELECT STORE.s_id, s_address, COALESCE(SUM(amount), 0) AS total_amount
                FROM STORE
                LEFT JOIN ONLINE ON STORE.s_id = ONLINE.s_id
                LEFT JOIN PURCHASE ON ONLINE.p_id = PURCHASE.p_id
                GROUP BY STORE.s_id, s_address
                )
                SELECT TEMP_INSTORE.s_id, TEMP_INSTORE.s_address,
                TEMP_INSTORE.total_amount + TEMP_ONLINE.total_amount AS total_amount
                FROM TEMP_INSTORE
                LEFT JOIN TEMP_ONLINE ON TEMP_INSTORE.s_id = TEMP_ONLINE.s_id
                ORDER BY TEMP_INSTORE.s_id ASC;
                """;
                ResultSet rs = statement.executeQuery(query);
                System.out.printf("%-10s%-20s%-10s%n", "Store ID", "Address", "Total Amount");
                System.out.println("-".repeat(40));
                while (rs.next()) {
                    System.out.printf("%-10s%-20s%10s%n", rs.getString("s_id"), rs.getString("s_address"), rs.getString("total_amount"));
                }
                System.out.println("-".repeat(40));
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
            System.out.println("Press Enter to Continue...");
            scanner.nextLine();
        });
        add(() -> {
            try {
                System.out.print("Enter the full name: "); String fullName = scanner.nextLine();
                System.out.print("Enter the store ID: "); String storeID = scanner.nextLine(); Integer.parseInt(storeID);
                String query =
                String.format("""
                INSERT INTO EMPLOYEE (e_id, e_name, s_id)
                SELECT MAX(e_id) + 1, '%s', %s
                FROM EMPLOYEE;
                """, fullName, storeID);
                statement.executeUpdate(query);
                System.out.println("Employee added successfully!");
                String query2 = "SELECT MAX(e_id) FROM EMPLOYEE";
                ResultSet rs = statement.executeQuery(query2);
                while (rs.next()) {
                    System.out.println(" Given Employee ID: " + rs.getString(1));
                }
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            } catch (NumberFormatException e) {
                System.out.println("Error: Invalid input");
            }
            System.out.println("Press Enter to Continue...");
            scanner.nextLine();
        });
        add(() -> {
            try {
                System.out.print("Enter the product name: "); String productName = scanner.nextLine();
                String query =
                String.format("""
                SELECT p_id, p_name, unit_price, description, discount_pourcentage
                FROM PRODUCT
                WHERE p_name LIKE '%%%s%%';
                """, productName);
                ResultSet rs = statement.executeQuery(query);
                System.out.printf("%-20s%-20s%-20s%-50s%-10s%n", "Product ID", "Product Name", "Unit Price", "Description", "Discount");
                System.out.println("-".repeat(120));
                while (rs.next()) {
                    System.out.printf("%-20s%-20s%-20s%-50s%-10s%n", rs.getString("p_id"), rs.getString("p_name"), rs.getString("unit_price"), rs.getString("description"), rs.getString("discount_pourcentage"));
                }
                System.out.println("-".repeat(120));
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
            System.out.println("Press Enter to Continue...");
            scanner.nextLine();
        });
        add(() -> {
            try {
                System.out.print("Enter the product ID: "); String productID = scanner.nextLine(); Integer.parseInt(productID);
                System.out.print("Enter the new discount percentage: "); String discount = scanner.nextLine(); Integer.parseInt(discount);
                String query =
                String.format("""
                UPDATE PRODUCT
                SET discount_pourcentage = %s
                WHERE p_id = %s;
                """, discount, productID);
                statement.executeUpdate(query);
                System.out.println("Discount percentage updated successfully!");
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            } catch (NumberFormatException e) {
                System.out.println("Error: Invalid input");
            }
            System.out.println("Press Enter to Continue...");
            scanner.nextLine();
        });
        add(() -> {
            // enter customer email then look for all his online purchases select one purchase and delete it
            try {
                System.out.print("Enter the Customer email: "); String customerEmail = scanner.nextLine();
                String query =
                String.format("""
                SELECT ONLINE.p_id, amount, p_date, p_time
                FROM ONLINE
                JOIN PURCHASE ON ONLINE.p_id = PURCHASE.p_id
                WHERE email = '%s';
                """, customerEmail);
                ResultSet rs = statement.executeQuery(query);
                System.out.printf("%-10s%-10s%-20s%-20s%n", "Purchase ID", "Amount", "Date", "Time");
                ArrayList<String> purchaseIDs = new ArrayList<>();
                System.out.println("-".repeat(60));
                while (rs.next()) {
                    System.out.printf("%-10s%-10s%-20s%-20s%n", rs.getString("p_id"), rs.getString("amount"), rs.getString("p_date"), rs.getString("p_time"));
                    purchaseIDs.add(rs.getString("p_id"));
                }
                System.out.println("-".repeat(60));
                System.out.print("Enter the Purchase ID to refund: "); String purchaseID = scanner.nextLine(); Integer.parseInt(purchaseID);
                if (!purchaseIDs.contains(purchaseID)) {
                    System.out.println("Error: Purchase ID not found");
                    System.out.println("Press Enter to Continue...");
                    scanner.nextLine();
                    return;
                }

                // delete the purchase
                statement.executeUpdate(String.format("""
                DELETE FROM ONLINE WHERE p_id = %s;
                """, purchaseID));
                statement.executeUpdate(String.format("""
                DELETE FROM CONTAINS_PURCHASE WHERE purchase_id = %s;
                """, purchaseID));
                statement.executeUpdate(String.format("""
                DELETE FROM PURCHASE WHERE p_id = %s;
                """, purchaseID));
                System.out.println("Refund issued successfully!");
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            } catch (NumberFormatException e) {
                System.out.println("Error: Invalid input");
            }
            System.out.println("Press Enter to Continue...");
            scanner.nextLine();
        });
        add(() -> {
            try {
                String query =
                """
                SELECT STORE.s_id, s_address, COALESCE(MAX(amount), 0) AS max_purchase_amount
                FROM STORE
                LEFT JOIN EMPLOYEE ON STORE.s_id = EMPLOYEE.s_id
                LEFT JOIN INSTORE ON EMPLOYEE.e_id = INSTORE.e_id
                LEFT JOIN PURCHASE ON INSTORE.p_id = PURCHASE.p_id
                GROUP BY STORE.s_id, s_address
                ORDER BY STORE.s_id ASC;
                """;
                ResultSet rs = statement.executeQuery(query);
                System.out.printf("%-10s%-20s%-10s%n", "Store ID", "Address", "Total Amount");
                System.out.println("-".repeat(40));
                while (rs.next()) {
                    System.out.printf("%-10s%-20s%10s%n", rs.getString("s_id"), rs.getString("s_address"), rs.getString("max_purchase_amount"));
                }
                System.out.println("-".repeat(40));
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
            System.out.println("Press Enter to Continue...");
            scanner.nextLine();
        });
    }};

    public static void main ( String [ ] args ) throws SQLException {
        assert OPTIONS.size() == HANDLERS.size();

        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE

        // Register the driver.  You must register the driver before you can use it.
        //try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
        //catch (Exception cnfe){ System.out.println("Class not found"); }

        // This is the url you must use for DB2.
        //Note: This url may not valid now ! Check for the correct year and semester and server name.
        String url = "jdbc:db2://winter2025-comp421.cs.mcgill.ca:50000/comp421";

        //TODO: REMEMBER to remove your user id and password before submitting your code!!
        String your_userid = "cs421g02";
        String your_password = "Comp421-G#02";
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if(your_userid == null && (your_userid = System.getenv(SOCS_USER)) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv(SOCS_PASSWD)) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }

        // connect to server
        initAndConnect(url, your_userid, your_password);

        // main loop
        int quitOptionNumber = OPTIONS.size() + 1;
        boolean quit = false;
        while (!quit) {
            clearScreen();
            System.out.println(WELCOME_MESSAGE);
            for (int i = 0; i < OPTIONS.size(); ++i){
                System.out.println(TAB + (i + 1) + ". " + OPTIONS.get(i));
            }
            System.out.println(TAB + quitOptionNumber +". " + "Quit");
            System.out.print(SELECT_OPTION);

            int option = 0;
            while (option < 1 || option > OPTIONS.size() + 1) {
                try {
                    option = Integer.parseInt(scanner.nextLine());
                    if (option < 1 || option > OPTIONS.size() + 1) {
                        System.out.print("Invalid option. Try again: ");
                    }
                } catch (NumberFormatException e) {
                    System.out.print("Invalid option. Try again: ");
                    continue;
                }
            }

            if (option == quitOptionNumber) {
                quit = true;
                continue;
            }

            clearScreen();
            int index = option - 1;
            HANDLERS.get(index).run();
        }


        close(con, statement, scanner);
    }

    public static void clearScreen() {
        System.out.print("\033[H\033[2J");
        System.out.flush();
    }

    public static void initAndConnect(String url, String userid, String password) throws SQLException {
        con = DriverManager.getConnection(url, userid, password); ;
        statement = con.createStatement() ;
        scanner = new Scanner(System.in);
    }

    public static void close (Connection con, Statement statement, Scanner scanner) throws SQLException {
        con.close();
        statement.close();
        scanner.close();
    }
}
