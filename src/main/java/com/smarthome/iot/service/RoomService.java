package com.smarthome.iot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.smarthome.iot.domain.Room;
import com.smarthome.iot.repository.RoomRepository;

@Service
public class RoomService {

    private final RoomRepository roomRepository;

    public RoomService(RoomRepository roomRepository) {
        this.roomRepository = roomRepository;
    }

    public List<Room> findAll() {
        return this.roomRepository.findAll();
    }

    public Room findById(Long id) {
        return this.roomRepository.findById(id).orElse(null);
    }

    public Room save(Room room) {
        return this.roomRepository.save(room);
    }

    public void delete(Long id) {
        this.roomRepository.deleteById(id);
    }

    public long count() {
        return this.roomRepository.count();
    }
}
