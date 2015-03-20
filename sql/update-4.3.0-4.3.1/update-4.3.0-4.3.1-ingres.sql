alter table BookmarksEntry add priority integer;

alter table Layout add description varchar(1000) null;
alter table Layout add dlFolderId bigint;

alter table Organization_ add location tinyint;

commit;\g

update Organization_ set location = 0;
