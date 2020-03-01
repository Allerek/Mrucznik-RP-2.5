//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  choroby                                                  //
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
//Opis:
/*
	System chor�b.
*/

//

//-----------------<[ Funkcje: ]>-------------------
public FeelingBadEffect(playerid, disease, value)
{
	ChatMe(playerid, "poczu� si� �le.");
	ApplyAnimation(playerid, "FAT", "IDLE_tired", 4.0999, 0, 0, 0, 0, 0, 1);
	return 1;
}
public CouchingEffect(playerid, disease, value)
{
	ChatMe(playerid, "zaczyna kaszle�.");
	ApplyAnimation(playerid, "ON_LOOKERS", "shout_01", 4.0, 0, 0, 0, 0, 0, 1);

	if(random(20) == 1)//5% szans
	{
		InfectPlayer(playerid, ZAPALENIE_PLUC);
	}
	return 1;
}
public VomitEffect(playerid, disease, value)
{
	ChatMe(playerid, "zaczyna wymiotowa�.");
	ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 4.0999, 0, 0, 0, 0, 0, 1);
	return 1;
}
public HPLossEffect(playerid, disease, value)
{
	new Float:hp;
	GetPlayerHealth(playerid, hp);

	new Float:loss = value;
	SetPlayerHealth(playerid, (hp - loss < 0) ? 1.0 : hp-loss);
	ChatMe(playerid, "poczu�, �e co� jest nie tak z jego zdrowiem.");
	return 1;
}
public HPLossToDeathEffect(playerid, disease, value)
{
	new Float:hp;
	GetPlayerHealth(playerid, hp);

	new Float:loss = value;
	SetPlayerHealth(playerid, (hp - loss < 0) ? 0.0 : hp-loss);
	ChatMe(playerid, "poczu� mocny b�l.");
	return 1;
}
public BlackoutEffect(playerid, disease, value)
{
	//TODO
	return 1;
}
public FaintEffect(playerid, disease, value)
{
	ApplyAnimation(playerid, "KNIFE", "KILL_Knife_Ped_Die", 4.0999, 0, 1, 1, 1, 1, 1);
	ChatMe(playerid, "omdla�.");
	return 1;
}
public DeathEffect(playerid, disease, value)
{
	SetPlayerHealth(playerid, 0);
	ChatMe(playerid, "umar� na skutek choroby.");
	return 1;
}