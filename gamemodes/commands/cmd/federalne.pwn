//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ federalne ]-----------------------------------------------//
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

YCMD:federalne(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
	 	if(!IsAFBI(playerid))
	 	{
	 		sendErrorMessage(playerid, "Nie jeste� agentem FBI!");
		    return 1;
		}
	    if(OnDuty[playerid] != 1 )
		{
		    sendErrorMessage(playerid, "Nie jeste� na s�u�bie!");
		    return 1;
		}
		new giveplayerid, result[128];
		if( sscanf(params, "k<fix>s[128]", giveplayerid, result))
		{
			sendTipMessage(playerid, "U�yj (/fed)eralne [playerid/Cz��Nicku] [popelnione przestepstwo]");
			return 1;
		}

		if (IsAFBI(playerid))
		{
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
					if (!(IsACop(giveplayerid) && OnDuty[giveplayerid] == 1))
					{
						if(spamwl[giveplayerid] == 0)
						{
						    if(PoziomPoszukiwania[giveplayerid] <= 6)
						    {
								GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								PoziomPoszukiwania[giveplayerid] = 6;
								spamwl[giveplayerid] = 1;
								SetTimerEx("spamujewl",60000,0,"d",giveplayerid);
								SetPlayerCriminal(giveplayerid,playerid, result);
								SendClientMessage(giveplayerid, COLOR_LFBI, "   Pope�ni�e� przest�pstwo federalne, twoj� spraw� przej�o FBI !");
								SendClientMessage(playerid, COLOR_LFBI, "   Oskar�y�e� gracza o przest�pstwo federalne. Ma on teraz 6 Poziom Poszukiwania !");
								if(strfind(result, "ucieczka", true) != -1)
								{
									if(ProxDetectorS(80.0, playerid, giveplayerid))
									{
										if(poscig[giveplayerid] != 1)
										{
											SendClientMessage(playerid,COLOR_LIGHTBLUE,"Rozpocz��e� po�cig! Trwa on 7 minut.");
											SendClientMessage(giveplayerid,COLOR_PANICRED,"|_________________Tryb Po�cigu_________________|");
											SendClientMessage(giveplayerid,COLOR_WHITE,"S�u�by porz�dkowe ruszy�y za tob� w po�cig! W takim wypadku najlepiej si� podda�!");
											SendClientMessage(giveplayerid,COLOR_WHITE,"W trybie po�cigu nie mozesz wyj�� z gry, zgin�� oraz by� AFK.");
											SendClientMessage(giveplayerid,COLOR_WHITE,"Z�amanie tych zasad skutkuje kar� nadawan� automatycznie.");
											SendClientMessage(giveplayerid,COLOR_PANICRED,"|______________________________________________|");
											poscig[giveplayerid] = 1;
											SetTimerEx("PoscigTimer",7*60000,0,"d",giveplayerid);
										}
									}
									else
									{
										sendErrorMessage(playerid, "Gracz jest za daleko by nada� mu tryb po�cigu.");
										return 1;
									}
								}
								return 1;
							}
							else
							{
							    sendErrorMessage(playerid, "Ten gracz jest ju� �cigany za przest�pstwo federalne");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Da�e� ju� poziom poszukiwania, poczekaj 1 minute (zapobiega spamowaniu WL)");
						}
					}
					else
					{
						sendErrorMessage(playerid, "Nie mo�esz dawa� Wanted Level policjantom na s�u�bie!");
					}
				}
			}
			else
 			{
				format(string, sizeof(string), "Gracz o ID %d nie istnieje.", giveplayerid);
				sendErrorMessage(playerid, string);
				return 1;
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jeste� z FBI!");
		}
	}
	return 1;
}
