//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                   convoy                                                  //
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//
// Autor: Mrucznik
// Data utworzenia: 20.10.2019
//Opis:
/*
	System konwoj�w.
*/

//

#include <YSI\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(PRESSED(KEY_SECONDARY_ATTACK))
	{
		if(IsPlayerCarryingBox(playerid))
		{
			ChatMe(playerid, "podnosi skrzynk� z broni�.");
			DropBox(playerid);
		}
		else
		{
			new boxid = GetNearestBox(playerid);
			if(boxid != -1)
			{
				ChatMe(playerid, "odk�ada skrzynk� z broni�.");
				PickupBox(playerid, boxid);
			}
		}
	}
	return 1;
}

hook OnPlayerDeath(playerid)
{
	if(IsPlayerCarryingBox(playerid)) 
	{
		ChatMe(playerid, "upuszcza skrzynk� z broni�.");
		DropBox(playerid);
	}
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(IsPlayerCarryingBox(playerid)) 
	{
		ChatMe(playerid, "upuszcza skrzynk� z broni�.");
		DropBox(playerid);
	}
	return 1;
}

hook OnPlayerConnect(playerid)
{
	carryingBox[playerid] = -1;
	return 1;
}

//end