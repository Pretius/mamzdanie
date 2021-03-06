alter table BookmarksEntry add groupId bigint;

create table BrowserTracker (
	browserTrackerId bigint not null primary key,
	userId bigint,
	browserKey bigint
) engine InnoDB;

update CalEvent set remindBy = '0' where remindBy = 'none';
update CalEvent set remindBy = '1' where remindBy = 'email';
update CalEvent set remindBy = '2' where remindBy = 'sms';
update CalEvent set remindBy = '3' where remindBy = 'aim';
update CalEvent set remindBy = '4' where remindBy = 'icq';
update CalEvent set remindBy = '5' where remindBy = 'msn';
update CalEvent set remindBy = '6' where remindBy = 'ym';

alter table Company add system tinyint;

commit;

update Company set system = 0;

alter table DLFileEntry add groupId bigint;

alter table DLFileRank add groupId bigint;

alter table DLFileShortcut add groupId bigint;

alter table DLFileVersion add groupId bigint;

update Group_ set name = classPK where classPK > 0 and name = '';

alter table IGImage add groupId bigint;

alter table JournalArticle add urlTitle varchar(150) null;

commit;

update JournalArticle set urlTitle = articleId;

alter table MBCategory add threadCount integer;
alter table MBCategory add messageCount integer;

alter table MBMessage add groupId bigint;
alter table MBMessage add classNameId bigint;
alter table MBMessage add classPK bigint;
alter table MBMessage add priority double;

delete from MBMessageFlag where flag = 1;

commit;

alter table MBMessageFlag add modifiedDate datetime null;
alter table MBMessageFlag add threadId bigint;

alter table MBThread add groupId bigint;

alter table Organization_ add leftOrganizationId bigint;
alter table Organization_ add rightOrganizationId bigint;

commit;

update Organization_ set leftOrganizationId = 0, rightOrganizationId = 0;

update Region set regionCode = 'AB' where countryId = 1 and name = 'Alberta';

create table ResourceAction (
	resourceActionId bigint not null primary key,
	name varchar(75) null,
	actionId varchar(75) null,
	bitwiseValue bigint
) engine InnoDB;

create table ResourcePermission (
	resourcePermissionId bigint not null primary key,
	companyId bigint,
	name varchar(255) null,
	scope integer,
	primKey varchar(255) null,
	roleId bigint,
	actionIds bigint
) engine InnoDB;

create table Shard (
	shardId bigint not null primary key,
	classNameId bigint,
	classPK bigint,
	name varchar(75) null
) engine InnoDB;

alter table User_ add firstName varchar(75) null;
alter table User_ add middleName varchar(75) null;
alter table User_ add lastName varchar(75) null;
alter table User_ add jobTitle varchar(75) null;

alter table WikiPage add groupId bigint;
