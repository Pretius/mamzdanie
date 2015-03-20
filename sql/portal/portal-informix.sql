create table Account_ (
	accountId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	parentAccountId int8,
	name varchar(75),
	legalName varchar(75),
	legalId varchar(75),
	legalType varchar(75),
	sicCode varchar(75),
	tickerSymbol varchar(75),
	industry varchar(75),
	type_ varchar(75),
	size_ varchar(75)
)
extent size 16 next size 16
lock mode row;

create table Address (
	addressId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	street1 varchar(75),
	street2 varchar(75),
	street3 varchar(75),
	city varchar(75),
	zip varchar(75),
	regionId int8,
	countryId int8,
	typeId int,
	mailing boolean,
	primary_ boolean
)
extent size 16 next size 16
lock mode row;

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

create table BlogsEntry (
	uuid_ varchar(75),
	entryId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	title varchar(150),
	urlTitle varchar(150),
	content text,
	displayDate datetime YEAR TO FRACTION,
	draft boolean,
	allowTrackbacks boolean,
	trackbacks text
)
extent size 16 next size 16
lock mode row;

create table BlogsStatsUser (
	statsUserId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	entryCount int,
	lastPostDate datetime YEAR TO FRACTION,
	ratingsTotalEntries int,
	ratingsTotalScore float,
	ratingsAverageScore float
)
extent size 16 next size 16
lock mode row;

create table BookmarksEntry (
	uuid_ varchar(75),
	entryId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	folderId int8,
	name varchar(255),
	url lvarchar,
	comments lvarchar,
	visits int,
	priority int
)
extent size 16 next size 16
lock mode row;

create table BookmarksFolder (
	uuid_ varchar(75),
	folderId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	parentFolderId int8,
	name varchar(75),
	description lvarchar
)
extent size 16 next size 16
lock mode row;

create table BrowserTracker (
	browserTrackerId int8 not null primary key,
	userId int8,
	browserKey int8
)
extent size 16 next size 16
lock mode row;

create table CalEvent (
	uuid_ varchar(75),
	eventId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	title varchar(75),
	description lvarchar,
	startDate datetime YEAR TO FRACTION,
	endDate datetime YEAR TO FRACTION,
	durationHour int,
	durationMinute int,
	allDay boolean,
	timeZoneSensitive boolean,
	type_ varchar(75),
	repeating boolean,
	recurrence text,
	remindBy int,
	firstReminder int,
	secondReminder int
)
extent size 16 next size 16
lock mode row;

create table ClassName_ (
	classNameId int8 not null primary key,
	value varchar(200)
)
extent size 16 next size 16
lock mode row;

create table Company (
	companyId int8 not null primary key,
	accountId int8,
	webId varchar(75),
	key_ text,
	virtualHost varchar(75),
	mx varchar(75),
	homeURL lvarchar,
	logoId int8,
	system boolean
)
extent size 16 next size 16
lock mode row;

create table Contact_ (
	contactId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	accountId int8,
	parentContactId int8,
	firstName varchar(75),
	middleName varchar(75),
	lastName varchar(75),
	prefixId int,
	suffixId int,
	male boolean,
	birthday datetime YEAR TO FRACTION,
	smsSn varchar(75),
	aimSn varchar(75),
	facebookSn varchar(75),
	icqSn varchar(75),
	jabberSn varchar(75),
	msnSn varchar(75),
	mySpaceSn varchar(75),
	skypeSn varchar(75),
	twitterSn varchar(75),
	ymSn varchar(75),
	employeeStatusId varchar(75),
	employeeNumber varchar(75),
	jobTitle varchar(100),
	jobClass varchar(75),
	hoursOfOperation varchar(75)
)
extent size 16 next size 16
lock mode row;

create table Counter (
	name varchar(75) not null primary key,
	currentId int8
)
extent size 16 next size 16
lock mode row;

create table Country (
	countryId int8 not null primary key,
	name varchar(75),
	a2 varchar(75),
	a3 varchar(75),
	number_ varchar(75),
	idd_ varchar(75),
	active_ boolean
)
extent size 16 next size 16
lock mode row;

create table CyrusUser (
	userId varchar(75) not null primary key,
	password_ varchar(75) not null
)
extent size 16 next size 16
lock mode row;

create table CyrusVirtual (
	emailAddress varchar(75) not null primary key,
	userId varchar(75) not null
)
extent size 16 next size 16
lock mode row;

create table DLFileEntry (
	uuid_ varchar(75),
	fileEntryId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	versionUserId int8,
	versionUserName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	folderId int8,
	name varchar(255),
	title varchar(255),
	description lvarchar,
	version float,
	size_ int,
	readCount int,
	extraSettings text
)
extent size 16 next size 16
lock mode row;

create table DLFileRank (
	fileRankId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	createDate datetime YEAR TO FRACTION,
	folderId int8,
	name varchar(255)
)
extent size 16 next size 16
lock mode row;

create table DLFileShortcut (
	uuid_ varchar(75),
	fileShortcutId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	folderId int8,
	toFolderId int8,
	toName varchar(255)
)
extent size 16 next size 16
lock mode row;

create table DLFileVersion (
	fileVersionId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	folderId int8,
	name varchar(255),
	version float,
	size_ int
)
extent size 16 next size 16
lock mode row;

create table DLFolder (
	uuid_ varchar(75),
	folderId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	parentFolderId int8,
	name varchar(100),
	description lvarchar,
	lastPostDate datetime YEAR TO FRACTION
)
extent size 16 next size 16
lock mode row;

create table EmailAddress (
	emailAddressId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	address varchar(75),
	typeId int,
	primary_ boolean
)
extent size 16 next size 16
lock mode row;

create table ExpandoColumn (
	columnId int8 not null primary key,
	companyId int8,
	tableId int8,
	name varchar(75),
	type_ int,
	defaultData lvarchar,
	typeSettings lvarchar(4096)
)
extent size 16 next size 16
lock mode row;

create table ExpandoRow (
	rowId_ int8 not null primary key,
	companyId int8,
	tableId int8,
	classPK int8
)
extent size 16 next size 16
lock mode row;

create table ExpandoTable (
	tableId int8 not null primary key,
	companyId int8,
	classNameId int8,
	name varchar(75)
)
extent size 16 next size 16
lock mode row;

create table ExpandoValue (
	valueId int8 not null primary key,
	companyId int8,
	tableId int8,
	columnId int8,
	rowId_ int8,
	classNameId int8,
	classPK int8,
	data_ lvarchar
)
extent size 16 next size 16
lock mode row;

create table Group_ (
	groupId int8 not null primary key,
	companyId int8,
	creatorUserId int8,
	classNameId int8,
	classPK int8,
	parentGroupId int8,
	liveGroupId int8,
	name varchar(75),
	description lvarchar,
	type_ int,
	typeSettings lvarchar,
	friendlyURL varchar(100),
	active_ boolean
)
extent size 16 next size 16
lock mode row;

create table Groups_Orgs (
	groupId int8 not null,
	organizationId int8 not null,
	primary key (groupId, organizationId)
)
extent size 16 next size 16
lock mode row;

create table Groups_Permissions (
	groupId int8 not null,
	permissionId int8 not null,
	primary key (groupId, permissionId)
)
extent size 16 next size 16
lock mode row;

create table Groups_Roles (
	groupId int8 not null,
	roleId int8 not null,
	primary key (groupId, roleId)
)
extent size 16 next size 16
lock mode row;

create table Groups_UserGroups (
	groupId int8 not null,
	userGroupId int8 not null,
	primary key (groupId, userGroupId)
)
extent size 16 next size 16
lock mode row;

create table IGFolder (
	uuid_ varchar(75),
	folderId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	parentFolderId int8,
	name varchar(75),
	description lvarchar
)
extent size 16 next size 16
lock mode row;

create table IGImage (
	uuid_ varchar(75),
	imageId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	folderId int8,
	name varchar(75),
	description lvarchar,
	smallImageId int8,
	largeImageId int8,
	custom1ImageId int8,
	custom2ImageId int8
)
extent size 16 next size 16
lock mode row;

create table Image (
	imageId int8 not null primary key,
	modifiedDate datetime YEAR TO FRACTION,
	text_ text,
	type_ varchar(75),
	height int,
	width int,
	size_ int
)
extent size 16 next size 16
lock mode row;

create table JournalArticle (
	uuid_ varchar(75),
	id_ int8 not null primary key,
	resourcePrimKey int8,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	articleId varchar(75),
	version float,
	title varchar(100),
	urlTitle varchar(150),
	description lvarchar,
	content text,
	type_ varchar(75),
	structureId varchar(75),
	templateId varchar(75),
	displayDate datetime YEAR TO FRACTION,
	approved boolean,
	approvedByUserId int8,
	approvedByUserName varchar(75),
	approvedDate datetime YEAR TO FRACTION,
	expired boolean,
	expirationDate datetime YEAR TO FRACTION,
	reviewDate datetime YEAR TO FRACTION,
	indexable boolean,
	smallImage boolean,
	smallImageId int8,
	smallImageURL varchar(75)
)
extent size 16 next size 16
lock mode row;

create table JournalArticleImage (
	articleImageId int8 not null primary key,
	groupId int8,
	articleId varchar(75),
	version float,
	elInstanceId varchar(75),
	elName varchar(75),
	languageId varchar(75),
	tempImage boolean
)
extent size 16 next size 16
lock mode row;

create table JournalArticleResource (
	resourcePrimKey int8 not null primary key,
	groupId int8,
	articleId varchar(75)
)
extent size 16 next size 16
lock mode row;

create table JournalContentSearch (
	contentSearchId int8 not null primary key,
	groupId int8,
	companyId int8,
	privateLayout boolean,
	layoutId int8,
	portletId varchar(200),
	articleId varchar(75)
)
extent size 16 next size 16
lock mode row;

create table JournalFeed (
	uuid_ varchar(75),
	id_ int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	feedId varchar(75),
	name varchar(75),
	description lvarchar,
	type_ varchar(75),
	structureId varchar(75),
	templateId varchar(75),
	rendererTemplateId varchar(75),
	delta int,
	orderByCol varchar(75),
	orderByType varchar(75),
	targetLayoutFriendlyUrl varchar(75),
	targetPortletId varchar(75),
	contentField varchar(75),
	feedType varchar(75),
	feedVersion float
)
extent size 16 next size 16
lock mode row;

create table JournalStructure (
	uuid_ varchar(75),
	id_ int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	structureId varchar(75),
	parentStructureId varchar(75),
	name varchar(75),
	description lvarchar,
	xsd text
)
extent size 16 next size 16
lock mode row;

create table JournalTemplate (
	uuid_ varchar(75),
	id_ int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	templateId varchar(75),
	structureId varchar(75),
	name varchar(75),
	description lvarchar,
	xsl text,
	langType varchar(75),
	cacheable boolean,
	smallImage boolean,
	smallImageId int8,
	smallImageURL varchar(75)
)
extent size 16 next size 16
lock mode row;

create table Layout (
	plid int8 not null primary key,
	groupId int8,
	companyId int8,
	privateLayout boolean,
	layoutId int8,
	parentLayoutId int8,
	name lvarchar,
	title lvarchar,
	description lvarchar,
	type_ varchar(75),
	typeSettings lvarchar(4096),
	hidden_ boolean,
	friendlyURL varchar(100),
	iconImage boolean,
	iconImageId int8,
	themeId varchar(75),
	colorSchemeId varchar(75),
	wapThemeId varchar(75),
	wapColorSchemeId varchar(75),
	css lvarchar,
	priority int,
	dlFolderId int8
)
extent size 16 next size 16
lock mode row;

create table LayoutSet (
	layoutSetId int8 not null primary key,
	groupId int8,
	companyId int8,
	privateLayout boolean,
	logo boolean,
	logoId int8,
	themeId varchar(75),
	colorSchemeId varchar(75),
	wapThemeId varchar(75),
	wapColorSchemeId varchar(75),
	css lvarchar,
	pageCount int,
	virtualHost varchar(75)
)
extent size 16 next size 16
lock mode row;

create table ListType (
	listTypeId int not null primary key,
	name varchar(75),
	type_ varchar(75)
)
extent size 16 next size 16
lock mode row;

create table MBBan (
	banId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	banUserId int8
)
extent size 16 next size 16
lock mode row;

create table MBCategory (
	uuid_ varchar(75),
	categoryId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	parentCategoryId int8,
	name varchar(75),
	description lvarchar,
	threadCount int,
	messageCount int,
	lastPostDate datetime YEAR TO FRACTION
)
extent size 16 next size 16
lock mode row;

create table MBDiscussion (
	discussionId int8 not null primary key,
	classNameId int8,
	classPK int8,
	threadId int8
)
extent size 16 next size 16
lock mode row;

create table MBMailingList (
	uuid_ varchar(75),
	mailingListId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	categoryId int8,
	emailAddress varchar(75),
	inProtocol varchar(75),
	inServerName varchar(75),
	inServerPort int,
	inUseSSL boolean,
	inUserName varchar(75),
	inPassword varchar(75),
	inReadInterval int,
	outEmailAddress varchar(75),
	outCustom boolean,
	outServerName varchar(75),
	outServerPort int,
	outUseSSL boolean,
	outUserName varchar(75),
	outPassword varchar(75),
	active_ boolean
)
extent size 16 next size 16
lock mode row;

create table MBMessage (
	uuid_ varchar(75),
	messageId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	categoryId int8,
	threadId int8,
	parentMessageId int8,
	subject varchar(75),
	body text,
	attachments boolean,
	anonymous boolean,
	priority float
)
extent size 16 next size 16
lock mode row;

create table MBMessageFlag (
	messageFlagId int8 not null primary key,
	userId int8,
	modifiedDate datetime YEAR TO FRACTION,
	threadId int8,
	messageId int8,
	flag int
)
extent size 16 next size 16
lock mode row;

create table MBStatsUser (
	statsUserId int8 not null primary key,
	groupId int8,
	userId int8,
	messageCount int,
	lastPostDate datetime YEAR TO FRACTION
)
extent size 16 next size 16
lock mode row;

create table MBThread (
	threadId int8 not null primary key,
	groupId int8,
	categoryId int8,
	rootMessageId int8,
	messageCount int,
	viewCount int,
	lastPostByUserId int8,
	lastPostDate datetime YEAR TO FRACTION,
	priority float
)
extent size 16 next size 16
lock mode row;

create table MembershipRequest (
	membershipRequestId int8 not null primary key,
	companyId int8,
	userId int8,
	createDate datetime YEAR TO FRACTION,
	groupId int8,
	comments lvarchar,
	replyComments lvarchar,
	replyDate datetime YEAR TO FRACTION,
	replierUserId int8,
	statusId int
)
extent size 16 next size 16
lock mode row;

create table Organization_ (
	organizationId int8 not null primary key,
	companyId int8,
	parentOrganizationId int8,
	leftOrganizationId int8,
	rightOrganizationId int8,
	name varchar(100),
	type_ varchar(75),
	recursable boolean,
	regionId int8,
	countryId int8,
	statusId int,
	comments lvarchar
)
extent size 16 next size 16
lock mode row;

create table OrgGroupPermission (
	organizationId int8 not null,
	groupId int8 not null,
	permissionId int8 not null,
	primary key (organizationId, groupId, permissionId)
)
extent size 16 next size 16
lock mode row;

create table OrgGroupRole (
	organizationId int8 not null,
	groupId int8 not null,
	roleId int8 not null,
	primary key (organizationId, groupId, roleId)
)
extent size 16 next size 16
lock mode row;

create table OrgLabor (
	orgLaborId int8 not null primary key,
	organizationId int8,
	typeId int,
	sunOpen int,
	sunClose int,
	monOpen int,
	monClose int,
	tueOpen int,
	tueClose int,
	wedOpen int,
	wedClose int,
	thuOpen int,
	thuClose int,
	friOpen int,
	friClose int,
	satOpen int,
	satClose int
)
extent size 16 next size 16
lock mode row;

create table PasswordPolicy (
	passwordPolicyId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	defaultPolicy boolean,
	name varchar(75),
	description lvarchar,
	changeable boolean,
	changeRequired boolean,
	minAge int8,
	checkSyntax boolean,
	allowDictionaryWords boolean,
	minLength int,
	history boolean,
	historyCount int,
	expireable boolean,
	maxAge int8,
	warningTime int8,
	graceLimit int,
	lockout boolean,
	maxFailure int,
	lockoutDuration int8,
	requireUnlock boolean,
	resetFailureCount int8
)
extent size 16 next size 16
lock mode row;

create table PasswordPolicyRel (
	passwordPolicyRelId int8 not null primary key,
	passwordPolicyId int8,
	classNameId int8,
	classPK int8
)
extent size 16 next size 16
lock mode row;

create table PasswordTracker (
	passwordTrackerId int8 not null primary key,
	userId int8,
	createDate datetime YEAR TO FRACTION,
	password_ varchar(75)
)
extent size 16 next size 16
lock mode row;

create table Permission_ (
	permissionId int8 not null primary key,
	companyId int8,
	actionId varchar(75),
	resourceId int8
)
extent size 16 next size 16
lock mode row;

create table Phone (
	phoneId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	number_ varchar(75),
	extension varchar(75),
	typeId int,
	primary_ boolean
)
extent size 16 next size 16
lock mode row;

create table PluginSetting (
	pluginSettingId int8 not null primary key,
	companyId int8,
	pluginId varchar(75),
	pluginType varchar(75),
	roles lvarchar,
	active_ boolean
)
extent size 16 next size 16
lock mode row;

create table PollsChoice (
	uuid_ varchar(75),
	choiceId int8 not null primary key,
	questionId int8,
	name varchar(75),
	description lvarchar(1000)
)
extent size 16 next size 16
lock mode row;

create table PollsQuestion (
	uuid_ varchar(75),
	questionId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	title lvarchar(500),
	description lvarchar,
	expirationDate datetime YEAR TO FRACTION,
	lastVoteDate datetime YEAR TO FRACTION
)
extent size 16 next size 16
lock mode row;

create table PollsVote (
	voteId int8 not null primary key,
	userId int8,
	questionId int8,
	choiceId int8,
	voteDate datetime YEAR TO FRACTION
)
extent size 16 next size 16
lock mode row;

create table Portlet (
	id_ int8 not null primary key,
	companyId int8,
	portletId varchar(200),
	roles lvarchar,
	active_ boolean
)
extent size 16 next size 16
lock mode row;

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

create table PortletPreferences (
	portletPreferencesId int8 not null primary key,
	ownerId int8,
	ownerType int,
	plid int8,
	portletId varchar(200),
	preferences text
)
extent size 16 next size 16
lock mode row;

create table RatingsEntry (
	entryId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	score float
)
extent size 16 next size 16
lock mode row;

create table RatingsStats (
	statsId int8 not null primary key,
	classNameId int8,
	classPK int8,
	totalEntries int,
	totalScore float,
	averageScore float
)
extent size 16 next size 16
lock mode row;

create table Region (
	regionId int8 not null primary key,
	countryId int8,
	regionCode varchar(75),
	name varchar(75),
	active_ boolean
)
extent size 16 next size 16
lock mode row;

create table Release_ (
	releaseId int8 not null primary key,
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	buildNumber int,
	buildDate datetime YEAR TO FRACTION,
	verified boolean,
	testString lvarchar(1024)
)
extent size 16 next size 16
lock mode row;

create table Resource_ (
	resourceId int8 not null primary key,
	codeId int8,
	primKey varchar(255)
)
extent size 16 next size 16
lock mode row;

create table ResourceAction (
	resourceActionId int8 not null primary key,
	name varchar(75),
	actionId varchar(75),
	bitwiseValue int8
)
extent size 16 next size 16
lock mode row;

create table ResourceCode (
	codeId int8 not null primary key,
	companyId int8,
	name varchar(255),
	scope int
)
extent size 16 next size 16
lock mode row;

create table ResourcePermission (
	resourcePermissionId int8 not null primary key,
	companyId int8,
	name varchar(255),
	scope int,
	primKey varchar(255),
	roleId int8,
	actionIds int8
)
extent size 16 next size 16
lock mode row;

create table Role_ (
	roleId int8 not null primary key,
	companyId int8,
	classNameId int8,
	classPK int8,
	name varchar(75),
	title lvarchar,
	description lvarchar,
	type_ int,
	subtype varchar(75)
)
extent size 16 next size 16
lock mode row;

create table Roles_Permissions (
	roleId int8 not null,
	permissionId int8 not null,
	primary key (roleId, permissionId)
)
extent size 16 next size 16
lock mode row;

create table SCFrameworkVersi_SCProductVers (
	frameworkVersionId int8 not null,
	productVersionId int8 not null,
	primary key (frameworkVersionId, productVersionId)
)
extent size 16 next size 16
lock mode row;

create table SCFrameworkVersion (
	frameworkVersionId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	name varchar(75),
	url lvarchar,
	active_ boolean,
	priority int
)
extent size 16 next size 16
lock mode row;

create table SCLicense (
	licenseId int8 not null primary key,
	name varchar(75),
	url lvarchar,
	openSource boolean,
	active_ boolean,
	recommended boolean
)
extent size 16 next size 16
lock mode row;

create table SCLicenses_SCProductEntries (
	licenseId int8 not null,
	productEntryId int8 not null,
	primary key (licenseId, productEntryId)
)
extent size 16 next size 16
lock mode row;

create table SCProductEntry (
	productEntryId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	name varchar(75),
	type_ varchar(75),
	tags varchar(255),
	shortDescription lvarchar,
	longDescription lvarchar,
	pageURL lvarchar,
	author varchar(75),
	repoGroupId varchar(75),
	repoArtifactId varchar(75)
)
extent size 16 next size 16
lock mode row;

create table SCProductScreenshot (
	productScreenshotId int8 not null primary key,
	companyId int8,
	groupId int8,
	productEntryId int8,
	thumbnailId int8,
	fullImageId int8,
	priority int
)
extent size 16 next size 16
lock mode row;

create table SCProductVersion (
	productVersionId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	productEntryId int8,
	version varchar(75),
	changeLog lvarchar,
	downloadPageURL lvarchar,
	directDownloadURL varchar(2000),
	repoStoreArtifact boolean
)
extent size 16 next size 16
lock mode row;

create table ServiceComponent (
	serviceComponentId int8 not null primary key,
	buildNamespace varchar(75),
	buildNumber int8,
	buildDate int8,
	data_ text
)
extent size 16 next size 16
lock mode row;

create table Shard (
	shardId int8 not null primary key,
	classNameId int8,
	classPK int8,
	name varchar(75)
)
extent size 16 next size 16
lock mode row;

create table ShoppingCart (
	cartId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	itemIds lvarchar,
	couponCodes varchar(75),
	altShipping int,
	insure boolean
)
extent size 16 next size 16
lock mode row;

create table ShoppingCategory (
	categoryId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	parentCategoryId int8,
	name varchar(75),
	description lvarchar
)
extent size 16 next size 16
lock mode row;

create table ShoppingCoupon (
	couponId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	code_ varchar(75),
	name varchar(75),
	description lvarchar,
	startDate datetime YEAR TO FRACTION,
	endDate datetime YEAR TO FRACTION,
	active_ boolean,
	limitCategories lvarchar,
	limitSkus lvarchar,
	minOrder float,
	discount float,
	discountType varchar(75)
)
extent size 16 next size 16
lock mode row;

create table ShoppingItem (
	itemId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	categoryId int8,
	sku varchar(75),
	name varchar(200),
	description lvarchar,
	properties lvarchar,
	fields_ boolean,
	fieldsQuantities lvarchar,
	minQuantity int,
	maxQuantity int,
	price float,
	discount float,
	taxable boolean,
	shipping float,
	useShippingFormula boolean,
	requiresShipping boolean,
	stockQuantity int,
	featured_ boolean,
	sale_ boolean,
	smallImage boolean,
	smallImageId int8,
	smallImageURL varchar(75),
	mediumImage boolean,
	mediumImageId int8,
	mediumImageURL varchar(75),
	largeImage boolean,
	largeImageId int8,
	largeImageURL varchar(75)
)
extent size 16 next size 16
lock mode row;

create table ShoppingItemField (
	itemFieldId int8 not null primary key,
	itemId int8,
	name varchar(75),
	values_ lvarchar,
	description lvarchar
)
extent size 16 next size 16
lock mode row;

create table ShoppingItemPrice (
	itemPriceId int8 not null primary key,
	itemId int8,
	minQuantity int,
	maxQuantity int,
	price float,
	discount float,
	taxable boolean,
	shipping float,
	useShippingFormula boolean,
	status int
)
extent size 16 next size 16
lock mode row;

create table ShoppingOrder (
	orderId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	number_ varchar(75),
	tax float,
	shipping float,
	altShipping varchar(75),
	requiresShipping boolean,
	insure boolean,
	insurance float,
	couponCodes varchar(75),
	couponDiscount float,
	billingFirstName varchar(75),
	billingLastName varchar(75),
	billingEmailAddress varchar(75),
	billingCompany varchar(75),
	billingStreet varchar(75),
	billingCity varchar(75),
	billingState varchar(75),
	billingZip varchar(75),
	billingCountry varchar(75),
	billingPhone varchar(75),
	shipToBilling boolean,
	shippingFirstName varchar(75),
	shippingLastName varchar(75),
	shippingEmailAddress varchar(75),
	shippingCompany varchar(75),
	shippingStreet varchar(75),
	shippingCity varchar(75),
	shippingState varchar(75),
	shippingZip varchar(75),
	shippingCountry varchar(75),
	shippingPhone varchar(75),
	ccName varchar(75),
	ccType varchar(75),
	ccNumber varchar(75),
	ccExpMonth int,
	ccExpYear int,
	ccVerNumber varchar(75),
	comments lvarchar,
	ppTxnId varchar(75),
	ppPaymentStatus varchar(75),
	ppPaymentGross float,
	ppReceiverEmail varchar(75),
	ppPayerEmail varchar(75),
	sendOrderEmail boolean,
	sendShippingEmail boolean
)
extent size 16 next size 16
lock mode row;

create table ShoppingOrderItem (
	orderItemId int8 not null primary key,
	orderId int8,
	itemId varchar(75),
	sku varchar(75),
	name varchar(200),
	description lvarchar,
	properties lvarchar,
	price float,
	quantity int,
	shippedDate datetime YEAR TO FRACTION
)
extent size 16 next size 16
lock mode row;

create table SocialActivity (
	activityId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	createDate datetime YEAR TO FRACTION,
	mirrorActivityId int8,
	classNameId int8,
	classPK int8,
	type_ int,
	extraData lvarchar,
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

create table SocialRequest (
	uuid_ varchar(75),
	requestId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	type_ int,
	extraData lvarchar,
	receiverUserId int8,
	status int
)
extent size 16 next size 16
lock mode row;

create table Subscription (
	subscriptionId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	frequency varchar(75)
)
extent size 16 next size 16
lock mode row;

create table TagsAsset (
	assetId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	visible boolean,
	startDate datetime YEAR TO FRACTION,
	endDate datetime YEAR TO FRACTION,
	publishDate datetime YEAR TO FRACTION,
	expirationDate datetime YEAR TO FRACTION,
	mimeType varchar(75),
	title varchar(255),
	description lvarchar,
	summary lvarchar,
	url lvarchar,
	height int,
	width int,
	priority float,
	viewCount int
)
extent size 16 next size 16
lock mode row;

create table TagsAssets_TagsEntries (
	assetId int8 not null,
	entryId int8 not null,
	primary key (assetId, entryId)
)
extent size 16 next size 16
lock mode row;

create table TagsEntry (
	entryId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	parentEntryId int8,
	name varchar(75),
	vocabularyId int8
)
extent size 16 next size 16
lock mode row;

create table TagsProperty (
	propertyId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	entryId int8,
	key_ varchar(75),
	value varchar(255)
)
extent size 16 next size 16
lock mode row;

create table TagsSource (
	sourceId int8 not null primary key,
	parentSourceId int8,
	name varchar(75),
	acronym varchar(75)
)
extent size 16 next size 16
lock mode row;

create table TagsVocabulary (
	vocabularyId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	name varchar(75),
	description varchar(75),
	folksonomy boolean
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

create table User_ (
	uuid_ varchar(75),
	userId int8 not null primary key,
	companyId int8,
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	defaultUser boolean,
	contactId int8,
	password_ varchar(75),
	passwordEncrypted boolean,
	passwordReset boolean,
	passwordModifiedDate datetime YEAR TO FRACTION,
	reminderQueryQuestion varchar(75),
	reminderQueryAnswer varchar(75),
	graceLoginCount int,
	screenName varchar(75),
	emailAddress varchar(75),
	openId lvarchar(1024),
	portraitId int8,
	languageId varchar(75),
	timeZoneId varchar(75),
	greeting varchar(255),
	comments lvarchar,
	firstName varchar(75),
	middleName varchar(75),
	lastName varchar(75),
	jobTitle varchar(75),
	loginDate datetime YEAR TO FRACTION,
	loginIP varchar(75),
	lastLoginDate datetime YEAR TO FRACTION,
	lastLoginIP varchar(75),
	lastFailedLoginDate datetime YEAR TO FRACTION,
	failedLoginAttempts int,
	lockout boolean,
	lockoutDate datetime YEAR TO FRACTION,
	agreedToTermsOfUse boolean,
	active_ boolean
)
extent size 16 next size 16
lock mode row;

create table UserGroup (
	userGroupId int8 not null primary key,
	companyId int8,
	parentUserGroupId int8,
	name varchar(75),
	description lvarchar
)
extent size 16 next size 16
lock mode row;

create table UserGroupRole (
	userId int8 not null,
	groupId int8 not null,
	roleId int8 not null,
	primary key (userId, groupId, roleId)
)
extent size 16 next size 16
lock mode row;

create table UserIdMapper (
	userIdMapperId int8 not null primary key,
	userId int8,
	type_ varchar(75),
	description varchar(75),
	externalUserId varchar(75)
)
extent size 16 next size 16
lock mode row;

create table Users_Groups (
	userId int8 not null,
	groupId int8 not null,
	primary key (userId, groupId)
)
extent size 16 next size 16
lock mode row;

create table Users_Orgs (
	userId int8 not null,
	organizationId int8 not null,
	primary key (userId, organizationId)
)
extent size 16 next size 16
lock mode row;

create table Users_Permissions (
	userId int8 not null,
	permissionId int8 not null,
	primary key (userId, permissionId)
)
extent size 16 next size 16
lock mode row;

create table Users_Roles (
	userId int8 not null,
	roleId int8 not null,
	primary key (userId, roleId)
)
extent size 16 next size 16
lock mode row;

create table Users_UserGroups (
	userGroupId int8 not null,
	userId int8 not null,
	primary key (userGroupId, userId)
)
extent size 16 next size 16
lock mode row;

create table UserTracker (
	userTrackerId int8 not null primary key,
	companyId int8,
	userId int8,
	modifiedDate datetime YEAR TO FRACTION,
	sessionId varchar(200),
	remoteAddr varchar(75),
	remoteHost varchar(75),
	userAgent varchar(200)
)
extent size 16 next size 16
lock mode row;

create table UserTrackerPath (
	userTrackerPathId int8 not null primary key,
	userTrackerId int8,
	path_ lvarchar,
	pathDate datetime YEAR TO FRACTION
)
extent size 16 next size 16
lock mode row;

create table Vocabulary (
	vocabularyId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	name varchar(75),
	description varchar(75),
	folksonomy boolean
)
extent size 16 next size 16
lock mode row;

create table WebDAVProps (
	webDavPropsId int8 not null primary key,
	companyId int8,
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	props text
)
extent size 16 next size 16
lock mode row;

create table Website (
	websiteId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	url lvarchar,
	typeId int,
	primary_ boolean
)
extent size 16 next size 16
lock mode row;

create table WikiNode (
	uuid_ varchar(75),
	nodeId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	name varchar(75),
	description lvarchar,
	lastPostDate datetime YEAR TO FRACTION
)
extent size 16 next size 16
lock mode row;

create table WikiPage (
	uuid_ varchar(75),
	pageId int8 not null primary key,
	resourcePrimKey int8,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	nodeId int8,
	title varchar(255),
	version float,
	minorEdit boolean,
	content text,
	summary lvarchar,
	format varchar(75),
	head boolean,
	parentTitle varchar(75),
	redirectTitle varchar(75)
)
extent size 16 next size 16
lock mode row;

create table WikiPageResource (
	resourcePrimKey int8 not null primary key,
	nodeId int8,
	title varchar(75)
)
extent size 16 next size 16
lock mode row;



insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (1, 'Canada', 'CA', 'CAN', '124', '001', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (2, 'China', 'CN', 'CHN', '156', '086', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (3, 'France', 'FR', 'FRA', '250', '033', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (4, 'Germany', 'DE', 'DEU', '276', '049', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (5, 'Hong Kong', 'HK', 'HKG', '344', '852', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (6, 'Hungary', 'HU', 'HUN', '348', '036', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (7, 'Israel', 'IL', 'ISR', '376', '972', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (8, 'Italy', 'IT', 'ITA', '380', '039', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (9, 'Japan', 'JP', 'JPN', '392', '081', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (10, 'South Korea', 'KR', 'KOR', '410', '082', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (11, 'Netherlands', 'NL', 'NLD', '528', '031', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (12, 'Portugal', 'PT', 'PRT', '620', '351', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (13, 'Russia', 'RU', 'RUS', '643', '007', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (14, 'Singapore', 'SG', 'SGP', '702', '065', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (15, 'Spain', 'ES', 'ESP', '724', '034', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (16, 'Turkey', 'TR', 'TUR', '792', '090', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (17, 'Vietnam', 'VM', 'VNM', '704', '084', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (18, 'United Kingdom', 'GB', 'GBR', '826', '044', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (19, 'United States', 'US', 'USA', '840', '001', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (20, 'Afghanistan', 'AF', 'AFG', '4', '093', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (21, 'Albania', 'AL', 'ALB', '8', '355', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (22, 'Algeria', 'DZ', 'DZA', '12', '213', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (23, 'American Samoa', 'AS', 'ASM', '16', '684', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (24, 'Andorra', 'AD', 'AND', '20', '376', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (25, 'Angola', 'AO', 'AGO', '24', '244', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (26, 'Anguilla', 'AI', 'AIA', '660', '264', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (27, 'Antarctica', 'AQ', 'ATA', '10', '672', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (28, 'Antigua', 'AG', 'ATG', '28', '268', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (29, 'Argentina', 'AR', 'ARG', '32', '054', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (30, 'Armenia', 'AM', 'ARM', '51', '374', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (31, 'Aruba', 'AW', 'ABW', '533', '297', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (32, 'Australia', 'AU', 'AUS', '36', '061', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (33, 'Austria', 'AT', 'AUT', '40', '043', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (34, 'Azerbaijan', 'AZ', 'AZE', '31', '994', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (35, 'Bahamas', 'BS', 'BHS', '44', '242', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (36, 'Bahrain', 'BH', 'BHR', '48', '973', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (37, 'Bangladesh', 'BD', 'BGD', '50', '880', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (38, 'Barbados', 'BB', 'BRB', '52', '246', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (39, 'Belarus', 'BY', 'BLR', '112', '375', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (40, 'Belgium', 'BE', 'BEL', '56', '032', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (41, 'Belize', 'BZ', 'BLZ', '84', '501', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (42, 'Benin', 'BJ', 'BEN', '204', '229', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (43, 'Bermuda', 'BM', 'BMU', '60', '441', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (44, 'Bhutan', 'BT', 'BTN', '64', '975', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (45, 'Bolivia', 'BO', 'BOL', '68', '591', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (46, 'Bosnia-Herzegovina', 'BA', 'BIH', '70', '387', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (47, 'Botswana', 'BW', 'BWA', '72', '267', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (48, 'Brazil', 'BR', 'BRA', '76', '055', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (49, 'British Virgin Islands', 'VG', 'VGB', '92', '284', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (50, 'Brunei', 'BN', 'BRN', '96', '673', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (51, 'Bulgaria', 'BG', 'BGR', '100', '359', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (52, 'Burkina Faso', 'BF', 'BFA', '854', '226', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (53, 'Burma (Myanmar)', 'MM', 'MMR', '104', '095', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (54, 'Burundi', 'BI', 'BDI', '108', '257', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (55, 'Cambodia', 'KH', 'KHM', '116', '855', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (56, 'Cameroon', 'CM', 'CMR', '120', '237', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (57, 'Cape Verde Island', 'CV', 'CPV', '132', '238', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (58, 'Cayman Islands', 'KY', 'CYM', '136', '345', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (59, 'Central African Republic', 'CF', 'CAF', '140', '236', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (60, 'Chad', 'TD', 'TCD', '148', '235', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (61, 'Chile', 'CL', 'CHL', '152', '056', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (62, 'Christmas Island', 'CX', 'CXR', '162', '061', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (63, 'Cocos Islands', 'CC', 'CCK', '166', '061', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (64, 'Colombia', 'CO', 'COL', '170', '057', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (65, 'Comoros', 'KM', 'COM', '174', '269', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (66, 'Republic of Congo', 'CD', 'COD', '180', '242', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (67, 'Democratic Republic of Congo', 'CG', 'COG', '178', '243', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (68, 'Cook Islands', 'CK', 'COK', '184', '682', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (69, 'Costa Rica', 'CR', 'CRI', '188', '506', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (70, 'Croatia', 'HR', 'HRV', '191', '385', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (71, 'Cuba', 'CU', 'CUB', '192', '053', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (72, 'Cyprus', 'CY', 'CYP', '196', '357', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (73, 'Czech Republic', 'CZ', 'CZE', '203', '420', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (74, 'Denmark', 'DK', 'DNK', '208', '045', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (75, 'Djibouti', 'DJ', 'DJI', '262', '253', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (76, 'Dominica', 'DM', 'DMA', '212', '767', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (77, 'Dominican Republic', 'DO', 'DOM', '214', '809', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (78, 'Ecuador', 'EC', 'ECU', '218', '593', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (79, 'Egypt', 'EG', 'EGY', '818', '020', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (80, 'El Salvador', 'SV', 'SLV', '222', '503', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (81, 'Equatorial Guinea', 'GQ', 'GNQ', '226', '240', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (82, 'Eritrea', 'ER', 'ERI', '232', '291', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (83, 'Estonia', 'EE', 'EST', '233', '372', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (84, 'Ethiopia', 'ET', 'ETH', '231', '251', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (85, 'Faeroe Islands', 'FO', 'FRO', '234', '298', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (86, 'Falkland Islands', 'FK', 'FLK', '238', '500', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (87, 'Fiji Islands', 'FJ', 'FJI', '242', '679', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (88, 'Finland', 'FI', 'FIN', '246', '358', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (89, 'French Guiana', 'GF', 'GUF', '254', '594', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (90, 'French Polynesia', 'PF', 'PYF', '258', '689', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (91, 'Gabon', 'GA', 'GAB', '266', '241', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (92, 'Gambia', 'GM', 'GMB', '270', '220', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (93, 'Georgia', 'GE', 'GEO', '268', '995', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (94, 'Ghana', 'GH', 'GHA', '288', '233', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (95, 'Gibraltar', 'GI', 'GIB', '292', '350', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (96, 'Greece', 'GR', 'GRC', '300', '030', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (97, 'Greenland', 'GL', 'GRL', '304', '299', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (98, 'Grenada', 'GD', 'GRD', '308', '473', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (99, 'Guadeloupe', 'GP', 'GLP', '312', '590', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (100, 'Guam', 'GU', 'GUM', '316', '671', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (101, 'Guatemala', 'GT', 'GTM', '320', '502', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (102, 'Guinea', 'GN', 'GIN', '324', '224', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (103, 'Guinea-Bissau', 'GW', 'GNB', '624', '245', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (104, 'Guyana', 'GY', 'GUY', '328', '592', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (105, 'Haiti', 'HT', 'HTI', '332', '509', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (106, 'Honduras', 'HN', 'HND', '340', '504', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (107, 'Iceland', 'IS', 'ISL', '352', '354', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (108, 'India', 'IN', 'IND', '356', '091', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (109, 'Indonesia', 'ID', 'IDN', '360', '062', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (110, 'Iran', 'IR', 'IRN', '364', '098', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (111, 'Iraq', 'IQ', 'IRQ', '368', '964', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (112, 'Ireland', 'IE', 'IRL', '372', '353', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (113, 'Ivory Coast', 'CI', 'CIV', '384', '225', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (114, 'Jamaica', 'JM', 'JAM', '388', '876', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (115, 'Jordan', 'JO', 'JOR', '400', '962', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (116, 'Kazakhstan', 'KZ', 'KAZ', '398', '007', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (117, 'Kenya', 'KE', 'KEN', '404', '254', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (118, 'Kiribati', 'KI', 'KIR', '408', '686', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (119, 'Kuwait', 'KW', 'KWT', '414', '965', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (120, 'North Korea', 'KP', 'PRK', '408', '850', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (121, 'Kyrgyzstan', 'KG', 'KGZ', '471', '996', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (122, 'Laos', 'LA', 'LAO', '418', '856', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (123, 'Latvia', 'LV', 'LVA', '428', '371', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (124, 'Lebanon', 'LB', 'LBN', '422', '961', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (125, 'Lesotho', 'LS', 'LSO', '426', '266', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (126, 'Liberia', 'LR', 'LBR', '430', '231', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (127, 'Libya', 'LY', 'LBY', '434', '218', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (128, 'Liechtenstein', 'LI', 'LIE', '438', '423', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (129, 'Lithuania', 'LT', 'LTU', '440', '370', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (130, 'Luxembourg', 'LU', 'LUX', '442', '352', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (131, 'Macau', 'MO', 'MAC', '446', '853', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (132, 'Macedonia', 'MK', 'MKD', '807', '389', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (133, 'Madagascar', 'MG', 'MDG', '450', '261', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (134, 'Malawi', 'MW', 'MWI', '454', '265', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (135, 'Malaysia', 'MY', 'MYS', '458', '060', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (136, 'Maldives', 'MV', 'MDV', '462', '960', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (137, 'Mali', 'ML', 'MLI', '466', '223', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (138, 'Malta', 'MT', 'MLT', '470', '356', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (139, 'Marshall Islands', 'MH', 'MHL', '584', '692', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (140, 'Martinique', 'MQ', 'MTQ', '474', '596', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (141, 'Mauritania', 'MR', 'MRT', '478', '222', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (142, 'Mauritius', 'MU', 'MUS', '480', '230', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (143, 'Mayotte Island', 'YT', 'MYT', '175', '269', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (144, 'Mexico', 'MX', 'MEX', '484', '052', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (145, 'Micronesia', 'FM', 'FSM', '583', '691', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (146, 'Moldova', 'MD', 'MDA', '498', '373', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (147, 'Monaco', 'MC', 'MCO', '492', '377', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (148, 'Mongolia', 'MN', 'MNG', '496', '976', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (149, 'Montenegro', 'ME', 'MNE', '499', '382', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (150, 'Montserrat', 'MS', 'MSR', '500', '664', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (151, 'Morocco', 'MA', 'MAR', '504', '212', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (152, 'Mozambique', 'MZ', 'MOZ', '508', '258', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (153, 'Namibia', 'NA', 'NAM', '516', '264', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (154, 'Nauru', 'NR', 'NRU', '520', '674', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (155, 'Nepal', 'NP', 'NPL', '524', '977', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (156, 'Netherlands Antilles', 'AN', 'ANT', '530', '599', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (157, 'New Caledonia', 'NC', 'NCL', '540', '687', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (158, 'New Zealand', 'NZ', 'NZL', '554', '064', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (159, 'Nicaragua', 'NI', 'NIC', '558', '505', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (160, 'Niger', 'NE', 'NER', '562', '227', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (161, 'Nigeria', 'NG', 'NGA', '566', '234', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (162, 'Niue', 'NU', 'NIU', '570', '683', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (163, 'Norfolk Island', 'NF', 'NFK', '574', '672', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (164, 'Norway', 'NO', 'NOR', '578', '047', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (165, 'Oman', 'OM', 'OMN', '512', '968', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (166, 'Pakistan', 'PK', 'PAK', '586', '092', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (167, 'Palau', 'PW', 'PLW', '585', '680', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (168, 'Palestine', 'PS', 'PSE', '275', '970', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (169, 'Panama', 'PA', 'PAN', '591', '507', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (170, 'Papua New Guinea', 'PG', 'PNG', '598', '675', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (171, 'Paraguay', 'PY', 'PRY', '600', '595', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (172, 'Peru', 'PE', 'PER', '604', '051', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (173, 'Philippines', 'PH', 'PHL', '608', '063', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (174, 'Poland', 'PL', 'POL', '616', '048', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (175, 'Puerto Rico', 'PR', 'PRI', '630', '787', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (176, 'Qatar', 'QA', 'QAT', '634', '974', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (177, 'Reunion Island', 'RE', 'REU', '638', '262', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (178, 'Romania', 'RO', 'ROU', '642', '040', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (179, 'Rwanda', 'RW', 'RWA', '646', '250', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (180, 'St. Helena', 'SH', 'SHN', '654', '290', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (181, 'St. Kitts', 'KN', 'KNA', '659', '869', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (182, 'St. Lucia', 'LC', 'LCA', '662', '758', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (183, 'St. Pierre & Miquelon', 'PM', 'SPM', '666', '508', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (184, 'St. Vincent', 'VC', 'VCT', '670', '784', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (185, 'San Marino', 'SM', 'SMR', '674', '378', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (186, 'Sao Tome & Principe', 'ST', 'STP', '678', '239', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (187, 'Saudi Arabia', 'SA', 'SAU', '682', '966', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (188, 'Senegal', 'SN', 'SEN', '686', '221', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (189, 'Serbia', 'RS', 'SRB', '688', '381', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (190, 'Seychelles', 'SC', 'SYC', '690', '248', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (191, 'Sierra Leone', 'SL', 'SLE', '694', '249', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (192, 'Slovakia', 'SK', 'SVK', '703', '421', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (193, 'Slovenia', 'SI', 'SVN', '705', '386', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (194, 'Solomon Islands', 'SB', 'SLB', '90', '677', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (195, 'Somalia', 'SO', 'SOM', '706', '252', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (196, 'South Africa', 'ZA', 'ZAF', '710', '027', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (197, 'Sri Lanka', 'LK', 'LKA', '144', '094', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (198, 'Sudan', 'SD', 'SDN', '736', '095', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (199, 'Suriname', 'SR', 'SUR', '740', '597', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (200, 'Swaziland', 'SZ', 'SWZ', '748', '268', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (201, 'Sweden', 'SE', 'SWE', '752', '046', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (202, 'Switzerland', 'CH', 'CHE', '756', '041', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (203, 'Syria', 'SY', 'SYR', '760', '963', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (204, 'Taiwan', 'TW', 'TWN', '158', '886', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (205, 'Tajikistan', 'TJ', 'TJK', '762', '992', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (206, 'Tanzania', 'TZ', 'TZA', '834', '255', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (207, 'Thailand', 'TH', 'THA', '764', '066', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (208, 'Togo', 'TG', 'TGO', '768', '228', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (209, 'Tonga', 'TO', 'TON', '776', '676', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (210, 'Trinidad & Tobago', 'TT', 'TTO', '780', '868', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (211, 'Tunisia', 'TN', 'TUN', '788', '216', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (212, 'Turkmenistan', 'TM', 'TKM', '795', '993', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (213, 'Turks & Caicos', 'TC', 'TCA', '796', '649', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (214, 'Tuvalu', 'TV', 'TUV', '798', '688', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (215, 'Uganda', 'UG', 'UGA', '800', '256', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (216, 'Ukraine', 'UA', 'UKR', '804', '380', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (217, 'United Arab Emirates', 'AE', 'ARE', '784', '971', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (218, 'Uruguay', 'UY', 'URY', '858', '598', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (219, 'Uzbekistan', 'UZ', 'UZB', '860', '998', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (220, 'Vanuatu', 'VU', 'VUT', '548', '678', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (221, 'Vatican City', 'VA', 'VAT', '336', '039', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (222, 'Venezuela', 'VE', 'VEN', '862', '058', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (223, 'Wallis & Futuna', 'WF', 'WLF', '876', '681', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (224, 'Western Samoa', 'EH', 'ESH', '732', '685', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (225, 'Yemen', 'YE', 'YEM', '887', '967', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (226, 'Zambia', 'ZM', 'ZMB', '894', '260', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (227, 'Zimbabwe', 'ZW', 'ZWE', '716', '263', 'T');

insert into Region (regionId, countryId, regionCode, name, active_) values (1001, 1, 'AB', 'Alberta', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (1002, 1, 'BC', 'British Columbia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (1003, 1, 'MB', 'Manitoba', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (1004, 1, 'NB', 'New Brunswick', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (1005, 1, 'NL', 'Newfoundland and Labrador', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (1006, 1, 'NT', 'Northwest Territories', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (1007, 1, 'NS', 'Nova Scotia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (1008, 1, 'NU', 'Nunavut', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (1009, 1, 'ON', 'Ontario', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (1010, 1, 'PE', 'Prince Edward Island', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (1011, 1, 'QC', 'Quebec', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (1012, 1, 'SK', 'Saskatchewan', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (1013, 1, 'YT', 'Yukon', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3001, 3, 'A', 'Alsace', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3002, 3, 'B', 'Aquitaine', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3003, 3, 'C', 'Auvergne', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3004, 3, 'P', 'Basse-Normandie', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3005, 3, 'D', 'Bourgogne', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3006, 3, 'E', 'Bretagne', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3007, 3, 'F', 'Centre', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3008, 3, 'G', 'Champagne-Ardenne', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3009, 3, 'H', 'Corse', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3010, 3, 'GF', 'Guyane', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3011, 3, 'I', 'Franche Comté', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3012, 3, 'GP', 'Guadeloupe', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3013, 3, 'Q', 'Haute-Normandie', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3014, 3, 'J', 'Île-de-France', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3015, 3, 'K', 'Languedoc-Roussillon', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3016, 3, 'L', 'Limousin', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3017, 3, 'M', 'Lorraine', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3018, 3, 'MQ', 'Martinique', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3019, 3, 'N', 'Midi-Pyrénées', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3020, 3, 'O', 'Nord Pas de Calais', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3021, 3, 'R', 'Pays de la Loire', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3022, 3, 'S', 'Picardie', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3023, 3, 'T', 'Poitou-Charentes', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3024, 3, 'U', 'Provence-Alpes-Côte-d\'Azur', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3025, 3, 'RE', 'Réunion', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (3026, 3, 'V', 'Rhône-Alpes', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4001, 4, 'BW', 'Baden-Württemberg', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4002, 4, 'BY', 'Bayern', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4003, 4, 'BE', 'Berlin', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4004, 4, 'BR', 'Brandenburg', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4005, 4, 'HB', 'Bremen', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4006, 4, 'HH', 'Hamburg', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4007, 4, 'HE', 'Hessen', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4008, 4, 'MV', 'Mecklenburg-Vorpommern', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4009, 4, 'NI', 'Niedersachsen', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4010, 4, 'NW', 'Nordrhein-Westfalen', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4011, 4, 'RP', 'Rheinland-Pfalz', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4012, 4, 'SL', 'Saarland', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4013, 4, 'SN', 'Sachsen', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4014, 4, 'ST', 'Sachsen-Anhalt', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4015, 4, 'SH', 'Schleswig-Holstein', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (4016, 4, 'TH', 'Thüringen', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8001, 8, 'AG', 'Agrigento', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8002, 8, 'AL', 'Alessandria', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8003, 8, 'AN', 'Ancona', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8004, 8, 'AO', 'Aosta', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8005, 8, 'AR', 'Arezzo', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8006, 8, 'AP', 'Ascoli Piceno', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8007, 8, 'AT', 'Asti', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8008, 8, 'AV', 'Avellino', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8009, 8, 'BA', 'Bari', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8010, 8, 'BT', 'Barletta-Andria-Trani', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8011, 8, 'BL', 'Belluno', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8012, 8, 'BN', 'Benevento', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8013, 8, 'BG', 'Bergamo', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8014, 8, 'BI', 'Biella', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8015, 8, 'BO', 'Bologna', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8016, 8, 'BZ', 'Bolzano', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8017, 8, 'BS', 'Brescia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8018, 8, 'BR', 'Brindisi', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8019, 8, 'CA', 'Cagliari', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8020, 8, 'CL', 'Caltanissetta', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8021, 8, 'CB', 'Campobasso', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8022, 8, 'CI', 'Carbonia-Iglesias', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8023, 8, 'CE', 'Caserta', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8024, 8, 'CT', 'Catania', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8025, 8, 'CZ', 'Catanzaro', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8026, 8, 'CH', 'Chieti', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8027, 8, 'CO', 'Como', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8028, 8, 'CS', 'Cosenza', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8029, 8, 'CR', 'Cremona', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8030, 8, 'KR', 'Crotone', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8031, 8, 'CN', 'Cuneo', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8032, 8, 'EN', 'Enna', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8033, 8, 'FM', 'Fermo', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8034, 8, 'FE', 'Ferrara', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8035, 8, 'FI', 'Firenze', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8036, 8, 'FG', 'Foggia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8037, 8, 'FC', 'Forli-Cesena', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8038, 8, 'FR', 'Frosinone', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8039, 8, 'GE', 'Genova', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8040, 8, 'GO', 'Gorizia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8041, 8, 'GR', 'Grosseto', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8042, 8, 'IM', 'Imperia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8043, 8, 'IS', 'Isernia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8044, 8, 'AQ', 'L''Aquila', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8045, 8, 'SP', 'La Spezia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8046, 8, 'LT', 'Latina', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8047, 8, 'LE', 'Lecce', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8048, 8, 'LC', 'Lecco', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8049, 8, 'LI', 'Livorno', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8050, 8, 'LO', 'Lodi', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8051, 8, 'LU', 'Lucca', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8052, 8, 'MC', 'Macerata', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8053, 8, 'MN', 'Mantova', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8054, 8, 'MS', 'Massa-Carrara', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8055, 8, 'MT', 'Matera', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8056, 8, 'MA', 'Medio Campidano', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8057, 8, 'ME', 'Messina', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8058, 8, 'MI', 'Milano', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8059, 8, 'MO', 'Modena', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8060, 8, 'MZ', 'Monza', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8061, 8, 'NA', 'Napoli', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8062, 8, 'NO', 'Novara', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8063, 8, 'NU', 'Nuoro', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8064, 8, 'OG', 'Ogliastra', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8065, 8, 'OT', 'Olbia-Tempio', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8066, 8, 'OR', 'Oristano', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8067, 8, 'PD', 'Padova', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8068, 8, 'PA', 'Palermo', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8069, 8, 'PR', 'Parma', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8070, 8, 'PV', 'Pavia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8071, 8, 'PG', 'Perugia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8072, 8, 'PU', 'Pesaro e Urbino', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8073, 8, 'PE', 'Pescara', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8074, 8, 'PC', 'Piacenza', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8075, 8, 'PI', 'Pisa', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8076, 8, 'PT', 'Pistoia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8077, 8, 'PN', 'Pordenone', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8078, 8, 'PZ', 'Potenza', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8079, 8, 'PO', 'Prato', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8080, 8, 'RG', 'Ragusa', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8081, 8, 'RA', 'Ravenna', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8082, 8, 'RC', 'Reggio Calabria', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8083, 8, 'RE', 'Reggio Emilia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8084, 8, 'RI', 'Rieti', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8085, 8, 'RN', 'Rimini', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8086, 8, 'RM', 'Roma', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8087, 8, 'RO', 'Rovigo', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8088, 8, 'SA', 'Salerno', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8089, 8, 'SS', 'Sassari', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8090, 8, 'SV', 'Savona', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8091, 8, 'SI', 'Siena', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8092, 8, 'SR', 'Siracusa', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8093, 8, 'SO', 'Sondrio', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8094, 8, 'TA', 'Taranto', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8095, 8, 'TE', 'Teramo', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8096, 8, 'TR', 'Terni', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8097, 8, 'TO', 'Torino', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8098, 8, 'TP', 'Trapani', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8099, 8, 'TN', 'Trento', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8100, 8, 'TV', 'Treviso', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8101, 8, 'TS', 'Trieste', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8102, 8, 'UD', 'Udine', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8103, 8, 'VA', 'Varese', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8104, 8, 'VE', 'Venezia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8105, 8, 'VB', 'Verbano-Cusio-Ossola', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8106, 8, 'VC', 'Vercelli', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8107, 8, 'VR', 'Verona', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8108, 8, 'VV', 'Vibo Valentia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8109, 8, 'VI', 'Vicenza', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (8110, 8, 'VT', 'Viterbo', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15001, 15, 'AN', 'Andalusia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15002, 15, 'AR', 'Aragon', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15003, 15, 'AS', 'Asturias', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15004, 15, 'IB', 'Balearic Islands', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15005, 15, 'PV', 'Basque Country', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15006, 15, 'CN', 'Canary Islands', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15007, 15, 'CB', 'Cantabria', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15008, 15, 'CL', 'Castile and Leon', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15009, 15, 'CM', 'Castile-La Mancha', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15010, 15, 'CT', 'Catalonia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15011, 15, 'CE', 'Ceuta', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15012, 15, 'EX', 'Extremadura', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15013, 15, 'GA', 'Galicia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15014, 15, 'LO', 'La Rioja', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15015, 15, 'M', 'Madrid', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15016, 15, 'ML', 'Melilla', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15017, 15, 'MU', 'Murcia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15018, 15, 'NA', 'Navarra', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (15019, 15, 'VC', 'Valencia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19001, 19, 'AL', 'Alabama', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19002, 19, 'AK', 'Alaska', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19003, 19, 'AZ', 'Arizona', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19004, 19, 'AR', 'Arkansas', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19005, 19, 'CA', 'California', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19006, 19, 'CO', 'Colorado', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19007, 19, 'CT', 'Connecticut', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19008, 19, 'DC', 'District of Columbia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19009, 19, 'DE', 'Delaware', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19010, 19, 'FL', 'Florida', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19011, 19, 'GA', 'Georgia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19012, 19, 'HI', 'Hawaii', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19013, 19, 'ID', 'Idaho', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19014, 19, 'IL', 'Illinois', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19015, 19, 'IN', 'Indiana', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19016, 19, 'IA', 'Iowa', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19017, 19, 'KS', 'Kansas', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19018, 19, 'KY', 'Kentucky ', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19019, 19, 'LA', 'Louisiana ', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19020, 19, 'ME', 'Maine', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19021, 19, 'MD', 'Maryland', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19022, 19, 'MA', 'Massachusetts', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19023, 19, 'MI', 'Michigan', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19024, 19, 'MN', 'Minnesota', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19025, 19, 'MS', 'Mississippi', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19026, 19, 'MO', 'Missouri', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19027, 19, 'MT', 'Montana', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19028, 19, 'NE', 'Nebraska', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19029, 19, 'NV', 'Nevada', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19030, 19, 'NH', 'New Hampshire', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19031, 19, 'NJ', 'New Jersey', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19032, 19, 'NM', 'New Mexico', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19033, 19, 'NY', 'New York', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19034, 19, 'NC', 'North Carolina', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19035, 19, 'ND', 'North Dakota', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19036, 19, 'OH', 'Ohio', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19037, 19, 'OK', 'Oklahoma ', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19038, 19, 'OR', 'Oregon', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19039, 19, 'PA', 'Pennsylvania', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19040, 19, 'PR', 'Puerto Rico', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19041, 19, 'RI', 'Rhode Island', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19042, 19, 'SC', 'South Carolina', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19043, 19, 'SD', 'South Dakota', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19044, 19, 'TN', 'Tennessee', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19045, 19, 'TX', 'Texas', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19046, 19, 'UT', 'Utah', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19047, 19, 'VT', 'Vermont', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19048, 19, 'VA', 'Virginia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19049, 19, 'WA', 'Washington', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19050, 19, 'WV', 'West Virginia', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19051, 19, 'WI', 'Wisconsin', 'T');
insert into Region (regionId, countryId, regionCode, name, active_) values (19052, 19, 'WY', 'Wyoming', 'T');

--
-- List types for accounts
--

insert into ListType (listTypeId, name, type_) values (10000, 'Billing', 'com.liferay.portal.model.Account.address');
insert into ListType (listTypeId, name, type_) values (10001, 'Other', 'com.liferay.portal.model.Account.address');
insert into ListType (listTypeId, name, type_) values (10002, 'P.O. Box', 'com.liferay.portal.model.Account.address');
insert into ListType (listTypeId, name, type_) values (10003, 'Shipping', 'com.liferay.portal.model.Account.address');

insert into ListType (listTypeId, name, type_) values (10004, 'E-mail', 'com.liferay.portal.model.Account.emailAddress');
insert into ListType (listTypeId, name, type_) values (10005, 'E-mail 2', 'com.liferay.portal.model.Account.emailAddress');
insert into ListType (listTypeId, name, type_) values (10006, 'E-mail 3', 'com.liferay.portal.model.Account.emailAddress');

insert into ListType (listTypeId, name, type_) values (10007, 'Fax', 'com.liferay.portal.model.Account.phone');
insert into ListType (listTypeId, name, type_) values (10008, 'Local', 'com.liferay.portal.model.Account.phone');
insert into ListType (listTypeId, name, type_) values (10009, 'Other', 'com.liferay.portal.model.Account.phone');
insert into ListType (listTypeId, name, type_) values (10010, 'Toll-Free', 'com.liferay.portal.model.Account.phone');
insert into ListType (listTypeId, name, type_) values (10011, 'TTY', 'com.liferay.portal.model.Account.phone');

insert into ListType (listTypeId, name, type_) values (10012, 'Intranet', 'com.liferay.portal.model.Account.website');
insert into ListType (listTypeId, name, type_) values (10013, 'Public', 'com.liferay.portal.model.Account.website');

--
-- List types for contacts
--

insert into ListType (listTypeId, name, type_) values (11000, 'Business', 'com.liferay.portal.model.Contact.address');
insert into ListType (listTypeId, name, type_) values (11001, 'Other', 'com.liferay.portal.model.Contact.address');
insert into ListType (listTypeId, name, type_) values (11002, 'Personal', 'com.liferay.portal.model.Contact.address');

insert into ListType (listTypeId, name, type_) values (11003, 'E-mail', 'com.liferay.portal.model.Contact.emailAddress');
insert into ListType (listTypeId, name, type_) values (11004, 'E-mail 2', 'com.liferay.portal.model.Contact.emailAddress');
insert into ListType (listTypeId, name, type_) values (11005, 'E-mail 3', 'com.liferay.portal.model.Contact.emailAddress');

insert into ListType (listTypeId, name, type_) values (11006, 'Business', 'com.liferay.portal.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11007, 'Business Fax', 'com.liferay.portal.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11008, 'Mobile', 'com.liferay.portal.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11009, 'Other', 'com.liferay.portal.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11010, 'Pager', 'com.liferay.portal.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11011, 'Personal', 'com.liferay.portal.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11012, 'Personal Fax', 'com.liferay.portal.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11013, 'TTY', 'com.liferay.portal.model.Contact.phone');

insert into ListType (listTypeId, name, type_) values (11014, 'Dr.', 'com.liferay.portal.model.Contact.prefix');
insert into ListType (listTypeId, name, type_) values (11015, 'Mr.', 'com.liferay.portal.model.Contact.prefix');
insert into ListType (listTypeId, name, type_) values (11016, 'Mrs.', 'com.liferay.portal.model.Contact.prefix');
insert into ListType (listTypeId, name, type_) values (11017, 'Ms.', 'com.liferay.portal.model.Contact.prefix');

insert into ListType (listTypeId, name, type_) values (11020, 'II', 'com.liferay.portal.model.Contact.suffix');
insert into ListType (listTypeId, name, type_) values (11021, 'III', 'com.liferay.portal.model.Contact.suffix');
insert into ListType (listTypeId, name, type_) values (11022, 'IV', 'com.liferay.portal.model.Contact.suffix');
insert into ListType (listTypeId, name, type_) values (11023, 'Jr.', 'com.liferay.portal.model.Contact.suffix');
insert into ListType (listTypeId, name, type_) values (11024, 'PhD.', 'com.liferay.portal.model.Contact.suffix');
insert into ListType (listTypeId, name, type_) values (11025, 'Sr.', 'com.liferay.portal.model.Contact.suffix');

insert into ListType (listTypeId, name, type_) values (11026, 'Blog', 'com.liferay.portal.model.Contact.website');
insert into ListType (listTypeId, name, type_) values (11027, 'Business', 'com.liferay.portal.model.Contact.website');
insert into ListType (listTypeId, name, type_) values (11028, 'Other', 'com.liferay.portal.model.Contact.website');
insert into ListType (listTypeId, name, type_) values (11029, 'Personal', 'com.liferay.portal.model.Contact.website');

--
-- List types for organizations
--

insert into ListType (listTypeId, name, type_) values (12000, 'Billing', 'com.liferay.portal.model.Organization.address');
insert into ListType (listTypeId, name, type_) values (12001, 'Other', 'com.liferay.portal.model.Organization.address');
insert into ListType (listTypeId, name, type_) values (12002, 'P.O. Box', 'com.liferay.portal.model.Organization.address');
insert into ListType (listTypeId, name, type_) values (12003, 'Shipping', 'com.liferay.portal.model.Organization.address');

insert into ListType (listTypeId, name, type_) values (12004, 'E-mail', 'com.liferay.portal.model.Organization.emailAddress');
insert into ListType (listTypeId, name, type_) values (12005, 'E-mail 2', 'com.liferay.portal.model.Organization.emailAddress');
insert into ListType (listTypeId, name, type_) values (12006, 'E-mail 3', 'com.liferay.portal.model.Organization.emailAddress');

insert into ListType (listTypeId, name, type_) values (12007, 'Fax', 'com.liferay.portal.model.Organization.phone');
insert into ListType (listTypeId, name, type_) values (12008, 'Local', 'com.liferay.portal.model.Organization.phone');
insert into ListType (listTypeId, name, type_) values (12009, 'Other', 'com.liferay.portal.model.Organization.phone');
insert into ListType (listTypeId, name, type_) values (12010, 'Toll-Free', 'com.liferay.portal.model.Organization.phone');
insert into ListType (listTypeId, name, type_) values (12011, 'TTY', 'com.liferay.portal.model.Organization.phone');

insert into ListType (listTypeId, name, type_) values (12012, 'Administrative', 'com.liferay.portal.model.Organization.service');
insert into ListType (listTypeId, name, type_) values (12013, 'Contracts', 'com.liferay.portal.model.Organization.service');
insert into ListType (listTypeId, name, type_) values (12014, 'Donation', 'com.liferay.portal.model.Organization.service');
insert into ListType (listTypeId, name, type_) values (12015, 'Retail', 'com.liferay.portal.model.Organization.service');
insert into ListType (listTypeId, name, type_) values (12016, 'Training', 'com.liferay.portal.model.Organization.service');

insert into ListType (listTypeId, name, type_) values (12017, 'Full Member', 'com.liferay.portal.model.Organization.status');
insert into ListType (listTypeId, name, type_) values (12018, 'Provisional Member', 'com.liferay.portal.model.Organization.status');

insert into ListType (listTypeId, name, type_) values (12019, 'Intranet', 'com.liferay.portal.model.Organization.website');
insert into ListType (listTypeId, name, type_) values (12020, 'Public', 'com.liferay.portal.model.Organization.website');



insert into Counter values ('com.liferay.counter.model.Counter', 10000);






insert into Company (companyId, accountId, webId, virtualHost, mx) values (1, 7, 'liferay.com', 'localhost', 'liferay.com');
insert into Account_ (accountId, companyId, userId, userName, createDate, modifiedDate, parentAccountId, name, legalName, legalId, legalType, sicCode, tickerSymbol, industry, type_, size_) values (7, 1, 5, '', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 0, 'Liferay', 'Liferay, Inc.', '', '', '', '', '', '', '');


insert into ClassName_ (classNameId, value) values (8, 'com.liferay.portal.model.Group');
insert into ClassName_ (classNameId, value) values (9, 'com.liferay.portal.model.Organization');
insert into ClassName_ (classNameId, value) values (10, 'com.liferay.portal.model.Role');
insert into ClassName_ (classNameId, value) values (11, 'com.liferay.portal.model.User');


insert into Role_ (roleId, companyId, classNameId, classPK, name, description, type_) values (12, 1, 10, 12, 'Administrator', '', 1);
insert into Role_ (roleId, companyId, classNameId, classPK, name, description, type_) values (13, 1, 10, 13, 'Guest', '', 1);
insert into Role_ (roleId, companyId, classNameId, classPK, name, description, type_) values (14, 1, 10, 14, 'Power User', '', 1);
insert into Role_ (roleId, companyId, classNameId, classPK, name, description, type_) values (15, 1, 10, 15, 'User', '', 1);


insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (16, 1, 5, 8, 16, 0, 0, 'Guest', '/guest', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (17, 1, 16, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (18, 1, 16, 'F', 'F', 'classic', '01', 0);


insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (19, 1, 0, 'Liferay, Inc.', 'regular-organization', 'T', 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (20, 1, 5, 9, 19, 0, 0, '20', '/20', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (21, 1, 20, 'T', 'F', 'classic', '01', 1);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (22, 1, 20, 'F', 'F', 'classic', '01', 1);
insert into Layout (plid, groupId, companyId, privateLayout, layoutId, parentLayoutId, name, type_, typeSettings, hidden_, friendlyURL, priority) values (23, 20, 1, 'F', 1, 0, '<?xml version="1.0"?>\n\n<root>\n  <name>Liferay, Inc. Extranet</name>\n</root>', 'portlet', 'layout-template-id=2_columns_ii\ncolumn-1=3,\ncolumn-2=19,', 'F', '/1', 0);
insert into Layout (plid, groupId, companyId, privateLayout, layoutId, parentLayoutId, name, type_, typeSettings, hidden_, friendlyURL, priority) values (24, 20, 1, 'T', 1, 0, '<?xml version="1.0"?>\n\n<root>\n  <name>Liferay, Inc. Intranet</name>\n</root>', 'portlet', 'layout-template-id=2_columns_ii\ncolumn-1=3,\ncolumn-2=19,', 'F', '/1', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (25, 1, 19, 'Liferay Engineering', 'regular-organization', 'T', 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (26, 1, 5, 9, 25, 0, 0, '26', '/26', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (27, 1, 26, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (28, 1, 26, 'F', 'F', 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (29, 1, 19, 'Liferay Consulting', 'regular-organization', 'T', 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (30, 1, 5, 9, 29, 0, 0, '30', '/30', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (31, 1, 30, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (32, 1, 30, 'F', 'F', 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (33, 1, 19, 'Liferay Support', 'regular-organization', 'T', 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (34, 1, 5, 9, 33, 0, 0, '34', '/34', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (35, 1, 34, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (36, 1, 34, 'F', 'F', 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (37, 1, 19, 'Liferay Sales', 'regular-organization', 'T', 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (38, 1, 5, 9, 37, 0, 0, '38', '/38', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (39, 1, 38, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (40, 1, 38, 'F', 'F', 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (41, 1, 19, 'Liferay Marketing', 'regular-organization', 'T', 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (42, 1, 5, 9, 41, 0, 0, '42', '/42', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (43, 1, 42, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (44, 1, 42, 'F', 'F', 'classic', '01', 0);


insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (45, 1, 19, 'Liferay Los Angeles', 'location', 'F', 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (46, 1, 5, 9, 45, 0, 0, '46', '/46', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (47, 1, 46, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (48, 1, 46, 'F', 'F', 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (49, 1, 19, 'Liferay San Francisco', 'location', 'F', 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (50, 1, 5, 9, 49, 0, 0, '50', '/50', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (51, 1, 50, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (52, 1, 50, 'F', 'F', 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (53, 1, 19, 'Liferay Chicago', 'location', 'F', 14, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (54, 1, 5, 9, 53, 0, 0, '54', '/54', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (55, 1, 54, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (56, 1, 54, 'F', 'F', 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (57, 1, 19, 'Liferay New York', 'location', 'F', 33, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (58, 1, 5, 9, 57, 0, 0, '58', '/58', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (59, 1, 58, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (60, 1, 58, 'F', 'F', 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (61, 1, 19, 'Liferay Sao Paulo', 'location', 'F', 0, 48, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (62, 1, 5, 9, 61, 0, 0, '62', '/62', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (63, 1, 62, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (64, 1, 62, 'F', 'F', 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (65, 1, 19, 'Liferay Frankfurt', 'location', 'F', 0, 4, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (66, 1, 5, 9, 65, 0, 0, '66', '/66', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (67, 1, 66, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (68, 1, 66, 'F', 'F', 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (69, 1, 19, 'Liferay Madrid', 'location', 'F', 0, 15, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (70, 1, 5, 9, 69, 0, 0, '70', '/70', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (71, 1, 70, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (72, 1, 70, 'F', 'F', 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (73, 1, 19, 'Liferay Dalian', 'location', 'F', 0, 2, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (74, 1, 5, 9, 73, 0, 0, '74', '/74', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (75, 1, 74, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (76, 1, 74, 'F', 'F', 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (77, 1, 19, 'Liferay Hong Kong', 'location', 'F', 0, 2, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (78, 1, 5, 9, 77, 0, 0, '78', '/78', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (79, 1, 78, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (80, 1, 78, 'F', 'F', 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (81, 1, 19, 'Liferay Kuala Lumpur', 'location', 'F', 0, 135, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (82, 1, 5, 9, 81, 0, 0, '82', '/82', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (83, 1, 82, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (84, 1, 82, 'F', 'F', 'classic', '01', 0);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (5, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'T', 6, 'password', 'F', 'F', '5', 'default@liferay.com', 'Welcome!', '', '', '', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (6, 1, 5, '', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, '', '', '', 'T', '1970-01-01 00:00:00.0');

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (2, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 3, 'test', 'F', 'F', 'joebloggs', 'test@liferay.com', 'Welcome Joe Bloggs!', 'Joe', '', 'Bloggs', CURRENT YEAR TO FRACTION, 0, 'F', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (3, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Joe', '', 'Bloggs', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (85, 1, 2, 11, 2, 0, 0, '85', '/85', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (86, 1, 85, 'T', 'F', 'classic', '01', 2);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (87, 1, 85, 'F', 'F', 'classic', '01', 0);
insert into Layout (plid, groupId, companyId, privateLayout, layoutId, parentLayoutId, name, type_, typeSettings, hidden_, friendlyURL, priority) values (88, 85, 1, 'T', 1, 0, '<?xml version="1.0"?>\n\n<root>\n  <name>Home</name>\n</root>', 'portlet', 'column-1=71_INSTANCE_OY0d,82,23,61,\ncolumn-2=9,79,29,8,19,\nlayout-template-id=2_columns_ii\n', 'F', '/home', 0);
insert into Layout (plid, groupId, companyId, privateLayout, layoutId, parentLayoutId, name, type_, typeSettings, hidden_, friendlyURL, priority) values (89, 85, 1, 'T', 2, 0, '<?xml version="1.0"?>\n\n<root>\n  <name>Plugins</name>\n</root>', 'portlet', 'column-1=\ncolumn-2=111,\nlayout-template-id=2_columns_ii\n', 'F', '/plugins', 1);

insert into Users_Groups values (2, 16);

insert into Users_Orgs (userId, organizationId) values (2, 19);
insert into Users_Orgs (userId, organizationId) values (2, 45);

insert into Users_Roles values (2, 12);
insert into Users_Roles values (2, 14);
insert into Users_Roles values (2, 15);


insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (90, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 91, 'test', 'F', 'F', 'lax1', 'test.lax.1@liferay.com', 'Welcome Test LAX 1!', 'Test', '', 'LAX 1', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (91, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 1', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (92, 1, 90, 11, 90, 0, 0, '92', '/92', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (93, 1, 92, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (94, 1, 92, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (90, 16);

insert into Users_Orgs (userId, organizationId) values (90, 19);
insert into Users_Orgs (userId, organizationId) values (90, 45);

insert into Users_Roles values (90, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (95, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 96, 'test', 'F', 'F', 'lax2', 'test.lax.2@liferay.com', 'Welcome Test LAX 2!', 'Test', '', 'LAX 2', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (96, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 2', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (97, 1, 95, 11, 95, 0, 0, '97', '/97', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (98, 1, 97, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (99, 1, 97, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (95, 16);

insert into Users_Orgs (userId, organizationId) values (95, 19);
insert into Users_Orgs (userId, organizationId) values (95, 45);

insert into Users_Roles values (95, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (100, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 101, 'test', 'F', 'F', 'lax3', 'test.lax.3@liferay.com', 'Welcome Test LAX 3!', 'Test', '', 'LAX 3', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (101, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 3', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (102, 1, 100, 11, 100, 0, 0, '102', '/102', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (103, 1, 102, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (104, 1, 102, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (100, 16);

insert into Users_Orgs (userId, organizationId) values (100, 19);
insert into Users_Orgs (userId, organizationId) values (100, 45);

insert into Users_Roles values (100, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (105, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 106, 'test', 'F', 'F', 'lax4', 'test.lax.4@liferay.com', 'Welcome Test LAX 4!', 'Test', '', 'LAX 4', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (106, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 4', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (107, 1, 105, 11, 105, 0, 0, '107', '/107', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (108, 1, 107, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (109, 1, 107, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (105, 16);

insert into Users_Orgs (userId, organizationId) values (105, 19);
insert into Users_Orgs (userId, organizationId) values (105, 45);

insert into Users_Roles values (105, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (110, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 111, 'test', 'F', 'F', 'lax5', 'test.lax.5@liferay.com', 'Welcome Test LAX 5!', 'Test', '', 'LAX 5', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (111, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 5', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (112, 1, 110, 11, 110, 0, 0, '112', '/112', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (113, 1, 112, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (114, 1, 112, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (110, 16);

insert into Users_Orgs (userId, organizationId) values (110, 19);
insert into Users_Orgs (userId, organizationId) values (110, 45);

insert into Users_Roles values (110, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (115, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 116, 'test', 'F', 'F', 'lax6', 'test.lax.6@liferay.com', 'Welcome Test LAX 6!', 'Test', '', 'LAX 6', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (116, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 6', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (117, 1, 115, 11, 115, 0, 0, '117', '/117', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (118, 1, 117, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (119, 1, 117, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (115, 16);

insert into Users_Orgs (userId, organizationId) values (115, 19);
insert into Users_Orgs (userId, organizationId) values (115, 45);

insert into Users_Roles values (115, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (120, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 121, 'test', 'F', 'F', 'lax7', 'test.lax.7@liferay.com', 'Welcome Test LAX 7!', 'Test', '', 'LAX 7', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (121, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 7', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (122, 1, 120, 11, 120, 0, 0, '122', '/122', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (123, 1, 122, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (124, 1, 122, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (120, 16);

insert into Users_Orgs (userId, organizationId) values (120, 19);
insert into Users_Orgs (userId, organizationId) values (120, 45);

insert into Users_Roles values (120, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (125, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 126, 'test', 'F', 'F', 'lax8', 'test.lax.8@liferay.com', 'Welcome Test LAX 8!', 'Test', '', 'LAX 8', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (126, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 8', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (127, 1, 125, 11, 125, 0, 0, '127', '/127', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (128, 1, 127, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (129, 1, 127, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (125, 16);

insert into Users_Orgs (userId, organizationId) values (125, 19);
insert into Users_Orgs (userId, organizationId) values (125, 45);

insert into Users_Roles values (125, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (130, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 131, 'test', 'F', 'F', 'lax9', 'test.lax.9@liferay.com', 'Welcome Test LAX 9!', 'Test', '', 'LAX 9', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (131, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 9', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (132, 1, 130, 11, 130, 0, 0, '132', '/132', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (133, 1, 132, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (134, 1, 132, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (130, 16);

insert into Users_Orgs (userId, organizationId) values (130, 19);
insert into Users_Orgs (userId, organizationId) values (130, 45);

insert into Users_Roles values (130, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (135, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 136, 'test', 'F', 'F', 'lax10', 'test.lax.10@liferay.com', 'Welcome Test LAX 10!', 'Test', '', 'LAX 10', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (136, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 10', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (137, 1, 135, 11, 135, 0, 0, '137', '/137', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (138, 1, 137, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (139, 1, 137, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (135, 16);

insert into Users_Orgs (userId, organizationId) values (135, 19);
insert into Users_Orgs (userId, organizationId) values (135, 45);

insert into Users_Roles values (135, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (140, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 141, 'test', 'F', 'F', 'lax11', 'test.lax.11@liferay.com', 'Welcome Test LAX 11!', 'Test', '', 'LAX 11', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (141, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 11', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (142, 1, 140, 11, 140, 0, 0, '142', '/142', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (143, 1, 142, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (144, 1, 142, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (140, 16);

insert into Users_Orgs (userId, organizationId) values (140, 19);
insert into Users_Orgs (userId, organizationId) values (140, 45);

insert into Users_Roles values (140, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (145, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 146, 'test', 'F', 'F', 'lax12', 'test.lax.12@liferay.com', 'Welcome Test LAX 12!', 'Test', '', 'LAX 12', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (146, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 12', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (147, 1, 145, 11, 145, 0, 0, '147', '/147', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (148, 1, 147, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (149, 1, 147, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (145, 16);

insert into Users_Orgs (userId, organizationId) values (145, 19);
insert into Users_Orgs (userId, organizationId) values (145, 45);

insert into Users_Roles values (145, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (150, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 151, 'test', 'F', 'F', 'lax13', 'test.lax.13@liferay.com', 'Welcome Test LAX 13!', 'Test', '', 'LAX 13', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (151, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 13', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (152, 1, 150, 11, 150, 0, 0, '152', '/152', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (153, 1, 152, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (154, 1, 152, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (150, 16);

insert into Users_Orgs (userId, organizationId) values (150, 19);
insert into Users_Orgs (userId, organizationId) values (150, 45);

insert into Users_Roles values (150, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (155, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 156, 'test', 'F', 'F', 'lax14', 'test.lax.14@liferay.com', 'Welcome Test LAX 14!', 'Test', '', 'LAX 14', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (156, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 14', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (157, 1, 155, 11, 155, 0, 0, '157', '/157', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (158, 1, 157, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (159, 1, 157, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (155, 16);

insert into Users_Orgs (userId, organizationId) values (155, 19);
insert into Users_Orgs (userId, organizationId) values (155, 45);

insert into Users_Roles values (155, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (160, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 161, 'test', 'F', 'F', 'lax15', 'test.lax.15@liferay.com', 'Welcome Test LAX 15!', 'Test', '', 'LAX 15', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (161, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 15', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (162, 1, 160, 11, 160, 0, 0, '162', '/162', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (163, 1, 162, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (164, 1, 162, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (160, 16);

insert into Users_Orgs (userId, organizationId) values (160, 19);
insert into Users_Orgs (userId, organizationId) values (160, 45);

insert into Users_Roles values (160, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (165, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 166, 'test', 'F', 'F', 'lax16', 'test.lax.16@liferay.com', 'Welcome Test LAX 16!', 'Test', '', 'LAX 16', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (166, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 16', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (167, 1, 165, 11, 165, 0, 0, '167', '/167', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (168, 1, 167, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (169, 1, 167, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (165, 16);

insert into Users_Orgs (userId, organizationId) values (165, 19);
insert into Users_Orgs (userId, organizationId) values (165, 45);

insert into Users_Roles values (165, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (170, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 171, 'test', 'F', 'F', 'lax17', 'test.lax.17@liferay.com', 'Welcome Test LAX 17!', 'Test', '', 'LAX 17', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (171, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 17', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (172, 1, 170, 11, 170, 0, 0, '172', '/172', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (173, 1, 172, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (174, 1, 172, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (170, 16);

insert into Users_Orgs (userId, organizationId) values (170, 19);
insert into Users_Orgs (userId, organizationId) values (170, 45);

insert into Users_Roles values (170, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (175, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 176, 'test', 'F', 'F', 'lax18', 'test.lax.18@liferay.com', 'Welcome Test LAX 18!', 'Test', '', 'LAX 18', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (176, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 18', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (177, 1, 175, 11, 175, 0, 0, '177', '/177', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (178, 1, 177, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (179, 1, 177, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (175, 16);

insert into Users_Orgs (userId, organizationId) values (175, 19);
insert into Users_Orgs (userId, organizationId) values (175, 45);

insert into Users_Roles values (175, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (180, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 181, 'test', 'F', 'F', 'lax19', 'test.lax.19@liferay.com', 'Welcome Test LAX 19!', 'Test', '', 'LAX 19', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (181, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 19', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (182, 1, 180, 11, 180, 0, 0, '182', '/182', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (183, 1, 182, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (184, 1, 182, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (180, 16);

insert into Users_Orgs (userId, organizationId) values (180, 19);
insert into Users_Orgs (userId, organizationId) values (180, 45);

insert into Users_Roles values (180, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (185, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 186, 'test', 'F', 'F', 'lax20', 'test.lax.20@liferay.com', 'Welcome Test LAX 20!', 'Test', '', 'LAX 20', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (186, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 20', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (187, 1, 185, 11, 185, 0, 0, '187', '/187', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (188, 1, 187, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (189, 1, 187, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (185, 16);

insert into Users_Orgs (userId, organizationId) values (185, 19);
insert into Users_Orgs (userId, organizationId) values (185, 45);

insert into Users_Roles values (185, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (190, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 191, 'test', 'F', 'F', 'lax21', 'test.lax.21@liferay.com', 'Welcome Test LAX 21!', 'Test', '', 'LAX 21', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (191, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 21', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (192, 1, 190, 11, 190, 0, 0, '192', '/192', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (193, 1, 192, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (194, 1, 192, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (190, 16);

insert into Users_Orgs (userId, organizationId) values (190, 19);
insert into Users_Orgs (userId, organizationId) values (190, 45);

insert into Users_Roles values (190, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (195, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 196, 'test', 'F', 'F', 'lax22', 'test.lax.22@liferay.com', 'Welcome Test LAX 22!', 'Test', '', 'LAX 22', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (196, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 22', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (197, 1, 195, 11, 195, 0, 0, '197', '/197', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (198, 1, 197, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (199, 1, 197, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (195, 16);

insert into Users_Orgs (userId, organizationId) values (195, 19);
insert into Users_Orgs (userId, organizationId) values (195, 45);

insert into Users_Roles values (195, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (200, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 201, 'test', 'F', 'F', 'lax23', 'test.lax.23@liferay.com', 'Welcome Test LAX 23!', 'Test', '', 'LAX 23', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (201, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 23', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (202, 1, 200, 11, 200, 0, 0, '202', '/202', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (203, 1, 202, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (204, 1, 202, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (200, 16);

insert into Users_Orgs (userId, organizationId) values (200, 19);
insert into Users_Orgs (userId, organizationId) values (200, 45);

insert into Users_Roles values (200, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (205, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 206, 'test', 'F', 'F', 'lax24', 'test.lax.24@liferay.com', 'Welcome Test LAX 24!', 'Test', '', 'LAX 24', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (206, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 24', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (207, 1, 205, 11, 205, 0, 0, '207', '/207', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (208, 1, 207, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (209, 1, 207, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (205, 16);

insert into Users_Orgs (userId, organizationId) values (205, 19);
insert into Users_Orgs (userId, organizationId) values (205, 45);

insert into Users_Roles values (205, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (210, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 211, 'test', 'F', 'F', 'lax25', 'test.lax.25@liferay.com', 'Welcome Test LAX 25!', 'Test', '', 'LAX 25', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (211, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 25', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (212, 1, 210, 11, 210, 0, 0, '212', '/212', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (213, 1, 212, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (214, 1, 212, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (210, 16);

insert into Users_Orgs (userId, organizationId) values (210, 19);
insert into Users_Orgs (userId, organizationId) values (210, 45);

insert into Users_Roles values (210, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (215, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 216, 'test', 'F', 'F', 'lax26', 'test.lax.26@liferay.com', 'Welcome Test LAX 26!', 'Test', '', 'LAX 26', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (216, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 26', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (217, 1, 215, 11, 215, 0, 0, '217', '/217', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (218, 1, 217, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (219, 1, 217, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (215, 16);

insert into Users_Orgs (userId, organizationId) values (215, 19);
insert into Users_Orgs (userId, organizationId) values (215, 45);

insert into Users_Roles values (215, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (220, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 221, 'test', 'F', 'F', 'lax27', 'test.lax.27@liferay.com', 'Welcome Test LAX 27!', 'Test', '', 'LAX 27', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (221, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 27', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (222, 1, 220, 11, 220, 0, 0, '222', '/222', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (223, 1, 222, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (224, 1, 222, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (220, 16);

insert into Users_Orgs (userId, organizationId) values (220, 19);
insert into Users_Orgs (userId, organizationId) values (220, 45);

insert into Users_Roles values (220, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (225, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 226, 'test', 'F', 'F', 'lax28', 'test.lax.28@liferay.com', 'Welcome Test LAX 28!', 'Test', '', 'LAX 28', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (226, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 28', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (227, 1, 225, 11, 225, 0, 0, '227', '/227', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (228, 1, 227, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (229, 1, 227, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (225, 16);

insert into Users_Orgs (userId, organizationId) values (225, 19);
insert into Users_Orgs (userId, organizationId) values (225, 45);

insert into Users_Roles values (225, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (230, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 231, 'test', 'F', 'F', 'lax29', 'test.lax.29@liferay.com', 'Welcome Test LAX 29!', 'Test', '', 'LAX 29', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (231, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 29', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (232, 1, 230, 11, 230, 0, 0, '232', '/232', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (233, 1, 232, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (234, 1, 232, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (230, 16);

insert into Users_Orgs (userId, organizationId) values (230, 19);
insert into Users_Orgs (userId, organizationId) values (230, 45);

insert into Users_Roles values (230, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (235, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 236, 'test', 'F', 'F', 'lax30', 'test.lax.30@liferay.com', 'Welcome Test LAX 30!', 'Test', '', 'LAX 30', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (236, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 30', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (237, 1, 235, 11, 235, 0, 0, '237', '/237', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (238, 1, 237, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (239, 1, 237, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (235, 16);

insert into Users_Orgs (userId, organizationId) values (235, 19);
insert into Users_Orgs (userId, organizationId) values (235, 45);

insert into Users_Roles values (235, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (240, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 241, 'test', 'F', 'F', 'lax31', 'test.lax.31@liferay.com', 'Welcome Test LAX 31!', 'Test', '', 'LAX 31', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (241, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 31', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (242, 1, 240, 11, 240, 0, 0, '242', '/242', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (243, 1, 242, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (244, 1, 242, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (240, 16);

insert into Users_Orgs (userId, organizationId) values (240, 19);
insert into Users_Orgs (userId, organizationId) values (240, 45);

insert into Users_Roles values (240, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (245, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 246, 'test', 'F', 'F', 'lax32', 'test.lax.32@liferay.com', 'Welcome Test LAX 32!', 'Test', '', 'LAX 32', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (246, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 32', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (247, 1, 245, 11, 245, 0, 0, '247', '/247', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (248, 1, 247, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (249, 1, 247, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (245, 16);

insert into Users_Orgs (userId, organizationId) values (245, 19);
insert into Users_Orgs (userId, organizationId) values (245, 45);

insert into Users_Roles values (245, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (250, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 251, 'test', 'F', 'F', 'lax33', 'test.lax.33@liferay.com', 'Welcome Test LAX 33!', 'Test', '', 'LAX 33', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (251, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 33', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (252, 1, 250, 11, 250, 0, 0, '252', '/252', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (253, 1, 252, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (254, 1, 252, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (250, 16);

insert into Users_Orgs (userId, organizationId) values (250, 19);
insert into Users_Orgs (userId, organizationId) values (250, 45);

insert into Users_Roles values (250, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (255, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 256, 'test', 'F', 'F', 'lax34', 'test.lax.34@liferay.com', 'Welcome Test LAX 34!', 'Test', '', 'LAX 34', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (256, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 34', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (257, 1, 255, 11, 255, 0, 0, '257', '/257', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (258, 1, 257, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (259, 1, 257, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (255, 16);

insert into Users_Orgs (userId, organizationId) values (255, 19);
insert into Users_Orgs (userId, organizationId) values (255, 45);

insert into Users_Roles values (255, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (260, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 261, 'test', 'F', 'F', 'lax35', 'test.lax.35@liferay.com', 'Welcome Test LAX 35!', 'Test', '', 'LAX 35', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (261, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 35', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (262, 1, 260, 11, 260, 0, 0, '262', '/262', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (263, 1, 262, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (264, 1, 262, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (260, 16);

insert into Users_Orgs (userId, organizationId) values (260, 19);
insert into Users_Orgs (userId, organizationId) values (260, 45);

insert into Users_Roles values (260, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (265, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 266, 'test', 'F', 'F', 'lax36', 'test.lax.36@liferay.com', 'Welcome Test LAX 36!', 'Test', '', 'LAX 36', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (266, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 36', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (267, 1, 265, 11, 265, 0, 0, '267', '/267', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (268, 1, 267, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (269, 1, 267, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (265, 16);

insert into Users_Orgs (userId, organizationId) values (265, 19);
insert into Users_Orgs (userId, organizationId) values (265, 45);

insert into Users_Roles values (265, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (270, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 271, 'test', 'F', 'F', 'lax37', 'test.lax.37@liferay.com', 'Welcome Test LAX 37!', 'Test', '', 'LAX 37', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (271, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 37', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (272, 1, 270, 11, 270, 0, 0, '272', '/272', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (273, 1, 272, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (274, 1, 272, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (270, 16);

insert into Users_Orgs (userId, organizationId) values (270, 19);
insert into Users_Orgs (userId, organizationId) values (270, 45);

insert into Users_Roles values (270, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (275, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 276, 'test', 'F', 'F', 'lax38', 'test.lax.38@liferay.com', 'Welcome Test LAX 38!', 'Test', '', 'LAX 38', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (276, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 38', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (277, 1, 275, 11, 275, 0, 0, '277', '/277', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (278, 1, 277, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (279, 1, 277, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (275, 16);

insert into Users_Orgs (userId, organizationId) values (275, 19);
insert into Users_Orgs (userId, organizationId) values (275, 45);

insert into Users_Roles values (275, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (280, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 281, 'test', 'F', 'F', 'lax39', 'test.lax.39@liferay.com', 'Welcome Test LAX 39!', 'Test', '', 'LAX 39', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (281, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 39', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (282, 1, 280, 11, 280, 0, 0, '282', '/282', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (283, 1, 282, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (284, 1, 282, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (280, 16);

insert into Users_Orgs (userId, organizationId) values (280, 19);
insert into Users_Orgs (userId, organizationId) values (280, 45);

insert into Users_Roles values (280, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (285, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 286, 'test', 'F', 'F', 'lax40', 'test.lax.40@liferay.com', 'Welcome Test LAX 40!', 'Test', '', 'LAX 40', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (286, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 40', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (287, 1, 285, 11, 285, 0, 0, '287', '/287', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (288, 1, 287, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (289, 1, 287, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (285, 16);

insert into Users_Orgs (userId, organizationId) values (285, 19);
insert into Users_Orgs (userId, organizationId) values (285, 45);

insert into Users_Roles values (285, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (290, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 291, 'test', 'F', 'F', 'lax41', 'test.lax.41@liferay.com', 'Welcome Test LAX 41!', 'Test', '', 'LAX 41', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (291, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 41', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (292, 1, 290, 11, 290, 0, 0, '292', '/292', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (293, 1, 292, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (294, 1, 292, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (290, 16);

insert into Users_Orgs (userId, organizationId) values (290, 19);
insert into Users_Orgs (userId, organizationId) values (290, 45);

insert into Users_Roles values (290, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (295, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 296, 'test', 'F', 'F', 'lax42', 'test.lax.42@liferay.com', 'Welcome Test LAX 42!', 'Test', '', 'LAX 42', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (296, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 42', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (297, 1, 295, 11, 295, 0, 0, '297', '/297', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (298, 1, 297, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (299, 1, 297, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (295, 16);

insert into Users_Orgs (userId, organizationId) values (295, 19);
insert into Users_Orgs (userId, organizationId) values (295, 45);

insert into Users_Roles values (295, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (300, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 301, 'test', 'F', 'F', 'lax43', 'test.lax.43@liferay.com', 'Welcome Test LAX 43!', 'Test', '', 'LAX 43', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (301, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 43', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (302, 1, 300, 11, 300, 0, 0, '302', '/302', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (303, 1, 302, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (304, 1, 302, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (300, 16);

insert into Users_Orgs (userId, organizationId) values (300, 19);
insert into Users_Orgs (userId, organizationId) values (300, 45);

insert into Users_Roles values (300, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (305, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 306, 'test', 'F', 'F', 'lax44', 'test.lax.44@liferay.com', 'Welcome Test LAX 44!', 'Test', '', 'LAX 44', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (306, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 44', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (307, 1, 305, 11, 305, 0, 0, '307', '/307', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (308, 1, 307, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (309, 1, 307, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (305, 16);

insert into Users_Orgs (userId, organizationId) values (305, 19);
insert into Users_Orgs (userId, organizationId) values (305, 45);

insert into Users_Roles values (305, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (310, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 311, 'test', 'F', 'F', 'lax45', 'test.lax.45@liferay.com', 'Welcome Test LAX 45!', 'Test', '', 'LAX 45', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (311, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 45', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (312, 1, 310, 11, 310, 0, 0, '312', '/312', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (313, 1, 312, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (314, 1, 312, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (310, 16);

insert into Users_Orgs (userId, organizationId) values (310, 19);
insert into Users_Orgs (userId, organizationId) values (310, 45);

insert into Users_Roles values (310, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (315, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 316, 'test', 'F', 'F', 'lax46', 'test.lax.46@liferay.com', 'Welcome Test LAX 46!', 'Test', '', 'LAX 46', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (316, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 46', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (317, 1, 315, 11, 315, 0, 0, '317', '/317', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (318, 1, 317, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (319, 1, 317, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (315, 16);

insert into Users_Orgs (userId, organizationId) values (315, 19);
insert into Users_Orgs (userId, organizationId) values (315, 45);

insert into Users_Roles values (315, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (320, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 321, 'test', 'F', 'F', 'lax47', 'test.lax.47@liferay.com', 'Welcome Test LAX 47!', 'Test', '', 'LAX 47', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (321, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 47', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (322, 1, 320, 11, 320, 0, 0, '322', '/322', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (323, 1, 322, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (324, 1, 322, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (320, 16);

insert into Users_Orgs (userId, organizationId) values (320, 19);
insert into Users_Orgs (userId, organizationId) values (320, 45);

insert into Users_Roles values (320, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (325, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 326, 'test', 'F', 'F', 'lax48', 'test.lax.48@liferay.com', 'Welcome Test LAX 48!', 'Test', '', 'LAX 48', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (326, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 48', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (327, 1, 325, 11, 325, 0, 0, '327', '/327', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (328, 1, 327, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (329, 1, 327, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (325, 16);

insert into Users_Orgs (userId, organizationId) values (325, 19);
insert into Users_Orgs (userId, organizationId) values (325, 45);

insert into Users_Roles values (325, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (330, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 331, 'test', 'F', 'F', 'lax49', 'test.lax.49@liferay.com', 'Welcome Test LAX 49!', 'Test', '', 'LAX 49', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (331, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 49', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (332, 1, 330, 11, 330, 0, 0, '332', '/332', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (333, 1, 332, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (334, 1, 332, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (330, 16);

insert into Users_Orgs (userId, organizationId) values (330, 19);
insert into Users_Orgs (userId, organizationId) values (330, 45);

insert into Users_Roles values (330, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (335, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 336, 'test', 'F', 'F', 'lax50', 'test.lax.50@liferay.com', 'Welcome Test LAX 50!', 'Test', '', 'LAX 50', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (336, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 50', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (337, 1, 335, 11, 335, 0, 0, '337', '/337', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (338, 1, 337, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (339, 1, 337, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (335, 16);

insert into Users_Orgs (userId, organizationId) values (335, 19);
insert into Users_Orgs (userId, organizationId) values (335, 45);

insert into Users_Roles values (335, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (340, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 341, 'test', 'F', 'F', 'lax51', 'test.lax.51@liferay.com', 'Welcome Test LAX 51!', 'Test', '', 'LAX 51', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (341, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 51', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (342, 1, 340, 11, 340, 0, 0, '342', '/342', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (343, 1, 342, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (344, 1, 342, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (340, 16);

insert into Users_Orgs (userId, organizationId) values (340, 19);
insert into Users_Orgs (userId, organizationId) values (340, 45);

insert into Users_Roles values (340, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (345, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 346, 'test', 'F', 'F', 'lax52', 'test.lax.52@liferay.com', 'Welcome Test LAX 52!', 'Test', '', 'LAX 52', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (346, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 52', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (347, 1, 345, 11, 345, 0, 0, '347', '/347', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (348, 1, 347, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (349, 1, 347, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (345, 16);

insert into Users_Orgs (userId, organizationId) values (345, 19);
insert into Users_Orgs (userId, organizationId) values (345, 45);

insert into Users_Roles values (345, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (350, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 351, 'test', 'F', 'F', 'lax53', 'test.lax.53@liferay.com', 'Welcome Test LAX 53!', 'Test', '', 'LAX 53', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (351, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 53', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (352, 1, 350, 11, 350, 0, 0, '352', '/352', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (353, 1, 352, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (354, 1, 352, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (350, 16);

insert into Users_Orgs (userId, organizationId) values (350, 19);
insert into Users_Orgs (userId, organizationId) values (350, 45);

insert into Users_Roles values (350, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (355, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 356, 'test', 'F', 'F', 'lax54', 'test.lax.54@liferay.com', 'Welcome Test LAX 54!', 'Test', '', 'LAX 54', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (356, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 54', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (357, 1, 355, 11, 355, 0, 0, '357', '/357', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (358, 1, 357, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (359, 1, 357, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (355, 16);

insert into Users_Orgs (userId, organizationId) values (355, 19);
insert into Users_Orgs (userId, organizationId) values (355, 45);

insert into Users_Roles values (355, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (360, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 361, 'test', 'F', 'F', 'lax55', 'test.lax.55@liferay.com', 'Welcome Test LAX 55!', 'Test', '', 'LAX 55', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (361, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 55', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (362, 1, 360, 11, 360, 0, 0, '362', '/362', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (363, 1, 362, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (364, 1, 362, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (360, 16);

insert into Users_Orgs (userId, organizationId) values (360, 19);
insert into Users_Orgs (userId, organizationId) values (360, 45);

insert into Users_Roles values (360, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (365, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 366, 'test', 'F', 'F', 'lax56', 'test.lax.56@liferay.com', 'Welcome Test LAX 56!', 'Test', '', 'LAX 56', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (366, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 56', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (367, 1, 365, 11, 365, 0, 0, '367', '/367', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (368, 1, 367, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (369, 1, 367, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (365, 16);

insert into Users_Orgs (userId, organizationId) values (365, 19);
insert into Users_Orgs (userId, organizationId) values (365, 45);

insert into Users_Roles values (365, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (370, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 371, 'test', 'F', 'F', 'lax57', 'test.lax.57@liferay.com', 'Welcome Test LAX 57!', 'Test', '', 'LAX 57', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (371, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 57', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (372, 1, 370, 11, 370, 0, 0, '372', '/372', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (373, 1, 372, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (374, 1, 372, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (370, 16);

insert into Users_Orgs (userId, organizationId) values (370, 19);
insert into Users_Orgs (userId, organizationId) values (370, 45);

insert into Users_Roles values (370, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (375, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 376, 'test', 'F', 'F', 'lax58', 'test.lax.58@liferay.com', 'Welcome Test LAX 58!', 'Test', '', 'LAX 58', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (376, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 58', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (377, 1, 375, 11, 375, 0, 0, '377', '/377', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (378, 1, 377, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (379, 1, 377, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (375, 16);

insert into Users_Orgs (userId, organizationId) values (375, 19);
insert into Users_Orgs (userId, organizationId) values (375, 45);

insert into Users_Roles values (375, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (380, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 381, 'test', 'F', 'F', 'lax59', 'test.lax.59@liferay.com', 'Welcome Test LAX 59!', 'Test', '', 'LAX 59', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (381, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 59', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (382, 1, 380, 11, 380, 0, 0, '382', '/382', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (383, 1, 382, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (384, 1, 382, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (380, 16);

insert into Users_Orgs (userId, organizationId) values (380, 19);
insert into Users_Orgs (userId, organizationId) values (380, 45);

insert into Users_Roles values (380, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (385, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 386, 'test', 'F', 'F', 'lax60', 'test.lax.60@liferay.com', 'Welcome Test LAX 60!', 'Test', '', 'LAX 60', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (386, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 60', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (387, 1, 385, 11, 385, 0, 0, '387', '/387', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (388, 1, 387, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (389, 1, 387, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (385, 16);

insert into Users_Orgs (userId, organizationId) values (385, 19);
insert into Users_Orgs (userId, organizationId) values (385, 45);

insert into Users_Roles values (385, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (390, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 391, 'test', 'F', 'F', 'lax61', 'test.lax.61@liferay.com', 'Welcome Test LAX 61!', 'Test', '', 'LAX 61', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (391, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 61', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (392, 1, 390, 11, 390, 0, 0, '392', '/392', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (393, 1, 392, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (394, 1, 392, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (390, 16);

insert into Users_Orgs (userId, organizationId) values (390, 19);
insert into Users_Orgs (userId, organizationId) values (390, 45);

insert into Users_Roles values (390, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (395, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 396, 'test', 'F', 'F', 'lax62', 'test.lax.62@liferay.com', 'Welcome Test LAX 62!', 'Test', '', 'LAX 62', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (396, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 62', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (397, 1, 395, 11, 395, 0, 0, '397', '/397', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (398, 1, 397, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (399, 1, 397, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (395, 16);

insert into Users_Orgs (userId, organizationId) values (395, 19);
insert into Users_Orgs (userId, organizationId) values (395, 45);

insert into Users_Roles values (395, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (400, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 401, 'test', 'F', 'F', 'lax63', 'test.lax.63@liferay.com', 'Welcome Test LAX 63!', 'Test', '', 'LAX 63', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (401, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 63', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (402, 1, 400, 11, 400, 0, 0, '402', '/402', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (403, 1, 402, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (404, 1, 402, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (400, 16);

insert into Users_Orgs (userId, organizationId) values (400, 19);
insert into Users_Orgs (userId, organizationId) values (400, 45);

insert into Users_Roles values (400, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (405, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 406, 'test', 'F', 'F', 'lax64', 'test.lax.64@liferay.com', 'Welcome Test LAX 64!', 'Test', '', 'LAX 64', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (406, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 64', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (407, 1, 405, 11, 405, 0, 0, '407', '/407', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (408, 1, 407, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (409, 1, 407, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (405, 16);

insert into Users_Orgs (userId, organizationId) values (405, 19);
insert into Users_Orgs (userId, organizationId) values (405, 45);

insert into Users_Roles values (405, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (410, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 411, 'test', 'F', 'F', 'lax65', 'test.lax.65@liferay.com', 'Welcome Test LAX 65!', 'Test', '', 'LAX 65', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (411, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 65', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (412, 1, 410, 11, 410, 0, 0, '412', '/412', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (413, 1, 412, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (414, 1, 412, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (410, 16);

insert into Users_Orgs (userId, organizationId) values (410, 19);
insert into Users_Orgs (userId, organizationId) values (410, 45);

insert into Users_Roles values (410, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (415, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 416, 'test', 'F', 'F', 'lax66', 'test.lax.66@liferay.com', 'Welcome Test LAX 66!', 'Test', '', 'LAX 66', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (416, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 66', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (417, 1, 415, 11, 415, 0, 0, '417', '/417', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (418, 1, 417, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (419, 1, 417, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (415, 16);

insert into Users_Orgs (userId, organizationId) values (415, 19);
insert into Users_Orgs (userId, organizationId) values (415, 45);

insert into Users_Roles values (415, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (420, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 421, 'test', 'F', 'F', 'lax67', 'test.lax.67@liferay.com', 'Welcome Test LAX 67!', 'Test', '', 'LAX 67', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (421, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 67', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (422, 1, 420, 11, 420, 0, 0, '422', '/422', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (423, 1, 422, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (424, 1, 422, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (420, 16);

insert into Users_Orgs (userId, organizationId) values (420, 19);
insert into Users_Orgs (userId, organizationId) values (420, 45);

insert into Users_Roles values (420, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (425, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 426, 'test', 'F', 'F', 'lax68', 'test.lax.68@liferay.com', 'Welcome Test LAX 68!', 'Test', '', 'LAX 68', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (426, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 68', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (427, 1, 425, 11, 425, 0, 0, '427', '/427', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (428, 1, 427, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (429, 1, 427, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (425, 16);

insert into Users_Orgs (userId, organizationId) values (425, 19);
insert into Users_Orgs (userId, organizationId) values (425, 45);

insert into Users_Roles values (425, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (430, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 431, 'test', 'F', 'F', 'lax69', 'test.lax.69@liferay.com', 'Welcome Test LAX 69!', 'Test', '', 'LAX 69', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (431, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 69', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (432, 1, 430, 11, 430, 0, 0, '432', '/432', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (433, 1, 432, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (434, 1, 432, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (430, 16);

insert into Users_Orgs (userId, organizationId) values (430, 19);
insert into Users_Orgs (userId, organizationId) values (430, 45);

insert into Users_Roles values (430, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (435, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 436, 'test', 'F', 'F', 'lax70', 'test.lax.70@liferay.com', 'Welcome Test LAX 70!', 'Test', '', 'LAX 70', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (436, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 70', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (437, 1, 435, 11, 435, 0, 0, '437', '/437', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (438, 1, 437, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (439, 1, 437, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (435, 16);

insert into Users_Orgs (userId, organizationId) values (435, 19);
insert into Users_Orgs (userId, organizationId) values (435, 45);

insert into Users_Roles values (435, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (440, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 441, 'test', 'F', 'F', 'lax71', 'test.lax.71@liferay.com', 'Welcome Test LAX 71!', 'Test', '', 'LAX 71', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (441, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 71', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (442, 1, 440, 11, 440, 0, 0, '442', '/442', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (443, 1, 442, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (444, 1, 442, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (440, 16);

insert into Users_Orgs (userId, organizationId) values (440, 19);
insert into Users_Orgs (userId, organizationId) values (440, 45);

insert into Users_Roles values (440, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (445, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 446, 'test', 'F', 'F', 'lax72', 'test.lax.72@liferay.com', 'Welcome Test LAX 72!', 'Test', '', 'LAX 72', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (446, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 72', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (447, 1, 445, 11, 445, 0, 0, '447', '/447', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (448, 1, 447, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (449, 1, 447, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (445, 16);

insert into Users_Orgs (userId, organizationId) values (445, 19);
insert into Users_Orgs (userId, organizationId) values (445, 45);

insert into Users_Roles values (445, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (450, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 451, 'test', 'F', 'F', 'lax73', 'test.lax.73@liferay.com', 'Welcome Test LAX 73!', 'Test', '', 'LAX 73', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (451, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 73', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (452, 1, 450, 11, 450, 0, 0, '452', '/452', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (453, 1, 452, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (454, 1, 452, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (450, 16);

insert into Users_Orgs (userId, organizationId) values (450, 19);
insert into Users_Orgs (userId, organizationId) values (450, 45);

insert into Users_Roles values (450, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (455, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 456, 'test', 'F', 'F', 'lax74', 'test.lax.74@liferay.com', 'Welcome Test LAX 74!', 'Test', '', 'LAX 74', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (456, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 74', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (457, 1, 455, 11, 455, 0, 0, '457', '/457', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (458, 1, 457, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (459, 1, 457, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (455, 16);

insert into Users_Orgs (userId, organizationId) values (455, 19);
insert into Users_Orgs (userId, organizationId) values (455, 45);

insert into Users_Roles values (455, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (460, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 461, 'test', 'F', 'F', 'lax75', 'test.lax.75@liferay.com', 'Welcome Test LAX 75!', 'Test', '', 'LAX 75', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (461, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 75', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (462, 1, 460, 11, 460, 0, 0, '462', '/462', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (463, 1, 462, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (464, 1, 462, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (460, 16);

insert into Users_Orgs (userId, organizationId) values (460, 19);
insert into Users_Orgs (userId, organizationId) values (460, 45);

insert into Users_Roles values (460, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (465, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 466, 'test', 'F', 'F', 'lax76', 'test.lax.76@liferay.com', 'Welcome Test LAX 76!', 'Test', '', 'LAX 76', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (466, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 76', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (467, 1, 465, 11, 465, 0, 0, '467', '/467', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (468, 1, 467, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (469, 1, 467, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (465, 16);

insert into Users_Orgs (userId, organizationId) values (465, 19);
insert into Users_Orgs (userId, organizationId) values (465, 45);

insert into Users_Roles values (465, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (470, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 471, 'test', 'F', 'F', 'lax77', 'test.lax.77@liferay.com', 'Welcome Test LAX 77!', 'Test', '', 'LAX 77', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (471, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 77', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (472, 1, 470, 11, 470, 0, 0, '472', '/472', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (473, 1, 472, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (474, 1, 472, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (470, 16);

insert into Users_Orgs (userId, organizationId) values (470, 19);
insert into Users_Orgs (userId, organizationId) values (470, 45);

insert into Users_Roles values (470, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (475, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 476, 'test', 'F', 'F', 'lax78', 'test.lax.78@liferay.com', 'Welcome Test LAX 78!', 'Test', '', 'LAX 78', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (476, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 78', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (477, 1, 475, 11, 475, 0, 0, '477', '/477', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (478, 1, 477, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (479, 1, 477, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (475, 16);

insert into Users_Orgs (userId, organizationId) values (475, 19);
insert into Users_Orgs (userId, organizationId) values (475, 45);

insert into Users_Roles values (475, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (480, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 481, 'test', 'F', 'F', 'lax79', 'test.lax.79@liferay.com', 'Welcome Test LAX 79!', 'Test', '', 'LAX 79', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (481, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 79', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (482, 1, 480, 11, 480, 0, 0, '482', '/482', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (483, 1, 482, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (484, 1, 482, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (480, 16);

insert into Users_Orgs (userId, organizationId) values (480, 19);
insert into Users_Orgs (userId, organizationId) values (480, 45);

insert into Users_Roles values (480, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (485, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 486, 'test', 'F', 'F', 'lax80', 'test.lax.80@liferay.com', 'Welcome Test LAX 80!', 'Test', '', 'LAX 80', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (486, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 80', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (487, 1, 485, 11, 485, 0, 0, '487', '/487', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (488, 1, 487, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (489, 1, 487, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (485, 16);

insert into Users_Orgs (userId, organizationId) values (485, 19);
insert into Users_Orgs (userId, organizationId) values (485, 45);

insert into Users_Roles values (485, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (490, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 491, 'test', 'F', 'F', 'lax81', 'test.lax.81@liferay.com', 'Welcome Test LAX 81!', 'Test', '', 'LAX 81', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (491, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 81', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (492, 1, 490, 11, 490, 0, 0, '492', '/492', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (493, 1, 492, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (494, 1, 492, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (490, 16);

insert into Users_Orgs (userId, organizationId) values (490, 19);
insert into Users_Orgs (userId, organizationId) values (490, 45);

insert into Users_Roles values (490, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (495, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 496, 'test', 'F', 'F', 'lax82', 'test.lax.82@liferay.com', 'Welcome Test LAX 82!', 'Test', '', 'LAX 82', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (496, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 82', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (497, 1, 495, 11, 495, 0, 0, '497', '/497', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (498, 1, 497, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (499, 1, 497, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (495, 16);

insert into Users_Orgs (userId, organizationId) values (495, 19);
insert into Users_Orgs (userId, organizationId) values (495, 45);

insert into Users_Roles values (495, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (500, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 501, 'test', 'F', 'F', 'lax83', 'test.lax.83@liferay.com', 'Welcome Test LAX 83!', 'Test', '', 'LAX 83', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (501, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 83', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (502, 1, 500, 11, 500, 0, 0, '502', '/502', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (503, 1, 502, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (504, 1, 502, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (500, 16);

insert into Users_Orgs (userId, organizationId) values (500, 19);
insert into Users_Orgs (userId, organizationId) values (500, 45);

insert into Users_Roles values (500, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (505, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 506, 'test', 'F', 'F', 'lax84', 'test.lax.84@liferay.com', 'Welcome Test LAX 84!', 'Test', '', 'LAX 84', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (506, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 84', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (507, 1, 505, 11, 505, 0, 0, '507', '/507', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (508, 1, 507, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (509, 1, 507, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (505, 16);

insert into Users_Orgs (userId, organizationId) values (505, 19);
insert into Users_Orgs (userId, organizationId) values (505, 45);

insert into Users_Roles values (505, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (510, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 511, 'test', 'F', 'F', 'lax85', 'test.lax.85@liferay.com', 'Welcome Test LAX 85!', 'Test', '', 'LAX 85', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (511, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 85', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (512, 1, 510, 11, 510, 0, 0, '512', '/512', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (513, 1, 512, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (514, 1, 512, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (510, 16);

insert into Users_Orgs (userId, organizationId) values (510, 19);
insert into Users_Orgs (userId, organizationId) values (510, 45);

insert into Users_Roles values (510, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (515, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 516, 'test', 'F', 'F', 'lax86', 'test.lax.86@liferay.com', 'Welcome Test LAX 86!', 'Test', '', 'LAX 86', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (516, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 86', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (517, 1, 515, 11, 515, 0, 0, '517', '/517', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (518, 1, 517, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (519, 1, 517, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (515, 16);

insert into Users_Orgs (userId, organizationId) values (515, 19);
insert into Users_Orgs (userId, organizationId) values (515, 45);

insert into Users_Roles values (515, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (520, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 521, 'test', 'F', 'F', 'lax87', 'test.lax.87@liferay.com', 'Welcome Test LAX 87!', 'Test', '', 'LAX 87', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (521, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 87', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (522, 1, 520, 11, 520, 0, 0, '522', '/522', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (523, 1, 522, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (524, 1, 522, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (520, 16);

insert into Users_Orgs (userId, organizationId) values (520, 19);
insert into Users_Orgs (userId, organizationId) values (520, 45);

insert into Users_Roles values (520, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (525, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 526, 'test', 'F', 'F', 'lax88', 'test.lax.88@liferay.com', 'Welcome Test LAX 88!', 'Test', '', 'LAX 88', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (526, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 88', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (527, 1, 525, 11, 525, 0, 0, '527', '/527', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (528, 1, 527, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (529, 1, 527, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (525, 16);

insert into Users_Orgs (userId, organizationId) values (525, 19);
insert into Users_Orgs (userId, organizationId) values (525, 45);

insert into Users_Roles values (525, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (530, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 531, 'test', 'F', 'F', 'lax89', 'test.lax.89@liferay.com', 'Welcome Test LAX 89!', 'Test', '', 'LAX 89', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (531, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 89', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (532, 1, 530, 11, 530, 0, 0, '532', '/532', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (533, 1, 532, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (534, 1, 532, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (530, 16);

insert into Users_Orgs (userId, organizationId) values (530, 19);
insert into Users_Orgs (userId, organizationId) values (530, 45);

insert into Users_Roles values (530, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (535, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 536, 'test', 'F', 'F', 'lax90', 'test.lax.90@liferay.com', 'Welcome Test LAX 90!', 'Test', '', 'LAX 90', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (536, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 90', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (537, 1, 535, 11, 535, 0, 0, '537', '/537', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (538, 1, 537, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (539, 1, 537, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (535, 16);

insert into Users_Orgs (userId, organizationId) values (535, 19);
insert into Users_Orgs (userId, organizationId) values (535, 45);

insert into Users_Roles values (535, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (540, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 541, 'test', 'F', 'F', 'lax91', 'test.lax.91@liferay.com', 'Welcome Test LAX 91!', 'Test', '', 'LAX 91', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (541, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 91', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (542, 1, 540, 11, 540, 0, 0, '542', '/542', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (543, 1, 542, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (544, 1, 542, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (540, 16);

insert into Users_Orgs (userId, organizationId) values (540, 19);
insert into Users_Orgs (userId, organizationId) values (540, 45);

insert into Users_Roles values (540, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (545, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 546, 'test', 'F', 'F', 'lax92', 'test.lax.92@liferay.com', 'Welcome Test LAX 92!', 'Test', '', 'LAX 92', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (546, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 92', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (547, 1, 545, 11, 545, 0, 0, '547', '/547', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (548, 1, 547, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (549, 1, 547, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (545, 16);

insert into Users_Orgs (userId, organizationId) values (545, 19);
insert into Users_Orgs (userId, organizationId) values (545, 45);

insert into Users_Roles values (545, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (550, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 551, 'test', 'F', 'F', 'lax93', 'test.lax.93@liferay.com', 'Welcome Test LAX 93!', 'Test', '', 'LAX 93', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (551, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 93', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (552, 1, 550, 11, 550, 0, 0, '552', '/552', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (553, 1, 552, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (554, 1, 552, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (550, 16);

insert into Users_Orgs (userId, organizationId) values (550, 19);
insert into Users_Orgs (userId, organizationId) values (550, 45);

insert into Users_Roles values (550, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (555, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 556, 'test', 'F', 'F', 'lax94', 'test.lax.94@liferay.com', 'Welcome Test LAX 94!', 'Test', '', 'LAX 94', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (556, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 94', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (557, 1, 555, 11, 555, 0, 0, '557', '/557', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (558, 1, 557, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (559, 1, 557, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (555, 16);

insert into Users_Orgs (userId, organizationId) values (555, 19);
insert into Users_Orgs (userId, organizationId) values (555, 45);

insert into Users_Roles values (555, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (560, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 561, 'test', 'F', 'F', 'lax95', 'test.lax.95@liferay.com', 'Welcome Test LAX 95!', 'Test', '', 'LAX 95', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (561, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 95', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (562, 1, 560, 11, 560, 0, 0, '562', '/562', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (563, 1, 562, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (564, 1, 562, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (560, 16);

insert into Users_Orgs (userId, organizationId) values (560, 19);
insert into Users_Orgs (userId, organizationId) values (560, 45);

insert into Users_Roles values (560, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (565, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 566, 'test', 'F', 'F', 'lax96', 'test.lax.96@liferay.com', 'Welcome Test LAX 96!', 'Test', '', 'LAX 96', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (566, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 96', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (567, 1, 565, 11, 565, 0, 0, '567', '/567', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (568, 1, 567, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (569, 1, 567, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (565, 16);

insert into Users_Orgs (userId, organizationId) values (565, 19);
insert into Users_Orgs (userId, organizationId) values (565, 45);

insert into Users_Roles values (565, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (570, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 571, 'test', 'F', 'F', 'lax97', 'test.lax.97@liferay.com', 'Welcome Test LAX 97!', 'Test', '', 'LAX 97', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (571, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 97', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (572, 1, 570, 11, 570, 0, 0, '572', '/572', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (573, 1, 572, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (574, 1, 572, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (570, 16);

insert into Users_Orgs (userId, organizationId) values (570, 19);
insert into Users_Orgs (userId, organizationId) values (570, 45);

insert into Users_Roles values (570, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (575, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 576, 'test', 'F', 'F', 'lax98', 'test.lax.98@liferay.com', 'Welcome Test LAX 98!', 'Test', '', 'LAX 98', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (576, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 98', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (577, 1, 575, 11, 575, 0, 0, '577', '/577', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (578, 1, 577, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (579, 1, 577, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (575, 16);

insert into Users_Orgs (userId, organizationId) values (575, 19);
insert into Users_Orgs (userId, organizationId) values (575, 45);

insert into Users_Roles values (575, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (580, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 581, 'test', 'F', 'F', 'lax99', 'test.lax.99@liferay.com', 'Welcome Test LAX 99!', 'Test', '', 'LAX 99', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (581, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 99', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (582, 1, 580, 11, 580, 0, 0, '582', '/582', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (583, 1, 582, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (584, 1, 582, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (580, 16);

insert into Users_Orgs (userId, organizationId) values (580, 19);
insert into Users_Orgs (userId, organizationId) values (580, 45);

insert into Users_Roles values (580, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (585, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 586, 'test', 'F', 'F', 'lax100', 'test.lax.100@liferay.com', 'Welcome Test LAX 100!', 'Test', '', 'LAX 100', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (586, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'LAX 100', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (587, 1, 585, 11, 585, 0, 0, '587', '/587', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (588, 1, 587, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (589, 1, 587, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (585, 16);

insert into Users_Orgs (userId, organizationId) values (585, 19);
insert into Users_Orgs (userId, organizationId) values (585, 45);

insert into Users_Roles values (585, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (590, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 591, 'test', 'F', 'F', 'sfo1', 'test.sfo.1@liferay.com', 'Welcome Test SFO 1!', 'Test', '', 'SFO 1', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (591, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'SFO 1', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (592, 1, 590, 11, 590, 0, 0, '592', '/592', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (593, 1, 592, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (594, 1, 592, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (590, 16);

insert into Users_Orgs (userId, organizationId) values (590, 19);
insert into Users_Orgs (userId, organizationId) values (590, 49);

insert into Users_Roles values (590, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (595, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 596, 'test', 'F', 'F', 'sfo2', 'test.sfo.2@liferay.com', 'Welcome Test SFO 2!', 'Test', '', 'SFO 2', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (596, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'SFO 2', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (597, 1, 595, 11, 595, 0, 0, '597', '/597', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (598, 1, 597, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (599, 1, 597, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (595, 16);

insert into Users_Orgs (userId, organizationId) values (595, 19);
insert into Users_Orgs (userId, organizationId) values (595, 49);

insert into Users_Roles values (595, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (600, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 601, 'test', 'F', 'F', 'sfo3', 'test.sfo.3@liferay.com', 'Welcome Test SFO 3!', 'Test', '', 'SFO 3', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (601, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'SFO 3', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (602, 1, 600, 11, 600, 0, 0, '602', '/602', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (603, 1, 602, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (604, 1, 602, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (600, 16);

insert into Users_Orgs (userId, organizationId) values (600, 19);
insert into Users_Orgs (userId, organizationId) values (600, 49);

insert into Users_Roles values (600, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (605, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 606, 'test', 'F', 'F', 'sfo4', 'test.sfo.4@liferay.com', 'Welcome Test SFO 4!', 'Test', '', 'SFO 4', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (606, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'SFO 4', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (607, 1, 605, 11, 605, 0, 0, '607', '/607', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (608, 1, 607, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (609, 1, 607, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (605, 16);

insert into Users_Orgs (userId, organizationId) values (605, 19);
insert into Users_Orgs (userId, organizationId) values (605, 49);

insert into Users_Roles values (605, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (610, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 611, 'test', 'F', 'F', 'sfo5', 'test.sfo.5@liferay.com', 'Welcome Test SFO 5!', 'Test', '', 'SFO 5', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (611, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'SFO 5', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (612, 1, 610, 11, 610, 0, 0, '612', '/612', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (613, 1, 612, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (614, 1, 612, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (610, 16);

insert into Users_Orgs (userId, organizationId) values (610, 19);
insert into Users_Orgs (userId, organizationId) values (610, 49);

insert into Users_Roles values (610, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (615, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 616, 'test', 'F', 'F', 'sfo6', 'test.sfo.6@liferay.com', 'Welcome Test SFO 6!', 'Test', '', 'SFO 6', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (616, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'SFO 6', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (617, 1, 615, 11, 615, 0, 0, '617', '/617', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (618, 1, 617, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (619, 1, 617, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (615, 16);

insert into Users_Orgs (userId, organizationId) values (615, 19);
insert into Users_Orgs (userId, organizationId) values (615, 49);

insert into Users_Roles values (615, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (620, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 621, 'test', 'F', 'F', 'sfo7', 'test.sfo.7@liferay.com', 'Welcome Test SFO 7!', 'Test', '', 'SFO 7', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (621, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'SFO 7', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (622, 1, 620, 11, 620, 0, 0, '622', '/622', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (623, 1, 622, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (624, 1, 622, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (620, 16);

insert into Users_Orgs (userId, organizationId) values (620, 19);
insert into Users_Orgs (userId, organizationId) values (620, 49);

insert into Users_Roles values (620, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (625, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 626, 'test', 'F', 'F', 'sfo8', 'test.sfo.8@liferay.com', 'Welcome Test SFO 8!', 'Test', '', 'SFO 8', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (626, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'SFO 8', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (627, 1, 625, 11, 625, 0, 0, '627', '/627', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (628, 1, 627, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (629, 1, 627, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (625, 16);

insert into Users_Orgs (userId, organizationId) values (625, 19);
insert into Users_Orgs (userId, organizationId) values (625, 49);

insert into Users_Roles values (625, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (630, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 631, 'test', 'F', 'F', 'sfo9', 'test.sfo.9@liferay.com', 'Welcome Test SFO 9!', 'Test', '', 'SFO 9', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (631, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'SFO 9', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (632, 1, 630, 11, 630, 0, 0, '632', '/632', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (633, 1, 632, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (634, 1, 632, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (630, 16);

insert into Users_Orgs (userId, organizationId) values (630, 19);
insert into Users_Orgs (userId, organizationId) values (630, 49);

insert into Users_Roles values (630, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (635, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 636, 'test', 'F', 'F', 'sfo10', 'test.sfo.10@liferay.com', 'Welcome Test SFO 10!', 'Test', '', 'SFO 10', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (636, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'SFO 10', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (637, 1, 635, 11, 635, 0, 0, '637', '/637', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (638, 1, 637, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (639, 1, 637, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (635, 16);

insert into Users_Orgs (userId, organizationId) values (635, 19);
insert into Users_Orgs (userId, organizationId) values (635, 49);

insert into Users_Roles values (635, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (640, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 641, 'test', 'F', 'F', 'ord1', 'test.ord.1@liferay.com', 'Welcome Test ORD 1!', 'Test', '', 'ORD 1', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (641, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'ORD 1', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (642, 1, 640, 11, 640, 0, 0, '642', '/642', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (643, 1, 642, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (644, 1, 642, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (640, 16);

insert into Users_Orgs (userId, organizationId) values (640, 19);
insert into Users_Orgs (userId, organizationId) values (640, 53);

insert into Users_Roles values (640, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (645, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 646, 'test', 'F', 'F', 'ord2', 'test.ord.2@liferay.com', 'Welcome Test ORD 2!', 'Test', '', 'ORD 2', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (646, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'ORD 2', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (647, 1, 645, 11, 645, 0, 0, '647', '/647', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (648, 1, 647, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (649, 1, 647, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (645, 16);

insert into Users_Orgs (userId, organizationId) values (645, 19);
insert into Users_Orgs (userId, organizationId) values (645, 53);

insert into Users_Roles values (645, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (650, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 651, 'test', 'F', 'F', 'ord3', 'test.ord.3@liferay.com', 'Welcome Test ORD 3!', 'Test', '', 'ORD 3', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (651, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'ORD 3', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (652, 1, 650, 11, 650, 0, 0, '652', '/652', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (653, 1, 652, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (654, 1, 652, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (650, 16);

insert into Users_Orgs (userId, organizationId) values (650, 19);
insert into Users_Orgs (userId, organizationId) values (650, 53);

insert into Users_Roles values (650, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (655, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 656, 'test', 'F', 'F', 'ord4', 'test.ord.4@liferay.com', 'Welcome Test ORD 4!', 'Test', '', 'ORD 4', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (656, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'ORD 4', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (657, 1, 655, 11, 655, 0, 0, '657', '/657', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (658, 1, 657, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (659, 1, 657, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (655, 16);

insert into Users_Orgs (userId, organizationId) values (655, 19);
insert into Users_Orgs (userId, organizationId) values (655, 53);

insert into Users_Roles values (655, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (660, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 661, 'test', 'F', 'F', 'ord5', 'test.ord.5@liferay.com', 'Welcome Test ORD 5!', 'Test', '', 'ORD 5', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (661, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'ORD 5', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (662, 1, 660, 11, 660, 0, 0, '662', '/662', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (663, 1, 662, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (664, 1, 662, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (660, 16);

insert into Users_Orgs (userId, organizationId) values (660, 19);
insert into Users_Orgs (userId, organizationId) values (660, 53);

insert into Users_Roles values (660, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (665, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 666, 'test', 'F', 'F', 'ord6', 'test.ord.6@liferay.com', 'Welcome Test ORD 6!', 'Test', '', 'ORD 6', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (666, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'ORD 6', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (667, 1, 665, 11, 665, 0, 0, '667', '/667', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (668, 1, 667, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (669, 1, 667, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (665, 16);

insert into Users_Orgs (userId, organizationId) values (665, 19);
insert into Users_Orgs (userId, organizationId) values (665, 53);

insert into Users_Roles values (665, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (670, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 671, 'test', 'F', 'F', 'ord7', 'test.ord.7@liferay.com', 'Welcome Test ORD 7!', 'Test', '', 'ORD 7', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (671, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'ORD 7', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (672, 1, 670, 11, 670, 0, 0, '672', '/672', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (673, 1, 672, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (674, 1, 672, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (670, 16);

insert into Users_Orgs (userId, organizationId) values (670, 19);
insert into Users_Orgs (userId, organizationId) values (670, 53);

insert into Users_Roles values (670, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (675, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 676, 'test', 'F', 'F', 'ord8', 'test.ord.8@liferay.com', 'Welcome Test ORD 8!', 'Test', '', 'ORD 8', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (676, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'ORD 8', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (677, 1, 675, 11, 675, 0, 0, '677', '/677', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (678, 1, 677, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (679, 1, 677, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (675, 16);

insert into Users_Orgs (userId, organizationId) values (675, 19);
insert into Users_Orgs (userId, organizationId) values (675, 53);

insert into Users_Roles values (675, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (680, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 681, 'test', 'F', 'F', 'ord9', 'test.ord.9@liferay.com', 'Welcome Test ORD 9!', 'Test', '', 'ORD 9', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (681, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'ORD 9', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (682, 1, 680, 11, 680, 0, 0, '682', '/682', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (683, 1, 682, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (684, 1, 682, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (680, 16);

insert into Users_Orgs (userId, organizationId) values (680, 19);
insert into Users_Orgs (userId, organizationId) values (680, 53);

insert into Users_Roles values (680, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (685, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 686, 'test', 'F', 'F', 'ord10', 'test.ord.10@liferay.com', 'Welcome Test ORD 10!', 'Test', '', 'ORD 10', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (686, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'ORD 10', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (687, 1, 685, 11, 685, 0, 0, '687', '/687', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (688, 1, 687, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (689, 1, 687, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (685, 16);

insert into Users_Orgs (userId, organizationId) values (685, 19);
insert into Users_Orgs (userId, organizationId) values (685, 53);

insert into Users_Roles values (685, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (690, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 691, 'test', 'F', 'F', 'nyc1', 'test.nyc.1@liferay.com', 'Welcome Test NYC 1!', 'Test', '', 'NYC 1', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (691, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'NYC 1', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (692, 1, 690, 11, 690, 0, 0, '692', '/692', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (693, 1, 692, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (694, 1, 692, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (690, 16);

insert into Users_Orgs (userId, organizationId) values (690, 19);
insert into Users_Orgs (userId, organizationId) values (690, 57);

insert into Users_Roles values (690, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (695, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 696, 'test', 'F', 'F', 'nyc2', 'test.nyc.2@liferay.com', 'Welcome Test NYC 2!', 'Test', '', 'NYC 2', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (696, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'NYC 2', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (697, 1, 695, 11, 695, 0, 0, '697', '/697', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (698, 1, 697, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (699, 1, 697, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (695, 16);

insert into Users_Orgs (userId, organizationId) values (695, 19);
insert into Users_Orgs (userId, organizationId) values (695, 57);

insert into Users_Roles values (695, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (700, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 701, 'test', 'F', 'F', 'nyc3', 'test.nyc.3@liferay.com', 'Welcome Test NYC 3!', 'Test', '', 'NYC 3', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (701, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'NYC 3', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (702, 1, 700, 11, 700, 0, 0, '702', '/702', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (703, 1, 702, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (704, 1, 702, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (700, 16);

insert into Users_Orgs (userId, organizationId) values (700, 19);
insert into Users_Orgs (userId, organizationId) values (700, 57);

insert into Users_Roles values (700, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (705, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 706, 'test', 'F', 'F', 'nyc4', 'test.nyc.4@liferay.com', 'Welcome Test NYC 4!', 'Test', '', 'NYC 4', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (706, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'NYC 4', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (707, 1, 705, 11, 705, 0, 0, '707', '/707', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (708, 1, 707, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (709, 1, 707, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (705, 16);

insert into Users_Orgs (userId, organizationId) values (705, 19);
insert into Users_Orgs (userId, organizationId) values (705, 57);

insert into Users_Roles values (705, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (710, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 711, 'test', 'F', 'F', 'nyc5', 'test.nyc.5@liferay.com', 'Welcome Test NYC 5!', 'Test', '', 'NYC 5', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (711, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'NYC 5', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (712, 1, 710, 11, 710, 0, 0, '712', '/712', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (713, 1, 712, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (714, 1, 712, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (710, 16);

insert into Users_Orgs (userId, organizationId) values (710, 19);
insert into Users_Orgs (userId, organizationId) values (710, 57);

insert into Users_Roles values (710, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (715, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 716, 'test', 'F', 'F', 'nyc6', 'test.nyc.6@liferay.com', 'Welcome Test NYC 6!', 'Test', '', 'NYC 6', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (716, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'NYC 6', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (717, 1, 715, 11, 715, 0, 0, '717', '/717', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (718, 1, 717, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (719, 1, 717, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (715, 16);

insert into Users_Orgs (userId, organizationId) values (715, 19);
insert into Users_Orgs (userId, organizationId) values (715, 57);

insert into Users_Roles values (715, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (720, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 721, 'test', 'F', 'F', 'nyc7', 'test.nyc.7@liferay.com', 'Welcome Test NYC 7!', 'Test', '', 'NYC 7', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (721, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'NYC 7', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (722, 1, 720, 11, 720, 0, 0, '722', '/722', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (723, 1, 722, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (724, 1, 722, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (720, 16);

insert into Users_Orgs (userId, organizationId) values (720, 19);
insert into Users_Orgs (userId, organizationId) values (720, 57);

insert into Users_Roles values (720, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (725, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 726, 'test', 'F', 'F', 'nyc8', 'test.nyc.8@liferay.com', 'Welcome Test NYC 8!', 'Test', '', 'NYC 8', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (726, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'NYC 8', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (727, 1, 725, 11, 725, 0, 0, '727', '/727', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (728, 1, 727, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (729, 1, 727, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (725, 16);

insert into Users_Orgs (userId, organizationId) values (725, 19);
insert into Users_Orgs (userId, organizationId) values (725, 57);

insert into Users_Roles values (725, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (730, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 731, 'test', 'F', 'F', 'nyc9', 'test.nyc.9@liferay.com', 'Welcome Test NYC 9!', 'Test', '', 'NYC 9', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (731, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'NYC 9', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (732, 1, 730, 11, 730, 0, 0, '732', '/732', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (733, 1, 732, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (734, 1, 732, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (730, 16);

insert into Users_Orgs (userId, organizationId) values (730, 19);
insert into Users_Orgs (userId, organizationId) values (730, 57);

insert into Users_Roles values (730, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (735, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 736, 'test', 'F', 'F', 'nyc10', 'test.nyc.10@liferay.com', 'Welcome Test NYC 10!', 'Test', '', 'NYC 10', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (736, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'NYC 10', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (737, 1, 735, 11, 735, 0, 0, '737', '/737', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (738, 1, 737, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (739, 1, 737, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (735, 16);

insert into Users_Orgs (userId, organizationId) values (735, 19);
insert into Users_Orgs (userId, organizationId) values (735, 57);

insert into Users_Roles values (735, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (740, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 741, 'test', 'F', 'F', 'gru1', 'test.gru.1@liferay.com', 'Welcome Test GRU 1!', 'Test', '', 'GRU 1', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (741, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'GRU 1', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (742, 1, 740, 11, 740, 0, 0, '742', '/742', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (743, 1, 742, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (744, 1, 742, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (740, 16);

insert into Users_Orgs (userId, organizationId) values (740, 19);
insert into Users_Orgs (userId, organizationId) values (740, 61);

insert into Users_Roles values (740, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (745, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 746, 'test', 'F', 'F', 'gru2', 'test.gru.2@liferay.com', 'Welcome Test GRU 2!', 'Test', '', 'GRU 2', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (746, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'GRU 2', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (747, 1, 745, 11, 745, 0, 0, '747', '/747', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (748, 1, 747, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (749, 1, 747, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (745, 16);

insert into Users_Orgs (userId, organizationId) values (745, 19);
insert into Users_Orgs (userId, organizationId) values (745, 61);

insert into Users_Roles values (745, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (750, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 751, 'test', 'F', 'F', 'gru3', 'test.gru.3@liferay.com', 'Welcome Test GRU 3!', 'Test', '', 'GRU 3', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (751, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'GRU 3', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (752, 1, 750, 11, 750, 0, 0, '752', '/752', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (753, 1, 752, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (754, 1, 752, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (750, 16);

insert into Users_Orgs (userId, organizationId) values (750, 19);
insert into Users_Orgs (userId, organizationId) values (750, 61);

insert into Users_Roles values (750, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (755, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 756, 'test', 'F', 'F', 'gru4', 'test.gru.4@liferay.com', 'Welcome Test GRU 4!', 'Test', '', 'GRU 4', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (756, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'GRU 4', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (757, 1, 755, 11, 755, 0, 0, '757', '/757', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (758, 1, 757, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (759, 1, 757, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (755, 16);

insert into Users_Orgs (userId, organizationId) values (755, 19);
insert into Users_Orgs (userId, organizationId) values (755, 61);

insert into Users_Roles values (755, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (760, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 761, 'test', 'F', 'F', 'gru5', 'test.gru.5@liferay.com', 'Welcome Test GRU 5!', 'Test', '', 'GRU 5', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (761, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'GRU 5', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (762, 1, 760, 11, 760, 0, 0, '762', '/762', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (763, 1, 762, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (764, 1, 762, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (760, 16);

insert into Users_Orgs (userId, organizationId) values (760, 19);
insert into Users_Orgs (userId, organizationId) values (760, 61);

insert into Users_Roles values (760, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (765, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 766, 'test', 'F', 'F', 'gru6', 'test.gru.6@liferay.com', 'Welcome Test GRU 6!', 'Test', '', 'GRU 6', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (766, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'GRU 6', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (767, 1, 765, 11, 765, 0, 0, '767', '/767', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (768, 1, 767, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (769, 1, 767, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (765, 16);

insert into Users_Orgs (userId, organizationId) values (765, 19);
insert into Users_Orgs (userId, organizationId) values (765, 61);

insert into Users_Roles values (765, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (770, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 771, 'test', 'F', 'F', 'gru7', 'test.gru.7@liferay.com', 'Welcome Test GRU 7!', 'Test', '', 'GRU 7', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (771, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'GRU 7', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (772, 1, 770, 11, 770, 0, 0, '772', '/772', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (773, 1, 772, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (774, 1, 772, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (770, 16);

insert into Users_Orgs (userId, organizationId) values (770, 19);
insert into Users_Orgs (userId, organizationId) values (770, 61);

insert into Users_Roles values (770, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (775, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 776, 'test', 'F', 'F', 'gru8', 'test.gru.8@liferay.com', 'Welcome Test GRU 8!', 'Test', '', 'GRU 8', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (776, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'GRU 8', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (777, 1, 775, 11, 775, 0, 0, '777', '/777', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (778, 1, 777, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (779, 1, 777, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (775, 16);

insert into Users_Orgs (userId, organizationId) values (775, 19);
insert into Users_Orgs (userId, organizationId) values (775, 61);

insert into Users_Roles values (775, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (780, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 781, 'test', 'F', 'F', 'gru9', 'test.gru.9@liferay.com', 'Welcome Test GRU 9!', 'Test', '', 'GRU 9', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (781, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'GRU 9', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (782, 1, 780, 11, 780, 0, 0, '782', '/782', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (783, 1, 782, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (784, 1, 782, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (780, 16);

insert into Users_Orgs (userId, organizationId) values (780, 19);
insert into Users_Orgs (userId, organizationId) values (780, 61);

insert into Users_Roles values (780, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (785, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 786, 'test', 'F', 'F', 'gru10', 'test.gru.10@liferay.com', 'Welcome Test GRU 10!', 'Test', '', 'GRU 10', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (786, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'GRU 10', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (787, 1, 785, 11, 785, 0, 0, '787', '/787', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (788, 1, 787, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (789, 1, 787, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (785, 16);

insert into Users_Orgs (userId, organizationId) values (785, 19);
insert into Users_Orgs (userId, organizationId) values (785, 61);

insert into Users_Roles values (785, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (790, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 791, 'test', 'F', 'F', 'fra1', 'test.fra.1@liferay.com', 'Welcome Test FRA 1!', 'Test', '', 'FRA 1', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (791, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'FRA 1', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (792, 1, 790, 11, 790, 0, 0, '792', '/792', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (793, 1, 792, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (794, 1, 792, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (790, 16);

insert into Users_Orgs (userId, organizationId) values (790, 19);
insert into Users_Orgs (userId, organizationId) values (790, 65);

insert into Users_Roles values (790, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (795, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 796, 'test', 'F', 'F', 'fra2', 'test.fra.2@liferay.com', 'Welcome Test FRA 2!', 'Test', '', 'FRA 2', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (796, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'FRA 2', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (797, 1, 795, 11, 795, 0, 0, '797', '/797', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (798, 1, 797, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (799, 1, 797, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (795, 16);

insert into Users_Orgs (userId, organizationId) values (795, 19);
insert into Users_Orgs (userId, organizationId) values (795, 65);

insert into Users_Roles values (795, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (800, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 801, 'test', 'F', 'F', 'fra3', 'test.fra.3@liferay.com', 'Welcome Test FRA 3!', 'Test', '', 'FRA 3', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (801, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'FRA 3', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (802, 1, 800, 11, 800, 0, 0, '802', '/802', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (803, 1, 802, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (804, 1, 802, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (800, 16);

insert into Users_Orgs (userId, organizationId) values (800, 19);
insert into Users_Orgs (userId, organizationId) values (800, 65);

insert into Users_Roles values (800, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (805, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 806, 'test', 'F', 'F', 'fra4', 'test.fra.4@liferay.com', 'Welcome Test FRA 4!', 'Test', '', 'FRA 4', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (806, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'FRA 4', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (807, 1, 805, 11, 805, 0, 0, '807', '/807', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (808, 1, 807, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (809, 1, 807, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (805, 16);

insert into Users_Orgs (userId, organizationId) values (805, 19);
insert into Users_Orgs (userId, organizationId) values (805, 65);

insert into Users_Roles values (805, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (810, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 811, 'test', 'F', 'F', 'fra5', 'test.fra.5@liferay.com', 'Welcome Test FRA 5!', 'Test', '', 'FRA 5', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (811, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'FRA 5', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (812, 1, 810, 11, 810, 0, 0, '812', '/812', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (813, 1, 812, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (814, 1, 812, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (810, 16);

insert into Users_Orgs (userId, organizationId) values (810, 19);
insert into Users_Orgs (userId, organizationId) values (810, 65);

insert into Users_Roles values (810, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (815, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 816, 'test', 'F', 'F', 'fra6', 'test.fra.6@liferay.com', 'Welcome Test FRA 6!', 'Test', '', 'FRA 6', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (816, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'FRA 6', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (817, 1, 815, 11, 815, 0, 0, '817', '/817', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (818, 1, 817, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (819, 1, 817, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (815, 16);

insert into Users_Orgs (userId, organizationId) values (815, 19);
insert into Users_Orgs (userId, organizationId) values (815, 65);

insert into Users_Roles values (815, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (820, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 821, 'test', 'F', 'F', 'fra7', 'test.fra.7@liferay.com', 'Welcome Test FRA 7!', 'Test', '', 'FRA 7', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (821, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'FRA 7', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (822, 1, 820, 11, 820, 0, 0, '822', '/822', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (823, 1, 822, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (824, 1, 822, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (820, 16);

insert into Users_Orgs (userId, organizationId) values (820, 19);
insert into Users_Orgs (userId, organizationId) values (820, 65);

insert into Users_Roles values (820, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (825, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 826, 'test', 'F', 'F', 'fra8', 'test.fra.8@liferay.com', 'Welcome Test FRA 8!', 'Test', '', 'FRA 8', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (826, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'FRA 8', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (827, 1, 825, 11, 825, 0, 0, '827', '/827', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (828, 1, 827, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (829, 1, 827, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (825, 16);

insert into Users_Orgs (userId, organizationId) values (825, 19);
insert into Users_Orgs (userId, organizationId) values (825, 65);

insert into Users_Roles values (825, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (830, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 831, 'test', 'F', 'F', 'fra9', 'test.fra.9@liferay.com', 'Welcome Test FRA 9!', 'Test', '', 'FRA 9', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (831, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'FRA 9', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (832, 1, 830, 11, 830, 0, 0, '832', '/832', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (833, 1, 832, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (834, 1, 832, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (830, 16);

insert into Users_Orgs (userId, organizationId) values (830, 19);
insert into Users_Orgs (userId, organizationId) values (830, 65);

insert into Users_Roles values (830, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (835, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 836, 'test', 'F', 'F', 'fra10', 'test.fra.10@liferay.com', 'Welcome Test FRA 10!', 'Test', '', 'FRA 10', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (836, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'FRA 10', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (837, 1, 835, 11, 835, 0, 0, '837', '/837', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (838, 1, 837, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (839, 1, 837, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (835, 16);

insert into Users_Orgs (userId, organizationId) values (835, 19);
insert into Users_Orgs (userId, organizationId) values (835, 65);

insert into Users_Roles values (835, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (840, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 841, 'test', 'F', 'F', 'mad1', 'test.mad.1@liferay.com', 'Welcome Test MAD 1!', 'Test', '', 'MAD 1', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (841, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'MAD 1', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (842, 1, 840, 11, 840, 0, 0, '842', '/842', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (843, 1, 842, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (844, 1, 842, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (840, 16);

insert into Users_Orgs (userId, organizationId) values (840, 19);
insert into Users_Orgs (userId, organizationId) values (840, 69);

insert into Users_Roles values (840, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (845, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 846, 'test', 'F', 'F', 'mad2', 'test.mad.2@liferay.com', 'Welcome Test MAD 2!', 'Test', '', 'MAD 2', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (846, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'MAD 2', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (847, 1, 845, 11, 845, 0, 0, '847', '/847', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (848, 1, 847, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (849, 1, 847, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (845, 16);

insert into Users_Orgs (userId, organizationId) values (845, 19);
insert into Users_Orgs (userId, organizationId) values (845, 69);

insert into Users_Roles values (845, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (850, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 851, 'test', 'F', 'F', 'mad3', 'test.mad.3@liferay.com', 'Welcome Test MAD 3!', 'Test', '', 'MAD 3', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (851, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'MAD 3', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (852, 1, 850, 11, 850, 0, 0, '852', '/852', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (853, 1, 852, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (854, 1, 852, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (850, 16);

insert into Users_Orgs (userId, organizationId) values (850, 19);
insert into Users_Orgs (userId, organizationId) values (850, 69);

insert into Users_Roles values (850, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (855, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 856, 'test', 'F', 'F', 'mad4', 'test.mad.4@liferay.com', 'Welcome Test MAD 4!', 'Test', '', 'MAD 4', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (856, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'MAD 4', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (857, 1, 855, 11, 855, 0, 0, '857', '/857', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (858, 1, 857, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (859, 1, 857, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (855, 16);

insert into Users_Orgs (userId, organizationId) values (855, 19);
insert into Users_Orgs (userId, organizationId) values (855, 69);

insert into Users_Roles values (855, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (860, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 861, 'test', 'F', 'F', 'mad5', 'test.mad.5@liferay.com', 'Welcome Test MAD 5!', 'Test', '', 'MAD 5', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (861, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'MAD 5', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (862, 1, 860, 11, 860, 0, 0, '862', '/862', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (863, 1, 862, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (864, 1, 862, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (860, 16);

insert into Users_Orgs (userId, organizationId) values (860, 19);
insert into Users_Orgs (userId, organizationId) values (860, 69);

insert into Users_Roles values (860, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (865, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 866, 'test', 'F', 'F', 'mad6', 'test.mad.6@liferay.com', 'Welcome Test MAD 6!', 'Test', '', 'MAD 6', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (866, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'MAD 6', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (867, 1, 865, 11, 865, 0, 0, '867', '/867', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (868, 1, 867, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (869, 1, 867, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (865, 16);

insert into Users_Orgs (userId, organizationId) values (865, 19);
insert into Users_Orgs (userId, organizationId) values (865, 69);

insert into Users_Roles values (865, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (870, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 871, 'test', 'F', 'F', 'mad7', 'test.mad.7@liferay.com', 'Welcome Test MAD 7!', 'Test', '', 'MAD 7', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (871, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'MAD 7', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (872, 1, 870, 11, 870, 0, 0, '872', '/872', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (873, 1, 872, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (874, 1, 872, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (870, 16);

insert into Users_Orgs (userId, organizationId) values (870, 19);
insert into Users_Orgs (userId, organizationId) values (870, 69);

insert into Users_Roles values (870, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (875, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 876, 'test', 'F', 'F', 'mad8', 'test.mad.8@liferay.com', 'Welcome Test MAD 8!', 'Test', '', 'MAD 8', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (876, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'MAD 8', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (877, 1, 875, 11, 875, 0, 0, '877', '/877', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (878, 1, 877, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (879, 1, 877, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (875, 16);

insert into Users_Orgs (userId, organizationId) values (875, 19);
insert into Users_Orgs (userId, organizationId) values (875, 69);

insert into Users_Roles values (875, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (880, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 881, 'test', 'F', 'F', 'mad9', 'test.mad.9@liferay.com', 'Welcome Test MAD 9!', 'Test', '', 'MAD 9', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (881, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'MAD 9', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (882, 1, 880, 11, 880, 0, 0, '882', '/882', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (883, 1, 882, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (884, 1, 882, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (880, 16);

insert into Users_Orgs (userId, organizationId) values (880, 19);
insert into Users_Orgs (userId, organizationId) values (880, 69);

insert into Users_Roles values (880, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (885, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 886, 'test', 'F', 'F', 'mad10', 'test.mad.10@liferay.com', 'Welcome Test MAD 10!', 'Test', '', 'MAD 10', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (886, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'MAD 10', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (887, 1, 885, 11, 885, 0, 0, '887', '/887', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (888, 1, 887, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (889, 1, 887, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (885, 16);

insert into Users_Orgs (userId, organizationId) values (885, 19);
insert into Users_Orgs (userId, organizationId) values (885, 69);

insert into Users_Roles values (885, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (890, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 891, 'test', 'F', 'F', 'dlc1', 'test.dlc.1@liferay.com', 'Welcome Test DLC 1!', 'Test', '', 'DLC 1', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (891, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'DLC 1', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (892, 1, 890, 11, 890, 0, 0, '892', '/892', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (893, 1, 892, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (894, 1, 892, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (890, 16);

insert into Users_Orgs (userId, organizationId) values (890, 19);
insert into Users_Orgs (userId, organizationId) values (890, 73);

insert into Users_Roles values (890, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (895, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 896, 'test', 'F', 'F', 'dlc2', 'test.dlc.2@liferay.com', 'Welcome Test DLC 2!', 'Test', '', 'DLC 2', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (896, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'DLC 2', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (897, 1, 895, 11, 895, 0, 0, '897', '/897', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (898, 1, 897, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (899, 1, 897, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (895, 16);

insert into Users_Orgs (userId, organizationId) values (895, 19);
insert into Users_Orgs (userId, organizationId) values (895, 73);

insert into Users_Roles values (895, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (900, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 901, 'test', 'F', 'F', 'dlc3', 'test.dlc.3@liferay.com', 'Welcome Test DLC 3!', 'Test', '', 'DLC 3', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (901, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'DLC 3', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (902, 1, 900, 11, 900, 0, 0, '902', '/902', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (903, 1, 902, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (904, 1, 902, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (900, 16);

insert into Users_Orgs (userId, organizationId) values (900, 19);
insert into Users_Orgs (userId, organizationId) values (900, 73);

insert into Users_Roles values (900, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (905, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 906, 'test', 'F', 'F', 'dlc4', 'test.dlc.4@liferay.com', 'Welcome Test DLC 4!', 'Test', '', 'DLC 4', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (906, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'DLC 4', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (907, 1, 905, 11, 905, 0, 0, '907', '/907', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (908, 1, 907, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (909, 1, 907, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (905, 16);

insert into Users_Orgs (userId, organizationId) values (905, 19);
insert into Users_Orgs (userId, organizationId) values (905, 73);

insert into Users_Roles values (905, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (910, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 911, 'test', 'F', 'F', 'dlc5', 'test.dlc.5@liferay.com', 'Welcome Test DLC 5!', 'Test', '', 'DLC 5', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (911, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'DLC 5', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (912, 1, 910, 11, 910, 0, 0, '912', '/912', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (913, 1, 912, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (914, 1, 912, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (910, 16);

insert into Users_Orgs (userId, organizationId) values (910, 19);
insert into Users_Orgs (userId, organizationId) values (910, 73);

insert into Users_Roles values (910, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (915, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 916, 'test', 'F', 'F', 'dlc6', 'test.dlc.6@liferay.com', 'Welcome Test DLC 6!', 'Test', '', 'DLC 6', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (916, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'DLC 6', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (917, 1, 915, 11, 915, 0, 0, '917', '/917', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (918, 1, 917, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (919, 1, 917, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (915, 16);

insert into Users_Orgs (userId, organizationId) values (915, 19);
insert into Users_Orgs (userId, organizationId) values (915, 73);

insert into Users_Roles values (915, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (920, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 921, 'test', 'F', 'F', 'dlc7', 'test.dlc.7@liferay.com', 'Welcome Test DLC 7!', 'Test', '', 'DLC 7', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (921, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'DLC 7', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (922, 1, 920, 11, 920, 0, 0, '922', '/922', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (923, 1, 922, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (924, 1, 922, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (920, 16);

insert into Users_Orgs (userId, organizationId) values (920, 19);
insert into Users_Orgs (userId, organizationId) values (920, 73);

insert into Users_Roles values (920, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (925, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 926, 'test', 'F', 'F', 'dlc8', 'test.dlc.8@liferay.com', 'Welcome Test DLC 8!', 'Test', '', 'DLC 8', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (926, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'DLC 8', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (927, 1, 925, 11, 925, 0, 0, '927', '/927', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (928, 1, 927, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (929, 1, 927, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (925, 16);

insert into Users_Orgs (userId, organizationId) values (925, 19);
insert into Users_Orgs (userId, organizationId) values (925, 73);

insert into Users_Roles values (925, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (930, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 931, 'test', 'F', 'F', 'dlc9', 'test.dlc.9@liferay.com', 'Welcome Test DLC 9!', 'Test', '', 'DLC 9', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (931, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'DLC 9', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (932, 1, 930, 11, 930, 0, 0, '932', '/932', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (933, 1, 932, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (934, 1, 932, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (930, 16);

insert into Users_Orgs (userId, organizationId) values (930, 19);
insert into Users_Orgs (userId, organizationId) values (930, 73);

insert into Users_Roles values (930, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (935, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 936, 'test', 'F', 'F', 'dlc10', 'test.dlc.10@liferay.com', 'Welcome Test DLC 10!', 'Test', '', 'DLC 10', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (936, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'DLC 10', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (937, 1, 935, 11, 935, 0, 0, '937', '/937', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (938, 1, 937, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (939, 1, 937, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (935, 16);

insert into Users_Orgs (userId, organizationId) values (935, 19);
insert into Users_Orgs (userId, organizationId) values (935, 73);

insert into Users_Roles values (935, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (940, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 941, 'test', 'F', 'F', 'hkg1', 'test.hkg.1@liferay.com', 'Welcome Test HKG 1!', 'Test', '', 'HKG 1', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (941, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'HKG 1', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (942, 1, 940, 11, 940, 0, 0, '942', '/942', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (943, 1, 942, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (944, 1, 942, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (940, 16);

insert into Users_Orgs (userId, organizationId) values (940, 19);
insert into Users_Orgs (userId, organizationId) values (940, 77);

insert into Users_Roles values (940, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (945, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 946, 'test', 'F', 'F', 'hkg2', 'test.hkg.2@liferay.com', 'Welcome Test HKG 2!', 'Test', '', 'HKG 2', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (946, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'HKG 2', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (947, 1, 945, 11, 945, 0, 0, '947', '/947', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (948, 1, 947, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (949, 1, 947, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (945, 16);

insert into Users_Orgs (userId, organizationId) values (945, 19);
insert into Users_Orgs (userId, organizationId) values (945, 77);

insert into Users_Roles values (945, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (950, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 951, 'test', 'F', 'F', 'hkg3', 'test.hkg.3@liferay.com', 'Welcome Test HKG 3!', 'Test', '', 'HKG 3', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (951, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'HKG 3', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (952, 1, 950, 11, 950, 0, 0, '952', '/952', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (953, 1, 952, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (954, 1, 952, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (950, 16);

insert into Users_Orgs (userId, organizationId) values (950, 19);
insert into Users_Orgs (userId, organizationId) values (950, 77);

insert into Users_Roles values (950, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (955, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 956, 'test', 'F', 'F', 'hkg4', 'test.hkg.4@liferay.com', 'Welcome Test HKG 4!', 'Test', '', 'HKG 4', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (956, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'HKG 4', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (957, 1, 955, 11, 955, 0, 0, '957', '/957', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (958, 1, 957, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (959, 1, 957, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (955, 16);

insert into Users_Orgs (userId, organizationId) values (955, 19);
insert into Users_Orgs (userId, organizationId) values (955, 77);

insert into Users_Roles values (955, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (960, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 961, 'test', 'F', 'F', 'hkg5', 'test.hkg.5@liferay.com', 'Welcome Test HKG 5!', 'Test', '', 'HKG 5', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (961, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'HKG 5', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (962, 1, 960, 11, 960, 0, 0, '962', '/962', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (963, 1, 962, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (964, 1, 962, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (960, 16);

insert into Users_Orgs (userId, organizationId) values (960, 19);
insert into Users_Orgs (userId, organizationId) values (960, 77);

insert into Users_Roles values (960, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (965, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 966, 'test', 'F', 'F', 'hkg6', 'test.hkg.6@liferay.com', 'Welcome Test HKG 6!', 'Test', '', 'HKG 6', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (966, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'HKG 6', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (967, 1, 965, 11, 965, 0, 0, '967', '/967', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (968, 1, 967, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (969, 1, 967, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (965, 16);

insert into Users_Orgs (userId, organizationId) values (965, 19);
insert into Users_Orgs (userId, organizationId) values (965, 77);

insert into Users_Roles values (965, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (970, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 971, 'test', 'F', 'F', 'hkg7', 'test.hkg.7@liferay.com', 'Welcome Test HKG 7!', 'Test', '', 'HKG 7', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (971, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'HKG 7', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (972, 1, 970, 11, 970, 0, 0, '972', '/972', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (973, 1, 972, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (974, 1, 972, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (970, 16);

insert into Users_Orgs (userId, organizationId) values (970, 19);
insert into Users_Orgs (userId, organizationId) values (970, 77);

insert into Users_Roles values (970, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (975, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 976, 'test', 'F', 'F', 'hkg8', 'test.hkg.8@liferay.com', 'Welcome Test HKG 8!', 'Test', '', 'HKG 8', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (976, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'HKG 8', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (977, 1, 975, 11, 975, 0, 0, '977', '/977', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (978, 1, 977, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (979, 1, 977, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (975, 16);

insert into Users_Orgs (userId, organizationId) values (975, 19);
insert into Users_Orgs (userId, organizationId) values (975, 77);

insert into Users_Roles values (975, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (980, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 981, 'test', 'F', 'F', 'hkg9', 'test.hkg.9@liferay.com', 'Welcome Test HKG 9!', 'Test', '', 'HKG 9', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (981, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'HKG 9', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (982, 1, 980, 11, 980, 0, 0, '982', '/982', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (983, 1, 982, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (984, 1, 982, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (980, 16);

insert into Users_Orgs (userId, organizationId) values (980, 19);
insert into Users_Orgs (userId, organizationId) values (980, 77);

insert into Users_Roles values (980, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (985, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 986, 'test', 'F', 'F', 'hkg10', 'test.hkg.10@liferay.com', 'Welcome Test HKG 10!', 'Test', '', 'HKG 10', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (986, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'HKG 10', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (987, 1, 985, 11, 985, 0, 0, '987', '/987', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (988, 1, 987, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (989, 1, 987, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (985, 16);

insert into Users_Orgs (userId, organizationId) values (985, 19);
insert into Users_Orgs (userId, organizationId) values (985, 77);

insert into Users_Roles values (985, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (990, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 991, 'test', 'F', 'F', 'kul1', 'test.kul.1@liferay.com', 'Welcome Test KUL 1!', 'Test', '', 'KUL 1', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (991, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'KUL 1', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (992, 1, 990, 11, 990, 0, 0, '992', '/992', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (993, 1, 992, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (994, 1, 992, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (990, 16);

insert into Users_Orgs (userId, organizationId) values (990, 19);
insert into Users_Orgs (userId, organizationId) values (990, 81);

insert into Users_Roles values (990, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (995, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 996, 'test', 'F', 'F', 'kul2', 'test.kul.2@liferay.com', 'Welcome Test KUL 2!', 'Test', '', 'KUL 2', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (996, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'KUL 2', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (997, 1, 995, 11, 995, 0, 0, '997', '/997', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (998, 1, 997, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (999, 1, 997, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (995, 16);

insert into Users_Orgs (userId, organizationId) values (995, 19);
insert into Users_Orgs (userId, organizationId) values (995, 81);

insert into Users_Roles values (995, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1000, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 1001, 'test', 'F', 'F', 'kul3', 'test.kul.3@liferay.com', 'Welcome Test KUL 3!', 'Test', '', 'KUL 3', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1001, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'KUL 3', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1002, 1, 1000, 11, 1000, 0, 0, '1002', '/1002', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1003, 1, 1002, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1004, 1, 1002, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (1000, 16);

insert into Users_Orgs (userId, organizationId) values (1000, 19);
insert into Users_Orgs (userId, organizationId) values (1000, 81);

insert into Users_Roles values (1000, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1005, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 1006, 'test', 'F', 'F', 'kul4', 'test.kul.4@liferay.com', 'Welcome Test KUL 4!', 'Test', '', 'KUL 4', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1006, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'KUL 4', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1007, 1, 1005, 11, 1005, 0, 0, '1007', '/1007', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1008, 1, 1007, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1009, 1, 1007, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (1005, 16);

insert into Users_Orgs (userId, organizationId) values (1005, 19);
insert into Users_Orgs (userId, organizationId) values (1005, 81);

insert into Users_Roles values (1005, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1010, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 1011, 'test', 'F', 'F', 'kul5', 'test.kul.5@liferay.com', 'Welcome Test KUL 5!', 'Test', '', 'KUL 5', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1011, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'KUL 5', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1012, 1, 1010, 11, 1010, 0, 0, '1012', '/1012', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1013, 1, 1012, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1014, 1, 1012, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (1010, 16);

insert into Users_Orgs (userId, organizationId) values (1010, 19);
insert into Users_Orgs (userId, organizationId) values (1010, 81);

insert into Users_Roles values (1010, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1015, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 1016, 'test', 'F', 'F', 'kul6', 'test.kul.6@liferay.com', 'Welcome Test KUL 6!', 'Test', '', 'KUL 6', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1016, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'KUL 6', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1017, 1, 1015, 11, 1015, 0, 0, '1017', '/1017', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1018, 1, 1017, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1019, 1, 1017, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (1015, 16);

insert into Users_Orgs (userId, organizationId) values (1015, 19);
insert into Users_Orgs (userId, organizationId) values (1015, 81);

insert into Users_Roles values (1015, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1020, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 1021, 'test', 'F', 'F', 'kul7', 'test.kul.7@liferay.com', 'Welcome Test KUL 7!', 'Test', '', 'KUL 7', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1021, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'KUL 7', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1022, 1, 1020, 11, 1020, 0, 0, '1022', '/1022', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1023, 1, 1022, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1024, 1, 1022, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (1020, 16);

insert into Users_Orgs (userId, organizationId) values (1020, 19);
insert into Users_Orgs (userId, organizationId) values (1020, 81);

insert into Users_Roles values (1020, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1025, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 1026, 'test', 'F', 'F', 'kul8', 'test.kul.8@liferay.com', 'Welcome Test KUL 8!', 'Test', '', 'KUL 8', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1026, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'KUL 8', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1027, 1, 1025, 11, 1025, 0, 0, '1027', '/1027', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1028, 1, 1027, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1029, 1, 1027, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (1025, 16);

insert into Users_Orgs (userId, organizationId) values (1025, 19);
insert into Users_Orgs (userId, organizationId) values (1025, 81);

insert into Users_Roles values (1025, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1030, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 1031, 'test', 'F', 'F', 'kul9', 'test.kul.9@liferay.com', 'Welcome Test KUL 9!', 'Test', '', 'KUL 9', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1031, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'KUL 9', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1032, 1, 1030, 11, 1030, 0, 0, '1032', '/1032', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1033, 1, 1032, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1034, 1, 1032, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (1030, 16);

insert into Users_Orgs (userId, organizationId) values (1030, 19);
insert into Users_Orgs (userId, organizationId) values (1030, 81);

insert into Users_Roles values (1030, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1035, 1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 'F', 1036, 'test', 'F', 'F', 'kul10', 'test.kul.10@liferay.com', 'Welcome Test KUL 10!', 'Test', '', 'KUL 10', CURRENT YEAR TO FRACTION, 0, 'T', 'T');
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1036, 1, 2, 'Joe Bloggs', CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 7, 0, 'Test', '', 'KUL 10', 'T', '1970-01-01 00:00:00.0');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1037, 1, 1035, 11, 1035, 0, 0, '1037', '/1037', 'T');
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1038, 1, 1037, 'T', 'F', 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1039, 1, 1037, 'F', 'F', 'classic', '01', 0);

insert into Users_Groups values (1035, 16);

insert into Users_Orgs (userId, organizationId) values (1035, 19);
insert into Users_Orgs (userId, organizationId) values (1035, 81);

insert into Users_Roles values (1035, 15);












insert into Release_ (releaseId, createDate, modifiedDate, buildNumber, verified) values (1, CURRENT YEAR TO FRACTION, CURRENT YEAR TO FRACTION, 5203, 'F');


create table QUARTZ_JOB_DETAILS (
	JOB_NAME varchar(80) not null,
	JOB_GROUP varchar(80) not null,
	DESCRIPTION varchar(120),
	JOB_CLASS_NAME varchar(128) not null,
	IS_DURABLE boolean not null,
	IS_VOLATILE boolean not null,
	IS_STATEFUL boolean not null,
	REQUESTS_RECOVERY boolean not null,
	JOB_DATA byte in table,
	primary key (JOB_NAME, JOB_GROUP)
)
extent size 16 next size 16
lock mode row;

create table QUARTZ_JOB_LISTENERS (
	JOB_NAME varchar(80) not null,
	JOB_GROUP varchar(80) not null,
	JOB_LISTENER varchar(80) not null,
	primary key (JOB_NAME, JOB_GROUP, JOB_LISTENER)
)
extent size 16 next size 16
lock mode row;

create table QUARTZ_TRIGGERS (
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	JOB_NAME varchar(80) not null,
	JOB_GROUP varchar(80) not null,
	IS_VOLATILE boolean not null,
	DESCRIPTION varchar(120),
	NEXT_FIRE_TIME int8,
	PREV_FIRE_TIME int8,
	PRIORITY int,
	TRIGGER_STATE varchar(16) not null,
	TRIGGER_TYPE varchar(8) not null,
	START_TIME int8 not null,
	END_TIME int8,
	CALENDAR_NAME varchar(80),
	MISFIRE_INSTR int,
	JOB_DATA byte in table,
	primary key (TRIGGER_NAME, TRIGGER_GROUP)
)
extent size 16 next size 16
lock mode row;

create table QUARTZ_SIMPLE_TRIGGERS (
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	REPEAT_COUNT int8 not null,
	REPEAT_INTERVAL int8 not null,
	TIMES_TRIGGERED int8 not null,
	primary key (TRIGGER_NAME, TRIGGER_GROUP)
)
extent size 16 next size 16
lock mode row;

create table QUARTZ_CRON_TRIGGERS (
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	CRON_EXPRESSION varchar(80) not null,
	TIME_ZONE_ID varchar(80),
	primary key (TRIGGER_NAME, TRIGGER_GROUP)
)
extent size 16 next size 16
lock mode row;

create table QUARTZ_BLOB_TRIGGERS (
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	BLOB_DATA byte in table,
	primary key (TRIGGER_NAME, TRIGGER_GROUP)
)
extent size 16 next size 16
lock mode row;

create table QUARTZ_TRIGGER_LISTENERS (
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	TRIGGER_LISTENER varchar(80) not null,
	primary key (TRIGGER_NAME, TRIGGER_GROUP, TRIGGER_LISTENER)
)
extent size 16 next size 16
lock mode row;

create table QUARTZ_CALENDARS (
	CALENDAR_NAME varchar(80) not null primary key,
	CALENDAR byte in table not null
)
extent size 16 next size 16
lock mode row;

create table QUARTZ_PAUSED_TRIGGER_GRPS (
	TRIGGER_GROUP varchar(80) not null primary key
)
extent size 16 next size 16
lock mode row;

create table QUARTZ_FIRED_TRIGGERS (
	ENTRY_ID varchar(95) not null primary key,
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	IS_VOLATILE boolean not null,
	INSTANCE_NAME varchar(80) not null,
	FIRED_TIME int8 not null,
	PRIORITY int not null,
	STATE varchar(16) not null,
	JOB_NAME varchar(80),
	JOB_GROUP varchar(80),
	IS_STATEFUL boolean,
	REQUESTS_RECOVERY boolean
)
extent size 16 next size 16
lock mode row;

create table QUARTZ_SCHEDULER_STATE (
	INSTANCE_NAME varchar(80) not null primary key,
	LAST_CHECKIN_TIME int8 not null,
	CHECKIN_INTERVAL int8 not null
)
extent size 16 next size 16
lock mode row;

create table QUARTZ_LOCKS (
	LOCK_NAME varchar(40) not null primary key
)
extent size 16 next size 16
lock mode row;



insert into QUARTZ_LOCKS values('TRIGGER_ACCESS');
insert into QUARTZ_LOCKS values('JOB_ACCESS');
insert into QUARTZ_LOCKS values('CALENDAR_ACCESS');
insert into QUARTZ_LOCKS values('STATE_ACCESS');
insert into QUARTZ_LOCKS values('MISFIRE_ACCESS');

create index IX_F7655CC3 on QUARTZ_TRIGGERS (NEXT_FIRE_TIME);
create index IX_9955EFB5 on QUARTZ_TRIGGERS (TRIGGER_STATE);
create index IX_8040C593 on QUARTZ_TRIGGERS (TRIGGER_STATE, NEXT_FIRE_TIME);
create index IX_804154AF on QUARTZ_FIRED_TRIGGERS (INSTANCE_NAME);
create index IX_BAB9A1F7 on QUARTZ_FIRED_TRIGGERS (JOB_GROUP);
create index IX_ADEE6A17 on QUARTZ_FIRED_TRIGGERS (JOB_NAME);
create index IX_64B194F2 on QUARTZ_FIRED_TRIGGERS (TRIGGER_GROUP);
create index IX_5FEABBC on QUARTZ_FIRED_TRIGGERS (TRIGGER_NAME);
create index IX_20D8706C on QUARTZ_FIRED_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP);




