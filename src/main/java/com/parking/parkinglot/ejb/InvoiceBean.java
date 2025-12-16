package com.parking.parkinglot.ejb;
import jakarta.ejb.Stateful;
import jakarta.ejb.Stateless;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Named
@SessionScoped
@Stateful
public class InvoiceBean implements Serializable {
    Set <Long> userIds = new HashSet<>();

    public Set <Long> getUserIds() {
        return userIds;
    }

    public void setUserIds(Set <Long> userIds) {
        this.userIds = userIds;
    }
}
