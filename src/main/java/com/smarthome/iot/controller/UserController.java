package com.smarthome.iot.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smarthome.iot.domain.User;
import com.smarthome.iot.service.UserService;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // GET /admin/user - Danh sách user
    @GetMapping("/admin/user")
    public String getUserListPage(Model model) {
        List<User> users = this.userService.findAll();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    // GET /admin/user/create - Form tạo user
    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // POST /admin/user/create - Lưu user mới
    @PostMapping("/admin/user/create")
    public String createUser(@ModelAttribute("newUser") User user) {
        if (this.userService.existsByUsername(user.getUsername())) {
            return "redirect:/admin/user/create?error=duplicate";
        }
        this.userService.createUser(user);
        return "redirect:/admin/user";
    }

    // GET /admin/user/update/{id} - Form cập nhật
    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable Long id) {
        User user = this.userService.findById(id);
        model.addAttribute("user", user);
        return "admin/user/update";
    }

    // POST /admin/user/update - Lưu cập nhật
    @PostMapping("/admin/user/update")
    public String updateUser(@ModelAttribute("user") User user) {
        this.userService.updateUser(user);
        return "redirect:/admin/user";
    }

    // GET /admin/user/delete/{id} - Xác nhận xóa
    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable Long id) {
        User user = this.userService.findById(id);
        model.addAttribute("user", user);
        return "admin/user/delete";
    }

    // POST /admin/user/delete - Thực hiện xóa
    @PostMapping("/admin/user/delete")
    public String deleteUser(@RequestParam Long id) {
        this.userService.deleteUser(id);
        return "redirect:/admin/user";
    }
}
