package com.user.driven.operations.enums;

/**
 * Enumeration representing the different types of security mechanisms that can
 * be implemented in the application to protect resources and manage user
 * authentication and authorization.
 * 
 * <p>
 * Each security type provides a different approach to handling user access and
 * ensuring that the application is secure:
 * </p>
 *
 * <ul>
 * <li><b>JWT</b>: JSON Web Token - A compact, URL-safe means of representing
 * claims to be transferred between two parties.
 * <li><b>OAUTH2</b>: OAuth 2.0 - A protocol that allows third-party
 * applications to obtain limited access to an HTTP service.</li>
 * <li><b>SESSION_BASED</b>: Session-based authentication - Traditional approach
 * where the server creates a session after the user logs in and stores the
 * session ID in a cookie.</li>
 * <li><b>BASIC_AUTH</b>: Basic Authentication - A simple authentication scheme
 * built into the HTTP protocol, sending a base64-encoded username and password
 * with each request.</li>
 * </ul>
 * 
 * @author Jatin Raheja
 */
public enum SecurityType {
	JWT, OAUTH2, SESSION_BASED, BASIC_AUTH
}
