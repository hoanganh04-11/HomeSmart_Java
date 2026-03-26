package com.smarthome.iot.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smarthome.iot.domain.Room;
import com.smarthome.iot.service.RoomService;

@Controller
public class RoomController {

    private final RoomService roomService;

    public RoomController(RoomService roomService) {
        this.roomService = roomService;
    }

    // GET /admin/room - Danh sách phòng
    @GetMapping("/admin/room")
    public String getRoomListPage(Model model) {
        List<Room> rooms = this.roomService.findAll();
        model.addAttribute("rooms", rooms);
        return "admin/room/show";
    }

    // GET /admin/room/create - Form thêm phòng
    @GetMapping("/admin/room/create")
    public String getCreateRoomPage(Model model) {
        model.addAttribute("newRoom", new Room());
        return "admin/room/create";
    }

    // POST /admin/room/create - Lưu phòng mới
    @PostMapping("/admin/room/create")
    public String createRoom(@ModelAttribute("newRoom") Room room) {
        this.roomService.save(room);
        return "redirect:/admin/room";
    }

    // GET /admin/room/{id} - Chi tiết phòng
    @GetMapping("/admin/room/{id}")
    public String getRoomDetailPage(Model model, @PathVariable Long id) {
        Room room = this.roomService.findById(id);
        model.addAttribute("room", room);
        return "admin/room/detail";
    }

    // GET /admin/room/update/{id} - Form cập nhật
    @GetMapping("/admin/room/update/{id}")
    public String getUpdateRoomPage(Model model, @PathVariable Long id) {
        Room room = this.roomService.findById(id);
        model.addAttribute("room", room);
        return "admin/room/update";
    }

    // POST /admin/room/update - Lưu cập nhật
    @PostMapping("/admin/room/update")
    public String updateRoom(@ModelAttribute("room") Room room) {
        this.roomService.save(room);
        return "redirect:/admin/room";
    }

    // GET /admin/room/delete/{id} - Xác nhận xóa
    @GetMapping("/admin/room/delete/{id}")
    public String getDeleteRoomPage(Model model, @PathVariable Long id) {
        Room room = this.roomService.findById(id);
        model.addAttribute("room", room);
        return "admin/room/delete";
    }

    // POST /admin/room/delete - Thực hiện xóa
    @PostMapping("/admin/room/delete")
    public String deleteRoom(@RequestParam Long id) {
        this.roomService.delete(id);
        return "redirect:/admin/room";
    }
}
