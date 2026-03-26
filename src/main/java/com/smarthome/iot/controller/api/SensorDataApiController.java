package com.smarthome.iot.controller.api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smarthome.iot.domain.SensorData;
import com.smarthome.iot.service.SensorDataService;

/**
 * REST API Controller - Luồng 2: ESP32 gửi dữ liệu cảm biến lên server.
 * 
 * ESP32 gửi HTTP POST request lên endpoint này.
 * Spring nhận data → Service → Repository → lưu DB.
 * Trang JSP (Luồng 1) sẽ đọc từ DB để hiển thị.
 * 
 * === Ví dụ ESP32 gửi data ===
 * 
 * URL: POST http://<server-ip>:8080/api/v1/sensor-data
 * Content-Type: application/json
 * Body:
 * {
 *     "sensorId": 1,
 *     "value": 28.5,
 *     "unit": "°C"
 * }
 * 
 * === Code mẫu Arduino/ESP32 ===
 * 
 * HTTPClient http;
 * http.begin("http://192.168.1.100:8080/api/v1/sensor-data");
 * http.addHeader("Content-Type", "application/json");
 * String json = "{\"sensorId\":1,\"value\":28.5,\"unit\":\"°C\"}";
 * int httpCode = http.POST(json);
 */
@RestController
@RequestMapping("/api/v1")
public class SensorDataApiController {

    private final SensorDataService sensorDataService;

    public SensorDataApiController(SensorDataService sensorDataService) {
        this.sensorDataService = sensorDataService;
    }

    /**
     * ESP32 gửi dữ liệu cảm biến lên đây.
     * POST /api/v1/sensor-data
     * Body: { "sensorId": 1, "value": 28.5, "unit": "°C" }
     */
    @PostMapping("/sensor-data")
    public ResponseEntity<Map<String, Object>> receiveSensorData(@RequestBody Map<String, Object> payload) {
        Map<String, Object> response = new HashMap<>();

        try {
            // Đọc dữ liệu từ payload ESP32 gửi lên
            Long sensorId = Long.valueOf(payload.get("sensorId").toString());
            Double value = Double.valueOf(payload.get("value").toString());
            String unit = payload.containsKey("unit") ? payload.get("unit").toString() : "";

            // Lưu vào DB qua Service → Repository
            SensorData saved = this.sensorDataService.saveData(sensorId, value, unit);

            if (saved == null) {
                response.put("status", "error");
                response.put("message", "Sensor ID " + sensorId + " không tồn tại");
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
            }

            response.put("status", "ok");
            response.put("message", "Đã nhận dữ liệu thành công");
            response.put("dataId", saved.getId());
            response.put("value", saved.getValue());
            response.put("recordedAt", saved.getRecordedAt().toString());
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "Dữ liệu không hợp lệ: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }

    /**
     * ESP32 gửi nhiều dữ liệu cùng lúc (batch).
     * POST /api/v1/sensor-data/batch
     * Body: [
     *   { "sensorId": 1, "value": 28.5, "unit": "°C" },
     *   { "sensorId": 2, "value": 65.0, "unit": "%" }
     * ]
     */
    @PostMapping("/sensor-data/batch")
    public ResponseEntity<Map<String, Object>> receiveBatchData(@RequestBody java.util.List<Map<String, Object>> payloads) {
        Map<String, Object> response = new HashMap<>();
        int success = 0;
        int failed = 0;

        for (Map<String, Object> payload : payloads) {
            try {
                Long sensorId = Long.valueOf(payload.get("sensorId").toString());
                Double value = Double.valueOf(payload.get("value").toString());
                String unit = payload.containsKey("unit") ? payload.get("unit").toString() : "";

                SensorData saved = this.sensorDataService.saveData(sensorId, value, unit);
                if (saved != null) {
                    success++;
                } else {
                    failed++;
                }
            } catch (Exception e) {
                failed++;
            }
        }

        response.put("status", "ok");
        response.put("received", success);
        response.put("failed", failed);
        return ResponseEntity.ok(response);
    }
}
