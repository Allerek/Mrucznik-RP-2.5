//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ bizinfo ]------------------------------------------------//
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

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:bizinfo(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{
		if(!CheckIfPlayerInBiznesPoint(playerid))
		{
			sendErrorMessage(playerid, "Nie jeste� obok biznesu!"); 
			return 1;
		}
		new ID_BUSINESS = GetPVarInt(playerid, "JestObokBiz"); 
		new string[256]; 
		if(Business[ID_BUSINESS][b_ownerUID] == 0)
		{
			format(string, sizeof(string), "{FFFFFF}Nazwa: {37AC45}%s\n{FFFFFF}W�a�ciciel: {37AC45}%s\n{FFFFFF}ID: {37AC45}%d\n{FFFFFF}Cena: {37AC45}$%d\n{FFFFFF}Dochody: {37AC45}$%d\n{FFFFFF}Lokalizacja: {37AC45}%s",
			Business[ID_BUSINESS][b_Name],
			Business[ID_BUSINESS][b_Name_Owner], 
			ID_BUSINESS,
			Business[ID_BUSINESS][b_cost],
			Business[ID_BUSINESS][b_maxMoney],
			Business[ID_BUSINESS][b_Location]); 
		}
		else if(Business[ID_BUSINESS][b_ownerUID] != 0)
		{
			format(string, sizeof(string), "{FFFFFF}Nazwa: {37AC45}%s\n{FFFFFF}W�a�ciciel: {37AC45}%s [%d]\n{FFFFFF}ID: {37AC45}%d\n{FFFFFF}Cena: {37AC45}$%d\n{FFFFFF}Dochody: {37AC45}$%d\n{FFFFFF}Lokalizacja: {37AC45}%s",
			Business[ID_BUSINESS][b_Name],
			Business[ID_BUSINESS][b_Name_Owner], 
			Business[ID_BUSINESS][b_ownerUID],
			ID_BUSINESS,
			Business[ID_BUSINESS][b_cost],
			Business[ID_BUSINESS][b_maxMoney],
			Business[ID_BUSINESS][b_Location]); 
		}
		ShowPlayerInfoDialog(playerid, "Mrucznik Role Play", string, false); 

		format(string, sizeof(string), "Wy�wietlam informacje dla %s", Business[ID_BUSINESS][b_Location]); 
		sendTipMessage(playerid, string); 
	}
	return 1;
}
