package beans;


import java.sql.Timestamp;
import java.util.Objects;

public class UserEntity extends AbstractEntity implements Comparable<UserEntity> {

    private String username;

    private String email;
    private String password;
    private String name;
    private int phone;
    private Timestamp lastLogin;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public UserEntity() {}
    public UserEntity(String username, String password) {
        setUsername(username);
        setPassword(password);
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getPhone() {
        return phone;
    }
    public void setPhone(int phone) {
        this.phone = phone;
    }

    public Timestamp getLastLogin() {
        return lastLogin;
    }
    public void setLastLogin(Timestamp lastLogin) {
        this.lastLogin = lastLogin;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }
    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public int compareTo(UserEntity user) {
        return this.getId() - user.getId();
    }



    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserEntity that = (UserEntity) o;
        return getId() == that.getId() &&
            phone == that.phone &&
            Objects.equals(username, that.username) &&
            Objects.equals(email, that.email) &&
            Objects.equals(password, that.password) &&
            Objects.equals(name, that.name);
    }

    @Override
    public String toString() {
        return "UserEntity { username: " + username +
            ", password: " + password +
            ", email: " + email +
            ", name: " + name;
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), username, email, password, name, phone, lastLogin, createdAt, updatedAt);
    }

}
