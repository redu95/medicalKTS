package com.bannershallmark.service;

import java.util.List;
import com.bannershallmark.entity.UserPreferences;

public interface UserPreferencesService {

    UserPreferences findById(Integer id);

    void saveUserPreferences(UserPreferences userPreferences);

    List<UserPreferences> getAllUserPreferences();

    void deleteUserPreferencesById(Integer id);

    List<UserPreferences> getAllPreferences();


}
