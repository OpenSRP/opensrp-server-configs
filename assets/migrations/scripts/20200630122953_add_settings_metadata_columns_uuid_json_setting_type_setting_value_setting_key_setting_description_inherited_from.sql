--
--    Copyright 2010-2016 the original author or authors.
--
--    Licensed under the Apache License, Version 2.0 (the "License");
--    you may not use this file except in compliance with the License.
--    You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--    Unless required by applicable law or agreed to in writing, software
--    distributed under the License is distributed on an "AS IS" BASIS,
--    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--    See the License for the specific language governing permissions and
--    limitations under the License.
--

-- // add settings metadata columns uuid json setting type setting value setting key setting description inherited from
-- Migration SQL that makes the change goes here.
ALTER TABLE core.settings_metadata ADD COLUMN IF NOT EXISTS uuid VARCHAR;
ALTER TABLE core.settings_metadata ADD COLUMN IF NOT EXISTS json jsonb;
ALTER TABLE core.settings_metadata ADD COLUMN IF NOT EXISTS setting_type VARCHAR;
ALTER TABLE core.settings_metadata ADD COLUMN IF NOT EXISTS setting_value VARCHAR;
ALTER TABLE core.settings_metadata ADD COLUMN IF NOT EXISTS setting_key VARCHAR;
ALTER TABLE core.settings_metadata ADD COLUMN IF NOT EXISTS setting_description VARCHAR;
ALTER TABLE core.settings_metadata ADD COLUMN IF NOT EXISTS setting_label VARCHAR;
ALTER TABLE core.settings_metadata ADD COLUMN IF NOT EXISTS inherited_from VARCHAR;

-- Add search fields index
CREATE INDEX IF NOT EXISTS settings_search_fields_index ON core.settings_metadata (uuid, setting_type, setting_key);


-- //@UNDO
-- SQL to undo the change goes here.
ALTER TABLE core.settings_metadata DROP COLUMN uuid;
ALTER TABLE core.settings_metadata DROP COLUMN json;
ALTER TABLE core.settings_metadata DROP COLUMN setting_type;
ALTER TABLE core.settings_metadata DROP COLUMN setting_value;
ALTER TABLE core.settings_metadata DROP COLUMN setting_key;
ALTER TABLE core.settings_metadata DROP COLUMN setting_description;
ALTER TABLE core.settings_metadata DROP COLUMN setting_label;
ALTER TABLE core.settings_metadata DROP COLUMN inherited_from;
