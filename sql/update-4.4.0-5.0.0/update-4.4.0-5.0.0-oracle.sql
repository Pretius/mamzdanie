drop table ActivityTracker;

create table AnnouncementsDelivery (
	deliveryId number(30,0) not null primary key,
	companyId number(30,0),
	userId number(30,0),
	type_ varchar2(75) null,
	email number(1, 0),
	sms number(1, 0),
	website number(1, 0)
);

create table AnnouncementsEntry (
	uuid_ varchar2(75) null,
	entryId number(30,0) not null primary key,
	companyId number(30,0),
	userId number(30,0),
	userName varchar2(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId number(30,0),
	classPK number(30,0),
	title varchar2(75) null,
	content varchar2(4000) null,
	url varchar2(4000) null,
	type_ varchar2(75) null,
	displayDate timestamp null,
	expirationDate timestamp null,
	priority number(30,0),
	alert number(1, 0)
);

create table AnnouncementsFlag (
	flagId number(30,0) not null primary key,
	userId number(30,0),
	createDate timestamp null,
	entryId number(30,0),
	value number(30,0)
);

create table ExpandoColumn (
	columnId number(30,0) not null primary key,
	tableId number(30,0),
	name varchar2(75) null,
	type_ number(30,0)
);

create table ExpandoRow (
	rowId_ number(30,0) not null primary key,
	tableId number(30,0),
	classPK number(30,0)
);

create table ExpandoTable (
	tableId number(30,0) not null primary key,
	classNameId number(30,0),
	name varchar2(75) null
);

create table ExpandoValue (
	valueId number(30,0) not null primary key,
	tableId number(30,0),
	columnId number(30,0),
	rowId_ number(30,0),
	classNameId number(30,0),
	classPK number(30,0),
	data_ varchar2(75) null
);

alter table IGImage add name varchar2(75) null;
alter table IGImage add custom1ImageId number(30,0) null;
alter table IGImage add custom2ImageId number(30,0) null;

update Group_ set type_ = 3 where type_ = 0;

update Image set type_ = 'jpg' where type_ = 'jpeg';

create table PortletItem (
	portletItemId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName varchar2(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar2(75) null,
	portletId varchar2(75) null,
	classNameId number(30,0)
);

create table SocialActivity (
	activityId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	createDate timestamp null,
	classNameId number(30,0),
	classPK number(30,0),
	type_ varchar2(75) null,
	extraData clob null,
	receiverUserId number(30,0)
);

create table SocialRelation (
	uuid_ varchar2(75) null,
	relationId number(30,0) not null primary key,
	companyId number(30,0),
	createDate timestamp null,
	userId1 number(30,0),
	userId2 number(30,0),
	type_ number(30,0)
);

create table TasksProposal (
	proposalId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName varchar2(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId number(30,0),
	classPK varchar2(75) null,
	name varchar2(75) null,
	description varchar2(4000) null,
	publishDate timestamp null,
	dueDate timestamp null
);

create table TasksReview (
	reviewId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName varchar2(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	proposalId number(30,0),
	assignedByUserId number(30,0),
	assignedByUserName varchar2(75) null,
	stage number(30,0),
	completed number(1, 0),
	rejected number(1, 0)
);

alter table WikiPage add parentTitle varchar2(75) null;
alter table WikiPage add redirectTitle varchar2(75) null;
