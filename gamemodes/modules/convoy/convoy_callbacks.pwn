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
	if(PRESSED(KEY_CROUCH))
	{
		if(IsPlayerCarryingBox(playerid))
		{
			DropBox(playerid);
   			ApplyAnimation(playerid,"CARRY","putdwn", 4.0, 0, 0, 0, 0, 0); 
			ChatMe(playerid, "upuszcza skrzynk� z broni�.");
		}
		else
		{
			new boxid = GetNearestBox(playerid);
			if(boxid != -1)
			{
				ChatMe(playerid, "podnosi skrzynk� z broni�.");
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

hook OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	if(IsPlayerInConvoyCar(playerid))
	{
		new Float:hp;
		GetPlayerHealth(playerid, hp);
		SetPlayerHealth(playerid, hp);
	}
	return 0;
}

//end