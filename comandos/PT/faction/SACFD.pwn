//SACFD
CMD:heal(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] == FACTION_SACFD || Faction[playerid] == FACTION_COP || Faction[playerid] == FACTION_RESEARCH)
	{
		new playa = -1;
		if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /heal [ID ou nome do jogador]");
		if(InvalidPlayer(playa)) return SysMsg(playerid,"Esse jogador não está conectado.");
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
		if(playa == playerid) return SysMsg(playerid,"Você não pode se curar.");
		if(!Dead{playa}) return SysMsg(playerid, "Este jogador não está abatido.");
		if(DeathTimer[playa] == 0) return SysMsg(playerid, "O tempo acabou, essa pessoa não resistiu e morreu.");

		new injuriescount = 0, injuries[100], namestring[64];

		gstr[0] = EOS;

		strcat(gstr, "Tipo de lesão\tLocalização\tArma\n");
		for(new hit = 0; hit < HitCount[playa]; hit++)
		{
			if(Injuries[playa][hit][pBodypart] > 0)
			{
				switch(Injuries[playa][hit][pWeaponID])
				{
					// Blunt Weapons
					case 0,1,2,3,5,6,7,10,11,12,13,14,15,41,42,43,44,45,46:
					{
						format(injuries, sizeof(injuries), "Traumatismo craniano\t%s\t%s\n", ReturnBodyPartName(Injuries[playa][hit][pBodypart]), GetWeaponNameFromID(Injuries[playa][hit][pWeaponID]));
					}

					// Stab Weapons
					case 4, 8, 9:
					{
						format(injuries, sizeof(injuries), "Ferida da facada\t%s\t%s\n", ReturnBodyPartName(Injuries[playa][hit][pBodypart]), GetWeaponNameFromID(Injuries[playa][hit][pWeaponID]));
					}

					// Gunshot Wounds
					case 22..34,38:
					{
						format(injuries, sizeof(injuries), "Ferimento de bala\t%s\t%s\n", ReturnBodyPartName(Injuries[playa][hit][pBodypart]), GetWeaponNameFromID(Injuries[playa][hit][pWeaponID]));
					}

					// Explosion/Burn
					case 16,17,18,35,36,37,39,40,51:
					{
						format(injuries, sizeof(injuries), "Explosão/Queimadura\t%s\t%s\n", ReturnBodyPartName(Injuries[playa][hit][pBodypart]), GetWeaponNameFromID(Injuries[playa][hit][pWeaponID]));
					}

					default:
					{
						format(injuries, sizeof(injuries), "Desconhecido\t%s\t%s\n", ReturnBodyPartName(Injuries[playa][hit][pBodypart]), GetWeaponNameFromID(Injuries[playa][hit][pWeaponID]));
						// Unknown wound
					}
				}
				injuriescount ++;
				strcat(gstr, injuries);
			}
		}
		format(namestring, sizeof(namestring), "Lesões de %s", NameRP(playa));
		if(injuriescount > 0)
		{
			Healing[playerid] = playa;
			Dialog_Show(playerid, HealDialog, DIALOG_STYLE_TABLIST_HEADERS, namestring, gstr, "Fechar", "");
		}
		else if(injuriescount == 0 && Dead{playa}) RevivePlayer(playa);
		else SysMsgF(playerid, "%s não tem quaisquer lesões.", NameRP(playa));
	}
	else SysMsg(playerid,"Você precisa ser um membro do SACFD.");
	return true;
}
CMD:maca(playerid, params[])//maca //retcher
{
	if(!Logged{playerid}) return true;

	new action[9], playa = -1;
	if(sscanf(params, "s[9]U(-1)", action, playa)) return SysMsg(playerid,"Use: /maca [equipar/dropar/pegar/guardar/carregar/descarregar/sair/intoambu]");

	new Float:pX,Float:pY,Float:pZ, Float:oX,Float:oY,Float:oZ;
	GetPlayerPos(playerid, pX, pY, pZ);

	if(strcmp("equipar", action, true) == 0)
	{
		if(Faction[playerid] != FACTION_SACFD && !IsESU{playerid}) return SysMsg(playerid,"Você precisa ser um membro do SACFD.");
		if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você precisa ser o rank 2 para usar isso.");
		if(StretcherEquipped[playerid] > 0) return SysMsg(playerid,"Você já tem uma maca.");
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 416) return SysMsg(playerid,"Você deve estar na parte de trás de uma ambulância para obter uma maca.");
		if(GetPlayerVehicleSeat(playerid) != 2 && GetPlayerVehicleSeat(playerid) != 3) return SysMsg(playerid,"Você deve estar na parte de trás de uma ambulância para obter uma maca.");
		StretcherEquipped[playerid] = CreateDynamicObject(1997, pX, pY + 1.5, pZ - 1.0, 0.0, 0.0, 100.0);//2146
		StretcherHolding[playerid] = 1;
		RemovePlayerFromVehicle(playerid);

		format(gstr, sizeof(gstr),"* Paramédico %s puxa uma maca para fora da ambulância. *",NameEx(playerid));
		ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
		return true;
	}
	if(strcmp("dropar", action, true) == 0)
	{
		new Float:pXb, Float:pYb;
		new Float:Ang = GetXYInFrontOfPlayer(playerid, pXb, pYb, 1.7);
		if(Faction[playerid] != FACTION_SACFD && !IsESU{playerid}) return SysMsg(playerid,"Você precisa ser um membro do SACFD.");
		if(StretcherHolding[playerid] == 0) return SysMsg(playerid,"Você precisa ter uma maca.");
		if(StretcherPlayerID[playerid] != -1) return SysMsg(playerid,"Você não pode deixar a maca com alguém sobre ela.");

		DestroyDynamicObjectEx(StretcherEquipped[playerid], "StretcherEquipped[playerid] 0");
		StretcherEquipped[playerid] = CreateDynamicObject(1997, pXb, pYb, pZ-1.0, 0.0, 0.0, Ang+180);
		StretcherHolding[playerid] = 0;
		StretcherTimer[playerid] = SetTimerEx("DestroyStretcher", 600000, 0, "ii", playerid, StretcherEquipped[playerid]);
		foreach(new p: Player) Streamer_Update(p);

		format(gstr, sizeof(gstr),"* Paramédico %s trava as rodas da maca no lugar. *",NameEx(playerid));
		ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
		return true;
	}
	if(strcmp("pegar", action, true) == 0)
	{
		GetDynamicObjectPos(StretcherEquipped[playerid],oX,oY,oZ);
		new Float:distance = DistanceBetweenPoints(pX,pY,pZ,oX,oY,oZ);
		if(Faction[playerid] != FACTION_SACFD && !IsESU{playerid}) return SysMsg(playerid,"Você precisa ser um membro do SACFD.");
		if(StretcherEquipped[playerid] == 0) return SysMsg(playerid,"Você precisa ter uma maca.");
		if(StretcherPlayerID[playerid] != -1) return SysMsg(playerid,"Você não pode deixar a maca com alguém sobre ela.");
		if(StretcherHolding[playerid] == 2) return SysMsg(playerid,"Você já tem uma maca");
		if(distance > 5) return SysMsg(playerid,"Você não está perto o suficiente.");

		KillTimer(StretcherTimer[playerid]);
		StretcherTimer[playerid] = -1;
		StretcherHolding[playerid] = 2;

		format(gstr, sizeof(gstr),"* Paramédico %s destrava as rodas na maca *",NameEx(playerid));
		ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
		return true;
	}
	if(strcmp("guardar", action, true) == 0)
	{
		if(Faction[playerid] != FACTION_SACFD && !IsESU{playerid}) return SysMsg(playerid,"Você precisa ser um membro do SACFD.");
		if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você precisa ser rank 2 para usar este comando.");
		if(StretcherEquipped[playerid] == 0) return SysMsg(playerid,"Você não tem uma maca para guardar.");
		if(StretcherPlayerID[playerid] >= 0) return SysMsg(playerid,"Descarregue a maca antes de guardar.");

		new Float:vX, Float:vY, Float:vZ;
		for(new v = 1, x = GetVehiclePoolSize(); v <= x; v++)
		{
			if(GetVehicleModel(v) == 416)
			{
				GetVehiclePos(v, vX, vY, vZ);
				if(IsPlayerInRangeOfPoint(playerid, 10.0, vX, vY, vZ))
				{
					DestroyDynamicObjectEx(StretcherEquipped[playerid], "StretcherEquipped[playerid] 1");
					StretcherEquipped[playerid] = 0;
					StretcherHolding[playerid] = 0;

					format(gstr, sizeof(gstr),"* Paramédico %s coloca a maca na parte de trás da ambulância. *",NameEx(playerid));
					ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
					return true;
				}
			}
		}
		SysMsg(playerid,"Você deve estar perto de uma ambulância para arrumar uma maca.");
		return true;
	}
	if(strcmp("carregar", action, true) == 0)
	{
		if(Faction[playerid] != FACTION_SACFD && !IsESU{playerid}) return SysMsg(playerid,"Você precisa ser um membro do SACFD.");
		if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você precisa ser o rank 2 para usar isso.");
		if(StretcherEquipped[playerid] == 0) return SysMsg(playerid,"Você deve ter uma maca para carregar alguém sobre ela.");
		if(StretcherPlayerID[playerid] >= 0) return SysMsg(playerid,"Você já tem alguém carregado na maca.");

		if(sscanf(params, "s[8]u", action, playa)) return SysMsg(playerid,"Use: /maca carregar [ID ou nome do jogador]");
		if(InvalidPlayer(playa)) return SysMsg(playerid,"Esse jogador não está conectado.");
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
		if(playa == playerid) return SysMsg(playerid,"Você não pode fazer isso com você mesmo.");
		if(StretcherEquipped[playa] > 0) return SysMsg(playerid,"Você não pode colocar alguém com uma maca em uma maca.");
		if(StretcherHolding[playerid] == 0) return SysMsg(playerid, "Você precisa segurar a maca.");

		new Float:tX,Float:tY,Float:tZ;
		GetPlayerPos(playa,tX,tY,tZ);
		if(!IsPlayerInRangeOfPoint(playerid,3.5,tX,tY,tZ)) return SysMsg(playerid,"Você deve estar perto do jogador para colocá-lo em uma maca.");

		StretcherPlayerID[playerid] = playa;
		OnePlayAnim(playa,"BEACH", "bather", 4.0, 1, 0, 0, 1, -1);

		format(gstr, sizeof(gstr),"* Paramédico %s agora está puxando a maca com %s sobre. *",NameEx(playerid),NameRP(StretcherPlayerID[playerid]));
		ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
		format(gstr, sizeof(gstr),"%s agora em sua maca. Você pode tirá-los usando '/maca descarregar'",NameEx(StretcherPlayerID[playerid]));
		SendClientMessage(playerid,COLOR_WHITE,gstr);
		format(gstr, sizeof(gstr),"%s colocou você na maca. Use '/maca sair' se você não quer estar com isso.",NameEx(playerid));
		SendClientMessage(StretcherPlayerID[playerid],COLOR_WHITE,gstr);
		return true;
	}
	if(strcmp("descarregar", action, true) == 0)
	{
		if(Faction[playerid] != FACTION_SACFD && !IsESU{playerid}) return SysMsg(playerid,"Você precisa ser um membro do SACFD.");
		if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você precisa ser o rank 2 para usar isso.");
		if(StretcherEquipped[playerid] == 0) return SysMsg(playerid,"You must have a stretcher to load someone on it.");
		if(StretcherPlayerID[playerid] == -1) return SysMsg(playerid,"You don't even have someone loaded on the stretcher.");
		if(StretcherHolding[playerid] == 0) return SysMsg(playerid, "You need to be holding the stretcher");

		new Float:playerpos[4];
		TogglePlayerControllable(StretcherPlayerID[playerid], 1);
		GetPlayerPos(playerid, playerpos[0], playerpos[1], playerpos[2]);
		GetXYInFrontOfPlayer(playerid, playerpos[0], playerpos[1], -2);
		SetPlayerPos(StretcherPlayerID[playerid], playerpos[0], playerpos[1], playerpos[2]);
		ClearAnimations(StretcherPlayerID[playerid]);

		format(gstr, sizeof(gstr),"%s has been removed from the stretcher.",NameEx(StretcherPlayerID[playerid]));
		SendClientMessage(playerid,COLOR_WHITE,gstr);
		format(gstr, sizeof(gstr),"%s has removed you from their stretcher.",NameEx(playerid));
		SendClientMessage(StretcherPlayerID[playerid],COLOR_WHITE,gstr);

		StretcherPlayerID[playerid] = -1;
		return true;
	}
	if(strcmp("sair", action, true) == 0)
	{
		foreach(new i: Player)
		{
			if(StretcherPlayerID[i] == playerid)
			{
				new Float:playerpos[4];
				TogglePlayerControllable(playerid, 1);
				GetPlayerPos(i, playerpos[0], playerpos[1], playerpos[2]);
				GetXYInFrontOfPlayer(i, playerpos[0], playerpos[1], 6.0);
				SetPlayerPos(playerid, playerpos[0], playerpos[1], playerpos[2]);
				ClearAnimations(playerid);

				format(gstr, sizeof(gstr),"%s saiu da maca.",NameEx(playerid));
				SendClientMessage(i,COLOR_WHITE,gstr);
				format(gstr, sizeof(gstr),"Você saiu da maca de %s.",NameEx(i));
				SendClientMessage(playerid,COLOR_WHITE,gstr);

				StretcherPlayerID[i] = -1;
				return true;
			}
		}

		SysMsg(playerid,"Você não está em uma maca tão claramente não pode sair de um.");
		return true;
	}
	if(strcmp("intoambu", action, true) == 0)//observar
	{
		if(Faction[playerid] != FACTION_SACFD && !IsESU{playerid}) return SysMsg(playerid,"Você precisa ser um membro do SACFD.");
		if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você precisa ser o rank 2 para usar isso.");
		if(StretcherEquipped[playerid] == 0) return SysMsg(playerid,"Você deve ter uma maca.");
		if(StretcherPlayerID[playerid] == -1) return SysMsg(playerid,"Você nem tem alguém carregado na maca.");

		new Float:vX, Float:vY, Float:vZ;
		for(new v = 1, x = GetVehiclePoolSize(); v <= x; v++)
		{
			if(GetVehicleModel(v) == 416)
			{
				GetVehiclePos(v, vX, vY, vZ);
				if(IsPlayerInRangeOfPoint(playerid, 10.0, vX, vY, vZ))
				{
					new seatid = 2;
					foreach(new i: Player)
					{
						if(GetPlayerVehicleID(i) == v)
						{
							if(GetPlayerVehicleSeat(i) == 2) seatid = 3;
							if(GetPlayerVehicleSeat(i) == 3 && seatid == 3) seatid = -1;
						}
					}
					if(seatid == -1) return SysMsg(playerid,"Não há assentos livres na parte de trás desta ambulância.");

					PutPlayerInVehicle(StretcherPlayerID[playerid], v, seatid);
					TogglePlayerControllable(StretcherPlayerID[playerid], 1);

					format(gstr, sizeof(gstr),"* Paramédico %s empurra a maca com %s na parte de trás da ambulância. *",NameEx(playerid),NameRP(StretcherPlayerID[playerid]));
					ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);

					DestroyDynamicObjectEx(StretcherEquipped[playerid], "StretcherEquipped[playerid] 2");
					StretcherEquipped[playerid] = 0;
					StretcherPlayerID[playerid] = -1;
					StretcherHolding[playerid] = 0;
					return true;
				}
			}
		}
		SysMsg(playerid,"Você deve estar perto de uma ambulância, para colocar uma maca dentro.");
		return true;
	}

	return true;
}
CMD:str(playerid, params[]) return cmd_maca(playerid, params);
CMD:acriarfogo(playerid, params[])
{
	if(!Logged{playerid}) return true;

	if((Faction[playerid] == FACTION_SACFD && FactionRank[playerid] > 8) || IsPlayerAdminLevelOK(playerid, 3))
	{
		//if(GetPlayerInterior(playerid) > 0) return SysMsg(playerid, "Você não pode criar um incêndio aqui.");

		if(isnull(params)) return SysMsg(playerid,"Use: /criarfogo [pequeno/med/grande]");

		if(strcmp("pequeno", params, true) == 0)
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			GetXYInFrontOfPlayer(playerid, x, y, 2.5);
			PlaceFire(x, y, z, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), true);
			return true;
		}
		if(strcmp("med", params, true) == 0)
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			GetXYInFrontOfPlayer(playerid, x, y, 2.5);
			PlaceFire(x, y, z, 2, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), true);
			return true;
		}
		if(strcmp("grande", params, true) == 0)
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			GetXYInFrontOfPlayer(playerid, x, y, 2.5);
			PlaceFire(x, y, z, 3, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), true);
			return true;
		}
	}
	return true;
}
CMD:criarfogo(playerid, params[])
{
	if(!Logged{playerid}) return true;

	if((Faction[playerid] == FACTION_SACFD && FactionRank[playerid] > 8) || IsPlayerAdminLevelOK(playerid, 2))
	{
		//if(GetPlayerInterior(playerid) > 0) return SysMsg(playerid, "Você não pode criar um incêndio aqui.");

		if(isnull(params)) return SysMsg(playerid,"Use: /criarfogo [pequeno/med/grande]");

		if(strcmp("pequeno", params, true) == 0)
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			GetXYInFrontOfPlayer(playerid, x, y, 2.5);
			PlaceFire(x, y, z, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), false);
			return true;
		}
		if(strcmp("med", params, true) == 0)
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			GetXYInFrontOfPlayer(playerid, x, y, 2.5);
			PlaceFire(x, y, z, 2, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), false);
			return true;
		}
		if(strcmp("grande", params, true) == 0)
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			GetXYInFrontOfPlayer(playerid, x, y, 2.5);
			PlaceFire(x, y, z, 3, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), false);
			return true;
		}
	}
	return true;
}
CMD:scba(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] == FACTION_SACFD || (Faction[playerid] == FACTION_COP && IsESU{playerid}))
	{
		new playerskin = GetPlayerSkin(playerid);
		if(Faction[playerid] == FACTION_SACFD && (playerskin != 277 && playerskin != 278 && playerskin != 279)) return SendClientMessage(playerid, COLOR_WHITE, "Você precisa de seu equipamento de bunker em primeiro lugar!");
		if(Faction[playerid] == FACTION_COP && IsESU{playerid} && (playerskin != 277 && playerskin != 278 && playerskin != 279)) SetPlayerSkinEx(playerid, 279);

		if(scba[playerid] == 0)
		{
			new index = GetFreePlayerObjectIndex(playerid);
			if(index != -1)
			{
				AttachedObjects[playerid][index][aoModelID] = 1008;
				AttachedObjects[playerid][index][aoBone] = 1;
				SetPlayerAttachedObject(playerid, index, 19816, 1, -0.012000, -0.187999, 0.000000, -0.499998, -91.499885, 8.499999, 1.162999, 1.238000, 1.291000);
				SendClientMessage(playerid, COLOR_WHITE, "Seu SCBA está agora ligado");
				OnePlayAnim(playerid,"PARACHUTE","PARA_Land",4,0,0,0,0,0);
				scba[playerid] = 1;
			}
			else return SysMsg(playerid, "Você tem muitos objetos em seu personagem.");
		}
		else if(scba[playerid] == 1)
		{
			if(smask[playerid] == 1) return SendClientMessage(playerid, COLOR_WHITE, "Você precisa tirar sua máscara primeiro.");

			for(new index = 0; index < 6; index++)
			{
				if(AttachedObjects[playerid][index][aoModelID] == 1008)
				{
					AttachedObjects[playerid][index][aoModelID] = 0;
					AttachedObjects[playerid][index][aoBone] = 0;
					SendClientMessage(playerid, COLOR_WHITE, "Seu SCBA está agora desligado.");
					RemovePlayerAttachedObject(playerid, index);
					OnePlayAnim(playerid,"PARACHUTE","PARA_Land",4,0,0,0,0,0);
					scba[playerid] = 0;
					SetPlayerSkinEx(playerid, Clothes[playerid][4]);
					return true;
				}
			}
			SendClientMessage(playerid, COLOR_GREY, "Atualmente, você não possui equipamentos SCUBA equipados.");
			scba[playerid] = 0;
		}
	}
	else return SysMsg(playerid, "Você precisa ser um membro do SACFD ou ESU para usar esse comando.");
	return true;
}
CMD:smask(playerid, params[])
{
	if(smask[playerid] == 0)
	{
		if(scba[playerid] == 0) return SendClientMessage(playerid, COLOR_WHITE, "Você precisa do seu SCBA primeiro!");
		new index = GetFreePlayerObjectIndex(playerid);
		if(index != -1)
		{
			OnePlayAnim(playerid,"goggles","goggles_put_on",4,0,0,0,0,0);
			AttachedObjects[playerid][index][aoModelID] = 19472;
			AttachedObjects[playerid][index][aoBone] = 2;
			SetPlayerAttachedObject(playerid,index,19472,2,-0.033000,0.124999,0.002999,-84.900085,-171.599990,2.100000,1.255001,1.124000,1.293001);
			SendClientMessage(playerid, COLOR_WHITE, "Sua máscara SCBA está agora ligada");
			smask[playerid] = 1;
			CanPlayerChoke{playerid} = false;
		}
		else return SendClientMessage(playerid, COLOR_GREY, "Você tem muitos objetos em seu personagem.");
	}
	else if(smask[playerid] == 1)
	{
		for(new index = 0; index < 6; index++)
		{
			if(AttachedObjects[playerid][index][aoModelID] == 19472)
			{
				AttachedObjects[playerid][index][aoModelID] = 0;
				AttachedObjects[playerid][index][aoBone] = 0;
				RemovePlayerAttachedObject(playerid, index);
				SendClientMessage(playerid, COLOR_WHITE, "Sua máscara SCBA está agora desligada.");
				smask[playerid] = 0;
				OnePlayAnim(playerid,"goggles","goggles_put_on",4,0,0,0,0,0);
				CanPlayerChoke{playerid} = true;
				PlayerChoking{playerid} = false;
				return true;
			}
		}
		SendClientMessage(playerid, COLOR_GREY, "Você não possui máscara.");
		smask[playerid] = 0;
	}
	return true;
}
CMD:detox(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_SACFD) return SysMsg(playerid,"Você precisa ser um membro do SACFD.");

	new playa = -1, method[8];
	if(sscanf(params, "s[8]u", method, playa)) return SysMsg(playerid,"Use: /detox [alcool/drogas] [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid,"Esse jogador não está conectado.");
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(playa == playerid) return SysMsg(playerid,"Você não pode se desintoxicar.");

	new Float:tX,Float:tY,Float:tZ;
	GetPlayerPos(playa,tX,tY,tZ);
	if(!IsPlayerInRangeOfPoint(playerid,3.5,tX,tY,tZ)) return SysMsg(playerid,"Você deve estar perto do jogador para desintoxicá-los.");

	if(strcmp(method, "drogas", true) == 0)
	{
		if(DrugSpamTimer[playa] == 0) return SysMsg(playerid,"Esta pessoa não parece ter nenhum efeito colateral de drogas.");

		DrugSpamTimer[playa] = 0;
		SetPlayerWeather(playa, gServerWeather);
		DrunkLevel[playerid] = 0;
		SetPlayerDrunkLevel(playa, 0);
		TextDrawHideForPlayer(playa, WeedEffect);

		format(gstr, sizeof(gstr),"* Paramédico %s desintoxica %s usando uma injeção de Narcan. *", NameEx(playerid), NameEx(playa));
		ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
		format(gstr, sizeof(gstr),"Paramédico %s desintoxicado você para remover os efeitos das drogas.",NameEx(playerid));
		SendClientMessage(playa,COLOR_RED,gstr);
		format(gstr, sizeof(gstr),"Você desintoxicado %s para remover os efeitos das drogas.",NameEx(playa));
		SendClientMessage(playerid,COLOR_LIGHTBLUE,gstr);
	}
	else if(strcmp(method, "alcool", true) == 0)
	{
		new drunkLevel = GetPlayerDrunkLevel(playa);
		if(drunkLevel < 100) return SysMsg(playerid,"Esta pessoa não parece estar sob a influência do álcool.");

		if(drunkLevel > 10000) SetPlayerDrunkLevel(playa, 2500);
		else SetPlayerDrunkLevel(playa, 0);

		format(gstr, sizeof(gstr),"* Paramédico %s desintoxica %s para reduzir os níveis de álcool. *", NameEx(playerid), NameEx(playa));
		ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
		format(gstr, sizeof(gstr),"Paramédico %s te desintoxicou.",NameEx(playerid));
		SendClientMessage(playa,COLOR_RED,gstr);
		format(gstr, sizeof(gstr),"Você desintoxicou %s.",NameEx(playa));
		SendClientMessage(playerid,COLOR_LIGHTBLUE,gstr);
	}
	return true;
}
CMD:pagermsg(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_SACFD) return SysMsg(playerid,"Você precisa ser um membro do SACFD.");
	if(FactionRank[playerid] < 5) return SysMsg(playerid,"Você precisa ser pelo menos o rank 5.");
	if(!PagerStatus{playerid}) return SysMsg(playerid, "Seu pager não está ligado.");
	if(isnull(params)) return SysMsg(playerid,"Use: /pagermsg [mensagem]");

	foreach(new t: Player)
	{
		if(Logged{t} && Faction[t] == FACTION_SACFD && PagerStatus{t} && Faction[t] == Faction[playerid])
		{
			if(t != playerid && ADuty[playerid] == 0)
			{
				format(gstr, sizeof(gstr), "Um pager é ouvido. * BEEP BEEP * ((%s))", NameRP(t));
				ProxDetector(20.0,t,gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
			}
			SendClientMessageF(t, COLOR_ORANGE, "[Pager Msg] %s: %s", GetPlayersFirstName(playerid), params);
		}
	}
	return true;
}
CMD:pager(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] == FACTION_SACFD)
	{
		if(PagerStatus{playerid})
		{
			PagerStatus{playerid} = false;
			SendClientMessage(playerid,COLOR_GOLD,"Seu pager está desligado agora.");
		}
		else
		{
			PagerStatus{playerid} = true;
			SendClientMessage(playerid,COLOR_GOLD,"Seu pager está ligado agora.");
		}
	}
	else return SysMsg(playerid,"Você precisa ser um membro do SACFD.");
	return true;
}
CMD:resgate(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_SACFD) return SysMsg(playerid,"Você precisa ser um membro do SACFD.");

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /rescue [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid,"Esse jogador não está conectado.");
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(playa == playerid) return SysMsg(playerid,"Você não pode se resgatar.");
	if(WantsRescue[playa] == 1) return SysMsg(playerid,"Esse jogador já quer ajuda.");

	new Float:tX,Float:tY,Float:tZ;
	GetPlayerPos(playa,tX,tY,tZ);
	if(!IsPlayerInRangeOfPoint(playerid,3.5,tX,tY,tZ)) return SysMsg(playerid,"Você precisa estar proximo ao jogador para fazer isso.");

	WantsRescue[playa] = playerid+500;
	format(gstr, sizeof(gstr),"Bombeiro %s quer ajudá-lo. Escreva '/aceitar resgate' se você aceitar.",NameEx(playerid));
	SendClientMessage(playa,COLOR_RED,gstr);
	format(gstr, sizeof(gstr),"Você enviou um pedido de resgate para %s.",NameEx(playa));
	SendClientMessage(playerid,COLOR_LIGHTBLUE,gstr);
	return true;
}
CMD:cut(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_SACFD) return SysMsg(playerid,"Você precisa ser um membro do SACFD.");

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /cut [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid,"Esse jogador não está conectado.");
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(playa == playerid) return SysMsg(playerid,"Você não pode se cortar.");
	if(WantsRescue[playa] != 1) return SysMsg(playerid,"Esse jogador não quer assistência.");
	new vehid = GetPlayerVehicleID(playa);
	if(vehid == 0) return SysMsg(playerid,"Esse jogador não está em um veículo.");
	if(!VehicleHasWindows(vehid)) return SysMsg(playerid,"Esse jogador não pode ser cortado desse veículo.");

	new Float:tX,Float:tY,Float:tZ;
	GetPlayerPos(playa,tX,tY,tZ);
	if(!IsPlayerInRangeOfPoint(playerid,5.5,tX,tY,tZ)) return SysMsg(playerid,"Você deve estar perto do jogador para curá-los.");

	RemovePlayerFromVehicle(playa);
	format(gstr, sizeof(gstr),"* Bombeiro %s retira %s fora do %s usando uma grande ferramenta hidráulica. *",NameEx(playerid), NameEx(playa), GetVehicleName(vehid));
	ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
	return true;
}