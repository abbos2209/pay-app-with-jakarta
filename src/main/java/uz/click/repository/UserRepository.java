package uz.click.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import uz.click.config.Configuration;
import uz.click.entity.User;

import java.util.List;
import java.util.Optional;

public class UserRepository {
    private static UserRepository instance;


    EntityManagerFactory entityManagerFactory = Configuration.getEntityManagerFactory();
    public Optional<User> findByNumber(String number) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

            entityManager.getTransaction().begin();
            TypedQuery<User> typedQuery = entityManager
                    .createNamedQuery("by.number", User.class)
                    .setParameter("number", number);
            entityManager.getTransaction().commit();
            List<User> resultList = typedQuery.getResultList();
            if (resultList.isEmpty()) {
                return Optional.empty();
            }
            return Optional.of(resultList.get(0));
    }
    public Optional<User> getUser(String id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.id = :id", User.class);
            query.setParameter("id", id);
            List<User> resultList = query.getResultList();
            if (!resultList.isEmpty()) {
                return Optional.of(resultList.get(0));
            }
        } finally {
            em.getTransaction().commit();
        }
        return Optional.empty();
    }


    public void saveUser(User user) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(user);
        }finally {
            entityManager.getTransaction().commit();
        }
    }
    public static UserRepository getInstance() {
        if (instance == null) {
            instance = new UserRepository();
        }
        return instance;
    }
}
