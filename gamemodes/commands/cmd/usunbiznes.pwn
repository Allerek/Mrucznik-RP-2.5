//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------[ stworzbiznes ]----------------------------------------------//
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

YCMD:usunbiznes(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
   	{
       if(PlayerInfo[playerid][pAdmin] == 5000 || IsAScripter(playerid))
	   {
		   if(CheckIfPlayerInBiznesPoint(playerid))
		   {
				new idBIZ = GetPVarInt(playerid, "JestObokBiz"); 
				if(Business[idBIZ][b_ownerUID] != 0)
				{
					sendErrorMessage(playerid, "Ten biznes ma w�a�ciciela! Nie mo�esz go usun��.");
					sendTipMessage(playerid, "Aby zdj�� biznes dla gracza (niezale�nie od jego statusu) wpisz /zabierzbiz"); 
					return 1;
				}
				Log(businessLog, INFO, "%s [UID: %d] usun�� biznes {%s  [ID: %d] }",
				GetPlayerLogName(playerid),
				PlayerInfo[playerid][pUID], 
				Business[idBIZ][b_Name], 
				idBIZ); 
				DeleteBusiness(idBIZ);
				UnLoadBusiness(idBIZ); 
				sendTipMessage(playerid, "Usun��e� biznes - wpis w logach zosta� dodany!"); 
		   }
		   else
		   {
			   sendErrorMessage(playerid, "Nie jeste� obok �adnego biznesu!"); 
		   }
		  
	   }
	   else 
	   {
		   return noAccessMessage(playerid); 
	   }
	}
	return 1;
}
