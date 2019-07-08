//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------[ sprzedajbiznes ]--------------------------------------------//
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

YCMD:sprzedajbiznes(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{
		new giveplayerid, valueCost;
		new string[256];
		if(sscanf(params, "k<fix>d", giveplayerid, valueCost))
		{
			return sendTipMessage(playerid, "U�yj /sprzedajbiznes [ID_GRACZA] [Cena]"); 
		}
		if(IsPlayerConnected(giveplayerid))
		{
			if(giveplayerid == playerid)
			{
				sendTipMessage(playerid, "Nie mo�esz zaoferowa� sprzeda�y samemu sobie"); 
				return 1;
			}
			if(ProxDetectorS(8.0, playerid, giveplayerid))
			{
				if(CheckIfPlayerInBiznesPoint(playerid) == 0)
				{
					sendTipMessage(playerid, "Nie jeste� obok swojego biznesu"); 
					return 1;
				}
				new ID_Business = GetPVarInt(playerid, "JestObokBiz"); 
				if(PlayerInfo[playerid][pBusinessOwner] == ID_Business)
				{
					sendErrorMessage(playerid, "To nie jest tw�j biznes"); 
					return 1;
				}
				if(valueCost <= Business[ID_Business][b_cost]+10000000)
				{
					if(kaska[giveplayerid]>= valueCost)
					{
						format(string, sizeof(string), "Wys�a�e� ofert� do %s odno�nie kupna biznesu [ID %d] za %d", GetNick(giveplayerid, true), ID_Business, valueCost);
						sendTipMessage(playerid, string);
						sendTipMessage(playerid, "Oczekuj na akceptacje"); 
						
						
						//do giveplayerid
						format(string, sizeof(string), "Gracz %s oferuje Ci kupno biznesu [ID: %d] za kwot� %d$, wpisz /akceptuj biznes", GetNick(playerid, true), ID_Business, valueCost); 
						sendTipMessage(giveplayerid, string); 
						SetPVarInt(giveplayerid, "Oferujacy_ID", playerid);
						SetPVarInt(giveplayerid, "Oferujacy_Cena", valueCost); 
					}
					else
					{
						sendTipMessage(playerid, "Ten gracz nie ma przy sobie takiej kwoty"); 
						return 1;
					}
				}
				else
				{
					sendTipMessage(playerid, "Przy sprzeda�y biznesu za wi�ksz� cene wymagana jest obecno�� cz�onka Wydzia�u Planowania"); 
					return 1;
				}
			}
			else
			{
				sendErrorMessage(playerid, "Ten gracz nie znajduje si� obok Ciebie!"); 
				return 1;
			}
		}
		else
		{
			sendTipMessage(playerid, "Nie ma takiego gracza!"); 
		}
		
	}
	return 1;
}
