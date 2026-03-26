package com.smarthome.iot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smarthome.iot.domain.Sensor;

@Repository
public interface SensorRepository extends JpaRepository<Sensor, Long> {
}
