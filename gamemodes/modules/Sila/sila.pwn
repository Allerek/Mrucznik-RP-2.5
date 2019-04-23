//sila.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//------------------------------------------[ Modu�: sila.pwn ]---------------------------------------------//
//Opis:
/*
//Odnosi si� do komend: /wezdragi;
//Autor: Simeone
//Data: 26-02-2019
//Opis: 
System si�y to rewolucja na serwerze Mrucznik Role_Play. Dzi�ki sile mo�emy realnie prze�o�y� akcje na posta�.
Przyk�adowo: Gracz X (200V) i policjant Y (25V) - policjant pr�buje aresztowa� gracza, gracz wyrywa si� bez wi�kszego problemu.
RE: Ta sama sytuacja, z tym, �e policjant ma ju� 1/2 warto�ci si�y gracza - wtedy gracz ma zaledwie 25% na ucieczk�, kt�re maleje z ka�dym policjantem obok.
Wnioski? Dzi�ki temu systemowi, gracze b�d� mieli realne szanse uciec z aresztowania i /przetrwa�/, a dla PD b�dzie wyzwaniem z�apa� 140 kilowego sku*wysyna.

Przyk�ad drugi: Gracz X (350V) chce pobi� gracza Y (50V) - dochodzi do pobicia bez wi�kszego oporu. Jednak, je�li gracz Y ma o drobin� wi�ksz� warto�� (ni� 1/7 gracza X), 
wtedy system odpala mo�liwo�� /szansy/ i oblicza procentowo udzia�. 

Si�� mo�emy zdoby� poprzez 4 mo�liwe sposoby (mo�liwe, �e w przysz�o�ci zwi�kszy si� ich liczba):
>Admin mo�e j� nada� komend� /setstrong
>Biegaj�c (skryptem do biegu)
>�wicz�c na si�owni
>P�ywaj�c na basenie Tsunami

Dodatkowo za�ywanie narkotyk�w daje boosta (2x si�y) na okres 5 minut. Jednak, je�li b�dziemy tego nadu�ywa�, skrypt odbierze nam -15V si�y :D 
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
stock AddStrong(playerid, wartosc)
{
	if(PlayerInfo[playerid][pStrong]+wartosc <= MAX_STRONG_VALUE)
	{
		PlayerInfo[playerid][pStrong] = PlayerInfo[playerid][pStrong]+wartosc; 
		new tekststring[128];
		format(tekststring, sizeof(tekststring), "Sila +%d", wartosc);
		MSGBOX_Show(playerid, tekststring, MSGBOX_ICON_TYPE_EXPLODE, 3);
	}
	else
	{
		sendTipMessage(playerid, "Error: Nie uda�o si� zabra� warto�ci Si�y - przekroczy 5k");
	}

	return 1;
}	
stock TakeStrong(playerid, wartosc)
{
	if(PlayerInfo[playerid][pStrong] >= wartosc)
	{
		PlayerInfo[playerid][pStrong] = PlayerInfo[playerid][pStrong]-wartosc; 
		new tekststring[128];
		format(tekststring, sizeof(tekststring), "Sila -%d", wartosc);
		MSGBOX_Show(playerid, tekststring, MSGBOX_ICON_TYPE_EXPLODE, 3);
	}
	else
	{
		sendTipMessage(playerid, "Error: Nie uda�o si� zabra� warto�ci Si�y");
	}

	return 1;
}
stock SetStrong(playerid, wartosc)
{
	if(wartosc <= MAX_STRONG_VALUE)
	{
		PlayerInfo[playerid][pStrong] = wartosc;
	}
	return 1;
}
stock EndRunPlayer(playerid, wartosc)
{

	DisablePlayerCheckpoint(playerid);

	sendTipMessage(playerid, "Gratulacje! Uko�czy�e� ca�y bieg.");
	
	SetPVarInt(playerid, "ZaliczylBaze", 0);
	SetPVarInt(playerid, "WybralBieg", 0);
	SetPVarInt(playerid, "RozpoczalBieg", 0);
	PlayerRunStat[playerid]++;
	new string[128];
	format(string, sizeof(string), "To tw�j %d bieg dzi�", PlayerRunStat[playerid]);
	sendTipMessage(playerid, string);
	AddStrong(playerid, wartosc);
	OszukujewBiegu[playerid] = 0;
	
	return 1;
}
stock GetPlayerStrong(playerid)
{
	new strongVal = PlayerInfo[playerid][pStrong];
	return strongVal; 
}
stock CreateNewRunCheckPoint(playerid, Float:x, Float:y, Float:z, Float:range, text[], strongValue, bool:strongadd=false, bool:sendTip=true)
{
	DisablePlayerCheckpoint(playerid);

	if(strlen(text) >= 2)
	{
		if(sendTip == true)
		{
			sendTipMessage(playerid, text);
		}
	}
	SetPlayerCheckpoint(playerid, x,y,z, range);
	bazaCheck[playerid] = SetTimerEx("BazaCheckPoint",5000,0,"d",playerid);
	bazaOszust[playerid] = SetTimerEx("BazaCheckOszust", 5000, 0, "d", playerid);
	OszukujewBiegu[playerid] = 1;
	if(strongadd == true)
	{
		AddStrong(playerid, strongValue);
	}

	return 1;
}


//-----------------<[ Komendy: ]>-------------------
CMD:setstrong(playerid, params[])
{
	new valueStrong, giveplayerid;
	new string[128];
	if( sscanf(params, "k<fix>d", giveplayerid, valueStrong))
	{
		sendTipMessage(playerid, "U�yj /setstrong [ID] [Warto��] ");
		return 1;
	}
	if(valueStrong >= MAX_STRONG_VALUE)
	{
		format(string, sizeof(string), "Nie mo�esz ustali� warto�ci wi�kszej jak %d", MAX_STRONG_VALUE);
		sendTipMessage(playerid, string); 
		return 1;
	}
	if(IsPlayerConnected(playerid) && IsPlayerConnected(giveplayerid))
	{
		if(PlayerInfo[giveplayerid][pStrong] != MAX_STRONG_VALUE)
		{
			if(PlayerInfo[playerid][pAdmin] >= 3500 || PlayerInfo[playerid][pNewAP] == 5)
			{
				format(string, sizeof(string), "Administrator %s ustali� Ci warto�� si�y na %d [Poprzednia warto�� %d]", GetNick(playerid), valueStrong, PlayerInfo[giveplayerid][pStrong]);
				sendTipMessageEx(giveplayerid, COLOR_P@, string);
				format(string, sizeof(string), "Ustali�e� warto�� si�y %s na %d - jego poprzednia warto�� to %d", GetNick(giveplayerid), valueStrong, PlayerInfo[giveplayerid][pStrong]); 
				sendTipMessageEx(playerid, COLOR_P@, string); 
				PlayerInfo[giveplayerid][pStrong] = valueStrong;
			}
			else
			{
				sendTipMessage(playerid, "Brak wystarczaj�cych uprawnie�"); 
				return 1;
			}
		}
		else
		{
			sendTipMessage(playerid, "Ten gracz ma ju� maksymaln� warto�� si�y!"); 
			return 1;
		}
	
	}
	else
	{
		sendTipMessage(playerid, "Gracz nie jest pod��czony"); 
	}
	return 1;
}
//=================> Zdobywanie punkt�w si�y poprzez bieg
CMD:trasybiegu(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(GetPVarInt(playerid, "RozpoczalBieg") == 1)
		{
			sendTipMessage(playerid, "Aktualnie jeste� podczas biegu, uko�cz go!"); 
			return 1;
		}
		ShowPlayerDialogEx(playerid, 1012, DIALOG_STYLE_TABLIST_HEADERS, "Mrucznik Role Play","Numer Trasy:\tMinimalny LVL:\tBieg doda:\n\
		Trasa [1]\t[0V_LVL]\t[+15V]\n\
		Trasa [2]\t[0V_LVL]\t[+20V]\n\
		Trasa [3]\t[100V_LVL]\t[+25V]\n\
		Trasa [4]\t[100V_LVL]\t[+25V]\n\
		Trasa [5]\t[400V_LVL]\t[+30V]",
		"Prowad�", "Odrzu�");
	
		return 1;
	}
	return 1;
}
CMD:biegnij(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pAdmin] >= 2000)//chwilowa blokada
		{
			if(GetPlayerStrong(playerid) <= 980)
			{
				if(!IsPlayerInAnyVehicle(playerid))
				{
					if(GetPVarInt(playerid, "RozpoczalBieg") == 1)
					{
						sendErrorMessage(playerid, "Rozpocz��e� ju� bieg! Najpierw go uko�cz"); 
						return 1;
					}
					if(PlayerRunStat[playerid] == 3)
					{
						sendTipMessage(playerid, "Wykona�e� dzi� 3 biegi! Mo�e wystarczy?");
						return 1;
					}
					if(IsPlayerInRangeOfPoint(playerid, 10, 2005.9244,-1442.3917,13.5631))//Od szpitala Jeff do Placu
					{
						SetPVarInt(playerid, "ZaliczylBaze", 0);
						SetPVarInt(playerid, "WybralBieg", 1);
						SetPVarInt(playerid, "RozpoczalBieg", 1);
						if(GetPVarInt(playerid, "ZaliczylBaze") == 0)
						{
							SetPlayerCheckpoint(playerid, 1861.5981,-1453.0206,13.5625, 5);
							sendTipMessage(playerid, "Rozpoczynasz bieg, zdob�d� pierwszy checkpoint!");
							sendTipMessageEx(playerid, COLOR_NEWS, "Cel: Plac Manewrowy Los Santos"); 
						}
					}
					else if(IsPlayerInRangeOfPoint(playerid, 10, 806.4952,-1334.9512,13.5469))//Od dworca Market do Pos�gu ILOVELS
					{
						SetPVarInt(playerid, "ZaliczylBaze", 0);
						SetPVarInt(playerid, "WybralBieg", 2);
						SetPVarInt(playerid, "RozpoczalBieg", 1);
						if(GetPVarInt(playerid, "ZaliczylBaze") == 0)
						{
							sendTipMessage(playerid, "Rozpoczynasz bieg, zdob�d� pierwszy checkpoint!");
							sendTipMessageEx(playerid, COLOR_NEWS, "Cel: Pos�g I_LOVE_LS"); 
							SetPlayerCheckpoint(playerid, 645.5999,-1327.7279,13.5522, 3);
						}
					}
					else
					{
						sendTipMessage(playerid, "Nie jeste� na jednym z mo�liwych tor�w biegu"); 
						return 1;
					}
				}
				else
				{
					sendTipMessage(playerid, "Najpierw wyjd� z pojazdu"); 
				}
			}
			else
			{
				sendTipMessage(playerid, "Jeste� ju� maksymalnie wysportowany! Bieg Ci nic nie da"); 
			}
		}
	}
	return 1;
}
CMD:stopbieg(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(GetPVarInt(playerid, "RozpoczalBieg") == 1)
		{
			SetPVarInt(playerid, "RozpoczalBieg", 0);
			SetPVarInt(playerid, "ZaliczylBaze", 0);
			DisablePlayerCheckpoint(playerid);
		}
		else
		{
			sendTipMessage(playerid, "Nie rozpocz��e� biegu");
		}
	
	}
	return 1;
}


//-----------------<[ Timery: ]>-------------------
forward BazaCheckOszust(playerid);
public BazaCheckOszust(playerid)
{
	new timeSec[MAX_PLAYERS];
	timeSec[playerid]++;
	if(timeSec[playerid] == 2)
	{
		OszukujewBiegu[playerid] = 0;
		KillTimer(bazaOszust[playerid] );
	}
	return 1;
}
forward BazaCheckPoint(playerid);
public BazaCheckPoint(playerid)
{
	if(GetPVarInt(playerid, "ZaliczylBaze") == 0)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 1);
		return KillTimer(bazaCheck[playerid]);
	}
	if(GetPVarInt(playerid, "ZaliczylBaze") == 1)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 2);
		return KillTimer(bazaCheck[playerid]);
	}
	if(GetPVarInt(playerid, "ZaliczylBaze") == 2)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 3);
		return KillTimer(bazaCheck[playerid]);
	}
	if(GetPVarInt(playerid, "ZaliczylBaze") == 3)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 4);
		return KillTimer(bazaCheck[playerid]);
	}
	if(GetPVarInt(playerid, "ZaliczylBaze") == 4)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 5);
		return KillTimer(bazaCheck[playerid]);
	}
	if(GetPVarInt(playerid, "ZaliczylBaze") == 5)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 6);
		return KillTimer(bazaCheck[playerid]);
	}
	if(GetPVarInt(playerid, "ZaliczylBaze") == 6)
	{
		SetPVarInt(playerid, "ZaliczylBaze", 7);
	}
	KillTimer(bazaCheck[playerid]);

	return 1;
}
forward EfektNarkotyku(playerid);
public EfektNarkotyku(playerid)
{
	new FirstValue = GetPVarInt(playerid, "FirstValueStrong");
	efektNarkotykuMinuta[playerid]++; 
	if(efektNarkotykuMinuta[playerid] == TIME_OF_DRUG_ACTIVITY)
	{
		SetStrong(playerid, FirstValue);
		sendTipMessage(playerid, "Warto�� twojej si�y wr�ci�a do normy"); 
		KillTimer(TimerEfektNarkotyku[playerid]);
	}

	return 1;
}

//end