//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ yo2 ]--------------------------------------------------//
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

YCMD:obiz(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		new text[124], ID_BUSINESS;
		if( sscanf(params, "k<fix>", text))
		{
			sendTipMessage(playerid, "U�yj /obiz [Text]");
			return 1;
		}
		if(GetPlayerBusiness(playerid) == -1)
		{
			sendErrorMessage(playerid, "Nie jeste� cz�onkiem �adnego biznesu!"); 
			return 1;
		}
		if(PlayerInfo[playerid][pBusinessOwner] != -1)
		{
			ID_BUSINESS = PlayerInfo[playerid][pBusinessOwner]; 
		}
		if(PlayerInfo[playerid][pBusinessMember] != -1)
		{
			ID_BUSINESS = PlayerInfo[playerid][pBusinessMember]; 
		}
		new string[256]; 
		
		format(string, sizeof(string), "%s [%d]: %s", GetNick(playerid), playerid,  text); 
		SendMessageToBiz(ID_BUSINESS, string, KOLOR_NIEBIESKI, 0);
	}
	return 1;
}
