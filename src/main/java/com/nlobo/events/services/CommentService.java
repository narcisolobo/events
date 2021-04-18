package com.nlobo.events.services;

import com.nlobo.events.models.Comment;
import com.nlobo.events.models.Event;
import com.nlobo.events.models.User;
import com.nlobo.events.repositories.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    private final CommentRepository commentRepository;
    public CommentService(CommentRepository commentRepository) { this.commentRepository = commentRepository; }

    public List<Comment> findAll() {
        return commentRepository.findAll();
    }

    public Comment create(Comment comment) {
        return commentRepository.save(comment);
    }
}
