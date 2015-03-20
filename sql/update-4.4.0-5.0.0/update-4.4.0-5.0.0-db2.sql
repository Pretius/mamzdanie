drop table ActivityTracker;

create table AnnouncementsDelivery (
	deliveryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	type_ varchar(75),
	email smallint,
	sms smallint,
	website smallint
);

create table AnnouncementsEntry (
	uuid_ varchar(75),
	entryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	classNameId bigint,
	classPK bigint,
	title varchar(75),
	content varchar(500),
	url varchar(500),
	type_ varchar(75),
	displayDate timestamp,
	expirationDate timestamp,
	priority integer,
	alert smallint
);

create table AnnouncementsFlag (
	flagId bigint not null primary key,
	userId bigint,
	createDate timestamp,
	entryId bigint,
	value integer
);

create table ExpandoColumn (
	columnId bigint not null primary key,
	tableId bigint,
	name varchar(75),
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
	name varchar(75)
);

create table ExpandoValue (
	valueId bigint not null primary key,
	tableId bigint,
	columnId bigint,
	rowId_ bigint,
	classNameId bigint,
	classPK bigint,
	data_ varchar(75)
);

alter table IGImage add name varchar(75);
alter table IGImage add custom1ImageId bigint;
alter table IGImage add custom2ImageId bigint;

update Group_ set type_ = 3 where type_ = 0;

update Image set type_ = 'jpg' where type_ = 'jpeg';

create table PortletItem (
	portletItemId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	name varchar(75),
	portletId varchar(75),
	classNameId bigint
);

create table SocialActivity (
	activityId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate timestamp,
	classNameId bigint,
	classPK bigint,
	type_ varchar(75),
	extraData clob,
	receiverUserId bigint
);

create table SocialRelation (
	uuid_ varchar(75),
	relationId bigint not null primary key,
	companyId bigint,
	createDate timestamp,
	userId1 bigint,
	userId2 bigint,
	type_ integer
);

create table TasksProposal (
	proposalId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	classNameId bigint,
	classPK varchar(75),
	name varchar(75),
	description varchar(500),
	publishDate timestamp,
	dueDate timestamp
);

create table TasksReview (
	reviewId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	proposalId bigint,
	assignedByUserId bigint,
	assignedByUserName varchar(75),
	stage integer,
	completed smallint,
	rejected smallint
);

alter table WikiPage add parentTitle varchar(75);
alter table WikiPage add redirectTitle varchar(75);
