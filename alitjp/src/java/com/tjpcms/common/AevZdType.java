package com.tjpcms.common;

public enum AevZdType {
	INPUT,
	PIC,
	RICH,
	HIDDEN,
	TEXT,
	SELECT,
	TEXTAREA,
	PASSWORD,
	ZDB,//ZDB类型就是先显示字典表让你选择，再根据选的字段表查出对应的字典项，最终的结果是字典项，配了这个类型，表里要有zdb这个字段
	RADIO,
	CHECKBOX,
	DATE,
	VDO
}