/*
 *	Author: D.Anderson
 *	Description:
 *		Countdown hint for players.
 *	Parametr(s):
 */

_time = param[0];

for "_i" from (_time + 6) to 0 step -1 do 
{
	if (_i >9) then
	{
		hintSilent parseText format["Mission is in Startup<br />Player Simulation:  <t color='#ff0000'>Disabled</t><br />T - <t color='#ff0000'>%1</t>", _i]; 
	}
	else
	{
		hintSilent parseText format["Mission is in Startup<br />Player Simulation: <t color='#ff0000'>Disabled</t><br />T - <t color='#ff0000'>0%1</t>", _i]; 
	};
	
	sleep 1;
};