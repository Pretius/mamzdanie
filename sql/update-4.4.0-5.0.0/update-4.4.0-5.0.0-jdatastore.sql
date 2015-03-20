drop table ActivityTracker;

create table AnnouncementsDelivery (
	deliveryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	type_ varchar(75) null,
	email boolean,
	sms boolean,
	website boolean
);

create table AnnouncementsEntry (
	uuid_ varchar(75) null,
	entryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate date null,
	modifiedDate date null,
	classNameId bigint,
	classPK bigint,
	title varchar(75) null,
	content long varchar null,
	url long varchar null,
	type_ varchar(75) null,
	displayDate date null,
	expirationDate date null,
	priority integer,
	alert boolean
);

create table AnnouncementsFlag (
	flagId bigint not null primary key,
	userId bigint,
	createDate date null,
	entryId bigint,
	value integer
);

create table ExpandoColumn (
	columnId bigint not null primary key,
	tableId bigint,
	name varchar(75) null,
	type_ integer
);

create table ExpandoRow (
	rowId_ bigint not null primary key,
	tableId bigint,
	classPK bigint
);

create table ExpandoTable (
	tableId bigint not null primary key,
	classNameId bigint,
	name varchar(75) null
);

create table ExpandoValue (
	valueId bigint not null primary key,
	tableId bigint,
	columnId bigint,
	rowId_ bigint,
	classNameId bigint,
	classPK bigint,
	data_ varchar(75) null
);

alter table IGImage add name varchar(75) null;
alter table IGImage add custom1ImageId bigint null;
alter table IGImage add custom2ImageId bigint null;

update Group_ set type_ = 3 where type_ = 0;

update Image set type_ = 'jpg' where type_ = 'jpeg';

create table PortletItem (
	portletItemId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate date null,
	modifiedDate date null,
	name varchar(75) null,
	portletId varchar(75) null,
	classNameId bigint
);

create table SocialActivity (
	activityId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate date null,
	classNameId bigint,
	classPK bigint,
	type_ varchar(75) null,
	extraData long varchar null,
	receiverUserId bigint
);

create table SocialRelation (
	uuid_ varchar(75) null,
	relationId bigint not null primary key,
	companyId bigint,
	createDate date null,
	userId1 bigint,
	userId2 bigint,
	type_ integer
);

create table TasksProposal (
	proposalId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate date null,
	modifiedDate date null,
	classNameId bigint,
	classPK varchar(75) null,
	name varchar(75) null,
	description long varchar null,
	publishDate date null,
	dueDate date null
);

create table TasksReview (
	reviewId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate date null,
	modifiedDate date null,
	proposalId bigint,
	assignedByUserId bigint,
	assignedByUserName varchar(75) null,
	stage integer,
	completed boolean,
	rejected boolean
);

alter table WikiPage add parentTitle varchar(75) null;
alter table WikiPage add redirectTitle varchar(75) null;
