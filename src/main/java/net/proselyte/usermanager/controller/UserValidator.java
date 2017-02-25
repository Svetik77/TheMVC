package net.proselyte.usermanager.controller;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import net.proselyte.usermanager.model.Users;
/* <bean id="messageSource" in mvc dispatcher also work 
 * name can be empty  */

@Component
public class UserValidator  implements Validator {
	  
    private final static String AGE = "age";

	@Override
	public boolean supports(Class<?> clazz) {
		return Users.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Users users = (Users) target;	
		Integer age = users.getAge();
		
		 ValidationUtils.rejectIfEmpty(errors, "name", "users.name.empty");
	        ValidationUtils.rejectIfEmpty(errors, AGE, "users.age.empty");
	         
	        if (age != null && age < 1)
	            errors.rejectValue(AGE, "users.age.lessThenOne");
	}

}
