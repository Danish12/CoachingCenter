package com.fagnum.services.dao.impl;

import com.fagnum.services.dao.ImageDao;
import com.fagnum.services.model.Images;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("imageDao")
public class ImageDaoImpl extends AbstractDaoImpl<Images, String> implements ImageDao {

    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;

    public List<Images> findByImage(String type) {
        Session session = sessionFactory.openSession();

        List<Images> images = null;
        try {
            String queryStr = "from Images image where image.type = ?";

            Query query = session.createQuery(queryStr);
            query.setParameter(0, type);

            images = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return images;

    }
}