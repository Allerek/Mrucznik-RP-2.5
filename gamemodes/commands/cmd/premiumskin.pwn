//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ premiumskin ]-----------------------------------------------//
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
// Data utworzenia: 2019-4-27

// Opis:
/*

*/


// Notatki skryptera:
/*
	
*/

YCMD:premiumskin(playerid, params[], help)
{
	return SendClientMessage(playerid, COLOR_GREEN, "Ju� wkr�tce!");
/*	
	if(isnull(params))
		return sendTipMessage(playerid, "U�yj /premiumskin [ID Skina]");

	new skin = strval(params);

	if(!PlayerHasSkin(playerid, skin))
		return sendErrorMessage(playerid, "Nie masz tego skina.");

	if((OnDuty[playerid] == 1 && OnDutyCD[playerid] == 0) || SanDuty[playerid] == 1)
	{
		return sendErrorMessage(playerid, "B�d�c na s�u�bie nie mo�esz aktywowa� unikatowego skina.");
	}
	
	PlayerInfo[playerid][pModel] = skin;

	SetPlayerSkin(playerid, skin);

	_MruAdmin(playerid, sprintf("Aktywowa�e� sw�j unikatowy skin [ID: %d]", skin));

	return 1;*/
}