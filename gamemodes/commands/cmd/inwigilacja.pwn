//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ inwigilacja ]-----------------------------------------------//
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

YCMD:inwigilacja(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        if (PlayerInfo[playerid][pAdmin] >= 150)
        {
            new para1;
            if( sscanf(params, "k<fix>", para1))
            {
                sendTipMessage(playerid, "U�yj /inwiglacja [playerid/Cz��Nicku]");
                return 1;
            }
            
            if(para1 != INVALID_PLAYER_ID)
		    {
		       ToggleInwigilacja(para1, playerid);
			}
        }
        else if(PlayerInfo[playerid][pAdmin] >= 1 && PlayerInfo[playerid][pAdmin] < 150)
        {
            new para1;
            if( sscanf(params, "k<fix>", para1))
            {
                sendTipMessage(playerid, "U�yj /inwiglacja [playerid/Cz��Nicku]");
                return 1;
            }
            if(para1 != INVALID_PLAYER_ID)
		    {
		       ToggleInwigilacja(para1, playerid, true);
            }
        }
        else
        {
            return 1;
        }
    }
    return 1;
}
