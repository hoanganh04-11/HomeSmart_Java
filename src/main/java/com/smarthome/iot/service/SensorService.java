package com.smarthome.iot.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.smarthome.iot.domain.Sensor;
import com.smarthome.iot.repository.SensorRepository;

@Service
public class SensorService {

    private final SensorRepository sensorRepository;

    public SensorService(SensorRepository sensorRepository) {
        this.sensorRepository = sensorRepository;
    }

    public Page<Sensor> getAllSensors(Pageable pageable) {
        return this.sensorRepository.findAll(pageable);
    }

    public Sensor getSensorById(Long id) {
        Optional<Sensor> sensor = this.sensorRepository.findById(id);
        return sensor.orElse(null);
    }

    public Sensor saveSensor(Sensor sensor) {
        return this.sensorRepository.save(sensor);
    }

    public void deleteSensor(Long id) {
        this.sensorRepository.deleteById(id);
    }

    public long count() {
        return this.sensorRepository.count();
    }
}
