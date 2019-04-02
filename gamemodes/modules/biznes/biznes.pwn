//biznes.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//------------------------------------------[ Modu�: biznes.pwn ]---------------------------------------------//
//Opis:
/*
	Zawiera system biznes�w == akt�w w�asno�ci
	A dok�adnie:
		> ...
		> ..
*/
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

//

//-----------------<[ Funkcje: ]>-------------------

stock ZaladujBiznesy()
{
    for(new i=0;i<MAX_BIZNES;i++)
	{
		CreateDynamicPickup(19523, 1, BizData[i][eBizWejX], BizData[i][eBizWejY], BizData[i][eBizWejZ], -1, -1, -1, 125.0);
    	CreateDynamic3DTextLabel(BizData[i][eBizName], 0x008080FF, BizData[i][eBizWejX], BizData[i][eBizWejY], BizData[i][eBizWejZ]+0.4, 10.0);
	}
	PickupSklep01 = CreateDynamicPickup(1239, 3, BizData[10][eBizWyjX], BizData[10][eBizWyjY], BizData[10][eBizWyjZ], -1, -1, -1, 10.0);//ZIP
	return 1;
}
stock Biz_Owner(biz)
{
    new lStr[64];
    format(lStr, 64, "SELECT `Nick` FROM mru_konta WHERE `Bizz`='%d'", biz);
    mysql_query(lStr);
    mysql_store_result();
    if(mysql_num_rows())
    {
    	mysql_fetch_row_format(lStr, "|");
		mysql_free_result();
	}
    return lStr;
}

stock ResetBizOffer(playerid)
{
	SetPVarInt(playerid, "Oferujacy_ID", -1);
	SetPVarInt(playerid, "Oferujacy_Cena", 0); 
	SetPVarInt(playerid, "Oferujacy_biz_ID",0);
	SetPVarInt(playerid, "wpisal_sprzedaj_biz", 0);
	return 1;
}
stock CheckBizLocation(bizid)
{
	if(BizData[bizid][eBizLocation] == BIZ_LOCATION_LS)
	{
		format(bizLocation, sizeof(bizLocation), "Los Santos");
	}
	if(BizData[bizid][eBizLocation] == BIZ_LOCATION_DILL)
	{
		format(bizLocation, sizeof(bizLocation), "Dillimore");
	}
	if(BizData[bizid][eBizLocation] == BIZ_LOCATION_PC)
	{
		format(bizLocation, sizeof(bizLocation), "Palomino Creek");
	}
	if(BizData[bizid][eBizLocation] == BIZ_LOCATION_MONT)
	{
		format(bizLocation, sizeof(bizLocation), "Montgomery");
	}
	if(BizData[bizid][eBizLocation] == BIZ_LOCATION_BB)
	{
		format(bizLocation, sizeof(bizLocation), "Blueberry");
	}
	if(BizData[bizid][eBizLocation] == BIZ_LOCATION_LV)
	{
		format(bizLocation, sizeof(bizLocation), "Las Venturas");
	}
	if(BizData[bizid][eBizLocation] == BIZ_LOCATION_SF)
	{
		format(bizLocation, sizeof(bizLocation), "San Fierro");
	}
	if(BizData[bizid][eBizLocation] == BIZ_LOCATION_BS)
	{
		format(bizLocation, sizeof(bizLocation), "Bay Side");
	}
	if(BizData[bizid][eBizLocation] == BIZ_LOCATION_UNKNOW)
	{
		format(bizLocation, sizeof(bizLocation), "Nie znane");
	}
	return bizLocation;
}
stock GiveRandomMoneyBiz(playerid)
{
	new string[128];
	new losuj = random(10);
	new bizid = PlayerInfo[playerid][pPbiskey];
	if(PlayerInfo[playerid][pPbiskey] >= 0 && PlayerInfo[playerid][pPbiskey] <= MAX_BIZNES)
	{
		if(PlayerInfo[playerid][pDonateRank] > 2)
		{
			if(losuj == 1 || losuj == 2 || losuj == 3)//Max kwota
			{
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|___ DOCH�D Z BIZNESU ___|");
				format(string, sizeof(string), "Nazwa biznesu: %s", BizData[bizid][eBizName]);
				SendClientMessage(playerid,COLOR_WHITE, string); 
				format(string, sizeof(string), "  Doch�d z biznesu: $%d", BizData[bizid][eBizMoney]);
				SendClientMessage(playerid,COLOR_WHITE, string);
				SendClientMessage(playerid, COLOR_WHITE, "Bonusy: {FFFF00}Konto Premium");
				SendClientMessage(playerid,COLOR_WHITE, "Tw�j doch�d z biznesu {37AC45}osi�gn�� maksimum"); 
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|_________________________|");
				DajKase(playerid,BizData[bizid][eBizMoney]);
			}
			if(losuj == 4 || losuj == 5 || losuj == 6 || losuj == 7)//Po�owiczny zysk
			{
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|___ DOCH�D Z BIZNESU ___|");
				format(string, sizeof(string), "Nazwa biznesu: %s", BizData[bizid][eBizName]);
				SendClientMessage(playerid,COLOR_WHITE, string); 
				format(string, sizeof(string), "  Doch�d z biznesu: $%d", BizData[bizid][eBizMoney]/2);
				SendClientMessage(playerid,COLOR_WHITE, string);
				SendClientMessage(playerid, COLOR_WHITE, "Bonusy: {FFFF00}Konto Premium");
				SendClientMessage(playerid,COLOR_WHITE, "Tw�j doch�d z biznesu {37AC45}osi�gn�� po�ow�"); 
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|_________________________|");
				DajKase(playerid,BizData[bizid][eBizMoney]/2);
			}
			if(losuj == 8 || losuj == 9)//minimalna strata
			{
				new kwotaStraty = 0-(BizData[bizid][eBizMoney]/2);
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|___ DOCH�D Z BIZNESU ___|");
				format(string, sizeof(string), "Nazwa biznesu: %s", BizData[bizid][eBizName]);
				SendClientMessage(playerid,COLOR_WHITE, string); 
				format(string, sizeof(string), "  Strata z biznesu: $%d", kwotaStraty);
				SendClientMessage(playerid,COLOR_WHITE, string);
				SendClientMessage(playerid, COLOR_WHITE, "Bonusy: {FFFF00}Konto Premium");
				SendClientMessage(playerid,COLOR_WHITE, "Tw�j biznes przyni�s� {FF0000}minimalne straty"); 
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|_________________________|");
				if(GetPlayerMoney(playerid) >= kwotaStraty)
				{
					ZabierzKase(playerid,kwotaStraty);
				}
				else
				{
					if(PlayerInfo[playerid][pAccount] >= kwotaStraty)
					{
						PlayerInfo[playerid][pAccount] = PlayerInfo[playerid][pAccount]-kwotaStraty;
					}
					else
					{
						sendTipMessageEx(playerid,COLOR_RED, "Twoje d�ugi rosn�! Tw�j biznes przynosi kolejne straty"); 
					}
				}
			
			}
			if(losuj == 10)//Du�a strata
			{
				
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|___ DOCH�D Z BIZNESU ___|");
				format(string, sizeof(string), "Nazwa biznesu: %s", BizData[bizid][eBizName]);
				SendClientMessage(playerid,COLOR_WHITE, string); 
				format(string, sizeof(string), "  Strata z biznesu: $%d", BizData[bizid][eBizMoney]);
				SendClientMessage(playerid,COLOR_WHITE, string);
				SendClientMessage(playerid, COLOR_WHITE, "Bonusy: {FFFF00}Konto Premium");
				SendClientMessage(playerid,COLOR_WHITE, "Tw�j biznes przyni�s� {FF0000}du�e straty"); 
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|_________________________|");
				if(GetPlayerMoney(playerid) >= BizData[bizid][eBizMoney])
				{
					ZabierzKase(playerid,BizData[bizid][eBizMoney]);
				}
				else
				{
					if(PlayerInfo[playerid][pAccount] >= BizData[bizid][eBizMoney])
					{
						PlayerInfo[playerid][pAccount] = PlayerInfo[playerid][pAccount]-BizData[bizid][eBizMoney];
					}
					else
					{
						sendTipMessageEx(playerid,COLOR_RED, "Twoje d�ugi rosn�! Tw�j biznes przynosi kolejne straty"); 
					}
				}
			
			}
		}
		else
		{
			if(losuj == 1 || losuj == 2)//Max kwota
			{
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|___ DOCH�D Z BIZNESU ___|");
				format(string, sizeof(string), "Nazwa biznesu: %s", BizData[bizid][eBizName]);
				SendClientMessage(playerid,COLOR_WHITE, string); 
				format(string, sizeof(string), "  Doch�d z biznesu: $%d", BizData[bizid][eBizMoney]);
				SendClientMessage(playerid,COLOR_WHITE, string);
				SendClientMessage(playerid,COLOR_WHITE, "Tw�j doch�d z biznesu {37AC45}osi�gn�� maksimum"); 
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|_________________________|");
				DajKase(playerid,BizData[bizid][eBizMoney]);
			}
			if(losuj == 4 || losuj == 5 || losuj == 6 )//Po�owiczny zysk
			{
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|___ DOCH�D Z BIZNESU ___|");
				format(string, sizeof(string), "Nazwa biznesu: %s", BizData[bizid][eBizName]);
				SendClientMessage(playerid,COLOR_WHITE, string); 
				format(string, sizeof(string), "  Doch�d z biznesu: $%d", BizData[bizid][eBizMoney]/2);
				SendClientMessage(playerid,COLOR_WHITE, string);
				SendClientMessage(playerid,COLOR_WHITE, "Tw�j doch�d z biznesu {37AC45}osi�gn�� po�ow�"); 
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|_________________________|");
				DajKase(playerid,BizData[bizid][eBizMoney]/2);
			}
			if(losuj == 7 || losuj == 8 || losuj == 3)//minimalna strata
			{
				new kwotaStraty = 0-(BizData[bizid][eBizMoney]/2);
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|___ DOCH�D Z BIZNESU ___|");
				format(string, sizeof(string), "Nazwa biznesu: %s", BizData[bizid][eBizName]);
				SendClientMessage(playerid,COLOR_WHITE, string); 
				format(string, sizeof(string), "  Strata z biznesu: $%d", kwotaStraty);
				SendClientMessage(playerid,COLOR_WHITE, string);
				SendClientMessage(playerid,COLOR_WHITE, "Tw�j biznes przyni�s� {FF0000}minimalne straty"); 
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|_________________________|");
				if(GetPlayerMoney(playerid) >= kwotaStraty)
				{
					ZabierzKase(playerid,kwotaStraty);
				}
				else
				{
					if(PlayerInfo[playerid][pAccount] >= kwotaStraty)
					{
						PlayerInfo[playerid][pAccount] = PlayerInfo[playerid][pAccount]-kwotaStraty;
					}
					else
					{
						sendTipMessageEx(playerid,COLOR_RED, "Twoje d�ugi rosn�! Tw�j biznes przynosi kolejne straty"); 
					}
				}
			
			}
			if(losuj == 9 || losuj == 10)//Du�a strata
			{
				
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|___ DOCH�D Z BIZNESU ___|");
				format(string, sizeof(string), "Nazwa biznesu: %s", BizData[bizid][eBizName]);
				SendClientMessage(playerid,COLOR_WHITE, string); 
				format(string, sizeof(string), "  Strata z biznesu: $%d", BizData[bizid][eBizMoney]);
				SendClientMessage(playerid,COLOR_WHITE, string);
				SendClientMessage(playerid,COLOR_WHITE, "Tw�j biznes przyni�s� {FF0000}du�e straty"); 
				SendClientMessage(playerid,COLOR_LIGHTBLUE, "|_________________________|");
				if(GetPlayerMoney(playerid) >= BizData[bizid][eBizMoney])
				{
					ZabierzKase(playerid,BizData[bizid][eBizMoney]);
				}
				else
				{
					if(PlayerInfo[playerid][pAccount] >= BizData[bizid][eBizMoney])
					{
						PlayerInfo[playerid][pAccount] = PlayerInfo[playerid][pAccount]-BizData[bizid][eBizMoney];
					}
					else
					{
						sendTipMessageEx(playerid,COLOR_RED, "Twoje d�ugi rosn�! Tw�j biznes przynosi kolejne straty"); 
					}
				}
			}
		}
	}
	else
	{
		SendClientMessage(playerid,COLOR_LIGHTBLUE, "|___ DOCH�D Z BIZNESU ___|");
		format(string, sizeof(string), "Brak posiadanego biznesu!");
		SendClientMessage(playerid, COLOR_WHITE, string); 
		SendClientMessage(playerid,COLOR_LIGHTBLUE, "|_________________________|");
	}
	return 1;
}


//-----------------<[ Komendy: ]>-------------------
CMD:dajbiznes(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] == 5000 || PlayerInfo[playerid][pAdmin] == 5001)
	{
		new gracz, wartosc;
		if(sscanf(params, "k<fix>d", gracz, wartosc)) return sendTipMessage(playerid, "U�yj /dajbiznes [playerid/Cz��Nicku] [ID Biznesu]");
		if(IsPlayerConnected(gracz))
		{
			new string[128];
			PlayerInfo[gracz][pPbiskey] = wartosc;
			MruMySQL_SaveAccount(playerid);
			format(string, sizeof(string),"AdmCmd: %s dal biznes %s (ID %d) graczowi %s.", GetNick(playerid), BizData[wartosc][eBizName], wartosc, GetNick(gracz));
            BiznesLog(string);
            _MruAdmin(playerid, sprintf("Da�e� biznes %s (ID %d) graczowi %s [ID: %d]", BizData[wartosc][eBizName], wartosc, GetNick(gracz, true), gracz));
            if(gracz != playerid) _MruAdmin(gracz, sprintf("Dosta�e� biznes %s (ID %d) Admina %s [ID: %d]", BizData[wartosc][eBizName], wartosc, GetNick(playerid, true), playerid));
		}
		else
		{
			sendErrorMessage(playerid, "Ten gracz jest offline!");
		}

	}
	else
	{
		noAccessMessage(playerid);
	}
	return 1;
}
CMD:sprzedajbiznes(playerid, params[])
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
				if(IsPlayerInRangeOfPoint(playerid, 
				5.0, 
				BizData[PlayerInfo[playerid][pPbiskey]][eBizWejX], 
				BizData[PlayerInfo[playerid][pPbiskey]][eBizWejY],
				BizData[PlayerInfo[playerid][pPbiskey]][eBizWejZ]))
				{
				
					if(valueCost <= BIZ_SELL_MONEY_LIMIT)
					{
						if(GetPlayerMoney(giveplayerid) >= valueCost)
						{
							if(GetPVarInt(playerid, "wpisal_sprzedaj_biz") == 0)
							{
								sendTipMessage(playerid, "Pami�taj, �e Wydzia� Planowania otr�ci podatek w wysoko�ci 1/5 podanej kwoty."); 
								sendTipMessage(playerid, "Je�eli akceptujesz podane warunki wpisz ponownie komend�"); 
								SetPVarInt(playerid, "wpisal_sprzedaj_biz", 1); 
							}
							else
							{
								format(string, sizeof(string), "Wys�a�e� ofert� do %s odno�nie kupna biznesu [ID %d] za %d", GetNick(giveplayerid, true), PlayerInfo[playerid][pPbiskey], valueCost);
								sendTipMessage(playerid, string);
								sendTipMessage(playerid, "Oczekuj na akceptacje"); 
								
								
								//do giveplayerid
								format(string, sizeof(string), "Gracz %s oferuje Ci kupno biznesu [ID: %d] za kwot� %d$, wpisz /akceptuj biznes", GetNick(playerid, true), PlayerInfo[playerid][pPbiskey], valueCost); 
								sendTipMessage(giveplayerid, string); 
								SetPVarInt(giveplayerid, "Oferujacy_ID", playerid);
								SetPVarInt(giveplayerid, "Oferujacy_Cena", valueCost); 
								SetPVarInt(giveplayerid, "Oferujacy_biz_ID", PlayerInfo[playerid][pPbiskey]); 
							}
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
					sendTipMessage(playerid, "Nie znajdujesz si� pod swoim biznesem"); 
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
			sendErrorMessage(playerid, "Nie ma takiego gracza"); 
		}
	}
	return 1;
}
CMD:zabierzbiznes(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] == 5000 || PlayerInfo[playerid][pAdmin] == 5001)
	{
		new gracz;
		if(sscanf(params, "d", gracz)) return sendTipMessage(playerid, "U�yj /zabierzbiznes [playerid/Cz��Nicku]");
		if(IsPlayerConnected(gracz))
		{
			new string[128];
			PlayerInfo[gracz][pPbiskey] = 255;
			MruMySQL_SaveAccount(playerid);
			format(string, sizeof(string),"AdmCmd: %s zabral biznes graczowi %s.", GetNick(playerid), GetNick(gracz));
            BiznesLog(string);
            _MruAdmin(playerid, sprintf("Zabra�e� biznes graczowi %s [ID: %d]", GetNick(gracz, true), gracz));
            if(gracz != playerid) _MruAdmin(gracz, sprintf("Biznes zosta� zabrany przez Admina %s [ID: %d]", GetNick(playerid, true), playerid));
		}
		else
		{
			sendErrorMessage(playerid, "Ten gracz jest offline!");
		}

	}
	else
	{
		noAccessMessage(playerid);
	}
	return 1;
}
CMD:bizlock(playerid)
{
	if(PlayerInfo[playerid][pPbiskey] >= 0 && PlayerInfo[playerid][pPbiskey] <= MAX_BIZNES)
	{
		new bizid = PlayerInfo[playerid][pPbiskey];
		new string[128];
		if(BizOpenStatus[bizid] == 0)
		{
			if(IsPlayerInRangeOfPoint(playerid, 5.0, BizData[bizid][eBizWejX], BizData[bizid][eBizWejY], BizData[bizid][eBizWejZ]))
			{
				format(string, sizeof(string), "%s przekr�ca kluczyk i otwiera biznes %s", GetNick(playerid, true), BizData[bizid][eBizName]);
				ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				BizOpenStatus[bizid] = 1;
			}
			else
			{
				sendErrorMessage(playerid, "Musisz by� pod drzwiami swojego biznesu, aby tego dokona�!"); 
			}
		}
		else
		{
			if(IsPlayerInRangeOfPoint(playerid, 5.0, BizData[bizid][eBizWejX], BizData[bizid][eBizWejY], BizData[bizid][eBizWejZ]))
			{
				format(string, sizeof(string), "%s przekr�ca kluczyk i zamyka biznes %s", GetNick(playerid, true), BizData[bizid][eBizName]);
				ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				BizOpenStatus[bizid] = 0;
			}
			else
			{
				sendErrorMessage(playerid, "Musisz by� pod drzwiami swojego biznesu, aby tego dokona�!"); 
			}
		
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie masz w�asnego biznesu! ~ Zakup go w Wydziale Planowania."); 
	}
	return 1;
}
CMD:bizmoneydebug(playerid)
{
	
	/*    new string[128];
		new bizid = PlayerInfo[playerid][pPbiskey];
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "|___ DOCH�D Z BIZNESU ___|");
		format(string, sizeof(string), "  Doch�d z biznesu: $%d", BizData[bizid][eBizMoney]);
		SendClientMessage(playerid, COLOR_WHITE, string);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "|________________________|");
		DajKase(playerid, BizData[bizid][eBizMoney]);*/
	if(PlayerInfo[playerid][pAdmin] > 5000)
	{
		GiveRandomMoneyBiz(playerid);	
	}
	return 1;
}
CMD:bizinfo(playerid)
{
    if(IsPlayerConnected(playerid))
    {
	    if(gPlayerLogged[playerid] == 1)
	    {
			new string[256];
			for(new i=0;i<MAX_BIZNES;i++)
		    {
				if(IsPlayerInRangeOfPoint(playerid, 3.0, BizData[i][eBizWejX], BizData[i][eBizWejY], BizData[i][eBizWejZ]))
				{
				    new bizowner[64];
					bizowner = Biz_Owner(i);
					CheckBizLocation(i);
        			if(strfind(bizowner, "mru_konta", true)>=0)
					{
					    format(string, sizeof(string), "{ff704d}NIERUCHOMO�� [0%d]\n{fbfe00}[%s]\n\n{ffffff}W�a�ciciel:\tBrak (biznes na sprzeda�)\nPremia PayDay:\t%d$\nLokalizacja:\t%s", i, BizData[i][eBizName],BizData[i][eBizMoney], bizLocation);
	        			ShowPlayerDialogEx(playerid, 9900, DIALOG_STYLE_MSGBOX, "Informacje o biznesie", string, "Zamknij", "");
					}
					else
					{
					    format(string, sizeof(string), "{ff704d}NIERUCHOMO�� [0%d]\n{fbfe00}[%s]\n\n{ffffff}W�a�ciciel:\t%s\nPremia PayDay:\t%d$\nLokalizacja:\t%s", i, BizData[i][eBizName],bizowner,BizData[i][eBizMoney], bizLocation);
	        			ShowPlayerDialogEx(playerid, 9900, DIALOG_STYLE_MSGBOX, "Informacje o biznesie", string, "Zamknij", "");
	 				}
                }
			}
	    }
	}
	return 1;
}


//-----------------<[ Timery: ]>-------------------


//end