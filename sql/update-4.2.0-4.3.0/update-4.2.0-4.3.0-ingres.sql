delete from Groups_Orgs where groupId not in (select groupId from Group_);
delete from Groups_Orgs where organizationId not in (select organizationId from Organization_);

delete from Groups_Permissions where groupId not in (select groupId from Group_);
delete from Groups_Permissions where permissionId not in (select permissionId from Permission_);

delete from Groups_Roles where groupId not in (select groupId from Group_);
delete from Groups_Roles where roleId not in (select roleId from Role_);

delete from Groups_UserGroups where groupId not in (select groupId from Group_);
delete from Groups_UserGroups where userGroupId not in (select userGroupId from UserGroup);

delete from Roles_Permissions where roleId not in (select roleId from Role_);
delete from Roles_Permissions where permissionId not in (select permissionId from Permission_);

delete from Users_Groups where userId not in (select userId from User_);
delete from Users_Groups where groupId not in (select groupId from Group_);

delete from Users_Orgs where userId not in (select userId from User_);
delete from Users_Orgs where organizationId not in (select organizationId from Organization_);

delete from Users_Permissions where userId not in (select userId from User_);
delete from Users_Permissions where permissionId not in (select permissionId from Permission_);

delete from Users_Roles where userId not in (select userId from User_);
delete from Users_Roles where roleId not in (select roleId from Role_);

delete from Users_UserGroups where userId not in (select userId from User_);
delete from Users_UserGroups where userGroupId not in (select userGroupId from UserGroup);

commit;\g

update Account_ set parentAccountId = '0';
update Account_ set legalName = 'Liferay, Inc.' where legalName = 'Liferay, LLC';

-- alter_column_name Address className classNameId varchar(75) null;

create table ClassName_ (
	classNameId bigint not null primary key,
	value varchar(200) null
);

drop table ColorScheme;

alter table Company add accountId bigint;
alter table Company add webId varchar(75) null;
alter table Company add virtualHost varchar(75) null;
alter table Company add logoId bigint;

commit;\g

update Company set webId = companyId;

update Contact_ set parentContactId = '0';
update Contact_ set prefixId = '0' where prefixId is null;
update Contact_ set prefixId = '0' where prefixId = '';
update Contact_ set suffixId = '0' where suffixId is null;
update Contact_ set suffixId = '0' where suffixId = '';

update Country set countryId = '51' where countryId = '51`';

drop table DataTracker;

alter table DLFileEntry add fileEntryId bigint;

alter table DLFileRank add fileRankId bigint;

alter table DLFileVersion add fileVersionId bigint;

-- alter_column_name EmailAddress className classNameId varchar(75) null;

alter table Group_ add creatorUserId varchar(75) null;
-- alter_column_name Group_ className classNameId varchar(75) null;
alter table Group_ add liveGroupId bigint;
alter table Group_ add typeSettings varchar(1000) null;
alter table Group_ add active_ tinyint;

commit;\g

update Group_ set parentGroupId = '0';
update Group_ set liveGroupId = 0;
update Group_ set friendlyURL = '' where classNameId = 'com.liferay.portal.model.User';
update Group_ set active_ = 1;

alter table IGImage add smallImageId bigint;
alter table IGImage add largeImageId bigint;

alter table Image add height integer;
alter table Image add width integer;
alter table Image add size_ integer;
delete from Image where type_ = 'na';

alter table JournalArticle add id_ varchar(75) null;
alter table JournalArticle add resourcePrimKey bigint;
alter table JournalArticle add indexable tinyint;

commit;\g

update JournalArticle set id_ = articleId;
update JournalArticle set indexable = 1;

create table JournalArticleImage (
	articleImageId bigint not null primary key,
	groupId bigint,
	articleId varchar(75) null,
	version float,
	elName varchar(75) null,
	languageId varchar(75) null,
	tempImage tinyint
);

create table JournalArticleResource (
	resourcePrimKey bigint not null primary key,
	groupId bigint,
	articleId varchar(75) null
);

drop table JournalContentSearch;
create table JournalContentSearch (
	contentSearchId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	privateLayout tinyint,
	layoutId bigint,
	portletId varchar(200) null,
	articleId varchar(75) null
);

alter table JournalStructure add id_ varchar(75) null;

commit;\g

update JournalStructure set id_ = structureId;

alter table JournalTemplate add id_ varchar(75) null;
alter table JournalTemplate add smallImageId bigint;

commit;\g

update JournalTemplate set id_ = templateId;

alter table Layout add plid bigint;
alter table Layout add groupId bigint;
alter table Layout add privateLayout tinyint;
alter table Layout add iconImage tinyint;
alter table Layout add iconImageId bigint;
alter table Layout add wapThemeId varchar(75) null;
alter table Layout add wapColorSchemeId varchar(75) null;
alter table Layout add css varchar(1000) null;
update Layout set parentLayoutId = '0' where parentLayoutId = '-1';

alter table LayoutSet add layoutSetId bigint;
alter table LayoutSet add logo tinyint;
alter table LayoutSet add logoId bigint;
alter table LayoutSet add wapThemeId varchar(75) null;
alter table LayoutSet add wapColorSchemeId varchar(75) null;
alter table LayoutSet add css varchar(1000) null;

commit;\g

update LayoutSet set logo = 0;

create table MBBan (
	banId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	banUserId bigint
);

update MBCategory set categoryId = '0' where categoryId = 'system';
update MBCategory set companyId = '0', userId = '0' where companyId = 'system';

update MBMessage set categoryId = '0' where categoryId = 'system';

update MBThread set categoryId = '0' where categoryId = 'system';

-- alter_column_name MBDiscussion className classNameId varchar(75) null;

alter table MBMessageFlag add messageFlagId bigint;
update MBMessageFlag set flag = '1';

alter table MBStatsUser add statsUserId bigint;

drop table MBTopic;

drop table OrgGroupRole;
create table OrgGroupRole (
	organizationId bigint not null,
	groupId bigint not null,
	roleId bigint not null,
	primary key (organizationId, groupId, roleId)
);

create table PasswordPolicy (
	passwordPolicyId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	defaultPolicy tinyint,
	name varchar(75) null,
	description varchar(1000) null,
	changeable tinyint,
	changeRequired tinyint,
	minAge bigint,
	checkSyntax tinyint,
	allowDictionaryWords tinyint,
	minLength integer,
	history tinyint,
	historyCount integer,
	expireable tinyint,
	maxAge bigint,
	warningTime bigint,
	graceLimit integer,
	lockout tinyint,
	maxFailure integer,
	lockoutDuration bigint,
	requireUnlock tinyint,
	resetFailureCount bigint
);

create table PasswordPolicyRel (
	passwordPolicyRelId bigint not null primary key,
	passwordPolicyId bigint,
	classNameId bigint,
	classPK bigint
);

-- alter_column_name Phone className classNameId varchar(75) null;

create table PluginSetting (
	pluginSettingId bigint not null primary key,
	companyId bigint,
	pluginId varchar(75) null,
	pluginType varchar(75) null,
	roles varchar(1000) null,
	active_ tinyint
);

alter table PollsChoice add name varchar(75) null;

commit;\g

update PollsChoice set name = choiceId;

alter table PollsVote add voteId bigint;

alter table Portlet add id_ bigint;

alter table PortletPreferences add portletPreferencesId bigint;
alter table PortletPreferences add ownerType integer;
alter table PortletPreferences add plid bigint;

commit;\g

update PortletPreferences set plid = 0;

-- alter_column_name RatingsEntry className classNameId varchar(75) null;

-- alter_column_name RatingsStats className classNameId varchar(75) null;

alter table Release_ add verified tinyint;

alter table Resource_ add codeId bigint;

create table ResourceCode (
	codeId bigint not null primary key,
	companyId bigint,
	name varchar(300) null,
	scope integer
);

-- alter_column_name Role_ className classNameId varchar(75) null;
alter table Role_ add type_ integer;

commit;\g

update Role_ SET classNameId = '0';
update Role_ SET classPK = '0';
update Role_ SET type_ = 1;

create table SCFrameworkVersi_SCProductVers (
	productVersionId bigint not null,
	frameworkVersionId bigint not null,
	primary key (productVersionId, frameworkVersionId)
);

create table SCFrameworkVersion (
	frameworkVersionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	url varchar(1000) null,
	active_ tinyint,
	priority integer
);

create table SCLicense (
	licenseId bigint not null primary key,
	name varchar(75) null,
	url varchar(1000) null,
	openSource tinyint,
	active_ tinyint,
	recommended tinyint
);

create table SCLicenses_SCProductEntries (
	productEntryId bigint not null,
	licenseId bigint not null,
	primary key (productEntryId, licenseId)
);

create table SCProductEntry (
	productEntryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	type_ varchar(75) null,
	tags varchar(300) null,
	shortDescription varchar(1000) null,
	longDescription varchar(1000) null,
	pageURL varchar(1000) null,
	author varchar(75) null,
	repoGroupId varchar(75) null,
	repoArtifactId varchar(75) null
);

create table SCProductScreenshot (
	productScreenshotId bigint not null primary key,
	companyId bigint,
	groupId bigint,
	productEntryId bigint,
	thumbnailId bigint,
	fullImageId bigint,
	priority integer
);

create table SCProductVersion (
	productVersionId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	productEntryId bigint,
	version varchar(75) null,
	changeLog varchar(1000) null,
	downloadPageURL varchar(1000) null,
	directDownloadURL varchar(1000) null,
	repoStoreArtifact tinyint
);

-- alter_column_name ShoppingCart couponIds couponCodes varchar(75) null;

alter table ShoppingCoupon add code_ varchar(75) null;

commit;\g

update ShoppingCoupon set code_ = couponId;

alter table ShoppingItem add smallImageId bigint;
alter table ShoppingItem add mediumImageId bigint;
alter table ShoppingItem add largeImageId bigint;

alter table ShoppingOrder add number_ varchar(75) null;
-- alter_column_name ShoppingOrder couponIds couponCodes varchar(75) null;

commit;\g

update ShoppingOrder set number_ = orderId;

alter table ShoppingOrderItem add orderItemId bigint;

-- alter_column_name Subscription className classNameId varchar(75) null;

create table TagsAsset (
	assetId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	startDate timestamp null,
	endDate timestamp null,
	publishDate timestamp null,
	expirationDate timestamp null,
	mimeType varchar(75) null,
	title varchar(300) null,
	description varchar(1000) null,
	summary varchar(1000) null,
	url varchar(1000) null,
	height integer,
	width integer
);

create table TagsAssets_TagsEntries (
	assetId bigint not null,
	entryId bigint not null,
	primary key (assetId, entryId)
);

create table TagsEntry (
	entryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null
);

create table TagsProperty (
	propertyId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	entryId bigint,
	key_ varchar(75) null,
	value varchar(300) null
);

create table TagsSource (
	sourceId bigint not null primary key,
	parentSourceId bigint,
	name varchar(75) null,
	acronym varchar(75) null
);

alter table User_ add defaultUser tinyint;
alter table User_ add passwordModifiedDate timestamp null;
alter table User_ add graceLoginCount integer;
alter table User_ add screenName varchar(75) null;
alter table User_ add portraitId bigint;
alter table User_ add lastFailedLoginDate timestamp null;
alter table User_ add lockout tinyint;
alter table User_ add lockoutDate timestamp null;
alter table User_ drop column resolution;

commit;\g

update User_ set defaultUser = 0;
update User_ set screenName = userId;

update UserGroup SET parentUserGroupId = '0';

create table UserGroupRole (
	userId bigint not null,
	groupId bigint not null,
	roleId bigint not null,
	primary key (userId, groupId, roleId)
);

alter table UserIdMapper add userIdMapperId bigint;

drop table UserTracker;
create table UserTracker (
	userTrackerId bigint not null primary key,
	companyId bigint,
	userId bigint,
	modifiedDate timestamp null,
	sessionId varchar(200) null,
	remoteAddr varchar(75) null,
	remoteHost varchar(75) null,
	userAgent varchar(200) null
);

drop table UserTrackerPath;
create table UserTrackerPath (
	userTrackerPathId bigint not null primary key,
	userTrackerId bigint,
	path_ varchar(1000) null,
	pathDate timestamp null
);

-- alter_column_name Website className classNameId varchar(75) null;

alter table WikiPage add pageId bigint;
alter table WikiPage add resourcePrimKey bigint;

create table WikiPageResource (
	resourcePrimKey bigint not null primary key,
	nodeId bigint,
	title varchar(75) null
);
