//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ podglad ]------------------------------------------------//
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

YCMD:podglad(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		new para1;
		if( sscanf(params, "k<fix>", para1))
		{
			sendTipMessage(playerid, "U�yj /podglad [playerid/Cz��Nicku]");
			return 1;
		}


		if (PlayerInfo[playerid][pAdmin] >= 1)
		{
		    if(IsPlayerConnected(para1))
		    {
		        if(para1 != INVALID_PLAYER_ID)
		        {
		            GetPlayerName(para1, giveplayer, sizeof(giveplayer));
		            if(PlayerInfo[para1][pPodPW] == 0)
					{
                        SendCommandLogMessage(sprintf("Admin %s [%d] w��czy� podgl�d dla %s [%d]", GetNick(playerid), playerid, GetNick(para1), para1));

						PlayerInfo[para1][pPodPW] = 1;

                        format(string, sizeof(string), "AdmCmd: %s wlaczyl podglad PW %s",GetNick(playerid) ,giveplayer);
						Log(adminLog, INFO, "Admin %s w��czy� podgl�d /w dla gracza %s", GetPlayerLogName(playerid), GetPlayerLogName(para1));
					}
					else
					{
                        SendCommandLogMessage(sprintf("Admin %s [%d] wy��czy� podgl�d dla %s [%d]", GetNick(playerid), playerid, GetNick(para1), para1));
						PlayerInfo[para1][pPodPW] = 0;
						Log(adminLog, INFO, "Admin %s wy��czy� podgl�d /w dla gracza %s", GetPlayerLogName(playerid), GetPlayerLogName(para1));
					}
				}
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
