-- -*- mode: sql; coding: utf-8 -*-

---- Copyright (C) 2011, 2012, 2013
---- Free Software Foundation, Inc.

---- This file is part of Kisê.

---- Kisê is free software: you can redistribute it and/or modify it
---- under the terms of the GNU General Public License as published by
---- the Free Software Foundation, either version 3 of the License, or
---- (at your option) any later version.

---- Kisê is distributed in the hope that it will be useful, but
---- WITHOUT ANY WARRANTY; without even the implied warranty of
---- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
---- General Public License for more details.

---- You should have received a copy of the GNU General Public License
---- along with Kisê.  If not, see <http://www.gnu.org/licenses/>.
----

--- Commentary:

-- this file is actually not 'called' nor 'used' but given here as the
-- effective Kisê database schema 'in use' by the application.

--- Code:

drop table kise;

create table kise (
  id             integer primary key not null,
  date_          integer,
  who            text,
  for_whom       text,
  duration       float,
  to_be_charged  text,
  charging_type  text,
  what           text,
  description    text,
  created_the    integer,
  created_by     text,
  modified_the   integer,
  modified_by    text,
  imported_id    integer,
  imported_db    integer
);

--  alter table kise add imported_id integer default '-1' not null;
--  alter table kise add imported_db integer default '-1' not null;

drop table kise_printing_templates;

create table kise_printing_templates (
  id               integer primary key not null,
  name             text,
  items            text,
  mode             text,
  group_and_sort   text
);


---
--- Import
---

drop table if exists kise_imported_db;

create table kise_imported_db (
  id               integer primary key not null,
  name             text, -- actually it is the filename
  imported_the     integer,
  imported_by      text,
  colour_set       integer
);

-- 2013/09/04
-- alter table kise_imported_db add column colour_set text;


---
--- Db infos
---

drop table if exists kise_shinning;

create table kise_shinning (
  id         integer primary key not null,
  room_237   text,
);