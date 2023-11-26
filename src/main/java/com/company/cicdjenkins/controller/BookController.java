package com.company.cicdjenkins.controller;


import com.company.cicdjenkins.model.Book;
import com.company.cicdjenkins.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController("/book")
@RequiredArgsConstructor
public class BookController {
    private final BookRepository bookRepository;

    @PostMapping
    public Book add(@RequestBody Book book) {

        return bookRepository.save(book);
    }

    @GetMapping
    public List<Book> all() {
        return bookRepository.findAll();
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable String id) {
        bookRepository.deleteById(id);
    }
}
