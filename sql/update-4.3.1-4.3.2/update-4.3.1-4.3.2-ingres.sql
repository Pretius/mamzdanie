alter table Group_ add typeSettings varchar(1000) null;

alter table SCProductEntry add tags varchar(300) null;
alter table SCProductEntry add author varchar(75) null;

create table SCProductScreenshot (
	productScreenshotId bigint not null primary key,
	companyId bigint,
	groupId bigint,
	productEntryId bigint,
	thumbnailId bigint,
	fullImageId bigint,
	priority integer
);

alter table TagsAsset add description varchar(1000) null;
alter table TagsAsset add summary varchar(1000) null;
