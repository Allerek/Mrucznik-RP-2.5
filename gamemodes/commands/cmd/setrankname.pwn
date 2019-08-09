//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------[ setrankname ]------------------------------------------------//
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

YCMD:setrankname(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
       if(PlayerInfo[playerid][pLider] > 0 && PlayerInfo[playerid][pLiderValue] != 3)
       {
            new rankNAME[24], rankID, string[124];
            if(sscanf(params, "ds[24]", rankID, rankNAME))
            {
                sendTipMessage(playerid, "U�yj /setrankname [ID] [New Name]"); 
                return 1;
            }
            if(strlen(rankNAME) < 3 || strlen(rankNAME) > 24)
            {
                sendErrorMessage(playerid, "Zbyt d�uga/kr�tka nazwa rangi!"); 
                return 1;
            }
            new fracID = GetPlayerFraction(playerid);  
            format(FracRang[fracID][rankID], MAX_RANG_LEN, "%s", rankNAME);
            format(string, sizeof(string), "Edytowa�e� rang� [%d] na nazw� [%d]", rankID, rankNAME); 
            sendTipMessage(playerid, string); 
       }
       else
       {
           sendErrorMessage(playerid, "Nie jeste� upowa�nionym liderem"); 
       }
    }
    return 1;
}
