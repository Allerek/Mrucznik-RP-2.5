//dragi.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//------------------------------------------[ Modu�: chaty.pwn ]---------------------------------------------//
//Opis:
/*
	Zawiera skrypt narkotyk�w Mrucznik Role Play. 
		>By Simeone
	
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


//======================================[ZA�YWANIE NARKOTYK�W]=========================================
stock GetPlayerStoned(playerid)
{
	new statusStoned = GetPVarInt(playerid, "playerStonedStatus"); 
	return statusStoned;
}
stock SetPlayerTextEffect(playerid, string)
{

	return 1;
}
stock PlayerStonedKill(playerid)
{
	SetPlayerHealth(playerid, 20); 
	TogglePlayerControllable(playerid, 0); 
	format(string, sizeof(string), "%s pada na ziemi� z przedawkowania, traci przytomno��", GetNick(playerid, true)); 
	ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.1, 0, 0, 0, 0, 0, 1);
	new pZone[MAX_ZONE_NAME];
    GetPlayer2DZone(playerid, pZone, MAX_ZONE_NAME);
	format(string, sizeof(string), "%s potrzebuje pomocy medyka! Jest na %s . Prawdopodobnie przedawkowa�", GetNick(playerid, true), pZone); 
	SendFamilyMessage(FRAC_MC, COLOR_YELLOW, string);
	SetTimerEx("StonedDrugPlayer", 60000, true, "i", playerid);
	return 1;
}
stock CreatePlayerDrugEffect(playerid, level)
{
	new Float:pX, Float:pY, Float:pZ;
	GetPlayerPos(playerid, pX, pY, pZ); 
	
	if(level == 0)
	{
	
	}
	if(level == 1)
	{
		SetPlayerDrunkLevel(playerid, 100); 
		drugObject[playerid] = AttachDynamicObjectToPlayer(3528, playerid, 2, 4, 2, pX, pY, pZ);
	}
	return 1;
}
stock SetPlayerStoned(playerid, timeStoned, drug)
{
	if(IsPlayerConnected(playerid))
	{
		new string[128];
		new Float:playHealth;
		if(GetPlayerStoned == 4)
		{
				new losowanie = random(2);
			if(losowanie = 1)
			{
				sendTipMessage(playerid, "Jeste� tak na�pany, �e zapomnia�e� jak tego u�y�!"); 
			}
			if(losowanie = 2)
			{
				PlayerStonedKill(playerid); 
			}
			return 1;
		}
		
		
		if(drug == 0)//Crack
		{
			sendTipMessage(playerid, "U�y�e� narkotyku: Crack"); 
			PlayerInfo[playerid][pDrug0]--;
			format(string, sizeof(string), "%s wyci�ga z kieszeni lufk�, napycha do niej cracku i odpala.", GetNick(playerid, true));
			SetPVarInt(playerid, "playerStonedStatus", GetPlayerStoned(playerid)+1); 
			CreatePlayerDrugEffect(playerid, 1); 
		}
		if(drug == 1)
		{
			sendTipMessage(playerid, "U�y�e� narkotyku: Green God");
			PlayerInfo[playerid][pDrug1]--;
			format(string, sizeof(string), "%s wyci�ga z kieszeni woreczek z zielonymi kapsu�kami, za�ywa jedn�", GetNick(playerid, true)); 
			SetPVarInt(playerid, "playerStonedStatus", GetPlayerStoned(playerid)+1); 
			CreatePlayerDrugEffect(playerid, 2); 
		}
		if(drug == 2)
		{
			sendTipMessage(playerid, "U�y�e� narkotyku: Marihuana"); 
			PlayerInfo[playerid][pDrug2]--;
			format(string, sizeof(string), "%s wyci�ga z kiezeni skr�ta, odpala go", GetNick(playerid, true)); 
			SetPVarInt(playerid, "playerStonedStatus", GetPlayerStoned(playerid)+1);
			CreatePlayerDrugEffect(playerid, 0); 			
		}
		
		ProxDetector(10.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		SetPlayerTextEffect(playerid, "Na�pany"); 
		timeStoned = timeStoned*1000; 
		SetTimerEx("EfektNarkotyku2", timeStoned, false, "i", playerid);
		
		
		
		
		if(GetPVarInt(playerid, "ZjadlDragi") == 0)
		{
			if(PlayerInfo[playerid][pStrong] < MAX_STRONG_VALUE/2)
			{
				SetPVarInt(playerid, "ZjadlDragi", 1);
				sendTipMessageEx(playerid, COLOR_P@, "Za�y�e� narkotyki, twoja si�a wzros�a dwukrotnie na jaki� czas"); 
				format(string, sizeof(string), "Mia�e� %d , po za�yciu 2 gram masz %d si�y.", PlayerInfo[playerid][pStrong], PlayerInfo[playerid][pStrong]*2);
				sendTipMessage(playerid, string);
				SetPVarInt(playerid, "FirstValueStrong", PlayerInfo[playerid][pStrong]);
				SetStrong(playerid, PlayerInfo[playerid][pStrong]*2);
				TimerEfektNarkotyku[playerid] = SetTimerEx("EfektNarkotyku", 60000, false, "i", playerid);
			}
			else
			{
				sendTipMessage(playerid, "Masz zbyt du�� warto�� si�y, aby dragi Ci co� da�y!"); 
			}
		}
		else
		{
			if(PlayerInfo[playerid][pStrong] >= 15)
			{
				sendTipMessage(playerid, "�pun, przez tw�j na��g spada Ci warto�� si�y!");
				MSGBOX_Show(playerid, "Sila -15", MSGBOX_ICON_TYPE_EXPLODE, 3);
				TakeStrong(playerid, 15);
				new StrongValue = GetPVarInt(playerid, "FirstValueStrong"); 
				SetPVarInt(playerid, "FirstValueStrong", StrongValue-15);
			}
			else
			{
				sendTipMessage(playerid, "�pun, przez tw�j na��g spada Ci warto�� si�y!");
				MSGBOX_Show(playerid, "Sila -15", MSGBOX_ICON_TYPE_EXPLODE, 3);
			}
		}

		//zabawa �yciem
		GetPlayerHealth(playerid, playHealth); 
		SetPlayerHealth(playerid, playHealth-5); 
		if(GetPlayerHealth(playerid, playHealth) <= 5) 
		{
			PlayerStonedKill(playerid); 
		}
	}
	return 1;
}

forward StonedDrugPlayer(playerid);
public StonedDrugPlayer(playerid)
{
	sendTipMessage(playerid, "Podnosisz si�"); 
	TogglePlayerControllable(playerid, 0); 
	ClearAnimations(playerid, 0); 
	SetPlayerTextEffect(playerid, ""); 
	DestroyObject(drugObject[playerid]); 
	return 1;
}
forward EfektNarkotyku2(playerid);
public EfektNarkotyku2(playerid)
{
	DestroyObject(drugObject[playerid]);
	sendTipMessage(playerid, "Efekt narkotyku powoli spada"); 
	SetPlayerTextEffect(playerid, ""); 
	SetPlayerDrunkLevel(playerid, 0); 
	return 1;
}

//=============================[POZYSKIWANIE NARKOTYK�W]==============================



