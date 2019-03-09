//bramy.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//---------------------------------------[ Moduł: bramy.pwn ]------------------------------------------//
//Opis:
/*

*/
//Adnotacje:
/*

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
stock DodajBrame(fobiekt, Float:fx1, Float:fy1, Float:fz1, Float:frx1, Float:fry1, Float:frz1, Float:fx2, Float:fy2, Float:fz2, Float:frx2, Float:fry2, Float:frz2, Float:fspeed, Float:frange, fuprtyp=0, fuprval=0, bool:flag=false)
{
	bramy[iloscbram][b_obiekt] = fobiekt;
	if(flag==false) {
		bramy[iloscbram][b_flaga] = false;
	}
	else {
		bramy[iloscbram][b_flaga] = true;
	}
	bramy[iloscbram][b_x1] = fx1;
	bramy[iloscbram][b_y1] = fy1;
	bramy[iloscbram][b_z1] = fz1;
	bramy[iloscbram][b_rx1] = frx1;
	bramy[iloscbram][b_ry1] = fry1;
	bramy[iloscbram][b_rz1] = frz1;
	bramy[iloscbram][b_x2] = fx2;
	bramy[iloscbram][b_y2] = fy2;
	bramy[iloscbram][b_z2] = fz2;
	bramy[iloscbram][b_rx2] = frx2;
	bramy[iloscbram][b_ry2] = fry2;
	bramy[iloscbram][b_rz2] = frz2;
	bramy[iloscbram][b_speed] = fspeed;
	bramy[iloscbram][b_range] = frange;
	bramy[iloscbram][b_uprtyp] = fuprtyp;
	bramy[iloscbram][b_uprval] = fuprval;
	return iloscbram++;
}
stock DualGateAdd(object1,//Obiekt pierwszej bramy
	Float:fx1,//Pozycja pierwszej bramy X
	Float:fy1,//Pozycja pierwszej bramy Y 
	Float:fz1, //Pozycja pierwszej bramy Z
	Float:frx1, //Pozycja pierwszej bramy rX
	Float:fry1, //Pozycja pierwszej bramy rY
	Float:frz1, //Pozycja pierwszej bramy rZ
	Float:fx2, //Pozycja pierwszej bramy po przesuni�ciu X
	Float:fy2, //Pozycja pierwszej bramy po przesuni�ciu Y
	Float:fz2, //Pozycja pierwszej bramy po przesuni�ciu Z
	Float:frx2, //Pozycja pierwszej bramy po przesuni�ciu RX
	Float:fry2, //Pozycja pierwszej bramy po przesuni�ciu rY
	Float:frz2, //Pozycja pierwszej bramy po przesuni�ciu rZ 
	object2, //Obiekt pierwszej bramy
	Float:f2x1, //Pozycja drugiej bramy X
	Float:f2y1, //Pozycja drugiej bramy Y
	Float:f2z1, //Pozycja drugiej bramy Z
	Float:f2rx1, //Pozycja drugiej bramy rX
	Float:f2ry1, //Pozycja drugiej bramy rY
	Float:f2rz1, //Pozycja drugiej bramy rZ
	Float:f2x2, //Pozycja drugiej bramy po przesuni�ciu  X
	Float:f2y2, //Pozycja drugiej bramy po przesuni�ciu  Y
	Float:f2z2, //Pozycja drugiej bramy po przesuni�ciu  Z
	Float:f2rx2, //Pozycja drugiej bramy po przesuni�ciu  rX
	Float:f2ry2, //Pozycja drugiej bramy po przesuni�ciu  rY
	Float:f2rz2, //Pozycja drugiej bramy po przesuni�ciu  rZ
	Float:fspeed, // brama speed
	Float:frange, // brama range
	fuprtyp1=0, //Uprawnienia do bram
	fuprval1=0, //Value (warto��) uprawnie�
	accessCard = 0, //Karta dost�pu
	bool:flg=false){ 
		bramy[iloscbramDual][b_x1] = fx1;
		bramy[iloscbramDual][b_y1] = fy1;
		bramy[iloscbramDual][b_z1] = fz1;
		bramy[iloscbramDual][b_rx1] = frx1;
		bramy[iloscbramDual][b_ry1] = fry1;
		bramy[iloscbramDual][b_rz1] = frz1;
		bramy[iloscbramDual][b_x2] = fx2;
		bramy[iloscbramDual][b_y2] = fy2;
		bramy[iloscbramDual][b_z2] = fz2;
		bramy[iloscbramDual][b_rx2] = frx2;
		bramy[iloscbramDual][b_ry2] = fry2;
		bramy[iloscbramDual][b_rz2] = frz2;
		bramy[iloscbramDual][duo_obiekt] = object2;
		bramy[iloscbramDual][duo_x1] = f2x1;
		bramy[iloscbramDual][duo_y1] = f2y1;
		bramy[iloscbramDual][duo_z1] = f2z1;
		bramy[iloscbramDual][duo_rx1] = f2rx1;
		bramy[iloscbramDual][duo_ry1] = f2ry1;
		bramy[iloscbramDual][duo_rz1] = f2rz1;
		bramy[iloscbramDual][duo_x2] = f2x2;
		bramy[iloscbramDual][duo_y2] = f2y2;
		bramy[iloscbramDual][duo_z2] = f2z2;
		bramy[iloscbramDual][duo_rx2] = f2rx2;
		bramy[iloscbramDual][duo_ry2] = f2ry2;
		bramy[iloscbramDual][duo_rz2] = f2rz2;
		bramy[iloscbramDual][b_speed] = fspeed;
		bramy[iloscbramDual][b_range] = frange;
		bramy[iloscbramDual][b_uprtyp] = fuprtyp;
		bramy[iloscbramDual][b_uprval] = fuprval;
		bramy[iloscbramDual][pAccessCard] = accessCard;
		if(flg==false) 
		{
		bramy[iloscbramDual][b_flaga] = false;
		}
		else {
			bramy[iloscbramDual][b_flaga] = true;
		}
	}
	
	return iloscbramDual++; 
}

stock SprawdzBramy(playerid)
{
	for(new i; i<iloscbram; i++)
	{	
		if(IsPlayerInRangeOfPoint(playerid, bramy[i][b_range], bramy[i][b_x1],  bramy[i][b_y1], bramy[i][b_z1]) || IsPlayerInRangeOfPoint(playerid, bramy[i][b_range], bramy[i][b_x2],  bramy[i][b_y2], bramy[i][b_z2]))
		{
			if( (bramy[i][b_uprtyp] == BRAMA_UPR_TYPE_FRACTION && GetPlayerFraction(playerid) == bramy[i][b_uprval]) || (bramy[i][b_uprtyp] == BRAMA_UPR_TYPE_FAMILY && GetPlayerOrg(playerid) == bramy[i][b_uprval]) || bramy[i][b_uprtyp] == BRAMA_UPR_TYPE_NONE)
			{
				if(bramy[i][b_flaga])
					MoveDynamicObject(bramy[i][b_obiekt], bramy[i][b_x1],  bramy[i][b_y1], bramy[i][b_z1], bramy[i][b_speed], bramy[i][b_rx1],  bramy[i][b_ry1], bramy[i][b_rz1]);
				else
					MoveDynamicObject(bramy[i][b_obiekt], bramy[i][b_x2],  bramy[i][b_y2], bramy[i][b_z2], bramy[i][b_speed], bramy[i][b_rx2],  bramy[i][b_ry2], bramy[i][b_rz2]);
				bramy[i][b_flaga]=~bramy[i][b_flaga];
				return 1;
			}
		}
	}
	for(new iduo, iduo<iloscbramDual; iduo++)
	{
		if(IsPlayerInRangeOfPoint(playerid, bramy[iduo][b_range], bramy[iduo][duo_x1], bramy[iduo][duo_y1], bramy[iduo][duo_z1]) || IsPlayerInRangeOfPoint(playerid, bramy[iduo][b_range], bramy[iduo][duo_x2], bramy[iduo][duo_y2], bramy[iduo][duo_z2]))
		{
			if((bramy[iduo][b_uprtyp] == BRAMA_UPR_TYPE_FRACTION && GetPlayerFraction(playerid) == bramy[iduo][b_uprval]) || (bramy[iduo][b_uprtyp] == BRAMA_UPR_TYPE_FAMILY && GetPlayerOrg(playerid) == bramy[iduo][b_uprval]) || bramy[iduo][b_uprtyp] == BRAMA_UPR_TYPE_NONE)
			{
				if(bramy[iduo][pAccessCard] > 0)
				{
					if(PlayerInfo[playerid][pCard] != bramy[iduo][pAccessCard])
					{
						SendClientMessage(playerid, -1, "Nie masz uprawnie� do otwierania tych drzwi");
						return 1;
					}
				}
				if(bramy[iduo][b_flaga])//Je�eli ma zamkn��
				{
					MoveDynamicObject(bramy[iduo][b_obiekt], bramy[iduo][b_x1], bramy[iduo][b_y1], bramy[iduo][b_z1], bramy[iduo][b_speed], bramy[iduo][b_rx1], bramy[iduo][b_ry1], bramy[iduo][b_rz1]);
					MoveDynamicObject(bramy[iduo][duo_obiekt], bramy[iduo][duo_x1], bramy[iduo][duo_y1], bramy[iduo][duo_z1], bramy[iduo][b_speed], bramy[iduo][duo_rx1], bramy[iduo][duo_ry1], bramy[iduo][duo_rz1]); 	
				}
				else//otwiera
				{
					MoveDynamicObject(bramy[iduo][b_obiekt], bramy[iduo][b_x2], bramy[iduo][b_y2], bramy[iduo][b_z2], bramy[iduo][b_speed], bramy[iduo][b_rx2], bramy[iduo][b_ry2], bramy[iduo][b_rz2]);
					MoveDynamicObject(bramy[iduo][duo_obiekt], bramy[iduo][duo_x2], bramy[iduo][duo_y2], bramy[iduo][duo_z2], bramy[iduo][b_speed], bramy[iduo][duo_rx2], bramy[iduo][duo_ry2], bramy[iduo][duo_rz2]); 
					bramy[iduo][b_flaga]=~bramy[iduo][b_flaga];
					return 1;
				}
			}
		}
	
	}
	return 0;
}

//------------------<[ MySQL: ]>--------------------
//-----------------<[ Komendy: ]>-------------------

//end