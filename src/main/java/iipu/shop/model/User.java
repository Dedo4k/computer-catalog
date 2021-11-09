package iipu.shop.model;

import iipu.shop.enumeration.UserRole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Collection;
import java.util.Collections;

@Data
@Entity
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "\"user\"")
public class User implements UserDetails {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "First name should not be empty.")
    @Size(min = 2, max = 30, message = "First name size should be between 2 and 30.")
    @Column(name = "first_name", nullable = false)
    private String firstName;

    @NotNull(message = "Last name should not be empty.")
    @Size(min = 2, max = 30, message = "Last name size should be between 2 and 30.")
    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Email(message = "Email should be valid.")
    @NotNull(message = "Email should not be empty.")
    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @NotNull(message = "Password should not be empty.")
    @Column(name = "password", nullable = false)
    @Size(min = 5, message = "Password size must be more than 5")
    private String password;

    @Enumerated(EnumType.STRING)
    private UserRole role;

    @Column(name = "active", nullable = false)
    private boolean active;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.name());
        return Collections.singleton(authority);
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return active;
    }
}
