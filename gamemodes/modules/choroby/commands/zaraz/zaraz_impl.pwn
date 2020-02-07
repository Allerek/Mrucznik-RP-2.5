//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   zaraz                                                   //
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
// Autor: Mrucznik
// Data utworzenia: 07.02.2020


//

//------------------<[ Implementacja: ]>-------------------
command_zaraz_Impl(playerid, giveplayerid, disease[32])
{
    if (PlayerInfo[playerid][pAdmin] < 100)
    {
        noAccessMessage(playerid);
        return 1;
    }

    new eDiseases:diseaseID = GetDiseaseID(disease);
    InfectPlayer(giveplayerid, diseaseID);
    Log(adminLog, INFO, "Admin %s zarazi� %s chorob� %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), disease);
    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, "   Zarazi�e� si� chorob�");
    SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("   Zarazi�e� gracza %s chorob� %s.", GetNick(giveplayerid), disease));
    return 1;
}

//end