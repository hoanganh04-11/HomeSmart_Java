package com.smarthome.iot.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.smarthome.iot.domain.Room;
import com.smarthome.iot.domain.Sensor;
import com.smarthome.iot.domain.SensorData;
import com.smarthome.iot.service.RoomService;
import com.smarthome.iot.service.SensorDataService;
import com.smarthome.iot.service.SensorService;

@Controller
public class ClientController {

    private final RoomService roomService;
    private final SensorService sensorService;
    private final SensorDataService sensorDataService;

    public ClientController(RoomService roomService, SensorService sensorService,
                            SensorDataService sensorDataService) {
        this.roomService = roomService;
        this.sensorService = sensorService;
        this.sensorDataService = sensorDataService;
    }

    // Client Dashboard - Xem tổng quan các phòng
    @GetMapping("/client/dashboard")
    public String getClientDashboard(Model model) {
        List<Room> rooms = this.roomService.findAll();
        model.addAttribute("rooms", rooms);
        return "client/dashboard";
    }

    // Client - Xem chi tiết phòng + dữ liệu sensor
    @GetMapping("/client/room/{id}")
    public String getRoomDetail(Model model, @PathVariable Long id) {
        Room room = this.roomService.findById(id);
        model.addAttribute("room", room);

        // Lấy danh sách sensor của phòng này
        if (room != null && room.getSensors() != null) {
            // Với mỗi sensor, lấy 10 bản ghi mới nhất
            for (Sensor sensor : room.getSensors()) {
                List<SensorData> latestData = this.sensorDataService.getLatestData(sensor.getId());
                sensor.setLatestData(latestData);
            }
        }

        return "client/room-detail";
    }

    // Client - Xem chi tiết 1 sensor
    @GetMapping("/client/sensor/{id}")
    public String getSensorDetail(Model model, @PathVariable Long id) {
        Sensor sensor = this.sensorService.getSensorById(id);
        List<SensorData> sensorDataList = this.sensorDataService.getLatestData(id);
        model.addAttribute("sensor", sensor);
        model.addAttribute("sensorDataList", sensorDataList);
        return "client/sensor-detail";
    }
}
