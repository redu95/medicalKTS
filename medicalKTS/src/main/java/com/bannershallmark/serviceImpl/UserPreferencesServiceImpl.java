package com.bannershallmark.serviceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.bannershallmark.dao.UserPreferencesDao;
import com.bannershallmark.entity.UserPreferences;
import com.bannershallmark.service.UserPreferencesService;

@Service
public class UserPreferencesServiceImpl implements UserPreferencesService {

    @Autowired
    private UserPreferencesDao userPreferencesDao;

    @Override
    @Transactional
    public UserPreferences findById(Integer id){
        return userPreferencesDao.findById(id);
    }

    @Override
    @Transactional
    public void saveUserPreferences(UserPreferences userPreferences) {
        userPreferencesDao.save(userPreferences);
    }

    @Override
    @Transactional
    public List<UserPreferences> getAllUserPreferences() {
        return userPreferencesDao.findAll();
    }

    @Override
    @Transactional
    public void deleteUserPreferencesById(Integer id) {
        userPreferencesDao.deleteById(id);
    }

    @Override
    @Transactional
    public List<UserPreferences> getAllPreferences() {
        return userPreferencesDao.getAllPreferences();
    }
}
