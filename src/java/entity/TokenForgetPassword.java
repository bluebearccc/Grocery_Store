/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import lombok.Builder;

/**
 *
 * @author HP
 */
@Builder
public class TokenForgetPassword {

    private int id, userId;
    private boolean isUsed;
    private String token;

    public TokenForgetPassword() {
    }

    public TokenForgetPassword(int id, int userId, boolean isUsed, String token) {
        this.id = id;
        this.userId = userId;
        this.isUsed = isUsed;
        this.token = token;
    }

    public TokenForgetPassword(int userId, boolean isUsed, String token) {
        this.userId = userId;
        this.isUsed = isUsed;
        this.token = token;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public boolean isIsUsed() {
        return isUsed;
    }

    public void setIsUsed(boolean isUsed) {
        this.isUsed = isUsed;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

}
