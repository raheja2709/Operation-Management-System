package com.user.driven.operations.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.user.driven.operations.dto.ApiResponseDTO;
import com.user.driven.operations.dto.TodoItemDTO;
import com.user.driven.operations.service.TodoService;
import com.user.driven.operations.utils.ApiPathConstants;

import jakarta.validation.Valid;

@RestController
@RequestMapping(ApiPathConstants.TODO_API)
public class TodoController {

	@Autowired
	TodoService todoService;

	@PostMapping
	public ApiResponseDTO creatTodoItem(@Valid @RequestBody TodoItemDTO todoItem) {
		return todoService.createTodoItem(todoItem);
	}
}
