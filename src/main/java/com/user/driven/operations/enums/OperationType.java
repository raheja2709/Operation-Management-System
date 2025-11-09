package com.user.driven.operations.enums;

/**
 * Enumeration representing the various types of operations that can be
 * configured and applied to an entity in the system.
 *
 * <p>
 * These operations cover standard CRUD functionalities as well as advanced
 * behaviors like bulk processing, file operations, integration support, and
 * system-level features such as auditing and versioning.
 * </p>
 *
 * <ul>
 * <li><b>CREATE</b>: Create a new record</li>
 * <li><b>READ</b>: Retrieve an existing record</li>
 * <li><b>UPDATE</b>: Modify an existing record</li>
 * <li><b>DELETE</b>: Remove an existing record</li>
 * <li><b>SEARCH</b>: Search records based on criteria</li>
 * <li><b>PAGINATION</b>: Retrieve records in a paginated format</li>
 * <li><b>BULK_INSERT</b>: Insert multiple records at once</li>
 * <li><b>BULK_UPDATE</b>: Update multiple records at once</li>
 * <li><b>BULK_DELETE</b>: Delete multiple records at once</li>
 * <li><b>SOFT_DELETE</b>: Mark a record as deleted without actually removing
 * it</li>
 * <li><b>RESTORE</b>: Restore a soft-deleted record</li>
 * <li><b>STATUS_TRANSITION</b>: Manage transitions between different entity
 * states</li>
 * <li><b>IMPORT_CSV</b>: Import data from CSV files</li>
 * <li><b>EXPORT_CSV</b>: Export data to CSV files</li>
 * <li><b>IMPORT_EXCEL</b>: Import data from Excel files</li>
 * <li><b>EXPORT_EXCEL</b>: Export data to Excel files</li>
 * <li><b>EXPORT_PDF</b>: Export data to PDF format</li>
 * <li><b>FILE_UPLOAD</b>: Upload associated files</li>
 * <li><b>FILE_DOWNLOAD</b>: Download associated files</li>
 * <li><b>AUDIT_LOG</b>: Track changes to records for audit purposes</li>
 * <li><b>VERSIONING</b>: Maintain version history of records</li>
 * <li><b>WEBHOOK_INTEGRATION</b>: Trigger external services via webhooks</li>
 * </ul>
 *
 * @author Jatin Raheja
 */
public enum OperationType {
	CREATE, READ, UPDATE, DELETE, SEARCH, PAGINATION, BULK_INSERT, BULK_UPDATE, BULK_DELETE, SOFT_DELETE, RESTORE,
	STATUS_TRANSITION, IMPORT_CSV, EXPORT_CSV, IMPORT_EXCEL, EXPORT_EXCEL, EXPORT_PDF, FILE_UPLOAD, FILE_DOWNLOAD,
	AUDIT_LOG, VERSIONING, WEBHOOK_INTEGRATION
}
