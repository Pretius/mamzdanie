alter table Company add homeURL varchar2(4000) null;

alter table ExpandoColumn add companyId number(30,0);
alter table ExpandoColumn add defaultData varchar2(4000) null;
alter table ExpandoColumn add typeSettings clob null;

alter table ExpandoRow add companyId number(30,0);

alter table ExpandoTable add companyId number(30,0);

alter table ExpandoValue add companyId number(30,0);

alter table JournalArticleImage add elInstanceId varchar2(75) null;

alter table JournalStructure add parentStructureId varchar2(75);

create table MBMailingList (
	uuid_ varchar2(75) null,
	mailingListId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName varchar2(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	categoryId number(30,0),
	emailAddress varchar2(75) null,
	inProtocol varchar2(75) null,
	inServerName varchar2(75) null,
	inServerPort number(30,0),
	inUseSSL number(1, 0),
	inUserName varchar2(75) null,
	inPassword varchar2(75) null,
	inReadInterval number(30,0),
	outEmailAddress varchar2(75) null,
	outCustom number(1, 0),
	outServerName varchar2(75) null,
	outServerPort number(30,0),
	outUseSSL number(1, 0),
	outUserName varchar2(75) null,
	outPassword varchar2(75) null,
	active_ number(1, 0)
);

alter table Organization_ add type_ varchar2(75);

alter table Role_ add title varchar2(4000) null;
alter table Role_ add subtype varchar2(75);

alter table TagsAsset add visible number(1, 0);

commit;

update TagsAsset set visible = 1;

alter table TagsEntry add groupId number(30,0);
alter table TagsEntry add parentEntryId number(30,0);
alter table TagsEntry add vocabularyId number(30,0);

commit;

update TagsEntry set groupId = 0;
update TagsEntry set parentEntryId = 0;
update TagsEntry set vocabularyId = 0;

create table TagsVocabulary (
	vocabularyId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName varchar2(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar2(75) null,
	description varchar2(75) null,
	folksonomy number(1, 0)
);

alter table User_ add reminderQueryQuestion varchar2(4000) null;
alter table User_ add reminderQueryAnswer varchar2(4000) null;

create table WSRPConfiguredProducer (
	configuredProducerId number(30,0) not null primary key,
	name varchar2(75) null,
	portalId varchar2(75) null,
	namespace varchar2(75) null,
	producerURL varchar2(256) null,
	producerVersion varchar2(75) null,
	producerMarkupURL varchar2(256) null,
	status number(30,0),
	registrationData clob null,
	registrationContext clob null,
	serviceDescription clob null,
	userCategoryMapping clob null,
	customUserProfile clob null,
	identityPropagationType varchar2(75) null,
	lifetimeTerminationTime varchar2(75) null,
	sdLastModified number(30,0),
	entityVersion number(30,0)
);

create table WSRPConsumerRegistration (
	consumerRegistrationId number(30,0) not null primary key,
	consumerName varchar2(100) null,
	status number(1, 0),
	registrationHandle varchar2(75) null,
	registrationData clob null,
	lifetimeTerminationTime varchar2(75) null,
	producerKey varchar2(75) null
);

create table WSRPPortlet (
	portletId number(30,0) not null primary key,
	name varchar2(75) null,
	channelName varchar2(75) null,
	title varchar2(75) null,
	shortTitle varchar2(75) null,
	displayName varchar2(75) null,
	keywords varchar2(75) null,
	status number(30,0),
	producerEntityId varchar2(75) null,
	consumerId varchar2(75) null,
	portletHandle varchar2(75) null,
	mimeTypes varchar2(4000) null
);

create table WSRPProducer (
	producerId number(30,0) not null primary key,
	portalId varchar2(75) null,
	status number(1, 0),
	namespace varchar2(75) null,
	instanceName varchar2(75) null,
	requiresRegistration number(1, 0),
	supportsInbandRegistration number(1, 0),
	version varchar2(75) null,
	offeredPortlets varchar2(4000) null,
	producerProfileMap varchar2(75) null,
	registrationProperties varchar2(4000) null,
	registrationValidatorClass varchar2(200) null
);
