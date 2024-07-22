package com.bannershallmark.compositekey;

import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class InvoiceIdentity implements Serializable {

    private Integer ponumber;
    private Integer store;
    private Integer invoicenumber;

    public InvoiceIdentity() {
    }

    public InvoiceIdentity(Integer ponumber, Integer store, Integer invoicenumber) {
        this.ponumber = ponumber;
        this.store = store;
        this.invoicenumber = invoicenumber;
    }

    public Integer getPonumber() {
        return ponumber;
    }

    public void setPonumber(Integer ponumber) {
        this.ponumber = ponumber;
    }

    public Integer getStore() {
        return store;
    }

    public void setStore(Integer store) {
        this.store = store;
    }

    public Integer getInvoicenumber() {
        return invoicenumber;
    }

    public void setInvoicenumber(Integer invoicenumber) {
        this.invoicenumber = invoicenumber;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        InvoiceIdentity that = (InvoiceIdentity) o;
        return ponumber.equals(that.ponumber) && store.equals(that.store) && invoicenumber.equals(that.invoicenumber);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ponumber, store, invoicenumber);
    }
}
