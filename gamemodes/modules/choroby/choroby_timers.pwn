//-----------------------------------------------<< Timers >>------------------------------------------------//
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

//-----------------<[ Timery: ]>-------------------
//CallEffectTimer(playerid, disease, callback)

timer EffectTimer[5000](playerid, eDiseases:disease, eEffects:effect)
{
	if(PlayerHasDisease(playerid, disease)) 
	{
		CallEffectActivateCallback(playerid, disease, effect);
		CallEffectTimer(playerid, disease, effect);

		new infectionRand = random(100);
		if(infectionRand < Effects[effect][InfectionChance]) // do infection
		{
			DoInfecting(playerid, disease, effect);
		}
	}
	return 1;
}

timer InfectedEffectMessage[15000](playerid) 
{
	ChatMe(playerid, " poczu� si�, jakby zarazi� si� chorob�.");
	return 1;
}

//end