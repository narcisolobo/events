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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class CommentController {
    private final CommentService commentService;
    private final EventService eventService;
    private final UserService userService;
    public CommentController(
            CommentService commentService,
            EventService eventService,
            UserService userService) {
        this.commentService = commentService;
        this.eventService = eventService;
        this.userService = userService;
    }

    @RequestMapping(value = "/comments/{id}/new", method = RequestMethod.POST)
    public String commentCreate(
            HttpSession session, Model model,
            @PathVariable("id") Long eventId,
            @Valid @ModelAttribute("comment") Comment comment, BindingResult result) {
        Event event = eventService.find(eventId);
        User user = userService.findUserById((Long) session.getAttribute("userId"));
        if (result.hasErrors()) {
            model.addAttribute("event", event);
            model.addAttribute("user", user);
            return "eventDisplay.jsp";
        } else {
            Comment newComment = new Comment(comment.getContent(), user, event);
            commentService.create(newComment);
            return "redirect:/events/" + eventId;
        }
    }
}
