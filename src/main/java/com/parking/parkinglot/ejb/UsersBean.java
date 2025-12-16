package com.parking.parkinglot.ejb;

import com.parking.parkinglot.common.UserDto;
import com.parking.parkinglot.entities.User;
import com.parking.parkinglot.entities.UserGroup;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class UsersBean {
    private static final Logger LOG = Logger.getLogger(UsersBean.class.getName());

    @PersistenceContext
    EntityManager entityManager;

    public List<UserDto> findAllUsers() {
        LOG.info("findAllUsers");

        try {
            TypedQuery<User> query = entityManager.createQuery(
                    "SELECT u FROM User u", User.class
            );

            return copyUsersToDto(query.getResultList());
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public Collection<String> findUsernamesByUserIds(Collection<Long> userIds) {
        return entityManager.createQuery(
                        "SELECT u.username FROM User u WHERE u.id IN :userIds",
                        String.class)
                .setParameter("userIds", userIds)
                .getResultList();
    }


    private List<UserDto> copyUsersToDto(List<User> users) {
        List<UserDto> list = new ArrayList<>();

        for (User user : users) {
            list.add(new UserDto(
                    user.getId(),
                    user.getUsername(),
                    user.getEmail()
            ));
        }

        return list;
    }

    @Inject
    PasswordBean passwordBean;

    public void createUser(String username, String email, String password, Collection<String> groups) {
        LOG.info("createUser");
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setEmail(email);

        newUser.setPassword(passwordBean.convertToSha256(password));
        entityManager.persist(newUser);
        assignGroupsToUser(username, groups);
    }

    private void assignGroupsToUser(String username, Collection<String> groups) {
        LOG.info("assignGroupsToUser");
        for (String group : groups) {
            UserGroup userGroup = new UserGroup();
            userGroup.setUsername(username);
            userGroup.setUserGroup(group);
            entityManager.persist(userGroup);
        }
    }
}
