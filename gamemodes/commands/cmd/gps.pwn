//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ gps ]--------------------------------------------------//
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

YCMD:gps(playerid, params[], help)
{
	if(IsACop(playerid) || IsAMedyk(playerid) || GetPlayerFraction(playerid) == FRAC_BOR)
	{
		if(OnDuty[playerid] == 1 || JobDuty[playerid] == 1)
		{
			new string[128], sendername[MAX_PLAYER_NAME];
			GetPlayerName(playerid, sendername, sizeof(sendername));

			if(PDGPS == playerid)
			{
				foreach(new i : Player)
				{
					if(IsACop(i) || IsAMedyk(i) || GetPlayerFraction(i) == FRAC_BOR || GetPlayerFraction(i) == FRAC_ERS || (PlayerInfo[i][pMember] == 9 && SanDuty[i] == 1) || (PlayerInfo[i][pLider] == 9 && SanDuty[i] == 1) || GetPVarInt(playerid, "RozpoczalBieg") == 0)
						DisablePlayerCheckpoint(i);
				}
			}

			format(string, sizeof(string), "=: %s %s %s GPS %s :=", FracRang[GetPlayerFraction(playerid)][PlayerInfo[playerid][pRank]], sendername, (PDGPS == playerid) ? ("deaktywowa�") : ("aktywowa�"), (PDGPS == playerid) ? ("") : ("potrzebne wsparcie!"));
			PDGPS = (PDGPS == playerid) ? (-1) : (playerid);

			SendRadioMessage(1, COLOR_YELLOW2, string);
			SendRadioMessage(2, COLOR_YELLOW2, string);
			SendRadioMessage(3, COLOR_YELLOW2, string);
			SendRadioMessage(4, COLOR_YELLOW2, string);
			//SendRadioMessage(9, COLOR_YELLOW2, string);
			SendRadioMessage(FRAC_BOR, COLOR_YELLOW2, string); 
		}
		else
		{
			sendErrorMessage(playerid, "Nie jeste� na s�u�bie.");
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jeste� policjantem.");
	}
	return 1;
}
