/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author admin
 */
@ToString
@Builder
@Data
@AllArgsConstructor
@Getter
@Setter
public class Cart {

    private List<Item> Items;

    public Cart() {
        Items = new ArrayList<>();
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    public Item getItemById(int id) {
        for (Item Item1 : Items) {
            if (Item1.getProductId() == id) {
                return Item1;
            }
        }
        return null;
    }

    public void addItem(Item i) {
        if (getItemById(i.getProductId()) != null) {
            Item m = getItemById(i.getProductId());
            m.setQuantity(m.getQuantity() + i.getQuantity());
        } else {
            Items.add(i);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            Items.remove(getItemById(id));
        }
    }

    public double getTotalMoney() {
        double t = 0;
        for (Item i : Items) {
            t += i.getQuantity() * i.getPrice();
        }
        return t;
    }
}
