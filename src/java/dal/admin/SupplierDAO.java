package dal.admin;

import entity.Supplier;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SupplierDAO extends DBContext {

    public List<Supplier> getAllSuppliers() {
        List<Supplier> listSupplier = new ArrayList<>();
        String sql = "SELECT [supplier__id], [company__name], [contact__name], [phone] FROM [dbo].[Suppliers]";
        connection = getConnection();
        try {
            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {
                int supplierId = rs.getInt("supplier__id");
                String companyName = rs.getString("company__name");
                String contactName = rs.getString("contact__name");
                String phone = rs.getString("phone");

                listSupplier.add(new Supplier(supplierId, companyName, contactName, phone));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listSupplier;
    }

    public void editSupplier(int id, String companyName, String contactName, String phone) {
        String sql = "UPDATE [dbo].[Suppliers] "
                + "SET [company_name] = ?, "
                + "[contact_name] = ?, "
                + "[phone] = ? "
                + "WHERE [supplier_id] = ?";

        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);

            ps.setString(1, companyName);
            ps.setString(2, contactName);
            ps.setString(3, phone);
            ps.setInt(4, id);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Supplier updated successfully.");
            } else {
                System.out.println("No supplier found with the given ID.");
            }

        } catch (SQLException e) {
        }
    }

    public void deleteSupplierById(int id) {
        connection = getConnection();
        String sql = "DELETE FROM [dbo].[Suppliers]\n"
                + "      WHERE [supplier__id] = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setObject(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Supplier> searchSuppliersByCompanyName(String keyword) {
        List<Supplier> list = new ArrayList<>();

        String sql = "SELECT [supplier__id]\n"
                + "      ,[company__name]\n"
                + "      ,[contact__name]\n"
                + "      ,[phone]\n"
                + "  FROM [dbo].[Suppliers]\n"
                + "  WHERE [company__name] LIKE ?";
        connection = getConnection();
        try {
            ps = connection.prepareStatement(sql);
            ps.setObject(1, "%" + keyword + "%");

            rs = ps.executeQuery();
            while (rs.next()) {
                int supplierId = rs.getInt("supplier__id");
                String companyName = rs.getString("company__name");
                String contactName = rs.getString("contact__name");
                String phone = rs.getString("phone");
                list.add(new Supplier(supplierId, companyName, contactName, phone));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public void addNewSupplier(String companyName, String contactName, String phone) {
        String sql = "INSERT INTO [dbo].[Suppliers]\n"
                + "           ([company__name]\n"
                + "           ,[contact__name]\n"
                + "           ,[phone])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);

            ps.setString(1, companyName);
            ps.setString(2, contactName);
            ps.setString(3, phone);

            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Supplier findSupplierByID(int userID) {
        connection = getConnection();
        String sql = "SELECT [supplier__id]\n"
                + "      ,[company__name]\n"
                + "      ,[contact__name]\n"
                + "      ,[phone]\n"
                + "  FROM [dbo].[Suppliers]\n"
                + "  WHERE [supplier__id] = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setObject(1, userID);

            rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("supplier__id");
                String companyName = rs.getString("company__name");
                String contactName = rs.getString("contact__name");
                String phone = rs.getString("phone");

                return new Supplier(id, companyName, contactName, phone);
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void updateASupplierByID(int id, String newCompanyName, String newContactName, String newPhone) {
        connection = getConnection();
        String sql = "UPDATE [dbo].[Suppliers] "
                + "SET [company__name] = ?, "
                + "[contact__name] = ?, "
                + "[phone] = ? "
                + "WHERE [supplier__id] = ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, newCompanyName);
            ps.setString(2, newContactName);
            ps.setString(3, newPhone);
            ps.setInt(4, id);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
