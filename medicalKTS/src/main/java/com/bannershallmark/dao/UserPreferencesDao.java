package com.bannershallmark.dao;

import java.util.List;
import com.bannershallmark.entity.UserPreferences;

public interface UserPreferencesDao {

    UserPreferences findById(Integer id);

    void save(UserPreferences userPreferences);

    List<UserPreferences> findAll();

    void deleteById(Integer id);

    List<UserPreferences> getAllPreferences();
}
