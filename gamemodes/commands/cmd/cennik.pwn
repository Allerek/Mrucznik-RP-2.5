//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ cennik ]------------------------------------------------//
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

YCMD:cennik(playerid, params[], help)
{
	if(!(IsPlayerInRangeOfPoint(playerid, 5.0, 1904.3759,-2494.4448,13.6266) && GetPlayerVirtualWorld(playerid) == 1)) 
	{
		return sendTipMessageEx(playerid, 0xB52E2BFF, "Nie jeste� przy barze Ibizy");
	}
	new string[300];
	for(new i=0; i< sizeof IbizaDrinkiCeny; i++)
	{
		format(string, sizeof string, "%s%d. %s - $%d\n", string, i+1, IbizaDrinkiNazwy[i], IbizaDrinkiCeny[i]);
	}
	ShowPlayerDialogEx(playerid, DIALOG_IBIZA_CENNIK, DIALOG_STYLE_LIST, "Cennik drink�w", string, "Ok", "");
	return 1;
}
