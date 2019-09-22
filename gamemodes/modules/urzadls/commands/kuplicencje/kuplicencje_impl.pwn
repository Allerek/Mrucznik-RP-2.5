//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                kuplicencje                                                //
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
// Autor: Simeone
// Data utworzenia: 20.09.2019


//ProxDetector(20.0, playerid, reString, COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY);
//ProxDetector(30.0, hitid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

//------------------<[ Implementacja: ]>-------------------
command_kuplicencje_Impl(playerid)
{
    if(PlayerInDmvPoint(playerid))
    {
        new string[356]; 
        format(string, sizeof(string), "Nazwa\tKoszt\n\
        Dow�d Osobisty\t{80FF00}$%d\n\
        Karta w�dkarska\t{80FF00}$%d\n\
        Pozwolenie na bro�\t{80FF00}$%d\n\
        Patent �eglarski\t{80FF00}$%d\n\
        Prawo jazdy - teoria\t{80FF00}$%d\n\
        Prawo Jazdy - praktyka\t{80FF00}$%d\n\
        Prawo jazdy - odbi�r\t{80FF00}$%d\n\
        Licencja pilota\t{80FF00}$%d\n\
        Rejestracja wozu\t{80FF00}$%d\n\
        W�asna rejestracja wozu\t{80FF00}$%d", 
        DmvLicenseCost[0], 
        DmvLicenseCost[1],
        DmvLicenseCost[2],
        DmvLicenseCost[3],
        DmvLicenseCost[4],
        DmvLicenseCost[5],
        DmvLicenseCost[6],
        DmvLicenseCost[7],
        DmvLicenseCost[8],
        DmvLicenseCost[9]); 
        ProxDetector(30.0, playerid, "Urz�dnik m�wi: Witam Pana(i) w Urz�dzie Miasta! W czym mog� Panu(i) pom�c?", COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY);
        ShowPlayerDialogEx(playerid, DIALOG_DMV, DIALOG_STYLE_TABLIST_HEADERS, "Wybierz dokument:", string, "Wyr�b", "Wyjdz");
    }
    else
    {
        sendErrorMessage(playerid, "Nie jeste� przy okienkach urz�du miasta!"); 
    }
    return 1;
}

//end