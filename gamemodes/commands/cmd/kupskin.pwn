//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ kupskin ]------------------------------------------------//
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

// Opis
/*
	
*/


// Notatki skryptera:
/*
	
*/
YCMD:kupskin(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        if(IsAtClothShop(playerid))
        {
            new skinID;
			if( sscanf(params, "d", skinID))
			{
				sendTipMessage(playerid, "U�yj /wybierzskin [id skinu] (koszt: 5000$)");
				sendTipMessage(playerid, "ID skin�w znajdziesz na: http://wiki.sa-mp.com/wiki/Skins:All");
				sendTipMessage(playerid, "ID skin�w [+400] znajdziesz na: http://mrucznik-rp.pl");
				return 1;
			}
			if(kaska[playerid] >= 5000){
				
				if(skinID > 299 && skinID < 400)
				{
					sendErrorMessage(playerid, "B��dne ID skina - brak przedzia�u od 300-399"); 
					return 1;
				}
				if(skinIsLegally(skinID))
				{
					sendTipMessage(playerid, "Kupi�e� nowego skina!"); 
					SetPlayerSkinEx(playerid, skinID); 
				}
				else
				{
					sendTipMessage(playerid, "1. Nie mo�na kupi� w tym sklepie takiego skina! Spr�buj pod /kp");
					sendTipMessage(playerid, "2. Podany przez Ciebie skin mo�e by� skinem tylko i wy��cznie pod evenety!");
					return 1;
				}
			}
			else
			{
				sendErrorMessage(playerid, "Nie posiadasz odpowiedniej ilo�ci got�wki!");
				return 1;
			}
		}
	}
	return 1;
}
/*
YCMD:kupskin(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        if(IsAtClothShop(playerid))
        {
            new skinID;
			if( sscanf(params, "d", skinID))
			{
				sendTipMessage(playerid, "U�yj /wybierzskin [id skinu] (koszt: 5000$)");
				sendTipMessage(playerid, "ID skin�w znajdziesz na: http://wiki.sa-mp.com/wiki/Skins:All");
				sendTipMessage(playerid, "ID skin�w [+400] znajdziesz na: http://mrucznik-rp.pl");
				return 1;
			}
			if(kaska[playerid] < 5000)
			{
				sendErrorMessage(playerid, "Nie posiadasz wystarczaj�co �rodk�w!");
				return 1;
			}
			if(skinID > )
			for(new i; i<=2; i++)
			{
				if(skinID == PedsEvent[i][0])
				{
					if(eventForSkin[i] != 1)
					{
						sendErrorMessage(playerid, "Event dla tego skina zosta� zako�czony!"); 
						return 1;
					}
					
					sendTipMessage(playerid, "Zakupi�e� nowego skina [Tymczasowego]!"); 
					ZabierzKase(playerid, 5000); 
					SetPlayerSkinEx(playerid, skinID); 
					return 1;
				}
			}
			for(new skin = 0; skin<=222; skin++)
			{
				if(skinID == Przebierz[skin][0])
				{
					sendTipMessage(playerid, "Zakupi�e� nowego skina!"); 
					ZabierzKase(playerid, 5000); 
					SetPlayerSkinEx(playerid, skinID); 
					PlayerInfo[playerid][pSkin] = skinID; 
					return 1;
				}
			}
			sendTipMessage(playerid, "Tego skina nie mo�esz wybra�!"); 	
        }
        else
		{
		    sendErrorMessage(playerid, "Nie jeste� w sklepie z ciuchami!");
		}
    }
	return 1;
}
*/