//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                  premium                                                  //
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
// Data utworzenia: 04.05.2019
//Opis:
/*
	Monetyzacja, us�ugi premium.
*/

//

#include <YSI\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
hook OnPlayerEditAttachedObj(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	if(VECTOR_find_val(VPremiumItems[playerid], modelid) != INVALID_VECTOR_INDEX)
	{
		if(response)
		{
			SendClientMessage(playerid, COLOR_GREEN, "Edytowa�e� pozycj� swojego przedmiotu.");
	
			AttachedObjects[playerid][index][ao_x] = fOffsetX;
			AttachedObjects[playerid][index][ao_y] = fOffsetY;
			AttachedObjects[playerid][index][ao_z] = fOffsetZ;
			AttachedObjects[playerid][index][ao_rx] = fRotX;
			AttachedObjects[playerid][index][ao_ry] = fRotY;
			AttachedObjects[playerid][index][ao_rz] = fRotZ;
			AttachedObjects[playerid][index][ao_sx] = fScaleX;
			AttachedObjects[playerid][index][ao_sy] = fScaleY;
			AttachedObjects[playerid][index][ao_sz] = fScaleZ;

			MruMySQL_UpdatePremiumItem(playerid, modelid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, boneid, true);
			SetPlayerAttachedObject(playerid, index, modelid, boneid, 
				fOffsetX, fOffsetY, fOffsetZ, 
				fRotX, fRotY, fRotZ, 
				1, 1, 1 //scale always 1
			);
		}
		else
		{
			SendClientMessage(playerid, COLOR_RED, "Anulowa�e� edycj� pozycj� swojego przedmiotu.");
	
			SetPlayerAttachedObject(playerid, index, modelid, boneid, 
				AttachedObjects[playerid][index][ao_x], AttachedObjects[playerid][index][ao_y], AttachedObjects[playerid][index][ao_z], 
				AttachedObjects[playerid][index][ao_rx], AttachedObjects[playerid][index][ao_ry], AttachedObjects[playerid][index][ao_rz], 
				AttachedObjects[playerid][index][ao_sx], AttachedObjects[playerid][index][ao_sy], AttachedObjects[playerid][index][ao_sz]
			);
		}
	}
    return 0;
}

hook OnPlayerSpawn(playerid)
{
	
	return 1;
}

//end