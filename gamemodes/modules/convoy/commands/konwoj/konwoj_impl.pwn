//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   konwoj                                                  //
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
// Data utworzenia: 20.10.2019


//

//------------------<[ Implementacja: ]>-------------------
command_konwoj_Impl(playerid)
{
    new hour, minute, second;
    gettime(hour, minute, second);

    if( !(IsACop(playerid) && PlayerInfo[playerid][pRank] >= 8))
    {
        sendErrorMessage(playerid, "Musisz by� w organizacji porz�dkowej i mie� conajmniej 8 rang� aby rozpocz�� konw�j.");
        return 1;
    }
    
    if(!IsPlayerInSecuriCar(playerid))
    {
        sendErrorMessage(playerid, "Musisz by� w poje�dzie konwojowym (securicar) aby rozpocz�� konw�j.");
        return 1;
    }

    if(hour < 15 || hour > 22)
    {
        sendErrorMessage(playerid, "Konw�j mo�na wystartowa� tylko od godziny 15:00 do 23:00.");
        return 1;
    }

    if(ConvoyStarted)
    {
        sendErrorMessage(playerid, "Konw�j ju� jest aktywny, nie mo�esz go wystartowa� ponownie.");
        return 1;
    }

    if(convoyDelayed)
    {
        sendErrorMessage(playerid, "Nast�pny konw�j mo�na wystartowa� dopiero po 3 godzinach od uko�czenia ostatniego.");
        return 1;
    }

    if(kaska[playerid] < CONVOY_PRICE)
    {
        sendErrorMessage(playerid, "Zorganizowanie konwoju kosztuje "#CONVOY_PRICE"$ a Ty tyle nie masz.");
        return 1;
    }

    StartConvoy(playerid, GetPlayerVehicleID(playerid));
    SendClientMessage(playerid, -1, "Wystartowa�e� konw�j. Po dojechaniu do celu otrzymasz");
    return 1;
}

//end