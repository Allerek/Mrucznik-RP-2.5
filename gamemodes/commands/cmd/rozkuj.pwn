//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ rozkuj ]------------------------------------------------//
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

YCMD:rozkuj(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
    {
		new string[128];
		new giveplayer[MAX_PLAYER_NAME];
		new sendername[MAX_PLAYER_NAME];

		if(gTeam[playerid] == 2 || IsACop(playerid) || IsABOR(playerid))
		{
		    new giveplayerid;
			if( sscanf(params, "k<fix>", giveplayerid))
			{
				sendTipMessage(playerid, "U�yj /rozkuj [playerid/Cz��Nicku]");
				return 1;
			}
			if(IsPlayerConnected(giveplayerid))
			{
				if(giveplayerid != INVALID_PLAYER_ID)
				{
				    if (ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    if(giveplayerid == playerid) { sendTipMessageEx(playerid, COLOR_GREY, "Nie mo�esz odku� samego siebie!"); return 1; }
						if(PlayerCuffed[giveplayerid] == 2 || Kajdanki_JestemSkuty[giveplayerid] >= 1)
						{
							GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
						    format(string, sizeof(string), "* Zosta?e? rozkuty przez %s.", sendername);
							SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* Rozku?e? %s.", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							GameTextForPlayer(giveplayerid, "~g~Rozkuty", 2500, 3);
							TogglePlayerControllable(giveplayerid, 1);
							PlayerCuffed[giveplayerid] = 0;
							Kajdanki_JestemSkuty[giveplayerid] = 0;
							Kajdanki_Aresztant[giveplayerid] = 0;
                            Kajdanki_Uzyte[giveplayerid] = 0;
                            Kajdanki_Uzyte[playerid] = 0;
							Kajdanki_PDkuje[playerid] = 0;
							Kajdanki_PDkuje[giveplayerid]=0;
							PlayerInfo[giveplayerid][pMuted] = 0;
                            ClearAnimations(giveplayerid);
        					SetPlayerSpecialAction(giveplayerid,SPECIAL_ACTION_NONE);
							RemovePlayerAttachedObject(giveplayerid, 5);
						}
						else
						{
						    sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest skuty !");
						}
					}
					else
					{
					    sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest przy tobie !");
					}
				}
			}
			else
			{
			    sendErrorMessage(playerid, "Nie ma takiego gracza !");
			}
		}
		else
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� z Policji / FBI / SASD /BOR !");
		}
	}//not connected
	return 1;
}
