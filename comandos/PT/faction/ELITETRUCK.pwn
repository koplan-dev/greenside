CMD:limpaneve(playerid, params[])//limpaneve
{
	if(!Logged{playerid}) return true;

	new year, month, day;
	getdate(year, month, day);

	if(month != 12 && !IsPlayerAdmin(playerid)) return SysMsg(playerid, "Este comando só pode ser usado em dezembro.");
	if(!IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid, "Você deve estar em um veículo para usar este comando.");
	if(Faction[playerid] == FACTION_SACFD || Faction[playerid] == FACTION_TRUCKING || IsPlayerAdmin(playerid))
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(IsFactionVehicle(vehicleid) != Faction[playerid] && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"Você precisa estar em um veículo de facção.");
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && (GetPlayerVehicleSeat(playerid) != 1 && GetPlayerState(playerid) == PLAYER_STATE_PASSENGER)) return SysMsg(playerid,"Você precisa estar no acento de condução or front passenger.");

		new modelid = GetVehicleModel(vehicleid);
		if(!SnowPlow{vehicleid})
		{
			if(VehObject[vehicleid] != INVALID_OBJECT_ID) return SysMsg(playerid, "Este veículo já tem um objeto anexado.");
			if(modelid == 554) //yosemite
			{
				VehObject[vehicleid] = CreateVehicleObject(19601, vehicleid, 0.0, 2.7, -0.6, 0.0, 0.0, 180.0);
				SnowPlow{vehicleid} = true;
			}
			else if(modelid == 524) //cement truck
			{
				VehObject[vehicleid] = CreateVehicleObject(19601, vehicleid, 0.0, 4.15, -1.45, 0.0, 0.0, 180);
				SnowPlow{vehicleid} = true;
			}
			else SysMsg(playerid, "Você não está em um veículo adequado para usar isso.");
		}
		else
		{
			DestroyDynamicObjectEx(VehObject[vehicleid], "VehObject[vehicleid] 3");
			VehObject[vehicleid] = INVALID_OBJECT_ID;
			SnowPlow{vehicleid} = false;
		}
	}
	else SysMsg(playerid, "Você não pode usar este comando.");
	return true;
}
CMD:trailers(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_TRUCKING) return SysMsg(playerid,"Comando exclusivo somente para caminhoneiros.");
	if(FactionRank[playerid] < 3) return SysMsg(playerid,"ocê deve ser pelo menos Rank 3 para usar isso.");
	if(!IsPlayerInRangeOfPoint(playerid, 1.5, 611.9290, 1653.3989, 6.9922)) return SysMsg(playerid,"Você não está na garagem..");

	format(gstr, sizeof(gstr), "Artigo Trailer 1");
	strcat(gstr, "\nArtigo Trailer 2");
	strcat(gstr, "\nArtigo Trailer 3");
	strcat(gstr, "\nTrailer de Petrol");
	strcat(gstr, "\nTrailer de utilidade");

	Dialog_Show(playerid, TruckingTrailers, DIALOG_STYLE_LIST, "Trailers", gstr, "Selecionar", "Cancelar");
	return true;
}
CMD:checkcombustivel(playerid, params[])//checkcombustivel
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] == FACTION_TRUCKING || IsPlayerAdmin(playerid))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.5, 673.5842,1833.3052,5.1829) || IsFactionVehicle(GetPlayerVehicleID(playerid)) == FACTION_TRUCKING)
		{
			new subinfo[150];
			gstr[0] = EOS;
			for(new v = 0; v < MAX_FUEL_STATIONS; v++)
			{
				format(subinfo, sizeof(subinfo), "%s Posto de gasolina (Gasolina: %i / %i Gal. - Diesel: %i / %i Gal.)\n\n", FuelStations[v][StationDescription], FuelStations[v][PetrolAmount], FuelStations[v][PetrolAmountMax], FuelStations[v][DieselAmount], FuelStations[v][DieselAmountMax]);
				strcat(gstr, subinfo);
			}

			Dialog_Show(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "Fuel Supply", gstr, "Done", "");
		}
		else return SysMsg(playerid,"Você não está no escritório Elite Trucking Gas Management ou um caminhão de facções.");
	}
	else SysMsg(playerid,"Somente os caminhoneiros podem usar esse comando.");

	return true;
}
CMD:entregacombustivel(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_TRUCKING) return SysMsg(playerid,"Somente os caminhoneiros podem usar esse comando.");
	if(FactionRank[playerid] < 3) return SysMsg(playerid,"Você deve ser pelo menos o ranking 3.");
	if(!IsPlayerInRangeOfPoint(playerid, 30.0,  673.5842,1833.3052,5.1829)) return SysMsg(playerid,"Você não está no escritório Elite Trucking Gas Management.");
	new vehicleid = GetPlayerVehicleID(playerid);
	if(!IsTruck(vehicleid)) return SysMsg(playerid,"Você precisa estar em um caminhão.");
	if(DeliveringFuel[playerid] > 0) return SysMsg(playerid,"Você já está fornecendo combustível.");
	if(GetVehicleTrailer(vehicleid) > 0) return SysMsg(playerid,"Por favor, retire todos os trailers antes de começar.");

	if(isnull(params)) return SysMsg(playerid,"Use: /entregacombustivel [gasolina/diesel]");

	if(strcmp("gasolina", params, true) == 0)
	{
		DeliveringFuel[playerid] = 1;
		DeliveringFuelVeh[playerid][0] = vehicleid;
		DeiveringFuelAmount[playerid] = 0;
		IsTrucking[playerid] = 1;
		DeiveringFuelType[playerid] = FUEL_GASOLINA;

		SetPlayerCheckpointEx(playerid, -1021.005554, -661.875671, 32.007812, 7.0);
		SendClientMessage(playerid, COLOR_WHITE, "[ENTREGA GASOLINA] Dirija até a fábrica de produtos químicos e pegue seu petroleiro.");
		return true;
	}
	else if(strcmp("diesel", params, true) == 0)
	{
		DeliveringFuel[playerid] = 1;
		DeliveringFuelVeh[playerid][0] = vehicleid;
		DeiveringFuelAmount[playerid] = 0;
		IsTrucking[playerid] = 1;
		DeiveringFuelType[playerid] = FUEL_DIESEL;

		SetPlayerCheckpointEx(playerid, -1021.005554, -661.875671, 32.007812, 7.0);
		SendClientMessage(playerid, COLOR_WHITE, "[ENTREGA DIESEL] Dirija até a fábrica de produtos químicos e pegue seu petroleiro.");
		return true;
	}

	SysMsg(playerid,"Use: /entregacombustivel [gasolina/diesel]");
	return true;
}
CMD:finalizarcombustivel(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_TRUCKING) return SysMsg(playerid,"Somente os caminhoneiros podem usar esse comando.");
	if(DeliveringFuel[playerid] == 0) return SysMsg(playerid,"Você não está fornecendo combustível.");

	if(DeliveringFuel[playerid] == 1)
	{
		DisablePlayerCheckpoint(playerid);
		DeiveringFuelAmount[playerid] = 0;
		DeiveringFuelType[playerid] = 0;
		DeliveringFuel[playerid] = 0;
		DeliveringFuelVeh[playerid][0] = 0;
		DeliveringFuelVeh[playerid][1] = 0;
		IsTrucking[playerid] = 0;
		SendClientMessage(playerid, COLOR_WHITE, "[ENTREGA DE COMBUSTÍVEL] Trabalho cancelado.");
		return true;
	}

	SetPlayerCheckpointEx(playerid, 585.711547, 1664.336669, 6.992187, 10.0);
	DeliveringFuel[playerid] = 3;
	SendClientMessage(playerid, COLOR_WHITE, "[ENTREGA DE COMBUSTÍVEL] Dirija até a sede da Trucking para terminar e receber o pagamento.");
	return true;
}
CMD:reabastecerposto(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_TRUCKING) return SysMsg(playerid,"Somente os caminhoneiros podem usar esse comando.");
	if(DeliveringFuel[playerid] != 2) return SysMsg(playerid,"Você não está fornecendo combustível.");
	if(EngineStatus[GetPlayerVehicleID(playerid)] == 1) return SysMsg(playerid,"Desligue o motor antes de descarregar o combustível.");

	new fuelstation = -1;
	for(new i = 0; i < MAX_FUEL_STATIONS; i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 40.0, FuelStations[i][SignX], FuelStations[i][SignY], FuelStations[i][SignZ]))
		{
			fuelstation = i;
			break;
		}
	}
	if(fuelstation == -1) return SysMsg(playerid,"Você não está perto de um posto de combustível. (Red County, Bone County e Angel Pine)");

	new fuelamount;
	if(sscanf(params, "i", fuelamount)) return SysMsg(playerid,"Use: /reabastecerposto [Quantidade]");
	if(fuelamount < 1) return SysMsg(playerid,"O valor deve ser um número e maior que 0.");
	if(fuelamount > DeiveringFuelAmount[playerid]) return SysMsg(playerid,"Você não tem combustível suficiente no seu trailer de petroleiros.");

	switch(DeiveringFuelType[playerid])
	{
		case FUEL_GASOLINA:
		{
			if(fuelamount + FuelStations[fuelstation][PetrolAmount] > FuelStations[fuelstation][PetrolAmountMax]) return SysMsg(playerid,"Este posto de gasolina não consegue suportar muita gasolina.");
			FuelStations[fuelstation][PetrolAmount] += fuelamount;
			DeiveringFuelAmount[playerid] -= fuelamount;
			UpdateFuelStationSign(fuelstation);
			format(gstr, sizeof(gstr), "Você adicionou %i Galões de petróleo para o posto de gasolina %s. Você pode terminar com /finalizarcombustivel a qualquer momento.", fuelamount, FuelStations[fuelstation][StationDescription]);
			SendClientMessage(playerid, COLOR_WHITE, gstr);
			format(gstr, sizeof(gstr), "[ENTREGA GASOLINA]\n%i / 10000 Galões", DeiveringFuelAmount[playerid]);

			UpdateDynamic3DTextLabelText(DeliveringFuelLabel[playerid], COLOR_WHITE, gstr);
		}
		case FUEL_DIESEL:
		{
			if(fuelamount + FuelStations[fuelstation][DieselAmount] > FuelStations[fuelstation][DieselAmountMax]) return SysMsg(playerid,"Este posto de gasolina não consegue suportar tanto diesel.");
			FuelStations[fuelstation][DieselAmount] += fuelamount;
			DeiveringFuelAmount[playerid] -= fuelamount;
			UpdateFuelStationSign(fuelstation);
			format(gstr, sizeof(gstr), "Você abasteceu %i galões de diesel para o posto de gasolina %s. Você pode terminar com /finalizarcombustivel a qualquer momento.", fuelamount, FuelStations[fuelstation][StationDescription]);
			SendClientMessage(playerid, COLOR_WHITE, gstr);
			format(gstr, sizeof(gstr), "[ENTREGA DIESEL]\n%i / 8000 Gallons", DeiveringFuelAmount[playerid]);

			UpdateDynamic3DTextLabelText(DeliveringFuelLabel[playerid], COLOR_WHITE, gstr);
		}
	}

	return true;
}
CMD:estregarestoque(playerid, params[])//estregarestoque
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_TRUCKING) return SysMsg(playerid,"Somente os caminhoneiros podem usar esse comando.");
	if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você deve ser pelo menos o rank 2.");
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 608.5102,1651.6327,6.9922)) return SysMsg(playerid,"Você não está no escritório Elite Trucking.");
	if(DeliveringStock[playerid] > 0) return SysMsg(playerid,"Você já está entregando estoque.");

	new bcount;

	gstr[0] = EOS;
	for(new b = 0; b < MAX_BIZZ; b++)
	{
		if(BizzData[b][BizzRequestStock] == 1 && BizzData[b][BizzETDelivering] == 0)//
		{
			strcat(gstr, BizzData[b][BizzDescription]);
			strcat(gstr, "\n");
			bcount ++;

			if(bcount == 40) break;
		}
	}

	if(bcount > 0)
	{
		SendClientMessage(playerid,COLOR_GOLD,"Selecione até 3 empresas para reabastecer ao mesmo tempo...");
		Dialog_Show(playerid, StockDelivery, DIALOG_STYLE_LIST, "Lista de empresas que solicitam uma entrega", gstr, "Adicionar", "Cancelar");
	}
	else SysMsg(playerid,"Não há empresas que solicitou um reabastecimento.");

	return true;
}
CMD:verchamadas(playerid, params[])//verchamadas
{
	if(Faction[playerid] != FACTION_TRUCKING && !IsPlayerAdmin(playerid)) return SysMsg(playerid, "Você precisa fazer parte da Elite Trucking para usar este comando.");

	new calls = 0;
	foreach(new i: Player)
	{
		if(HasActiveTruckingCall{i})
		{
			sgstr[0] = EOS;
			strunpack(sgstr, TruckingCallMsg[i]);
			SendClientMessageF(playerid, COLOR_WHITE, "[Elite Trucking Hotline]: [PN: %i] [Nome: %s] %s", PhoneData[i][pNumber], NameRP(i), sgstr);
			calls++;
		}
	}
	if(calls == 0) return SysMsg(playerid, "Sem chamadas activas.");
	return true;
}
CMD:limparchamada(playerid, params[])
{
	new playa = -1;
	if(Faction[playerid] != FACTION_TRUCKING && !IsPlayerAdmin(playerid)) return SysMsg(playerid, "Você precisa fazer parte da Elite Trucking para usar este comando.");

	if(sscanf(params, "u", playa)) return SysMsg(playerid, "Use: /limparchamada [playerID ou name]");

	if(!HasActiveTruckingCall{playa}) return SysMsg(playerid, "Não há nenhuma chamada para limpar.");

	HasActiveTruckingCall{playa} = false;
	strdel(TruckingCallMsg[playa], 0, 128);
	format(gstr, sizeof(gstr), "Você limpou a chamada de %s.", NameRP(playa));
	return true;
}