package com.company.cicdjenkins.model;


import lombok.*;
import org.springframework.data.annotation.Id;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Book {
    @Id
    private String id;
    private String title;
    private String author;
}
