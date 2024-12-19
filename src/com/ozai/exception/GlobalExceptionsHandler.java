package com.ozai.exception;

import java.sql.SQLException;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class GlobalExceptionsHandler {

	/*@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value = NullPointerException.class)
	public String handleNullPointerException(Exception exception) {
		System.out.println("Null pointer exception occured " + exception);
		return "/exceptions/npe-view";
	}*/
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value = SQLException.class)
	public String handleSQException(Exception exception) {
		System.out.println("SQL exception occured " + exception);
		return "/exceptions/sqlexp-view";
	}

}
