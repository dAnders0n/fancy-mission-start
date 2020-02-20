/*
 *	Author: D.Anderson
 *	Description:
 *		Display fancy Mission Start screen and plays with Post Processing 
 *		to make mission start bit more dramatic for not good reason.
 *	Parametr(s):
 *		0 - _unit: <Object> - must by player.
 *		1 - _image: <String> - patch to image.
 *		2 - _customText: <String> - Custom text displayed on botton.
 */

disableSerialization;

_unit = param[0];
_image = param[1];
_customText = param[2];

sleep 0.25;
createDialog "dAn_Intro_Dialog";

waitUntil {!isNull (findDisplay 9001)};

_missionName = getMissionConfigValue "OnLoadName";
_terrain = worldName;
_author = getMissionConfigValue "author";
_roleDesc = roleDescription _unit;
_unitGroup = groupId (group _unit);


/****************************************************************/

hint "Mission is in Startup\nPlayer Simulation: Disabled\nPlease Wait...";
["BlackAndWhite", 0.25, false] call BIS_fnc_setPPeffectTemplate;
_unit enableSimulation false;

/* 
 *	dAn_rsc_Picture 
 *	Picture
 */
_ctrl = (findDisplay 9001) displayCtrl 1200;
ctrlSetText[1200, _image];
/****************************************************************/

/* 
 *	dAn_rscStructuredText_1 
 *	Mission/Operation Name
 */
_ctrl = (findDisplay 9001) displayCtrl 1100;
_str = ['<t size="2.0"><t align="center">',_missionName, '</t></t>'] joinString "";
_ctrl ctrlSetStructuredText parseText _str;
_ctrl ctrlSetFontH1 "PuristaSemibold";
/****************************************************************/

/* 
 *	dAn_rscStructuredText_2 
 *	Map Name
 */
_ctrl = (findDisplay 9001) displayCtrl 1101;

_str = ["Lokalizacja:",_terrain] joinString " ";
_ctrl ctrlSetStructuredText parseText _str;
_ctrl ctrlSetFontH1 "PuristaSemibold";
/****************************************************************/

/* 
 *	dAn_rscStructuredText_3 
 *	Author
 */
_ctrl = (findDisplay 9001) displayCtrl 1102;

_str = ["by",_author] joinString " ";
_ctrl ctrlSetStructuredText parseText _str;
_ctrl ctrlSetFontH1 "PuristaSemibold";
/****************************************************************/

/* 
 *	dAn_rscStructuredText_4
 *	Role Descriotion
 */
_ctrl = (findDisplay 9001) displayCtrl 1103;

_roleDescArray = _roleDesc splitString "@";
_slotName = (_roleDescArray select 0) splitString ":";
_str = ["Slot:", _slotName select 1] joinString "";
_ctrl ctrlSetStructuredText parseText _str;
_ctrl ctrlSetFontH1 "PuristaSemibold";
/****************************************************************/

/* 
 *	dAn_rscStructuredText_5
 *	Group Name
 */
_ctrl = (findDisplay 9001) displayCtrl 1104;

_str = ["Przydział:", _unitGroup] joinString " ";
_ctrl ctrlSetStructuredText parseText _str;
_ctrl ctrlSetFontH1 "PuristaSemibold";
/****************************************************************/

/* 
 *	dAn_rscStructuredText_6
 *	Custom Text
 */
_ctrl = (findDisplay 9001) displayCtrl 1105;

_str = ['<t align="center">',_customText, '</t>'] joinString "";
_ctrl ctrlSetStructuredText parseText _str;
_ctrl ctrlSetFontH1 "PuristaSemibold";
/****************************************************************/

/*
 *	Post Proccesing Control
 */

sleep 18.75;
 
_array = [1200, 1100, 1101, 1102, 1103, 1104, 1105];

["Default", 7, false] call BIS_fnc_setPPeffectTemplate;
{
	_ctrl = (findDisplay 9001) displayCtrl _x;
	_ctrl ctrlSetFade 1;
	_ctrl ctrlCommit 7;
}forEach _array;

sleep 7.25;
hint "Mission Starup Completed\n Player Simulation: Enabled\n Good Luck!";
sleep 0.5;
_unit enableSimulation true;
closeDialog 1;
sleep 2.5;
hint "";
/****************************************************************/