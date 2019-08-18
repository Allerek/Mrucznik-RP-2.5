//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ bizlock ]------------------------------------------------//
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

YCMD:bizlock(playerid, params[], help)
{

	if(PlayerInfo[playerid][pBusinessOwner] == INVALID_BIZ_ID && PlayerInfo[playerid][pBusinessMember] == INVALID_BIZ_ID)
	{
		sendErrorMessage(playerid, "Nie masz w�asnego biznesu"); 
		return 1;
	}
	new businessID, string[124]; 
	if(PlayerInfo[playerid][pBusinessOwner] != INVALID_BIZ_ID)
	{
		businessID = PlayerInfo[playerid][pBusinessOwner]; 
	}
	else if(PlayerInfo[playerid][pBusinessMember] != INVALID_BIZ_ID)
	{
		businessID = PlayerInfo[playerid][pBusinessMember]; 
	}
	if(!CheckIfPlayerInBiznesPoint(playerid))
	{
		sendErrorMessage(playerid, "Nie jeste� obok biznesu!"); 
		return 1;
	}
	if(businessID != GetPVarInt(playerid, "JestObokBiz"))
	{
		sendErrorMessage(playerid, "To nie jest tw�j biznes!"); 
		return 1;
	}
	if(BizOpenStatus[businessID] == 0)
	{
		BizOpenStatus[businessID] = 1;
		format(string, sizeof(string), "%s zamyka drzwi od %s", GetNick(playerid), Business[businessID][b_Name]);
	}
	else if(BizOpenStatus[businessID] == 1)
	{
		BizOpenStatus[businessID] = 0;
		format(string, sizeof(string), "%s otwiera drzwi  %s", GetNick(playerid), Business[businessID][b_Name]); 
	}
	ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	
	return 1;
}
