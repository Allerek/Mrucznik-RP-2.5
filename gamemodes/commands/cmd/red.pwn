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
    new str[128];
    if(!IsACop(playerid) && GetPlayerFraction(playerid) != FRAC_LSPD)
	{
		sendErrorMessage(playerid, "Nie jeste� policjantem.");
		return 1;
	}

	if(OnDuty[playerid] != 1 && JobDuty[playerid] != 1)
	{
		sendErrorMessage(playerid, "Nie jeste� na s�u�bie.");
		return 1;
	}

    if(GetPVarInt(playerid, "patrol") != 1)
    {
        sendErrorMessage(playerid, "Nie jeste� na patrolu.");
        return 1;
    }

    if(PDGPS == playerid)
    {
        sendErrorMessage(playerid, "Wezwa�e� ju� wsparcie!");
        return 1;
    }

    new pat = GetPVarInt(playerid, "patrol-id");
    PatrolInfo[pat][patstan] = 2;
    format(str, 128, "{FFFFFF}��{6A5ACD} CENTRALA: {FFFFFF}%s:{FF0000} Potrzebne natychmiastowe wsparcie - {FFFFFF}CODE RED", PatrolInfo[pat][patname]);
    SendTeamMessage(1, COLOR_ALLDEPT, str);
    GPSMode(playerid, true);

    return 1;
}
