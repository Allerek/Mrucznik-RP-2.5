//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ kupbiznes ]-----------------------------------------------//
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

YCMD:kupbiznes(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pLevel] < 2)
		{
			sendTipMessage(playerid, "Mo�esz zakupi� w�asny biznes dopiero od poziomu 2");
			return 1;
		}
		if(GetPlayerBusiness(playerid) != INVALID_BIZ_ID)
		{
			sendTipMessage(playerid, "Jeste� w�a�cicielem b�d� cz�onkiem biznesu! Nie mo�esz kupi� nast�pnego.");
			sendTipMessage(playerid, "Je�eli jeste� w�a�cicielem wpisz: /zlomujbiznes");
			sendTipMessage(playerid, "Je�eli jeste� cz�onkiem wpisz: /quitbiznes"); 
			return 1; 
		}
		new businessID = GetNearestBusiness(playerid); 
		if(businessID == INVALID_BIZ_ID)
		{
			sendErrorMessage(playerid, "Nie jeste� obok biznesu!");
			return 1;
		}
		if(businessID == -1)
		{
			sendErrorMessage(playerid, "B��dne ID biznesu"); 
			return 1;
		}
		if(Business[businessID][b_ownerUID] != 0)
		{
			sendErrorMessage(playerid, "Ten biznes nale�y ju� do kogo�!"); 
			return 1;
		}
		if(kaska[playerid] < Business[businessID][b_cost])
		{
			sendErrorMessage(playerid, "Nie sta� Ci�!"); 
			return 1;
		}
		PlayerInfo[playerid][pBusinessOwner] = businessID; 
		Business[businessID][b_ownerUID] = PlayerInfo[playerid][pUID]; 
		Business[businessID][b_Name_Owner] = GetNick(playerid); 
		new string[124]; 
		sendTipMessageEx(playerid, COLOR_GREEN, "===[Zakupi�e� sw�j w�asny biznes]===");
		format(string, sizeof(string), "Nazwa biznesu: %s", Business[businessID][b_Name]);  
		sendTipMessage(playerid, string); 
		format(string, sizeof(string), "ID biznesu: %d", businessID); 
		sendTipMessage(playerid, string);
		format(string, sizeof(string), "Twoje UID: %d", PlayerInfo[playerid][pUID]); 
		sendTipMessage(playerid, string); 
		sendTipMessageEx(playerid, COLOR_GREEN, "===[WYKONAJ ZRZUT EKRANU]==="); 

		Log(businessLog, INFO, "%s [UID: %d] kupi� biznes %s [%d] za %d$",
        GetPlayerLogName(playerid),
		PlayerInfo[playerid][pUID], 
		Business[businessID][b_Name], 
    	businessID,
        Business[businessID][b_cost]);
		ZabierzKase(playerid, Business[businessID][b_cost]); 
		ResetBizOffer(playerid);
	}
	return 1;
}
