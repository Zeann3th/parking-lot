CREATE TABLE `history` (
	`id` text PRIMARY KEY NOT NULL,
	`vehicle_id` integer NOT NULL,
	`checked_in_at` text NOT NULL,
	`checked_out_at` text,
	`ticket_id` integer,
	`fee` real,
	FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles`(`id`) ON UPDATE no action ON DELETE set null,
	FOREIGN KEY (`ticket_id`) REFERENCES `tickets`(`id`) ON UPDATE no action ON DELETE set null
);
--> statement-breakpoint
CREATE TABLE `sections` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text NOT NULL,
	`capacity` integer NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `sections_name_unique` ON `sections` (`name`);--> statement-breakpoint
CREATE TABLE `ticket_prices` (
	`type` text NOT NULL,
	`vehicle_type` text NOT NULL,
	`price` real NOT NULL,
	PRIMARY KEY(`type`, `vehicle_type`)
);
--> statement-breakpoint
CREATE TABLE `tickets` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`type` text NOT NULL,
	`status` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `user_privileges` (
	`user_id` integer NOT NULL,
	`section_id` integer NOT NULL,
	PRIMARY KEY(`user_id`, `section_id`),
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `user_tickets` (
	`user_id` integer NOT NULL,
	`ticket_id` integer NOT NULL,
	`valid_from` text NOT NULL,
	`valid_to` text NOT NULL,
	PRIMARY KEY(`user_id`, `ticket_id`),
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`ticket_id`) REFERENCES `tickets`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `users` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`username` text NOT NULL,
	`password` text NOT NULL,
	`role` text NOT NULL,
	`refresh_token` text,
	`created_at` text NOT NULL,
	`updated_at` text NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `users_username_unique` ON `users` (`username`);--> statement-breakpoint
CREATE TABLE `vehicles` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`plate` text NOT NULL,
	`type` text NOT NULL,
	`reserved_slot` text
);
--> statement-breakpoint
CREATE UNIQUE INDEX `vehicles_plate_unique` ON `vehicles` (`plate`);