alter table Group_ add typeSettings varchar(4000);

alter table SCProductEntry add tags varchar(300);
alter table SCProductEntry add author varchar(75);

create table SCProductScreenshot (
	productScreenshotId bigint not null primary key,
	companyId bigint,
	groupId bigint,
	productEntryId bigint,
	thumbnailId bigint,
	fullImageId bigint,
	priority integer
);

alter table TagsAsset add description varchar(4000);
alter table TagsAsset add summary varchar(4000);
