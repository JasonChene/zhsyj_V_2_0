ALTER TABLE pdbsx
  ADD COLUMN daibankind VARCHAR(10) DEFAULT NULL COMMENT '待办类型见aa10表DAIBANKIND' AFTER fsxtbz;

call PRC_INSERTCODE('DAIBANKIND','待办事项类型','1','1','文书填写中报请事项','199405',null,@P_CODE,@P_MSG);