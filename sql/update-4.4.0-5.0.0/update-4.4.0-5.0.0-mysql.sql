drop table ActivityTracker;

create table AnnouncementsDelivery (
	deliveryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	type_ varchar(75) null,
	email tinyint,
	sms tinyint,
	website tinyint
) engine InnoDB;

create table AnnouncementsEntry (
	uuid_ varchar(75) null,
	entryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	title varchar(75) null,
	content longtext null,
	url longtext null,
	type_ varchar(75) null,
	displayDate datetime null,
	expirationDate datetime null,
	priority integer,
	alert tinyint
) engine InnoDB;

create table AnnouncementsFlag (
	flagId bigint not null primary key,
	userId bigint,
	createDate datetime null,
	entryId bigint,
	value integer
) engine InnoDB;

create table ExpandoColumn (
	columnId bigint not null primary key,
	tableId bigint,
	name varchar(75) null,
	type_ integer
) engine InnoDB;

create table ExpandoRow (
	rowId_ bigint not null primary key,
	tableId bigint,
	classPK bigint
) engine InnoDB;

create table ExpandoTable (
	tableId bigint not null primary key,
	classNameId bigint,
	name varchar(75) null
) engine InnoDB;

create table ExpandoValue (
	valueId bigint not null primary key,
	tableId bigint,
	columnId bigint,
	rowId_ bigint,
	classNameId bigint,
	classPK bigint,
	data_ varchar(75) null
) engine InnoDB;

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
	createDate datetime null,
	modifiedDate datetime null,
	name varchar(75) null,
	portletId varchar(75) null,
	classNameId bigint
) engine InnoDB;

create table SocialActivity (
	activityId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate datetime null,
	classNameId bigint,
	classPK bigint,
	type_ varchar(75) null,
	extraData longtext null,
	receiverUserId bigint
) engine InnoDB;

create table SocialRelation (
	uuid_ varchar(75) null,
	relationId bigint not null primary key,
	companyId bigint,
	createDate datetime null,
	userId1 bigint,
	userId2 bigint,
	type_ integer
) engine InnoDB;

create table TasksProposal (
	proposalId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK varchar(75) null,
	name varchar(75) null,
	description longtext null,
	publishDate datetime null,
	dueDate datetime null
) engine InnoDB;

create table TasksReview (
	reviewId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	proposalId bigint,
	assignedByUserId bigint,
	assignedByUserName varchar(75) null,
	stage integer,
	completed tinyint,
	rejected tinyint
) engine InnoDB;

alter table WikiPage add parentTitle varchar(75) null;
alter table WikiPage add redirectTitle varchar(75) null;
