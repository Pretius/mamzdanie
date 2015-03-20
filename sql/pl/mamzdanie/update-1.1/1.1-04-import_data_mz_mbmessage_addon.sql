
-- Import data from old structure into the new one.
--
/* Important!
   Make sure if on the target db plpgsql language is installed.
   If you want to check, run below command:
   cmd:> createlang -d [dbname] -U [user] -l
   Result should be like this:
   
	Procedural Languages
	  Name   | Trusted? 
	---------+----------
	 plpgsql | yes
   
   If not, then you have to run below script:
   createlang -d [dbname] -U [user] plpgsql
*/

create or replace function importMbmessage() returns void as $$
declare
    rec record;
    issuer_rec record;
    exist_rec record;
begin
    for rec in select * from mbmessage where parentmessageid != 0 loop
	select * into issuer_rec from mbmessage where messageid = rec.parentmessageid;
	select * into exist_rec from mz_mbmessage_addon where message_id = rec.messageid;
	if not found then
	    insert into mz_mbmessage_addon(message_id, license_type, status, comments, thread_id, user_id, issuer_id, active, visible) values(rec.messageid, 'CREATIVE_COMMONS_LICENSE', 'APPROVED_MESSAGE', 'Imported used plpgsql script.', rec.threadid, rec.userid, issuer_rec.userid, true, true);
	    raise notice 'message: % not exist in mz_mbmessage_addon - imported', rec.messageid;
	end if;
    end loop;
    return;
end;
$$ language plpgsql;

begin transaction;
    select importMbmessage();
end transaction;

drop function importMbmessage();
