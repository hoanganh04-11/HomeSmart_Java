package com.smarthome.iot.service;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.smarthome.iot.domain.User;
import com.smarthome.iot.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public List<User> findAll() {
        return this.userRepository.findAll();
    }

    public User findById(Long id) {
        return this.userRepository.findById(id).orElse(null);
    }

    public User findByUsername(String username) {
        return this.userRepository.findByUsername(username).orElse(null);
    }

    public boolean existsByUsername(String username) {
        return this.userRepository.existsByUsername(username);
    }

    public User createUser(User user) {
        // Mã hóa password trước khi lưu
        user.setPassword(this.passwordEncoder.encode(user.getPassword()));
        return this.userRepository.save(user);
    }

    public User updateUser(User user) {
        User existing = this.userRepository.findById(user.getId()).orElse(null);
        if (existing == null) return null;

        existing.setUsername(user.getUsername());
        existing.setEmail(user.getEmail());
        existing.setFullName(user.getFullName());
        existing.setRole(user.getRole());

        // Chỉ cập nhật password nếu có nhập mới (không rỗng)
        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            existing.setPassword(this.passwordEncoder.encode(user.getPassword()));
        }

        return this.userRepository.save(existing);
    }

    public void deleteUser(Long id) {
        this.userRepository.deleteById(id);
    }

    public long count() {
        return this.userRepository.count();
    }

    /**
     * Tạo tài khoản admin mặc định nếu chưa có user nào trong DB.
     */
    public void initDefaultAdmin() {
        if (this.userRepository.count() == 0) {
            User admin = new User();
            admin.setUsername("admin");
            admin.setPassword(this.passwordEncoder.encode("admin123"));
            admin.setFullName("Administrator");
            admin.setEmail("admin@smarthome.com");
            admin.setRole(User.Role.ADMIN);
            this.userRepository.save(admin);
            System.out.println(">>> Đã tạo tài khoản admin mặc định: admin / admin123");
        }
    }
}
