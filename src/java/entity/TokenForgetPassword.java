package entity;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TokenForgetPassword {

    private int id;
    private int userId;
    private boolean isUsed;
    private String token;
    private LocalDateTime expiryTime;

    public TokenForgetPassword(int userId, boolean isUsed, String token, LocalDateTime expiryTime) {
        this.userId = userId;
        this.isUsed = isUsed;
        this.token = token;
        this.expiryTime = expiryTime;
    }
}
