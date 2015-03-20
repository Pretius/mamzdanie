-- Before you make a alter table on mz_user_addon table you have to drop mz_thread_detail view.

drop view mz_thread_detail;

alter table mz_user_addon add column description varchar(255);
