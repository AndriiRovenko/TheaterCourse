package model;

/**
 * Created by andrew on 6/4/16.
 */
public class Product {
    private int id;
    private String name;
    private String description;
    private int price;
    private ProductCategory category;
    private Location location;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public ProductCategory getCategory() {
        return category;
    }

    public void setCategory(ProductCategory category) {
        this.category = category;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    /*
    @Override
    public String toString() {
        return String.format(
                "Product [id=%s, category=%s, location=%s, state=%s, name=%s, description=%s, price=%s]\n",
                id, category, location, name, description, price
        );
    }
*/
}
