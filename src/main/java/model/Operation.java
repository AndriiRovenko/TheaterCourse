package model;

import java.util.Date;

/**
 * Created by andrew on 6/4/16.
 */
public class Operation {
    private int id;
    private Date orderDate;
    private Date performDate;
    private Contragent contragent;
    private OperationCategory category;
    private Product product;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getPerformDate() {
        return performDate;
    }

    public void setPerformDate(Date performDate) {
        this.performDate = performDate;
    }

    public Contragent getContragent() {
        return contragent;
    }

    public void setContragent(Contragent contragent) {
        this.contragent = contragent;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
/*
    @Override
    public String toString() {
        return String.format(
                "Product [id=%s, category=%s, product=%s, contragent=%s, orger date=%tY-%tm-%td, perform date=%tY-%tm-%td]\n",
                id, category, product, contragent, orderDate, orderDate, orderDate, performDate, performDate, performDate
        );
    }
*/
}
