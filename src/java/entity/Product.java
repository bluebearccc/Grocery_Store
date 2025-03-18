/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Tranh
 */
@ToString
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Product {

    private int product__id;
    private String product__name;
    private int supplier__id;
    private int category__id;
    private String quantity__per__unit;
    private float unit__price;
    private int unit__in__stock;
    private int quantity__sold;
    private int star__rating;
    private String image;
    private String describe;
    private Date release__date;
   
}
