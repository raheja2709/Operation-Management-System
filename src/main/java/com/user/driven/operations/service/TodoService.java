package com.user.driven.operations.service;

import com.user.driven.operations.dto.ApiResponseDTO;
import com.user.driven.operations.dto.TodoItemDTO;

public interface TodoService {

	public ApiResponseDTO createTodoItem(TodoItemDTO todoItemDTO);
}
