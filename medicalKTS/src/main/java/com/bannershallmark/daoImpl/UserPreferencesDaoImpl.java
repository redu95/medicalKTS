package com.bannershallmark.daoImpl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.bannershallmark.dao.UserPreferencesDao;
import com.bannershallmark.entity.UserPreferences;

@Repository
@Service
public class UserPreferencesDaoImpl implements UserPreferencesDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public UserPreferences findById(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(UserPreferences.class, id);
    }

    @Override
    @Transactional
    public void save(UserPreferences userPreferences) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(userPreferences);
    }

    @Override
    @Transactional
    public List<UserPreferences> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query<UserPreferences> query = session.createQuery("from UserPreferences", UserPreferences.class);
        return query.getResultList();
    }

    @Override
    @Transactional
    public void deleteById(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        UserPreferences userPreferences = session.get(UserPreferences.class, id);
        if (userPreferences != null) {
            session.delete(userPreferences);
        }
    }

    @Override
    @Transactional
    public List<UserPreferences> getAllPreferences() {
        Session session = sessionFactory.getCurrentSession();
        Query<UserPreferences> query = session.createQuery("from UserPreferences", UserPreferences.class);
        return query.getResultList();
    }
}
