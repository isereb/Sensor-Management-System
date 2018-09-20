package exceptions;

public class EntityUpdateNotAllowedException extends Exception {

    public EntityUpdateNotAllowedException() {
        super();
    }

    public EntityUpdateNotAllowedException(String msg) {
        super(msg);
    }

}
