package com.nlobo.events.services;

import com.nlobo.events.models.Event;
import com.nlobo.events.models.User;
import com.nlobo.events.repositories.EventRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EventService {
    private final EventRepository eventRepository;
    public EventService(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }

    public List<Event> findAll() {
        return eventRepository.findAll();
    }

    public Event create(Event event) {
        return eventRepository.save(event);
    }

    public Event find(Long id) {
        Optional<Event> optionalEvent = eventRepository.findById(id);
        if (optionalEvent.isPresent()) {
            return optionalEvent.get();
        } else {
            return null;
        }
    }

    public Event edit(Event event) { return eventRepository.save(event); }

    public void delete(Event event) { eventRepository.delete(event); }

    public void addUserToEvent(Event event, User user) {
        event.getUsersJoined().add(user);
        eventRepository.save(event);
    }

    public void removeUserFromEvent(Event event, User user) {
        event.getUsersJoined().remove(user);
        eventRepository.save(event);
    }
}
