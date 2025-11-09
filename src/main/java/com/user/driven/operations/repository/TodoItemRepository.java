package com.user.driven.operations.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.user.driven.operations.entities.TodoItem;

public interface TodoItemRepository extends JpaRepository<TodoItem, Integer> {

}
