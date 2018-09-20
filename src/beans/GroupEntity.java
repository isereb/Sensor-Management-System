package beans;

import java.util.Collection;
import java.util.Objects;

public class GroupEntity extends AbstractEntity {

    private String name;

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GroupEntity that = (GroupEntity) o;
        return id == that.id &&
            Objects.equals(name, that.name);
    }

}
