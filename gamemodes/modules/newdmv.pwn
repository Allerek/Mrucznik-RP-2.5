CMD:dmv(playerid, params[]) return cmd_dmv_info(playerid, params);
CMD:dmv_info(playerid, params[])
{
	new string[256];
	new sendername[MAX_PLAYER_NAME];
	new content[256];

    if(IsPlayerConnected(playerid))
    {
		if(!IsAUrzednik(playerid))
		{
 			sendErrorMessage(playerid, "Nie jeste� urz�dnikiem!");
		    return 1;
		}
		if(PlayerInfo[playerid][pRank] < 2)
		{
		    sendErrorMessage(playerid, "Musisz mie� 2 range aby tego u�ywa�!");
		    return 1;
		}
		if(GetPVarInt(playerid, "dutyadmin") == 1)
		{
			sendErrorMessage(playerid, "Dobry admin nie powinien robi� OOC w IC! Napisz to poprzez /o tre��");
			return 1;
		}
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj (/dmv)-info [tekst]");
			return 1;
		}
		if(PlayerInfo[playerid][pBP] >= 1)
		{
		    format(string, sizeof(string), "Nie mo�esz napisa� na tym czacie, gdy� masz zakaz pisania na globalnych czatach! Minie on za %d godzin.", PlayerInfo[playerid][pBP]);
			sendTipMessage(playerid, string, TEAM_CYAN_COLOR);
			return 1;
		}
		GetPVarString(playerid, "trescOgloszenia", content, sizeof(content));
		if(spamujeKomunikatami[playerid] == 1)
		{
			new ammountTime;
			ammountTime = 15-komunikatMinuty[playerid];
			format(string, sizeof(string), "Wys�a�e� og�oszenie o tej samej tre�ci, odczekaj jeszcze %d minut", ammountTime);
			sendTipMessageEx(playerid, COLOR_LIGHTBLUE, string); 
			format(string, sizeof(string), "{A0522D}Ostatnie og�oszenie: {FFFFFF}%s", content);
			sendTipMessage(playerid, string);
			return 1;
		}
		if(!strcmp(params, content, false))
		{
			sendTipMessageEx(playerid, COLOR_WHITE, "Marcepan Marks m�wi: Wys�a�e� og�oszenie o tej samej tre�ci! Zostajesz ukarany kar� Anty-Spam na 15 minut");
			spamujeKomunikatami[playerid] = 1;
			komunikatTime[playerid] = SetTimerEx("KomunikatCzas", 60000, true, "i", playerid);	
		}
		else
		{
			SetPVarString(playerid, "trescOgloszenia", params);
			SendClientMessageToAll(COLOR_WHITE, "|___________ Wiadomo�� Rz�dowa ___________|");
			format(string, sizeof(string), "Urz�dnik %s: %s", sendername, params);
			SendClientMessageToAll(COLOR_YELLOW, string);
			
		}
	}
	return 1;
}