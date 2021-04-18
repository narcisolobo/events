package com.nlobo.events.controllers;

import com.nlobo.events.models.Comment;
import com.nlobo.events.models.Event;
import com.nlobo.events.models.User;
import com.nlobo.events.services.CommentService;
import com.nlobo.events.services.EventService;
import com.nlobo.events.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class EventController {
    private final UserService userService;
    private final EventService eventService;
    public EventController(
            UserService userService,
            EventService eventService,
            CommentService commentService) {
        this.userService = userService;
        this.eventService = eventService;
    }

    // display all events
    @RequestMapping(value = "/events")
    public String events(HttpSession session, Model model) {
        User user = userService.findUserById((Long) session.getAttribute("userId"));
        List<Event> events = eventService.findAll();
        model.addAttribute("user", user);
        model.addAttribute("event", new Event());
        model.addAttribute("events", events);
        return "events.jsp";
    }

    // create event
    @RequestMapping(value = "/events/new", method = RequestMethod.POST)
    public String eventCreate(
            @Valid @ModelAttribute("event") Event event, BindingResult result,
            HttpSession session, Model model) {
        if (result.hasErrors()) {
            User user = userService.findUserById((Long) session.getAttribute("userId"));
            List<Event> events = eventService.findAll();
            model.addAttribute("user", user);
            model.addAttribute("events", events);
            return "events.jsp";
        } else {
            eventService.create(event);
            return "redirect:/events";
        }
    }

    // display one event
    @RequestMapping(value = "/events/{id}")
    public String eventDisplay(
            @PathVariable("id") Long eventId,
            HttpSession session, Model model) {
        Event event = eventService.find(eventId);
        model.addAttribute("comment", new Comment());
        model.addAttribute("event", event);
        model.addAttribute("user", userService.findUserById((Long) session.getAttribute("userId")));
        return "eventDisplay.jsp";
    }

    // show edit event form
    @RequestMapping(value = "/events/{id}/edit", method = RequestMethod.GET)
    public String eventEditForm(
            @PathVariable("id") Long eventId,
            HttpSession session, Model model) {
        Event event = eventService.find(eventId);
        model.addAttribute("event", event);
        model.addAttribute("user", userService.findUserById((Long) session.getAttribute("userId")));
        return "eventEdit.jsp";
    }

    // update event
    @RequestMapping(value = "/events/{id}/edit", method = RequestMethod.PUT)
    public String eventUpdate(
            Model model,
            @Valid @ModelAttribute("event") Event event, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("event", event);
            return "eventEdit.jsp";
        } else {
            eventService.edit(event);
            return "redirect:/events/" + event.getId();
        }
    }

    // delete event
    @RequestMapping(value = "/events/{id}/delete", method = RequestMethod.DELETE)
    public String eventDelete(@PathVariable("id") Long id) {
        Event event = eventService.find(id);
        eventService.delete(event);
        return "redirect:/events";
    }

    // join event
    @RequestMapping(value = "/events/{id}/join")
    public String eventJoin(@PathVariable("id") Long eventId, HttpSession session) {
        Event event = eventService.find(eventId);
        User user = userService.findUserById((Long)session.getAttribute("userId"));
        eventService.addUserToEvent(event, user);
        return "redirect:/events";
    }

    // leave event
    @RequestMapping(value = "/events/{id}/leave")
    public String eventLeave(@PathVariable("id") Long eventId, HttpSession session) {
        Event event = eventService.find(eventId);
        User user = userService.findUserById((Long)session.getAttribute("userId"));
        eventService.removeUserFromEvent(event, user);
        return "redirect:/events";
    }
}
