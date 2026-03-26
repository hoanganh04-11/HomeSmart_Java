package com.smarthome.iot.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smarthome.iot.domain.Room;
import com.smarthome.iot.domain.Sensor;
import com.smarthome.iot.domain.SensorData;
import com.smarthome.iot.service.RoomService;
import com.smarthome.iot.service.SensorDataService;
import com.smarthome.iot.service.SensorService;

@Controller
public class SensorController {

    private final SensorService sensorService;
    private final RoomService roomService;
    private final SensorDataService sensorDataService;

    public SensorController(SensorService sensorService, RoomService roomService, SensorDataService sensorDataService) {
        this.sensorService = sensorService;
        this.roomService = roomService;
        this.sensorDataService = sensorDataService;
    }

    // GET /admin/sensor - Danh sách cảm biến (phân trang)
    @GetMapping("/admin/sensor")
    public String getSensorListPage(Model model,
            @RequestParam(defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 10);
        Page<Sensor> sensors = this.sensorService.getAllSensors(pageable);
        model.addAttribute("sensors", sensors.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", sensors.getTotalPages());
        return "admin/sensor/show";
    }

    // GET /admin/sensor/create - Form thêm mới cảm biến
    @GetMapping("/admin/sensor/create")
    public String getCreateSensorPage(Model model) {
        model.addAttribute("newSensor", new Sensor());
        List<Room> rooms = this.roomService.findAll();
        model.addAttribute("rooms", rooms);
        return "admin/sensor/create";
    }

    // POST /admin/sensor/create - Lưu cảm biến mới
    @PostMapping("/admin/sensor/create")
    public String createSensor(Model model,
            @ModelAttribute("newSensor") Sensor sensor,
            @RequestParam("roomId") Long roomId) {
        Room room = this.roomService.findById(roomId);
        sensor.setRoom(room);
        this.sensorService.saveSensor(sensor);
        return "redirect:/admin/sensor";
    }

    // GET /admin/sensor/{id} - Chi tiết cảm biến + dữ liệu từ ESP32
    @GetMapping("/admin/sensor/{id}")
    public String getSensorDetailPage(Model model, @PathVariable Long id) {
        Sensor sensor = this.sensorService.getSensorById(id);
        List<SensorData> sensorDataList = this.sensorDataService.getLatestData(id);
        model.addAttribute("sensor", sensor);
        model.addAttribute("sensorDataList", sensorDataList);
        return "admin/sensor/detail";
    }

    // GET /admin/sensor/update/{id} - Form cập nhật
    @GetMapping("/admin/sensor/update/{id}")
    public String getUpdateSensorPage(Model model, @PathVariable Long id) {
        Sensor sensor = this.sensorService.getSensorById(id);
        model.addAttribute("sensor", sensor);
        List<Room> rooms = this.roomService.findAll();
        model.addAttribute("rooms", rooms);
        return "admin/sensor/update";
    }

    // POST /admin/sensor/update - Lưu thông tin cập nhật
    @PostMapping("/admin/sensor/update")
    public String updateSensor(Model model,
            @ModelAttribute("sensor") Sensor sensor,
            @RequestParam("roomId") Long roomId) {
        Room room = this.roomService.findById(roomId);
        sensor.setRoom(room);
        this.sensorService.saveSensor(sensor);
        return "redirect:/admin/sensor";
    }

    // GET /admin/sensor/delete/{id} - Trang xác nhận xóa
    @GetMapping("/admin/sensor/delete/{id}")
    public String getDeleteSensorPage(Model model, @PathVariable Long id) {
        Sensor sensor = this.sensorService.getSensorById(id);
        model.addAttribute("sensor", sensor);
        return "admin/sensor/delete";
    }

    // POST /admin/sensor/delete - Thực hiện xóa
    @PostMapping("/admin/sensor/delete")
    public String deleteSensor(@RequestParam Long id) {
        this.sensorService.deleteSensor(id);
        return "redirect:/admin/sensor";
    }
}
