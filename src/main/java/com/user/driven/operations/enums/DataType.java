package com.user.driven.operations.enums;

/**
 * Enumeration representing supported data types for fields in dynamically
 * defined entities. These types guide how fields are generated and stored in
 * the database.
 * 
 * <p>
 * Supported types include:
 * </p>
 * <ul>
 * <li>STRING - Standard text field</li>
 * <li>INTEGER - Integer number (32-bit)</li>
 * <li>LONG - Long number (64-bit)</li>
 * <li>DOUBLE - Double-precision floating-point number</li>
 * <li>FLOAT - Single-precision floating-point number</li>
 * <li>BOOLEAN - True/false values</li>
 * <li>DATE - Date without time</li>
 * <li>DATETIME - Date and time</li>
 * <li>TEXT - Large text field</li>
 * <li>DECIMAL - Fixed-point decimal number</li>
 * <li>UUID - Universally unique identifier</li>
 * <li>JSON - Structured JSON object</li>
 * <li>ENUM - Custom enumeration</li>
 * </ul>
 * 
 * @author Jatin Raheja
 */
public enum DataType {
	STRING, INTEGER, LONG, DOUBLE, FLOAT, BOOLEAN, DATE, DATETIME, TEXT, DECIMAL, UUID, JSON, ENUM
}
