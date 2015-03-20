-- Table: mz_mbmessage_addon

-- DROP TABLE mz_mbmessage_addon;

CREATE TABLE mz_mbmessage_addon
(
  message_id bigint NOT NULL,
  license_type character varying(75),
  status character varying(75),
  comments character varying(255),
  thread_id bigint,
  user_id bigint,
  issuer_id bigint,
  old_message_id bigint,
  active boolean,
  visible boolean,
  CONSTRAINT mz_mbmessage_addon_pkey PRIMARY KEY (message_id )
);
