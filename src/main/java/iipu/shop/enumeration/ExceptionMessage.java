package iipu.shop.enumeration;

public enum ExceptionMessage {
    USER_NOT_FOUND_BY_EMAIL("User with email %s not found"),
    MAIL_IS_TAKEN("Mail %s is already taken"),
    ;

    private final String message;

    ExceptionMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return message;
    }
}
