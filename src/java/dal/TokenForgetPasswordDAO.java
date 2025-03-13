package dal;

import entity.TokenForgetPassword;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TokenForgetPasswordDAO extends DBContext {

    private String getFormatDate(LocalDateTime myDateObj) {
        return myDateObj.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public boolean insertNewToken(TokenForgetPassword tokenForget) {
        String sql = "INSERT INTO [dbo].[tokenForgetPassword]\n"
                + "           ([token]\n"
                + "           ,[isUsed]\n"
                + "           ,[userId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setObject(1, tokenForget.getToken());
            ps.setObject(2, Timestamp.valueOf(getFormatDate(tokenForget.getExpiryTime())));
            ps.setObject(3, tokenForget.isUsed());
            ps.setObject(4, tokenForget.getUserId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
        }
        return false;
    }
}
