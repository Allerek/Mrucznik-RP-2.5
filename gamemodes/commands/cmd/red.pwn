//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ red ]--------------------------------------------------//
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

YCMD:red(playerid, params[], help)
{
    if(!IsACop(playerid) && GetPlayerFraction(playerid) != FRAC_LSPD)
	{
		return sendErrorMessage(playerid, "Nie jeste� policjantem.");
	}

	if(OnDuty[playerid] != 1 && JobDuty[playerid] != 1)
	{
		return sendErrorMessage(playerid, "Nie jeste� na s�u�bie.");
	}

    if(GetPVarInt(playerid, "patrol") != 1)
    {
        return sendErrorMessage(playerid, "Nie jeste� na patrolu.");
    }

    if(PDGPS == playerid)
    {
        return sendErrorMessage(playerid, "Wezwa�e� ju� wsparcie, u�yj /gps by wy��czy�.");
    }

    new str[128];
    new pat = GetPVarInt(playerid, "patrol-id");
    PatrolInfo[pat][patstan] = 2;
    format(str, 128, "{FFFFFF}��{6A5ACD} CENTRALA: {FFFFFF}%s:{FF0000} Potrzebne natychmiastowe wsparcie - {FFFFFF}CODE RED", PatrolInfo[pat][patname]);
    SendTeamMessage(1, COLOR_ALLDEPT, str);
    GPSMode(playerid, true);

    return 1;
}
