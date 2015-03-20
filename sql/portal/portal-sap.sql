create table Account_ (
	accountId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	parentAccountId bigint,
	name varchar(75) null,
	legalName varchar(75) null,
	legalId varchar(75) null,
	legalType varchar(75) null,
	sicCode varchar(75) null,
	tickerSymbol varchar(75) null,
	industry varchar(75) null,
	type_ varchar(75) null,
	size_ varchar(75) null
);

create table Address (
	addressId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	street1 varchar(75) null,
	street2 varchar(75) null,
	street3 varchar(75) null,
	city varchar(75) null,
	zip varchar(75) null,
	regionId bigint,
	countryId bigint,
	typeId int,
	mailing boolean,
	primary_ boolean
);

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
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	title varchar(75) null,
	content varchar null,
	url varchar null,
	type_ varchar(75) null,
	displayDate timestamp null,
	expirationDate timestamp null,
	priority int,
	alert boolean
);

create table AnnouncementsFlag (
	flagId bigint not null primary key,
	userId bigint,
	createDate timestamp null,
	entryId bigint,
	value int
);

create table BlogsEntry (
	uuid_ varchar(75) null,
	entryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	title varchar(150) null,
	urlTitle varchar(150) null,
	content varchar null,
	displayDate timestamp null,
	draft boolean,
	allowTrackbacks boolean,
	trackbacks varchar null
);

create table BlogsStatsUser (
	statsUserId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	entryCount int,
	lastPostDate timestamp null,
	ratingsTotalEntries int,
	ratingsTotalScore float,
	ratingsAverageScore float
);

create table BookmarksEntry (
	uuid_ varchar(75) null,
	entryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate timestamp null,
	modifiedDate timestamp null,
	folderId bigint,
	name varchar(255) null,
	url varchar null,
	comments varchar null,
	visits int,
	priority int
);

create table BookmarksFolder (
	uuid_ varchar(75) null,
	folderId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate timestamp null,
	modifiedDate timestamp null,
	parentFolderId bigint,
	name varchar(75) null,
	description varchar null
);

create table BrowserTracker (
	browserTrackerId bigint not null primary key,
	userId bigint,
	browserKey bigint
);

create table CalEvent (
	uuid_ varchar(75) null,
	eventId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	title varchar(75) null,
	description varchar null,
	startDate timestamp null,
	endDate timestamp null,
	durationHour int,
	durationMinute int,
	allDay boolean,
	timeZoneSensitive boolean,
	type_ varchar(75) null,
	repeating boolean,
	recurrence varchar null,
	remindBy int,
	firstReminder int,
	secondReminder int
);

create table ClassName_ (
	classNameId bigint not null primary key,
	value varchar(200) null
);

create table Company (
	companyId bigint not null primary key,
	accountId bigint,
	webId varchar(75) null,
	key_ varchar null,
	virtualHost varchar(75) null,
	mx varchar(75) null,
	homeURL varchar null,
	logoId bigint,
	system boolean
);

create table Contact_ (
	contactId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	accountId bigint,
	parentContactId bigint,
	firstName varchar(75) null,
	middleName varchar(75) null,
	lastName varchar(75) null,
	prefixId int,
	suffixId int,
	male boolean,
	birthday timestamp null,
	smsSn varchar(75) null,
	aimSn varchar(75) null,
	facebookSn varchar(75) null,
	icqSn varchar(75) null,
	jabberSn varchar(75) null,
	msnSn varchar(75) null,
	mySpaceSn varchar(75) null,
	skypeSn varchar(75) null,
	twitterSn varchar(75) null,
	ymSn varchar(75) null,
	employeeStatusId varchar(75) null,
	employeeNumber varchar(75) null,
	jobTitle varchar(100) null,
	jobClass varchar(75) null,
	hoursOfOperation varchar(75) null
);

create table Counter (
	name varchar(75) not null primary key,
	currentId bigint
);

create table Country (
	countryId bigint not null primary key,
	name varchar(75) null,
	a2 varchar(75) null,
	a3 varchar(75) null,
	number_ varchar(75) null,
	idd_ varchar(75) null,
	active_ boolean
);

create table CyrusUser (
	userId varchar(75) not null primary key,
	password_ varchar(75) not null
);

create table CyrusVirtual (
	emailAddress varchar(75) not null primary key,
	userId varchar(75) not null
);

create table DLFileEntry (
	uuid_ varchar(75) null,
	fileEntryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	versionUserId bigint,
	versionUserName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	folderId bigint,
	name varchar(255) null,
	title varchar(255) null,
	description varchar null,
	version float,
	size_ int,
	readCount int,
	extraSettings varchar null
);

create table DLFileRank (
	fileRankId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate timestamp null,
	folderId bigint,
	name varchar(255) null
);

create table DLFileShortcut (
	uuid_ varchar(75) null,
	fileShortcutId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	folderId bigint,
	toFolderId bigint,
	toName varchar(255) null
);

create table DLFileVersion (
	fileVersionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	folderId bigint,
	name varchar(255) null,
	version float,
	size_ int
);

create table DLFolder (
	uuid_ varchar(75) null,
	folderId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	parentFolderId bigint,
	name varchar(100) null,
	description varchar null,
	lastPostDate timestamp null
);

create table EmailAddress (
	emailAddressId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	address varchar(75) null,
	typeId int,
	primary_ boolean
);

create table ExpandoColumn (
	columnId bigint not null primary key,
	companyId bigint,
	tableId bigint,
	name varchar(75) null,
	type_ int,
	defaultData varchar null,
	typeSettings varchar null
);

create table ExpandoRow (
	rowId_ bigint not null primary key,
	companyId bigint,
	tableId bigint,
	classPK bigint
);

create table ExpandoTable (
	tableId bigint not null primary key,
	companyId bigint,
	classNameId bigint,
	name varchar(75) null
);

create table ExpandoValue (
	valueId bigint not null primary key,
	companyId bigint,
	tableId bigint,
	columnId bigint,
	rowId_ bigint,
	classNameId bigint,
	classPK bigint,
	data_ varchar null
);

create table Group_ (
	groupId bigint not null primary key,
	companyId bigint,
	creatorUserId bigint,
	classNameId bigint,
	classPK bigint,
	parentGroupId bigint,
	liveGroupId bigint,
	name varchar(75) null,
	description varchar null,
	type_ int,
	typeSettings varchar null,
	friendlyURL varchar(100) null,
	active_ boolean
);

create table Groups_Orgs (
	groupId bigint not null,
	organizationId bigint not null,
	primary key (groupId, organizationId)
);

create table Groups_Permissions (
	groupId bigint not null,
	permissionId bigint not null,
	primary key (groupId, permissionId)
);

create table Groups_Roles (
	groupId bigint not null,
	roleId bigint not null,
	primary key (groupId, roleId)
);

create table Groups_UserGroups (
	groupId bigint not null,
	userGroupId bigint not null,
	primary key (groupId, userGroupId)
);

create table IGFolder (
	uuid_ varchar(75) null,
	folderId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate timestamp null,
	modifiedDate timestamp null,
	parentFolderId bigint,
	name varchar(75) null,
	description varchar null
);

create table IGImage (
	uuid_ varchar(75) null,
	imageId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate timestamp null,
	modifiedDate timestamp null,
	folderId bigint,
	name varchar(75) null,
	description varchar null,
	smallImageId bigint,
	largeImageId bigint,
	custom1ImageId bigint,
	custom2ImageId bigint
);

create table Image (
	imageId bigint not null primary key,
	modifiedDate timestamp null,
	text_ varchar null,
	type_ varchar(75) null,
	height int,
	width int,
	size_ int
);

create table JournalArticle (
	uuid_ varchar(75) null,
	id_ bigint not null primary key,
	resourcePrimKey bigint,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	articleId varchar(75) null,
	version float,
	title varchar(100) null,
	urlTitle varchar(150) null,
	description varchar null,
	content varchar null,
	type_ varchar(75) null,
	structureId varchar(75) null,
	templateId varchar(75) null,
	displayDate timestamp null,
	approved boolean,
	approvedByUserId bigint,
	approvedByUserName varchar(75) null,
	approvedDate timestamp null,
	expired boolean,
	expirationDate timestamp null,
	reviewDate timestamp null,
	indexable boolean,
	smallImage boolean,
	smallImageId bigint,
	smallImageURL varchar(75) null
);

create table JournalArticleImage (
	articleImageId bigint not null primary key,
	groupId bigint,
	articleId varchar(75) null,
	version float,
	elInstanceId varchar(75) null,
	elName varchar(75) null,
	languageId varchar(75) null,
	tempImage boolean
);

create table JournalArticleResource (
	resourcePrimKey bigint not null primary key,
	groupId bigint,
	articleId varchar(75) null
);

create table JournalContentSearch (
	contentSearchId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	privateLayout boolean,
	layoutId bigint,
	portletId varchar(200) null,
	articleId varchar(75) null
);

create table JournalFeed (
	uuid_ varchar(75) null,
	id_ bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	feedId varchar(75) null,
	name varchar(75) null,
	description varchar null,
	type_ varchar(75) null,
	structureId varchar(75) null,
	templateId varchar(75) null,
	rendererTemplateId varchar(75) null,
	delta int,
	orderByCol varchar(75) null,
	orderByType varchar(75) null,
	targetLayoutFriendlyUrl varchar(75) null,
	targetPortletId varchar(75) null,
	contentField varchar(75) null,
	feedType varchar(75) null,
	feedVersion float
);

create table JournalStructure (
	uuid_ varchar(75) null,
	id_ bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	structureId varchar(75) null,
	parentStructureId varchar(75) null,
	name varchar(75) null,
	description varchar null,
	xsd varchar null
);

create table JournalTemplate (
	uuid_ varchar(75) null,
	id_ bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	templateId varchar(75) null,
	structureId varchar(75) null,
	name varchar(75) null,
	description varchar null,
	xsl varchar null,
	langType varchar(75) null,
	cacheable boolean,
	smallImage boolean,
	smallImageId bigint,
	smallImageURL varchar(75) null
);

create table Layout (
	plid bigint not null primary key,
	groupId bigint,
	companyId bigint,
	privateLayout boolean,
	layoutId bigint,
	parentLayoutId bigint,
	name varchar null,
	title varchar null,
	description varchar null,
	type_ varchar(75) null,
	typeSettings varchar null,
	hidden_ boolean,
	friendlyURL varchar(100) null,
	iconImage boolean,
	iconImageId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	wapThemeId varchar(75) null,
	wapColorSchemeId varchar(75) null,
	css varchar null,
	priority int,
	dlFolderId bigint
);

create table LayoutSet (
	layoutSetId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	privateLayout boolean,
	logo boolean,
	logoId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	wapThemeId varchar(75) null,
	wapColorSchemeId varchar(75) null,
	css varchar null,
	pageCount int,
	virtualHost varchar(75) null
);

create table ListType (
	listTypeId int not null primary key,
	name varchar(75) null,
	type_ varchar(75) null
);

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

create table MBCategory (
	uuid_ varchar(75) null,
	categoryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	parentCategoryId bigint,
	name varchar(75) null,
	description varchar null,
	threadCount int,
	messageCount int,
	lastPostDate timestamp null
);

create table MBDiscussion (
	discussionId bigint not null primary key,
	classNameId bigint,
	classPK bigint,
	threadId bigint
);

create table MBMailingList (
	uuid_ varchar(75) null,
	mailingListId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	categoryId bigint,
	emailAddress varchar(75) null,
	inProtocol varchar(75) null,
	inServerName varchar(75) null,
	inServerPort int,
	inUseSSL boolean,
	inUserName varchar(75) null,
	inPassword varchar(75) null,
	inReadInterval int,
	outEmailAddress varchar(75) null,
	outCustom boolean,
	outServerName varchar(75) null,
	outServerPort int,
	outUseSSL boolean,
	outUserName varchar(75) null,
	outPassword varchar(75) null,
	active_ boolean
);

create table MBMessage (
	uuid_ varchar(75) null,
	messageId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	categoryId bigint,
	threadId bigint,
	parentMessageId bigint,
	subject varchar(75) null,
	body varchar null,
	attachments boolean,
	anonymous boolean,
	priority float
);

create table MBMessageFlag (
	messageFlagId bigint not null primary key,
	userId bigint,
	modifiedDate timestamp null,
	threadId bigint,
	messageId bigint,
	flag int
);

create table MBStatsUser (
	statsUserId bigint not null primary key,
	groupId bigint,
	userId bigint,
	messageCount int,
	lastPostDate timestamp null
);

create table MBThread (
	threadId bigint not null primary key,
	groupId bigint,
	categoryId bigint,
	rootMessageId bigint,
	messageCount int,
	viewCount int,
	lastPostByUserId bigint,
	lastPostDate timestamp null,
	priority float
);

create table MembershipRequest (
	membershipRequestId bigint not null primary key,
	companyId bigint,
	userId bigint,
	createDate timestamp null,
	groupId bigint,
	comments varchar null,
	replyComments varchar null,
	replyDate timestamp null,
	replierUserId bigint,
	statusId int
);

create table Organization_ (
	organizationId bigint not null primary key,
	companyId bigint,
	parentOrganizationId bigint,
	leftOrganizationId bigint,
	rightOrganizationId bigint,
	name varchar(100) null,
	type_ varchar(75) null,
	recursable boolean,
	regionId bigint,
	countryId bigint,
	statusId int,
	comments varchar null
);

create table OrgGroupPermission (
	organizationId bigint not null,
	groupId bigint not null,
	permissionId bigint not null,
	primary key (organizationId, groupId, permissionId)
);

create table OrgGroupRole (
	organizationId bigint not null,
	groupId bigint not null,
	roleId bigint not null,
	primary key (organizationId, groupId, roleId)
);

create table OrgLabor (
	orgLaborId bigint not null primary key,
	organizationId bigint,
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
);

create table PasswordPolicy (
	passwordPolicyId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	defaultPolicy boolean,
	name varchar(75) null,
	description varchar null,
	changeable boolean,
	changeRequired boolean,
	minAge bigint,
	checkSyntax boolean,
	allowDictionaryWords boolean,
	minLength int,
	history boolean,
	historyCount int,
	expireable boolean,
	maxAge bigint,
	warningTime bigint,
	graceLimit int,
	lockout boolean,
	maxFailure int,
	lockoutDuration bigint,
	requireUnlock boolean,
	resetFailureCount bigint
);

create table PasswordPolicyRel (
	passwordPolicyRelId bigint not null primary key,
	passwordPolicyId bigint,
	classNameId bigint,
	classPK bigint
);

create table PasswordTracker (
	passwordTrackerId bigint not null primary key,
	userId bigint,
	createDate timestamp null,
	password_ varchar(75) null
);

create table Permission_ (
	permissionId bigint not null primary key,
	companyId bigint,
	actionId varchar(75) null,
	resourceId bigint
);

create table Phone (
	phoneId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	number_ varchar(75) null,
	extension varchar(75) null,
	typeId int,
	primary_ boolean
);

create table PluginSetting (
	pluginSettingId bigint not null primary key,
	companyId bigint,
	pluginId varchar(75) null,
	pluginType varchar(75) null,
	roles varchar null,
	active_ boolean
);

create table PollsChoice (
	uuid_ varchar(75) null,
	choiceId bigint not null primary key,
	questionId bigint,
	name varchar(75) null,
	description varchar(1000) null
);

create table PollsQuestion (
	uuid_ varchar(75) null,
	questionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	title varchar(500) null,
	description varchar null,
	expirationDate timestamp null,
	lastVoteDate timestamp null
);

create table PollsVote (
	voteId bigint not null primary key,
	userId bigint,
	questionId bigint,
	choiceId bigint,
	voteDate timestamp null
);

create table Portlet (
	id_ bigint not null primary key,
	companyId bigint,
	portletId varchar(200) null,
	roles varchar null,
	active_ boolean
);

create table PortletItem (
	portletItemId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	portletId varchar(75) null,
	classNameId bigint
);

create table PortletPreferences (
	portletPreferencesId bigint not null primary key,
	ownerId bigint,
	ownerType int,
	plid bigint,
	portletId varchar(200) null,
	preferences varchar null
);

create table RatingsEntry (
	entryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	score float
);

create table RatingsStats (
	statsId bigint not null primary key,
	classNameId bigint,
	classPK bigint,
	totalEntries int,
	totalScore float,
	averageScore float
);

create table Region (
	regionId bigint not null primary key,
	countryId bigint,
	regionCode varchar(75) null,
	name varchar(75) null,
	active_ boolean
);

create table Release_ (
	releaseId bigint not null primary key,
	createDate timestamp null,
	modifiedDate timestamp null,
	buildNumber int,
	buildDate timestamp null,
	verified boolean,
	testString varchar(1024) null
);

create table Resource_ (
	resourceId bigint not null primary key,
	codeId bigint,
	primKey varchar(255) null
);

create table ResourceAction (
	resourceActionId bigint not null primary key,
	name varchar(75) null,
	actionId varchar(75) null,
	bitwiseValue bigint
);

create table ResourceCode (
	codeId bigint not null primary key,
	companyId bigint,
	name varchar(255) null,
	scope int
);

create table ResourcePermission (
	resourcePermissionId bigint not null primary key,
	companyId bigint,
	name varchar(255) null,
	scope int,
	primKey varchar(255) null,
	roleId bigint,
	actionIds bigint
);

create table Role_ (
	roleId bigint not null primary key,
	companyId bigint,
	classNameId bigint,
	classPK bigint,
	name varchar(75) null,
	title varchar null,
	description varchar null,
	type_ int,
	subtype varchar(75) null
);

create table Roles_Permissions (
	roleId bigint not null,
	permissionId bigint not null,
	primary key (roleId, permissionId)
);

create table SCFrameworkVersi_SCProductVers (
	frameworkVersionId bigint not null,
	productVersionId bigint not null,
	primary key (frameworkVersionId, productVersionId)
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
	url varchar null,
	active_ boolean,
	priority int
);

create table SCLicense (
	licenseId bigint not null primary key,
	name varchar(75) null,
	url varchar null,
	openSource boolean,
	active_ boolean,
	recommended boolean
);

create table SCLicenses_SCProductEntries (
	licenseId bigint not null,
	productEntryId bigint not null,
	primary key (licenseId, productEntryId)
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
	tags varchar(255) null,
	shortDescription varchar null,
	longDescription varchar null,
	pageURL varchar null,
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
	changeLog varchar null,
	downloadPageURL varchar null,
	directDownloadURL varchar(2000) null,
	repoStoreArtifact boolean
);

create table ServiceComponent (
	serviceComponentId bigint not null primary key,
	buildNamespace varchar(75) null,
	buildNumber bigint,
	buildDate bigint,
	data_ varchar null
);

create table Shard (
	shardId bigint not null primary key,
	classNameId bigint,
	classPK bigint,
	name varchar(75) null
);

create table ShoppingCart (
	cartId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	itemIds varchar null,
	couponCodes varchar(75) null,
	altShipping int,
	insure boolean
);

create table ShoppingCategory (
	categoryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	parentCategoryId bigint,
	name varchar(75) null,
	description varchar null
);

create table ShoppingCoupon (
	couponId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	code_ varchar(75) null,
	name varchar(75) null,
	description varchar null,
	startDate timestamp null,
	endDate timestamp null,
	active_ boolean,
	limitCategories varchar null,
	limitSkus varchar null,
	minOrder float,
	discount float,
	discountType varchar(75) null
);

create table ShoppingItem (
	itemId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	categoryId bigint,
	sku varchar(75) null,
	name varchar(200) null,
	description varchar null,
	properties varchar null,
	fields_ boolean,
	fieldsQuantities varchar null,
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
	smallImageId bigint,
	smallImageURL varchar(75) null,
	mediumImage boolean,
	mediumImageId bigint,
	mediumImageURL varchar(75) null,
	largeImage boolean,
	largeImageId bigint,
	largeImageURL varchar(75) null
);

create table ShoppingItemField (
	itemFieldId bigint not null primary key,
	itemId bigint,
	name varchar(75) null,
	values_ varchar null,
	description varchar null
);

create table ShoppingItemPrice (
	itemPriceId bigint not null primary key,
	itemId bigint,
	minQuantity int,
	maxQuantity int,
	price float,
	discount float,
	taxable boolean,
	shipping float,
	useShippingFormula boolean,
	status int
);

create table ShoppingOrder (
	orderId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	number_ varchar(75) null,
	tax float,
	shipping float,
	altShipping varchar(75) null,
	requiresShipping boolean,
	insure boolean,
	insurance float,
	couponCodes varchar(75) null,
	couponDiscount float,
	billingFirstName varchar(75) null,
	billingLastName varchar(75) null,
	billingEmailAddress varchar(75) null,
	billingCompany varchar(75) null,
	billingStreet varchar(75) null,
	billingCity varchar(75) null,
	billingState varchar(75) null,
	billingZip varchar(75) null,
	billingCountry varchar(75) null,
	billingPhone varchar(75) null,
	shipToBilling boolean,
	shippingFirstName varchar(75) null,
	shippingLastName varchar(75) null,
	shippingEmailAddress varchar(75) null,
	shippingCompany varchar(75) null,
	shippingStreet varchar(75) null,
	shippingCity varchar(75) null,
	shippingState varchar(75) null,
	shippingZip varchar(75) null,
	shippingCountry varchar(75) null,
	shippingPhone varchar(75) null,
	ccName varchar(75) null,
	ccType varchar(75) null,
	ccNumber varchar(75) null,
	ccExpMonth int,
	ccExpYear int,
	ccVerNumber varchar(75) null,
	comments varchar null,
	ppTxnId varchar(75) null,
	ppPaymentStatus varchar(75) null,
	ppPaymentGross float,
	ppReceiverEmail varchar(75) null,
	ppPayerEmail varchar(75) null,
	sendOrderEmail boolean,
	sendShippingEmail boolean
);

create table ShoppingOrderItem (
	orderItemId bigint not null primary key,
	orderId bigint,
	itemId varchar(75) null,
	sku varchar(75) null,
	name varchar(200) null,
	description varchar null,
	properties varchar null,
	price float,
	quantity int,
	shippedDate timestamp null
);

create table SocialActivity (
	activityId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate timestamp null,
	mirrorActivityId bigint,
	classNameId bigint,
	classPK bigint,
	type_ int,
	extraData varchar null,
	receiverUserId bigint
);

create table SocialRelation (
	uuid_ varchar(75) null,
	relationId bigint not null primary key,
	companyId bigint,
	createDate timestamp null,
	userId1 bigint,
	userId2 bigint,
	type_ int
);

create table SocialRequest (
	uuid_ varchar(75) null,
	requestId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	type_ int,
	extraData varchar null,
	receiverUserId bigint,
	status int
);

create table Subscription (
	subscriptionId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	frequency varchar(75) null
);

create table TagsAsset (
	assetId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	visible boolean,
	startDate timestamp null,
	endDate timestamp null,
	publishDate timestamp null,
	expirationDate timestamp null,
	mimeType varchar(75) null,
	title varchar(255) null,
	description varchar null,
	summary varchar null,
	url varchar null,
	height int,
	width int,
	priority float,
	viewCount int
);

create table TagsAssets_TagsEntries (
	assetId bigint not null,
	entryId bigint not null,
	primary key (assetId, entryId)
);

create table TagsEntry (
	entryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	parentEntryId bigint,
	name varchar(75) null,
	vocabularyId bigint
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
	value varchar(255) null
);

create table TagsSource (
	sourceId bigint not null primary key,
	parentSourceId bigint,
	name varchar(75) null,
	acronym varchar(75) null
);

create table TagsVocabulary (
	vocabularyId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	description varchar(75) null,
	folksonomy boolean
);

create table TasksProposal (
	proposalId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK varchar(75) null,
	name varchar(75) null,
	description varchar null,
	publishDate timestamp null,
	dueDate timestamp null
);

create table TasksReview (
	reviewId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	proposalId bigint,
	assignedByUserId bigint,
	assignedByUserName varchar(75) null,
	stage int,
	completed boolean,
	rejected boolean
);

create table User_ (
	uuid_ varchar(75) null,
	userId bigint not null primary key,
	companyId bigint,
	createDate timestamp null,
	modifiedDate timestamp null,
	defaultUser boolean,
	contactId bigint,
	password_ varchar(75) null,
	passwordEncrypted boolean,
	passwordReset boolean,
	passwordModifiedDate timestamp null,
	reminderQueryQuestion varchar(75) null,
	reminderQueryAnswer varchar(75) null,
	graceLoginCount int,
	screenName varchar(75) null,
	emailAddress varchar(75) null,
	openId varchar(1024) null,
	portraitId bigint,
	languageId varchar(75) null,
	timeZoneId varchar(75) null,
	greeting varchar(255) null,
	comments varchar null,
	firstName varchar(75) null,
	middleName varchar(75) null,
	lastName varchar(75) null,
	jobTitle varchar(75) null,
	loginDate timestamp null,
	loginIP varchar(75) null,
	lastLoginDate timestamp null,
	lastLoginIP varchar(75) null,
	lastFailedLoginDate timestamp null,
	failedLoginAttempts int,
	lockout boolean,
	lockoutDate timestamp null,
	agreedToTermsOfUse boolean,
	active_ boolean
);

create table UserGroup (
	userGroupId bigint not null primary key,
	companyId bigint,
	parentUserGroupId bigint,
	name varchar(75) null,
	description varchar null
);

create table UserGroupRole (
	userId bigint not null,
	groupId bigint not null,
	roleId bigint not null,
	primary key (userId, groupId, roleId)
);

create table UserIdMapper (
	userIdMapperId bigint not null primary key,
	userId bigint,
	type_ varchar(75) null,
	description varchar(75) null,
	externalUserId varchar(75) null
);

create table Users_Groups (
	userId bigint not null,
	groupId bigint not null,
	primary key (userId, groupId)
);

create table Users_Orgs (
	userId bigint not null,
	organizationId bigint not null,
	primary key (userId, organizationId)
);

create table Users_Permissions (
	userId bigint not null,
	permissionId bigint not null,
	primary key (userId, permissionId)
);

create table Users_Roles (
	userId bigint not null,
	roleId bigint not null,
	primary key (userId, roleId)
);

create table Users_UserGroups (
	userGroupId bigint not null,
	userId bigint not null,
	primary key (userGroupId, userId)
);

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

create table UserTrackerPath (
	userTrackerPathId bigint not null primary key,
	userTrackerId bigint,
	path_ varchar null,
	pathDate timestamp null
);

create table Vocabulary (
	vocabularyId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	description varchar(75) null,
	folksonomy boolean
);

create table WebDAVProps (
	webDavPropsId bigint not null primary key,
	companyId bigint,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	props varchar null
);

create table Website (
	websiteId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	url varchar null,
	typeId int,
	primary_ boolean
);

create table WikiNode (
	uuid_ varchar(75) null,
	nodeId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	description varchar null,
	lastPostDate timestamp null
);

create table WikiPage (
	uuid_ varchar(75) null,
	pageId bigint not null primary key,
	resourcePrimKey bigint,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	nodeId bigint,
	title varchar(255) null,
	version float,
	minorEdit boolean,
	content varchar null,
	summary varchar null,
	format varchar(75) null,
	head boolean,
	parentTitle varchar(75) null,
	redirectTitle varchar(75) null
);

create table WikiPageResource (
	resourcePrimKey bigint not null primary key,
	nodeId bigint,
	title varchar(75) null
);



insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (1, 'Canada', 'CA', 'CAN', '124', '001', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (2, 'China', 'CN', 'CHN', '156', '086', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (3, 'France', 'FR', 'FRA', '250', '033', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (4, 'Germany', 'DE', 'DEU', '276', '049', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (5, 'Hong Kong', 'HK', 'HKG', '344', '852', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (6, 'Hungary', 'HU', 'HUN', '348', '036', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (7, 'Israel', 'IL', 'ISR', '376', '972', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (8, 'Italy', 'IT', 'ITA', '380', '039', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (9, 'Japan', 'JP', 'JPN', '392', '081', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (10, 'South Korea', 'KR', 'KOR', '410', '082', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (11, 'Netherlands', 'NL', 'NLD', '528', '031', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (12, 'Portugal', 'PT', 'PRT', '620', '351', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (13, 'Russia', 'RU', 'RUS', '643', '007', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (14, 'Singapore', 'SG', 'SGP', '702', '065', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (15, 'Spain', 'ES', 'ESP', '724', '034', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (16, 'Turkey', 'TR', 'TUR', '792', '090', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (17, 'Vietnam', 'VM', 'VNM', '704', '084', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (18, 'United Kingdom', 'GB', 'GBR', '826', '044', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (19, 'United States', 'US', 'USA', '840', '001', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (20, 'Afghanistan', 'AF', 'AFG', '4', '093', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (21, 'Albania', 'AL', 'ALB', '8', '355', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (22, 'Algeria', 'DZ', 'DZA', '12', '213', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (23, 'American Samoa', 'AS', 'ASM', '16', '684', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (24, 'Andorra', 'AD', 'AND', '20', '376', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (25, 'Angola', 'AO', 'AGO', '24', '244', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (26, 'Anguilla', 'AI', 'AIA', '660', '264', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (27, 'Antarctica', 'AQ', 'ATA', '10', '672', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (28, 'Antigua', 'AG', 'ATG', '28', '268', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (29, 'Argentina', 'AR', 'ARG', '32', '054', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (30, 'Armenia', 'AM', 'ARM', '51', '374', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (31, 'Aruba', 'AW', 'ABW', '533', '297', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (32, 'Australia', 'AU', 'AUS', '36', '061', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (33, 'Austria', 'AT', 'AUT', '40', '043', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (34, 'Azerbaijan', 'AZ', 'AZE', '31', '994', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (35, 'Bahamas', 'BS', 'BHS', '44', '242', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (36, 'Bahrain', 'BH', 'BHR', '48', '973', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (37, 'Bangladesh', 'BD', 'BGD', '50', '880', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (38, 'Barbados', 'BB', 'BRB', '52', '246', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (39, 'Belarus', 'BY', 'BLR', '112', '375', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (40, 'Belgium', 'BE', 'BEL', '56', '032', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (41, 'Belize', 'BZ', 'BLZ', '84', '501', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (42, 'Benin', 'BJ', 'BEN', '204', '229', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (43, 'Bermuda', 'BM', 'BMU', '60', '441', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (44, 'Bhutan', 'BT', 'BTN', '64', '975', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (45, 'Bolivia', 'BO', 'BOL', '68', '591', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (46, 'Bosnia-Herzegovina', 'BA', 'BIH', '70', '387', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (47, 'Botswana', 'BW', 'BWA', '72', '267', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (48, 'Brazil', 'BR', 'BRA', '76', '055', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (49, 'British Virgin Islands', 'VG', 'VGB', '92', '284', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (50, 'Brunei', 'BN', 'BRN', '96', '673', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (51, 'Bulgaria', 'BG', 'BGR', '100', '359', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (52, 'Burkina Faso', 'BF', 'BFA', '854', '226', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (53, 'Burma (Myanmar)', 'MM', 'MMR', '104', '095', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (54, 'Burundi', 'BI', 'BDI', '108', '257', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (55, 'Cambodia', 'KH', 'KHM', '116', '855', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (56, 'Cameroon', 'CM', 'CMR', '120', '237', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (57, 'Cape Verde Island', 'CV', 'CPV', '132', '238', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (58, 'Cayman Islands', 'KY', 'CYM', '136', '345', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (59, 'Central African Republic', 'CF', 'CAF', '140', '236', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (60, 'Chad', 'TD', 'TCD', '148', '235', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (61, 'Chile', 'CL', 'CHL', '152', '056', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (62, 'Christmas Island', 'CX', 'CXR', '162', '061', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (63, 'Cocos Islands', 'CC', 'CCK', '166', '061', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (64, 'Colombia', 'CO', 'COL', '170', '057', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (65, 'Comoros', 'KM', 'COM', '174', '269', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (66, 'Republic of Congo', 'CD', 'COD', '180', '242', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (67, 'Democratic Republic of Congo', 'CG', 'COG', '178', '243', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (68, 'Cook Islands', 'CK', 'COK', '184', '682', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (69, 'Costa Rica', 'CR', 'CRI', '188', '506', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (70, 'Croatia', 'HR', 'HRV', '191', '385', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (71, 'Cuba', 'CU', 'CUB', '192', '053', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (72, 'Cyprus', 'CY', 'CYP', '196', '357', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (73, 'Czech Republic', 'CZ', 'CZE', '203', '420', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (74, 'Denmark', 'DK', 'DNK', '208', '045', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (75, 'Djibouti', 'DJ', 'DJI', '262', '253', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (76, 'Dominica', 'DM', 'DMA', '212', '767', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (77, 'Dominican Republic', 'DO', 'DOM', '214', '809', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (78, 'Ecuador', 'EC', 'ECU', '218', '593', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (79, 'Egypt', 'EG', 'EGY', '818', '020', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (80, 'El Salvador', 'SV', 'SLV', '222', '503', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (81, 'Equatorial Guinea', 'GQ', 'GNQ', '226', '240', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (82, 'Eritrea', 'ER', 'ERI', '232', '291', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (83, 'Estonia', 'EE', 'EST', '233', '372', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (84, 'Ethiopia', 'ET', 'ETH', '231', '251', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (85, 'Faeroe Islands', 'FO', 'FRO', '234', '298', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (86, 'Falkland Islands', 'FK', 'FLK', '238', '500', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (87, 'Fiji Islands', 'FJ', 'FJI', '242', '679', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (88, 'Finland', 'FI', 'FIN', '246', '358', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (89, 'French Guiana', 'GF', 'GUF', '254', '594', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (90, 'French Polynesia', 'PF', 'PYF', '258', '689', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (91, 'Gabon', 'GA', 'GAB', '266', '241', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (92, 'Gambia', 'GM', 'GMB', '270', '220', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (93, 'Georgia', 'GE', 'GEO', '268', '995', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (94, 'Ghana', 'GH', 'GHA', '288', '233', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (95, 'Gibraltar', 'GI', 'GIB', '292', '350', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (96, 'Greece', 'GR', 'GRC', '300', '030', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (97, 'Greenland', 'GL', 'GRL', '304', '299', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (98, 'Grenada', 'GD', 'GRD', '308', '473', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (99, 'Guadeloupe', 'GP', 'GLP', '312', '590', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (100, 'Guam', 'GU', 'GUM', '316', '671', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (101, 'Guatemala', 'GT', 'GTM', '320', '502', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (102, 'Guinea', 'GN', 'GIN', '324', '224', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (103, 'Guinea-Bissau', 'GW', 'GNB', '624', '245', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (104, 'Guyana', 'GY', 'GUY', '328', '592', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (105, 'Haiti', 'HT', 'HTI', '332', '509', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (106, 'Honduras', 'HN', 'HND', '340', '504', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (107, 'Iceland', 'IS', 'ISL', '352', '354', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (108, 'India', 'IN', 'IND', '356', '091', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (109, 'Indonesia', 'ID', 'IDN', '360', '062', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (110, 'Iran', 'IR', 'IRN', '364', '098', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (111, 'Iraq', 'IQ', 'IRQ', '368', '964', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (112, 'Ireland', 'IE', 'IRL', '372', '353', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (113, 'Ivory Coast', 'CI', 'CIV', '384', '225', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (114, 'Jamaica', 'JM', 'JAM', '388', '876', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (115, 'Jordan', 'JO', 'JOR', '400', '962', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (116, 'Kazakhstan', 'KZ', 'KAZ', '398', '007', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (117, 'Kenya', 'KE', 'KEN', '404', '254', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (118, 'Kiribati', 'KI', 'KIR', '408', '686', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (119, 'Kuwait', 'KW', 'KWT', '414', '965', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (120, 'North Korea', 'KP', 'PRK', '408', '850', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (121, 'Kyrgyzstan', 'KG', 'KGZ', '471', '996', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (122, 'Laos', 'LA', 'LAO', '418', '856', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (123, 'Latvia', 'LV', 'LVA', '428', '371', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (124, 'Lebanon', 'LB', 'LBN', '422', '961', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (125, 'Lesotho', 'LS', 'LSO', '426', '266', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (126, 'Liberia', 'LR', 'LBR', '430', '231', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (127, 'Libya', 'LY', 'LBY', '434', '218', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (128, 'Liechtenstein', 'LI', 'LIE', '438', '423', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (129, 'Lithuania', 'LT', 'LTU', '440', '370', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (130, 'Luxembourg', 'LU', 'LUX', '442', '352', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (131, 'Macau', 'MO', 'MAC', '446', '853', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (132, 'Macedonia', 'MK', 'MKD', '807', '389', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (133, 'Madagascar', 'MG', 'MDG', '450', '261', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (134, 'Malawi', 'MW', 'MWI', '454', '265', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (135, 'Malaysia', 'MY', 'MYS', '458', '060', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (136, 'Maldives', 'MV', 'MDV', '462', '960', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (137, 'Mali', 'ML', 'MLI', '466', '223', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (138, 'Malta', 'MT', 'MLT', '470', '356', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (139, 'Marshall Islands', 'MH', 'MHL', '584', '692', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (140, 'Martinique', 'MQ', 'MTQ', '474', '596', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (141, 'Mauritania', 'MR', 'MRT', '478', '222', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (142, 'Mauritius', 'MU', 'MUS', '480', '230', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (143, 'Mayotte Island', 'YT', 'MYT', '175', '269', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (144, 'Mexico', 'MX', 'MEX', '484', '052', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (145, 'Micronesia', 'FM', 'FSM', '583', '691', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (146, 'Moldova', 'MD', 'MDA', '498', '373', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (147, 'Monaco', 'MC', 'MCO', '492', '377', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (148, 'Mongolia', 'MN', 'MNG', '496', '976', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (149, 'Montenegro', 'ME', 'MNE', '499', '382', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (150, 'Montserrat', 'MS', 'MSR', '500', '664', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (151, 'Morocco', 'MA', 'MAR', '504', '212', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (152, 'Mozambique', 'MZ', 'MOZ', '508', '258', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (153, 'Namibia', 'NA', 'NAM', '516', '264', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (154, 'Nauru', 'NR', 'NRU', '520', '674', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (155, 'Nepal', 'NP', 'NPL', '524', '977', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (156, 'Netherlands Antilles', 'AN', 'ANT', '530', '599', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (157, 'New Caledonia', 'NC', 'NCL', '540', '687', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (158, 'New Zealand', 'NZ', 'NZL', '554', '064', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (159, 'Nicaragua', 'NI', 'NIC', '558', '505', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (160, 'Niger', 'NE', 'NER', '562', '227', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (161, 'Nigeria', 'NG', 'NGA', '566', '234', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (162, 'Niue', 'NU', 'NIU', '570', '683', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (163, 'Norfolk Island', 'NF', 'NFK', '574', '672', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (164, 'Norway', 'NO', 'NOR', '578', '047', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (165, 'Oman', 'OM', 'OMN', '512', '968', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (166, 'Pakistan', 'PK', 'PAK', '586', '092', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (167, 'Palau', 'PW', 'PLW', '585', '680', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (168, 'Palestine', 'PS', 'PSE', '275', '970', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (169, 'Panama', 'PA', 'PAN', '591', '507', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (170, 'Papua New Guinea', 'PG', 'PNG', '598', '675', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (171, 'Paraguay', 'PY', 'PRY', '600', '595', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (172, 'Peru', 'PE', 'PER', '604', '051', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (173, 'Philippines', 'PH', 'PHL', '608', '063', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (174, 'Poland', 'PL', 'POL', '616', '048', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (175, 'Puerto Rico', 'PR', 'PRI', '630', '787', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (176, 'Qatar', 'QA', 'QAT', '634', '974', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (177, 'Reunion Island', 'RE', 'REU', '638', '262', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (178, 'Romania', 'RO', 'ROU', '642', '040', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (179, 'Rwanda', 'RW', 'RWA', '646', '250', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (180, 'St. Helena', 'SH', 'SHN', '654', '290', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (181, 'St. Kitts', 'KN', 'KNA', '659', '869', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (182, 'St. Lucia', 'LC', 'LCA', '662', '758', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (183, 'St. Pierre & Miquelon', 'PM', 'SPM', '666', '508', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (184, 'St. Vincent', 'VC', 'VCT', '670', '784', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (185, 'San Marino', 'SM', 'SMR', '674', '378', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (186, 'Sao Tome & Principe', 'ST', 'STP', '678', '239', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (187, 'Saudi Arabia', 'SA', 'SAU', '682', '966', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (188, 'Senegal', 'SN', 'SEN', '686', '221', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (189, 'Serbia', 'RS', 'SRB', '688', '381', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (190, 'Seychelles', 'SC', 'SYC', '690', '248', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (191, 'Sierra Leone', 'SL', 'SLE', '694', '249', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (192, 'Slovakia', 'SK', 'SVK', '703', '421', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (193, 'Slovenia', 'SI', 'SVN', '705', '386', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (194, 'Solomon Islands', 'SB', 'SLB', '90', '677', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (195, 'Somalia', 'SO', 'SOM', '706', '252', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (196, 'South Africa', 'ZA', 'ZAF', '710', '027', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (197, 'Sri Lanka', 'LK', 'LKA', '144', '094', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (198, 'Sudan', 'SD', 'SDN', '736', '095', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (199, 'Suriname', 'SR', 'SUR', '740', '597', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (200, 'Swaziland', 'SZ', 'SWZ', '748', '268', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (201, 'Sweden', 'SE', 'SWE', '752', '046', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (202, 'Switzerland', 'CH', 'CHE', '756', '041', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (203, 'Syria', 'SY', 'SYR', '760', '963', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (204, 'Taiwan', 'TW', 'TWN', '158', '886', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (205, 'Tajikistan', 'TJ', 'TJK', '762', '992', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (206, 'Tanzania', 'TZ', 'TZA', '834', '255', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (207, 'Thailand', 'TH', 'THA', '764', '066', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (208, 'Togo', 'TG', 'TGO', '768', '228', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (209, 'Tonga', 'TO', 'TON', '776', '676', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (210, 'Trinidad & Tobago', 'TT', 'TTO', '780', '868', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (211, 'Tunisia', 'TN', 'TUN', '788', '216', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (212, 'Turkmenistan', 'TM', 'TKM', '795', '993', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (213, 'Turks & Caicos', 'TC', 'TCA', '796', '649', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (214, 'Tuvalu', 'TV', 'TUV', '798', '688', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (215, 'Uganda', 'UG', 'UGA', '800', '256', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (216, 'Ukraine', 'UA', 'UKR', '804', '380', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (217, 'United Arab Emirates', 'AE', 'ARE', '784', '971', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (218, 'Uruguay', 'UY', 'URY', '858', '598', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (219, 'Uzbekistan', 'UZ', 'UZB', '860', '998', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (220, 'Vanuatu', 'VU', 'VUT', '548', '678', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (221, 'Vatican City', 'VA', 'VAT', '336', '039', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (222, 'Venezuela', 'VE', 'VEN', '862', '058', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (223, 'Wallis & Futuna', 'WF', 'WLF', '876', '681', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (224, 'Western Samoa', 'EH', 'ESH', '732', '685', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (225, 'Yemen', 'YE', 'YEM', '887', '967', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (226, 'Zambia', 'ZM', 'ZMB', '894', '260', TRUE);
insert into Country (countryId, name, a2, a3, number_, idd_, active_) values (227, 'Zimbabwe', 'ZW', 'ZWE', '716', '263', TRUE);

insert into Region (regionId, countryId, regionCode, name, active_) values (1001, 1, 'AB', 'Alberta', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (1002, 1, 'BC', 'British Columbia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (1003, 1, 'MB', 'Manitoba', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (1004, 1, 'NB', 'New Brunswick', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (1005, 1, 'NL', 'Newfoundland and Labrador', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (1006, 1, 'NT', 'Northwest Territories', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (1007, 1, 'NS', 'Nova Scotia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (1008, 1, 'NU', 'Nunavut', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (1009, 1, 'ON', 'Ontario', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (1010, 1, 'PE', 'Prince Edward Island', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (1011, 1, 'QC', 'Quebec', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (1012, 1, 'SK', 'Saskatchewan', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (1013, 1, 'YT', 'Yukon', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3001, 3, 'A', 'Alsace', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3002, 3, 'B', 'Aquitaine', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3003, 3, 'C', 'Auvergne', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3004, 3, 'P', 'Basse-Normandie', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3005, 3, 'D', 'Bourgogne', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3006, 3, 'E', 'Bretagne', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3007, 3, 'F', 'Centre', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3008, 3, 'G', 'Champagne-Ardenne', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3009, 3, 'H', 'Corse', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3010, 3, 'GF', 'Guyane', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3011, 3, 'I', 'Franche Comté', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3012, 3, 'GP', 'Guadeloupe', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3013, 3, 'Q', 'Haute-Normandie', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3014, 3, 'J', 'Île-de-France', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3015, 3, 'K', 'Languedoc-Roussillon', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3016, 3, 'L', 'Limousin', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3017, 3, 'M', 'Lorraine', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3018, 3, 'MQ', 'Martinique', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3019, 3, 'N', 'Midi-Pyrénées', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3020, 3, 'O', 'Nord Pas de Calais', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3021, 3, 'R', 'Pays de la Loire', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3022, 3, 'S', 'Picardie', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3023, 3, 'T', 'Poitou-Charentes', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3024, 3, 'U', 'Provence-Alpes-Côte-d\'Azur', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3025, 3, 'RE', 'Réunion', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (3026, 3, 'V', 'Rhône-Alpes', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4001, 4, 'BW', 'Baden-Württemberg', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4002, 4, 'BY', 'Bayern', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4003, 4, 'BE', 'Berlin', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4004, 4, 'BR', 'Brandenburg', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4005, 4, 'HB', 'Bremen', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4006, 4, 'HH', 'Hamburg', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4007, 4, 'HE', 'Hessen', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4008, 4, 'MV', 'Mecklenburg-Vorpommern', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4009, 4, 'NI', 'Niedersachsen', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4010, 4, 'NW', 'Nordrhein-Westfalen', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4011, 4, 'RP', 'Rheinland-Pfalz', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4012, 4, 'SL', 'Saarland', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4013, 4, 'SN', 'Sachsen', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4014, 4, 'ST', 'Sachsen-Anhalt', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4015, 4, 'SH', 'Schleswig-Holstein', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (4016, 4, 'TH', 'Thüringen', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8001, 8, 'AG', 'Agrigento', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8002, 8, 'AL', 'Alessandria', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8003, 8, 'AN', 'Ancona', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8004, 8, 'AO', 'Aosta', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8005, 8, 'AR', 'Arezzo', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8006, 8, 'AP', 'Ascoli Piceno', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8007, 8, 'AT', 'Asti', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8008, 8, 'AV', 'Avellino', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8009, 8, 'BA', 'Bari', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8010, 8, 'BT', 'Barletta-Andria-Trani', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8011, 8, 'BL', 'Belluno', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8012, 8, 'BN', 'Benevento', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8013, 8, 'BG', 'Bergamo', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8014, 8, 'BI', 'Biella', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8015, 8, 'BO', 'Bologna', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8016, 8, 'BZ', 'Bolzano', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8017, 8, 'BS', 'Brescia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8018, 8, 'BR', 'Brindisi', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8019, 8, 'CA', 'Cagliari', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8020, 8, 'CL', 'Caltanissetta', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8021, 8, 'CB', 'Campobasso', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8022, 8, 'CI', 'Carbonia-Iglesias', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8023, 8, 'CE', 'Caserta', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8024, 8, 'CT', 'Catania', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8025, 8, 'CZ', 'Catanzaro', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8026, 8, 'CH', 'Chieti', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8027, 8, 'CO', 'Como', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8028, 8, 'CS', 'Cosenza', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8029, 8, 'CR', 'Cremona', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8030, 8, 'KR', 'Crotone', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8031, 8, 'CN', 'Cuneo', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8032, 8, 'EN', 'Enna', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8033, 8, 'FM', 'Fermo', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8034, 8, 'FE', 'Ferrara', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8035, 8, 'FI', 'Firenze', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8036, 8, 'FG', 'Foggia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8037, 8, 'FC', 'Forli-Cesena', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8038, 8, 'FR', 'Frosinone', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8039, 8, 'GE', 'Genova', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8040, 8, 'GO', 'Gorizia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8041, 8, 'GR', 'Grosseto', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8042, 8, 'IM', 'Imperia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8043, 8, 'IS', 'Isernia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8044, 8, 'AQ', 'L''Aquila', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8045, 8, 'SP', 'La Spezia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8046, 8, 'LT', 'Latina', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8047, 8, 'LE', 'Lecce', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8048, 8, 'LC', 'Lecco', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8049, 8, 'LI', 'Livorno', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8050, 8, 'LO', 'Lodi', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8051, 8, 'LU', 'Lucca', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8052, 8, 'MC', 'Macerata', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8053, 8, 'MN', 'Mantova', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8054, 8, 'MS', 'Massa-Carrara', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8055, 8, 'MT', 'Matera', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8056, 8, 'MA', 'Medio Campidano', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8057, 8, 'ME', 'Messina', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8058, 8, 'MI', 'Milano', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8059, 8, 'MO', 'Modena', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8060, 8, 'MZ', 'Monza', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8061, 8, 'NA', 'Napoli', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8062, 8, 'NO', 'Novara', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8063, 8, 'NU', 'Nuoro', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8064, 8, 'OG', 'Ogliastra', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8065, 8, 'OT', 'Olbia-Tempio', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8066, 8, 'OR', 'Oristano', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8067, 8, 'PD', 'Padova', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8068, 8, 'PA', 'Palermo', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8069, 8, 'PR', 'Parma', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8070, 8, 'PV', 'Pavia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8071, 8, 'PG', 'Perugia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8072, 8, 'PU', 'Pesaro e Urbino', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8073, 8, 'PE', 'Pescara', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8074, 8, 'PC', 'Piacenza', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8075, 8, 'PI', 'Pisa', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8076, 8, 'PT', 'Pistoia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8077, 8, 'PN', 'Pordenone', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8078, 8, 'PZ', 'Potenza', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8079, 8, 'PO', 'Prato', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8080, 8, 'RG', 'Ragusa', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8081, 8, 'RA', 'Ravenna', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8082, 8, 'RC', 'Reggio Calabria', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8083, 8, 'RE', 'Reggio Emilia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8084, 8, 'RI', 'Rieti', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8085, 8, 'RN', 'Rimini', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8086, 8, 'RM', 'Roma', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8087, 8, 'RO', 'Rovigo', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8088, 8, 'SA', 'Salerno', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8089, 8, 'SS', 'Sassari', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8090, 8, 'SV', 'Savona', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8091, 8, 'SI', 'Siena', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8092, 8, 'SR', 'Siracusa', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8093, 8, 'SO', 'Sondrio', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8094, 8, 'TA', 'Taranto', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8095, 8, 'TE', 'Teramo', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8096, 8, 'TR', 'Terni', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8097, 8, 'TO', 'Torino', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8098, 8, 'TP', 'Trapani', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8099, 8, 'TN', 'Trento', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8100, 8, 'TV', 'Treviso', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8101, 8, 'TS', 'Trieste', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8102, 8, 'UD', 'Udine', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8103, 8, 'VA', 'Varese', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8104, 8, 'VE', 'Venezia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8105, 8, 'VB', 'Verbano-Cusio-Ossola', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8106, 8, 'VC', 'Vercelli', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8107, 8, 'VR', 'Verona', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8108, 8, 'VV', 'Vibo Valentia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8109, 8, 'VI', 'Vicenza', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (8110, 8, 'VT', 'Viterbo', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15001, 15, 'AN', 'Andalusia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15002, 15, 'AR', 'Aragon', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15003, 15, 'AS', 'Asturias', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15004, 15, 'IB', 'Balearic Islands', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15005, 15, 'PV', 'Basque Country', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15006, 15, 'CN', 'Canary Islands', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15007, 15, 'CB', 'Cantabria', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15008, 15, 'CL', 'Castile and Leon', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15009, 15, 'CM', 'Castile-La Mancha', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15010, 15, 'CT', 'Catalonia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15011, 15, 'CE', 'Ceuta', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15012, 15, 'EX', 'Extremadura', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15013, 15, 'GA', 'Galicia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15014, 15, 'LO', 'La Rioja', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15015, 15, 'M', 'Madrid', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15016, 15, 'ML', 'Melilla', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15017, 15, 'MU', 'Murcia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15018, 15, 'NA', 'Navarra', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (15019, 15, 'VC', 'Valencia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19001, 19, 'AL', 'Alabama', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19002, 19, 'AK', 'Alaska', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19003, 19, 'AZ', 'Arizona', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19004, 19, 'AR', 'Arkansas', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19005, 19, 'CA', 'California', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19006, 19, 'CO', 'Colorado', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19007, 19, 'CT', 'Connecticut', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19008, 19, 'DC', 'District of Columbia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19009, 19, 'DE', 'Delaware', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19010, 19, 'FL', 'Florida', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19011, 19, 'GA', 'Georgia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19012, 19, 'HI', 'Hawaii', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19013, 19, 'ID', 'Idaho', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19014, 19, 'IL', 'Illinois', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19015, 19, 'IN', 'Indiana', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19016, 19, 'IA', 'Iowa', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19017, 19, 'KS', 'Kansas', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19018, 19, 'KY', 'Kentucky ', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19019, 19, 'LA', 'Louisiana ', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19020, 19, 'ME', 'Maine', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19021, 19, 'MD', 'Maryland', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19022, 19, 'MA', 'Massachusetts', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19023, 19, 'MI', 'Michigan', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19024, 19, 'MN', 'Minnesota', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19025, 19, 'MS', 'Mississippi', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19026, 19, 'MO', 'Missouri', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19027, 19, 'MT', 'Montana', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19028, 19, 'NE', 'Nebraska', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19029, 19, 'NV', 'Nevada', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19030, 19, 'NH', 'New Hampshire', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19031, 19, 'NJ', 'New Jersey', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19032, 19, 'NM', 'New Mexico', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19033, 19, 'NY', 'New York', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19034, 19, 'NC', 'North Carolina', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19035, 19, 'ND', 'North Dakota', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19036, 19, 'OH', 'Ohio', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19037, 19, 'OK', 'Oklahoma ', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19038, 19, 'OR', 'Oregon', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19039, 19, 'PA', 'Pennsylvania', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19040, 19, 'PR', 'Puerto Rico', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19041, 19, 'RI', 'Rhode Island', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19042, 19, 'SC', 'South Carolina', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19043, 19, 'SD', 'South Dakota', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19044, 19, 'TN', 'Tennessee', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19045, 19, 'TX', 'Texas', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19046, 19, 'UT', 'Utah', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19047, 19, 'VT', 'Vermont', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19048, 19, 'VA', 'Virginia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19049, 19, 'WA', 'Washington', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19050, 19, 'WV', 'West Virginia', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19051, 19, 'WI', 'Wisconsin', TRUE);
insert into Region (regionId, countryId, regionCode, name, active_) values (19052, 19, 'WY', 'Wyoming', TRUE);

##
## List types for accounts
##

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

##
## List types for contacts
##

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

##
## List types for organizations
##

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
insert into Account_ (accountId, companyId, userId, userName, createDate, modifiedDate, parentAccountId, name, legalName, legalId, legalType, sicCode, tickerSymbol, industry, type_, size_) values (7, 1, 5, '', timestamp, timestamp, 0, 'Liferay', 'Liferay, Inc.', '', '', '', '', '', '', '');


insert into ClassName_ (classNameId, value) values (8, 'com.liferay.portal.model.Group');
insert into ClassName_ (classNameId, value) values (9, 'com.liferay.portal.model.Organization');
insert into ClassName_ (classNameId, value) values (10, 'com.liferay.portal.model.Role');
insert into ClassName_ (classNameId, value) values (11, 'com.liferay.portal.model.User');


insert into Role_ (roleId, companyId, classNameId, classPK, name, description, type_) values (12, 1, 10, 12, 'Administrator', '', 1);
insert into Role_ (roleId, companyId, classNameId, classPK, name, description, type_) values (13, 1, 10, 13, 'Guest', '', 1);
insert into Role_ (roleId, companyId, classNameId, classPK, name, description, type_) values (14, 1, 10, 14, 'Power User', '', 1);
insert into Role_ (roleId, companyId, classNameId, classPK, name, description, type_) values (15, 1, 10, 15, 'User', '', 1);


insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (16, 1, 5, 8, 16, 0, 0, 'Guest', '/guest', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (17, 1, 16, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (18, 1, 16, FALSE, FALSE, 'classic', '01', 0);


insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (19, 1, 0, 'Liferay, Inc.', 'regular-organization', TRUE, 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (20, 1, 5, 9, 19, 0, 0, '20', '/20', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (21, 1, 20, TRUE, FALSE, 'classic', '01', 1);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (22, 1, 20, FALSE, FALSE, 'classic', '01', 1);
insert into Layout (plid, groupId, companyId, privateLayout, layoutId, parentLayoutId, name, type_, typeSettings, hidden_, friendlyURL, priority) values (23, 20, 1, FALSE, 1, 0, '<?xml version="1.0"?>\n\n<root>\n  <name>Liferay, Inc. Extranet</name>\n</root>', 'portlet', 'layout-template-id=2_columns_ii\ncolumn-1=3,\ncolumn-2=19,', FALSE, '/1', 0);
insert into Layout (plid, groupId, companyId, privateLayout, layoutId, parentLayoutId, name, type_, typeSettings, hidden_, friendlyURL, priority) values (24, 20, 1, TRUE, 1, 0, '<?xml version="1.0"?>\n\n<root>\n  <name>Liferay, Inc. Intranet</name>\n</root>', 'portlet', 'layout-template-id=2_columns_ii\ncolumn-1=3,\ncolumn-2=19,', FALSE, '/1', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (25, 1, 19, 'Liferay Engineering', 'regular-organization', TRUE, 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (26, 1, 5, 9, 25, 0, 0, '26', '/26', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (27, 1, 26, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (28, 1, 26, FALSE, FALSE, 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (29, 1, 19, 'Liferay Consulting', 'regular-organization', TRUE, 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (30, 1, 5, 9, 29, 0, 0, '30', '/30', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (31, 1, 30, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (32, 1, 30, FALSE, FALSE, 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (33, 1, 19, 'Liferay Support', 'regular-organization', TRUE, 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (34, 1, 5, 9, 33, 0, 0, '34', '/34', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (35, 1, 34, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (36, 1, 34, FALSE, FALSE, 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (37, 1, 19, 'Liferay Sales', 'regular-organization', TRUE, 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (38, 1, 5, 9, 37, 0, 0, '38', '/38', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (39, 1, 38, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (40, 1, 38, FALSE, FALSE, 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (41, 1, 19, 'Liferay Marketing', 'regular-organization', TRUE, 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (42, 1, 5, 9, 41, 0, 0, '42', '/42', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (43, 1, 42, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (44, 1, 42, FALSE, FALSE, 'classic', '01', 0);


insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (45, 1, 19, 'Liferay Los Angeles', 'location', FALSE, 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (46, 1, 5, 9, 45, 0, 0, '46', '/46', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (47, 1, 46, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (48, 1, 46, FALSE, FALSE, 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (49, 1, 19, 'Liferay San Francisco', 'location', FALSE, 5, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (50, 1, 5, 9, 49, 0, 0, '50', '/50', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (51, 1, 50, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (52, 1, 50, FALSE, FALSE, 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (53, 1, 19, 'Liferay Chicago', 'location', FALSE, 14, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (54, 1, 5, 9, 53, 0, 0, '54', '/54', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (55, 1, 54, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (56, 1, 54, FALSE, FALSE, 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (57, 1, 19, 'Liferay New York', 'location', FALSE, 33, 19, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (58, 1, 5, 9, 57, 0, 0, '58', '/58', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (59, 1, 58, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (60, 1, 58, FALSE, FALSE, 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (61, 1, 19, 'Liferay Sao Paulo', 'location', FALSE, 0, 48, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (62, 1, 5, 9, 61, 0, 0, '62', '/62', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (63, 1, 62, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (64, 1, 62, FALSE, FALSE, 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (65, 1, 19, 'Liferay Frankfurt', 'location', FALSE, 0, 4, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (66, 1, 5, 9, 65, 0, 0, '66', '/66', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (67, 1, 66, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (68, 1, 66, FALSE, FALSE, 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (69, 1, 19, 'Liferay Madrid', 'location', FALSE, 0, 15, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (70, 1, 5, 9, 69, 0, 0, '70', '/70', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (71, 1, 70, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (72, 1, 70, FALSE, FALSE, 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (73, 1, 19, 'Liferay Dalian', 'location', FALSE, 0, 2, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (74, 1, 5, 9, 73, 0, 0, '74', '/74', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (75, 1, 74, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (76, 1, 74, FALSE, FALSE, 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (77, 1, 19, 'Liferay Hong Kong', 'location', FALSE, 0, 2, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (78, 1, 5, 9, 77, 0, 0, '78', '/78', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (79, 1, 78, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (80, 1, 78, FALSE, FALSE, 'classic', '01', 0);

insert into Organization_ (organizationId, companyId, parentOrganizationId, name, type_, recursable, regionId, countryId, statusId, comments) values (81, 1, 19, 'Liferay Kuala Lumpur', 'location', FALSE, 0, 135, 12017, '');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (82, 1, 5, 9, 81, 0, 0, '82', '/82', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (83, 1, 82, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (84, 1, 82, FALSE, FALSE, 'classic', '01', 0);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (5, 1, timestamp, timestamp, TRUE, 6, 'password', FALSE, FALSE, '5', 'default@liferay.com', 'Welcome!', '', '', '', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (6, 1, 5, '', timestamp, timestamp, 7, 0, '', '', '', TRUE, '1970-01-01 00:00:00.000000');

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (2, 1, timestamp, timestamp, FALSE, 3, 'test', FALSE, FALSE, 'joebloggs', 'test@liferay.com', 'Welcome Joe Bloggs!', 'Joe', '', 'Bloggs', timestamp, 0, FALSE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (3, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Joe', '', 'Bloggs', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (85, 1, 2, 11, 2, 0, 0, '85', '/85', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (86, 1, 85, TRUE, FALSE, 'classic', '01', 2);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (87, 1, 85, FALSE, FALSE, 'classic', '01', 0);
insert into Layout (plid, groupId, companyId, privateLayout, layoutId, parentLayoutId, name, type_, typeSettings, hidden_, friendlyURL, priority) values (88, 85, 1, TRUE, 1, 0, '<?xml version="1.0"?>\n\n<root>\n  <name>Home</name>\n</root>', 'portlet', 'column-1=71_INSTANCE_OY0d,82,23,61,\ncolumn-2=9,79,29,8,19,\nlayout-template-id=2_columns_ii\n', FALSE, '/home', 0);
insert into Layout (plid, groupId, companyId, privateLayout, layoutId, parentLayoutId, name, type_, typeSettings, hidden_, friendlyURL, priority) values (89, 85, 1, TRUE, 2, 0, '<?xml version="1.0"?>\n\n<root>\n  <name>Plugins</name>\n</root>', 'portlet', 'column-1=\ncolumn-2=111,\nlayout-template-id=2_columns_ii\n', FALSE, '/plugins', 1);

insert into Users_Groups values (2, 16);

insert into Users_Orgs (userId, organizationId) values (2, 19);
insert into Users_Orgs (userId, organizationId) values (2, 45);

insert into Users_Roles values (2, 12);
insert into Users_Roles values (2, 14);
insert into Users_Roles values (2, 15);


insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (90, 1, timestamp, timestamp, FALSE, 91, 'test', FALSE, FALSE, 'lax1', 'test.lax.1@liferay.com', 'Welcome Test LAX 1!', 'Test', '', 'LAX 1', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (91, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 1', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (92, 1, 90, 11, 90, 0, 0, '92', '/92', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (93, 1, 92, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (94, 1, 92, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (90, 16);

insert into Users_Orgs (userId, organizationId) values (90, 19);
insert into Users_Orgs (userId, organizationId) values (90, 45);

insert into Users_Roles values (90, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (95, 1, timestamp, timestamp, FALSE, 96, 'test', FALSE, FALSE, 'lax2', 'test.lax.2@liferay.com', 'Welcome Test LAX 2!', 'Test', '', 'LAX 2', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (96, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 2', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (97, 1, 95, 11, 95, 0, 0, '97', '/97', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (98, 1, 97, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (99, 1, 97, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (95, 16);

insert into Users_Orgs (userId, organizationId) values (95, 19);
insert into Users_Orgs (userId, organizationId) values (95, 45);

insert into Users_Roles values (95, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (100, 1, timestamp, timestamp, FALSE, 101, 'test', FALSE, FALSE, 'lax3', 'test.lax.3@liferay.com', 'Welcome Test LAX 3!', 'Test', '', 'LAX 3', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (101, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 3', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (102, 1, 100, 11, 100, 0, 0, '102', '/102', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (103, 1, 102, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (104, 1, 102, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (100, 16);

insert into Users_Orgs (userId, organizationId) values (100, 19);
insert into Users_Orgs (userId, organizationId) values (100, 45);

insert into Users_Roles values (100, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (105, 1, timestamp, timestamp, FALSE, 106, 'test', FALSE, FALSE, 'lax4', 'test.lax.4@liferay.com', 'Welcome Test LAX 4!', 'Test', '', 'LAX 4', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (106, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 4', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (107, 1, 105, 11, 105, 0, 0, '107', '/107', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (108, 1, 107, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (109, 1, 107, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (105, 16);

insert into Users_Orgs (userId, organizationId) values (105, 19);
insert into Users_Orgs (userId, organizationId) values (105, 45);

insert into Users_Roles values (105, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (110, 1, timestamp, timestamp, FALSE, 111, 'test', FALSE, FALSE, 'lax5', 'test.lax.5@liferay.com', 'Welcome Test LAX 5!', 'Test', '', 'LAX 5', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (111, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 5', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (112, 1, 110, 11, 110, 0, 0, '112', '/112', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (113, 1, 112, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (114, 1, 112, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (110, 16);

insert into Users_Orgs (userId, organizationId) values (110, 19);
insert into Users_Orgs (userId, organizationId) values (110, 45);

insert into Users_Roles values (110, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (115, 1, timestamp, timestamp, FALSE, 116, 'test', FALSE, FALSE, 'lax6', 'test.lax.6@liferay.com', 'Welcome Test LAX 6!', 'Test', '', 'LAX 6', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (116, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 6', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (117, 1, 115, 11, 115, 0, 0, '117', '/117', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (118, 1, 117, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (119, 1, 117, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (115, 16);

insert into Users_Orgs (userId, organizationId) values (115, 19);
insert into Users_Orgs (userId, organizationId) values (115, 45);

insert into Users_Roles values (115, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (120, 1, timestamp, timestamp, FALSE, 121, 'test', FALSE, FALSE, 'lax7', 'test.lax.7@liferay.com', 'Welcome Test LAX 7!', 'Test', '', 'LAX 7', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (121, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 7', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (122, 1, 120, 11, 120, 0, 0, '122', '/122', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (123, 1, 122, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (124, 1, 122, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (120, 16);

insert into Users_Orgs (userId, organizationId) values (120, 19);
insert into Users_Orgs (userId, organizationId) values (120, 45);

insert into Users_Roles values (120, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (125, 1, timestamp, timestamp, FALSE, 126, 'test', FALSE, FALSE, 'lax8', 'test.lax.8@liferay.com', 'Welcome Test LAX 8!', 'Test', '', 'LAX 8', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (126, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 8', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (127, 1, 125, 11, 125, 0, 0, '127', '/127', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (128, 1, 127, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (129, 1, 127, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (125, 16);

insert into Users_Orgs (userId, organizationId) values (125, 19);
insert into Users_Orgs (userId, organizationId) values (125, 45);

insert into Users_Roles values (125, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (130, 1, timestamp, timestamp, FALSE, 131, 'test', FALSE, FALSE, 'lax9', 'test.lax.9@liferay.com', 'Welcome Test LAX 9!', 'Test', '', 'LAX 9', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (131, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 9', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (132, 1, 130, 11, 130, 0, 0, '132', '/132', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (133, 1, 132, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (134, 1, 132, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (130, 16);

insert into Users_Orgs (userId, organizationId) values (130, 19);
insert into Users_Orgs (userId, organizationId) values (130, 45);

insert into Users_Roles values (130, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (135, 1, timestamp, timestamp, FALSE, 136, 'test', FALSE, FALSE, 'lax10', 'test.lax.10@liferay.com', 'Welcome Test LAX 10!', 'Test', '', 'LAX 10', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (136, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 10', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (137, 1, 135, 11, 135, 0, 0, '137', '/137', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (138, 1, 137, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (139, 1, 137, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (135, 16);

insert into Users_Orgs (userId, organizationId) values (135, 19);
insert into Users_Orgs (userId, organizationId) values (135, 45);

insert into Users_Roles values (135, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (140, 1, timestamp, timestamp, FALSE, 141, 'test', FALSE, FALSE, 'lax11', 'test.lax.11@liferay.com', 'Welcome Test LAX 11!', 'Test', '', 'LAX 11', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (141, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 11', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (142, 1, 140, 11, 140, 0, 0, '142', '/142', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (143, 1, 142, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (144, 1, 142, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (140, 16);

insert into Users_Orgs (userId, organizationId) values (140, 19);
insert into Users_Orgs (userId, organizationId) values (140, 45);

insert into Users_Roles values (140, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (145, 1, timestamp, timestamp, FALSE, 146, 'test', FALSE, FALSE, 'lax12', 'test.lax.12@liferay.com', 'Welcome Test LAX 12!', 'Test', '', 'LAX 12', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (146, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 12', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (147, 1, 145, 11, 145, 0, 0, '147', '/147', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (148, 1, 147, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (149, 1, 147, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (145, 16);

insert into Users_Orgs (userId, organizationId) values (145, 19);
insert into Users_Orgs (userId, organizationId) values (145, 45);

insert into Users_Roles values (145, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (150, 1, timestamp, timestamp, FALSE, 151, 'test', FALSE, FALSE, 'lax13', 'test.lax.13@liferay.com', 'Welcome Test LAX 13!', 'Test', '', 'LAX 13', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (151, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 13', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (152, 1, 150, 11, 150, 0, 0, '152', '/152', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (153, 1, 152, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (154, 1, 152, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (150, 16);

insert into Users_Orgs (userId, organizationId) values (150, 19);
insert into Users_Orgs (userId, organizationId) values (150, 45);

insert into Users_Roles values (150, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (155, 1, timestamp, timestamp, FALSE, 156, 'test', FALSE, FALSE, 'lax14', 'test.lax.14@liferay.com', 'Welcome Test LAX 14!', 'Test', '', 'LAX 14', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (156, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 14', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (157, 1, 155, 11, 155, 0, 0, '157', '/157', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (158, 1, 157, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (159, 1, 157, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (155, 16);

insert into Users_Orgs (userId, organizationId) values (155, 19);
insert into Users_Orgs (userId, organizationId) values (155, 45);

insert into Users_Roles values (155, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (160, 1, timestamp, timestamp, FALSE, 161, 'test', FALSE, FALSE, 'lax15', 'test.lax.15@liferay.com', 'Welcome Test LAX 15!', 'Test', '', 'LAX 15', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (161, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 15', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (162, 1, 160, 11, 160, 0, 0, '162', '/162', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (163, 1, 162, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (164, 1, 162, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (160, 16);

insert into Users_Orgs (userId, organizationId) values (160, 19);
insert into Users_Orgs (userId, organizationId) values (160, 45);

insert into Users_Roles values (160, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (165, 1, timestamp, timestamp, FALSE, 166, 'test', FALSE, FALSE, 'lax16', 'test.lax.16@liferay.com', 'Welcome Test LAX 16!', 'Test', '', 'LAX 16', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (166, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 16', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (167, 1, 165, 11, 165, 0, 0, '167', '/167', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (168, 1, 167, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (169, 1, 167, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (165, 16);

insert into Users_Orgs (userId, organizationId) values (165, 19);
insert into Users_Orgs (userId, organizationId) values (165, 45);

insert into Users_Roles values (165, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (170, 1, timestamp, timestamp, FALSE, 171, 'test', FALSE, FALSE, 'lax17', 'test.lax.17@liferay.com', 'Welcome Test LAX 17!', 'Test', '', 'LAX 17', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (171, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 17', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (172, 1, 170, 11, 170, 0, 0, '172', '/172', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (173, 1, 172, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (174, 1, 172, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (170, 16);

insert into Users_Orgs (userId, organizationId) values (170, 19);
insert into Users_Orgs (userId, organizationId) values (170, 45);

insert into Users_Roles values (170, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (175, 1, timestamp, timestamp, FALSE, 176, 'test', FALSE, FALSE, 'lax18', 'test.lax.18@liferay.com', 'Welcome Test LAX 18!', 'Test', '', 'LAX 18', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (176, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 18', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (177, 1, 175, 11, 175, 0, 0, '177', '/177', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (178, 1, 177, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (179, 1, 177, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (175, 16);

insert into Users_Orgs (userId, organizationId) values (175, 19);
insert into Users_Orgs (userId, organizationId) values (175, 45);

insert into Users_Roles values (175, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (180, 1, timestamp, timestamp, FALSE, 181, 'test', FALSE, FALSE, 'lax19', 'test.lax.19@liferay.com', 'Welcome Test LAX 19!', 'Test', '', 'LAX 19', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (181, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 19', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (182, 1, 180, 11, 180, 0, 0, '182', '/182', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (183, 1, 182, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (184, 1, 182, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (180, 16);

insert into Users_Orgs (userId, organizationId) values (180, 19);
insert into Users_Orgs (userId, organizationId) values (180, 45);

insert into Users_Roles values (180, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (185, 1, timestamp, timestamp, FALSE, 186, 'test', FALSE, FALSE, 'lax20', 'test.lax.20@liferay.com', 'Welcome Test LAX 20!', 'Test', '', 'LAX 20', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (186, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 20', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (187, 1, 185, 11, 185, 0, 0, '187', '/187', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (188, 1, 187, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (189, 1, 187, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (185, 16);

insert into Users_Orgs (userId, organizationId) values (185, 19);
insert into Users_Orgs (userId, organizationId) values (185, 45);

insert into Users_Roles values (185, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (190, 1, timestamp, timestamp, FALSE, 191, 'test', FALSE, FALSE, 'lax21', 'test.lax.21@liferay.com', 'Welcome Test LAX 21!', 'Test', '', 'LAX 21', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (191, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 21', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (192, 1, 190, 11, 190, 0, 0, '192', '/192', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (193, 1, 192, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (194, 1, 192, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (190, 16);

insert into Users_Orgs (userId, organizationId) values (190, 19);
insert into Users_Orgs (userId, organizationId) values (190, 45);

insert into Users_Roles values (190, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (195, 1, timestamp, timestamp, FALSE, 196, 'test', FALSE, FALSE, 'lax22', 'test.lax.22@liferay.com', 'Welcome Test LAX 22!', 'Test', '', 'LAX 22', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (196, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 22', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (197, 1, 195, 11, 195, 0, 0, '197', '/197', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (198, 1, 197, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (199, 1, 197, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (195, 16);

insert into Users_Orgs (userId, organizationId) values (195, 19);
insert into Users_Orgs (userId, organizationId) values (195, 45);

insert into Users_Roles values (195, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (200, 1, timestamp, timestamp, FALSE, 201, 'test', FALSE, FALSE, 'lax23', 'test.lax.23@liferay.com', 'Welcome Test LAX 23!', 'Test', '', 'LAX 23', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (201, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 23', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (202, 1, 200, 11, 200, 0, 0, '202', '/202', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (203, 1, 202, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (204, 1, 202, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (200, 16);

insert into Users_Orgs (userId, organizationId) values (200, 19);
insert into Users_Orgs (userId, organizationId) values (200, 45);

insert into Users_Roles values (200, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (205, 1, timestamp, timestamp, FALSE, 206, 'test', FALSE, FALSE, 'lax24', 'test.lax.24@liferay.com', 'Welcome Test LAX 24!', 'Test', '', 'LAX 24', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (206, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 24', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (207, 1, 205, 11, 205, 0, 0, '207', '/207', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (208, 1, 207, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (209, 1, 207, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (205, 16);

insert into Users_Orgs (userId, organizationId) values (205, 19);
insert into Users_Orgs (userId, organizationId) values (205, 45);

insert into Users_Roles values (205, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (210, 1, timestamp, timestamp, FALSE, 211, 'test', FALSE, FALSE, 'lax25', 'test.lax.25@liferay.com', 'Welcome Test LAX 25!', 'Test', '', 'LAX 25', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (211, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 25', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (212, 1, 210, 11, 210, 0, 0, '212', '/212', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (213, 1, 212, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (214, 1, 212, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (210, 16);

insert into Users_Orgs (userId, organizationId) values (210, 19);
insert into Users_Orgs (userId, organizationId) values (210, 45);

insert into Users_Roles values (210, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (215, 1, timestamp, timestamp, FALSE, 216, 'test', FALSE, FALSE, 'lax26', 'test.lax.26@liferay.com', 'Welcome Test LAX 26!', 'Test', '', 'LAX 26', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (216, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 26', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (217, 1, 215, 11, 215, 0, 0, '217', '/217', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (218, 1, 217, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (219, 1, 217, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (215, 16);

insert into Users_Orgs (userId, organizationId) values (215, 19);
insert into Users_Orgs (userId, organizationId) values (215, 45);

insert into Users_Roles values (215, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (220, 1, timestamp, timestamp, FALSE, 221, 'test', FALSE, FALSE, 'lax27', 'test.lax.27@liferay.com', 'Welcome Test LAX 27!', 'Test', '', 'LAX 27', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (221, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 27', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (222, 1, 220, 11, 220, 0, 0, '222', '/222', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (223, 1, 222, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (224, 1, 222, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (220, 16);

insert into Users_Orgs (userId, organizationId) values (220, 19);
insert into Users_Orgs (userId, organizationId) values (220, 45);

insert into Users_Roles values (220, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (225, 1, timestamp, timestamp, FALSE, 226, 'test', FALSE, FALSE, 'lax28', 'test.lax.28@liferay.com', 'Welcome Test LAX 28!', 'Test', '', 'LAX 28', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (226, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 28', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (227, 1, 225, 11, 225, 0, 0, '227', '/227', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (228, 1, 227, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (229, 1, 227, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (225, 16);

insert into Users_Orgs (userId, organizationId) values (225, 19);
insert into Users_Orgs (userId, organizationId) values (225, 45);

insert into Users_Roles values (225, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (230, 1, timestamp, timestamp, FALSE, 231, 'test', FALSE, FALSE, 'lax29', 'test.lax.29@liferay.com', 'Welcome Test LAX 29!', 'Test', '', 'LAX 29', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (231, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 29', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (232, 1, 230, 11, 230, 0, 0, '232', '/232', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (233, 1, 232, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (234, 1, 232, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (230, 16);

insert into Users_Orgs (userId, organizationId) values (230, 19);
insert into Users_Orgs (userId, organizationId) values (230, 45);

insert into Users_Roles values (230, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (235, 1, timestamp, timestamp, FALSE, 236, 'test', FALSE, FALSE, 'lax30', 'test.lax.30@liferay.com', 'Welcome Test LAX 30!', 'Test', '', 'LAX 30', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (236, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 30', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (237, 1, 235, 11, 235, 0, 0, '237', '/237', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (238, 1, 237, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (239, 1, 237, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (235, 16);

insert into Users_Orgs (userId, organizationId) values (235, 19);
insert into Users_Orgs (userId, organizationId) values (235, 45);

insert into Users_Roles values (235, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (240, 1, timestamp, timestamp, FALSE, 241, 'test', FALSE, FALSE, 'lax31', 'test.lax.31@liferay.com', 'Welcome Test LAX 31!', 'Test', '', 'LAX 31', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (241, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 31', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (242, 1, 240, 11, 240, 0, 0, '242', '/242', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (243, 1, 242, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (244, 1, 242, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (240, 16);

insert into Users_Orgs (userId, organizationId) values (240, 19);
insert into Users_Orgs (userId, organizationId) values (240, 45);

insert into Users_Roles values (240, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (245, 1, timestamp, timestamp, FALSE, 246, 'test', FALSE, FALSE, 'lax32', 'test.lax.32@liferay.com', 'Welcome Test LAX 32!', 'Test', '', 'LAX 32', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (246, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 32', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (247, 1, 245, 11, 245, 0, 0, '247', '/247', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (248, 1, 247, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (249, 1, 247, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (245, 16);

insert into Users_Orgs (userId, organizationId) values (245, 19);
insert into Users_Orgs (userId, organizationId) values (245, 45);

insert into Users_Roles values (245, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (250, 1, timestamp, timestamp, FALSE, 251, 'test', FALSE, FALSE, 'lax33', 'test.lax.33@liferay.com', 'Welcome Test LAX 33!', 'Test', '', 'LAX 33', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (251, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 33', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (252, 1, 250, 11, 250, 0, 0, '252', '/252', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (253, 1, 252, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (254, 1, 252, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (250, 16);

insert into Users_Orgs (userId, organizationId) values (250, 19);
insert into Users_Orgs (userId, organizationId) values (250, 45);

insert into Users_Roles values (250, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (255, 1, timestamp, timestamp, FALSE, 256, 'test', FALSE, FALSE, 'lax34', 'test.lax.34@liferay.com', 'Welcome Test LAX 34!', 'Test', '', 'LAX 34', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (256, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 34', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (257, 1, 255, 11, 255, 0, 0, '257', '/257', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (258, 1, 257, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (259, 1, 257, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (255, 16);

insert into Users_Orgs (userId, organizationId) values (255, 19);
insert into Users_Orgs (userId, organizationId) values (255, 45);

insert into Users_Roles values (255, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (260, 1, timestamp, timestamp, FALSE, 261, 'test', FALSE, FALSE, 'lax35', 'test.lax.35@liferay.com', 'Welcome Test LAX 35!', 'Test', '', 'LAX 35', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (261, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 35', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (262, 1, 260, 11, 260, 0, 0, '262', '/262', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (263, 1, 262, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (264, 1, 262, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (260, 16);

insert into Users_Orgs (userId, organizationId) values (260, 19);
insert into Users_Orgs (userId, organizationId) values (260, 45);

insert into Users_Roles values (260, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (265, 1, timestamp, timestamp, FALSE, 266, 'test', FALSE, FALSE, 'lax36', 'test.lax.36@liferay.com', 'Welcome Test LAX 36!', 'Test', '', 'LAX 36', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (266, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 36', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (267, 1, 265, 11, 265, 0, 0, '267', '/267', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (268, 1, 267, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (269, 1, 267, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (265, 16);

insert into Users_Orgs (userId, organizationId) values (265, 19);
insert into Users_Orgs (userId, organizationId) values (265, 45);

insert into Users_Roles values (265, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (270, 1, timestamp, timestamp, FALSE, 271, 'test', FALSE, FALSE, 'lax37', 'test.lax.37@liferay.com', 'Welcome Test LAX 37!', 'Test', '', 'LAX 37', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (271, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 37', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (272, 1, 270, 11, 270, 0, 0, '272', '/272', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (273, 1, 272, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (274, 1, 272, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (270, 16);

insert into Users_Orgs (userId, organizationId) values (270, 19);
insert into Users_Orgs (userId, organizationId) values (270, 45);

insert into Users_Roles values (270, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (275, 1, timestamp, timestamp, FALSE, 276, 'test', FALSE, FALSE, 'lax38', 'test.lax.38@liferay.com', 'Welcome Test LAX 38!', 'Test', '', 'LAX 38', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (276, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 38', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (277, 1, 275, 11, 275, 0, 0, '277', '/277', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (278, 1, 277, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (279, 1, 277, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (275, 16);

insert into Users_Orgs (userId, organizationId) values (275, 19);
insert into Users_Orgs (userId, organizationId) values (275, 45);

insert into Users_Roles values (275, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (280, 1, timestamp, timestamp, FALSE, 281, 'test', FALSE, FALSE, 'lax39', 'test.lax.39@liferay.com', 'Welcome Test LAX 39!', 'Test', '', 'LAX 39', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (281, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 39', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (282, 1, 280, 11, 280, 0, 0, '282', '/282', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (283, 1, 282, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (284, 1, 282, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (280, 16);

insert into Users_Orgs (userId, organizationId) values (280, 19);
insert into Users_Orgs (userId, organizationId) values (280, 45);

insert into Users_Roles values (280, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (285, 1, timestamp, timestamp, FALSE, 286, 'test', FALSE, FALSE, 'lax40', 'test.lax.40@liferay.com', 'Welcome Test LAX 40!', 'Test', '', 'LAX 40', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (286, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 40', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (287, 1, 285, 11, 285, 0, 0, '287', '/287', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (288, 1, 287, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (289, 1, 287, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (285, 16);

insert into Users_Orgs (userId, organizationId) values (285, 19);
insert into Users_Orgs (userId, organizationId) values (285, 45);

insert into Users_Roles values (285, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (290, 1, timestamp, timestamp, FALSE, 291, 'test', FALSE, FALSE, 'lax41', 'test.lax.41@liferay.com', 'Welcome Test LAX 41!', 'Test', '', 'LAX 41', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (291, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 41', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (292, 1, 290, 11, 290, 0, 0, '292', '/292', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (293, 1, 292, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (294, 1, 292, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (290, 16);

insert into Users_Orgs (userId, organizationId) values (290, 19);
insert into Users_Orgs (userId, organizationId) values (290, 45);

insert into Users_Roles values (290, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (295, 1, timestamp, timestamp, FALSE, 296, 'test', FALSE, FALSE, 'lax42', 'test.lax.42@liferay.com', 'Welcome Test LAX 42!', 'Test', '', 'LAX 42', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (296, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 42', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (297, 1, 295, 11, 295, 0, 0, '297', '/297', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (298, 1, 297, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (299, 1, 297, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (295, 16);

insert into Users_Orgs (userId, organizationId) values (295, 19);
insert into Users_Orgs (userId, organizationId) values (295, 45);

insert into Users_Roles values (295, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (300, 1, timestamp, timestamp, FALSE, 301, 'test', FALSE, FALSE, 'lax43', 'test.lax.43@liferay.com', 'Welcome Test LAX 43!', 'Test', '', 'LAX 43', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (301, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 43', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (302, 1, 300, 11, 300, 0, 0, '302', '/302', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (303, 1, 302, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (304, 1, 302, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (300, 16);

insert into Users_Orgs (userId, organizationId) values (300, 19);
insert into Users_Orgs (userId, organizationId) values (300, 45);

insert into Users_Roles values (300, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (305, 1, timestamp, timestamp, FALSE, 306, 'test', FALSE, FALSE, 'lax44', 'test.lax.44@liferay.com', 'Welcome Test LAX 44!', 'Test', '', 'LAX 44', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (306, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 44', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (307, 1, 305, 11, 305, 0, 0, '307', '/307', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (308, 1, 307, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (309, 1, 307, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (305, 16);

insert into Users_Orgs (userId, organizationId) values (305, 19);
insert into Users_Orgs (userId, organizationId) values (305, 45);

insert into Users_Roles values (305, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (310, 1, timestamp, timestamp, FALSE, 311, 'test', FALSE, FALSE, 'lax45', 'test.lax.45@liferay.com', 'Welcome Test LAX 45!', 'Test', '', 'LAX 45', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (311, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 45', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (312, 1, 310, 11, 310, 0, 0, '312', '/312', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (313, 1, 312, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (314, 1, 312, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (310, 16);

insert into Users_Orgs (userId, organizationId) values (310, 19);
insert into Users_Orgs (userId, organizationId) values (310, 45);

insert into Users_Roles values (310, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (315, 1, timestamp, timestamp, FALSE, 316, 'test', FALSE, FALSE, 'lax46', 'test.lax.46@liferay.com', 'Welcome Test LAX 46!', 'Test', '', 'LAX 46', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (316, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 46', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (317, 1, 315, 11, 315, 0, 0, '317', '/317', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (318, 1, 317, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (319, 1, 317, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (315, 16);

insert into Users_Orgs (userId, organizationId) values (315, 19);
insert into Users_Orgs (userId, organizationId) values (315, 45);

insert into Users_Roles values (315, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (320, 1, timestamp, timestamp, FALSE, 321, 'test', FALSE, FALSE, 'lax47', 'test.lax.47@liferay.com', 'Welcome Test LAX 47!', 'Test', '', 'LAX 47', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (321, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 47', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (322, 1, 320, 11, 320, 0, 0, '322', '/322', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (323, 1, 322, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (324, 1, 322, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (320, 16);

insert into Users_Orgs (userId, organizationId) values (320, 19);
insert into Users_Orgs (userId, organizationId) values (320, 45);

insert into Users_Roles values (320, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (325, 1, timestamp, timestamp, FALSE, 326, 'test', FALSE, FALSE, 'lax48', 'test.lax.48@liferay.com', 'Welcome Test LAX 48!', 'Test', '', 'LAX 48', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (326, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 48', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (327, 1, 325, 11, 325, 0, 0, '327', '/327', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (328, 1, 327, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (329, 1, 327, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (325, 16);

insert into Users_Orgs (userId, organizationId) values (325, 19);
insert into Users_Orgs (userId, organizationId) values (325, 45);

insert into Users_Roles values (325, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (330, 1, timestamp, timestamp, FALSE, 331, 'test', FALSE, FALSE, 'lax49', 'test.lax.49@liferay.com', 'Welcome Test LAX 49!', 'Test', '', 'LAX 49', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (331, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 49', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (332, 1, 330, 11, 330, 0, 0, '332', '/332', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (333, 1, 332, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (334, 1, 332, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (330, 16);

insert into Users_Orgs (userId, organizationId) values (330, 19);
insert into Users_Orgs (userId, organizationId) values (330, 45);

insert into Users_Roles values (330, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (335, 1, timestamp, timestamp, FALSE, 336, 'test', FALSE, FALSE, 'lax50', 'test.lax.50@liferay.com', 'Welcome Test LAX 50!', 'Test', '', 'LAX 50', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (336, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 50', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (337, 1, 335, 11, 335, 0, 0, '337', '/337', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (338, 1, 337, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (339, 1, 337, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (335, 16);

insert into Users_Orgs (userId, organizationId) values (335, 19);
insert into Users_Orgs (userId, organizationId) values (335, 45);

insert into Users_Roles values (335, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (340, 1, timestamp, timestamp, FALSE, 341, 'test', FALSE, FALSE, 'lax51', 'test.lax.51@liferay.com', 'Welcome Test LAX 51!', 'Test', '', 'LAX 51', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (341, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 51', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (342, 1, 340, 11, 340, 0, 0, '342', '/342', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (343, 1, 342, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (344, 1, 342, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (340, 16);

insert into Users_Orgs (userId, organizationId) values (340, 19);
insert into Users_Orgs (userId, organizationId) values (340, 45);

insert into Users_Roles values (340, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (345, 1, timestamp, timestamp, FALSE, 346, 'test', FALSE, FALSE, 'lax52', 'test.lax.52@liferay.com', 'Welcome Test LAX 52!', 'Test', '', 'LAX 52', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (346, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 52', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (347, 1, 345, 11, 345, 0, 0, '347', '/347', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (348, 1, 347, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (349, 1, 347, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (345, 16);

insert into Users_Orgs (userId, organizationId) values (345, 19);
insert into Users_Orgs (userId, organizationId) values (345, 45);

insert into Users_Roles values (345, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (350, 1, timestamp, timestamp, FALSE, 351, 'test', FALSE, FALSE, 'lax53', 'test.lax.53@liferay.com', 'Welcome Test LAX 53!', 'Test', '', 'LAX 53', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (351, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 53', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (352, 1, 350, 11, 350, 0, 0, '352', '/352', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (353, 1, 352, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (354, 1, 352, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (350, 16);

insert into Users_Orgs (userId, organizationId) values (350, 19);
insert into Users_Orgs (userId, organizationId) values (350, 45);

insert into Users_Roles values (350, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (355, 1, timestamp, timestamp, FALSE, 356, 'test', FALSE, FALSE, 'lax54', 'test.lax.54@liferay.com', 'Welcome Test LAX 54!', 'Test', '', 'LAX 54', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (356, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 54', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (357, 1, 355, 11, 355, 0, 0, '357', '/357', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (358, 1, 357, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (359, 1, 357, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (355, 16);

insert into Users_Orgs (userId, organizationId) values (355, 19);
insert into Users_Orgs (userId, organizationId) values (355, 45);

insert into Users_Roles values (355, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (360, 1, timestamp, timestamp, FALSE, 361, 'test', FALSE, FALSE, 'lax55', 'test.lax.55@liferay.com', 'Welcome Test LAX 55!', 'Test', '', 'LAX 55', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (361, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 55', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (362, 1, 360, 11, 360, 0, 0, '362', '/362', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (363, 1, 362, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (364, 1, 362, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (360, 16);

insert into Users_Orgs (userId, organizationId) values (360, 19);
insert into Users_Orgs (userId, organizationId) values (360, 45);

insert into Users_Roles values (360, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (365, 1, timestamp, timestamp, FALSE, 366, 'test', FALSE, FALSE, 'lax56', 'test.lax.56@liferay.com', 'Welcome Test LAX 56!', 'Test', '', 'LAX 56', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (366, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 56', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (367, 1, 365, 11, 365, 0, 0, '367', '/367', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (368, 1, 367, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (369, 1, 367, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (365, 16);

insert into Users_Orgs (userId, organizationId) values (365, 19);
insert into Users_Orgs (userId, organizationId) values (365, 45);

insert into Users_Roles values (365, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (370, 1, timestamp, timestamp, FALSE, 371, 'test', FALSE, FALSE, 'lax57', 'test.lax.57@liferay.com', 'Welcome Test LAX 57!', 'Test', '', 'LAX 57', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (371, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 57', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (372, 1, 370, 11, 370, 0, 0, '372', '/372', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (373, 1, 372, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (374, 1, 372, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (370, 16);

insert into Users_Orgs (userId, organizationId) values (370, 19);
insert into Users_Orgs (userId, organizationId) values (370, 45);

insert into Users_Roles values (370, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (375, 1, timestamp, timestamp, FALSE, 376, 'test', FALSE, FALSE, 'lax58', 'test.lax.58@liferay.com', 'Welcome Test LAX 58!', 'Test', '', 'LAX 58', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (376, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 58', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (377, 1, 375, 11, 375, 0, 0, '377', '/377', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (378, 1, 377, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (379, 1, 377, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (375, 16);

insert into Users_Orgs (userId, organizationId) values (375, 19);
insert into Users_Orgs (userId, organizationId) values (375, 45);

insert into Users_Roles values (375, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (380, 1, timestamp, timestamp, FALSE, 381, 'test', FALSE, FALSE, 'lax59', 'test.lax.59@liferay.com', 'Welcome Test LAX 59!', 'Test', '', 'LAX 59', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (381, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 59', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (382, 1, 380, 11, 380, 0, 0, '382', '/382', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (383, 1, 382, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (384, 1, 382, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (380, 16);

insert into Users_Orgs (userId, organizationId) values (380, 19);
insert into Users_Orgs (userId, organizationId) values (380, 45);

insert into Users_Roles values (380, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (385, 1, timestamp, timestamp, FALSE, 386, 'test', FALSE, FALSE, 'lax60', 'test.lax.60@liferay.com', 'Welcome Test LAX 60!', 'Test', '', 'LAX 60', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (386, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 60', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (387, 1, 385, 11, 385, 0, 0, '387', '/387', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (388, 1, 387, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (389, 1, 387, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (385, 16);

insert into Users_Orgs (userId, organizationId) values (385, 19);
insert into Users_Orgs (userId, organizationId) values (385, 45);

insert into Users_Roles values (385, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (390, 1, timestamp, timestamp, FALSE, 391, 'test', FALSE, FALSE, 'lax61', 'test.lax.61@liferay.com', 'Welcome Test LAX 61!', 'Test', '', 'LAX 61', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (391, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 61', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (392, 1, 390, 11, 390, 0, 0, '392', '/392', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (393, 1, 392, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (394, 1, 392, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (390, 16);

insert into Users_Orgs (userId, organizationId) values (390, 19);
insert into Users_Orgs (userId, organizationId) values (390, 45);

insert into Users_Roles values (390, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (395, 1, timestamp, timestamp, FALSE, 396, 'test', FALSE, FALSE, 'lax62', 'test.lax.62@liferay.com', 'Welcome Test LAX 62!', 'Test', '', 'LAX 62', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (396, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 62', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (397, 1, 395, 11, 395, 0, 0, '397', '/397', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (398, 1, 397, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (399, 1, 397, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (395, 16);

insert into Users_Orgs (userId, organizationId) values (395, 19);
insert into Users_Orgs (userId, organizationId) values (395, 45);

insert into Users_Roles values (395, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (400, 1, timestamp, timestamp, FALSE, 401, 'test', FALSE, FALSE, 'lax63', 'test.lax.63@liferay.com', 'Welcome Test LAX 63!', 'Test', '', 'LAX 63', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (401, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 63', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (402, 1, 400, 11, 400, 0, 0, '402', '/402', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (403, 1, 402, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (404, 1, 402, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (400, 16);

insert into Users_Orgs (userId, organizationId) values (400, 19);
insert into Users_Orgs (userId, organizationId) values (400, 45);

insert into Users_Roles values (400, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (405, 1, timestamp, timestamp, FALSE, 406, 'test', FALSE, FALSE, 'lax64', 'test.lax.64@liferay.com', 'Welcome Test LAX 64!', 'Test', '', 'LAX 64', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (406, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 64', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (407, 1, 405, 11, 405, 0, 0, '407', '/407', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (408, 1, 407, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (409, 1, 407, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (405, 16);

insert into Users_Orgs (userId, organizationId) values (405, 19);
insert into Users_Orgs (userId, organizationId) values (405, 45);

insert into Users_Roles values (405, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (410, 1, timestamp, timestamp, FALSE, 411, 'test', FALSE, FALSE, 'lax65', 'test.lax.65@liferay.com', 'Welcome Test LAX 65!', 'Test', '', 'LAX 65', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (411, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 65', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (412, 1, 410, 11, 410, 0, 0, '412', '/412', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (413, 1, 412, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (414, 1, 412, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (410, 16);

insert into Users_Orgs (userId, organizationId) values (410, 19);
insert into Users_Orgs (userId, organizationId) values (410, 45);

insert into Users_Roles values (410, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (415, 1, timestamp, timestamp, FALSE, 416, 'test', FALSE, FALSE, 'lax66', 'test.lax.66@liferay.com', 'Welcome Test LAX 66!', 'Test', '', 'LAX 66', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (416, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 66', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (417, 1, 415, 11, 415, 0, 0, '417', '/417', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (418, 1, 417, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (419, 1, 417, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (415, 16);

insert into Users_Orgs (userId, organizationId) values (415, 19);
insert into Users_Orgs (userId, organizationId) values (415, 45);

insert into Users_Roles values (415, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (420, 1, timestamp, timestamp, FALSE, 421, 'test', FALSE, FALSE, 'lax67', 'test.lax.67@liferay.com', 'Welcome Test LAX 67!', 'Test', '', 'LAX 67', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (421, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 67', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (422, 1, 420, 11, 420, 0, 0, '422', '/422', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (423, 1, 422, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (424, 1, 422, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (420, 16);

insert into Users_Orgs (userId, organizationId) values (420, 19);
insert into Users_Orgs (userId, organizationId) values (420, 45);

insert into Users_Roles values (420, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (425, 1, timestamp, timestamp, FALSE, 426, 'test', FALSE, FALSE, 'lax68', 'test.lax.68@liferay.com', 'Welcome Test LAX 68!', 'Test', '', 'LAX 68', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (426, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 68', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (427, 1, 425, 11, 425, 0, 0, '427', '/427', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (428, 1, 427, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (429, 1, 427, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (425, 16);

insert into Users_Orgs (userId, organizationId) values (425, 19);
insert into Users_Orgs (userId, organizationId) values (425, 45);

insert into Users_Roles values (425, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (430, 1, timestamp, timestamp, FALSE, 431, 'test', FALSE, FALSE, 'lax69', 'test.lax.69@liferay.com', 'Welcome Test LAX 69!', 'Test', '', 'LAX 69', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (431, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 69', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (432, 1, 430, 11, 430, 0, 0, '432', '/432', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (433, 1, 432, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (434, 1, 432, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (430, 16);

insert into Users_Orgs (userId, organizationId) values (430, 19);
insert into Users_Orgs (userId, organizationId) values (430, 45);

insert into Users_Roles values (430, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (435, 1, timestamp, timestamp, FALSE, 436, 'test', FALSE, FALSE, 'lax70', 'test.lax.70@liferay.com', 'Welcome Test LAX 70!', 'Test', '', 'LAX 70', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (436, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 70', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (437, 1, 435, 11, 435, 0, 0, '437', '/437', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (438, 1, 437, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (439, 1, 437, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (435, 16);

insert into Users_Orgs (userId, organizationId) values (435, 19);
insert into Users_Orgs (userId, organizationId) values (435, 45);

insert into Users_Roles values (435, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (440, 1, timestamp, timestamp, FALSE, 441, 'test', FALSE, FALSE, 'lax71', 'test.lax.71@liferay.com', 'Welcome Test LAX 71!', 'Test', '', 'LAX 71', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (441, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 71', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (442, 1, 440, 11, 440, 0, 0, '442', '/442', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (443, 1, 442, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (444, 1, 442, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (440, 16);

insert into Users_Orgs (userId, organizationId) values (440, 19);
insert into Users_Orgs (userId, organizationId) values (440, 45);

insert into Users_Roles values (440, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (445, 1, timestamp, timestamp, FALSE, 446, 'test', FALSE, FALSE, 'lax72', 'test.lax.72@liferay.com', 'Welcome Test LAX 72!', 'Test', '', 'LAX 72', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (446, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 72', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (447, 1, 445, 11, 445, 0, 0, '447', '/447', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (448, 1, 447, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (449, 1, 447, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (445, 16);

insert into Users_Orgs (userId, organizationId) values (445, 19);
insert into Users_Orgs (userId, organizationId) values (445, 45);

insert into Users_Roles values (445, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (450, 1, timestamp, timestamp, FALSE, 451, 'test', FALSE, FALSE, 'lax73', 'test.lax.73@liferay.com', 'Welcome Test LAX 73!', 'Test', '', 'LAX 73', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (451, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 73', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (452, 1, 450, 11, 450, 0, 0, '452', '/452', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (453, 1, 452, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (454, 1, 452, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (450, 16);

insert into Users_Orgs (userId, organizationId) values (450, 19);
insert into Users_Orgs (userId, organizationId) values (450, 45);

insert into Users_Roles values (450, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (455, 1, timestamp, timestamp, FALSE, 456, 'test', FALSE, FALSE, 'lax74', 'test.lax.74@liferay.com', 'Welcome Test LAX 74!', 'Test', '', 'LAX 74', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (456, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 74', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (457, 1, 455, 11, 455, 0, 0, '457', '/457', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (458, 1, 457, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (459, 1, 457, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (455, 16);

insert into Users_Orgs (userId, organizationId) values (455, 19);
insert into Users_Orgs (userId, organizationId) values (455, 45);

insert into Users_Roles values (455, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (460, 1, timestamp, timestamp, FALSE, 461, 'test', FALSE, FALSE, 'lax75', 'test.lax.75@liferay.com', 'Welcome Test LAX 75!', 'Test', '', 'LAX 75', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (461, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 75', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (462, 1, 460, 11, 460, 0, 0, '462', '/462', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (463, 1, 462, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (464, 1, 462, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (460, 16);

insert into Users_Orgs (userId, organizationId) values (460, 19);
insert into Users_Orgs (userId, organizationId) values (460, 45);

insert into Users_Roles values (460, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (465, 1, timestamp, timestamp, FALSE, 466, 'test', FALSE, FALSE, 'lax76', 'test.lax.76@liferay.com', 'Welcome Test LAX 76!', 'Test', '', 'LAX 76', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (466, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 76', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (467, 1, 465, 11, 465, 0, 0, '467', '/467', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (468, 1, 467, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (469, 1, 467, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (465, 16);

insert into Users_Orgs (userId, organizationId) values (465, 19);
insert into Users_Orgs (userId, organizationId) values (465, 45);

insert into Users_Roles values (465, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (470, 1, timestamp, timestamp, FALSE, 471, 'test', FALSE, FALSE, 'lax77', 'test.lax.77@liferay.com', 'Welcome Test LAX 77!', 'Test', '', 'LAX 77', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (471, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 77', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (472, 1, 470, 11, 470, 0, 0, '472', '/472', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (473, 1, 472, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (474, 1, 472, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (470, 16);

insert into Users_Orgs (userId, organizationId) values (470, 19);
insert into Users_Orgs (userId, organizationId) values (470, 45);

insert into Users_Roles values (470, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (475, 1, timestamp, timestamp, FALSE, 476, 'test', FALSE, FALSE, 'lax78', 'test.lax.78@liferay.com', 'Welcome Test LAX 78!', 'Test', '', 'LAX 78', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (476, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 78', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (477, 1, 475, 11, 475, 0, 0, '477', '/477', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (478, 1, 477, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (479, 1, 477, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (475, 16);

insert into Users_Orgs (userId, organizationId) values (475, 19);
insert into Users_Orgs (userId, organizationId) values (475, 45);

insert into Users_Roles values (475, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (480, 1, timestamp, timestamp, FALSE, 481, 'test', FALSE, FALSE, 'lax79', 'test.lax.79@liferay.com', 'Welcome Test LAX 79!', 'Test', '', 'LAX 79', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (481, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 79', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (482, 1, 480, 11, 480, 0, 0, '482', '/482', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (483, 1, 482, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (484, 1, 482, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (480, 16);

insert into Users_Orgs (userId, organizationId) values (480, 19);
insert into Users_Orgs (userId, organizationId) values (480, 45);

insert into Users_Roles values (480, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (485, 1, timestamp, timestamp, FALSE, 486, 'test', FALSE, FALSE, 'lax80', 'test.lax.80@liferay.com', 'Welcome Test LAX 80!', 'Test', '', 'LAX 80', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (486, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 80', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (487, 1, 485, 11, 485, 0, 0, '487', '/487', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (488, 1, 487, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (489, 1, 487, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (485, 16);

insert into Users_Orgs (userId, organizationId) values (485, 19);
insert into Users_Orgs (userId, organizationId) values (485, 45);

insert into Users_Roles values (485, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (490, 1, timestamp, timestamp, FALSE, 491, 'test', FALSE, FALSE, 'lax81', 'test.lax.81@liferay.com', 'Welcome Test LAX 81!', 'Test', '', 'LAX 81', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (491, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 81', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (492, 1, 490, 11, 490, 0, 0, '492', '/492', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (493, 1, 492, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (494, 1, 492, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (490, 16);

insert into Users_Orgs (userId, organizationId) values (490, 19);
insert into Users_Orgs (userId, organizationId) values (490, 45);

insert into Users_Roles values (490, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (495, 1, timestamp, timestamp, FALSE, 496, 'test', FALSE, FALSE, 'lax82', 'test.lax.82@liferay.com', 'Welcome Test LAX 82!', 'Test', '', 'LAX 82', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (496, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 82', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (497, 1, 495, 11, 495, 0, 0, '497', '/497', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (498, 1, 497, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (499, 1, 497, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (495, 16);

insert into Users_Orgs (userId, organizationId) values (495, 19);
insert into Users_Orgs (userId, organizationId) values (495, 45);

insert into Users_Roles values (495, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (500, 1, timestamp, timestamp, FALSE, 501, 'test', FALSE, FALSE, 'lax83', 'test.lax.83@liferay.com', 'Welcome Test LAX 83!', 'Test', '', 'LAX 83', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (501, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 83', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (502, 1, 500, 11, 500, 0, 0, '502', '/502', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (503, 1, 502, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (504, 1, 502, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (500, 16);

insert into Users_Orgs (userId, organizationId) values (500, 19);
insert into Users_Orgs (userId, organizationId) values (500, 45);

insert into Users_Roles values (500, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (505, 1, timestamp, timestamp, FALSE, 506, 'test', FALSE, FALSE, 'lax84', 'test.lax.84@liferay.com', 'Welcome Test LAX 84!', 'Test', '', 'LAX 84', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (506, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 84', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (507, 1, 505, 11, 505, 0, 0, '507', '/507', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (508, 1, 507, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (509, 1, 507, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (505, 16);

insert into Users_Orgs (userId, organizationId) values (505, 19);
insert into Users_Orgs (userId, organizationId) values (505, 45);

insert into Users_Roles values (505, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (510, 1, timestamp, timestamp, FALSE, 511, 'test', FALSE, FALSE, 'lax85', 'test.lax.85@liferay.com', 'Welcome Test LAX 85!', 'Test', '', 'LAX 85', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (511, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 85', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (512, 1, 510, 11, 510, 0, 0, '512', '/512', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (513, 1, 512, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (514, 1, 512, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (510, 16);

insert into Users_Orgs (userId, organizationId) values (510, 19);
insert into Users_Orgs (userId, organizationId) values (510, 45);

insert into Users_Roles values (510, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (515, 1, timestamp, timestamp, FALSE, 516, 'test', FALSE, FALSE, 'lax86', 'test.lax.86@liferay.com', 'Welcome Test LAX 86!', 'Test', '', 'LAX 86', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (516, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 86', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (517, 1, 515, 11, 515, 0, 0, '517', '/517', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (518, 1, 517, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (519, 1, 517, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (515, 16);

insert into Users_Orgs (userId, organizationId) values (515, 19);
insert into Users_Orgs (userId, organizationId) values (515, 45);

insert into Users_Roles values (515, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (520, 1, timestamp, timestamp, FALSE, 521, 'test', FALSE, FALSE, 'lax87', 'test.lax.87@liferay.com', 'Welcome Test LAX 87!', 'Test', '', 'LAX 87', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (521, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 87', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (522, 1, 520, 11, 520, 0, 0, '522', '/522', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (523, 1, 522, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (524, 1, 522, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (520, 16);

insert into Users_Orgs (userId, organizationId) values (520, 19);
insert into Users_Orgs (userId, organizationId) values (520, 45);

insert into Users_Roles values (520, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (525, 1, timestamp, timestamp, FALSE, 526, 'test', FALSE, FALSE, 'lax88', 'test.lax.88@liferay.com', 'Welcome Test LAX 88!', 'Test', '', 'LAX 88', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (526, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 88', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (527, 1, 525, 11, 525, 0, 0, '527', '/527', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (528, 1, 527, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (529, 1, 527, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (525, 16);

insert into Users_Orgs (userId, organizationId) values (525, 19);
insert into Users_Orgs (userId, organizationId) values (525, 45);

insert into Users_Roles values (525, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (530, 1, timestamp, timestamp, FALSE, 531, 'test', FALSE, FALSE, 'lax89', 'test.lax.89@liferay.com', 'Welcome Test LAX 89!', 'Test', '', 'LAX 89', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (531, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 89', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (532, 1, 530, 11, 530, 0, 0, '532', '/532', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (533, 1, 532, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (534, 1, 532, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (530, 16);

insert into Users_Orgs (userId, organizationId) values (530, 19);
insert into Users_Orgs (userId, organizationId) values (530, 45);

insert into Users_Roles values (530, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (535, 1, timestamp, timestamp, FALSE, 536, 'test', FALSE, FALSE, 'lax90', 'test.lax.90@liferay.com', 'Welcome Test LAX 90!', 'Test', '', 'LAX 90', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (536, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 90', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (537, 1, 535, 11, 535, 0, 0, '537', '/537', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (538, 1, 537, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (539, 1, 537, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (535, 16);

insert into Users_Orgs (userId, organizationId) values (535, 19);
insert into Users_Orgs (userId, organizationId) values (535, 45);

insert into Users_Roles values (535, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (540, 1, timestamp, timestamp, FALSE, 541, 'test', FALSE, FALSE, 'lax91', 'test.lax.91@liferay.com', 'Welcome Test LAX 91!', 'Test', '', 'LAX 91', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (541, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 91', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (542, 1, 540, 11, 540, 0, 0, '542', '/542', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (543, 1, 542, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (544, 1, 542, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (540, 16);

insert into Users_Orgs (userId, organizationId) values (540, 19);
insert into Users_Orgs (userId, organizationId) values (540, 45);

insert into Users_Roles values (540, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (545, 1, timestamp, timestamp, FALSE, 546, 'test', FALSE, FALSE, 'lax92', 'test.lax.92@liferay.com', 'Welcome Test LAX 92!', 'Test', '', 'LAX 92', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (546, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 92', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (547, 1, 545, 11, 545, 0, 0, '547', '/547', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (548, 1, 547, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (549, 1, 547, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (545, 16);

insert into Users_Orgs (userId, organizationId) values (545, 19);
insert into Users_Orgs (userId, organizationId) values (545, 45);

insert into Users_Roles values (545, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (550, 1, timestamp, timestamp, FALSE, 551, 'test', FALSE, FALSE, 'lax93', 'test.lax.93@liferay.com', 'Welcome Test LAX 93!', 'Test', '', 'LAX 93', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (551, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 93', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (552, 1, 550, 11, 550, 0, 0, '552', '/552', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (553, 1, 552, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (554, 1, 552, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (550, 16);

insert into Users_Orgs (userId, organizationId) values (550, 19);
insert into Users_Orgs (userId, organizationId) values (550, 45);

insert into Users_Roles values (550, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (555, 1, timestamp, timestamp, FALSE, 556, 'test', FALSE, FALSE, 'lax94', 'test.lax.94@liferay.com', 'Welcome Test LAX 94!', 'Test', '', 'LAX 94', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (556, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 94', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (557, 1, 555, 11, 555, 0, 0, '557', '/557', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (558, 1, 557, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (559, 1, 557, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (555, 16);

insert into Users_Orgs (userId, organizationId) values (555, 19);
insert into Users_Orgs (userId, organizationId) values (555, 45);

insert into Users_Roles values (555, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (560, 1, timestamp, timestamp, FALSE, 561, 'test', FALSE, FALSE, 'lax95', 'test.lax.95@liferay.com', 'Welcome Test LAX 95!', 'Test', '', 'LAX 95', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (561, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 95', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (562, 1, 560, 11, 560, 0, 0, '562', '/562', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (563, 1, 562, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (564, 1, 562, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (560, 16);

insert into Users_Orgs (userId, organizationId) values (560, 19);
insert into Users_Orgs (userId, organizationId) values (560, 45);

insert into Users_Roles values (560, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (565, 1, timestamp, timestamp, FALSE, 566, 'test', FALSE, FALSE, 'lax96', 'test.lax.96@liferay.com', 'Welcome Test LAX 96!', 'Test', '', 'LAX 96', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (566, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 96', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (567, 1, 565, 11, 565, 0, 0, '567', '/567', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (568, 1, 567, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (569, 1, 567, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (565, 16);

insert into Users_Orgs (userId, organizationId) values (565, 19);
insert into Users_Orgs (userId, organizationId) values (565, 45);

insert into Users_Roles values (565, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (570, 1, timestamp, timestamp, FALSE, 571, 'test', FALSE, FALSE, 'lax97', 'test.lax.97@liferay.com', 'Welcome Test LAX 97!', 'Test', '', 'LAX 97', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (571, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 97', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (572, 1, 570, 11, 570, 0, 0, '572', '/572', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (573, 1, 572, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (574, 1, 572, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (570, 16);

insert into Users_Orgs (userId, organizationId) values (570, 19);
insert into Users_Orgs (userId, organizationId) values (570, 45);

insert into Users_Roles values (570, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (575, 1, timestamp, timestamp, FALSE, 576, 'test', FALSE, FALSE, 'lax98', 'test.lax.98@liferay.com', 'Welcome Test LAX 98!', 'Test', '', 'LAX 98', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (576, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 98', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (577, 1, 575, 11, 575, 0, 0, '577', '/577', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (578, 1, 577, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (579, 1, 577, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (575, 16);

insert into Users_Orgs (userId, organizationId) values (575, 19);
insert into Users_Orgs (userId, organizationId) values (575, 45);

insert into Users_Roles values (575, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (580, 1, timestamp, timestamp, FALSE, 581, 'test', FALSE, FALSE, 'lax99', 'test.lax.99@liferay.com', 'Welcome Test LAX 99!', 'Test', '', 'LAX 99', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (581, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 99', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (582, 1, 580, 11, 580, 0, 0, '582', '/582', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (583, 1, 582, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (584, 1, 582, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (580, 16);

insert into Users_Orgs (userId, organizationId) values (580, 19);
insert into Users_Orgs (userId, organizationId) values (580, 45);

insert into Users_Roles values (580, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (585, 1, timestamp, timestamp, FALSE, 586, 'test', FALSE, FALSE, 'lax100', 'test.lax.100@liferay.com', 'Welcome Test LAX 100!', 'Test', '', 'LAX 100', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (586, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'LAX 100', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (587, 1, 585, 11, 585, 0, 0, '587', '/587', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (588, 1, 587, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (589, 1, 587, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (585, 16);

insert into Users_Orgs (userId, organizationId) values (585, 19);
insert into Users_Orgs (userId, organizationId) values (585, 45);

insert into Users_Roles values (585, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (590, 1, timestamp, timestamp, FALSE, 591, 'test', FALSE, FALSE, 'sfo1', 'test.sfo.1@liferay.com', 'Welcome Test SFO 1!', 'Test', '', 'SFO 1', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (591, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'SFO 1', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (592, 1, 590, 11, 590, 0, 0, '592', '/592', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (593, 1, 592, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (594, 1, 592, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (590, 16);

insert into Users_Orgs (userId, organizationId) values (590, 19);
insert into Users_Orgs (userId, organizationId) values (590, 49);

insert into Users_Roles values (590, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (595, 1, timestamp, timestamp, FALSE, 596, 'test', FALSE, FALSE, 'sfo2', 'test.sfo.2@liferay.com', 'Welcome Test SFO 2!', 'Test', '', 'SFO 2', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (596, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'SFO 2', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (597, 1, 595, 11, 595, 0, 0, '597', '/597', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (598, 1, 597, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (599, 1, 597, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (595, 16);

insert into Users_Orgs (userId, organizationId) values (595, 19);
insert into Users_Orgs (userId, organizationId) values (595, 49);

insert into Users_Roles values (595, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (600, 1, timestamp, timestamp, FALSE, 601, 'test', FALSE, FALSE, 'sfo3', 'test.sfo.3@liferay.com', 'Welcome Test SFO 3!', 'Test', '', 'SFO 3', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (601, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'SFO 3', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (602, 1, 600, 11, 600, 0, 0, '602', '/602', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (603, 1, 602, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (604, 1, 602, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (600, 16);

insert into Users_Orgs (userId, organizationId) values (600, 19);
insert into Users_Orgs (userId, organizationId) values (600, 49);

insert into Users_Roles values (600, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (605, 1, timestamp, timestamp, FALSE, 606, 'test', FALSE, FALSE, 'sfo4', 'test.sfo.4@liferay.com', 'Welcome Test SFO 4!', 'Test', '', 'SFO 4', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (606, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'SFO 4', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (607, 1, 605, 11, 605, 0, 0, '607', '/607', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (608, 1, 607, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (609, 1, 607, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (605, 16);

insert into Users_Orgs (userId, organizationId) values (605, 19);
insert into Users_Orgs (userId, organizationId) values (605, 49);

insert into Users_Roles values (605, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (610, 1, timestamp, timestamp, FALSE, 611, 'test', FALSE, FALSE, 'sfo5', 'test.sfo.5@liferay.com', 'Welcome Test SFO 5!', 'Test', '', 'SFO 5', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (611, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'SFO 5', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (612, 1, 610, 11, 610, 0, 0, '612', '/612', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (613, 1, 612, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (614, 1, 612, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (610, 16);

insert into Users_Orgs (userId, organizationId) values (610, 19);
insert into Users_Orgs (userId, organizationId) values (610, 49);

insert into Users_Roles values (610, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (615, 1, timestamp, timestamp, FALSE, 616, 'test', FALSE, FALSE, 'sfo6', 'test.sfo.6@liferay.com', 'Welcome Test SFO 6!', 'Test', '', 'SFO 6', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (616, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'SFO 6', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (617, 1, 615, 11, 615, 0, 0, '617', '/617', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (618, 1, 617, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (619, 1, 617, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (615, 16);

insert into Users_Orgs (userId, organizationId) values (615, 19);
insert into Users_Orgs (userId, organizationId) values (615, 49);

insert into Users_Roles values (615, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (620, 1, timestamp, timestamp, FALSE, 621, 'test', FALSE, FALSE, 'sfo7', 'test.sfo.7@liferay.com', 'Welcome Test SFO 7!', 'Test', '', 'SFO 7', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (621, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'SFO 7', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (622, 1, 620, 11, 620, 0, 0, '622', '/622', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (623, 1, 622, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (624, 1, 622, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (620, 16);

insert into Users_Orgs (userId, organizationId) values (620, 19);
insert into Users_Orgs (userId, organizationId) values (620, 49);

insert into Users_Roles values (620, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (625, 1, timestamp, timestamp, FALSE, 626, 'test', FALSE, FALSE, 'sfo8', 'test.sfo.8@liferay.com', 'Welcome Test SFO 8!', 'Test', '', 'SFO 8', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (626, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'SFO 8', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (627, 1, 625, 11, 625, 0, 0, '627', '/627', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (628, 1, 627, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (629, 1, 627, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (625, 16);

insert into Users_Orgs (userId, organizationId) values (625, 19);
insert into Users_Orgs (userId, organizationId) values (625, 49);

insert into Users_Roles values (625, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (630, 1, timestamp, timestamp, FALSE, 631, 'test', FALSE, FALSE, 'sfo9', 'test.sfo.9@liferay.com', 'Welcome Test SFO 9!', 'Test', '', 'SFO 9', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (631, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'SFO 9', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (632, 1, 630, 11, 630, 0, 0, '632', '/632', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (633, 1, 632, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (634, 1, 632, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (630, 16);

insert into Users_Orgs (userId, organizationId) values (630, 19);
insert into Users_Orgs (userId, organizationId) values (630, 49);

insert into Users_Roles values (630, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (635, 1, timestamp, timestamp, FALSE, 636, 'test', FALSE, FALSE, 'sfo10', 'test.sfo.10@liferay.com', 'Welcome Test SFO 10!', 'Test', '', 'SFO 10', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (636, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'SFO 10', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (637, 1, 635, 11, 635, 0, 0, '637', '/637', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (638, 1, 637, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (639, 1, 637, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (635, 16);

insert into Users_Orgs (userId, organizationId) values (635, 19);
insert into Users_Orgs (userId, organizationId) values (635, 49);

insert into Users_Roles values (635, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (640, 1, timestamp, timestamp, FALSE, 641, 'test', FALSE, FALSE, 'ord1', 'test.ord.1@liferay.com', 'Welcome Test ORD 1!', 'Test', '', 'ORD 1', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (641, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'ORD 1', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (642, 1, 640, 11, 640, 0, 0, '642', '/642', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (643, 1, 642, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (644, 1, 642, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (640, 16);

insert into Users_Orgs (userId, organizationId) values (640, 19);
insert into Users_Orgs (userId, organizationId) values (640, 53);

insert into Users_Roles values (640, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (645, 1, timestamp, timestamp, FALSE, 646, 'test', FALSE, FALSE, 'ord2', 'test.ord.2@liferay.com', 'Welcome Test ORD 2!', 'Test', '', 'ORD 2', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (646, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'ORD 2', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (647, 1, 645, 11, 645, 0, 0, '647', '/647', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (648, 1, 647, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (649, 1, 647, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (645, 16);

insert into Users_Orgs (userId, organizationId) values (645, 19);
insert into Users_Orgs (userId, organizationId) values (645, 53);

insert into Users_Roles values (645, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (650, 1, timestamp, timestamp, FALSE, 651, 'test', FALSE, FALSE, 'ord3', 'test.ord.3@liferay.com', 'Welcome Test ORD 3!', 'Test', '', 'ORD 3', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (651, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'ORD 3', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (652, 1, 650, 11, 650, 0, 0, '652', '/652', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (653, 1, 652, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (654, 1, 652, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (650, 16);

insert into Users_Orgs (userId, organizationId) values (650, 19);
insert into Users_Orgs (userId, organizationId) values (650, 53);

insert into Users_Roles values (650, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (655, 1, timestamp, timestamp, FALSE, 656, 'test', FALSE, FALSE, 'ord4', 'test.ord.4@liferay.com', 'Welcome Test ORD 4!', 'Test', '', 'ORD 4', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (656, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'ORD 4', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (657, 1, 655, 11, 655, 0, 0, '657', '/657', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (658, 1, 657, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (659, 1, 657, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (655, 16);

insert into Users_Orgs (userId, organizationId) values (655, 19);
insert into Users_Orgs (userId, organizationId) values (655, 53);

insert into Users_Roles values (655, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (660, 1, timestamp, timestamp, FALSE, 661, 'test', FALSE, FALSE, 'ord5', 'test.ord.5@liferay.com', 'Welcome Test ORD 5!', 'Test', '', 'ORD 5', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (661, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'ORD 5', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (662, 1, 660, 11, 660, 0, 0, '662', '/662', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (663, 1, 662, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (664, 1, 662, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (660, 16);

insert into Users_Orgs (userId, organizationId) values (660, 19);
insert into Users_Orgs (userId, organizationId) values (660, 53);

insert into Users_Roles values (660, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (665, 1, timestamp, timestamp, FALSE, 666, 'test', FALSE, FALSE, 'ord6', 'test.ord.6@liferay.com', 'Welcome Test ORD 6!', 'Test', '', 'ORD 6', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (666, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'ORD 6', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (667, 1, 665, 11, 665, 0, 0, '667', '/667', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (668, 1, 667, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (669, 1, 667, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (665, 16);

insert into Users_Orgs (userId, organizationId) values (665, 19);
insert into Users_Orgs (userId, organizationId) values (665, 53);

insert into Users_Roles values (665, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (670, 1, timestamp, timestamp, FALSE, 671, 'test', FALSE, FALSE, 'ord7', 'test.ord.7@liferay.com', 'Welcome Test ORD 7!', 'Test', '', 'ORD 7', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (671, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'ORD 7', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (672, 1, 670, 11, 670, 0, 0, '672', '/672', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (673, 1, 672, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (674, 1, 672, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (670, 16);

insert into Users_Orgs (userId, organizationId) values (670, 19);
insert into Users_Orgs (userId, organizationId) values (670, 53);

insert into Users_Roles values (670, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (675, 1, timestamp, timestamp, FALSE, 676, 'test', FALSE, FALSE, 'ord8', 'test.ord.8@liferay.com', 'Welcome Test ORD 8!', 'Test', '', 'ORD 8', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (676, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'ORD 8', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (677, 1, 675, 11, 675, 0, 0, '677', '/677', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (678, 1, 677, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (679, 1, 677, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (675, 16);

insert into Users_Orgs (userId, organizationId) values (675, 19);
insert into Users_Orgs (userId, organizationId) values (675, 53);

insert into Users_Roles values (675, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (680, 1, timestamp, timestamp, FALSE, 681, 'test', FALSE, FALSE, 'ord9', 'test.ord.9@liferay.com', 'Welcome Test ORD 9!', 'Test', '', 'ORD 9', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (681, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'ORD 9', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (682, 1, 680, 11, 680, 0, 0, '682', '/682', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (683, 1, 682, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (684, 1, 682, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (680, 16);

insert into Users_Orgs (userId, organizationId) values (680, 19);
insert into Users_Orgs (userId, organizationId) values (680, 53);

insert into Users_Roles values (680, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (685, 1, timestamp, timestamp, FALSE, 686, 'test', FALSE, FALSE, 'ord10', 'test.ord.10@liferay.com', 'Welcome Test ORD 10!', 'Test', '', 'ORD 10', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (686, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'ORD 10', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (687, 1, 685, 11, 685, 0, 0, '687', '/687', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (688, 1, 687, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (689, 1, 687, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (685, 16);

insert into Users_Orgs (userId, organizationId) values (685, 19);
insert into Users_Orgs (userId, organizationId) values (685, 53);

insert into Users_Roles values (685, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (690, 1, timestamp, timestamp, FALSE, 691, 'test', FALSE, FALSE, 'nyc1', 'test.nyc.1@liferay.com', 'Welcome Test NYC 1!', 'Test', '', 'NYC 1', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (691, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'NYC 1', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (692, 1, 690, 11, 690, 0, 0, '692', '/692', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (693, 1, 692, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (694, 1, 692, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (690, 16);

insert into Users_Orgs (userId, organizationId) values (690, 19);
insert into Users_Orgs (userId, organizationId) values (690, 57);

insert into Users_Roles values (690, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (695, 1, timestamp, timestamp, FALSE, 696, 'test', FALSE, FALSE, 'nyc2', 'test.nyc.2@liferay.com', 'Welcome Test NYC 2!', 'Test', '', 'NYC 2', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (696, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'NYC 2', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (697, 1, 695, 11, 695, 0, 0, '697', '/697', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (698, 1, 697, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (699, 1, 697, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (695, 16);

insert into Users_Orgs (userId, organizationId) values (695, 19);
insert into Users_Orgs (userId, organizationId) values (695, 57);

insert into Users_Roles values (695, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (700, 1, timestamp, timestamp, FALSE, 701, 'test', FALSE, FALSE, 'nyc3', 'test.nyc.3@liferay.com', 'Welcome Test NYC 3!', 'Test', '', 'NYC 3', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (701, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'NYC 3', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (702, 1, 700, 11, 700, 0, 0, '702', '/702', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (703, 1, 702, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (704, 1, 702, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (700, 16);

insert into Users_Orgs (userId, organizationId) values (700, 19);
insert into Users_Orgs (userId, organizationId) values (700, 57);

insert into Users_Roles values (700, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (705, 1, timestamp, timestamp, FALSE, 706, 'test', FALSE, FALSE, 'nyc4', 'test.nyc.4@liferay.com', 'Welcome Test NYC 4!', 'Test', '', 'NYC 4', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (706, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'NYC 4', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (707, 1, 705, 11, 705, 0, 0, '707', '/707', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (708, 1, 707, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (709, 1, 707, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (705, 16);

insert into Users_Orgs (userId, organizationId) values (705, 19);
insert into Users_Orgs (userId, organizationId) values (705, 57);

insert into Users_Roles values (705, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (710, 1, timestamp, timestamp, FALSE, 711, 'test', FALSE, FALSE, 'nyc5', 'test.nyc.5@liferay.com', 'Welcome Test NYC 5!', 'Test', '', 'NYC 5', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (711, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'NYC 5', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (712, 1, 710, 11, 710, 0, 0, '712', '/712', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (713, 1, 712, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (714, 1, 712, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (710, 16);

insert into Users_Orgs (userId, organizationId) values (710, 19);
insert into Users_Orgs (userId, organizationId) values (710, 57);

insert into Users_Roles values (710, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (715, 1, timestamp, timestamp, FALSE, 716, 'test', FALSE, FALSE, 'nyc6', 'test.nyc.6@liferay.com', 'Welcome Test NYC 6!', 'Test', '', 'NYC 6', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (716, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'NYC 6', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (717, 1, 715, 11, 715, 0, 0, '717', '/717', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (718, 1, 717, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (719, 1, 717, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (715, 16);

insert into Users_Orgs (userId, organizationId) values (715, 19);
insert into Users_Orgs (userId, organizationId) values (715, 57);

insert into Users_Roles values (715, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (720, 1, timestamp, timestamp, FALSE, 721, 'test', FALSE, FALSE, 'nyc7', 'test.nyc.7@liferay.com', 'Welcome Test NYC 7!', 'Test', '', 'NYC 7', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (721, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'NYC 7', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (722, 1, 720, 11, 720, 0, 0, '722', '/722', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (723, 1, 722, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (724, 1, 722, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (720, 16);

insert into Users_Orgs (userId, organizationId) values (720, 19);
insert into Users_Orgs (userId, organizationId) values (720, 57);

insert into Users_Roles values (720, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (725, 1, timestamp, timestamp, FALSE, 726, 'test', FALSE, FALSE, 'nyc8', 'test.nyc.8@liferay.com', 'Welcome Test NYC 8!', 'Test', '', 'NYC 8', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (726, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'NYC 8', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (727, 1, 725, 11, 725, 0, 0, '727', '/727', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (728, 1, 727, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (729, 1, 727, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (725, 16);

insert into Users_Orgs (userId, organizationId) values (725, 19);
insert into Users_Orgs (userId, organizationId) values (725, 57);

insert into Users_Roles values (725, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (730, 1, timestamp, timestamp, FALSE, 731, 'test', FALSE, FALSE, 'nyc9', 'test.nyc.9@liferay.com', 'Welcome Test NYC 9!', 'Test', '', 'NYC 9', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (731, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'NYC 9', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (732, 1, 730, 11, 730, 0, 0, '732', '/732', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (733, 1, 732, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (734, 1, 732, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (730, 16);

insert into Users_Orgs (userId, organizationId) values (730, 19);
insert into Users_Orgs (userId, organizationId) values (730, 57);

insert into Users_Roles values (730, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (735, 1, timestamp, timestamp, FALSE, 736, 'test', FALSE, FALSE, 'nyc10', 'test.nyc.10@liferay.com', 'Welcome Test NYC 10!', 'Test', '', 'NYC 10', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (736, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'NYC 10', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (737, 1, 735, 11, 735, 0, 0, '737', '/737', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (738, 1, 737, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (739, 1, 737, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (735, 16);

insert into Users_Orgs (userId, organizationId) values (735, 19);
insert into Users_Orgs (userId, organizationId) values (735, 57);

insert into Users_Roles values (735, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (740, 1, timestamp, timestamp, FALSE, 741, 'test', FALSE, FALSE, 'gru1', 'test.gru.1@liferay.com', 'Welcome Test GRU 1!', 'Test', '', 'GRU 1', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (741, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'GRU 1', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (742, 1, 740, 11, 740, 0, 0, '742', '/742', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (743, 1, 742, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (744, 1, 742, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (740, 16);

insert into Users_Orgs (userId, organizationId) values (740, 19);
insert into Users_Orgs (userId, organizationId) values (740, 61);

insert into Users_Roles values (740, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (745, 1, timestamp, timestamp, FALSE, 746, 'test', FALSE, FALSE, 'gru2', 'test.gru.2@liferay.com', 'Welcome Test GRU 2!', 'Test', '', 'GRU 2', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (746, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'GRU 2', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (747, 1, 745, 11, 745, 0, 0, '747', '/747', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (748, 1, 747, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (749, 1, 747, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (745, 16);

insert into Users_Orgs (userId, organizationId) values (745, 19);
insert into Users_Orgs (userId, organizationId) values (745, 61);

insert into Users_Roles values (745, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (750, 1, timestamp, timestamp, FALSE, 751, 'test', FALSE, FALSE, 'gru3', 'test.gru.3@liferay.com', 'Welcome Test GRU 3!', 'Test', '', 'GRU 3', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (751, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'GRU 3', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (752, 1, 750, 11, 750, 0, 0, '752', '/752', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (753, 1, 752, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (754, 1, 752, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (750, 16);

insert into Users_Orgs (userId, organizationId) values (750, 19);
insert into Users_Orgs (userId, organizationId) values (750, 61);

insert into Users_Roles values (750, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (755, 1, timestamp, timestamp, FALSE, 756, 'test', FALSE, FALSE, 'gru4', 'test.gru.4@liferay.com', 'Welcome Test GRU 4!', 'Test', '', 'GRU 4', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (756, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'GRU 4', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (757, 1, 755, 11, 755, 0, 0, '757', '/757', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (758, 1, 757, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (759, 1, 757, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (755, 16);

insert into Users_Orgs (userId, organizationId) values (755, 19);
insert into Users_Orgs (userId, organizationId) values (755, 61);

insert into Users_Roles values (755, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (760, 1, timestamp, timestamp, FALSE, 761, 'test', FALSE, FALSE, 'gru5', 'test.gru.5@liferay.com', 'Welcome Test GRU 5!', 'Test', '', 'GRU 5', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (761, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'GRU 5', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (762, 1, 760, 11, 760, 0, 0, '762', '/762', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (763, 1, 762, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (764, 1, 762, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (760, 16);

insert into Users_Orgs (userId, organizationId) values (760, 19);
insert into Users_Orgs (userId, organizationId) values (760, 61);

insert into Users_Roles values (760, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (765, 1, timestamp, timestamp, FALSE, 766, 'test', FALSE, FALSE, 'gru6', 'test.gru.6@liferay.com', 'Welcome Test GRU 6!', 'Test', '', 'GRU 6', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (766, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'GRU 6', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (767, 1, 765, 11, 765, 0, 0, '767', '/767', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (768, 1, 767, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (769, 1, 767, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (765, 16);

insert into Users_Orgs (userId, organizationId) values (765, 19);
insert into Users_Orgs (userId, organizationId) values (765, 61);

insert into Users_Roles values (765, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (770, 1, timestamp, timestamp, FALSE, 771, 'test', FALSE, FALSE, 'gru7', 'test.gru.7@liferay.com', 'Welcome Test GRU 7!', 'Test', '', 'GRU 7', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (771, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'GRU 7', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (772, 1, 770, 11, 770, 0, 0, '772', '/772', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (773, 1, 772, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (774, 1, 772, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (770, 16);

insert into Users_Orgs (userId, organizationId) values (770, 19);
insert into Users_Orgs (userId, organizationId) values (770, 61);

insert into Users_Roles values (770, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (775, 1, timestamp, timestamp, FALSE, 776, 'test', FALSE, FALSE, 'gru8', 'test.gru.8@liferay.com', 'Welcome Test GRU 8!', 'Test', '', 'GRU 8', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (776, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'GRU 8', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (777, 1, 775, 11, 775, 0, 0, '777', '/777', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (778, 1, 777, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (779, 1, 777, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (775, 16);

insert into Users_Orgs (userId, organizationId) values (775, 19);
insert into Users_Orgs (userId, organizationId) values (775, 61);

insert into Users_Roles values (775, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (780, 1, timestamp, timestamp, FALSE, 781, 'test', FALSE, FALSE, 'gru9', 'test.gru.9@liferay.com', 'Welcome Test GRU 9!', 'Test', '', 'GRU 9', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (781, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'GRU 9', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (782, 1, 780, 11, 780, 0, 0, '782', '/782', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (783, 1, 782, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (784, 1, 782, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (780, 16);

insert into Users_Orgs (userId, organizationId) values (780, 19);
insert into Users_Orgs (userId, organizationId) values (780, 61);

insert into Users_Roles values (780, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (785, 1, timestamp, timestamp, FALSE, 786, 'test', FALSE, FALSE, 'gru10', 'test.gru.10@liferay.com', 'Welcome Test GRU 10!', 'Test', '', 'GRU 10', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (786, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'GRU 10', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (787, 1, 785, 11, 785, 0, 0, '787', '/787', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (788, 1, 787, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (789, 1, 787, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (785, 16);

insert into Users_Orgs (userId, organizationId) values (785, 19);
insert into Users_Orgs (userId, organizationId) values (785, 61);

insert into Users_Roles values (785, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (790, 1, timestamp, timestamp, FALSE, 791, 'test', FALSE, FALSE, 'fra1', 'test.fra.1@liferay.com', 'Welcome Test FRA 1!', 'Test', '', 'FRA 1', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (791, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'FRA 1', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (792, 1, 790, 11, 790, 0, 0, '792', '/792', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (793, 1, 792, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (794, 1, 792, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (790, 16);

insert into Users_Orgs (userId, organizationId) values (790, 19);
insert into Users_Orgs (userId, organizationId) values (790, 65);

insert into Users_Roles values (790, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (795, 1, timestamp, timestamp, FALSE, 796, 'test', FALSE, FALSE, 'fra2', 'test.fra.2@liferay.com', 'Welcome Test FRA 2!', 'Test', '', 'FRA 2', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (796, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'FRA 2', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (797, 1, 795, 11, 795, 0, 0, '797', '/797', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (798, 1, 797, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (799, 1, 797, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (795, 16);

insert into Users_Orgs (userId, organizationId) values (795, 19);
insert into Users_Orgs (userId, organizationId) values (795, 65);

insert into Users_Roles values (795, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (800, 1, timestamp, timestamp, FALSE, 801, 'test', FALSE, FALSE, 'fra3', 'test.fra.3@liferay.com', 'Welcome Test FRA 3!', 'Test', '', 'FRA 3', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (801, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'FRA 3', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (802, 1, 800, 11, 800, 0, 0, '802', '/802', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (803, 1, 802, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (804, 1, 802, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (800, 16);

insert into Users_Orgs (userId, organizationId) values (800, 19);
insert into Users_Orgs (userId, organizationId) values (800, 65);

insert into Users_Roles values (800, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (805, 1, timestamp, timestamp, FALSE, 806, 'test', FALSE, FALSE, 'fra4', 'test.fra.4@liferay.com', 'Welcome Test FRA 4!', 'Test', '', 'FRA 4', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (806, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'FRA 4', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (807, 1, 805, 11, 805, 0, 0, '807', '/807', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (808, 1, 807, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (809, 1, 807, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (805, 16);

insert into Users_Orgs (userId, organizationId) values (805, 19);
insert into Users_Orgs (userId, organizationId) values (805, 65);

insert into Users_Roles values (805, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (810, 1, timestamp, timestamp, FALSE, 811, 'test', FALSE, FALSE, 'fra5', 'test.fra.5@liferay.com', 'Welcome Test FRA 5!', 'Test', '', 'FRA 5', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (811, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'FRA 5', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (812, 1, 810, 11, 810, 0, 0, '812', '/812', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (813, 1, 812, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (814, 1, 812, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (810, 16);

insert into Users_Orgs (userId, organizationId) values (810, 19);
insert into Users_Orgs (userId, organizationId) values (810, 65);

insert into Users_Roles values (810, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (815, 1, timestamp, timestamp, FALSE, 816, 'test', FALSE, FALSE, 'fra6', 'test.fra.6@liferay.com', 'Welcome Test FRA 6!', 'Test', '', 'FRA 6', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (816, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'FRA 6', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (817, 1, 815, 11, 815, 0, 0, '817', '/817', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (818, 1, 817, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (819, 1, 817, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (815, 16);

insert into Users_Orgs (userId, organizationId) values (815, 19);
insert into Users_Orgs (userId, organizationId) values (815, 65);

insert into Users_Roles values (815, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (820, 1, timestamp, timestamp, FALSE, 821, 'test', FALSE, FALSE, 'fra7', 'test.fra.7@liferay.com', 'Welcome Test FRA 7!', 'Test', '', 'FRA 7', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (821, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'FRA 7', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (822, 1, 820, 11, 820, 0, 0, '822', '/822', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (823, 1, 822, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (824, 1, 822, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (820, 16);

insert into Users_Orgs (userId, organizationId) values (820, 19);
insert into Users_Orgs (userId, organizationId) values (820, 65);

insert into Users_Roles values (820, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (825, 1, timestamp, timestamp, FALSE, 826, 'test', FALSE, FALSE, 'fra8', 'test.fra.8@liferay.com', 'Welcome Test FRA 8!', 'Test', '', 'FRA 8', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (826, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'FRA 8', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (827, 1, 825, 11, 825, 0, 0, '827', '/827', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (828, 1, 827, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (829, 1, 827, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (825, 16);

insert into Users_Orgs (userId, organizationId) values (825, 19);
insert into Users_Orgs (userId, organizationId) values (825, 65);

insert into Users_Roles values (825, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (830, 1, timestamp, timestamp, FALSE, 831, 'test', FALSE, FALSE, 'fra9', 'test.fra.9@liferay.com', 'Welcome Test FRA 9!', 'Test', '', 'FRA 9', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (831, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'FRA 9', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (832, 1, 830, 11, 830, 0, 0, '832', '/832', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (833, 1, 832, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (834, 1, 832, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (830, 16);

insert into Users_Orgs (userId, organizationId) values (830, 19);
insert into Users_Orgs (userId, organizationId) values (830, 65);

insert into Users_Roles values (830, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (835, 1, timestamp, timestamp, FALSE, 836, 'test', FALSE, FALSE, 'fra10', 'test.fra.10@liferay.com', 'Welcome Test FRA 10!', 'Test', '', 'FRA 10', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (836, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'FRA 10', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (837, 1, 835, 11, 835, 0, 0, '837', '/837', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (838, 1, 837, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (839, 1, 837, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (835, 16);

insert into Users_Orgs (userId, organizationId) values (835, 19);
insert into Users_Orgs (userId, organizationId) values (835, 65);

insert into Users_Roles values (835, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (840, 1, timestamp, timestamp, FALSE, 841, 'test', FALSE, FALSE, 'mad1', 'test.mad.1@liferay.com', 'Welcome Test MAD 1!', 'Test', '', 'MAD 1', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (841, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'MAD 1', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (842, 1, 840, 11, 840, 0, 0, '842', '/842', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (843, 1, 842, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (844, 1, 842, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (840, 16);

insert into Users_Orgs (userId, organizationId) values (840, 19);
insert into Users_Orgs (userId, organizationId) values (840, 69);

insert into Users_Roles values (840, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (845, 1, timestamp, timestamp, FALSE, 846, 'test', FALSE, FALSE, 'mad2', 'test.mad.2@liferay.com', 'Welcome Test MAD 2!', 'Test', '', 'MAD 2', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (846, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'MAD 2', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (847, 1, 845, 11, 845, 0, 0, '847', '/847', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (848, 1, 847, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (849, 1, 847, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (845, 16);

insert into Users_Orgs (userId, organizationId) values (845, 19);
insert into Users_Orgs (userId, organizationId) values (845, 69);

insert into Users_Roles values (845, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (850, 1, timestamp, timestamp, FALSE, 851, 'test', FALSE, FALSE, 'mad3', 'test.mad.3@liferay.com', 'Welcome Test MAD 3!', 'Test', '', 'MAD 3', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (851, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'MAD 3', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (852, 1, 850, 11, 850, 0, 0, '852', '/852', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (853, 1, 852, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (854, 1, 852, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (850, 16);

insert into Users_Orgs (userId, organizationId) values (850, 19);
insert into Users_Orgs (userId, organizationId) values (850, 69);

insert into Users_Roles values (850, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (855, 1, timestamp, timestamp, FALSE, 856, 'test', FALSE, FALSE, 'mad4', 'test.mad.4@liferay.com', 'Welcome Test MAD 4!', 'Test', '', 'MAD 4', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (856, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'MAD 4', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (857, 1, 855, 11, 855, 0, 0, '857', '/857', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (858, 1, 857, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (859, 1, 857, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (855, 16);

insert into Users_Orgs (userId, organizationId) values (855, 19);
insert into Users_Orgs (userId, organizationId) values (855, 69);

insert into Users_Roles values (855, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (860, 1, timestamp, timestamp, FALSE, 861, 'test', FALSE, FALSE, 'mad5', 'test.mad.5@liferay.com', 'Welcome Test MAD 5!', 'Test', '', 'MAD 5', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (861, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'MAD 5', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (862, 1, 860, 11, 860, 0, 0, '862', '/862', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (863, 1, 862, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (864, 1, 862, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (860, 16);

insert into Users_Orgs (userId, organizationId) values (860, 19);
insert into Users_Orgs (userId, organizationId) values (860, 69);

insert into Users_Roles values (860, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (865, 1, timestamp, timestamp, FALSE, 866, 'test', FALSE, FALSE, 'mad6', 'test.mad.6@liferay.com', 'Welcome Test MAD 6!', 'Test', '', 'MAD 6', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (866, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'MAD 6', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (867, 1, 865, 11, 865, 0, 0, '867', '/867', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (868, 1, 867, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (869, 1, 867, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (865, 16);

insert into Users_Orgs (userId, organizationId) values (865, 19);
insert into Users_Orgs (userId, organizationId) values (865, 69);

insert into Users_Roles values (865, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (870, 1, timestamp, timestamp, FALSE, 871, 'test', FALSE, FALSE, 'mad7', 'test.mad.7@liferay.com', 'Welcome Test MAD 7!', 'Test', '', 'MAD 7', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (871, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'MAD 7', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (872, 1, 870, 11, 870, 0, 0, '872', '/872', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (873, 1, 872, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (874, 1, 872, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (870, 16);

insert into Users_Orgs (userId, organizationId) values (870, 19);
insert into Users_Orgs (userId, organizationId) values (870, 69);

insert into Users_Roles values (870, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (875, 1, timestamp, timestamp, FALSE, 876, 'test', FALSE, FALSE, 'mad8', 'test.mad.8@liferay.com', 'Welcome Test MAD 8!', 'Test', '', 'MAD 8', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (876, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'MAD 8', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (877, 1, 875, 11, 875, 0, 0, '877', '/877', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (878, 1, 877, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (879, 1, 877, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (875, 16);

insert into Users_Orgs (userId, organizationId) values (875, 19);
insert into Users_Orgs (userId, organizationId) values (875, 69);

insert into Users_Roles values (875, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (880, 1, timestamp, timestamp, FALSE, 881, 'test', FALSE, FALSE, 'mad9', 'test.mad.9@liferay.com', 'Welcome Test MAD 9!', 'Test', '', 'MAD 9', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (881, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'MAD 9', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (882, 1, 880, 11, 880, 0, 0, '882', '/882', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (883, 1, 882, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (884, 1, 882, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (880, 16);

insert into Users_Orgs (userId, organizationId) values (880, 19);
insert into Users_Orgs (userId, organizationId) values (880, 69);

insert into Users_Roles values (880, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (885, 1, timestamp, timestamp, FALSE, 886, 'test', FALSE, FALSE, 'mad10', 'test.mad.10@liferay.com', 'Welcome Test MAD 10!', 'Test', '', 'MAD 10', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (886, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'MAD 10', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (887, 1, 885, 11, 885, 0, 0, '887', '/887', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (888, 1, 887, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (889, 1, 887, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (885, 16);

insert into Users_Orgs (userId, organizationId) values (885, 19);
insert into Users_Orgs (userId, organizationId) values (885, 69);

insert into Users_Roles values (885, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (890, 1, timestamp, timestamp, FALSE, 891, 'test', FALSE, FALSE, 'dlc1', 'test.dlc.1@liferay.com', 'Welcome Test DLC 1!', 'Test', '', 'DLC 1', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (891, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'DLC 1', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (892, 1, 890, 11, 890, 0, 0, '892', '/892', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (893, 1, 892, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (894, 1, 892, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (890, 16);

insert into Users_Orgs (userId, organizationId) values (890, 19);
insert into Users_Orgs (userId, organizationId) values (890, 73);

insert into Users_Roles values (890, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (895, 1, timestamp, timestamp, FALSE, 896, 'test', FALSE, FALSE, 'dlc2', 'test.dlc.2@liferay.com', 'Welcome Test DLC 2!', 'Test', '', 'DLC 2', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (896, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'DLC 2', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (897, 1, 895, 11, 895, 0, 0, '897', '/897', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (898, 1, 897, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (899, 1, 897, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (895, 16);

insert into Users_Orgs (userId, organizationId) values (895, 19);
insert into Users_Orgs (userId, organizationId) values (895, 73);

insert into Users_Roles values (895, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (900, 1, timestamp, timestamp, FALSE, 901, 'test', FALSE, FALSE, 'dlc3', 'test.dlc.3@liferay.com', 'Welcome Test DLC 3!', 'Test', '', 'DLC 3', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (901, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'DLC 3', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (902, 1, 900, 11, 900, 0, 0, '902', '/902', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (903, 1, 902, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (904, 1, 902, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (900, 16);

insert into Users_Orgs (userId, organizationId) values (900, 19);
insert into Users_Orgs (userId, organizationId) values (900, 73);

insert into Users_Roles values (900, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (905, 1, timestamp, timestamp, FALSE, 906, 'test', FALSE, FALSE, 'dlc4', 'test.dlc.4@liferay.com', 'Welcome Test DLC 4!', 'Test', '', 'DLC 4', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (906, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'DLC 4', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (907, 1, 905, 11, 905, 0, 0, '907', '/907', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (908, 1, 907, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (909, 1, 907, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (905, 16);

insert into Users_Orgs (userId, organizationId) values (905, 19);
insert into Users_Orgs (userId, organizationId) values (905, 73);

insert into Users_Roles values (905, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (910, 1, timestamp, timestamp, FALSE, 911, 'test', FALSE, FALSE, 'dlc5', 'test.dlc.5@liferay.com', 'Welcome Test DLC 5!', 'Test', '', 'DLC 5', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (911, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'DLC 5', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (912, 1, 910, 11, 910, 0, 0, '912', '/912', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (913, 1, 912, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (914, 1, 912, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (910, 16);

insert into Users_Orgs (userId, organizationId) values (910, 19);
insert into Users_Orgs (userId, organizationId) values (910, 73);

insert into Users_Roles values (910, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (915, 1, timestamp, timestamp, FALSE, 916, 'test', FALSE, FALSE, 'dlc6', 'test.dlc.6@liferay.com', 'Welcome Test DLC 6!', 'Test', '', 'DLC 6', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (916, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'DLC 6', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (917, 1, 915, 11, 915, 0, 0, '917', '/917', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (918, 1, 917, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (919, 1, 917, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (915, 16);

insert into Users_Orgs (userId, organizationId) values (915, 19);
insert into Users_Orgs (userId, organizationId) values (915, 73);

insert into Users_Roles values (915, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (920, 1, timestamp, timestamp, FALSE, 921, 'test', FALSE, FALSE, 'dlc7', 'test.dlc.7@liferay.com', 'Welcome Test DLC 7!', 'Test', '', 'DLC 7', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (921, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'DLC 7', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (922, 1, 920, 11, 920, 0, 0, '922', '/922', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (923, 1, 922, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (924, 1, 922, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (920, 16);

insert into Users_Orgs (userId, organizationId) values (920, 19);
insert into Users_Orgs (userId, organizationId) values (920, 73);

insert into Users_Roles values (920, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (925, 1, timestamp, timestamp, FALSE, 926, 'test', FALSE, FALSE, 'dlc8', 'test.dlc.8@liferay.com', 'Welcome Test DLC 8!', 'Test', '', 'DLC 8', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (926, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'DLC 8', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (927, 1, 925, 11, 925, 0, 0, '927', '/927', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (928, 1, 927, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (929, 1, 927, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (925, 16);

insert into Users_Orgs (userId, organizationId) values (925, 19);
insert into Users_Orgs (userId, organizationId) values (925, 73);

insert into Users_Roles values (925, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (930, 1, timestamp, timestamp, FALSE, 931, 'test', FALSE, FALSE, 'dlc9', 'test.dlc.9@liferay.com', 'Welcome Test DLC 9!', 'Test', '', 'DLC 9', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (931, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'DLC 9', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (932, 1, 930, 11, 930, 0, 0, '932', '/932', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (933, 1, 932, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (934, 1, 932, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (930, 16);

insert into Users_Orgs (userId, organizationId) values (930, 19);
insert into Users_Orgs (userId, organizationId) values (930, 73);

insert into Users_Roles values (930, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (935, 1, timestamp, timestamp, FALSE, 936, 'test', FALSE, FALSE, 'dlc10', 'test.dlc.10@liferay.com', 'Welcome Test DLC 10!', 'Test', '', 'DLC 10', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (936, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'DLC 10', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (937, 1, 935, 11, 935, 0, 0, '937', '/937', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (938, 1, 937, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (939, 1, 937, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (935, 16);

insert into Users_Orgs (userId, organizationId) values (935, 19);
insert into Users_Orgs (userId, organizationId) values (935, 73);

insert into Users_Roles values (935, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (940, 1, timestamp, timestamp, FALSE, 941, 'test', FALSE, FALSE, 'hkg1', 'test.hkg.1@liferay.com', 'Welcome Test HKG 1!', 'Test', '', 'HKG 1', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (941, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'HKG 1', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (942, 1, 940, 11, 940, 0, 0, '942', '/942', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (943, 1, 942, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (944, 1, 942, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (940, 16);

insert into Users_Orgs (userId, organizationId) values (940, 19);
insert into Users_Orgs (userId, organizationId) values (940, 77);

insert into Users_Roles values (940, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (945, 1, timestamp, timestamp, FALSE, 946, 'test', FALSE, FALSE, 'hkg2', 'test.hkg.2@liferay.com', 'Welcome Test HKG 2!', 'Test', '', 'HKG 2', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (946, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'HKG 2', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (947, 1, 945, 11, 945, 0, 0, '947', '/947', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (948, 1, 947, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (949, 1, 947, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (945, 16);

insert into Users_Orgs (userId, organizationId) values (945, 19);
insert into Users_Orgs (userId, organizationId) values (945, 77);

insert into Users_Roles values (945, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (950, 1, timestamp, timestamp, FALSE, 951, 'test', FALSE, FALSE, 'hkg3', 'test.hkg.3@liferay.com', 'Welcome Test HKG 3!', 'Test', '', 'HKG 3', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (951, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'HKG 3', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (952, 1, 950, 11, 950, 0, 0, '952', '/952', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (953, 1, 952, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (954, 1, 952, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (950, 16);

insert into Users_Orgs (userId, organizationId) values (950, 19);
insert into Users_Orgs (userId, organizationId) values (950, 77);

insert into Users_Roles values (950, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (955, 1, timestamp, timestamp, FALSE, 956, 'test', FALSE, FALSE, 'hkg4', 'test.hkg.4@liferay.com', 'Welcome Test HKG 4!', 'Test', '', 'HKG 4', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (956, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'HKG 4', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (957, 1, 955, 11, 955, 0, 0, '957', '/957', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (958, 1, 957, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (959, 1, 957, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (955, 16);

insert into Users_Orgs (userId, organizationId) values (955, 19);
insert into Users_Orgs (userId, organizationId) values (955, 77);

insert into Users_Roles values (955, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (960, 1, timestamp, timestamp, FALSE, 961, 'test', FALSE, FALSE, 'hkg5', 'test.hkg.5@liferay.com', 'Welcome Test HKG 5!', 'Test', '', 'HKG 5', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (961, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'HKG 5', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (962, 1, 960, 11, 960, 0, 0, '962', '/962', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (963, 1, 962, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (964, 1, 962, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (960, 16);

insert into Users_Orgs (userId, organizationId) values (960, 19);
insert into Users_Orgs (userId, organizationId) values (960, 77);

insert into Users_Roles values (960, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (965, 1, timestamp, timestamp, FALSE, 966, 'test', FALSE, FALSE, 'hkg6', 'test.hkg.6@liferay.com', 'Welcome Test HKG 6!', 'Test', '', 'HKG 6', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (966, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'HKG 6', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (967, 1, 965, 11, 965, 0, 0, '967', '/967', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (968, 1, 967, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (969, 1, 967, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (965, 16);

insert into Users_Orgs (userId, organizationId) values (965, 19);
insert into Users_Orgs (userId, organizationId) values (965, 77);

insert into Users_Roles values (965, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (970, 1, timestamp, timestamp, FALSE, 971, 'test', FALSE, FALSE, 'hkg7', 'test.hkg.7@liferay.com', 'Welcome Test HKG 7!', 'Test', '', 'HKG 7', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (971, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'HKG 7', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (972, 1, 970, 11, 970, 0, 0, '972', '/972', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (973, 1, 972, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (974, 1, 972, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (970, 16);

insert into Users_Orgs (userId, organizationId) values (970, 19);
insert into Users_Orgs (userId, organizationId) values (970, 77);

insert into Users_Roles values (970, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (975, 1, timestamp, timestamp, FALSE, 976, 'test', FALSE, FALSE, 'hkg8', 'test.hkg.8@liferay.com', 'Welcome Test HKG 8!', 'Test', '', 'HKG 8', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (976, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'HKG 8', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (977, 1, 975, 11, 975, 0, 0, '977', '/977', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (978, 1, 977, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (979, 1, 977, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (975, 16);

insert into Users_Orgs (userId, organizationId) values (975, 19);
insert into Users_Orgs (userId, organizationId) values (975, 77);

insert into Users_Roles values (975, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (980, 1, timestamp, timestamp, FALSE, 981, 'test', FALSE, FALSE, 'hkg9', 'test.hkg.9@liferay.com', 'Welcome Test HKG 9!', 'Test', '', 'HKG 9', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (981, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'HKG 9', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (982, 1, 980, 11, 980, 0, 0, '982', '/982', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (983, 1, 982, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (984, 1, 982, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (980, 16);

insert into Users_Orgs (userId, organizationId) values (980, 19);
insert into Users_Orgs (userId, organizationId) values (980, 77);

insert into Users_Roles values (980, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (985, 1, timestamp, timestamp, FALSE, 986, 'test', FALSE, FALSE, 'hkg10', 'test.hkg.10@liferay.com', 'Welcome Test HKG 10!', 'Test', '', 'HKG 10', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (986, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'HKG 10', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (987, 1, 985, 11, 985, 0, 0, '987', '/987', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (988, 1, 987, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (989, 1, 987, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (985, 16);

insert into Users_Orgs (userId, organizationId) values (985, 19);
insert into Users_Orgs (userId, organizationId) values (985, 77);

insert into Users_Roles values (985, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (990, 1, timestamp, timestamp, FALSE, 991, 'test', FALSE, FALSE, 'kul1', 'test.kul.1@liferay.com', 'Welcome Test KUL 1!', 'Test', '', 'KUL 1', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (991, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'KUL 1', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (992, 1, 990, 11, 990, 0, 0, '992', '/992', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (993, 1, 992, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (994, 1, 992, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (990, 16);

insert into Users_Orgs (userId, organizationId) values (990, 19);
insert into Users_Orgs (userId, organizationId) values (990, 81);

insert into Users_Roles values (990, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (995, 1, timestamp, timestamp, FALSE, 996, 'test', FALSE, FALSE, 'kul2', 'test.kul.2@liferay.com', 'Welcome Test KUL 2!', 'Test', '', 'KUL 2', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (996, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'KUL 2', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (997, 1, 995, 11, 995, 0, 0, '997', '/997', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (998, 1, 997, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (999, 1, 997, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (995, 16);

insert into Users_Orgs (userId, organizationId) values (995, 19);
insert into Users_Orgs (userId, organizationId) values (995, 81);

insert into Users_Roles values (995, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1000, 1, timestamp, timestamp, FALSE, 1001, 'test', FALSE, FALSE, 'kul3', 'test.kul.3@liferay.com', 'Welcome Test KUL 3!', 'Test', '', 'KUL 3', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1001, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'KUL 3', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1002, 1, 1000, 11, 1000, 0, 0, '1002', '/1002', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1003, 1, 1002, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1004, 1, 1002, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (1000, 16);

insert into Users_Orgs (userId, organizationId) values (1000, 19);
insert into Users_Orgs (userId, organizationId) values (1000, 81);

insert into Users_Roles values (1000, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1005, 1, timestamp, timestamp, FALSE, 1006, 'test', FALSE, FALSE, 'kul4', 'test.kul.4@liferay.com', 'Welcome Test KUL 4!', 'Test', '', 'KUL 4', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1006, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'KUL 4', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1007, 1, 1005, 11, 1005, 0, 0, '1007', '/1007', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1008, 1, 1007, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1009, 1, 1007, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (1005, 16);

insert into Users_Orgs (userId, organizationId) values (1005, 19);
insert into Users_Orgs (userId, organizationId) values (1005, 81);

insert into Users_Roles values (1005, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1010, 1, timestamp, timestamp, FALSE, 1011, 'test', FALSE, FALSE, 'kul5', 'test.kul.5@liferay.com', 'Welcome Test KUL 5!', 'Test', '', 'KUL 5', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1011, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'KUL 5', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1012, 1, 1010, 11, 1010, 0, 0, '1012', '/1012', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1013, 1, 1012, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1014, 1, 1012, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (1010, 16);

insert into Users_Orgs (userId, organizationId) values (1010, 19);
insert into Users_Orgs (userId, organizationId) values (1010, 81);

insert into Users_Roles values (1010, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1015, 1, timestamp, timestamp, FALSE, 1016, 'test', FALSE, FALSE, 'kul6', 'test.kul.6@liferay.com', 'Welcome Test KUL 6!', 'Test', '', 'KUL 6', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1016, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'KUL 6', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1017, 1, 1015, 11, 1015, 0, 0, '1017', '/1017', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1018, 1, 1017, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1019, 1, 1017, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (1015, 16);

insert into Users_Orgs (userId, organizationId) values (1015, 19);
insert into Users_Orgs (userId, organizationId) values (1015, 81);

insert into Users_Roles values (1015, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1020, 1, timestamp, timestamp, FALSE, 1021, 'test', FALSE, FALSE, 'kul7', 'test.kul.7@liferay.com', 'Welcome Test KUL 7!', 'Test', '', 'KUL 7', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1021, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'KUL 7', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1022, 1, 1020, 11, 1020, 0, 0, '1022', '/1022', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1023, 1, 1022, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1024, 1, 1022, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (1020, 16);

insert into Users_Orgs (userId, organizationId) values (1020, 19);
insert into Users_Orgs (userId, organizationId) values (1020, 81);

insert into Users_Roles values (1020, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1025, 1, timestamp, timestamp, FALSE, 1026, 'test', FALSE, FALSE, 'kul8', 'test.kul.8@liferay.com', 'Welcome Test KUL 8!', 'Test', '', 'KUL 8', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1026, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'KUL 8', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1027, 1, 1025, 11, 1025, 0, 0, '1027', '/1027', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1028, 1, 1027, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1029, 1, 1027, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (1025, 16);

insert into Users_Orgs (userId, organizationId) values (1025, 19);
insert into Users_Orgs (userId, organizationId) values (1025, 81);

insert into Users_Roles values (1025, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1030, 1, timestamp, timestamp, FALSE, 1031, 'test', FALSE, FALSE, 'kul9', 'test.kul.9@liferay.com', 'Welcome Test KUL 9!', 'Test', '', 'KUL 9', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1031, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'KUL 9', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1032, 1, 1030, 11, 1030, 0, 0, '1032', '/1032', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1033, 1, 1032, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1034, 1, 1032, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (1030, 16);

insert into Users_Orgs (userId, organizationId) values (1030, 19);
insert into Users_Orgs (userId, organizationId) values (1030, 81);

insert into Users_Roles values (1030, 15);

insert into User_ (userId, companyId, createDate, modifiedDate, defaultUser, contactId, password_, passwordEncrypted, passwordReset, screenName, emailAddress, greeting, firstName, middleName, lastName, loginDate, failedLoginAttempts, agreedToTermsOfUse, active_) values (1035, 1, timestamp, timestamp, FALSE, 1036, 'test', FALSE, FALSE, 'kul10', 'test.kul.10@liferay.com', 'Welcome Test KUL 10!', 'Test', '', 'KUL 10', timestamp, 0, TRUE, TRUE);
insert into Contact_ (contactId, companyId, userId, userName, createDate, modifiedDate, accountId, parentContactId, firstName, middleName, lastName, male, birthday) values (1036, 1, 2, 'Joe Bloggs', timestamp, timestamp, 7, 0, 'Test', '', 'KUL 10', TRUE, '1970-01-01 00:00:00.000000');

insert into Group_ (groupId, companyId, creatorUserId, classNameId, classPK, parentGroupId, liveGroupId, name, friendlyURL, active_) values (1037, 1, 1035, 11, 1035, 0, 0, '1037', '/1037', TRUE);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1038, 1, 1037, TRUE, FALSE, 'classic', '01', 0);
insert into LayoutSet (layoutSetId, companyId, groupId, privateLayout, logo, themeId, colorSchemeId, pageCount) values (1039, 1, 1037, FALSE, FALSE, 'classic', '01', 0);

insert into Users_Groups values (1035, 16);

insert into Users_Orgs (userId, organizationId) values (1035, 19);
insert into Users_Orgs (userId, organizationId) values (1035, 81);

insert into Users_Roles values (1035, 15);












insert into Release_ (releaseId, createDate, modifiedDate, buildNumber, verified) values (1, timestamp, timestamp, 5203, FALSE);


create table QUARTZ_JOB_DETAILS (
	JOB_NAME varchar(80) not null,
	JOB_GROUP varchar(80) not null,
	DESCRIPTION varchar(120) null,
	JOB_CLASS_NAME varchar(128) not null,
	IS_DURABLE boolean not null,
	IS_VOLATILE boolean not null,
	IS_STATEFUL boolean not null,
	REQUESTS_RECOVERY boolean not null,
	JOB_DATA long byte null,
	primary key (JOB_NAME, JOB_GROUP)
);

create table QUARTZ_JOB_LISTENERS (
	JOB_NAME varchar(80) not null,
	JOB_GROUP varchar(80) not null,
	JOB_LISTENER varchar(80) not null,
	primary key (JOB_NAME, JOB_GROUP, JOB_LISTENER)
);

create table QUARTZ_TRIGGERS (
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	JOB_NAME varchar(80) not null,
	JOB_GROUP varchar(80) not null,
	IS_VOLATILE boolean not null,
	DESCRIPTION varchar(120) null,
	NEXT_FIRE_TIME bigint null,
	PREV_FIRE_TIME bigint null,
	PRIORITY int null,
	TRIGGER_STATE varchar(16) not null,
	TRIGGER_TYPE varchar(8) not null,
	START_TIME bigint not null,
	END_TIME bigint null,
	CALENDAR_NAME varchar(80) null,
	MISFIRE_INSTR int null,
	JOB_DATA long byte null,
	primary key (TRIGGER_NAME, TRIGGER_GROUP)
);

create table QUARTZ_SIMPLE_TRIGGERS (
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	REPEAT_COUNT bigint not null,
	REPEAT_INTERVAL bigint not null,
	TIMES_TRIGGERED bigint not null,
	primary key (TRIGGER_NAME, TRIGGER_GROUP)
);

create table QUARTZ_CRON_TRIGGERS (
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	CRON_EXPRESSION varchar(80) not null,
	TIME_ZONE_ID varchar(80),
	primary key (TRIGGER_NAME, TRIGGER_GROUP)
);

create table QUARTZ_BLOB_TRIGGERS (
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	BLOB_DATA long byte null,
	primary key (TRIGGER_NAME, TRIGGER_GROUP)
);

create table QUARTZ_TRIGGER_LISTENERS (
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	TRIGGER_LISTENER varchar(80) not null,
	primary key (TRIGGER_NAME, TRIGGER_GROUP, TRIGGER_LISTENER)
);

create table QUARTZ_CALENDARS (
	CALENDAR_NAME varchar(80) not null primary key,
	CALENDAR long byte not null
);

create table QUARTZ_PAUSED_TRIGGER_GRPS (
	TRIGGER_GROUP varchar(80) not null primary key
);

create table QUARTZ_FIRED_TRIGGERS (
	ENTRY_ID varchar(95) not null primary key,
	TRIGGER_NAME varchar(80) not null,
	TRIGGER_GROUP varchar(80) not null,
	IS_VOLATILE boolean not null,
	INSTANCE_NAME varchar(80) not null,
	FIRED_TIME bigint not null,
	PRIORITY int not null,
	STATE varchar(16) not null,
	JOB_NAME varchar(80) null,
	JOB_GROUP varchar(80) null,
	IS_STATEFUL boolean null,
	REQUESTS_RECOVERY boolean null
);

create table QUARTZ_SCHEDULER_STATE (
	INSTANCE_NAME varchar(80) not null primary key,
	LAST_CHECKIN_TIME bigint not null,
	CHECKIN_INTERVAL bigint not null
);

create table QUARTZ_LOCKS (
	LOCK_NAME varchar(40) not null primary key
);

commit;

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



commit;
