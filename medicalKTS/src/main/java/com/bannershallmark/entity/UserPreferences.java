package com.bannershallmark.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "userpreferences")
public class UserPreferences {

    @Id
    @Column(name = "preferenceId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String preferenceName;
    private String preferenceValue;

    public UserPreferences() {
        super();
        // TODO Auto-generated constructor stub
    }

    public UserPreferences(String preferenceName, String preferenceValue) {
        this.preferenceName = preferenceName;
        this.preferenceValue = preferenceValue;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPreferenceName() {
        return preferenceName;
    }

    public void setPreferenceName(String preferenceName) {
        this.preferenceName = preferenceName;
    }

    public String getPreferenceValue() {
        return preferenceValue;
    }

    public void setPreferenceValue(String preferenceValue) {
        this.preferenceValue = preferenceValue;
    }
}
