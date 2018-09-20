package beans;

public class AccessEntity {
    private int id;
    private int group;
    private int user;
    private long givenAt;
    private GroupEntity groupByGroup;
    private UserEntity userByUser;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getGroup() {
        return group;
    }
    public void setGroup(int group) {
        this.group = group;
    }

    public int getUser() {
        return user;
    }
    public void setUser(int user) {
        this.user = user;
    }

    public long getGivenAt() {
        return givenAt;
    }
    public void setGivenAt(long givenAt) {
        this.givenAt = givenAt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AccessEntity that = (AccessEntity) o;
        return id == that.id &&
            group == that.group &&
            user == that.user &&
            givenAt == that.givenAt;
    }

}
