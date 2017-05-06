//premium_dialogs.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//---------------------------------------[ Modu�: premium_dialogs.pwn ]------------------------------------------//
//Opis:
/*

*/
//Adnotacje:
/*

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

//-----------------<[ Dialogi: ]>-------------------

premium_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == PREMIUM_DIALOG(MENU))
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: //Posiadane Mrucznik Coins'y
				{
					DialogDotacje(playerid);
				}
				case 1: //Kup konto premium/przed�u� konto premium
				{
					DialogKupKP(playerid);
				}
				case 2: //Us�ugi premium
				{
					DialogUslugiPremium(playerid);
				}
				case 3: //Rynek Mrucznik Coins�w
				{
					if(IsPlayerPremium(playerid))
						DialogRynekMC(playerid);
					else
					{
						SendClientMessage(playerid, COLOR_GREY, "Tylko gracze z aktywnym kontem premium mog� korzysta� z rynku Mrucznik Coin�w!");
						DialogMenuDotacje(playerid);
					}
				}
				case 4: //Wspom� nasz serwer i otrzymaj Mrucznik Coinsy
				{
					DialogDotacje(playerid);
				}
			}
		}
	}
	//------------------ MENU DIALOG OPTIONS ------------------
	else if(dialogid == PREMIUM_DIALOG(KUP_KP))
	{
		if(response)
		{
			if(PremiumInfo[playerid][pMC] >= MIESIAC_KP_CENA)
			{
				KupKP(playerid);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, "Gratulacje! Konto premium na miesi�c zosta�o przypisane do twojego konta!");
				DialogMenuDotacje(playerid);
			}
			else
			{
				SendClientMessage(playerid, COLOR_LIGHTBLUE, "Nie masz wystarczaj�cej ilo�ci Mrucznik Coin'�w aby przed�u�y�/zakupi� konto premium!");
				DialogKupKP(playerid);
			}
		}
		else
		{
			DialogMenuDotacje(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(USLUGI_PREMIUM))
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: //Licytacje - limitowane okazje
				{
					DialogLicytacje(playerid);
				}
				case 1: //Pojazdy unikatowy
				{
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "Pami�taj, �e aby kupi� pojazd unikatowy musisz znajdowa� si� przy salonie aut.");
					DialogPojazdyPremium(playerid);
				}
				case 2: //Przedmioty specjalne
				{
					DialogPrzedmioty(playerid);
				}
				case 3: //Dodatkowe sloty na pojazdy
				{
					DialogSlotyPojazdu(playerid);
				}
				case 4: //Dodatkowa zmiana nicku
				{
					DialogZmianyNicku(playerid);
				}
				case 5: //Unikatowe skiny
				{
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "Pami�taj, �e aby kupi� unikatowy skin, musisz znajdowa� si� w sklepie z ubraniami.");
					DialogSkiny(playerid);
				}
				case 6: //Zmiana numeru telefonu
				{
					DialogTelefon(playerid);
				}
			}
		}
		else
		{
			DialogMenuDotacje(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(RYNEK_MC))
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: //Oferty kupna Mrucznik Coin�w
				{
					//TODO:
					//
				}
				case 1: //Oferty sprzeda�y Mrucznik Coin�w
				{
					//TODO:
					//
				}
				case 2: //Stw�rz ofert� kupna
				{
					//TODO:
					//
				}
				case 3: //Stw�rz ofert� sprzeda�y
				{
					//TODO:
					//
				}
				case 4: //Moje oferty
				{
					//TODO:
					//
				}
				case 5: //Historia transakcji
				{
					//TODO:
					//
				}
			}
		}
		else
		{
			DialogMenuDotacje(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(DOTACJE))
	{
		DialogMenuDotacje(playerid);
	}
	//------------------ DIALOG US�UGI PREMIUM ------------------
	else if(dialogid == PREMIUM_DIALOG(LICYTACJE))
	{
		if(response)
		{
			//TODO:
			//
		}
		else
		{
			DialogUslugiPremium(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(POJAZDY))
	{
		if(response)
		{
			KupPojazdPremium(playerid, listitem);
		}
		else
		{
			DialogUslugiPremium(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(PRZEDMIOTY))
	{
		if(response)
		{
			//TODO:
			//
		}
		else
		{
			DialogUslugiPremium(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(SLOTY_POJAZDU))
	{
		if(response)
		{
			//TODO:
			//KupSlotPojazdu(playerid);
		}
		else
		{
			DialogUslugiPremium(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(ZMIANY_NICKU))
	{
		if(response)
		{
			//TODO:
			//KupZmianeNicku(playerid);
		}
		else
		{
			DialogUslugiPremium(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(SKINY))
	{
		if(response)
		{
			//TODO:
			//KupSkin(playerid, strval(inputtext));
		}
		else
		{
			DialogUslugiPremium(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(TELEFON))
	{
		if(response)
		{
			//TODO:
			//KupNumerTelefonu(playerid, strval(inputtext));
		}
		else
		{
			DialogUslugiPremium(playerid);
		}
	}
	//------------------ DIALOG RYNEK MC ------------------
	else if(dialogid == PREMIUM_DIALOG(TELEFON))
	{
		
	}
	return 1;
}

DialogMenuDotacje(playerid)
{
	new string[512], kpinfo[40];
	if(IsPlayerPremium(playerid))
		format(kpinfo, sizeof(kpinfo), "Konto premium wygasa %02d.%02d.%d", PremiumInfo[playerid][pExpirationDate][2], PremiumInfo[playerid][pExpirationDate][1], PremiumInfo[playerid][pExpirationDate][0]);
	else
		format(kpinfo, sizeof(kpinfo), "Kup konto premium");
	format(string, sizeof(string), "Posiadane Mrucznik Coins'y: "INCOLOR_GREEN2"%d\n" \
		"%s\n"\
		"Us�ugi premium\n"\
		"Rynek Mrucznik Coins'�w\n"\
		"Wspom� nasz serwer i otrzymaj Mrucznik Coins'y!", 
	PremiumInfo[playerid][pMC], kpinfo);
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(MENU), DIALOG_STYLE_LIST, "Premium", string, "Wybierz", "Wyjd�");
	return 1;
}

//------- MENU DIALOG ------------------
static DialogKupKP(playerid)
{
	new string[256];
	if(IsPlayerPremium(playerid))
		format(string, sizeof(string), "Mo�esz przed�u�y� swoje konto premium o miesi�c za "INCOLOR_GREEN""#MIESIAC_KP_CENA" Mrucznik Coins�w\nCzy chcesz to zrobi�?");
	else
		format(string, sizeof(string), "Mo�esz kupi� swoje konto premium o miesi�c za "INCOLOR_GREEN""#MIESIAC_KP_CENA" Mrucznik Coins�w\nCzy chcesz to zrobi�?");
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(KUP_KP), DIALOG_STYLE_MSGBOX, "Premium - KP", string, "Tak", "Nie");
}

static DialogUslugiPremium(playerid)
{
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(USLUGI_PREMIUM), DIALOG_STYLE_LIST, "Premium - Us�ugi", 
		"Licytacje - limitowane okazje\n"\
		"Pojazdy unikatowy\n"\
		"Przedmioty specjalne\n"\
		"Dodatkowe sloty na pojazdy\n"\
		"Dodatkowa zmiana nicku\n"\
		"Unikatowe skiny\n"\
		"Zmiana numeru telefonu",
	"Wybierz", "Wr��");
}

static DialogRynekMC(playerid)
{
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(RYNEK_MC), DIALOG_STYLE_LIST, "Premium - Rynek MC", 
		"Oferty kupna Mrucznik Coin�w\n"\
		"Oferty sprzeda�y Mrucznik Coin�w\n"\
		"Stw�rz ofert� kupna\n"\
		"Stw�rz ofert� sprzeda�y\n"\
		"Moje oferty\n"\
		"Historia transakcji",
	"Wybierz", "Wr��");
}

static DialogDotacje(playerid)
{
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(DOTACJE), DIALOG_STYLE_MSGBOX, "Premium - Dotacje", 
		"Je�eli wspomo�esz nasz serwer dotacj� o okre�lonej wysoko�ci, otrzymasz od nas okre�lon� ilo�� Mrucznik Coins�w.\n" \
		"Informacje o tym, w jaki spos�b mo�esz wesprze� nasz serwer, znajdziesz na naszym forum\n" \
		INCOLOR_WHITE"www.mrucznik-rp.pl", 
	"Wr��", "");
}

//------- US�UGI PREMIUM ------------------
static DialogLicytacje(playerid)
{
	//zaawansowany system
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(LICYTACJE), DIALOG_STYLE_LIST, "Premium - Us�ugi - Licytacje", 
		"W budowie"\
		"",
	"Wybierz", "Wr��");
}

DialogPojazdyPremium(playerid)
{
	new string[512];
	for(new i; i<MAX_PREMIUM_VEHICLES; i++)
	{
		if(PojazdyPremium[i][Model] != 0)
			format(string, sizeof(string), "%s%s - "INCOLOR_GREEN"%d Mrucznik Coins\n", string, VehicleNames[PojazdyPremium[i][Model]-400], PojazdyPremium[i][Cena]);
	}
	string[strlen(string)-1] = '\0';
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(POJAZDY), DIALOG_STYLE_LIST, "Premium - Us�ugi - Pojazdy", string,"Kup", "Wr��");
}

static DialogPrzedmioty(playerid)
{
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(PRZEDMIOTY), DIALOG_STYLE_LIST, "Premium - Us�ugi - Przedmioty", 
		" "\
		"",
	"Kup", "Wr��");
}

static DialogSlotyPojazdu(playerid)
{
	new string[256];
	format(string, sizeof(string), "Aktualnie posiadasz "INCOLOR_WHITE"%d"INCOLOR_DIALOG" slot�w na pojazdy.\nMo�esz dokupi� dodatkowe sloty za Mrucznik Coiny, lecz nie mo�esz posiada� wi�cej slot�w, ni� "INCOLOR_ORANGE""#MAX_CAR_SLOT""INCOLOR_DIALOG".\nKoszt 1 slota to "INCOLOR_GREEN""#CAR_SLOT_CENA""INCOLOR_DIALOG" Mrucznik Coins.\nAby dokupi� slot, naci�nij"INCOLOR_WHITE"\"Kup\"", PlayerInfo[playerid][pCarSlots]);
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(SLOTY_POJAZDU), DIALOG_STYLE_MSGBOX, "Premium - Us�ugi - Sloty", string, "Kup", "Wr��");
}

static DialogZmianyNicku(playerid)
{
	new string[256];
	format(string, sizeof(string), "Aktualnie posiadasz "INCOLOR_WHITE"%d"INCOLOR_DIALOG" mo�liwo�ci zmiany nicku.\nMo�esz dokupi� dodatkowe zmiany nicku za Mrucznik Coiny.\n\nKoszt 1 zmiany nicku to "INCOLOR_GREEN""#ZMIANA_NICKU_CENA""INCOLOR_DIALOG" Mrucznik Coins.\nAby dokupi� slot, naci�nij"INCOLOR_WHITE"\"Kup\"", PlayerInfo[playerid][pZmienilNick]);
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(ZMIANY_NICKU), DIALOG_STYLE_MSGBOX, "Premium - Us�ugi - Zmiany nicku", string, "Kup", "Wr��");
}

static DialogSkiny(playerid)
{
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(SKINY), DIALOG_STYLE_INPUT, "Premium - Us�ugi - Skiny", 
		"Aby zakupi� unikatowego skina musisz zna� jego ID.\n"\
		"Unikatowy skin mo�esz ustawi� w dowolnym momencie komend� /premiumskin.\n"\
		"Mo�esz posiada� nieograniczon� ilo�� unikatowych skin�w.\n"\
		"Koszt unikatowego skina to "INCOLOR_GREEN""#UNIKATOWY_SKIN_CENA""INCOLOR_DIALOG" Mrucznik Coin�w.\n"\
		"Wpisz ID w okienko ni�ej i naci�nij \"Kup\" aby dokona� zakupu.",
	"Kup", "Wr��");
}

static DialogTelefon(playerid)
{
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(TELEFON), DIALOG_STYLE_INPUT, "Premium - Us�ugi - Telefon", 
		"Aby ustawi� nowy numer telefonu, wpisz go w okienko ni�ej i naci�nij "INCOLOR_WHITE"\"Kup\""INCOLOR_DIALOG".\n"\
		"Ceny numer�w w zale�no�ci od ilo�ci cyfr:\n"\
		"1 cyfra - "INCOLOR_GREEN""#TELEFON_CENA_1""INCOLOR_DIALOG"\n"\
		"2 cyfry - "INCOLOR_GREEN""#TELEFON_CENA_2""INCOLOR_DIALOG"\n"\
		"3 cyfry - "INCOLOR_GREEN""#TELEFON_CENA_3""INCOLOR_DIALOG"\n"\
		"4 cyfry - "INCOLOR_GREEN""#TELEFON_CENA_4""INCOLOR_DIALOG"\n"\
		"wi�cej ni� 4 cyfry - "INCOLOR_GREEN""#TELEFON_CENA_5""INCOLOR_DIALOG"\n",
	"Wybierz", "Wr��");
}