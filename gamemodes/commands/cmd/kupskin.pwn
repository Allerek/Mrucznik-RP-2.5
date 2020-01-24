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

DialogKupSkin(playerid)
{
	static string[sizeof(ShopSkins) * 20];
	if(isnull(string)) {
        for(new i; i<sizeof(ShopSkins); i++)  {
			if(ShopSkins[i][SKIN_TYPE] == SKIN_TYPE_DEFAULT) {
            	strcat(string, sprintf("%d\t~g~$%d\n", ShopSkins[i][SKIN_ID], ShopSkins[i][SKIN_PRICE]));
			}
        }
		string[strlen(string)-1] = '\0';
	}

	ShowPlayerDialogEx(playerid, DIALOG_KUPSKIN, DIALOG_STYLE_PREVIEW_MODEL, "Skiny do kupienia", string, "Kup", "Wyjdz");
}

YCMD:kupskin(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        if(IsAtClothShop(playerid))
        {
			DialogKupSkin(playerid);
			return 1;
		}
	}
	return 1;
}
/*
//OLD
            new skinID;
			if( sscanf(params, "d", skinID))
			{
				sendTipMessage(playerid, "U�yj /wybierzskin [id skinu] (koszt: 5000$)");
				sendTipMessage(playerid, "ID skin�w znajdziesz na: http://wiki.sa-mp.com/wiki/Skins:All");
				sendTipMessage(playerid, "ID skin�w [+20.000] znajdziesz na: http://mrucznik-rp.pl");
				sendTipMessage(playerid, "Uwaga! Nowe skiny (20.000+) kosztuj� 15k, 50k lub 100k!");
				return 1;
			}
			if(kaska[playerid] >= 5000) 
				else if(skinID > 20400 && skinID <= skinsLoaded_Normal)//Normalne skiny dla ka�dego
				{
					new fakeID = GetSkinFakeID(skinID); 
					new string[124];
					new plec[10]; 
					new rasa[24]; 
					if(skinID == 20446 || skinID == 20445 || skinID == 20451 || skinID == 20449)
					{
						sendErrorMessage(playerid, "Nagie skiny mo�esz za�o�y� w swoim domu za pomoc� /rozbierz"); 
						return 1;
					}
					if(kaska[playerid] < skinCost[fakeID])
					{
						sendErrorMessage(playerid, "Nie posiadasz wystarczaj�cej ilo�ci got�wki, na tego skina");
						format(string, sizeof(string), "Ten skin [NR: %d] kosztuje %d$", fakeID+20000, skinCost[fakeID]);
						sendTipMessage(playerid, string);
						return 1; 
					}
					if(skinSex[fakeID] == SKIN_MEN)
					{
						format(plec, sizeof(plec), "m�czyzna");
					}
					else if (skinSex[fakeID] == SKIN_WOMEN)
					{
						format(plec, sizeof(plec), "kobieta"); 
					}
					else{format(plec, sizeof(plec), "nieznana");}
					
					if(skinColor[fakeID] == SKIN_WHITE)
					{
						format(rasa, sizeof(rasa), "Bia�y"); 
					}
					else if(skinColor[fakeID] == SKIN_BLACK)
					{
						format(rasa, sizeof(rasa), "Murzyn"); 
					}
					else if(skinColor[fakeID] == SKIN_YELLOW)
					{
						format(rasa, sizeof(rasa), "Azjata");
					}
					else{format(rasa, sizeof(rasa), "Nieznana");}
					format(string, sizeof(string), "Kupi�e� skina o p�ci: %s, rasy %s", plec, rasa);
					sendTipMessage(playerid, string); 
					SetPlayerSkin(playerid, skinID); 
					//ZabierzKase(playerid, CenySkinow[skinID-20401]); 
					ZabierzKase(playerid, skinCost[fakeID]); 
					PlayerInfo[playerid][pSkin] = skinID; 
				}
			}
			else
			{
				sendErrorMessage(playerid, "Nie posiadasz odpowiedniej ilo�ci got�wki!");
				return 1;
			}
*/