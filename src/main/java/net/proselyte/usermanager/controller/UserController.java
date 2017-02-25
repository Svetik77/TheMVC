package net.proselyte.usermanager.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.proselyte.usermanager.model.Users;
import net.proselyte.usermanager.service.UserService;

@Controller
public class UserController {
	private UserService userService;
	private final int total = 5;

	@Autowired
    private UserValidator userValidator;
	
	@Autowired(required = true)
	@Qualifier(value = "userService")
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	 @InitBinder
	    private void initBinder(WebDataBinder binder) {
	        binder.setValidator(userValidator);
	    }
	
// http://localhost:8082/UserManger/index.jsp
	@RequestMapping(value = "userspage/search", method = RequestMethod.GET)
	public String findOneUser(Model model, String name, Users userForm) {
		String output ="";
		List<Users> listFoundsUsers = new ArrayList<>();
		
		List<Users> listAllUsers = this.userService.listUsers();
		for (Users searchUser : listAllUsers) {
			if (searchUser.getName() != null && searchUser.getName().equalsIgnoreCase(name)) {
				output = searchUser.getName();
				listFoundsUsers .add(searchUser);
			}
		}

		List<Users> userByName = new ArrayList<>();
		if (userForm.getName().equalsIgnoreCase(name)) {
			output ="You search User with name: " +  name + "";
			userByName = this.userService.getUserByName(name);
		} 
		model.addAttribute("userSearchForm", new Users());
		model.addAttribute("output", output);
		model.addAttribute("userByName", userByName);
		model.addAttribute("listFoundsUsers", listFoundsUsers);
		return "search";
	}

	@RequestMapping(value = "userspage", method = RequestMethod.GET)
	public String listUsersPages2(Model model, @RequestParam("page") int pageid, Map<String, Object> obmessages) {
		obmessages.put("pagesMessage", new Users());
		int index = 0;
		if (pageid == 1) {
		} else {
			pageid = pageid - 1;
//			pageid = pageid * total + 1;
	    	index = pageid * total + 1;
		}
//		List<Users> listUsersPages2 = this.userService.listUsersPages(pageid, total);
		List<Users> listUsersPages2 = this.userService.listUsersPages(index, total);
//		int listsize = listUsersPages2.size();
		
		List<Users> listUsersPagesAll = this.userService.listUsers();
		int sizeList = listUsersPagesAll.size();
		int numberOfPages = 0;
		if (sizeList % total == 0) {
			numberOfPages = sizeList / total;
		} else {
			numberOfPages = sizeList / total + 1;
		}
		
		if (pageid == (numberOfPages -1)) {
			model.addAttribute("nomoreusers", "yes");
		}
		
		model.addAttribute("user", new Users());
		model.addAttribute("listUsersPages", listUsersPages2);
		model.addAttribute("listUsersPagesAll", listUsersPagesAll);
		model.addAttribute("numberOfPages", numberOfPages);
		return "userspage";  // simple return
	}

	@RequestMapping(value = "/userspage/modify", method = RequestMethod.POST)
	public String addUser(@Valid @ModelAttribute("user") Users userForm, BindingResult result) {
		if (userForm.getId() == 0) {
			if (result.hasErrors()) {
				return "LoginForm";
			}
			this.userService.addUser(userForm);
		} else {
			if (result.hasErrors()) {
				return "LoginForm";
			}
			this.userService.updateUser(userForm);
		}
		return "redirect:/userspage?page=1";
	}

	@RequestMapping("/remove/{id}")
	public String removeUser(@PathVariable("id") int id) {
		this.userService.removeUser(id);
		return "redirect:/userspage?page=1";
	}

	@RequestMapping("edit/{id}")
	public String editUser(@PathVariable("id") int id, Model model) {
		model.addAttribute("user", this.userService.getUserById(id));
		model.addAttribute("listUsers", this.userService.listUsers());
		return "userspage";
	}

	@RequestMapping("userdata/{id}")
	public String userData(@PathVariable("id") int id, Model model) {
		model.addAttribute("user", this.userService.getUserById(id));
		return "userdata";
	}
}
