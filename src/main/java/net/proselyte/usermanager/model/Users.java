package net.proselyte.usermanager.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;


@Entity
@Table(name = "users")
public class Users {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

  @NumberFormat(style = Style.NUMBER)
    @Column(name = "age")
    private Integer age;

	@Column(name = "admin")
	private boolean admin = Boolean.FALSE;


	@Column(name = "createddate")
	private Timestamp createddate;
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
   @NotNull
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	 @Range(min = 1, max = 150) //age need between 1 and 150
	 @NotNull
	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Timestamp getCreateddate() {
		return createddate;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public void setCreateddate(Timestamp createddate) {
		this.createddate = createddate;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", age=" + age + ", admin=" + admin + ", createddate="
				+ createddate + "]";
	}

}
