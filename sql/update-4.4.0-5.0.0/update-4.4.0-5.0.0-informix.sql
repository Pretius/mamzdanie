drop table ActivityTracker;

create table AnnouncementsDelivery (
	deliveryId int8 not null primary key,
	companyId int8,
	userId int8,
	type_ varchar(75),
	email boolean,
	sms boolean,
	website boolean
)
extent size 16 next size 16
lock mode row;

create table AnnouncementsEntry (
	uuid_ varchar(75),
	entryId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	title varchar(75),
	content lvarchar,
	url lvarchar,
	type_ varchar(75),
	displayDate datetime YEAR TO FRACTION,
	expirationDate datetime YEAR TO FRACTION,
	priority int,
	alert boolean
)
extent size 16 next size 16
lock mode row;

create table AnnouncementsFlag (
	flagId int8 not null primary key,
	userId int8,
	createDate datetime YEAR TO FRACTION,
	entryId int8,
	value int
)
extent size 16 next size 16
lock mode row;

create table ExpandoColumn (
	columnId int8 not null primary key,
	tableId int8,
	name varchar(75),
	type_ int
)
extent size 16 next size 16
lock mode row;

create table ExpandoRow (
	rowId_ int8 not null primary key,
	tableId int8,
	classPK int8
)
extent size 16 next size 16
lock mode row;

create table ExpandoTable (
	tableId int8 not null primary key,
	classNameId int8,
	name varchar(75)
)
extent size 16 next size 16
lock mode row;

create table ExpandoValue (
	valueId int8 not null primary key,
	tableId int8,
	columnId int8,
	rowId_ int8,
	classNameId int8,
	classPK int8,
	data_ varchar(75)
)
extent size 16 next size 16
lock mode row;

alter table IGImage add name varchar(75);
alter table IGImage add custom1ImageId int8;
alter table IGImage add custom2ImageId int8;

update Group_ set type_ = 3 where type_ = 0;

update Image set type_ = 'jpg' where type_ = 'jpeg';

create table PortletItem (
	portletItemId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	name varchar(75),
	portletId varchar(75),
	classNameId int8
)
extent size 16 next size 16
lock mode row;

create table SocialActivity (
	activityId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	createDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	type_ varchar(75),
	extraData text,
	receiverUserId int8
)
extent size 16 next size 16
lock mode row;

create table SocialRelation (
	uuid_ varchar(75),
	relationId int8 not null primary key,
	companyId int8,
	createDate datetime YEAR TO FRACTION,
	userId1 int8,
	userId2 int8,
	type_ int
)
extent size 16 next size 16
lock mode row;

create table TasksProposal (
	proposalId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK varchar(75),
	name varchar(75),
	description lvarchar,
	publishDate datetime YEAR TO FRACTION,
	dueDate datetime YEAR TO FRACTION
)
extent size 16 next size 16
lock mode row;

create table TasksReview (
	reviewId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	proposalId int8,
	assignedByUserId int8,
	assignedByUserName varchar(75),
	stage int,
	completed boolean,
	rejected boolean
)
extent size 16 next size 16
lock mode row;

alter table WikiPage add parentTitle varchar(75);
alter table WikiPage add redirectTitle varchar(75);
