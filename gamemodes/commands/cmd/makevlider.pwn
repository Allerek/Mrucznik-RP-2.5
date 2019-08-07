//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ makevleader ]----------------------------------------------//
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

YCMD:makevleader(playerid, params[], help)
{
	new string[256]; 
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pLider] > 0)
		{
			if(PlayerInfo[playerid][pLiderValue] == 1)
			{
				new giveplayerid, value; 
				if(sscanf(params, "k<fix>d", giveplayerid, value))
				{
					sendTipMessage(playerid, "U�yj /makevleader [Nick] [Poziom Lidera]"); 
					sendTipMessage(playerid, "Poziom 2 - VLD [Pe�ny dost�p, nie mo�e mianowa� innych VLD]");
					sendTipMessage(playerid, "Poziom 3 - Kierownik [Tylko /przyjmij, /awans /zwolnij"); 
					return 1; 
				}
				if(giveplayerid == playerid)
				{
					sendErrorMessage(playerid, "Nie mo�esz wykona� tej operacji na sobie!"); 
					return 1;
				}
				if(IsPlayerConnected(giveplayerid))
				{
					if(PlayerInfo[giveplayerid][pLider] > 0 || PlayerInfo[giveplayerid][pMember] > 0)
					{	
						sendErrorMessage(playerid, "Ten Gracz jest ju� w jakiej� frakcji!");
						return 1;
					}
					new Frac = GetPlayerFraction(playerid); 
					PlayerInfo[giveplayerid][pLider] = Frac; 
					PlayerInfo[giveplayerid][pLiderValue] = value; 
					PlayerInfo[giveplayerid][pMember] = Frac; 
					Create_MySQL_Leader(giveplayerid, Frac, value);//Tworzenie konta LD
					Save_MySQL_Leader(giveplayerid);
					All_Leaders++;   
					format(string, sizeof(string), "%s mianowa� Ci� liderem [%d] organizacji %s [%d]", GetNick(playerid), value, FractionNames[Frac], Frac); 
					sendTipMessageEx(giveplayerid, COLOR_P@, string); 
					format(string, sizeof(string), "Mianowa�e�/a� %s liderem na stopien %d dla swojej frakcji!", GetNick(giveplayerid), value); 
					sendTipMessageEx(playerid, COLOR_P@, string); 
					Log(adminLog, INFO, "GLD %s dal lidera %s [%d] dla %s", GetPlayerLogName(playerid), FractionNames[Frac], value, GetPlayerLogName(giveplayerid));
				}
				else{
					sendErrorMessage(playerid, "Nie ma takiego gracza"); 
				}
			}
			else{
				sendErrorMessage(playerid, "Nie jeste� G��wnym Liderem!");
				return 1;
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jeste� liderem organizacji!"); 
		}
	}
	return 1;
}
