//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ caluj ]-------------------------------------------------//
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

YCMD:caluj(playerid, params[], help)
{
	new string[128];

    if(IsPlayerConnected(playerid))
    {
		new playa;
		if( sscanf(params, "k<fix>", playa))
		{
			sendTipMessage(playerid, "U�yj /caluj [ID gracza]");
			return 1;
		}
		if(playa == playerid)
		{
			sendErrorMessage(playerid, "Nie mo�esz poca�owa� samego siebie!"); 
			return 1;
		}
		if (ProxDetectorS(5.0, playerid, playa) && Spectate[playa] == INVALID_PLAYER_ID)
		{
		    if(IsPlayerConnected(playa))
		    {
		        if(playa != INVALID_PLAYER_ID)
		        {
					format(string, sizeof(string), "%s chce si� z tob� poca�owa� - je�li go kochasz kliknij ''Ca�uj''!", GetNick(playerid, true));
  					ShowPlayerDialogEx(playa, 1092, DIALOG_STYLE_MSGBOX, "Mrucznik Role Play - poca�unek", string, "Ca�uj", "Odrzu�", true);
					format(string, sizeof(string), "Zaoferowa�e� poca�unek %s - oczekuj na reakcje!", GetNick(playa, true));
					sendTipMessage(playerid, string);
					kissPlayerOffer[playa] = playerid;
				}
			}
		}
		else
		{
			sendErrorMessage(playerid, "Jeste� za daleko !");
		}
	}
	return 1;
}
