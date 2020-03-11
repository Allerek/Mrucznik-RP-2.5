//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ glosowanie ]----------------------------------------------//
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

YCMD:glosowanie(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{

		if(glosowanie_admina_status == 0)
		{
			if(PlayerInfo[playerid][pAdmin] >= 200 || IsAScripter(playerid))
			{
				new timeValue;
				new result[128];
				new string[256];
				if(sscanf(params, "ds[128]", timeValue, result))
				{
					sendTipMessage(playerid, "U�yj /glosowanie [czas_trwania_w_minutach] [temat]");
					return 1;
				}
				if(strlen(result) > 120)
				{
					sendErrorMessage(playerid, "Za d�ugi temat"); 
					return 1;
				}
				if(glosowanie_admina_status == 1)
				{
					sendTipMessage(playerid, "Aktualnie trwa g�osowanie"); 
					return 1;
				}	
				//_____WYKONUJEMY KOD____
				
				if(GetPlayerAdminDutyStatus(playerid) == 1)
				{
					iloscInne[playerid]++; 
				}
				format(string, sizeof(string), "Admin %s rozpocz�� ankiet� na temat:{C0C0C0}%s", GetNickEx(playerid), result);
				SendClientMessageToAll(COLOR_RED, string);
				SendClientMessageToAll(COLOR_WHITE,  "Aby zag�osowa� wpisz /glosowanie");
				format(string, sizeof(string), "G�osowanie potrwa %d sekund", timeValue); 
				SendClientMessageToAll(COLOR_WHITE, string);
				glosowanie_admina_status = 1;
				glosowanie_admina_tak = 0;
				glosowanie_admina_nie = 0;
				SetTimer("glosuj_admin_ankieta", (timeValue*1000), false);
				foreach(new i : Player)
				{
					SetPVarInt(i, "glosowal_w_ankiecie", 0);
				}
			}

			sendErrorMessage(playerid, "Aktualnie nie ma �adnej ankiety!"); 
			return 1;
		}
		if(GetPVarInt(playerid, "glosowal_w_ankiecie") == 1)
		{
			sendErrorMessage(playerid, "G�osowa�e� ju� w tej ankiecie"); 
			return 1;
		}
		ShowPlayerDialogEx(playerid, 9666, DIALOG_STYLE_MSGBOX, "Mrucznik Role Play", "G�osowanie\nKliknij poni�ej przycisk wed�ug w�asnego uznania\nPami�taj! Mo�esz odda� tylko jeden g�os!\n", "Tak", "Nie");
	}
	return 1;
}
