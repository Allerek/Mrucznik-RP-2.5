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
    if(IsPlayerConnected(playerid))
    {
		new giveplayerid, reason[64], maxMsg;
		if( sscanf(params, "k<fix>s[64]D("#MAX_SENT_MESSAGES")", giveplayerid, reason, maxMsg))
		{
			sendTipMessage(playerid, "U�yj /podglad [playerid/Cz��Nicku] [pow�d] (liczba wiadomosci)");
			return 1;
		}

		if (PlayerInfo[playerid][pAdmin] >= 1)
		{
		    if(IsPlayerConnected(giveplayerid))
		    {
				ShowPlayerSentMessages(giveplayerid, playerid, maxMsg);
				SendClientMessage(giveplayerid, COLOR_PANICRED, sprintf("Admin %s sprawdzi� histori� twoich wiadomo�ci. Pow�d: %s", GetNickEx(playerid), reason));
				Log(adminLog, INFO, "Admin %s podejrza� wiadomo�ci gracza %s, pow�d: %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), reason);
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
