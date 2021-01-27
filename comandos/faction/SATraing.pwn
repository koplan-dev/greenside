CMD:propriedades(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerInRangeOfPoint(playerid,7.5,1341.4280,213.4901,1378.1924) && Faction[playerid] != FACTION_PROP) return SysMsg(playerid,"Você deve estar nos escritórios Silver Trading para usar esse comando.");
	Dialog_Show(playerid, STPropertiesMenu, DIALOG_STYLE_LIST, "Selecionar uma opção", "Ver propriedades da SA Trading\nVer casas livres", "Selecionar", "Cancelar");
	return true;
}
CMD:addp(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_PROP) return SysMsg(playerid, AUTHMSG);

	new idx = 0, forsale, price;
	if(sscanf(params, "ii", forsale, price)) return SysMsg(playerid,"Use: /addp [à venda 0/1/2] [$preço]");
	if(forsale < 0 || forsale > 2) return SysMsg(playerid,"O parâmetro de venda deve ser 1(não), 2(sim), ou 0(escondido de /properties).");
	if(price < 1 || price > 100000000) return SysMsg(playerid,"parâmetro de preço deve estar entre 1 e 100,000,000.");

	for(idx = 0; idx < MAX_HOUSES; idx++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 0.75, HouseData[idx][oPosX], HouseData[idx][oPosY], HouseData[idx][oPosZ]) && GetPlayerVirtualWorld(playerid) == HouseData[idx][HouseExtVW])
		{
			HouseData[idx][HouseOwnerSQLID] = -5;
			MySQLUpdateInt(HouseData[idx][HouseSQLID], "OwnerSQLID", -5, "houses");
			if(forsale != 0)
			{
				mysql_format(conn, mquery, sizeof(mquery), "REPLACE INTO traders (Type, ForSale, Price, SQLID, Description) VALUES (1, %i, %i, %i, '%e')", forsale - 1, price, HouseData[idx][HouseSQLID], HouseData[idx][HouseDescription]);
				mysql_pquery(conn, mquery);
			}
			SendClientMessageF(playerid, COLOR_WHITE, "A casa '%s' agora está em Silver Trading por $%i", HouseData[idx][HouseDescription], price);
			return true;
		}
	}
	for(idx = 0; idx < MAX_BIZZ; idx++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 0.75, BizzData[idx][oPosX], BizzData[idx][oPosY], BizzData[idx][oPosZ]))
		{
			BizzData[idx][BizzOwnerSQLID] = -5;
			MySQLUpdateInt(BizzData[idx][BizzSQLID], "OwnerSQLID", -5, "bizz");
			if(forsale != 0)
			{
				mysql_format(conn, mquery, sizeof(mquery), "REPLACE INTO traders (Type, ForSale, Price, SQLID, Description) VALUES (2, %i, %i, %i, '%e')", forsale - 1, price, BizzData[idx][BizzSQLID], BizzData[idx][BizzDescription]);
				mysql_pquery(conn, mquery);
			}
			SendClientMessageF(playerid, COLOR_WHITE, "A empresa '%s' agora está em Silver Trading por $%i", BizzData[idx][BizzDescription], price);
			return true;
		}
	}
	return true;
}
CMD:getprop(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_PROP) return SysMsg(playerid, AUTHMSG);

	new idx;

	for(idx = 0; idx < MAX_HOUSES; idx++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 0.75, HouseData[idx][oPosX], HouseData[idx][oPosY], HouseData[idx][oPosZ]) && GetPlayerVirtualWorld(playerid) == HouseData[idx][HouseExtVW] && HouseData[idx][HouseOwnerSQLID] == -5)
		{
			HouseData[idx][HouseOwnerSQLID] = SQLID[playerid];
			MySQLUpdateInt(HouseData[idx][HouseSQLID], "OwnerSQLID", SQLID[playerid], "houses");
			mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM traders WHERE SQLID=%i AND Type=1", HouseData[idx][HouseSQLID]);
			mysql_pquery(conn, mquery);
			format(gstr, sizeof(gstr), "A casa '%s' agora é sua.", HouseData[idx][HouseDescription]);
			SendClientMessage(playerid, COLOR_WHITE, gstr);
			return true;
		}
	}
	for(idx = 0; idx < MAX_BIZZ; idx++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 0.75, BizzData[idx][oPosX], BizzData[idx][oPosY], BizzData[idx][oPosZ]) && BizzData[idx][BizzOwnerSQLID] == -5)
		{
			BizzData[idx][BizzOwnerSQLID] = SQLID[playerid];
			MySQLUpdateInt(BizzData[idx][BizzSQLID], "OwnerSQLID", SQLID[playerid], "bizz");
			mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM traders WHERE SQLID=%i AND Type=2", BizzData[idx][BizzSQLID]);
			mysql_pquery(conn, mquery);
			format(gstr, sizeof(gstr), "A empresa '%s' agora é sua.", BizzData[idx][BizzDescription]);
			SendClientMessage(playerid, COLOR_WHITE, gstr);
			return true;
		}
	}

	return true;
}
CMD:fecharempresas(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_PROP) return SysMsg(playerid, AUTHMSG);

	new toggle = 0;
	if(sscanf(params, "i", toggle)) return SysMsg(playerid, "Use: /fecharempresas [0 para desbloquear, 1 para bloqueio]");
	if(toggle != 0 && toggle != 1) return cmd_fecharempresas(playerid, "");

	for(new b = MAX_BIZZ; b != 0; b--)
	{
		if(BizzData[b][BizzOwnerSQLID] == -5)
		{
			if(toggle == 0)
			{
				if(BizzData[b][BizzLocked])
				{
					BizzData[b][BizzLocked] = false;
				}
			}
			else
			{
				if(!BizzData[b][BizzLocked])
				{
					BizzData[b][BizzLocked] = true;
				}
			}
		}
	}
	if(toggle == 1) SysMsg(playerid, "Todas as empresas Silver Trading estam bloqueados.");
	else SysMsg(playerid, "Todas as empresas da SA Trading foram desbloqueados.");
	return true;
}
CMD:fecharcasas(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_PROP) return SysMsg(playerid, AUTHMSG);

	new toggle = 0, idx;
	if(sscanf(params, "i", toggle)) return SysMsg(playerid, "Use: /fecharcasas [0 para desbloquear, 1 para bloqueio]");

	if(toggle == 0)
	{
		for(idx = 0; idx < MAX_HOUSES; idx++)
		{
			if(HouseData[idx][HouseOwnerSQLID] == -5)
			{
				HouseData[idx][HouseLocked] = 0;
				MySQLUpdateInt(HouseData[idx][HouseSQLID], "HouseLocked", HouseData[idx][HouseLocked], "houses");
			}
		}
		SysMsg(playerid, "Todas as casas Silver Trading foram desbloqueadas.");
		toggle = 1;
	}
	else
	{
		for(idx = 0; idx < MAX_HOUSES; idx++)
		{
			if(HouseData[idx][HouseOwnerSQLID] == -5)
			{
				HouseData[idx][HouseLocked] = 1;
				MySQLUpdateInt(HouseData[idx][HouseSQLID], "HouseLocked", HouseData[idx][HouseLocked], "houses");

			}
		}
		SysMsg(playerid, "Todas as casas Silver Trading foram bloqueadas.");
		toggle = 0;
	}
	return true;
}