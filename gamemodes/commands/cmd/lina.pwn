//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ lina ]--------------------------------------------------//
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

CMD:lina(playerid, cmdtext[])
{
    if(IsACop(playerid) && IsPlayerInAnyVehicle(playerid) && (GetVehicleModel(GetPlayerVehicleID(playerid)) == 497 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 417 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 563) && GetPlayerVehicleSeat(playerid) != 0 && GetPVarInt(playerid,"sliderope") == 0)
    {
        SetPVarInt(playerid,"sliderope",1);
        RemovePlayerFromVehicle(playerid);
        ApplyAnimation(playerid,"ped","abseil",4.0,0,0,0,0,0);
        TogglePlayerControllable(playerid, 0);
        SetTimerEx("SlideRope", 1000, 0, "u", playerid);
        GameTextForPlayer(playerid, "~b~Opuszczasz sie na linie!~n~~n~~g~Aby zakonczyc wcisnij LPM!", 3000, 5);
    }
    else
    {
        ShowPlayerDialogEx(playerid, DIALOG_MSGBOX, DIALOG_STYLE_MSGBOX, "Mrucznik Role Play", "Nie jeste� w �adnym z pojazd�w b�d� helikopterze policyjnym, lub opuszczasz si� ju� na linie!", "OK", "");
    }

    /*
    
    	GetPlayerPos(playerid,pl_pos[playerid][0],pl_pos[playerid][1],pl_pos[playerid][2]);
     	MapAndreas_FindZ_For2DCoord(pl_pos[playerid][0],pl_pos[playerid][1],pl_pos[playerid][3]);
      	pl_pos[playerid][4] = floatsub(pl_pos[playerid][2],pl_pos[playerid][3]);
       	if(pl_pos[playerid][4] >= ROPELENGTH) return SendClientMessage(playerid,0xAA3333AA,"	Jeste� zbyt wysoko.");
        if(pl_pos[playerid][4] <= 2) return RemovePlayerFromVehicle(playerid);
        SetPVarInt(playerid,"roped",1);
        SetPlayerCheckpoint(playerid,pl_pos[playerid][0],pl_pos[playerid][1],floatsub(pl_pos[playerid][3],OFFSETZ),20);
        SetPlayerPos(playerid,pl_pos[playerid][0],pl_pos[playerid][1],floatsub(pl_pos[playerid][2],2));
        SetPlayerVelocity(playerid,0,0,0);
        for(new i=0;i!=10;i++) ApplyAnimation(playerid,"ped","abseil",4.0,0,0,0,1,0);
        for(new i=0;i<=pl_pos[playerid][4];i++)
        {
        	r0pes[playerid][i] = CreateDynamicObject(3004,pl_pos[playerid][0],pl_pos[playerid][1],floatadd(pl_pos[playerid][3],i),87.640026855469,342.13500976563, 350.07507324219);
        }
       	SetTimerEx("syncanim",DUR,0,"i",playerid);
	}
    */
	return 1;
}