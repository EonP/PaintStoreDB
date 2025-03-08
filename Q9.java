import java.io.*;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

import static java.lang.StringTemplate.STR;

/**
 * Generates 350 records for the customer table from randomly generated files of names, address and emails
 */
public class Q9 {
    public static void main(String[] args) {
        File names = new File("random_names.txt");
        File addresses = new File("random_addresses.txt");
        List<String> domains = List.of("@hotmail.com", "@gmail.com", "@yahoo.ca");
        File customers = new File("customer_Data.sql");
        Random rdm = new Random();

        try (Scanner rNames = new Scanner(names);
             Scanner rAddresses = new Scanner(addresses);
             Writer wCustomers = new FileWriter(customers)) {

            for (int i = 0; i < 350; i += 1) {
                if (!rNames.hasNextLine() || !rAddresses.hasNextLine()) break;
                String firstName = rNames.next();
                String lastName = rNames.next();
                String address = rAddresses.nextLine();
                String domain = domains.get(rdm.nextInt(domains.size()));
                String email = STR."\{firstName.toLowerCase()}.\{lastName.toLowerCase()}\{domain}";

                wCustomers.write(STR."INSERT INTO customer VALUES(\{email}, '\{firstName} \{lastName}', '\{address}');\n");
            }
        } catch (IOException e) {}
    }
}
