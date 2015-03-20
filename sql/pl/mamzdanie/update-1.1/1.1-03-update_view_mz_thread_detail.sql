-- View: mz_thread_detail

--DROP VIEW mz_thread_detail;

CREATE OR REPLACE VIEW mz_thread_detail AS 
 SELECT mbt.rootmessageid, mbt.threadid, ( SELECT mo.name
           FROM mz_organization mo, mz_user_addon mua, mbmessage mb
          WHERE mo.id = mua.organizationid AND mua.userid = mb.userid AND mb.messageid = mbt.rootmessageid) AS organizationname, ( SELECT mo.id
           FROM mz_organization mo, mz_user_addon mua, mbmessage mb
          WHERE mo.id = mua.organizationid AND mua.userid = mb.userid AND mb.messageid = mbt.rootmessageid) AS organizationid, mb.subject, ( SELECT count(*) AS count
           FROM mbmessage mb, mz_mbmessage_addon mbaddon
          WHERE mb.threadid = mbt.threadid AND mb.messageid = mbaddon.message_id AND mbaddon.status::text = 'APPROVED_MESSAGE'::text AND mbaddon.active = true) AS quantity, mma.signature, mma.date_from, mma.date_to, mma.summary_id, mma.accepted, mb.userid, mb.username, 
        CASE
            WHEN mma.date_to > 'now'::text::timestamp without time zone AND mma.date_from <= 'now'::text::date THEN 1
            ELSE 0
        END AS active
   FROM mbthread mbt, mz_mbthread_addon mma, mbmessage mb
  WHERE (mbt.threadid IN ( SELECT mma.thread_id
           FROM mz_mbthread_addon mma)) AND mb.messageid = mbt.rootmessageid AND mma.thread_id = mbt.threadid;
           