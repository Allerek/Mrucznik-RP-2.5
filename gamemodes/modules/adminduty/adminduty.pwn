//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                 adminduty                                                 //
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
//Opis:
/*
	Zawiera system s�u�by administratora.
	W tym pliku dok�adnie:
		> G��wne CMD adminduty
		> Funkcja SprawdzZnaki
		> Funkcja AdminDutyPlayer - ustawia graczu adminduty
		> Funkcja GetPlayerAdminDutyStatus - pobiera status, czy gracz jest na adminduty.
		> Timer do AdminDuty
*/
// Autor: Simeone
// Data utworzenia: 04.05.2019

//

//-----------------<[ Callbacki: ]>-------------------
//-----------------<[ Funkcje: ]>-------------------
SprawdzZnaki(text[])
{
	new checkAdminNameValue;
	if(strfind(text, "%") == -1 
	&& strfind(text, "_") == -1 
	&& strfind(text, " ") == -1
	&& strfind(text, "!") == -1
	&& strfind(text, "@") == -1
	&& strfind(text, "#") == -1
	&& strfind(text, "$") == -1
	&& strfind(text, "^") == -1
	&& strfind(text, "&") == -1
	&& strfind(text, "*") == -1
	&& strfind(text, "-") == -1
	&& strfind(text, "~") == -1
	&& strfind(text, "=") == -1
	&& strfind(text, "?") == -1
	&& strfind(text, ",") == -1
	&& strfind(text, ".") == -1
	&& strfind(text, "<") == -1
	&& strfind(text, ">") == -1
	&& strfind(text, ")") == -1
	&& strfind(text, "(") == -1
	&& strfind(text, "]") == -1
	&& strfind(text, "[") == -1
	&& strfind(text, "XD") == -1
	&& strfind(text, "}") == -1
	&& strfind(text, "{") == -1
	&& strfind(text, ":") == -1 
	&& strfind(text, "`") == -1 
	&& strfind(text, "/") == -1
	&& strfind(text, "|") == -1

	&& strfind(text, "kurwa") == -1
	&& strfind(text, "jeba�") == -1
	&& strfind(text, "jebac") == -1
	&& strfind(text, "huj") == -1
	&& strfind(text, "cipa") == -1
	&& strfind(text, "kutas") == -1
	&& strfind(text, "chuj") == -1
	&& strfind(text, "69") == -1//Zabezpieczenie Anty-Jupik
	&& strfind(text, "�") == -1
	&& strfind(text, "+") == -1)
	{
		checkAdminNameValue = 0;
	}
	else
	{
		checkAdminNameValue = 1;
	}
	return checkAdminNameValue; 
}

GetPlayerAdminDutyStatus(playerid)
{
	new valueAdminStatus = GetPVarInt(playerid, "dutyadmin");
	return valueAdminStatus; 
}
AdminDutyPlayer(playerid, status)
{
	new string[128];
	SetPVarString(playerid, "pAdminDutyNickOn", PlayerInfo[playerid][pAdminName]); 
	GetPVarString(playerid, "pAdminDutyNickOn", AdminName, sizeof(AdminName)); 
	GetPVarString(playerid, "pAdminDutyNickOff", FirstNickname, sizeof(FirstNickname)); 
	new stringlog[325];//String do logu
	new y1,mi1,d1;//Data
	
	if(status == 1)//Je�eli ma wej��
	{
		AdminDutyTimer[playerid] = SetTimerEx("AdminDutyCzas", 60000, true, "i", playerid);
		format(string, sizeof(string), "Administrator %s [%s] wszed�  na s�u�b� administratora!", AdminName,FirstNickname);
		SendAdminMessage(COLOR_RED, string); 
		MSGBOX_Show(playerid, "Admin Duty ~g~ON", MSGBOX_ICON_TYPE_OK);	
		format(string, sizeof(string), "%s", AdminName); 
		SetPlayerName(playerid, Odpolszcz(string));
		SetPVarInt(playerid, "dutyadmin", 1);
		SetPlayerColor(playerid, 0xFF0000FF);
	
	}
	else//Je�eli ma zej��
	{	
		GetPVarString(playerid, "pAdminDutyNickOn", AdminName, sizeof(AdminName)); 
		GetPVarString(playerid, "pAdminDutyNickOff", FirstNickname, sizeof(FirstNickname)); 
		format(string, sizeof(string), "%s", FirstNickname);
		SetPlayerName(playerid, string); 
		SetPVarInt(playerid, "dutyadmin", 0); 
		SetPlayerColor(playerid,TEAM_HIT_COLOR);
		
		//Komunikaty
		format(string, sizeof(string), "@DUTY: Wykona�e� ->  %d ban�w | %d warn�w | %d kick�w | %d innych akcji!", iloscBan[playerid],iloscWarn[playerid],iloscKick[playerid], iloscInne[playerid]); 
		sendErrorMessage(playerid, string); 
		MSGBOX_Show(playerid, "Admin Duty ~r~OFF", MSGBOX_ICON_TYPE_OK);
		sendTipMessage(playerid, "Dzi�kujemy za sumienn� s�u�b�, administratorze!"); 
		
		//LOG
		getdate(y1, mi1, d1); 
		format(stringlog, sizeof(stringlog), "[%d:%d:%d] Admin %s [%s] zakonczyl sluzbe - wykonal w czasie %d:%d [B%d/W%d/K%d/I%d] - gra dalej", d1, mi1, y1, FirstNickname, AdminName, AdminDutyGodziny[playerid], AdminDutyMinuty[playerid],iloscBan[playerid],iloscWarn[playerid],iloscKick[playerid],iloscInne[playerid]); //GENERATE LOG
		Log(admindutyLog, INFO, stringlog); //Create LOG
		
		//Log dla 0Verte [UID] [RRRR-MM-DD] [HH:mm] [Bany] [Warny] [AJ] [Kicki] [Inne] [Reporty+zapytania] [/w] [/w2] [powod zako�czenia s�u�by]
		format(stringlog, sizeof(stringlog), "%d %d-%d-%d %d:%d %d %d %d %d %d %d %d %d /AdminDuty(2x)", PlayerInfo[playerid][pUID], y1,mi1,d1, AdminDutyGodziny[playerid], AdminDutyMinuty[playerid], iloscBan[playerid], iloscWarn[playerid], iloscAJ[playerid], iloscKick[playerid], iloscInne[playerid], iloscZapytaj[playerid], iloscInWiadomosci[playerid], iloscOutWiadomosci[playerid]);
		Log(admindutyMaszLog, INFO, stringlog);
		
		//Zerowanie zmiennych - po zej�ciu z duty admina :) 
		iloscKick[playerid] = 0;
		iloscWarn[playerid] = 0;
		iloscBan[playerid] = 0;
		iloscInne[playerid] = 0;
		iloscAJ[playerid] = 0;
		iloscInWiadomosci[playerid] = 0;
		iloscOutWiadomosci[playerid] = 0;
		iloscZapytaj[playerid] = 0;
		
		//Timer's kill
		KillTimer(AdminDutyTimer[playerid]);
		AdminDutyGodziny[playerid] = 0;
		AdminDutyMinuty[playerid] = 0;
	
	}

	return 1;
}


//-----------------<[ Timery: ]>-------------------
forward AdminDutyCzas(playerid);
public AdminDutyCzas(playerid)
{
	AdminDutyMinuty[playerid]++;
	if(AdminDutyMinuty[playerid] == 60)
	{
		AdminDutyGodziny[playerid]++;
		AdminDutyMinuty[playerid] = 0;
	
	}
	return 1;
}


//------------------<[ MySQL: ]>--------------------
//-----------------<[ Komendy: ]>-------------------

//end