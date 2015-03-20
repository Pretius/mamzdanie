drop table ActivityTracker;

create table AnnouncementsDelivery (
	deliveryId int64 not null primary key,
	companyId int64,
	userId int64,
	type_ varchar(75),
	email smallint,
	sms smallint,
	website smallint
);

create table AnnouncementsEntry (
	uuid_ varchar(75),
	entryId int64 not null primary key,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	classNameId int64,
	classPK int64,
	title varchar(75),
	content varchar(4000),
	url varchar(4000),
	type_ varchar(75),
	displayDate timestamp,
	expirationDate timestamp,
	priority integer,
	alert smallint
);

create table AnnouncementsFlag (
	flagId int64 not null primary key,
	userId int64,
	createDate timestamp,
	entryId int64,
	value integer
);

create table ExpandoColumn (
	columnId int64 not null primary key,
	tableId int64,
	name varchar(75),
	type_ integer
);

create table ExpandoRow (
	rowId_ int64 not null primary key,
	tableId int64,
	classPK int64
);

create table ExpandoTable (
	tableId int64 not null primary key,
	classNameId int64,
	name varchar(75)
);

create table ExpandoValue (
	valueId int64 not null primary key,
	tableId int64,
	columnId int64,
	rowId_ int64,
	classNameId int64,
	classPK int64,
	data_ varchar(75)
);

alter table IGImage add name varchar(75);
alter table IGImage add custom1ImageId int64;
alter table IGImage add custom2ImageId int64;



create table PortletItem (
	portletItemId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	name varchar(75),
	portletId varchar(75),
	classNameId int64
);

create table SocialActivity (
	activityId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	createDate timestamp,
	classNameId int64,
	classPK int64,
	type_ varchar(75),
	extraData blob,
	receiverUserId int64
);

create table SocialRelation (
	uuid_ varchar(75),
	relationId int64 not null primary key,
	companyId int64,
	createDate timestamp,
	userId1 int64,
	userId2 int64,
	type_ integer
);

create table TasksProposal (
	proposalId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	classNameId int64,
	classPK varchar(75),
	name varchar(75),
	description varchar(4000),
	publishDate timestamp,
	dueDate timestamp
);

create table TasksReview (
	reviewId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	proposalId int64,
	assignedByUserId int64,
	assignedByUserName varchar(75),
	stage integer,
	completed smallint,
	rejected smallint
);

alter table WikiPage add parentTitle varchar(75);
alter table WikiPage add redirectTitle varchar(75);
