//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ cygaro ]------------------------------------------------//
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

YCMD:cygaro(playerid, params[], help)
{
	if(IsPlayerInRangeOfPoint(playerid, 3.5, 833.8511,-1391.2689,-17.6433))
	{
		if(GetPlayerMoney(playerid) < 1000)
		{
			sendErrorMessage(playerid, "Nie masz wystarczaj�co got�wki!"); 
			return 1;
		}
		sendTipMessage(playerid, "Jeste� VIP - otrzymujesz cygaro za 100 dolc�w!"); 
		ZabierzKase(playerid, 1000); 
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
		Sejf_Add(FRAC_SN, 1000);
		Sejf_Save(FRAC_SN); 
		return 1;
	}
	if(PlayerInfo[playerid][pCygaro] >= 1)
    {
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
		PlayerInfo[playerid][pCygaro] -= 1;
    }
	else
	{
	    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Musisz kupi� cygaro aby m�c je pali�, id� do dilera lub 24/7");
	}
	return 1;
}
