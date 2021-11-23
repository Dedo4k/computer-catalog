package iipu.shop.enumeration;

public enum ExceptionMessage {
    USER_NOT_FOUND_BY_EMAIL("User with email %s not found"),
    MAIL_IS_TAKEN("Mail %s is already taken"),
    INVALID_CONFIRM_PASSWORD("Passwords don\'t match."),
    EMPTY_FIELDS("Fields must not be empty."),
    MESSAGE_IS_EMPTY("Comment must be not empty."),
    NOT_DOUBLE_INPUT("Input must be integer or double.")
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
