/*
 *	Author: D.Anderson
 *	Description:
 *		Executed locally when player joins mission (includes both mission start and JIP).
 *	Parametr(s):
 *		0 - _unit: Object
 *		1 - _didJIP: Boolean
 */
_unit   = _this select 0; /* req for fn_introDialog.sqf */
_didJIP = _this select 1;

waituntil {! isnull _unit};

if (!_didJIP)then 
{
	[
		_unit, 													/* just leave it be mate */
		23,														/* starup time */
		"logo512.paa", 											/* path to image */
		"Howdy matey! Welcome in this Cluster-Fucked mission!"	/* custom text */
	] execVM "scripts\fn_introDialog.sqf";
};