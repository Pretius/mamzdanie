create index IX_93D5AD4E on Address (companyId)
go
create index IX_ABD7DAC0 on Address (companyId, classNameId)
go
create index IX_71CB1123 on Address (companyId, classNameId, classPK)
go
create index IX_5BC8B0D4 on Address (userId)
go

create index IX_6EDB9600 on AnnouncementsDelivery (userId)
go
create unique index IX_BA4413D5 on AnnouncementsDelivery (userId, type_)
go

create index IX_A6EF0B81 on AnnouncementsEntry (classNameId, classPK)
go
create index IX_D49C2E66 on AnnouncementsEntry (userId)
go
create index IX_1AFBDE08 on AnnouncementsEntry (uuid_)
go

create index IX_9C7EB9F on AnnouncementsFlag (entryId)
go
create unique index IX_4539A99C on AnnouncementsFlag (userId, entryId, value)
go

create index IX_72EF6041 on BlogsEntry (companyId)
go
create index IX_81A50303 on BlogsEntry (groupId)
go
create unique index IX_DB780A20 on BlogsEntry (groupId, urlTitle)
go
create index IX_C07CA83D on BlogsEntry (groupId, userId)
go
create index IX_69157A4D on BlogsEntry (uuid_)
go
create unique index IX_1B1040FD on BlogsEntry (uuid_, groupId)
go

create index IX_90CDA39A on BlogsStatsUser (companyId, entryCount)
go
create index IX_43840EEB on BlogsStatsUser (groupId)
go
create index IX_28C78D5C on BlogsStatsUser (groupId, entryCount)
go
create unique index IX_82254C25 on BlogsStatsUser (groupId, userId)
go
create index IX_BB51F1D9 on BlogsStatsUser (userId)
go

create index IX_443BDC38 on BookmarksEntry (folderId)
go
create index IX_E52FF7EF on BookmarksEntry (groupId)
go
create index IX_E2E9F129 on BookmarksEntry (groupId, userId)
go
create index IX_B670BA39 on BookmarksEntry (uuid_)
go
create unique index IX_EAA02A91 on BookmarksEntry (uuid_, groupId)
go

create index IX_2ABA25D7 on BookmarksFolder (companyId)
go
create index IX_7F703619 on BookmarksFolder (groupId)
go
create index IX_967799C0 on BookmarksFolder (groupId, parentFolderId)
go
create index IX_451E7AE3 on BookmarksFolder (uuid_)
go
create unique index IX_DC2F8927 on BookmarksFolder (uuid_, groupId)
go

create unique index IX_E7B95510 on BrowserTracker (userId)
go

create index IX_D6FD9496 on CalEvent (companyId)
go
create index IX_12EE4898 on CalEvent (groupId)
go
create index IX_FCD7C63D on CalEvent (groupId, type_)
go
create index IX_F6006202 on CalEvent (remindBy)
go
create index IX_C1AD2122 on CalEvent (uuid_)
go
create unique index IX_5CCE79C8 on CalEvent (uuid_, groupId)
go

create unique index IX_B27A301F on ClassName_ (value)
go

create index IX_38EFE3FD on Company (logoId)
go
create index IX_12566EC2 on Company (mx)
go
create unique index IX_975996C0 on Company (virtualHost)
go
create unique index IX_EC00543C on Company (webId)
go

create index IX_66D496A3 on Contact_ (companyId)
go

create unique index IX_717B97E1 on Country (a2)
go
create unique index IX_717B9BA2 on Country (a3)
go
create unique index IX_19DA007B on Country (name)
go

create index IX_4CB1B2B4 on DLFileEntry (companyId)
go
create index IX_24A846D1 on DLFileEntry (folderId)
go
create unique index IX_8F6C75D0 on DLFileEntry (folderId, name)
go
create index IX_A9951F17 on DLFileEntry (folderId, title)
go
create index IX_F4AF5636 on DLFileEntry (groupId)
go
create index IX_43261870 on DLFileEntry (groupId, userId)
go
create index IX_64F0FE40 on DLFileEntry (uuid_)
go
create unique index IX_BC2E7E6A on DLFileEntry (uuid_, groupId)
go

create unique index IX_CE705D48 on DLFileRank (companyId, userId, folderId, name)
go
create index IX_40B56512 on DLFileRank (folderId, name)
go
create index IX_BAFB116E on DLFileRank (groupId, userId)
go
create index IX_EED06670 on DLFileRank (userId)
go

create index IX_E56EC6AD on DLFileShortcut (folderId)
go
create index IX_CA2708A2 on DLFileShortcut (toFolderId, toName)
go
create index IX_4831EBE4 on DLFileShortcut (uuid_)
go
create unique index IX_FDB4A946 on DLFileShortcut (uuid_, groupId)
go

create index IX_9CD91DB6 on DLFileVersion (folderId, name)
go
create unique index IX_6C5E6512 on DLFileVersion (folderId, name, version)
go

create index IX_A74DB14C on DLFolder (companyId)
go
create index IX_F2EA1ACE on DLFolder (groupId)
go
create index IX_49C37475 on DLFolder (groupId, parentFolderId)
go
create unique index IX_902FD874 on DLFolder (groupId, parentFolderId, name)
go
create index IX_51556082 on DLFolder (parentFolderId, name)
go
create index IX_CBC408D8 on DLFolder (uuid_)
go
create unique index IX_3CC1DED2 on DLFolder (uuid_, groupId)
go

create index IX_1BB072CA on EmailAddress (companyId)
go
create index IX_49D2DEC4 on EmailAddress (companyId, classNameId)
go
create index IX_551A519F on EmailAddress (companyId, classNameId, classPK)
go
create index IX_7B43CD8 on EmailAddress (userId)
go

create index IX_A8C0CBE8 on ExpandoColumn (tableId)
go
create unique index IX_FEFC8DA7 on ExpandoColumn (tableId, name)
go

create index IX_D3F5D7AE on ExpandoRow (tableId)
go
create unique index IX_81EFBFF5 on ExpandoRow (tableId, classPK)
go

create index IX_B5AE8A85 on ExpandoTable (companyId, classNameId)
go
create unique index IX_37562284 on ExpandoTable (companyId, classNameId, name)
go

create index IX_B29FEF17 on ExpandoValue (classNameId, classPK)
go
create index IX_F7DD0987 on ExpandoValue (columnId)
go
create unique index IX_9DDD21E5 on ExpandoValue (columnId, rowId_)
go
create index IX_9112A7A0 on ExpandoValue (rowId_)
go
create index IX_F0566A77 on ExpandoValue (tableId)
go
create index IX_1BD3F4C on ExpandoValue (tableId, classPK)
go
create index IX_CA9AFB7C on ExpandoValue (tableId, columnId)
go
create unique index IX_D27B03E7 on ExpandoValue (tableId, columnId, classPK)
go
create index IX_B71E92D5 on ExpandoValue (tableId, rowId_)
go

create unique index IX_D0D5E397 on Group_ (companyId, classNameId, classPK)
go
create unique index IX_5DE0BE11 on Group_ (companyId, classNameId, liveGroupId, name)
go
create unique index IX_5BDDB872 on Group_ (companyId, friendlyURL)
go
create unique index IX_BBCA55B on Group_ (companyId, liveGroupId, name)
go
create unique index IX_5AA68501 on Group_ (companyId, name)
go
create index IX_16218A38 on Group_ (liveGroupId)
go

create index IX_75267DCA on Groups_Orgs (groupId)
go
create index IX_6BBB7682 on Groups_Orgs (organizationId)
go

create index IX_C48736B on Groups_Permissions (groupId)
go
create index IX_EC97689D on Groups_Permissions (permissionId)
go

create index IX_84471FD2 on Groups_Roles (groupId)
go
create index IX_3103EF3D on Groups_Roles (roleId)
go

create index IX_31FB749A on Groups_UserGroups (groupId)
go
create index IX_3B69160F on Groups_UserGroups (userGroupId)
go

create index IX_60214CF6 on IGFolder (companyId)
go
create index IX_206498F8 on IGFolder (groupId)
go
create index IX_1A605E9F on IGFolder (groupId, parentFolderId)
go
create unique index IX_9BBAFB1E on IGFolder (groupId, parentFolderId, name)
go
create index IX_F73C0982 on IGFolder (uuid_)
go
create unique index IX_B10EFD68 on IGFolder (uuid_, groupId)
go

create index IX_E597322D on IGImage (custom1ImageId)
go
create index IX_D9E0A34C on IGImage (custom2ImageId)
go
create index IX_4438CA80 on IGImage (folderId)
go
create index IX_BCB13A3F on IGImage (folderId, name)
go
create index IX_63820A7 on IGImage (groupId)
go
create index IX_BE79E1E1 on IGImage (groupId, userId)
go
create index IX_64F0B572 on IGImage (largeImageId)
go
create index IX_D3D32126 on IGImage (smallImageId)
go
create index IX_265BB0F1 on IGImage (uuid_)
go
create unique index IX_E97342D9 on IGImage (uuid_, groupId)
go

create index IX_6A925A4D on Image (size_)
go

create index IX_DFF98523 on JournalArticle (companyId)
go
create index IX_9356F865 on JournalArticle (groupId)
go
create index IX_68C0F69C on JournalArticle (groupId, articleId)
go
create unique index IX_85C52EEC on JournalArticle (groupId, articleId, version)
go
create index IX_2E207659 on JournalArticle (groupId, structureId)
go
create index IX_8DEAE14E on JournalArticle (groupId, templateId)
go
create index IX_22882D02 on JournalArticle (groupId, urlTitle)
go
create index IX_EF9B7028 on JournalArticle (smallImageId)
go
create index IX_F029602F on JournalArticle (uuid_)
go
create unique index IX_3463D95B on JournalArticle (uuid_, groupId)
go

create index IX_3B51BB68 on JournalArticleImage (groupId)
go
create index IX_158B526F on JournalArticleImage (groupId, articleId, version)
go
create unique index IX_103D6207 on JournalArticleImage (groupId, articleId, version, elInstanceId, elName, languageId)
go

create index IX_F8433677 on JournalArticleResource (groupId)
go
create unique index IX_88DF994A on JournalArticleResource (groupId, articleId)
go

create index IX_6838E427 on JournalContentSearch (groupId, articleId)
go

create index IX_35A2DB2F on JournalFeed (groupId)
go
create unique index IX_65576CBC on JournalFeed (groupId, feedId)
go
create index IX_50C36D79 on JournalFeed (uuid_)
go
create unique index IX_39031F51 on JournalFeed (uuid_, groupId)
go

create index IX_B97F5608 on JournalStructure (groupId)
go
create index IX_CA0BD48C on JournalStructure (groupId, parentStructureId)
go
create unique index IX_AB6E9996 on JournalStructure (groupId, structureId)
go
create index IX_8831E4FC on JournalStructure (structureId)
go
create index IX_6702CA92 on JournalStructure (uuid_)
go
create unique index IX_42E86E58 on JournalStructure (uuid_, groupId)
go

create index IX_77923653 on JournalTemplate (groupId)
go
create index IX_1701CB2B on JournalTemplate (groupId, structureId)
go
create unique index IX_E802AA3C on JournalTemplate (groupId, templateId)
go
create index IX_25FFB6FA on JournalTemplate (smallImageId)
go
create index IX_1B12CA20 on JournalTemplate (templateId)
go
create index IX_2857419D on JournalTemplate (uuid_)
go
create unique index IX_62D1B3AD on JournalTemplate (uuid_, groupId)
go

create index IX_C7FBC998 on Layout (companyId)
go
create index IX_FAD05595 on Layout (dlFolderId)
go
create index IX_C099D61A on Layout (groupId)
go
create index IX_23922F7D on Layout (iconImageId)
go

create index IX_A40B8BEC on LayoutSet (groupId)
go
create index IX_5ABC2905 on LayoutSet (virtualHost)
go

create index IX_2932DD37 on ListType (type_)
go

create index IX_69951A25 on MBBan (banUserId)
go
create index IX_5C3FF12A on MBBan (groupId)
go
create unique index IX_8ABC4E3B on MBBan (groupId, banUserId)
go
create index IX_48814BBA on MBBan (userId)
go

create index IX_BC735DCF on MBCategory (companyId)
go
create index IX_BB870C11 on MBCategory (groupId)
go
create index IX_ED292508 on MBCategory (groupId, parentCategoryId)
go
create index IX_C2626EDB on MBCategory (uuid_)
go
create unique index IX_F7D28C2F on MBCategory (uuid_, groupId)
go

create index IX_79D0120B on MBDiscussion (classNameId)
go
create unique index IX_33A4DE38 on MBDiscussion (classNameId, classPK)
go
create unique index IX_B5CA2DC on MBDiscussion (threadId)
go

create unique index IX_ADA16FE7 on MBMailingList (categoryId)
go
create index IX_4115EC7A on MBMailingList (uuid_)
go
create unique index IX_E858F170 on MBMailingList (uuid_, groupId)
go

create index IX_3C865EE5 on MBMessage (categoryId)
go
create index IX_138C7F1E on MBMessage (categoryId, threadId)
go
create index IX_51A8D44D on MBMessage (classNameId, classPK)
go
create index IX_B1432D30 on MBMessage (companyId)
go
create index IX_5B153FB2 on MBMessage (groupId)
go
create index IX_8EB8C5EC on MBMessage (groupId, userId)
go
create index IX_75B95071 on MBMessage (threadId)
go
create index IX_A7038CD7 on MBMessage (threadId, parentMessageId)
go
create index IX_C57B16BC on MBMessage (uuid_)
go
create unique index IX_8D12316E on MBMessage (uuid_, groupId)
go

create index IX_D180D4AE on MBMessageFlag (messageId)
go
create index IX_A6973A8E on MBMessageFlag (messageId, flag)
go
create index IX_C1C9A8FD on MBMessageFlag (threadId)
go
create index IX_3CFD579D on MBMessageFlag (threadId, flag)
go
create index IX_7B2917BE on MBMessageFlag (userId)
go
create unique index IX_E9EB6194 on MBMessageFlag (userId, messageId, flag)
go
create index IX_2EA537D7 on MBMessageFlag (userId, threadId, flag)
go

create index IX_A00A898F on MBStatsUser (groupId)
go
create index IX_FAB5A88B on MBStatsUser (groupId, messageCount)
go
create unique index IX_9168E2C9 on MBStatsUser (groupId, userId)
go
create index IX_847F92B5 on MBStatsUser (userId)
go

create index IX_CB854772 on MBThread (categoryId)
go
create index IX_19D8B60A on MBThread (categoryId, lastPostDate)
go
create index IX_95C0EA45 on MBThread (groupId)
go

create index IX_8A1CC4B on MembershipRequest (groupId)
go
create index IX_C28C72EC on MembershipRequest (groupId, statusId)
go
create index IX_66D70879 on MembershipRequest (userId)
go

create index IX_A425F71A on OrgGroupPermission (groupId)
go
create index IX_6C53DA4E on OrgGroupPermission (permissionId)
go

create index IX_4A527DD3 on OrgGroupRole (groupId)
go
create index IX_AB044D1C on OrgGroupRole (roleId)
go

create index IX_6AF0D434 on OrgLabor (organizationId)
go

create index IX_834BCEB6 on Organization_ (companyId)
go
create unique index IX_E301BDF5 on Organization_ (companyId, name)
go
create index IX_418E4522 on Organization_ (companyId, parentOrganizationId)
go

create unique index IX_3FBFA9F4 on PasswordPolicy (companyId, name)
go

create index IX_C3A17327 on PasswordPolicyRel (classNameId, classPK)
go
create index IX_ED7CF243 on PasswordPolicyRel (passwordPolicyId, classNameId, classPK)
go

create index IX_326F75BD on PasswordTracker (userId)
go

create unique index IX_4D19C2B8 on Permission_ (actionId, resourceId)
go
create index IX_F090C113 on Permission_ (resourceId)
go

create index IX_9F704A14 on Phone (companyId)
go
create index IX_A2E4AFBA on Phone (companyId, classNameId)
go
create index IX_9A53569 on Phone (companyId, classNameId, classPK)
go
create index IX_F202B9CE on Phone (userId)
go

create index IX_B9746445 on PluginSetting (companyId)
go
create unique index IX_7171B2E8 on PluginSetting (companyId, pluginId, pluginType)
go

create index IX_EC370F10 on PollsChoice (questionId)
go
create unique index IX_D76DD2CF on PollsChoice (questionId, name)
go
create index IX_6660B399 on PollsChoice (uuid_)
go

create index IX_9FF342EA on PollsQuestion (groupId)
go
create index IX_51F087F4 on PollsQuestion (uuid_)
go
create unique index IX_F3C9F36 on PollsQuestion (uuid_, groupId)
go

create index IX_D5DF7B54 on PollsVote (choiceId)
go
create index IX_12112599 on PollsVote (questionId)
go
create unique index IX_1BBFD4D3 on PollsVote (questionId, userId)
go

create index IX_80CC9508 on Portlet (companyId)
go
create unique index IX_12B5E51D on Portlet (companyId, portletId)
go

create index IX_96BDD537 on PortletItem (groupId, classNameId)
go
create index IX_D699243F on PortletItem (groupId, name, portletId, classNameId)
go
create index IX_2C61314E on PortletItem (groupId, portletId)
go
create index IX_E922D6C0 on PortletItem (groupId, portletId, classNameId)
go
create index IX_8E71167F on PortletItem (groupId, portletId, classNameId, name)
go
create index IX_33B8CE8D on PortletItem (groupId, portletId, name)
go

create index IX_E4F13E6E on PortletPreferences (ownerId, ownerType, plid)
go
create unique index IX_C7057FF7 on PortletPreferences (ownerId, ownerType, plid, portletId)
go
create index IX_F15C1C4F on PortletPreferences (plid)
go
create index IX_D340DB76 on PortletPreferences (plid, portletId)
go

create index IX_16184D57 on RatingsEntry (classNameId, classPK)
go
create unique index IX_B47E3C11 on RatingsEntry (userId, classNameId, classPK)
go

create unique index IX_A6E99284 on RatingsStats (classNameId, classPK)
go

create index IX_16D87CA7 on Region (countryId)
go

create index IX_81F2DB09 on ResourceAction (name)
go
create unique index IX_EDB9986E on ResourceAction (name, actionId)
go

create index IX_717FDD47 on ResourceCode (companyId)
go
create unique index IX_A32C097E on ResourceCode (companyId, name, scope)
go
create index IX_AACAFF40 on ResourceCode (name)
go

create index IX_60B99860 on ResourcePermission (companyId, name, scope)
go
create index IX_2200AA69 on ResourcePermission (companyId, name, scope, primKey)
go
create unique index IX_8D83D0CE on ResourcePermission (companyId, name, scope, primKey, roleId)
go
create index IX_A37A0588 on ResourcePermission (roleId)
go

create index IX_2578FBD3 on Resource_ (codeId)
go
create unique index IX_67DE7856 on Resource_ (codeId, primKey)
go

create index IX_449A10B9 on Role_ (companyId)
go
create unique index IX_A88E424E on Role_ (companyId, classNameId, classPK)
go
create unique index IX_EBC931B8 on Role_ (companyId, name)
go
create index IX_CBE204 on Role_ (type_, subtype)
go

create index IX_7A3619C6 on Roles_Permissions (permissionId)
go
create index IX_E04E486D on Roles_Permissions (roleId)
go

create index IX_3BB93ECA on SCFrameworkVersi_SCProductVers (frameworkVersionId)
go
create index IX_E8D33FF9 on SCFrameworkVersi_SCProductVers (productVersionId)
go

create index IX_C98C0D78 on SCFrameworkVersion (companyId)
go
create index IX_272991FA on SCFrameworkVersion (groupId)
go


create index IX_27006638 on SCLicenses_SCProductEntries (licenseId)
go
create index IX_D7710A66 on SCLicenses_SCProductEntries (productEntryId)
go

create index IX_5D25244F on SCProductEntry (companyId)
go
create index IX_72F87291 on SCProductEntry (groupId)
go
create index IX_98E6A9CB on SCProductEntry (groupId, userId)
go
create index IX_7311E812 on SCProductEntry (repoGroupId, repoArtifactId)
go

create index IX_AE8224CC on SCProductScreenshot (fullImageId)
go
create index IX_467956FD on SCProductScreenshot (productEntryId)
go
create index IX_DA913A55 on SCProductScreenshot (productEntryId, priority)
go
create index IX_6C572DAC on SCProductScreenshot (thumbnailId)
go

create index IX_7020130F on SCProductVersion (directDownloadURL)
go
create index IX_8377A211 on SCProductVersion (productEntryId)
go

create index IX_7338606F on ServiceComponent (buildNamespace)
go
create unique index IX_4F0315B8 on ServiceComponent (buildNamespace, buildNumber)
go

create index IX_DA5F4359 on Shard (classNameId, classPK)
go
create index IX_941BA8C3 on Shard (name)
go

create index IX_C28B41DC on ShoppingCart (groupId)
go
create unique index IX_FC46FE16 on ShoppingCart (groupId, userId)
go
create index IX_54101CC8 on ShoppingCart (userId)
go

create index IX_5F615D3E on ShoppingCategory (groupId)
go
create index IX_1E6464F5 on ShoppingCategory (groupId, parentCategoryId)
go

create unique index IX_DC60CFAE on ShoppingCoupon (code_)
go
create index IX_3251AF16 on ShoppingCoupon (groupId)
go

create index IX_C8EACF2E on ShoppingItem (categoryId)
go
create unique index IX_1C717CA6 on ShoppingItem (companyId, sku)
go
create index IX_903DC750 on ShoppingItem (largeImageId)
go
create index IX_D217AB30 on ShoppingItem (mediumImageId)
go
create index IX_FF203304 on ShoppingItem (smallImageId)
go

create index IX_6D5F9B87 on ShoppingItemField (itemId)
go

create index IX_EA6FD516 on ShoppingItemPrice (itemId)
go

create index IX_1D15553E on ShoppingOrder (groupId)
go
create index IX_119B5630 on ShoppingOrder (groupId, userId, ppPaymentStatus)
go
create unique index IX_D7D6E87A on ShoppingOrder (number_)
go
create index IX_F474FD89 on ShoppingOrder (ppTxnId)
go

create index IX_B5F82C7A on ShoppingOrderItem (orderId)
go

create index IX_82E39A0C on SocialActivity (classNameId)
go
create index IX_A853C757 on SocialActivity (classNameId, classPK)
go
create index IX_64B1BC66 on SocialActivity (companyId)
go
create index IX_2A2468 on SocialActivity (groupId)
go
create unique index IX_8F32DEC9 on SocialActivity (groupId, userId, createDate, classNameId, classPK, type_, receiverUserId)
go
create index IX_1271F25F on SocialActivity (mirrorActivityId)
go
create index IX_1F00C374 on SocialActivity (mirrorActivityId, classNameId, classPK)
go
create index IX_121CA3CB on SocialActivity (receiverUserId)
go
create index IX_3504B8BC on SocialActivity (userId)
go

create index IX_61171E99 on SocialRelation (companyId)
go
create index IX_95135D1C on SocialRelation (companyId, type_)
go
create index IX_C31A64C6 on SocialRelation (type_)
go
create index IX_5A40CDCC on SocialRelation (userId1)
go
create index IX_4B52BE89 on SocialRelation (userId1, type_)
go
create unique index IX_12A92145 on SocialRelation (userId1, userId2, type_)
go
create index IX_5A40D18D on SocialRelation (userId2)
go
create index IX_3F9C2FA8 on SocialRelation (userId2, type_)
go
create index IX_F0CA24A5 on SocialRelation (uuid_)
go

create index IX_D3425487 on SocialRequest (classNameId, classPK, type_, receiverUserId, status)
go
create index IX_A90FE5A0 on SocialRequest (companyId)
go
create index IX_32292ED1 on SocialRequest (receiverUserId)
go
create index IX_D9380CB7 on SocialRequest (receiverUserId, status)
go
create index IX_80F7A9C2 on SocialRequest (userId)
go
create unique index IX_36A90CA7 on SocialRequest (userId, classNameId, classPK, type_, receiverUserId)
go
create index IX_CC86A444 on SocialRequest (userId, classNameId, classPK, type_, status)
go
create index IX_AB5906A8 on SocialRequest (userId, status)
go
create index IX_49D5872C on SocialRequest (uuid_)
go
create unique index IX_4F973EFE on SocialRequest (uuid_, groupId)
go

create index IX_786D171A on Subscription (companyId, classNameId, classPK)
go
create unique index IX_2E1A92D4 on Subscription (companyId, userId, classNameId, classPK)
go
create index IX_54243AFD on Subscription (userId)
go
create index IX_E8F34171 on Subscription (userId, classNameId)
go

create unique index IX_1AB6D6D2 on TagsAsset (classNameId, classPK)
go
create index IX_AB3D8BCB on TagsAsset (companyId)
go

create index IX_B22F3A1 on TagsAssets_TagsEntries (assetId)
go
create index IX_A02A8023 on TagsAssets_TagsEntries (entryId)
go

create index IX_EE55ED49 on TagsEntry (parentEntryId, vocabularyId)
go
create index IX_28E8954 on TagsEntry (vocabularyId)
go

create index IX_C134234 on TagsProperty (companyId)
go
create index IX_EB974D08 on TagsProperty (companyId, key_)
go
create index IX_5200A629 on TagsProperty (entryId)
go
create unique index IX_F505253D on TagsProperty (entryId, key_)
go

create unique index IX_F9E51044 on TagsVocabulary (groupId, name)
go

create unique index IX_181A4A1B on TasksProposal (classNameId, classPK)
go
create index IX_7FB27324 on TasksProposal (groupId)
go
create index IX_6EEC675E on TasksProposal (groupId, userId)
go

create index IX_4D0C7F8D on TasksReview (proposalId)
go
create index IX_70AFEA01 on TasksReview (proposalId, stage)
go
create index IX_36F512E6 on TasksReview (userId)
go
create unique index IX_5C6BE4C7 on TasksReview (userId, proposalId)
go

create index IX_524FEFCE on UserGroup (companyId)
go
create unique index IX_23EAD0D on UserGroup (companyId, name)
go
create index IX_69771487 on UserGroup (companyId, parentUserGroupId)
go

create index IX_1B988D7A on UserGroupRole (groupId)
go
create index IX_871412DF on UserGroupRole (groupId, roleId)
go
create index IX_887A2C95 on UserGroupRole (roleId)
go
create index IX_887BE56A on UserGroupRole (userId)
go
create index IX_4D040680 on UserGroupRole (userId, groupId)
go

create unique index IX_41A32E0D on UserIdMapper (type_, externalUserId)
go
create index IX_E60EA987 on UserIdMapper (userId)
go
create unique index IX_D1C44A6E on UserIdMapper (userId, type_)
go

create index IX_29BA1CF5 on UserTracker (companyId)
go
create index IX_46B0AE8E on UserTracker (sessionId)
go
create index IX_E4EFBA8D on UserTracker (userId)
go

create index IX_14D8BCC0 on UserTrackerPath (userTrackerId)
go

create index IX_3A1E834E on User_ (companyId)
go
create unique index IX_615E9F7A on User_ (companyId, emailAddress)
go
create unique index IX_C5806019 on User_ (companyId, screenName)
go
create unique index IX_9782AD88 on User_ (companyId, userId)
go
create unique index IX_5ADBE171 on User_ (contactId)
go
create index IX_762F63C6 on User_ (emailAddress)
go
create index IX_A9ED7DD3 on User_ (openId)
go
create index IX_A18034A4 on User_ (portraitId)
go
create index IX_E0422BDA on User_ (uuid_)
go

create index IX_C4F9E699 on Users_Groups (groupId)
go
create index IX_F10B6C6B on Users_Groups (userId)
go

create index IX_7EF4EC0E on Users_Orgs (organizationId)
go
create index IX_FB646CA6 on Users_Orgs (userId)
go

create index IX_8AE58A91 on Users_Permissions (permissionId)
go
create index IX_C26AA64D on Users_Permissions (userId)
go

create index IX_C19E5F31 on Users_Roles (roleId)
go
create index IX_C1A01806 on Users_Roles (userId)
go

create index IX_66FF2503 on Users_UserGroups (userGroupId)
go
create index IX_BE8102D6 on Users_UserGroups (userId)
go

create unique index IX_97DFA146 on WebDAVProps (classNameId, classPK)
go

create index IX_96F07007 on Website (companyId)
go
create index IX_4F0F0CA7 on Website (companyId, classNameId)
go
create index IX_F960131C on Website (companyId, classNameId, classPK)
go
create index IX_F75690BB on Website (userId)
go

create index IX_5D6FE3F0 on WikiNode (companyId)
go
create index IX_B480A672 on WikiNode (groupId)
go
create unique index IX_920CD8B1 on WikiNode (groupId, name)
go
create index IX_6C112D7C on WikiNode (uuid_)
go
create unique index IX_7609B2AE on WikiNode (uuid_, groupId)
go

create index IX_A2001730 on WikiPage (format)
go
create index IX_C8A9C476 on WikiPage (nodeId)
go
create index IX_46EEF3C8 on WikiPage (nodeId, parentTitle)
go
create index IX_1ECC7656 on WikiPage (nodeId, redirectTitle)
go
create index IX_997EEDD2 on WikiPage (nodeId, title)
go
create unique index IX_3D4AF476 on WikiPage (nodeId, title, version)
go
create index IX_9C0E478F on WikiPage (uuid_)
go
create unique index IX_899D3DFB on WikiPage (uuid_, groupId)
go

create unique index IX_21277664 on WikiPageResource (nodeId, title)
go
