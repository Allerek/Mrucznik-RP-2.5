//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   ugotuj                                                  //
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
// Autor: mrucznik
// Data utworzenia: 03.03.2020


//

//------------------<[ Implementacja: ]>-------------------
command_ugotuj_Impl(playerid)
{
	new string[128];
    if(IsAtCookPlace(playerid))
    {
        new x_nr[16];
        if(strcmp(x_nr,"ostatniaryba",true) == 0)
        {
            if(Fishes[playerid][pLastFish] > 0)
            {
                new found = 0;
                if(Cooking[playerid][Weight] == 0)
                {
                    format(string, sizeof(string), "Gotowana  %s", FishNames[Fishes[playerid][pFishID]]);
                    strmid(Cooking[playerid][Name], string, 0, strlen(string));
                    Cooking[playerid][Weight] = Fishes[playerid][pLastWeight];
                    Cooking[playerid][ID] = Fishes[playerid][pFishID];
                    format(string, sizeof(string), "* Stworzy�e� %s, wa��c� %d KG.",Cooking[playerid][Name],Cooking[playerid][Weight]);
                    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
                    found = 1;
                }
                else
                {
                    sendTipMessageEx(playerid, COLOR_GREY, "Nie masz ju� miejsca na swoje potrawy !");
                    return 1;
                }
                if(found)
                {
                    ClearFishID(playerid, Fishes[playerid][pLastFish]);
                    Fishes[playerid][pLastFish] = 0;
                    Fishes[playerid][pFishID] = 0;
                }
            }
            else
            {
                sendTipMessageEx(playerid, COLOR_GREY, "Nie z�apa�e� �adnej ryby !");
                return 1;
            }
        }
        if(strcmp(x_nr,"ryba",true) == 0)
        {
            new found = 0, fishid;

            if( sscanf(string, "{s[16]}d", x_nr, fishid))
            {
                sendTipMessage(playerid, "U�yj /gotuj ryba [id]");
                return 1;
            }

            if(fishid < 1 || fishid > 5) { sendTipMessageEx(playerid, COLOR_GREY, "Numer od 1 do 5!"); return 1; }
            else if(fishid == 1 && Fishes[playerid][pWeight1] < 1) { SendClientMessage(playerid, COLOR_GREY, "   Nie z�owi�e� �adnej ryby pod numerem(1) !"); return 1; }
            else if(fishid == 2 && Fishes[playerid][pWeight2] < 1) { SendClientMessage(playerid, COLOR_GREY, "   Nie z�owi�e� �adnej ryby pod numerem(2) !"); return 1; }
            else if(fishid == 3 && Fishes[playerid][pWeight3] < 1) { SendClientMessage(playerid, COLOR_GREY, "   Nie z�owi�e� �adnej ryby pod numerem(3) !"); return 1; }
            else if(fishid == 4 && Fishes[playerid][pWeight4] < 1) { SendClientMessage(playerid, COLOR_GREY, "   Nie z�owi�e� �adnej ryby pod numerem(4) !"); return 1; }
            else if(fishid == 5 && Fishes[playerid][pWeight5] < 1) { SendClientMessage(playerid, COLOR_GREY, "   Nie z�owi�e� �adnej ryby pod numerem(5) !"); return 1; }
        
            if(fishid == 1)
            {
                format(string, sizeof(string), "Gotowana  %s", Fishes[playerid][pFish1]);
                strmid(Cooking[playerid][Name], string, 0, strlen(string));
                Cooking[playerid][Weight] = Fishes[playerid][pWeight1];
                Cooking[playerid][ID] = Fishes[playerid][pFid1];
                format(string, sizeof(string), "* Stworzy�e� %s, wa��c� %d KG.",Cooking[playerid][Name],Cooking[playerid][Weight]);
                SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
            }
            else if(fishid == 2)
            {
                format(string, sizeof(string), "Gotowana  %s", Fishes[playerid][pFish2]);
                strmid(Cooking[playerid][Name], string, 0, strlen(string));
                Cooking[playerid][Weight] = Fishes[playerid][pWeight2];
                Cooking[playerid][ID] = Fishes[playerid][pFid2];
                format(string, sizeof(string), "* Stworzy�e� %s, wa��c� %d KG.",Cooking[playerid][Name],Cooking[playerid][Weight]);
                SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
            }
            else if(fishid == 3)
            {
                format(string, sizeof(string), "Gotowana  %s", Fishes[playerid][pFish3]);
                strmid(Cooking[playerid][Name], string, 0, strlen(string));
                Cooking[playerid][Weight] = Fishes[playerid][pWeight3];
                Cooking[playerid][ID] = Fishes[playerid][pFid3];
                format(string, sizeof(string), "* Stworzy�e� %s, wa��c� %d KG.",Cooking[playerid][Name],Cooking[playerid][Weight]);
                SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
            }
            else if(fishid == 4)
            {
                format(string, sizeof(string), "Gotowana  %s", Fishes[playerid][pFish4]);
                strmid(Cooking[playerid][Name], string, 0, strlen(string));
                Cooking[playerid][Weight] = Fishes[playerid][pWeight4];
                Cooking[playerid][ID] = Fishes[playerid][pFid4];
                format(string, sizeof(string), "* Stworzy�e� %s, wa��c� %d KG.",Cooking[playerid][Name],Cooking[playerid][Weight]);
                SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
            }
            else if(fishid == 5)
            {
                format(string, sizeof(string), "Gotowana  %s", Fishes[playerid][pFish5]);
                strmid(Cooking[playerid][Name], string, 0, strlen(string));
                Cooking[playerid][Weight] = Fishes[playerid][pWeight5];
                Cooking[playerid][ID] = Fishes[playerid][pFid5];
                format(string, sizeof(string), "* Stworzy�e� %s, wa��c� %d KG.",Cooking[playerid][Name],Cooking[playerid][Weight]);
                SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
            }
        }
        else if(strcmp(x_nr,"kurczak",true) == 0)
        {
            if(PlayerToPoint(3.0,playerid,369.9786,-4.0798,1001.8589))
            {//Cluckin Bell
                if(Groceries[playerid][pChicken] != 0)
                {
                    if(Cooking[playerid][Weight] == 0)
                    {
                        format(string, sizeof(string), "Gotowany kurczak");
                        strmid(Cooking[playerid][Name], string, 0, strlen(string));
                        Cooking[playerid][Weight] = Groceries[playerid][pChicken];
                        Cooking[playerid][ID] = 30;
                        Groceries[playerid][pChicken] = 0;
                        format(string, sizeof(string), "* Stworzy�e� %s, wa��cego %d KG.",Cooking[playerid][Name],Cooking[playerid][Weight]);
                        SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
                    }
                    else
                    {
                        sendTipMessageEx(playerid, COLOR_GREY, "Nie masz ju� miejsca na swoje potrawy !");
                        return 1;
                    }
                }
                else
                {
                    sendTipMessageEx(playerid, COLOR_GREY, "Nie masz przy sobie kurczaka !");
                    return 1;
                }
            }
            else
            {
                sendTipMessageEx(playerid, COLOR_GREY, "Musisz by� w  Cluckin Bell aby to ugotowa� !");
                return 1;
            }
        }
        else if(strcmp(x_nr,"hamburger",true) == 0)
        {
            if(PlayerToPoint(3.0,playerid,376.4466,-60.9574,1001.5078) || PlayerToPoint(3.0,playerid,378.1215,-57.4928,1001.5078))
            {//Burgershot
                if(Groceries[playerid][pHamburger] != 0)
                {
                    if(Cooking[playerid][Weight] == 0)
                    {
                        format(string, sizeof(string), "Hamburgera z frytkami");
                        strmid(Cooking[playerid][Name], string, 0, strlen(string));
                        Cooking[playerid][Weight] = Groceries[playerid][pHamburger];
                        Cooking[playerid][ID] = 30;
                        Groceries[playerid][pHamburger] = 0;
                        format(string, sizeof(string), "* Stworzy�e� %s, wa��cego %d KG.",Cooking[playerid][Name],Cooking[playerid][Weight]);
                        SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
                    }
                    else
                    {
                        sendTipMessageEx(playerid, COLOR_GREY, "Nie masz ju� miejsca na swoje potrawy !");
                        return 1;
                    }
                }
                else
                {
                    sendTipMessageEx(playerid, COLOR_GREY, "Nie masz ze sob� Hamburgera !");
                    return 1;
                }
            }
            else
            {
                sendTipMessageEx(playerid, COLOR_GREY, "Musisz by� w Burger Shocie aby to ugotowa� !");
                return 1;
            }
        }
        else if(strcmp(x_nr,"pizza",true) == 0)
        {
            if(PlayerToPoint(3.0,playerid,374.1185,-113.6361,1001.4922) || PlayerToPoint(3.0,playerid,377.7971,-113.7668,1001.4922))
            {//Well Stacked Pizza
                if(Groceries[playerid][pPizza] != 0)
                {
                    if(Cooking[playerid][Weight] == 0)
                    {
                        format(string, sizeof(string), "Pizz�");
                        strmid(Cooking[playerid][Name], string, 0, strlen(string));
                        Cooking[playerid][Weight] = Groceries[playerid][pHamburger];
                        Cooking[playerid][ID] = 30;
                        Groceries[playerid][pPizza] = 0;
                        format(string, sizeof(string), "* Stworzy�e� %s, wa��c� %d KG.",Cooking[playerid][Name],Cooking[playerid][Weight]);
                        SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
                    }
                    else
                    {
                        sendTipMessageEx(playerid, COLOR_GREY, "Nie masz ju� miejsca na swoje potrawy !");
                        return 1;
                    }
                }
                else
                {
                    sendTipMessageEx(playerid, COLOR_GREY, "Nie masz pizzy ze sob� !");
                    return 1;
                }
            }
            else
            {
                sendTipMessageEx(playerid, COLOR_GREY, "Musisz by� w pizzeri aby to ugotowa� !");
                return 1;
            }
        }
        else if(strcmp(x_nr,"nietoperz",true) == 0)
        {
            if(Groceries[playerid][pWuhanBat] != 0)
            {
                format(string, sizeof(string), "Sma�ony nietoperz");
                if(Cooking[playerid][Weight] == 0)
                {
                    strmid(Cooking[playerid][Name], string, 0, strlen(string));
                    Cooking[playerid][Weight] = Groceries[playerid][pWuhanBat];
                    Cooking[playerid][ID] = 31;
                }
                else
                {
                    sendTipMessageEx(playerid, COLOR_GREY, "Nie masz ju� miejsca na swoje potrawy !");
                    return 1;
                }

                format(string, sizeof(string), "* Stworzy�e� sma�onego nietoperza z Wuhan w pi�ciu smakach, wa��cego %d KG.", Groceries[playerid][pWuhanBat]);
                SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
                Groceries[playerid][pWuhanBat] = 0;
            }
            else
            {
                sendTipMessageEx(playerid, COLOR_GREY, "Nie masz przy sobie nietoperza!");
                return 1;
            }	
        }
        else
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Z�a nazwa !");
            return 1;
        }
    }
    else
    {
        sendErrorMessage(playerid, "Nie jeste� w miejscu przeznaczonym do gotowania (Cluckin Bell / Burger Shot / Pizzeria).");
        return 1;
    }
    return 1;
}

//end