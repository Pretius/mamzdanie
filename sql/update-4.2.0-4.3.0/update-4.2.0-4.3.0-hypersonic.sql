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

commit;

update Account_ set parentAccountId = '0';
update Account_ set legalName = 'Liferay, Inc.' where legalName = 'Liferay, LLC';

alter table Address alter column className rename to classNameId;

create table ClassName_ (
	classNameId bigint not null primary key,
	value varchar(200) null
);

drop table ColorScheme;

alter table Company add accountId bigint;
alter table Company add webId varchar(75) null;
alter table Company add virtualHost varchar(75) null;
alter table Company add logoId bigint;

commit;

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

alter table EmailAddress alter column className rename to classNameId;

alter table Group_ add creatorUserId varchar(75) null;
alter table Group_ alter column className rename to classNameId;
alter table Group_ add liveGroupId bigint;
alter table Group_ add typeSettings longvarchar null;
alter table Group_ add active_ bit;

commit;

update Group_ set parentGroupId = '0';
update Group_ set liveGroupId = 0;
update Group_ set friendlyURL = '' where classNameId = 'com.liferay.portal.model.User';
update Group_ set active_ = true;

alter table IGImage add smallImageId bigint;
alter table IGImage add largeImageId bigint;

alter table Image add height int;
alter table Image add width int;
alter table Image add size_ int;
delete from Image where type_ = 'na';

alter table JournalArticle add id_ varchar(75) null;
alter table JournalArticle add resourcePrimKey bigint;
alter table JournalArticle add indexable bit;

commit;

update JournalArticle set id_ = articleId;
update JournalArticle set indexable = true;

create table JournalArticleImage (
	articleImageId bigint not null primary key,
	groupId bigint,
	articleId varchar(75) null,
	version double,
	elName varchar(75) null,
	languageId varchar(75) null,
	tempImage bit
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
	privateLayout bit,
	layoutId bigint,
	portletId varchar(200) null,
	articleId varchar(75) null
);

alter table JournalStructure add id_ varchar(75) null;

commit;

update JournalStructure set id_ = structureId;

alter table JournalTemplate add id_ varchar(75) null;
alter table JournalTemplate add smallImageId bigint;

commit;

update JournalTemplate set id_ = templateId;

alter table Layout add plid bigint;
alter table Layout add groupId bigint;
alter table Layout add privateLayout bit;
alter table Layout add iconImage bit;
alter table Layout add iconImageId bigint;
alter table Layout add wapThemeId varchar(75) null;
alter table Layout add wapColorSchemeId varchar(75) null;
alter table Layout add css longvarchar null;
update Layout set parentLayoutId = '0' where parentLayoutId = '-1';

alter table LayoutSet add layoutSetId bigint;
alter table LayoutSet add logo bit;
alter table LayoutSet add logoId bigint;
alter table LayoutSet add wapThemeId varchar(75) null;
alter table LayoutSet add wapColorSchemeId varchar(75) null;
alter table LayoutSet add css longvarchar null;

commit;

update LayoutSet set logo = false;

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

alter table MBDiscussion alter column className rename to classNameId;

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
	defaultPolicy bit,
	name varchar(75) null,
	description longvarchar null,
	changeable bit,
	changeRequired bit,
	minAge bigint,
	checkSyntax bit,
	allowDictionaryWords bit,
	minLength int,
	history bit,
	historyCount int,
	expireable bit,
	maxAge bigint,
	warningTime bigint,
	graceLimit int,
	lockout bit,
	maxFailure int,
	lockoutDuration bigint,
	requireUnlock bit,
	resetFailureCount bigint
);

create table PasswordPolicyRel (
	passwordPolicyRelId bigint not null primary key,
	passwordPolicyId bigint,
	classNameId bigint,
	classPK bigint
);

alter table Phone alter column className rename to classNameId;

create table PluginSetting (
	pluginSettingId bigint not null primary key,
	companyId bigint,
	pluginId varchar(75) null,
	pluginType varchar(75) null,
	roles longvarchar null,
	active_ bit
);

alter table PollsChoice add name varchar(75) null;

commit;

update PollsChoice set name = choiceId;

alter table PollsVote add voteId bigint;

alter table Portlet add id_ bigint;

alter table PortletPreferences add portletPreferencesId bigint;
alter table PortletPreferences add ownerType int;
alter table PortletPreferences add plid bigint;

commit;

update PortletPreferences set plid = 0;

alter table RatingsEntry alter column className rename to classNameId;

alter table RatingsStats alter column className rename to classNameId;

alter table Release_ add verified bit;

alter table Resource_ add codeId bigint;

create table ResourceCode (
	codeId bigint not null primary key,
	companyId bigint,
	name varchar(300) null,
	scope int
);

alter table Role_ alter column className rename to classNameId;
alter table Role_ add type_ int;

commit;

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
	url longvarchar null,
	active_ bit,
	priority int
);

create table SCLicense (
	licenseId bigint not null primary key,
	name varchar(75) null,
	url longvarchar null,
	openSource bit,
	active_ bit,
	recommended bit
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
	shortDescription longvarchar null,
	longDescription longvarchar null,
	pageURL longvarchar null,
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
	priority int
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
	changeLog longvarchar null,
	downloadPageURL longvarchar null,
	directDownloadURL longvarchar null,
	repoStoreArtifact bit
);

alter table ShoppingCart alter column couponIds rename to couponCodes;

alter table ShoppingCoupon add code_ varchar(75) null;

commit;

update ShoppingCoupon set code_ = couponId;

alter table ShoppingItem add smallImageId bigint;
alter table ShoppingItem add mediumImageId bigint;
alter table ShoppingItem add largeImageId bigint;

alter table ShoppingOrder add number_ varchar(75) null;
alter table ShoppingOrder alter column couponIds rename to couponCodes;

commit;

update ShoppingOrder set number_ = orderId;

alter table ShoppingOrderItem add orderItemId bigint;

alter table Subscription alter column className rename to classNameId;

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
	description longvarchar null,
	summary longvarchar null,
	url longvarchar null,
	height int,
	width int
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

alter table User_ add defaultUser bit;
alter table User_ add passwordModifiedDate timestamp null;
alter table User_ add graceLoginCount int;
alter table User_ add screenName varchar(75) null;
alter table User_ add portraitId bigint;
alter table User_ add lastFailedLoginDate timestamp null;
alter table User_ add lockout bit;
alter table User_ add lockoutDate timestamp null;
alter table User_ drop column resolution;

commit;

update User_ set defaultUser = false;
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
	path_ longvarchar null,
	pathDate timestamp null
);

alter table Website alter column className rename to classNameId;

alter table WikiPage add pageId bigint;
alter table WikiPage add resourcePrimKey bigint;

create table WikiPageResource (
	resourcePrimKey bigint not null primary key,
	nodeId bigint,
	title varchar(75) null
);
