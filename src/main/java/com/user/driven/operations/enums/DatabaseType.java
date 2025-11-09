package com.user.driven.operations.enums;

/**
 * Enumeration representing the supported types of databases for dynamic Spring
 * Boot project generation.
 *
 * Each enum constant corresponds to a database option that the generator can
 * configure in the generated application.
 * 
 * - H2: In-memory database ideal for testing and development. - POSTGRESQL:
 * Open-source object-relational database system. - MYSQL: Widely-used
 * open-source relational database. - MONGODB: NoSQL document-based database.
 * 
 * @author: Jatin Raheja
 */
public enum DatabaseType {

	/**
	 * H2 in-memory database, commonly used for local development and testing.
	 */
	H2,

	/**
	 * PostgreSQL database, an advanced open-source relational DBMS.
	 */
	POSTGRESQL,

	/**
	 * MySQL database, a widely-used relational database.
	 */
	MYSQL,

	/**
	 * MongoDB, a document-oriented NoSQL database.
	 */
	MONGODB
}
