package repository;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static repository.BaseRepository.getConnection;

public class UserRepository  implements  IUserRepository{

    private static final String INSERT_USERS_SQL = "insert into users(name,email,country) values(?,?,?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id=?";
    private static final String SELECT_ALL_USER = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id=?";
    private static final String UPDATE_USERS_sQL = "update users set name = ?,email = ?,country = ? where id =?;";

    private static final String SEARCH_USERS_SQL = "select * from users where name like ?";

    public UserRepository(){
    }


    @Override
    public void insertUser(User user) {
        try {
            PreparedStatement preparedStatement = getConnection()
                    .prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @Override
    public User selectUser(int id) {
        try {
            PreparedStatement preparedStatement = getConnection()
                    .prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet set = preparedStatement.executeQuery();
            User user =  new User();
            if (set.next()){
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setCountry(set.getString("country"));


                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> selectAllUsers() {
        Connection connection = getConnection();
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);
            ResultSet set = preparedStatement.executeQuery();
            while (set.next()){
                User user = new User();
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setCountry(set.getString("country"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
            return userList;
    }

    @Override
    public boolean deleteUser(int id) {

        try(Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
                statement.setInt(1,id);
               return  statement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateUser(User user) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_sQL);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            preparedStatement.setInt(4,user.getId());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    @Override
    public List<User> search(String name) {
        Connection connection = BaseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_USERS_SQL);
            preparedStatement.setString(1,"%" + name + "%");
            ResultSet set = preparedStatement.executeQuery();
            while (set.next()){
                User user = new User();
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setCountry(set.getString("country"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
}
