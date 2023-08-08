package model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author minh tri
 */
public class Cart {

    private Map<Integer, Product> cart;

    public Cart() {
    }

    public Cart(Map<Integer, Product> cart) {
        this.cart = cart;
    }

    public Map<Integer, Product> getCart() {
        return cart;
    }

    public void setCart(Map<Integer, Product> cart) {
        this.cart = cart;
    }

    public boolean add(Product tree) {
        boolean result = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(tree.getId())) {
            int currentQuantity = this.cart.get(tree.getId()).getQuantity();
            tree.setQuantity(currentQuantity + tree.getQuantity());

        }
        this.cart.put(tree.getId(), tree);
        result = true;
        return result;
    }

    public boolean update(Integer id, Product tree) {
        boolean result = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.replace(id, tree);
                result = true;
            }
        }

        return result;
    }

    public boolean remove(Integer id) {
        boolean result = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.remove(id);
                result = true;
            }
        }

        return result;
    }
}
