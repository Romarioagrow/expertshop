package expertshop.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "usr")
public class User {
    @Id
    private String userID;
    @JsonIgnore
    private String password;
    private String fullName;
    private String surname;
    private String email;
    private String mobile;
    private String userPic;
    private LocalDateTime registrationDate;
    private LocalDateTime lastVisit;
}
