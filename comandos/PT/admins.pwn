//admin commands
CMD:gotopos(playerid,params[])
	{
		if(!Logged{playerid}) return true;
		if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);
		{
		    new Float:x, Float:y, Float:z;
		 	if(sscanf(params, "fff", x, y, z))
			{
				SendClientMessage(playerid,COLOR_BLUE,"[ADMIN]{FFFFFF} /gotopos <X> <Y> <Z>");
			    return 1;
		  	}
		  	SetPlayerPos(playerid, x, y, z);
		  	//Log_Write("logs/admin.txt", "[%s] %s se teleportou para posição : x=%f y=%f z=%f", ReturnDate(), GetName(playerid), x, y, z);
		}
		return 1;
}
CMD:biztypes(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);
	SendClientMessage(playerid, COLOR_GRAD2, "0:STATIC");
	SendClientMessage(playerid, COLOR_GRAD2, "1:GENERALSHOP_S");
	SendClientMessage(playerid, COLOR_GRAD2, "2:CLOTHES_BINCO");
	SendClientMessage(playerid, COLOR_GRAD2, "3:WEAPONS_1FLOOR");
	SendClientMessage(playerid, COLOR_GRAD2, "4:CAFE");
	SendClientMessage(playerid, COLOR_GRAD2, "5:PIZZA");
	SendClientMessage(playerid, COLOR_GRAD2, "6:RESTUARANT");
	SendClientMessage(playerid, COLOR_GRAD2, "7:CLUCKINBELL");
	SendClientMessage(playerid, COLOR_GRAD2, "8:GENERALSHOP_M");
	SendClientMessage(playerid, COLOR_GRAD2, "9:GENERALSHOP_L");
	SendClientMessage(playerid, COLOR_GRAD2, "10:CLOTHES_SUBU");
	SendClientMessage(playerid, COLOR_GRAD2, "11:CLOTHES_RICH");
	SendClientMessage(playerid, COLOR_GRAD2, "12:WEAPONS_2FLOOR");
	SendClientMessage(playerid, COLOR_GRAD2, "13:BARBERS");
	SendClientMessage(playerid, COLOR_GRAD2, "14:CLOTHES_PROLAPS");
	SendClientMessage(playerid, COLOR_GRAD2, "15:ELECTRONICS");
	SendClientMessage(playerid, COLOR_GRAD2, "16:SEX");
	SendClientMessage(playerid, COLOR_GRAD2, "17:PLEASUREDOME");
	SendClientMessage(playerid, COLOR_GRAD2, "18:DRUGSHOP");
	SendClientMessage(playerid, COLOR_GRAD2, "19:CASINO");
	SendClientMessage(playerid, COLOR_GRAD2, "20:STRIPCLUB");
	SendClientMessage(playerid, COLOR_GRAD2, "21:POSTOFFICE");
	SendClientMessage(playerid, COLOR_GRAD2, "22:FURNITURE");
	SendClientMessage(playerid, COLOR_GRAD2, "23:CLOTHES_ZIP");
	SendClientMessage(playerid, COLOR_GRAD2, "      ");
	return 1;
}
CMD:removeskin(playerid, params[]) return cmd_removeskin(playerid, params);
CMD:rskin(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, slot;
	if(sscanf(params, "ui", playa, slot)) return SysMsg(playerid, "Use: /rskin [playerID ou name] [skin slot 1-5]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(playa == playerid) return SysMsg(playerid, "Não pode ser você mesmo.");
	if(slot > 5 || slot < 1) return SysMsg(playerid, "Slot inválido. Por favor, insira 1-5.");

	slot --;
	if(Clothes[playa][slot] == 0) return SysMsg(playerid, "Esse player não tem skin neste slot");
	if(Clothes[playa][slot] == cPlayersSkin[playa]) return SysMsg(playerid, "Atualmente ele está usando esta skin.");

	Clothes[playa][slot] = 0;
	slot ++;

	new str[10];
	format(str,sizeof(str),"SkinSet%i",slot);
	MySQLUpdateInt(SQLID[playa], str, Clothes[playa][slot-1], "players");

	SendClientMessageF(playerid, COLOR_RED, "Você removeu a skin de %s do slot %i.", NameEx(playa), slot);
	SendClientMessageF(playa, COLOR_RED, "Admin %s removeu sua skin do slot %i.", NameEx(playerid), slot);
	return true;
}
CMD:verskins(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid, "Use: /verskins [playerID ou name]");
	if(InvalidPlayer(playerid)) return SysMsg(playerid, NOPLAYER);

	new tempstr[50];
	format(gstr, sizeof(gstr), "Inventário de roupas: ");

	for(new i = 0; i < 4; i++)
	{
		if(Clothes[playa][i] > 0)
		{
			format(tempstr, 50, "[Slot %i: %i] ", i+1, Clothes[playa][i]);
			strcat(gstr, tempstr);
		}
		else
		{
			format(tempstr, 50, "[Slot %i: Vazio] ", i+1);
			strcat(gstr, tempstr);
		}
	}
	if(Clothes[playa][4] > 0)
	{
		format(tempstr, 50, "[Facção: %i] ", Clothes[playa][4]);
		strcat(gstr, tempstr);
	}
	else strcat(gstr, "[Facção: Vazio] ");

	SendClientMessage(playerid, COLOR_WHITE, gstr);
	return true;
}
CMD:listavigiados(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Use: /listavigiados [ver/add/remover]");

	if(strcmp(params, "ver", true) == 0)
	{
		mysql_pquery(conn, "SELECT * FROM watchlist", "ShowWatchlistInfo", "i", playerid);
	}
	else if(strfind(params, "add", true) != -1)
	{
		new option[12], maname[25], info[150];
		if(sscanf(params, "s[12]s[25]s[150]", option, maname, info)) return SysMsg(playerid, "Use: /listavigiados add [Nome da conta Master] [informação]");
		if(!strlen(maname)) return SysMsg(playerid, "Por favor, coloque o nome da Conta Master.");
		if(!strlen(info)) return SysMsg(playerid, "Você deve inserir informações sobre a entrada da lista de observação.");

		new sqlid = MySQLCheckMaster_AgainstName(maname);
		if(sqlid == 0) return SysMsg(playerid, "Não é possível encontrar um MA com esse nome");

		mysql_format(conn, mquery, sizeof(mquery), "SELECT NULL FROM watchlist WHERE Player = %i", sqlid);
		mysql_pquery(conn, mquery, "AddUserToWatchlist", "iiss", playerid, sqlid, maname, info);
		return true;
	}
	else if(strfind(params, "remover", true) != -1)
	{
		new option[12], id;
		if(sscanf(params, "s[12]i", option, id)) return SysMsg(playerid, "Use: /listavigiados remove [ID da /listavigiados ver]");

		mysql_format(conn, mquery, sizeof(mquery), "SELECT NULL FROM watchlist WHERE id = %i", id);
		mysql_pquery(conn, mquery, "ProcessWatchlistRemoval", "ii", playerid, id);
	}
	return true;
}
RCRP::ShowWatchlistInfo(playerid)
{
	if(!cache_num_rows()) return SysMsg(playerid, "A lista de vigilância está atualmente vazia.");

	SendClientMessage(playerid, COLOR_WHITE, "[Watchlist]");

	new reason[30][150], id[30], player[30];
	for(new i = 0, x = cache_num_rows(); i < x; i++)
	{
		id[i] = cache_get_field_content_int(i, "id");
		player[i] = cache_get_field_content_int(i, "Player");
		cache_get_field_content(i, "Reason", reason[i], conn, 150);
	}
	for(new i = 0, x = cache_num_rows(); i < x; i++)
	{
		SendSplitMessageF(playerid, COLOR_WHITE, "Entrada %i: [%s - %s]", id[i], GetMasterName(player[i]), reason[i]);
	}
	return true;
}
RCRP::ProcessWatchlistRemoval(playerid, id)
{
	if(!cache_num_rows()) return SendClientMessage(playerid, COLOR_WHITE, "Não foi encontrada nenhuma entrada na lista de observação.");

	mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM watchlist WHERE id = %i", id);
	mysql_pquery(conn, mquery);

	SendClientMessage(playerid, COLOR_WHITE, "Entrada da lista de vigilância removida.");
	return true;
}
RCRP::AddUserToWatchlist(playerid, sqlid, maname[], info[])
{
	if(cache_num_rows()) return SendClientMessage(playerid, COLOR_WHITE, "Este usuário já está na lista de vigilância.");

	mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO watchlist (Player, Reason, AdminSQLID) VALUES (%i, '%e', %i)", sqlid, info, SQLID[playerid]);
	mysql_pquery(conn, mquery);

	SendClientMessageF(playerid, COLOR_WHITE, "Você adicionou %s para lista de Jogadores Vigiados.", maname);
	return true;
}
CMD:usarnota(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new accountname[25], note[150];
	if(sscanf(params, "s[25]s[150]", accountname, note)) return SysMsg(playerid, "Use: /usarnota [Nome da Conta Master] [Nota]");
	if(!strlen(accountname)) return SysMsg(playerid, "Você deve inserir um nome de MA");
	if(!strlen(note)) return SysMsg(playerid, "Você deve inserir uma nota.");

	new sqlid = MySQLCheckMaster_AgainstName(accountname);
	if(sqlid == 0) return SysMsg(playerid, "Não foi possível encontrar um MA com esse nome");

	mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET UserNote = '%e' WHERE id = %i", note, sqlid);
	mysql_pquery(conn, mquery);

	SendClientMessageF(playerid, COLOR_WHITE, "Você adicionou uma nota para conta %s.", accountname);
	return true;
}
CMD:removerusernota(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Use: /removerusernota [Nome da Conta Master]");

	new sqlid = MySQLCheckMaster_AgainstName(params);
	if(sqlid == 0) return SysMsg(playerid, "não conseguiu encontrar um MA com esse nome.");

	mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET UserNote = '' WHERE id = %i", sqlid);
	mysql_pquery(conn, mquery);

	SendClientMessageF(playerid, COLOR_WHITE, "Removeu a noda da conta %s.", params);
	return true;
}
/*CMD:reconnectbot(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	format(sgstr, sizeof(sgstr), "Admin %s is reconnecting the bot.", NameEx(playerid));
	IRC_Quit(IRCBot, sgstr);
	IRCBot = IRC_Connect("irc.tl", 6667, "RCRPBot", "The Holy Light of Hegebe", "Hegebe123", false);
	SendClientMessage(playerid, COLOR_RED, "[Admin] Bot reconnected.");
	return true;
}*/
CMD:jogadoresabatidos(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new downedcount = 0;
	foreach(new i: Player)
	{
		if(Dead{i})
		{
			downedcount ++;
			SendClientMessageF(playerid, COLOR_WHITE, "%s (ID %i) Esta abatido. Tempo de morte: %i segundos.", NameEx(i), i, DeathTimer[i]);
		}
	}
	if(downedcount == 0) SendClientMessage(playerid, COLOR_WHITE, "Nenhum jogador está abatido no momento.");
	return true;
}
CMD:cadaveres(playerid)//cadáveres
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	gstr[0] = EOS;

	new corpsecount = 0;
	for(new x = 0; x < MAX_CORPSES; x++)
	{
		if(CorpseData[x][CorpseUsed])
		{
			corpsecount ++;
			format(sgstr, sizeof(sgstr), "ID %i - %s\n", x, GetSQLName(CorpseData[x][CorpseOwner]));
			strcat(gstr, sgstr);
		}
	}
	if(corpsecount == 0) return SysMsg(playerid, "Nenhum cadável encontrado.");
	else Dialog_Show(playerid, CorpseList, DIALOG_STYLE_LIST, "Todos cadáveres", gstr, "Teleporte", "Cancelar");
	return true;
}
CMD:fazercadavel(playerid)//fazercadavel
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	CreateCorpse(playerid);
	SendClientMessage(playerid, -1, "ok");
	return true;
}
CMD:anticheat(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(IsPlayerAdminLevelOK(playerid, 4)) ShowAntiCheatSettings(playerid);
	return true;
}
CMD:paint(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, CMDFMSG);

	if(!UsingPaint{playerid})
	{
		if(ADuty[playerid] != 1) return SysMsg(playerid, "Você deve estar administrando para usar esse comando.");
		foreach(new i: Player)
		{
			if(Logged{i})
			{
				format(tgstr, sizeof(tgstr), "%s (%i)", NameEx(i), i);
				PaintLabels[playerid][i] = CreateDynamic3DTextLabel(tgstr, COLOR_ORANGE, PlayerPosX(i), PlayerPosY(i), PlayerPosZ(i), 500, i, INVALID_VEHICLE_ID, 0, -1, -1, playerid, 500.0);
			}
		}
		Streamer_Update(playerid);
		UsingPaint{playerid} = true;
		SendClientMessage(playerid, COLOR_RED, "[Admin] Você ativou os Text Labels para todos os jogadores.");
	}
	else
	{
		for(new x = 0; x < MAX_PLAYERS; x++)
		{
			if(PaintLabels[playerid][x] != Text3D:INVALID_3DTEXT_ID)
			{
				DestroyDynamic3DTextLabel(PaintLabels[playerid][x]);
				PaintLabels[playerid][x] = Text3D:INVALID_3DTEXT_ID;
			}
		}
		UsingPaint{playerid} = false;
		SendClientMessage(playerid, COLOR_RED, "[Admin] Você desativou os Text Labels para todos os jogadores.");
	}
	return true;
}
CMD:pvars(playerid)//revisar
{
	new varname[128], varcount = GetPVarsUpperIndex(playerid);
	if(varcount == 0) return SendClientMessage(playerid, -1, "Nenhum PV encontrado no seu ID de jogador.");
	for(new i = 0; i < varcount; i++)
	{
		GetPVarNameAtIndex(playerid, i, varname, 128);
		switch(GetPVarType(playerid, varname))
		{
			case PLAYER_VARTYPE_NONE: format(sgstr, sizeof(sgstr), "pVar %i: {FF0000}NÃO UTILIZADO", i);
			case PLAYER_VARTYPE_INT: format(sgstr, sizeof(sgstr), "pVar %i: %s - %i", i, varname, GetPVarInt(playerid, varname));
			case PLAYER_VARTYPE_STRING:
			{
				new pvarstring[128];
				GetPVarString(playerid, varname, pvarstring, 128);
				format(sgstr, sizeof(sgstr), "pVar %i: %s - %s", i, varname, pvarstring);
			}
			case PLAYER_VARTYPE_FLOAT: format(sgstr, sizeof(sgstr), "pVar %i: %s - %f", i, varname, GetPVarFloat(playerid, varname));
		}
		SendSplitMessage(playerid, -1, sgstr);
	}
	return true;
}
CMD:reportes(playerid, params[])//reportares
{
	if(!Logged{playerid}) return true;
	if(IsPlayerAdminLevelOK(playerid, 1))
	{
		gstr[0] = EOS;
		for(new x = 0; x < MAX_REPORTS; x++)
		{
			if(strlen(Reports[x][ReporterName]))
			{
				format(sgstr, sizeof(sgstr), "Reporte de %s sobre %s. {FF0000}Clique para ver a razão{FFFFFF}\n", Reports[x][ReporterName], Reports[x][ReportedName], Reports[x][ReportReason]);
				strcat(gstr, sgstr);
			}
		}
		if(!strlen(gstr)) return SysMsg(playerid, "Não nenhum reporte ativo.");
		Dialog_Show(playerid, ReportsList, DIALOG_STYLE_LIST, "Reportes ativos", gstr, "Detalhes", "Fechar");
	}
	return true;
}
CMD:limparmdc(playerid, params[])//limparmdc
{
	if(!IsPlayerAdmin(playerid)) return true;

	mysql_pquery(conn, "SELECT SuspectSQLID FROM mdc GROUP BY SuspectSQLID", "MDCCleanup", "d", playerid);
	return true;
}
RCRP::MDCCleanup(playerid)
{
	new c = 0, account1, account2;
	for(new x = 0, i = cache_num_rows(); x < i; x++)
	{
		account1 = cache_get_field_content_int(x, "SuspectSQLID");

		account2 = MySQLCheckAccountBanned(account1);
		if(account2 == 0)
		{
			mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM mdc WHERE SuspectSQLID = %i", account1);
			mysql_pquery(conn, mquery);
			c++;
		}
	}
	SysMsgF(playerid, "%i contas removidas do MDC.", c);
	return true;
}
CMD:aj(playerid)
{
	if(!Logged{playerid}) return true;

	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	SendClientMessage(playerid, COLOR_RED, "Ajuda > Admin Ajuda");

	SendClientMessage(playerid, COLOR_WHITE, "Comandos admin Trial:");
	SendClientMessage(playerid, COLOR_ORANGE, "/aduty /a /kick /ban /tban /view(t|d)bans /dateban /(un)mute /dooc(un)mute /mutes /stats [id] /ip [id] /aa /aboombox /confirmnome");
	SendClientMessage(playerid, COLOR_ORANGE, "/ajudar /assistencias /fassistencia(Para finalizar) /cars /togamsg /afklista /estranhos /veiculos /vid /checkguns /checkplayer /checkconta /removedateban");
	SendClientMessage(playerid, COLOR_ORANGE, "/ajail /inajail /ujail /trazer /ir /irveh /getv /spec /specoff /rspec /vdamage /slap /slapdown /adminrecord /puniroff /tunban");
	SendClientMessage(playerid, COLOR_ORANGE, "/avisar /avisarings /ipcheck /vspec /reefer /avabrir /avfechar /delv /localadmin /quemspawn /queme /unban /setunbandate /acceptra /revive /removerfogo");
	SendClientMessage(playerid, COLOR_ORANGE, "/freeze /unfreeze /set /inventario [id] /ircasa /irnegocio /checkallguns /tp /removermascara /xyz /acars /quemspec /vget /acars");
	SendClientMessage(playerid, COLOR_ORANGE, "/aesconder /playerareas /armaslocal /veiculosarea /precisao /object /paint /jogadoresabatidos /clientid /guninfo /userlog");
	SendClientMessage(playerid, COLOR_ORANGE, "/rskin /removercadaver /limparcadaveres /cadaveres");


	if(IsPlayerAdminLevelOK(playerid, 2))
	{
		SendClientMessage(playerid, COLOR_WHITE, "Admin Comandos:");
		SendClientMessage(playerid, COLOR_ORANGE, "/desabilitarconta /habilitaconta /v /flip /fazerhelper /disarm /infodinheiro /createstillfire /fids /respawnvf");
	}

	if(IsPlayerAdminLevelOK(playerid, 3))
	{
		SendClientMessage(playerid, COLOR_WHITE, "Lead Admin Comandos:");
		SendClientMessage(playerid, COLOR_ORANGE, "/anuncioadm /kill [id] /bc /contagemr /iniciarevento /pararevento /gmx /cancelgmx /dararma /vreparar");
		SendClientMessage(playerid, COLOR_ORANGE, "/(un)freezeall /darlicenca /removelicenca /mudartelefone /refunddrogas");
		SendClientMessage(playerid, COLOR_ORANGE, "/(un)banip /disableaccid /doubleslap /criarfogo /tooc");
	}

	if(IsPlayerAdminLevelOK(playerid, 4))
	{
		SendClientMessage(playerid, COLOR_WHITE, "Management Comandos:");
		SendClientMessage(playerid, COLOR_ORANGE, "/vehattach /settime /anim /fedit /cfv /dfv /rbanip /reloadfactions /refundodinheiro /mudarsenha /kickping /xyz /gtoghc /addfuel");
		SendClientMessage(playerid, COLOR_WHITE, "Os comandos adicionais via RCON podem ser encontrados por using /rch");
	}

	SendClientMessage(playerid, COLOR_WHITE, "Todos os comandos abaixo do seu ranking também podem ser usados.");
	return true;
}
CMD:adminajuda(playerid, params[]) return cmd_aj(playerid);
CMD:aajuda(playerid, params[]) return cmd_aj(playerid);
CMD:mudarsenha(playerid, params[])
{
	//if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);

	new accountname[MAX_PLAYER_NAME], password[50], hashpass[150], sqlid;
	if(sscanf(params, "s[20]s[50]", accountname, password)) return SysMsg(playerid,"Use: /mudarsenha [Conta Master] [Nova Senha]");
	sqlid = MySQLCheckMaster_AgainstName(accountname);
	if(sqlid <= 1) return SysMsg(playerid,"Este nome não foi encontrado.");

	WP_Hash(hashpass, 150, password);
	MySQLUpdateString(sqlid, "Password", hashpass, "masters");

	format(gstr, sizeof(gstr), "Você mudou a senha da conta para '%s'", GetSQLName(sqlid), password);
	SendClientMessage(playerid, COLOR_RED, gstr);
	AdminLog(playerid, sqlid, accountname, "Senha da conta Alterado.");
	return true;
}
CMD:addfuel(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new fuelamount, fuelplace[6], fueltype[7];
	if(sscanf(params, "s[6]s[7]i", fuelplace, fueltype, fuelamount)) return SysMsg(playerid,"Use: /addfuel [mont,pc,dil,bce,bcw,elq,fc,ap,aps,flint,aper] [petroler/diesel] [Quantidade]");

	new fidx = -1;

	if(!strcmp(fuelplace, "mont")) fidx = 0;
	else if(!strcmp(fuelplace, "pc")) fidx = 1;
	else if(!strcmp(fuelplace, "dil")) fidx = 2;
	else if(!strcmp(fuelplace, "fc")) fidx = 3;
	else if(!strcmp(fuelplace, "bce")) fidx = 4;
	else if(!strcmp(fuelplace, "elq")) fidx = 5;
	else if(!strcmp(fuelplace, "bcw")) fidx = 6;
	else if(!strcmp(fuelplace, "flint")) fidx = 7;
	else if(!strcmp(fuelplace, "aps")) fidx = 8;
	else if(!strcmp(fuelplace, "ap")) fidx = 9;
	else if(!strcmp(fuelplace, "aper")) fidx = 10;


	if(!strcmp(fueltype, "gasolina"))
	{
		if(FuelStations[fidx][PetrolAmount] + fuelamount > FuelStations[fidx][PetrolAmountMax]) return SysMsg(playerid,"A estação não pode suportar muito combustível.");
		FuelStations[fidx][PetrolAmount] += fuelamount;
		UpdateFuelStationSign(fidx);

		format(gstr, sizeof(gstr), "Admin %s adicionou %i Galões de gasolina para o posto de gasolina %s.", NameEx(playerid), fuelamount, FuelStations[fidx][StationDescription]);
		SendClientMessageToAllLogged(COLOR_OOC, gstr);
		format(gstr, sizeof(gstr), "Você adicionou %i Galões de gasolina para o posto de gasolina %s", fuelamount, FuelStations[fidx][StationDescription]);
		AdminLog(playerid, 0, "", gstr);
		return true;
	}
	else if(!strcmp(fueltype, "diesel"))
	{
		if(FuelStations[fidx][DieselAmount] + fuelamount > FuelStations[fidx][DieselAmountMax]) return SysMsg(playerid,"Station cannot hold this much fuel.");
		FuelStations[fidx][DieselAmount] += fuelamount;
		UpdateFuelStationSign(fidx);

		format(gstr, sizeof(gstr), "Admin %s adicionou %i Galões de Diesel para o posto de gasolina %s.", NameEx(playerid), fuelamount, FuelStations[fidx][StationDescription]);
		SendClientMessageToAllLogged(COLOR_OOC, gstr);
		format(gstr, sizeof(gstr), "Você adicionou %i Galões de gasolina para o posto de gasolina %s", fuelamount, FuelStations[fidx][StationDescription]);
		AdminLog(playerid, 0, "", gstr);
		return true;
	}

	SysMsg(playerid,"Erro com parâmetros.");
	return true;
}
CMD:gtogdooc(playerid)
{
	if(!Logged{playerid}) return SysMsg(playerid,"Faça o login primeiro.");
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	GlobalDOOCMute = !GlobalDOOCMute;
	if(!GlobalDOOCMute) SendClientMessageToAllLogged(COLOR_DONATE, "O canal de bate-papo Donator OOC foi ativado.");
	else SendClientMessageToAllLogged(COLOR_DONATE, "O canal de bate-papo Donator OOC foi desativado.");

	return true;
}
CMD:togamsg(playerid)
{
	if(!Logged{playerid}) return SysMsg(playerid,"Faça o login primeiro.");
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(ADuty[playerid] == 1) return SysMsg(playerid,"Você não pode modificar isso enquanto estiver de plantão.");

	AdminMsgToggle{playerid} = !AdminMsgToggle{playerid};
	if(AdminMsgToggle{playerid}) SendClientMessage(playerid, COLOR_WHITE, "Certas mensagens de administrador não estão habilitadas para você.");
	else SendClientMessage(playerid, COLOR_WHITE, "Certas mensagens de administrador agora estão desativadas para você.");

	return true;
}
CMD:togip(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	IPTog{playerid} = !IPTog{playerid};
	if(IPTog{playerid}) SysMsg(playerid, "Os endereços IP não aparecerão mais para você ao juntar mensagens.");
	else SysMsg(playerid, "Os endereços IP não serão exibidos para você ao juntar mensagens.");

	return true;
}
CMD:afklista(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	gstr[0] = EOS;

	foreach(new i: Player)
	{
		if(Logged{i} && IsAFK{i})
		{
			format(sgstr, sizeof(sgstr), "%s(%i) - %i minutos (Razão: %s)\n", NameEx(i), i, AwayMinutes[i], AFKReason[i]);
			strcat(gstr, sgstr);
		}
	}

	if(!strlen(gstr)) return SysMsg(playerid, "Sem jogadores AFK.");
	else ShowMessage(playerid, "Server AFK", gstr, "Ok");
	return true;
}
CMD:estranhos(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new sub[60], count = 0;

	gstr[0] = EOS;
	foreach(new i: Player)
	{
		if(Logged{i} && IsPlayerMasked{i} && MaskHideName{i})
		{
			if(count > 0) format(sub, sizeof(sub), "\nEstranho_%i - %s(ID %i)", MaskLabelNumber[i], NameEx(i), i);
			else format(sub, sizeof(sub), "Estranho_%i - %s(ID %i)", MaskLabelNumber[i], NameEx(i), i);
			count ++;
			strcat(gstr, sub);
		}
	}

	if(count > 0) ShowMessage(playerid, "Lista de mascarados", gstr, "Ok");
	return true;
}
CMD:rch(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	SendClientMessage(playerid, COLOR_RED, "Ajuda > RCON Admin Ajuda");
	SendClientMessage(playerid, COLOR_WHITE, "RCON comandos:");
	SendClientMessage(playerid, COLOR_ORANGE, "/setdonate /dlevelup /venderoldassets /venderbanassets /pagarday /setgravity");
	SendClientMessage(playerid, COLOR_ORANGE, "/kickall /healall /vlabel /delvlabel /gt /msgall /playsound /msgp /bone /sdo /plantbomb /explode /disarmbomb");
	SendClientMessage(playerid, COLOR_ORANGE, "/maths /attach /uberslap /queimadinheiro /stopqueimardinheiro /explodir /setserversenha /tc /fach");
	SendClientMessage(playerid, COLOR_ORANGE, "/saction /fakeme /recordbot /stoprecord /criarcasa /editarcasa /reloadhouses /fazerveh /editveh");
	SendClientMessage(playerid, COLOR_ORANGE, "/makepickup /makebizz /editbizz /reloadbizz /reloadpickups /cquarto /darxp /delacc /reloadweaponinfo");
	return true;
}
CMD:veiculos(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new vehDone[212];

	gstr[0] = EOS;
	for(new vid = 1, x = GetVehiclePoolSize(); vid <= x; vid++)
	{
		if(IsVehicleSpawned(vid))
		{
			new model = GetVehicleModel(vid);
			new Count = 0;

			for(new v = 1, x2 = GetVehiclePoolSize(); v <= x2; v++)
			{
				if(GetVehicleModel(v) == model && vehDone[model-400] == 0)
				{
					Count++;
				}
			}

			if(Count > 0 && vehDone[model-400] == 0)
			{
				new subStr[128];
				if(Count == 1) format(subStr,128,"\n1 %s",GetVehicleNameEx(model));
				else format(subStr,128,"\n%i %s's",Count,GetVehicleNameEx(model));
				format(gstr, sizeof(gstr),"%s\n%s",gstr,subStr);
			}

			vehDone[model-400] = 1;
		}
	}

	Dialog_Show(playerid,DIALOG_NONE,DIALOG_STYLE_LIST,"Dados do veículo",gstr,"Pronto","");
	return true;
}
CMD:mysqlstats(playerid, params)
{
	if(IsPlayerAdminLevelOK(playerid, 4))
	{
		gstr[0] = EOS;
		mysql_stat(gstr);
		SendSplitMessage(playerid, COLOR_WHITE, gstr);
		SendClientMessageF(playerid, COLOR_WHITE, "Unpro Queries: %i", mysql_unprocessed_queries());
	}
	else return SysMsg(playerid, CMDFMSG);
	return true;
}
CMD:v(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);
	if(IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid, "Você não pode spawnar um veiculo estando dentro de um.");

	new vehiclename[20];
	if(sscanf(params, "s[20]", vehiclename)) return SysMsg(playerid,"Use: /v [nome do model] [Optional: cor 1] [Optional: cor 2]");
	if(GetVehiclePoolSize()+1 > MAX_VEHICLES) return SysMsg(playerid,"Error: Língua de aproximação do veículo.");
	new Car = GetVehicleModelIdFromName(vehiclename);
	if(Car == -1)
	{
		Car = strval(vehiclename);
		if(Car < 400 || Car > 611) return SysMsg(playerid,"Isso não parece ser um veículo válido. Use o nome do modelo ou ID.");
	}

	if(!IsPlayerAdmin(playerid))
	{
		new restrictedModels[12] = {406, 425, 432, 447, 537, 538, 569, 570, 577, 590, 592, 520};

		for(new i = 0; i < sizeof(restrictedModels); i++) if(Car == restrictedModels[i]) return SysMsg(playerid, "O veículo está restrito de spawn.");
	}

	new Float:X, Float:Y, Float:Z, Float:A, interior, vw;
	GetPlayerPos(playerid, X, Y, Z);
	GetPlayerFacingAngle(playerid, A);
	X += (5 * floatsin(-A, degrees));
	Y += (5 * floatcos(-A, degrees));
	interior = GetPlayerInterior(playerid);
	vw = GetPlayerVirtualWorld(playerid);

	new carid = CreateVehicleEx(Car, X, Y, Z, A, 7, 7, -1);
	aspawned{carid} = true;
	ToggleVehicleEngine(carid, 1);
	EngineStatus[carid] = 1;
	PutPlayerInVehicle(playerid, carid, 0);

	Locked{carid} = false;
	AdminLocked{carid} = false;
	foreach(new i: Player) Objective[carid][i] = 0;
	ToggleVehicleLock(carid, 0);

	if(interior > 0)
	{
		LinkVehicleToInteriorEx(carid, interior);
	}
	if(vw > 0)
	{
		SetVehicleVirtualWorld(carid, vw);
	}

	if(!VehicleHasEngine(carid))
	{
		EngineStatus[carid] = 1;
		Fuel[carid] = 100;
	}

	VehicleSpawnedBy[carid][0] = SQLID[playerid];

	SendClientMessageF(playerid, COLOR_LIGHTGREEN,  "Veiculo spawnado: {FFFFFF}%s{00FF00} (ID {FFFFFF}%i{00FF00}, Model {FFFFFF}%i{00FF00})", GetVehicleName(carid), carid, Car);
	format(sgstr, sizeof(sgstr), "Veiculo spawnado: %s (ID %i, Model %i)", GetVehicleName(carid), carid, Car);
	AdminLog(playerid, 0, "", sgstr);
	return true;
	
}
CMD:veh(playerid, params[]) return cmd_v(playerid, params);
CMD:quemspawn(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new vehid = GetPlayerVehicleID(playerid);
	if(vehid == 0) if(sscanf(params, "i", vehid)) return SysMsg(playerid,"Use: /quemspawn [veiculo ID] || /quemspawn se você estiver em um veículo");

	new whospawned[MAX_PLAYER_NAME], h, m, diff = gettime() - VehicleSpawnedBy[vehid][1];

	if(VehicleSpawnedBy[vehid][0] == 0) format(whospawned, MAX_PLAYER_NAME, "Servidor");
	else format(whospawned, MAX_PLAYER_NAME, GetSQLName(VehicleSpawnedBy[vehid][0]));

	while(diff > 3600)
	{
		diff -= 3600;
		h++;
	}
	while(diff > 60)
	{
		diff -= 60;
		m++;
	}
	SendClientMessageF(playerid, COLOR_WHITE, "[%s, ID %i] Spawnado por %s %ih e %im atrás.", GetVehicleName(vehid), vehid, whospawned, h, m);
	return true;
}
CMD:vehattach(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);

	new Float:pX,Float:pY,Float:pZ;
	new Float:vX,Float:vY,Float:vZ;
	GetPlayerPos(playerid,pX,pY,pZ);
	new Found = 0;
	new vid = 1;
	new vehicleid = GetPlayerVehicleID(playerid);

	new x = GetVehiclePoolSize();
	while(vid <= x && !Found)
	{
		vid++;
		GetVehiclePos(vid,vX,vY,vZ);
		if(floatabs(pX-vX) < 7.0 && floatabs(pY-vY) < 7.0 && floatabs(pZ-vZ) < 7.0 && vid != vehicleid)
		{
			Found = 1;
			if(IsTrailerAttachedToVehicle(vehicleid)) DetachTrailerFromVehicle(vehicleid);
			else AttachTrailerToVehicle(vid,vehicleid);
		}
	}

	return true;
}
CMD:acars(playerid, params[])
{
	new count = 0;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid,"Você não está autorizado a usar esse comando.");
	gstr[0] = EOS;
	for(new v = 1, x = GetVehiclePoolSize(); v <= x; v++)
	{
		if(VehicleSpawnedBy[v][0] != 0)
		{
			format(gstr, sizeof(gstr), "%s%i - %s - Spawnado por: %s\n", gstr, v, GetVehicleName(v), GetSQLName(VehicleSpawnedBy[v][0]));
			count++;
		}
	}
	if(count == 0) return SysMsg(playerid,"Não há nenhum veiculo spawnado por administradores no momento.");
	Dialog_Show(playerid, AdminCarList, DIALOG_STYLE_LIST, "Veiculos admin", gstr, "Despawn", "Cancelar");
	return true;
}
CMD:delv(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);

	new id[12];

	if(IsPlayerInAnyVehicle(playerid)) format(id, 12, "%i", GetPlayerVehicleID(playerid));
	else if(sscanf(params, "s[12]", id)) return SysMsg(playerid, "Use: /delv [Veiculo ID / All]");

	if(IsNumeric(id))
	{
		new v = strval(id);
		if(v < 1 || v > MAX_VEHICLES || !IsVehicleSpawned(v)) return SysMsg(playerid, "Veiculo ID inválido");
		if(v > MAX_VEHICLES) return SysMsg(playerid, "Você não pode deletar veiculos do servidor.");

		new faction = IsFactionVehicle(v);
		if(faction > 0) return SysMsg(playerid,"Você não pode deletar veiculos de uma facção. (/dfv)");
		if(IsServerCar(v)) return SysMsg(playerid,"Você não pode deletar esse veiculo do servidor.");
		if(IsHelper{playerid} && IsAssisting[playerid] == -1) return SysMsg(playerid,"Você precisa está prestando assistência para usar esse comando");
		if(VehicleData[v][IdVehicle] == v) return SysMsg(playerid,"Você não pode deletar um veiculo que tem dono.");
		if(IsRentalCar(v)) return SysMsg(playerid, "Você não pode deletar um veiculo de aluguél.");

		CarColor[v][0] = 1;
		CarColor[v][1] = 1;
		AdminLocked{v} = false;

		JustDeletedVehicle{playerid} = true;

		SendClientMessageF(playerid, COLOR_LIGHTGREEN,  "Veiculo destruido: {FFFFFF}%s{00FF00} (ID {FFFFFF}%i{00FF00})", GetVehicleName(v), v);
		format(sgstr, sizeof(sgstr), "Veiculo destruido: %s (ID %i)", GetVehicleName(v), v);
		VehicleSpawnedBy[v][0] = 0;
		DestroyVehicleEx(v, "0");
		ClearVehicleData(v);
		AdminLog(playerid, 0, "", sgstr);
	}
	else if(strmatch("all", id))
	{
		if(IsPlayerAdminLevelOK(playerid, 2))
		{
			new count = 0, opp = 0;
			for(new v = 0, x = GetVehiclePoolSize(); v <= x; v++)
			{
				if(aspawned{v})
				{
					if(!IsVehicleOccupied(v))
					{
						CarColor[v][0] = 1;
						CarColor[v][1] = 1;
						AdminLocked{v} = false;
						count++;

						VehicleSpawnedBy[v][0] = 0;
						DestroyVehicleEx(v, "v 1");
						ClearVehicleData(v);
					}
					opp++;
				}
			}

			if(count == 0)
			{
				if(opp == 0) SendClientMessage(playerid, COLOR_RED, "Não há nenhum veiculo administrativo para despawn.");
				else SendClientMessage(playerid, COLOR_RED, "Todos os veiculos administrativos estão atualmente ocupados.");
				return true;
			}

			SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Você despawnou %i fora de %i veiculos spawnados.", count, opp);
			format(gstr, sizeof(gstr), "[Admin] %s despawno um veiculo %i out of %i admin spawned vehicles.", NameEx(playerid), count, opp);
			AdminBroadcast(gstr, 1);
		}
		else return SysMsg(playerid, AUTHMSG);
	}
	else return SysMsg(playerid, "Use: /delv [Veiculo ID / ALL]");
	return true;
}
CMD:delveh(playerid, params[]) return cmd_delv(playerid, params);
CMD:setvh(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new vid = GetPlayerVehicleID(playerid);
	if(vid > 0)
	{
		SetVehicleHealthEx(vid, strval(params));
		SysMsgF(playerid, "Saúde do veículo definida para %i.", strval(params));
	}
	return true;
}
CMD:ln(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	SendClientMessageF(playerid, COLOR_WHITE, "Desenhar: %i", WinningLotteryNumber);
	return true;
}
CMD:fl(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

	if(IsPlayerInAnyVehicle(playerid))
	{
		new id = GetPlayerVehicleID(playerid), Float:a;
		GetVehicleZAngle(id,a);
		SetVehicleZAngle(id,a);
		format(gstr, sizeof(gstr), "Veiculo capotado: %s(%i)", GetVehicleName(id),id);
		SendClientMessage(playerid, COLOR_LIGHTGREEN,  gstr);
	}
	else return SysMsg(playerid,"Você não está em um veículo.");

	return true;
}
CMD:flip(playerid, params[]) return cmd_fl(playerid, params);
CMD:dararma(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, gunid[30], reason[8];

	if(sscanf(params, "us[30]s[8]", playa, gunid, reason)) return SysMsg(playerid,"Use: /dararma [ID ou nome do jogador] [arman id/parte do nome] [evento/refundo/facção]");

	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(GetFreeWeaponObjectIndex(playa) == -1) return SysMsg(playerid, "Esse jogador não pode ter outra arma agora.");

	new wid;
	if(!IsNumeric(gunid)) wid = GetWeaponIdFromName(gunid);
	else wid = strval(gunid);

	if(wid == -1) return SysMsg(playerid,"Arma inválida.");
	if(wid < 0 || wid > 47) return SysMsg(playerid,"Arma inválida.");
	if(wid == 19 || wid == 20 || wid == 21) return SysMsg(playerid,"Arma inválida.");

	new ammo = GetDefaultWeaponAmmo(wid);
	if(!IsPlayerAdmin(playa) && IsBanWeapon(wid)) return SysMsg(playerid,"Esse jogador não pode ter uma arma");

	new wname[30];
	wname = GetWeaponNameFromID(wid);
	if(!WeaponCheck(playa, wid) && IsActualGun(wid)) return SysMsg(playerid, "Este jogador não pode pegar esta arma.");
	if(WeaponData[playa][GetWeaponSlot(wid)][Weapon] >= 1) return SysMsg(playerid, "Este jogador já possui uma arma nesse slot.");

	if(strcmp("refundo", reason, true) == 0)
	{
		GivePlayerWeaponEx(playa, wid, ammo, 1, -1, 1, SQLID[playerid]);

		format(sgstr, sizeof(sgstr),"Admin %s refundou uma arma: %s(Id:%i) Munições: %i", NameEx(playerid), wname, wid, ammo);
		SendClientMessage(playa, COLOR_LIGHTGREEN,  sgstr);
		format(sgstr, sizeof(sgstr),"[Admin] %s refundou %s uma arma: %s(Id:%i) Munições: %i", NameEx(playerid), NameEx(playa), wname, wid, ammo);
		AdminBroadcast(sgstr, 1);
		format(sgstr, sizeof(sgstr), "Give weapon %s, ammo=%i, reason=Refund", wname, ammo);
		AdminLog(playerid, SQLID[playa], GetName(playa), sgstr);
	}
	else if(strcmp("evento", reason, true) == 0)
	{
		GivePlayerWeapon(playa, wid, ammo);
		HasEventWeapon{playa} = true;

		PauseAC(playerid);

		format(sgstr, sizeof(sgstr),"Admin %s te deu uma arma para evento: %s(Id:%i) Munições: %i", NameEx(playerid), wname, wid, ammo);
		SendClientMessage(playa, COLOR_LIGHTGREEN,  sgstr);
		format(sgstr, sizeof(sgstr),"[Admin] %s deu a %s uma arma para evento: %s(Id:%i) Munições: %i", NameEx(playerid), NameEx(playa), wname, wid, ammo);
		AdminBroadcast(sgstr, 1);
		format(sgstr, sizeof(sgstr), "Give weapon %s, ammo=%i, reason=Event", wname, ammo);
		AdminLog(playerid, SQLID[playa], GetName(playa), sgstr);

		format(sgstr, sizeof(sgstr), "[%s] %s (%i) has been given %s with %i ammo. [EVENT]", GetServerTimeString(), NameEx(playa), playa, weaponstring[wid], ammo);
		AddToLog("cheat", sgstr);
	}
	else if(strcmp("fac", reason, true) == 0)
	{
		GivePlayerWeaponEx(playa, wid, ammo, 3, -1, 1, SQLID[playerid]);

		format(sgstr, sizeof(sgstr),"Admin %s refundou sua arma da facção: %s(Id:%i) Munições: %i", NameEx(playerid), wname, wid, ammo);
		SendClientMessage(playa, COLOR_LIGHTGREEN,  sgstr);
		format(sgstr, sizeof(sgstr),"[Admin] %s refundou %s uma arma de facção: %s(Id:%i) Munições: %i", NameEx(playerid), NameEx(playa), wname, wid, ammo);
		AdminBroadcast(sgstr, 1);
		format(sgstr, sizeof(sgstr), "Give weapon %s, ammo=%i, reason=Faction Wep", wname, ammo);
		AdminLog(playerid, SQLID[playa], GetName(playa), sgstr);
	}
	else SysMsg(playerid,"Use: /dararma [ID ou nome do jogador] [arma id/parte do nome] [evento/refundo/fac]");
	return true;
}
CMD:guninfo(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid, "Use: /guninfo [playerID ou name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

	mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM weapons WHERE WeaponPossession = 1 AND OwnerSQLID = %i AND Deleted = 0", SQLID[playa]);
	mysql_pquery(conn, mquery, "ShowWeaponInfo", "i", playerid);
	return true;
}
RCRP::ShowWeaponInfo(playerid)
{
	if(!cache_num_rows()) return SysMsg(playerid, "Este jogador está desarmado.");

	new creator[15], timestamp[15], origin[15], weaponid[15], ammo[15], id[15], count;
	for(new i = 0, x = cache_num_rows(); i < x; i++)
	{
		id[i] = cache_get_field_content_int(i, "id");
		creator[i] = cache_get_field_content_int(i, "CreatorSQLID");
		timestamp[i] = cache_get_field_content_int(i, "Timestamp");
		origin[i] = cache_get_field_content_int(i, "WeaponOrigin");
		weaponid[i] = cache_get_field_content_int(i, "WeaponID");
		ammo[i] = cache_get_field_content_int(i, "WeaponAmmo");

		count ++;
	}
	for(new i = 0; i < count; i++)
	{
		SendSplitMessageF(playerid, COLOR_BLUE, "([Arma ID %i (%s, %i munições)] Nome do criador: %s, Origem: %s, Timestamp %s)", id[i], GetWeaponNameFromID(weaponid[i]), ammo[i], GetSQLName(creator[i]), GetWeaponOrigin(origin[i]), UnixDate(timestamp[i], 0, 0));
	}
	return true;
}
stock GetWeaponOrigin(origin)
{
	new worigin[32];
	switch(origin)
	{
		case 1: worigin = "Refundo Admin";
		case 2: worigin = "Arma ilegal";
		case 3: worigin = "Arma de facção";
		case 4: worigin = "Arma legal";
		case 7: worigin = "Loja Item Comprado";
	}
	return worigin;
}
CMD:cg(playerid, params[]) return cmd_checkguns(playerid, params);
CMD:checkguns(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /checkguns [playerid/name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");

	new clientID, clientAmmo, wCount = 0;

	for(new w = 0; w < MAX_TOTAL_WEAPONS; w++)
	{
		GetPlayerWeaponData(playa, w, clientID, clientAmmo);

		if(clientID == WEAPON_SILENCED && HasTaser{playa}) continue;

		if(clientID > 0 || WeaponData[playa][w][Weapon] > 0)
		{
			if(clientID == WeaponData[playa][w][Weapon] && WeaponData[playa][w][WeaponID] != 0)
			{
				SendClientMessageF(playerid, 0x63FF2DFF, "[SERVER & CLIENTE] %s(ID %i) Slot %i | %s(ID %i - %i C.Mun - %i S.Mun)", NameEx(playa), playa, w, GetWeaponNameFromID(clientID), clientID, clientAmmo, WeaponData[playa][w][WeaponAmmo]);
				wCount ++;
			}
			else if(clientID != WeaponData[playa][w][Weapon] && WeaponData[playa][w][Weapon] == 0 && clientAmmo > 0 && WeaponData[playa][w][WeaponID] == 0)
			{
				SendClientMessageF(playerid, 0xF2CD3BFF, "[SOMENTE CLIENTE] %s(ID %i) Slot %i | %s(ID %i - %i C.Mun - %i S.Mun)", NameEx(playa), playa, w, GetWeaponNameFromID(clientID), clientID, clientAmmo, WeaponData[playa][w][WeaponAmmo]);
				wCount ++;
			}
			else if(clientID != WeaponData[playa][w][Weapon] && clientID == 0)
			{
				SendClientMessageF(playerid, 0xF2CD3BFF, "[SOMENTE SERVIDOR] %s(ID %i) Slot %i | %s(ID %i - %i C.Mun - %i S.Mun)", NameEx(playa), playa, w, GetWeaponNameFromID(WeaponData[playa][w][Weapon]), WeaponData[playa][w][Weapon], clientAmmo, WeaponData[playa][w][WeaponAmmo]);
				wCount ++;
			}
		}
	}

	if(wCount == 0) SendClientMessage(playerid, COLOR_LIGHTBLUE, "Este jogador não tem arma para mostrar.");

	return true;
}
CMD:checkallguns(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new w, clientID, clientAmmo;

	foreach(new i: Player)
	{
		if(IsPlayerNPC(i) || !Logged{i}) continue;

		for(w = 0; w < MAX_TOTAL_WEAPONS; w++)
		{
			GetPlayerWeaponData(i, w, clientID, clientAmmo);

			if(clientID == WEAPON_SILENCED && HasTaser{i}) continue;
			if(clientID > 0 && clientAmmo > 0)
			{
				if(WeaponData[i][w][Weapon] != clientID)
				{
					format(gstr, sizeof(gstr),"%s (ID %i) Possivel Hack - Slot %i, Arma %s(ID %i), %i Munições", NameEx(i), i, w, GetWeaponNameFromID(clientID), clientID, clientAmmo);
					SendClientMessage(playerid, COLOR_DARKBLUE, gstr);
				}
			}
		}
	}

	SendClientMessage(playerid, COLOR_DARKBLUE, "Verificou todos os jogadores por armas pirateadas.");
	return true;
}
CMD:refunddrogas(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new pname[MAX_PLAYER_NAME], playa = -1, drug[10], amount;
	if(sscanf(params, "s[24]s[10]i", pname, drug, amount)) return SysMsg(playerid,"Use: /refunddrogas [player id ou nome completo] [marijuana/cocaina/moonshine] [Quantidade]");
	new sqlid = -1;
	if(IsNumeric(pname))
	{
		if(!IsPlayerConnected(strval(pname)) || !Logged{strval(pname)}) return SysMsg(playerid, "O ID do jogador não foi conectado e conectado.");
		playa = strval(pname);
		sqlid = SQLID[playa];
	}
	else
	{
		sqlid = MySQLCheckAccount(pname, playerid);
		if(sqlid <= 0) return SysMsg(playerid, "O nome não foi encontrado. Por favor, inclua o primeiro nome, sobrenome e um título de destaque OU use o ID de identidade atual.");
	}
	if(sqlid == -1) return SysMsg(playerid, "O nome não foi encontrado. Por favor, inclua o primeiro nome, sobrenome e um título de destaque OU use o ID de identidade atual.");
	if(sqlid == SQLID[playerid] && !IsPlayerAdmin(playerid)) return SysMsg(playerid, "Não pode ser você mesmo.");

	if(playa >= 0)
	{
		if(strcmp("marijuana", drug, true) == 0)
		{
			if(amount < 1) return SysMsg(playerid,"Essa quantidade é inválida.");
			if(amount + Inventory[playa][Weed] > DRUG_MAX_WEED) return SysMsgF(playerid, "Quantidade Inválida, %s não seria capaz de carregar tanta marijuana. Você pode dar um máximo de %i gramas.", NameEx(playa), DRUG_MAX_WEED - Inventory[playa][Weed]);

			Inventory[playa][Weed] += amount;
			MySQLUpdateInt(SQLID[playa], "Weed", Inventory[playa][Weed], "players");

			format(gstr, sizeof(gstr),"Admin %s refundou a você %i gramas de marijuana.", NameEx(playerid), amount);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"[Admin] %s refundou a %s %i gramas de marijuana.", NameEx(playerid), NameEx(playa), amount);
			AdminBroadcast(gstr, 0);
			format(gstr, sizeof(gstr), "Refundo Drogas %i x %s", amount, drug);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(strcmp("cocaina", drug, true) == 0)
		{
			if(amount < 1) return SysMsg(playerid,"Essa quantidade é inválida.");
			if(amount + Inventory[playa][Cocaine] > DRUG_MAX_COCAINE) return SysMsgF(playerid, "Quantidade Inválida, %s não poderia levar tanto cocaína. Você pode dar um máximo de %i gramas.", NameEx(playa), DRUG_MAX_COCAINE - Inventory[playa][Cocaine]);

			Inventory[playa][Cocaine] += amount;
			MySQLUpdateInt(SQLID[playa], "Cocaine", Inventory[playa][Cocaine], "players");

			format(gstr, sizeof(gstr),"Admin %s refundou a você %i gramas de Cocaina.", NameEx(playerid), amount);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"[Admin] %s refundou a %s %i gramas de Cocaina.", NameEx(playerid), NameEx(playa), amount);
			AdminBroadcast(gstr, 0);
			format(gstr, sizeof(gstr), "Refundo Drogas %i x %s", amount, drug);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(strcmp("moonshine", drug, true) == 0)
		{
			if(amount < 1) return SysMsg(playerid,"Essa quantidade é inválida.");
			if(amount + Inventory[playa][MoonShine] > DRUG_MAX_MOONSHINE) return SysMsgF(playerid, "Quantidade Inválida, %s não seria capaz de carregar essa quantidad de MoonShine. Você pode dar um máximo de %i litro(s).", NameEx(playa), DRUG_MAX_MOONSHINE - Inventory[playa][MoonShine]);

			Inventory[playa][MoonShine] += amount;
			MySQLUpdateInt(SQLID[playa], "MoonShine", Inventory[playa][MoonShine], "players");

			format(gstr, sizeof(gstr),"Admin %s refundou a você %i litro(s) de MoonShine.", NameEx(playerid), amount);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"[Admin] %s refundou a %s %i litro(s) de MoonShine.", NameEx(playerid), NameEx(playa), amount);
			AdminBroadcast(gstr, 0);
			format(gstr, sizeof(gstr), "Refundo Drogas %i x %s", amount, drug);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
	}
	else
	{
		foreach(new i: Player) if(sqlid == SQLID[i]) return SysMsg(playerid, "O nome completo do jogador não foi encontrado, tente usar o ID.");

		if(strcmp("marijuana", drug, true) == 0)
		{
			if(amount < 1) return SysMsg(playerid,"Essa quantidade é inválida.");

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE players SET Weed = Weed + %i WHERE id = %i", amount, sqlid);
			mysql_pquery(conn, mquery);
			format(gstr, sizeof(gstr),"[Admin] %s refundou a %s %i gramas de marijuana.", NameEx(playerid), GetSQLName(sqlid), amount);
			AdminBroadcast(gstr, 0);
			format(gstr, sizeof(gstr), "Refundo Drogas %i x %s", amount, drug);
			AdminLog(playerid, sqlid, GetSQLName(sqlid), gstr);
			return true;
		}
		if(strcmp("cocaina", drug, true) == 0)
		{
			if(amount < 1) return SysMsg(playerid,"Essa quantidade é inválida.");

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE players SET Cocaine = Cocaine + %i WHERE id = %i", amount, sqlid);
			mysql_pquery(conn, mquery);
			format(gstr, sizeof(gstr),"[Admin] %s refundou a %s %i gramas de Cocaina.", NameEx(playerid), GetSQLName(sqlid), amount);
			AdminBroadcast(gstr, 0);
			format(gstr, sizeof(gstr), "Refundo Drogas %i x %s", amount, drug);
			AdminLog(playerid, sqlid, GetSQLName(sqlid), gstr);
			return true;

		}
		if(strcmp("moonshine", drug, true) == 0)
		{
			if(amount < 1) return SysMsg(playerid,"Essa quantidade é inválida.");

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE players SET MoonShine = MonnShine + %i WHERE id = %i", amount, sqlid);
			mysql_pquery(conn, mquery);
			format(gstr, sizeof(gstr),"[Admin] %s refundou a %s %i listro de MoonShine.", NameEx(playerid), GetSQLName(sqlid), amount);
			AdminBroadcast(gstr, 0);
			format(gstr, sizeof(gstr), "Refundo Drogas %i x %s", amount, drug);
			AdminLog(playerid, sqlid, GetSQLName(sqlid), gstr);
			return true;
		}
	}

	return true;
}
CMD:checkplayer(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /checkplayer [playerid/name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	new id = playa;

	new Float:Health, Float:Armour, Float:X, Float:Y, Float:Z, Float:Ang, Interior, World, GPM = GetPlayerMoney(id), armedWeapon = GetPlayerWeapon(id), zone[MAX_ZONE_NAME], tutstatus[12];
	GetPlayerHealth(id, Health);
	GetPlayerArmour(id, Armour);
	GetPlayerPos(id, X, Y, Z);
	GetPlayerFacingAngle(id, Ang);
	Interior = GetPlayerInterior(id);
	World = GetPlayerVirtualWorld(id);
	GetPlayer3DZone(id, zone, MAX_ZONE_NAME);
	if(CompletedTutorial{id}) format(tutstatus, sizeof(tutstatus), "Yes");
	else format(tutstatus, sizeof(tutstatus), "No");

	SendClientMessageF(playerid, COLOR_LIGHTBLUE, "Player Data - %s ID:%i - Stats: %s - Tutorial completado: %s",NameEx(id),id, GetPlayerStateEx(id), tutstatus);
	SendClientMessageF(playerid, COLOR_WHITE, "Health: %.0f(Server:%f) - Colete: %.0f(Server:%f) - Armado: %s(%i)",Health,HealthVar[id],Armour,ArmourVar[id],GetWeaponNameFromID(armedWeapon),armedWeapon);
	SendClientMessageF(playerid, COLOR_WHITE, "Dinheiro Server: %i - Dinheiro Client: %i",Cash[id],GPM);
	SendClientMessageF(playerid,COLOR_WHITE, "Localização: %s (%f[X], %f[Y], %f[Z], %f[RA]) - Interior ID: %i - VW: %i", zone, X, Y, Z, Ang, Interior, World);
	if(IsPlayerInAnyVehicle(id)) SendClientMessageF(playerid, COLOR_WHITE, "Veiculo INFO: %s - %i", GetVehicleName(GetPlayerVehicleID(id)), GetPlayerVehicleID(id));
	return true;
}
CMD:cp(playerid, params[]) return cmd_checkplayer(playerid, params);
CMD:darlicenca(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, licensename[6];
	if(sscanf(params, "us[6]", playa, licensename)) return SysMsg(playerid,"Use: /darlicenca [ID ou nome do jogador] [car/bike/boat/plane/heli/large]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");

	new lic = -1, sqlname[24];
	if(strcmp("car", licensename, true) == 0) { lic = 0; sqlname = "LicenseCar"; }
	else if(strcmp("large", licensename, true) == 0) { lic = 1; sqlname = "LicenseLargeVehicle"; }
	else if(strcmp("bike", licensename, true) == 0) { lic = 2; sqlname = "LicenseBike"; }
	else if(strcmp("boat", licensename, true) == 0) { lic = 3; sqlname = "LicenseBoat"; }
	else if(strcmp("heli", licensename, true) == 0) { lic  = 4; sqlname = "LicenseHelicopter"; }
	else if(strcmp("plane", licensename, true) == 0) { lic = 5; sqlname = "LicensePlane"; }

	else return SysMsg(playerid,"Não há nenhuma licença desse tipo.");

	if(Licenses[playa][lic] == 1) return SysMsg(playerid,"Este jogador já tem essa carteira.");
	Licenses[playa][lic] = 1;
	MySQLUpdateInt(SQLID[playa], sqlname, Licenses[playa][lic], "players");

	for(new tu = 0; tu < sizeof(licensename); tu++) licensename[tu] = toupper(licensename[tu]);
	format(gstr, sizeof(gstr),"Admin %s te deu uma lincensa de %s.", NameEx(playerid), licensename);
	SendClientMessage(playa,COLOR_WHITE, gstr);
	format(gstr, sizeof(gstr),"Você deu a %s uma lincesa de %s.", NameEx(playa), licensename);
	SendClientMessage(playerid,COLOR_WHITE, gstr);

	format(gstr, sizeof(gstr), "Deu uma lincesa de %s", licensename);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	return true;
}
CMD:removelicence(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, licensename[6];
	if(sscanf(params, "us[6]", playa, licensename)) return SysMsg(playerid,"Use: /removelicenca [ID ou nome do jogador] [car/bike/boat/plane/heli/large]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");

	new lic = -1, sqlname[24];
	if(strcmp("car", licensename, true) == 0) { lic = 0; sqlname = "LicenseCar"; }
	else if(strcmp("large", licensename, true) == 0) { lic = 1; sqlname = "LicenseLargeVehicle"; }
	else if(strcmp("bike", licensename, true) == 0) { lic = 2; sqlname = "LicenseBike"; }
	else if(strcmp("boat", licensename, true) == 0) { lic = 3; sqlname = "LicenseBoat"; }
	else if(strcmp("heli", licensename, true) == 0) { lic  = 4; sqlname = "LicenseHelicopter"; }
	else if(strcmp("plane", licensename, true) == 0) { lic = 5; sqlname = "LicensePlane"; }
	else return SysMsg(playerid,"Nenhuma dessas licenças.");

	if(Licenses[playa][lic] == 0) return SysMsg(playerid,"They don't have this license.");
	Licenses[playa][lic] = 0;
	MySQLUpdateInt(SQLID[playa], sqlname, Licenses[playa][lic], "players");

	for(new tu = 0; tu < sizeof(licensename); tu++) licensename[tu] = toupper(licensename[tu]);
	SendClientMessageF(playa,COLOR_WHITE, "Admin %s removeu sua lincensa de %s.", NameEx(playerid), licensename);
	SendClientMessageF(playerid,COLOR_WHITE, "Você removeu a licensa do jogador %s a licensa de %s.", NameEx(playa), licensename);

	format(gstr, sizeof(gstr), "Remove %s license", licensename);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	return true;
}
CMD:checkconta(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /checkconta [Nome_Sobrenome]");

	new sqlid = -1, maid = -1;
	if(IsNumeric(params))
	{
		new pid = strval(params);
		if(pid < 0 || pid >= MAX_PLAYERS) return SysMsg(playerid,"ID inválido");
		if(!IsPlayerConnected(pid)) return SysMsg(playerid,"PlayerID desconectado.");
		if(!Logged{pid}) return SysMsg(playerid,"ID do jogador não está logado, o SQLID não pôde ser encontrado.");

		sqlid = SQLID[pid];
		maid = MasterAccount[pid];
	}
	else
	{
		sqlid = MySQLCheckAccount(params, playerid);
		maid = MySQLCheckMaster_AgainstSQLID(sqlid);
	}

	if(sqlid <= 0) return SysMsg(playerid, "O nome não foi encontrado. Inclua primeiro nome, sobrenome e um título de destaque ou apenas use a ID do jogo.");

	mysql_format(conn, mquery, sizeof(mquery), "SELECT RegisterDate, IP, RecentIP, RecentSerial, AccountDisabled, Online FROM players WHERE id = %i", sqlid);
	mysql_pquery(conn, mquery, "CheckAccountData", "iii", playerid, sqlid, maid);
	return true;
}
CMD:queme(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /queme [Nome_Sobrenome / MA Nome ou in-game id]");

	new sqlid = -1;

	if(IsNumeric(params))
	{
		new pid = strval(params);
		if(pid < 0 || pid >= MAX_PLAYERS) return SysMsg(playerid,"ID inválido");
		if(!IsPlayerConnected(pid)) return SysMsg(playerid,"PlayerID desconectado.");
		if(!Logged{pid}) return SysMsg(playerid,"ID do jogador não está logado, esta ID SQL não pôde ser encontrada.");

		sqlid = SQLID[pid];
	}
	else sqlid = MySQLCheckAccount(params, playerid);

	new masterID;
	if(sqlid <= 0) masterID = MySQLCheckMaster_AgainstName(params);
	else masterID = MySQLCheckMaster_AgainstSQLID(sqlid);

	if(masterID <= 0) return SysMsg(playerid, "O nome não foi encontrado. Inclua primeiro nome, sobrenome e um título de destaque ou apenas use a ID do jogo.");

	mysql_format(conn, mquery, sizeof(mquery), "SELECT Username,EMail,GeoDetails,RegTimeStamp FROM masters WHERE id=%i LIMIT 1", masterID);
	mysql_pquery(conn, mquery, "WhoIsPrime", "ddd", playerid, sqlid, masterID);
	return true;
}
CMD:aduty(playerid, params[])
{
	if(!Logged{playerid}) return SysMsg(playerid,"Faça o login primeiro.");
	if(!IsPlayerAdminLevelOK(playerid, 1)) return true;

	if(isnull(params)) return SysMsg(playerid,"Use: /aduty ['on' / 'off' / 'dnd']");

	if(strcmp("on",params,true) == 0)
	{
		if(ADuty[playerid] == 1) return SysMsg(playerid, "Você já está Aduty ON.");
		if(IsAFK{playerid}) return SysMsg(playerid, "Você esta AFK.");
		if(AdminHidden[playerid]) return SysMsg(playerid, "Você esta incógnito.");

		if(!LocalOOCEnabled{playerid}) cmd_togb(playerid);
		ADuty[playerid] = 1;
		foreach(new i: Player)
		{
			if(IsPlayerMasked{i})
			{
				ShowPlayerNameTagForPlayer(playerid, i, 1);
				FormatHealthLabelText(i, HealthVar[i], ArmourVar[i], 2);
			}
		}
		AdminMsgToggle{playerid} = true;
		SetPlayerColor(playerid, 0x00A6FF00);
		SysMsg(playerid,"Admin Duty on.");
		AdminLog(playerid, 0, "", "Admin duty on");
		return true;
	}
	else if(strcmp("off",params,true) == 0)
	{
		if(ADuty[playerid] == 0) return SysMsg(playerid, "Você já está Aduty OFF.");

		ADuty[playerid] = 0;
		foreach(new i: Player)
		{
			if(IsPlayerMasked{i})
			{
				ShowPlayerNameTagForPlayer(playerid, i, 0);
				FormatHealthLabelText(i, HealthVar[i], ArmourVar[i], 2);
			}
		}
		if(UsingPaint{playerid}) cmd_paint(playerid);
		SetPlayerColor(playerid, 0xFFFFFF00);
		SysMsg(playerid,"Admin Duty off, divirta-se.");
		AdminLog(playerid, 0, "", "Admin duty off");
		return true;
	}
	else if(strcmp("dnd",params,true) == 0)
	{
		if(ADuty[playerid] == 1) cmd_aduty(playerid, "off");
		if(ADuty[playerid] == 2) return SysMsg(playerid, "Admin Duty já esta DND.");

		ADuty[playerid] = 2;
		SetPlayerColor(playerid, 0xFFFFFF00);
		SysMsg(playerid,"Definir para não incomodar.");
		AdminLog(playerid, 0, "", "Admin duty DND");
		return true;
	}

	SysMsg(playerid,"Use: /aduty ['on' / 'off' / 'dnd']");
	return true;
}
CMD:adminrecord(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /adminrecord [Nome_Sobrenome Ou PlayerID]");
	new sqlid = -1;
	if(IsNumeric(params))
	{
		if(!IsPlayerConnected(strval(params)) || !Logged{strval(params)}) return SysMsg(playerid, "O ID do jogador não foi conectado e conectado.");
		sqlid = SQLID[strval(params)];
	}
	else
	{
		sqlid = MySQLCheckAccount(params, playerid);
	}

	if(sqlid <= 0) return SysMsg(playerid, "O nome não foi encontrado. Por favor, inclua o primeiro nome, sobrenome e um título de destaque OU use o ID de identidade atual.");

	ViewAdminRecord[playerid] = sqlid;
	Dialog_Show(playerid, AdminRecordMenu, DIALOG_STYLE_LIST, "Admin Record", "{FFFFFF}{FFCE2E}VER RECORDE GERAL{FFFFFF}\n{FFFFFF}Logs de {FFCE2E}Kick{FFFFFF}\n{FFFFFF}Logs de {FFCE2E}Ban perm{FFFFFF}\n{FFFFFF}Logs de {FFCE2E}Ban temporário{FFFFFF}\n{FFFFFF}Logs de {FFCE2E}Ban por Data{FFFFFF}\n{FFFFFF}Logs de {FFCE2E}Admin Jail{FFFFFF}\n{FFFFFF}Logs de {FFCE2E}Mute{FFFFFF}", "Selecionar", "Cancelar");
	return true;
}
CMD:meuadminrecord(playerid, params[])
{
	if(!Logged{playerid}) return true;

	mysql_format(conn, mquery, sizeof(mquery), "SELECT COUNT(*) AS punishments, RecordType FROM adminrecord WHERE PlayerSQLID = %i GROUP BY RecordType", SQLID[playerid]);
	mysql_pquery(conn, mquery, "LoadMyAdminRecord", "i", playerid);
	return true;
}
RCRP::LoadMyAdminRecord(playerid)
{
	gstr[0] = EOS;

	new punishments[7];
	for(new i = 0, r = cache_num_rows(); i < r; i++)
	{
		punishments[cache_get_field_content_int(i, "RecordType")] = cache_get_field_content_int(i, "punishments");
	}

	strcat(gstr, "{B42E26}MEU ADMIN RECORD\n\n{FFFFFF}Abaixo, você pode encontrar uma versão básica do seu Registro de Administrador.\n");
	strcat(gstr, "Não inclui detalhes como motivos e datas, uma vez que se destina apenas a ser uma visão geral rápida para participar de facções, etc..\n\n\n");

	format(sgstr, sizeof(sgstr), "{FFFFFF}Total de vezes kickado: {249CFF}%i\n", punishments[ADMIN_RECORD_TYPE_KICK]);
	strcat(gstr, sgstr);

	format(sgstr, sizeof(sgstr), "{FFFFFF}Total de banimentos permanentes: {249CFF}%i\n", punishments[ADMIN_RECORD_TYPE_PERMBAN]);
	strcat(gstr, sgstr);

	format(sgstr, sizeof(sgstr), "{FFFFFF}Total de banimentos temporários: {249CFF}%i\n", punishments[ADMIN_RECORD_TYPE_TEMPBAN]);
	strcat(gstr, sgstr);

	format(sgstr, sizeof(sgstr), "{FFFFFF}Total  de banimentos por dia: {249CFF}%i\n", punishments[ADMIN_RECORD_TYPE_DATEBAN]);
	strcat(gstr, sgstr);

	format(sgstr, sizeof(sgstr), "{FFFFFF}Total de Admin Jailed: {249CFF}%i\n", punishments[ADMIN_RECORD_TYPE_AJAIL]);
	strcat(gstr, sgstr);

	format(sgstr, sizeof(sgstr), "{FFFFFF}Total punições por mute: {249CFF}%i\n", punishments[ADMIN_RECORD_TYPE_MUTE]);
	strcat(gstr, sgstr);

	ShowMessage(playerid, "Admin Record", gstr, "OK");
	return true;
}
CMD:avisar(playerid, params[])//avisar
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, reason[100];
	if(sscanf(params, "us[100]", playa, reason)) return SysMsg(playerid,"Use: /avisar [ID ou nome do jogador] [razão]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(IsPlayerAdminLevelOK(playa, 1)) return SysMsg(playerid,"Não é possível avisar um Admin.");

	if(SQLID[playa] > 0)
	{
		new datestring[12], y, m, d;
		getdate(y, m, d);
		format(datestring, sizeof(datestring), "%i/%i/%i", d, m, y);
		mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO warnings (PlayerSQLID,AdminName,Reason,Datestamp) VALUES (%i,'%e','%e','%e')", SQLID[playa], NameEx(playerid), reason, datestring);
		mysql_pquery(conn, mquery, "");
	}

	format(gstr, sizeof(gstr),"* AVISO ADMIN de %s: %s", NameEx(playerid), reason);
	SendClientMessage(playa, COLOR_RED, gstr);
	SendClientMessage(playa, COLOR_WHITE, "* Mais uma violação das regras do servidor vai forçar a equipe admin para tomar medidas.");
	format(gstr, sizeof(gstr),"[Admin] %s avisa %s (%s)", NameEx(playerid), NameEx(playa), reason);
	AdminBroadcast(gstr, 1);
	format(gstr, sizeof(gstr), "Aviso por '%s'", reason);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	return true;
}
CMD:avisarings(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /avisarings [Nome_Sobrenome Ou PlayerID]");
	new sqlid = -1;
	if(IsNumeric(params))
	{
		if(!IsPlayerConnected(strval(params)) || !Logged{strval(params)}) return SysMsg(playerid, "PlayerID desconectado e conectado.");
		sqlid = SQLID[strval(params)];
	}
	else
	{
		sqlid = MySQLCheckAccount(params, playerid);
	}

	if(sqlid <= 0) return SysMsg(playerid, "O nome não foi encontrado. Por favor, inclua o primeiro nome, sobrenome e um título de destaque OU use o ID de identidade atual.");

	mysql_format(conn, mquery, sizeof(mquery), "SELECT AdminName,Datestamp,Reason FROM warnings WHERE PlayerSQLID = %i ORDER BY id DESC LIMIT 15", sqlid);
	mysql_pquery(conn, mquery, "AdminWarnings", "dd", playerid, sqlid);
	return true;
}
CMD:sqlid(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /sqlid [Nome_Sobrenome Ou PlayerID]");
	new sqlid = -1, playa;
	if(IsNumeric(params))
	{
		playa = strval(params);
		if(!IsPlayerConnected(playa) || !Logged{playa}) return SysMsg(playerid, "O ID do jogador não foi conectado e conectado.");
		sqlid = SQLID[playa];

		format(gstr, sizeof(gstr), "%s(ID %i) SQLID %i", GetName(playa), playa, sqlid);
		SendClientMessage(playerid, COLOR_WHITE, gstr);
	}
	else
	{
		sqlid = MySQLCheckAccount(params, playerid);
		if(sqlid <= 0) return SysMsg(playerid, "O nome não foi encontrado. Por favor, inclua o primeiro nome, sobrenome e um título de destaque OU use o ID de identidade atual.");

		format(gstr, sizeof(gstr), "%s SQLID %i", params, sqlid);
		SendClientMessage(playerid, COLOR_WHITE, gstr);
	}

	return true;
}
CMD:reefer(playerid, params[])
{
	new option[12];
	if(sscanf(params, "s[12]", option))
	{
		SysMsg(playerid, "Use: /reefer [opção] | Opções disponíveis: Respawn, Spec");
		SendClientMessageF(playerid, COLOR_WHITE, "Identificação do Reefer {00CDC6}%i", ReeferID());
		return true;
	}
	if(strmatch("respawn", option))
	{
		new Float:vP[3], vR = 0;
		GetVehiclePos(ReeferID(), vP[0], vP[1], vP[2]);
		foreach(new p: Player)
		{
			if(IsPlayerInRangeOfPoint(p, 3.0, vP[0], vP[1], vP[2]))
			{
			if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);
			if(IsHelper{playerid} && IsAssisting[playerid] == -1) return SysMsg(playerid, "Você só pode usar esse comando enquanto estiver ajudando alguém.");

			vR = 1;
			}
		}
		if(vR == 0)
		{
			SetVehicleToRespawnEx(ReeferID());
			format(gstr, sizeof(gstr), "Você respawno o barco de pesca (ID:%i)", ReeferID());
			SendClientMessage(playerid, COLOR_LIGHTGREEN, gstr);
		}
		else
		{
			format(gstr, sizeof(gstr), "Você não pode respawn o barco de pesca (ID:%i) enquanto as pessoas estão usando.", ReeferID());
			SendClientMessage(playerid, COLOR_RED, gstr);
		}
	}
	else if(strmatch("spec", option))
	{
		if(IsSpectating[playerid] == -1)
		{
			new Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid, X, Y, Z);
			TempInfo[playerid][tmX] = X;
			TempInfo[playerid][tmY] = Y;
			TempInfo[playerid][tmZ] = Z;
			TempInfo[playerid][tSkin] = GetPlayerSkin(playerid);
			TempInfo[playerid][tInt] = GetPlayerInterior(playerid);
			TempInfo[playerid][tVW] = GetPlayerVirtualWorld(playerid);
		}

		TogglePlayerSpectating(playerid, 1);
		SetPlayerVirtualWorldEx(playerid, GetVehicleVirtualWorld(ReeferID()));

		PlayerSpectateVehicle(playerid, ReeferID(), SPECTATE_MODE_NORMAL);
		SysMsgF(playerid, "Agora você está spectando o barco %i (%s). Use /specoff para retornar ao normal.", ReeferID(), GetVehicleName(ReeferID()));
		IsSpectating[playerid] = 1000;
	}
	return true;
}
CMD:contagemr(playerid, params[])//contagemr
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);
	if(IsCounting > 0) return true;

	CountdownTimer = SetTimer("Countdown",1000,1);
	IsCounting = 6;

	format(gstr, sizeof(gstr),"%s Has Started A Countdown.",NameEx(playerid));
	SendClientMessageToAllLogged(COLOR_WHITE, gstr);
	AdminLog(playerid, 0, "", "Inicia uma contagem regressiva");
	return true;
}
CMD:fazerhelper(playerid, params[])
{
	if(IsPlayerAdminLevelOK(playerid, 2))
	{
		new playa[32], level;
		if(sscanf(params, "s[32]", playa)) return SysMsg(playerid,"Use: /fazerhelper [Nome_Sobrenome / ID]");

		new player = GetPlayerIDs(playa);
		if(player != INVALID_PLAYER_ID)
		{
			if(IsPlayerNPC(player)) return SysMsg(playerid,"Esse jogador é um NPC.");
			if(!Logged{player}) return SysMsg(playerid,"Esse jogador ainda não esta logado.");

			switch(IsHelper{player})
			{
				case 1:
				{
					format(gstr, sizeof(gstr),"Admin %s removeu você para Helper team.",NameEx(playerid));
					SendClientMessage(player,COLOR_LIGHTBLUE,gstr);
					format(gstr, sizeof(gstr),"Você removeu com sucesso %s da Helper team.",NameEx(player));
					AdminLog(playerid, SQLID[player], GetName(player), "removido da Helper team");
					IsHelper{player} = false;
					SendClientMessage(playerid,COLOR_RED,gstr);
					MySQLUpdateInt(MasterAccount[player], "Helper", IsHelper{player}, "masters");
				}
				default:
				{
					format(gstr, sizeof(gstr),"Admin %s colocou você na Helper team.",NameEx(playerid));
					SendClientMessage(player,COLOR_LIGHTBLUE,gstr);
					format(gstr, sizeof(gstr),"Você colocou %s na Helper team.",NameEx(player));
					AdminLog(playerid, SQLID[player], GetName(player), "Adicionado na Help Team");
					IsHelper{player} = true;
					SendClientMessage(playerid,COLOR_RED,gstr);
					MySQLUpdateInt(MasterAccount[player], "Helper", IsHelper{player}, "masters");
				}
			}
		}
		else if(strfind(playa, "_", true) != -1)
		{
			new sid = MySQLCheckMaster_AgainstName(playa);
			MySQLFetchInt(sid, "Helper", level, "masters");

			switch(level)
			{
				case 0:
				{
					format(gstr, sizeof(gstr),"Removeu %s da Helper team.", playa);
					AdminLog(playerid, sid, playa, "removido da helper team.");
					MySQLUpdateInt(sid, "Helper", 1, "masters");
					SendClientMessage(playerid,COLOR_RED,gstr);
				}
				default:
				{
					format(gstr, sizeof(gstr),"Você adicionou %s na Helper team.", playa);
					AdminLog(playerid, sid, playa, "adicionado a helper team.");
					MySQLUpdateInt(sid, "Helper", 0, "masters");
					SendClientMessage(playerid,COLOR_RED,gstr);
				}
			}
		}
		else return SysMsg(playerid, "Para usar offline, certifique-se de inserir seus Nome_Sobrenome.");
	}
	else return SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:setadmin(playerid, params[])//setadmin
{
	#if DB_SERVER != DB_SERVER_MAIN

		AdminLevel[playerid] = 4;
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET AdminLevel = %i, Helper = 0, HasRCON = 1 WHERE id = %i", AdminLevel[playerid], MasterAccount[playerid]);
		mysql_pquery(conn, mquery);
		SendClientMessage(playerid, -1, "Grats seu nível admin 4.");
		return true;

	#else

		SendClientMessage(playerid, -1, "Este não é o servidor dev você pequena merda.");
		return true;

	#endif
}

CMD:admucp(playerid, params[])//setadmin
{
	#if DB_SERVER != DB_SERVER_MAIN

		AdminLevel[playerid] = 4;
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE players SET Admin = %i, Helper = 0, HasRCON = 1 WHERE id = %i", AdminLevel[playerid], MasterAccount[playerid]);
		mysql_pquery(conn, mquery);
		SendClientMessage(playerid, -1, "Grats seu nível admin 4.");
		return true;

	#else

		SendClientMessage(playerid, -1, "Este não é o servidor dev você pequena merda.");
		return true;

	#endif
}
CMD:addjornal(playerid, params[])//setadmin
{
	#if DB_SERVER != DB_SERVER_MAIN

		AdminLevel[playerid] = 1;
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET uJorn = %i, Helper = 0, HasRCON = 1 WHERE id = %i", AdminLevel[playerid], MasterAccount[playerid]);
		mysql_pquery(conn, mquery);
		SendClientMessage(playerid, -1, "Grats seu nível admin 4.");
		return true;

	#else

		SendClientMessage(playerid, -1, "Este não é o servidor dev você pequena merda.");
		return true;

	#endif
}

CMD:setdonate(playerid, params[])
{
	if(IsPlayerAdmin(playerid))
	{
		new playa = -1, level;
		if(sscanf(params, "ui", playa, level)) return SysMsg(playerid,"Use: /setdonate [ID ou nome do jogador] [0 - 4]");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
		if(!Logged{playa}) return SysMsg(playerid,"Esse jogador ainda não esta logado.");

		if(level < 0 || level > 4) return SysMsg(playerid,"Level must be 0 - 4.");
		if(IsDonator[playa] == level) return SysMsg(playerid,"Essa pessoa já possui esse tipo de Donate.");

		IsDonator[playa] = level;
		MySQLUpdateInt(SQLID[playa], "IsDonator", IsDonator[playa], "players");

		if(IsDonator[playa] > 0)
		{
			format(gstr, sizeof(gstr),"Parabéns para %s. Agora ele é Donator level %i.",NameEx(playa),IsDonator[playa]);
			SendClientMessageToAllLogged(COLOR_DONATE, gstr);
			UnlockAchievement(playa, 31);
		}
		else
		{
			SendClientMessageF(playa, COLOR_LIGHTBLUE, "Admin %s removeu seu Donator rank.", NameEx(playerid));
			SendClientMessageF(playerid, COLOR_RED, "Você removeu o Donate de %s.", NameEx(playa));
		}

		format(gstr, sizeof(gstr), "Definiu o level de donate para %i", level);
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);

		if(IsDonator[playa] < 1)
		{
			mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM `ignore` WHERE PlayerSQLID=%i", SQLID[playerid]);
			mysql_pquery(conn, mquery, "");
		}
	}
	else return SysMsg(playerid, AUTHMSG);

	return true;
}
CMD:dlevelup(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, level[10];
	if(sscanf(params, "us[10]", playa, level)) return SysMsg(playerid,"Use: /dlevelup [ID ou nome do jogador] [arma/level]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(!Logged{playa}) return SysMsg(playerid,"Esse jogador ainda não esta logado.");

	if(strcmp("weapon", level, true) == 0)
	{
		if(WeaponSkillLevel[playa] == 10) return SysMsg(playerid,"Há habilidade é estourado.");

		WeaponSkillLevel[playa] ++;
		MySQLUpdateInt(SQLID[playerid], "WeaponSkill", WeaponSkillLevel[playerid], "players");

		SendClientMessageF(playa, COLOR_LIGHTBLUE, "Admin %s aumentou sua habilidade arma por 1.", NameEx(playerid));
		SendClientMessageF(playerid, COLOR_RED, "Você adicionou 1 habilidade arma para %s.", NameEx(playa));
		format(gstr, sizeof(gstr), "Deu um nível de habilidade doador arma livre, agora é %i", WeaponSkillLevel[playa]);
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		return true;
	}
	if(strcmp("level", level, true) == 0)
	{
		PlayerLevel[playa] ++;
		MySQLUpdateInt(SQLID[playa], "PlayerLevel", PlayerLevel[playa], "players");

		SendClientMessageF(playa, COLOR_LIGHTBLUE, "Admin %s aumentou o seu nível de 1.", NameEx(playerid));
		SendClientMessageF(playerid, COLOR_RED, "Você adicionou 1 nível para %s.", NameEx(playa));
		format(gstr, sizeof(gstr), "Deixou um nível de jogador donador gratuito, agora é %i", PlayerLevel[playa]);
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		return true;
	}
	SysMsg(playerid,"Invalid option");
	return true;
}
CMD:puniroff(playerid, params[])//punir off
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new sqlid = -1, reason[128], punishment[6], playername[MAX_PLAYER_NAME], time = -1, adminLvl;
	if(sscanf(params, "s[24]s[6]is[128]", playername, punishment, time, reason)) return SysMsg(playerid,"Use: /puniroff [Nome_Sobrenome] [ajail/ban/tban/dban] [time | use 0 for 'ban' option | ajail = minutes | tban = hours | dban = days] [razão]");

	sqlid = MySQLCheckAccount(playername, playerid);
	if(sqlid <= 0) return SysMsg(playerid,"O nome da conta não foi encontrado.");

	foreach(new i: Player) if(SQLID[i] == sqlid) return SysMsg(playerid,"Esse jogador está online, use os comandos de administração regulares.");

	MySQLFetchInt(sqlid, "AdminLevel", adminLvl, "masters");
	if(adminLvl > 0 && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"Você não pode punir um administrador.");

	if(strcmp("ajail", punishment, true) == 0)
	{
		if(time == -1) return SysMsg(playerid,"Use: /puniroff [Nome] [ajail] [tempo em minutos] [razão]");
		if(time < 10 || time > 90) return SysMsg(playerid,"O tempo deve ser entre 10 e 90 minutos.");

		new currentTime = 0;
		MySQLFetchInt(sqlid, "AdminJailTime", currentTime, "players");
		currentTime += time;
		if(currentTime > 200) return SysMsg(playerid,"Esta conta já tem um tempo de prisão de administração longo, você pode não adicionar mais.");

		MySQLUpdateInt(sqlid, "AdminJailTime", currentTime, "players");
		AddToAdminRecord(sqlid, SQLID[playerid], ADMIN_RECORD_TYPE_AJAIL, time, reason);

		if(currentTime > time) format(gstr, sizeof(gstr), "[Admin] %s adicionou a %i minutos de Admin Jail time para a conta %s [Razão: %s]", NameEx(playerid), time, playername, reason);
		else format(gstr, sizeof(gstr), "[Admin] %s colocou %s na prisão administrativa por %i minutos [Razão: %s]", NameEx(playerid), playername, time, reason);

		AdminBroadcast(gstr, 0);

		format(gstr, sizeof(gstr), "[/puniroff] Admin jailed por %i min '%s'", time, reason);
		AdminLog(playerid, sqlid, playername, gstr);
		return true;
	}

	if(strcmp("ban", punishment, true) == 0)
	{
		new pIP[18];
		MySQLFetchString(sqlid, "RecentIP", pIP, "players");

		if(MySQLCheckIPBanned(pIP) == 1) return SysMsg(playerid,"Este IP já está banido.");
		if(MySQLCheckAccountBanned(sqlid) == 1) return SysMsg(playerid,"Essa conta já está banida.");

		new datestring[50];
		format(datestring, sizeof(datestring), "%s %s", GetDateString(), GetTimeStringAndSec());

		mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO bans (PSQLID, BannedIP, PlayerName, BanDate, BannedBy, Reason, MasterAccount) VALUES (%i, '%e', '%e', '%e', '%e', '%e', %i)", sqlid, pIP, GetSQLName(sqlid), datestring, MasterAccountName[playerid], reason, MySQLCheckMaster_AgainstSQLID(sqlid));
		mysql_pquery(conn, mquery, "");

		AddToAdminRecord(sqlid, SQLID[playerid], ADMIN_RECORD_TYPE_PERMBAN, -1, reason);

		format(gstr, sizeof(gstr), "[Admin] %s baniu off a conta %s [Razão: %s]", NameEx(playerid), playername, reason);
		AdminBroadcast(gstr, 0);

		format(gstr, sizeof(gstr), "[/puniroff] Banimento permanente por '%s'", reason);
		AdminLog(playerid, sqlid, playername, gstr);
		return true;
	}

	if(strcmp("tban", punishment, true) == 0)
	{
		if(time == -1) return SysMsg(playerid,"Use: /puniroff [player name] [tban] [tempo em horas] [razão]");
		if(time < 1 || time > 24) return SysMsg(playerid,"O tempo deve estar entre 1 e 24 horas.");
		if(strlen(reason) > 150) return SysMsg(playerid,"Por favor, encurte sua razão.");

		new pIP[18];
		MySQLFetchString(sqlid, "RecentIP", pIP, "players");

		for(new ban = 0; ban < MAX_TEMPBANS; ban++)
		{
			if(TempBans[ban][TempBanActive] == 0)
			{
				TempBans[ban][TempBanSQLID] = sqlid;
				TempBans[ban][TempBanActive] = 1;
				TempBans[ban][TempBanTime] = time * 60;
				format(TempBans[ban][TempBanIP], 18, pIP);
				format(TempBans[ban][TempBanReason], 150, reason);

				AddToAdminRecord(sqlid, SQLID[playerid], ADMIN_RECORD_TYPE_TEMPBAN, time, reason);

				format(gstr, sizeof(gstr), "[Admin] %s baniu a conta %s por %i hora(s) [Razãp: %s]", NameEx(playerid), playername, time, reason);
				AdminBroadcast(gstr, 0);

				format(gstr, sizeof(gstr), "[/puniroff] Temporariamente banido por %i horas '%s'", time, reason);
				AdminLog(playerid, sqlid, playername, gstr);
				return true;
			}
		}

		SysMsg(playerid, "O banimento de temp não executou.");
		return true;
	}

	if(strcmp("dban", punishment, true) == 0)
	{
		new pIP[18];
		MySQLFetchString(sqlid, "RecentIP", pIP, "players");

		if(MySQLCheckTempBanned(sqlid, pIP) > 0) return SysMsg(playerid,"Esse IP, conta, ou conta Master já está banido.");

		if(time == -1) return SysMsg(playerid,"Use: /puniroff [nome] [dban] [quantidade de dias] [razão]");
		if(time < 2 || time > 14) return SysMsg(playerid,"Dias devem ser entre 2 e 14.");

		new datestr[30], cd, cm, cy, thstndrd[4], tempdays = time;
		getdate(cy, cm, cd);

		do
		{
			tempdays --;
			cd ++;

			if(cd > LastDayInMonth(cm))
			{
				cm ++;
				cd = 1;
				cd += tempdays;
				tempdays = 0;
			}
			if(cm > 12)
			{
				cm = 1;
				cy ++;
			}
		}
		while(tempdays > 0);

		switch(cd)
		{
			case 1,21,31: format(thstndrd, sizeof(thstndrd), "");//st
			case 2,22: format(thstndrd, sizeof(thstndrd), "");//nd
			case 3,23: format(thstndrd, sizeof(thstndrd), "");//rd
			default: format(thstndrd, sizeof(thstndrd), "");//th
		}

		format(datestr, sizeof(datestr), "%i%s %s %i", cd, thstndrd, GetMonthName(cm), cy);

		mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO tbans (PlayerName,BannedBy,BannedIP,BanReason,PlayerSQLID,UnbanDate,UnbanD,UnbanM,UnbanY,DaysBanned,MasterAccount) VALUES ('%e','%e','%e','%e',%i,'%e',%i,%i,%i,%i,%i)", GetSQLName(sqlid), GetName(playerid), pIP, reason, sqlid, datestr, cd, cm, cy, time, MySQLCheckMaster_AgainstSQLID(sqlid));
		mysql_pquery(conn, mquery, "");

		AddToAdminRecord(sqlid, SQLID[playerid], ADMIN_RECORD_TYPE_DATEBAN, time, reason);

		format(gstr, sizeof(gstr), "[Admin] %s baniu a conta %s até %s (%i dias) [Razão: %s]", NameEx(playerid), playername, datestr, time, reason);
		AdminBroadcast(gstr, 0);

		format(gstr, sizeof(gstr), "[/puniroff] Banido por %i dias '%s'", time, reason);
		AdminLog(playerid, sqlid, playername, gstr);
		return true;
	}
	SysMsg(playerid,"Tipo de punição inválida.");
	return true;
}
CMD:kick(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, reason[150];
	if(sscanf(params, "uS(Não especificado)[150]", playa, reason)) return SysMsg(playerid,"Use: /kick [ID ou nome do jogador] [razão]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa) && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(playa == playerid) return SysMsg(playerid,"Você não pode usar esse comando em si mesmo.");
	if(IsPlayerAdminLevelOK(playa,1) && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"Você não pode kicka outro admin.");

	format(sgstr, sizeof(sgstr), "Admin %s kickou %s do servidor [Razão: %s]", NameEx(playerid), NameEx(playa), reason);
	SendClientMessageToAllLogged(COLOR_RED,sgstr);
	KickPlayer(playa, 7);

	AddToAdminRecord(SQLID[playa], SQLID[playerid], ADMIN_RECORD_TYPE_KICK, -1, reason);

	format(sgstr, sizeof(sgstr), "Kickado por '%s'", reason);
	AdminLog(playerid, SQLID[playa], GetName(playa), sgstr);
	return true;
}
CMD:kickall(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	SendClientMessageToAllF(COLOR_RED,"Admin %s kickou todos os jogados do servidor.",NameEx(playerid),params);
	foreach(new i: Player) if(i != playerid) KickPlayer(i, 8);

	AdminLog(playerid, 0, "", "Kick todos jogadores");
	return true;
}
CMD:revive(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /revive [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(!Dead{playa}) return SysMsg(playerid,"Esse jogador não está ferrido.");

	RevivePlayer(playa);

	SendClientMessageF(playerid, COLOR_RED,"Você reviveu %s.", NameEx(playa));
	SendClientMessageF(playa, COLOR_RED, "Admin %s reviveu você.", NameEx(playerid));
	return true;
}
CMD:removercadaver(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new corpse;
	if(sscanf(params, "i", corpse)) return SysMsg(playerid, "Use: /removercadaver [corpse ID]");
	if(corpse < 0 || corpse > MAX_CORPSES) return SysMsg(playerid, "Cadáver inválido.");
	if(!CorpseData[corpse][CorpseUsed]) return SysMsg(playerid, "Cadáver inválido.");

	SendClientMessageF(playerid, COLOR_RED, "Você destruiu o cadáver de %s", GetSQLName(CorpseData[corpse][CorpseOwner]));
	DestroyCorpse(corpse);
	return true;
}
CMD:limparcadaveres(playerid)//limparcadaveres
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new count = 0;
	for(new c = 0; c < MAX_CORPSES; c++)
	{
		if(!CorpseData[c][CorpseUsed]) continue;

		DestroyCorpse(c);
		count ++;
	}
	SendClientMessageF(playerid, COLOR_RED, "[Admin] Você destruiu %i cadáveres.", count);
	return true;
}
CMD:ban(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, reason[150];
	if(sscanf(params, "uS(Não especificado)[150]", playa, reason)) return SysMsg(playerid,"Use: /ban [ID ou nome do jogador] [razão]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(IsPlayerAdmin(playa)) return SendClientMessage(playerid, COLOR_WHITE, "SERVER: Acesso negado");
	if(IsPlayerAdminLevelOK(playa,1) > 0 && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"Você não pode banir outro admin.");

	if(playa == playerid) return SysMsg(playerid,"Você não pode se banir.");

	format(sgstr, sizeof(sgstr),"Admin %s baniu %s [Razão: %s]",NameEx(playerid),NameEx(playa),reason);
	SendClientMessageToAllLogged(COLOR_RED, sgstr);
	UnlockAchievement(playa, 73);
	MySQLBanPlayer(playa, MasterAccountName[playerid], reason);

	AddToAdminRecord(SQLID[playa], SQLID[playerid], ADMIN_RECORD_TYPE_PERMBAN, -1, reason);

	format(sgstr, sizeof(sgstr), "Banimento permanente por '%s'", reason);
	AdminLog(playerid, SQLID[playa], GetName(playa), sgstr);
	return true;
}
CMD:tban(playerid, params[])//parei aqui
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, hours, reason[150];
	if(sscanf(params, "uiS()[150]", playa, hours, reason)) return SysMsg(playerid,"Use: /tban [ID ou nome do jogador] [tempo (em horas)] [razão]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(IsPlayerAdmin(playa)) return SendClientMessage(playerid, COLOR_WHITE, "SERVER: Acesso negado");
	if(IsPlayerAdminLevelOK(playa,1) && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"Você não pode banir outro admin.");
	if(playa == playerid) return SysMsg(playerid,"Você não pode usar esse comando em si mesmo.");
	if(!Logged{playa}) return SendClientMessage(playerid, COLOR_WHITE, "Esse jogador não está logado no servidor.");

	if(hours < 1 || hours > 24) return SysMsg(playerid,"Você precisa colocar entre 1 e 24 horas.");
	if(isnull(reason)) format(reason, sizeof(reason), "Não especificado");

	for(new ban = 0; ban < MAX_TEMPBANS; ban++)
	{
		if(TempBans[ban][TempBanActive] == 0)
		{
			format(gstr, sizeof(gstr),"Admin %s baniu %s por %i hora(s) [Razão: %s]", NameEx(playerid), NameEx(playa), hours, reason);
			SendClientMessageToAllLogged(COLOR_RED,gstr);

			TempBans[ban][TempBanSQLID] = SQLID[playa];
			TempBans[ban][TempBanActive] = 1;
			TempBans[ban][TempBanTime] = hours * 60;
			TempBans[ban][BanningAdmin] = SQLID[playerid];

			format(TempBans[ban][TempBanIP], 16, PlayerIP[playa]);
			format(TempBans[ban][TempBanReason], 150, reason);

			KickPlayer(playa, 9);
			AddToAdminRecord(SQLID[playa], SQLID[playerid], ADMIN_RECORD_TYPE_TEMPBAN, hours, reason);
			format(gstr, sizeof(gstr), "O tempo de banidomento foi de %i horas '%s'", hours, reason);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
	}
	SysMsg(playerid, "Temp ban failed to execute.");
	return true;
}
CMD:tunban(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /tunban [Player_Name]");

	for(new ban = 0; ban < MAX_TEMPBANS; ban++)
	{
		if(TempBans[ban][TempBanActive] == 1)
		{
			if(strcmp(GetSQLName(TempBans[ban][TempBanSQLID]), params, true) == 0)
			{
				format(gstr, sizeof(gstr), "[Admin] %s desbaniu a conta %s da lista de banimentos temporários.", NameEx(playerid), GetSQLName(TempBans[ban][TempBanSQLID]));
				AdminBroadcast(gstr, 0);
				AdminLog(playerid, TempBans[ban][TempBanSQLID], GetSQLName(TempBans[ban][TempBanSQLID]), "Banimento temporário removido");

				TempBans[ban][TempBanSQLID] = 0;
				TempBans[ban][TempBanActive] = 0;
				TempBans[ban][TempBanTime] = 0;
				TempBans[ban][BanningAdmin] = 0;

				TempBans[ban][TempBanIP][0] = 0;
				TempBans[ban][TempBanReason][0] = 0;
				return true;
			}
		}
	}
	SysMsg(playerid, "Esse jogador não está banido, use: Nome_Sobrenome.");
	return true;
}
CMD:removedateban(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /removedateban [Player_Name]");

	mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM tbans WHERE PlayerName = '%e' AND Unbanned = 0", params);
	mysql_pquery(conn, mquery, "");

	SysMsgF(playerid, "Date ban for %s has been deleted.", params);
	AdminLog(playerid, 0, params, "Removed date ban");

	return true;
}
CMD:verdbans(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	mysql_pquery(conn, "SELECT PlayerName,BannedIP,BanReason,UnbanDate FROM tbans WHERE Unbanned = 0 ORDER BY UnbanDate DESC", "ViewDateBans", "d", playerid);
	return true;
}
CMD:setunbandate(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playername[MAX_PLAYER_NAME], days;
	if(sscanf(params, "s[20]i", playername, days)) return SysMsg(playerid,"Use: /setunbandate [Player_Name] [Days until unban]");
	if(days < 1 || days > 30) return SysMsg(playerid,"Days must be between 1 and 30.");

	mysql_format(conn, mquery, sizeof(mquery), "SELECT id FROM bans WHERE PlayerName = '%e'", playername);
	new Cache:result = mysql_query(conn, mquery);

	new bancount = cache_num_rows(), banID;
	if(bancount > 0)
	{
		banID = cache_get_field_content_int(0, "id");
		cache_delete(result);
	}
	else
	{
		SysMsg(playerid,"Nenhum banimento foi encontrado com esse nome.");
		cache_delete(result);
		return true;
	}

	new datestr[30], thstndrd[4], cd, cm, cy;

	new tempdays = days;
	getdate(cy, cm, cd);

	do
	{
		tempdays --;
		cd ++;

		if(cd > LastDayInMonth(cm))
		{
			cm ++;
			cd = 1;
			cd += tempdays;
			tempdays = 0;
		}
		if(cm > 12)
		{
			cm = 1;
			cy ++;
		}
	}
	while(tempdays > 0);

	switch(cd)
	{
		case 1,21,31: format(thstndrd, sizeof(thstndrd), "st");
		case 2,22: format(thstndrd, sizeof(thstndrd), "nd");
		case 3,23: format(thstndrd, sizeof(thstndrd), "rd");
		default: format(thstndrd, sizeof(thstndrd), "th");
	}

	format(datestr, sizeof(datestr), "%i%s %s %i", cd, thstndrd, GetMonthName(cm), cy);

	new bannedby[20], banreason[40], bannedip[20], bannedsqlid;
	MySQLFetchString(banID, "BannedIP", bannedip, "bans");
	MySQLFetchString(banID, "BannedBy", bannedby, "bans");
	MySQLFetchString(banID, "Reason", banreason, "bans");
	MySQLFetchInt(banID, "PSQLID", bannedsqlid, "bans");

	format(gstr, sizeof(gstr), "[Admin] %s definiu o banimento permanente de %s para expirar em %s(%i dias)", NameEx(playerid), playername, datestr, days);
	AdminBroadcast(gstr, 0);
	format(gstr, sizeof(gstr), "Set perm ban to expire in %i days", days);
	AdminLog(playerid, bannedsqlid, playername, gstr);

	DeleteBan(banID);
	mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO tbans (PlayerName,BannedBy,BannedIP,BanReason,PlayerSQLID,UnbanDate,UnbanD,UnbanM,UnbanY,DaysBanned,MasterAccount) VALUES ('%e','%e','%e','%e',%i,'%e',%i,%i,%i,%i,%i)", playername, bannedby, bannedip, banreason, bannedsqlid, datestr, cd, cm, cy, days, MySQLCheckMaster_AgainstSQLID(bannedsqlid));
	mysql_pquery(conn, mquery, "");
	return true;
}
CMD:vertbans(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new count = 0;

	gstr[0] = EOS;
	for(new ban = 0; ban < MAX_TEMPBANS; ban++)
	{
		if(TempBans[ban][TempBanActive] == 1)
		{
			new sub[90];

			format(sub, 90, "%s [%s, %i minutos, Razão: '%s']\n", GetSQLName(TempBans[ban][TempBanSQLID]), TempBans[ban][TempBanIP], TempBans[ban][TempBanTime], TempBans[ban][TempBanReason]);
			strcat(gstr, sub);
			count ++;
		}
	}

	if(count == 0) return SysMsg(playerid, "Ninguem está temporariamente banido.");

	ShowMessage(playerid, "Banimentos temporários", gstr, "pronto");
	return true;
}
CMD:dban(playerid, params[]) return cmd_dateban(playerid, params);
CMD:dateban(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, days, reason[150];
	if(sscanf(params, "uis[150]", playa, days, reason)) return SysMsg(playerid,"Use: /dateban [ID ou nome do jogador] [dias] [razão]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(IsPlayerAdmin(playa)) return SendClientMessage(playerid, COLOR_WHITE, "SERVER: Acesso negado");
	if(IsPlayerAdminLevelOK(playa,1) && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"Você não pode banir outro admin.");
	if(playa == playerid) return SysMsg(playerid,"Você não pode banir a si mesmo.");
	if(!Logged{playa}) return SendClientMessage(playerid, COLOR_WHITE, "Esse jogador não está logado no servidor.");

	if((days < 2 || days > 14) && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"Days must be between 2 and 14.");
	if(strlen(reason) > 149) return SysMsg(playerid,"Sua razão está muito grande, max de 150 letras.");

	new datestr[30], cd, cm, cy, thstndrd[4], tempdays = days;
	getdate(cy, cm, cd);

	do
	{
		tempdays --;
		cd ++;

		if(cd > LastDayInMonth(cm))
		{
			cm ++;
			cd = 1;
			/*cd += tempdays;
			tempdays = 0;*/
		}
		if(cm > 12)
		{
			cm = 1;
			cy ++;
		}
	}
	while(tempdays > 0);

	switch(cd)
	{
		case 1,21,31: format(thstndrd, sizeof(thstndrd), "st");
		case 2,22: format(thstndrd, sizeof(thstndrd), "nd");
		case 3,23: format(thstndrd, sizeof(thstndrd), "rd");
		default: format(thstndrd, sizeof(thstndrd), "th");
	}

	format(datestr, sizeof(datestr), "%i%s %s %i", cd, thstndrd, GetMonthName(cm), cy);

	format(gstr, sizeof(gstr), "Admin %s baniu %s até %s (%i days) [Razão: %s]", NameEx(playerid), NameEx(playa), datestr, days, reason);
	SendClientMessageToAllLogged(COLOR_RED, gstr);

	mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO tbans (PlayerName,BannedBy,BannedIP,BanReason,PlayerSQLID,UnbanDate,UnbanD,UnbanM,UnbanY,DaysBanned,MasterAccount) VALUES ('%e','%e','%e','%e',%i,'%e',%i,%i,%i,%i,%i)", GetName(playa), MasterAccountName[playerid], PlayerIP[playa], reason, SQLID[playa], datestr, cd, cm, cy, days, MySQLCheckMaster_AgainstSQLID(SQLID[playa]));
	mysql_pquery(conn, mquery, "");

	format(gstr, sizeof(gstr), "Date banned for %i days", days);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);

	KickPlayer(playa, 10);

	AddToAdminRecord(SQLID[playa], SQLID[playerid], ADMIN_RECORD_TYPE_DATEBAN, days, reason);
	return true;
}
CMD:rban(playerid, params[])
{
	if(!Logged{playerid}) return true;

	if(IsPlayerAdmin(playerid))
	{
		new playa = -1, reason[40];
		if(sscanf(params, "us[40]", playa, reason)) return SysMsg(playerid,"Use: /rban [ID ou nome do jogador] [razão]");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
		if(playa == playerid) return SysMsg(playerid,"Você não pode usar esse comando em si mesmo.");

		if(isnull(reason)) format(reason, sizeof(reason), "Não especificado");

		new ip1, ip2, ip3, ip4;
		sscanf(PlayerIP[playa], "p<.>iiii", ip1, ip2, ip3, ip4);

		format(gstr, sizeof(gstr), "banip %i.%i.*.*", ip1, ip2);
		SendRconCommand(gstr);

		format(gstr, sizeof(gstr),"Admin %s Range Banned %s [Razão: %s]",NameEx(playerid),NameEx(playa),reason);
		SendClientMessageToAllLogged(COLOR_RED,gstr);
		format(gstr, sizeof(gstr), "Range banned, reason=%s", reason);
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);

		KickPlayer(playa, 11);
	}
	else return SysMsg(playerid, AUTHMSG);

	return true;
}
CMD:rbanip(playerid, params[])
{
	if(!Logged{playerid}) return true;

	if(IsPlayerAdminLevelOK(playerid, 4))
	{
		if(isnull(params)) return SysMsg(playerid,"Use: /rbanip [ip]");

		format(gstr, sizeof(gstr),"Admin %s range banned IP %s.",NameEx(playerid),params);
		AdminBroadcast(gstr, 0);
		format(gstr, sizeof(gstr), "Range banned %s", params);
		AdminLog(playerid, 0, "", gstr);

		format(gstr, sizeof(gstr), "banip %s", params);
		SendRconCommand(gstr);
	}
	else return SysMsg(playerid, AUTHMSG);

	return true;
}
CMD:banip(playerid, params[])
{
	if(!Logged{playerid}) return true;

	if(IsPlayerAdminLevelOK(playerid, 3))
	{
		new ip[16], reason[150];
		if(sscanf(params, "s[16]S()[150]", ip, reason)) return SysMsg(playerid,"Use: /banip [IP] [reason] *DO NOT USE AN IP WILDCARD*");
		if(strfind(reason, "*") != -1) return SysMsg(playerid, "YOU USED A WILDCARD.");

		if(isnull(reason)) format(reason, sizeof(reason), "Não especificado");

		format(gstr, sizeof(gstr),"Admin %s banned IP %s [Razão: %s]",NameEx(playerid),ip,reason);
		SendClientMessageToAllLogged(COLOR_RED,gstr);
		format(gstr, sizeof(gstr), "Banned IP %s for '%s'", ip, reason);
		AdminLog(playerid, 0, "", gstr);

		MySQLBanIP(ip, NameEx(playerid), reason);

		foreach(new i: Player)
		{
			if(strcmp(PlayerIP[i], ip, true) == 0)
			{
				KickPlayer(i, 12);
				break;
			}
		}
	}
	else return SysMsg(playerid, AUTHMSG);

	return true;
}
CMD:banhost(playerid, params[])
{
	if(!Logged{playerid}) return true;

	if(IsPlayerAdmin(playerid))
	{
		if(isnull(params)) return SysMsg(playerid,"Use: /banhost [hostname]");

		format(gstr, sizeof(gstr),"Admin %s Banned the host '%s'",NameEx(playerid),params);
		AdminBroadcast(gstr, 0);

		mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO hostbans (BannedHost) VALUES ('%e')", params);
		mysql_pquery(conn, mquery, "");

		format(HostBans[HostBanIDX], 128, params);

		format(gstr, sizeof(gstr), "Blocked hostname %s", params);
		AdminLog(playerid, 0, "", gstr);
	}
	else return SysMsg(playerid, AUTHMSG);

	return true;
}
CMD:banhosts(playerid, params[])
{
	if(!Logged{playerid}) return true;

	if(IsPlayerAdmin(playerid))
	{
		for(new b = 0; b < 15; b++)
		{
			HostBans[b][0] = 0;
		}

		HostBanIDX = 0;

		mysql_pquery(conn, "SELECT BannedHost FROM hostbans", "ReloadBanHosts", "d", playerid);
	}
	else return SysMsg(playerid, AUTHMSG);

	return true;
}
CMD:unbanip(playerid, params[])
{
	if(!Logged{playerid}) return true;

	if(IsPlayerAdminLevelOK(playerid, 3))
	{
		if(isnull(params)) return SysMsg(playerid,"Use: /unbanip [IP]");
		if(MySQLCheckIPBanned(params) == 0) return SysMsg(playerid,"That IP is not banned so cannot be unbanned.");

		mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM bans WHERE BannedIP = '%e'", params);
		mysql_pquery(conn, mquery, "");

		format(gstr, sizeof(gstr),"[Admin] %s removeu todos os banimentos com IP: %s",NameEx(playerid),params);
		AdminBroadcast(gstr, 0);
		format(gstr, sizeof(gstr), "Unbanned IP %s", params);
		AdminLog(playerid, 0, "", gstr);
	}
	else return SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:unban(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /unban [Nome_Sobrenome]");
	new banid = GetBanID(params);

	if(banid > 0)
	{
		DeleteBan(banid);
		format(gstr, sizeof(gstr),"[Admin] %s unbanned %s.", NameEx(playerid), params);
		AdminBroadcast(gstr, 0);
		AdminLog(playerid, 0, params, "Conta desbanida");
	}
	else SendClientMessage(playerid, COLOR_WHITE, "Nenhum banimento foi encontrado com esse nome.");
	return true;
}
CMD:desabilitarconta(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /desabilitarconta [player id]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(!Logged{playa}) return SysMsg(playerid,"Esse jogador não está logado no servidor.");
	if(playa == playerid) return SysMsg(playerid, "Você não pode desabilitar sua propria conta.");

	MySQLUpdateInt(SQLID[playa], "AccountDisabled", 1, "players");

	format(gstr, sizeof(gstr),"Admin %s desabilitou sua conta.", NameEx(playerid));
	SendClientMessage(playa, COLOR_RED, gstr);
	SendClientMessage(playa, COLOR_RED, "Você não poderá mais acessar esta conta.");
	AdminLog(playerid, SQLID[playa], GetName(playa), "Conta desabilitada");

	format(gstr, sizeof(gstr),"Admin %s desabilitou a conta de %s.", NameEx(playerid), NameEx(playa));
	KickPlayer(playa, 13);
	SendClientMessageToAllLogged(COLOR_RED, gstr);
	return true;
}
CMD:habilitaconta(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /habilitaconta [Nome_Sobrenome]");
	new sqlid = MySQLCheckAccount(params, playerid);
	if(sqlid <= 0) return SysMsg(playerid,"Este nome não pode ser encontrado.");

	new status;
	MySQLFetchInt(sqlid, "AccountDisabled", status, "players");
	if(status == 0) return SysMsg(playerid,"Essa conta já está habilitada.");

	MySQLUpdateInt(sqlid, "AccountDisabled", 0, "players");

	format(gstr, sizeof(gstr),"[Admin] %s re-habilitou a conta de %s.", NameEx(playerid), GetSQLName(sqlid));
	AdminBroadcast(gstr, 0);
	AdminLog(playerid, sqlid, GetSQLName(sqlid), "Conta habilitada");
	return true;
}
CMD:disableaccid(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /disableaccid [account id]");
	if(!IsNumeric(params)) return SysMsg(playerid,"Conta inválida.");
	new account = strval(params);
	if(account < 0) return SysMsg(playerid,"Conta inválida.");

	MySQLUpdateInt(account, "AccountDisabled", 1, "players");

	format(gstr, sizeof(gstr),"A conta %i foi desativada.", account);
	SendClientMessage(playerid, COLOR_RED, gstr);
	AdminLog(playerid, account, GetSQLName(account), "Conta desabilitada");
	return true;
}
CMD:gt(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, towho[20], style, secTime, text[75];
	if(sscanf(params, "s[20]iis[75]", towho, style, secTime, text)) return SysMsg(playerid,"Use: /gt [playerid/nome /todos] [estilo] [time(segundos)] [texto]");

	if(strcmp(towho,"todos",true) == 0) playa = 1000;
	else
	{
		if(!IsNumeric(towho)) playa = GetPlayerID(playerid, towho); else playa = strval(towho);
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	}

	if(style < 0 || style > 6) return SysMsg(playerid,"Estilo inválido.");
	if(secTime < 1 || secTime > 10) return SysMsg(playerid,"Tempo inválido.");

	if(playa == 1000) GameTextForAll(text, secTime*1000, style);
	else GameTextForPlayer(playa, text, secTime*1000, style);

	return true;
}
CMD:bc(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);
	if(ToggleBC == 0) return SysMsg(playerid,"Broadcast está desabilitado.");

	if(isnull(params)) return SysMsg(playerid,"Use: /bc [mensagem]");

	GameTextForAll(params, 10000, 3);
	format(gstr, sizeof(gstr), "Broadcast: %s", params);
	AdminLog(playerid, 0, "", gstr);
	return true;
}
CMD:anuncioadm(playerid, params[])// /an
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: (Anúncio OOC) /anuncioadm [mensagem]");

	new anMsg[196];
	format(anMsg,196,"Anúncio de %s: %s", NameEx(playerid), params);
	SendClientMessageToAllLogged(0x00FFFFFF,anMsg);
	strins(anMsg, "11", 0);
	//IRC_Say(IRCBot, IRC_CHANNEL, anMsg);
	//IRC_Say(IRCBot, IRC_ADMIN_CHANNEL, anMsg);
	format(anMsg, sizeof(anMsg), "Anúncio: %s", params);
	AdminLog(playerid, 0, "", anMsg);
	return true;
}
CMD:aa(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Use: /aa [mensagem]");

	format(sgstr, sizeof(sgstr),"* Admin %s: %s", NameEx(playerid), params);
	SendClientMessageToAllLogged(0xC520FFFF, sgstr);
	strins(sgstr, "6", 0);
	//IRC_Say(IRCBot, IRC_CHANNEL, sgstr);
	//IRC_Say(IRCBot, IRC_ADMIN_CHANNEL, sgstr);
	format(sgstr, sizeof(sgstr), "Diz: %s", params);
	AdminLog(playerid, 0, "", sgstr);
	return true;
}
CMD:dizarea(playerid, params[])//falar em área
{
	if(IsPlayerAdminLevelOK(playerid, 1))
	{
		new playa = -1, range, message[196];
		if(sscanf(params, "iis[196]", playa, range, message)) return SysMsg(playerid,"Use: /dizarea [playerid] [área] [mensagem]");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
		if(!Logged{playa}) return SysMsg(playerid,"Esse jogador não está logado.");
		if(range == 0) return SysMsg(playerid, "Digite um intervalo maior que 0.");
		foreach(new i: Player)
		{
			if(Logged{i} && IsPlayerInRangeOfPoint(i, range, PlayerPosX(playa), PlayerPosY(playa), PlayerPosZ(playa)) || i == playerid)
			{
				SendClientMessageF(i, 0xC520FFFF, "* [AREA] Admin %s: %s", NameEx(playerid), message);
			}
		}
		format(gstr, sizeof(gstr), "Área: %s", params);
		AdminLog(playerid, 0, "", gstr);
	}
	else SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:kickping(playerid, params[])//kicka por ping
{
	if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, toggle;
	if(sscanf(params, "ui", playa, toggle)) return SysMsg(playerid,"Use: Ping King Exemption /kickping [playerid/name] [0/1]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(!Logged{playa}) return SysMsg(playerid,"Esse jogador ainda não esta logado.");
	if(toggle < 0 || toggle > 1) return SysMsg(playerid, "Toggle deve ser 0 ou 1.");

	if(toggle == 0) PingKickExemption{playa} = false;
	else PingKickExemption{playerid} = true;
	MySQLUpdateInt(SQLID[playa], "PingKickExemption", toggle, "players");

	if(toggle == 0)
	{
		SendClientMessageF(playa, COLOR_RED, "Admin %s tornou-se responsável por altos golpes de ping.", NameEx(playerid));
		SendClientMessageF(playerid, COLOR_RED, "Você permitiu %s para ser chutado.", NameEx(playa));
		AdminLog(playerid, SQLID[playa], GetName(playa), "Ping Kick Exemption configurado para 0");
	}
	else
	{
		SendClientMessageF(playa, COLOR_RED, "Admin %s kickou você pode ping alto.", NameEx(playerid));
		SendClientMessageF(playerid, COLOR_RED, "Você fez %s ser kickado por ping alto.", NameEx(playa));
		AdminLog(playerid, SQLID[playa], GetName(playa), "Ping Kick Exemption set to 1");
	}

	return true;
}
CMD:msgall(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new caption[30], message[200], button1[20], button2[20];
	if(sscanf(params, "s[30]s[20]s[20]s[200]", caption, button1, button2, message)) return SysMsg(playerid, "Use: /msgall [Legenda] [button1] [button2] [mensagem]");

	foreach(new i: Player) if(Logged{i}) Dialog_Show(i, DIALOG_NONE, DIALOG_STYLE_MSGBOX, caption, message, button1, button2);
	return true;
}
CMD:playsound(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new towho[20], playa, soundid;
	if(sscanf(params, "s[20]i", towho, soundid)) return SysMsg(playerid, "Use: /playsound [playerid/name] [sound id]");

	if(strcmp("all", towho, true) == 0)
	{
		foreach(new i: Player) PlayerPlaySound(i, soundid, 0.0, 0.0, 0.0);
	}
	else
	{
		if(!IsNumeric(towho)) playa = GetPlayerID(playerid, towho); else playa = strval(towho);
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		PlayerPlaySound(playa, soundid, 0.0, 0.0, 0.0);
	}
	return true;
}
CMD:aboombox(playerid, params[])
{
	if(IsPlayerAdminLevelOK(playerid, 1))
	{
		new option[12], playa = -1;
		if(sscanf(params, "s[64]I(-1)", option, playa)) return SysMsg(playerid, "Use: /aboombox [ban / delete] [Optional: ID]");

		if(playa == -1)
		{
			foreach(new p: Player)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.0, Boomboxes[p][BoomPos][0], Boomboxes[p][BoomPos][1], Boomboxes[p][BoomPos][2]))
				{
					if(strmatch(option, "delete"))
					{
						SetPVarInt(playerid, "bbID", p);
						format(gstr, sizeof(gstr), "Tem certeza que deseja deletar a boombox de %s ?", NameRP(p));
						return Dialog_Show(playerid, BoomboxDelete, DIALOG_STYLE_MSGBOX, "Boombox Menu", gstr, "Sim", "Cancelar");
					}
					else if(strmatch(option, "ban"))
					{
						SetPVarInt(playerid, "bbID", p);
						format(gstr, sizeof(gstr), "Tem certeza que deseja banir a boombox de %s, ele não podera usar mais boombox ?", NameRP(p));
						return Dialog_Show(playerid, BoomboxBan, DIALOG_STYLE_MSGBOX, "Boombox Menu", gstr, "Sim", "Cancelar");
					}
				}
			}
			return SysMsg(playerid, "Nenhuma boombox encontrada, use /aboombox [playerid].");
		}
		else if(IsPlayerConnected(playa))
		{
			if(strmatch(option, "delete"))
			{
				if(Boomboxes[playa][BoomOID] == SQLID[playa])
				{
					SetPVarInt(playerid, "bbID", playa);
					format(gstr, sizeof(gstr), "Tem certeza que deseja deletar a boombox de %s ?", NameRP(playa));
					return Dialog_Show(playerid, BoomboxDelete, DIALOG_STYLE_MSGBOX, "Boombox Menu", gstr, "Sim", "Cancelar");
				}
				else return SysMsg(playerid, "Esse jogador não possui boombox ativo.");
			}
			else if(strmatch(option, "ban"))
			{
				SetPVarInt(playerid, "bbID", playa);
				format(gstr, sizeof(gstr), "Tem certeza que deseja banir a boombox de %s, ele não podera usar mais boombox ?", NameRP(playa));
				return Dialog_Show(playerid, BoomboxBan, DIALOG_STYLE_MSGBOX, "Boombox Menu", gstr, "Sim", "Cancelar");
			}
		}
		else return SysMsg(playerid, NOPLAYER);
	}
	else return SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:bmxban(playerid, params[])
{
	if(IsPlayerAdminLevelOK(playerid, 1))
	{
		new playa = -1;
		if(sscanf(params, "u", playa)) return SysMsg(playerid, "Use: /bmxban [playerID ou name]");
		if(!IsNumeric(params)) return SysMsg(playerid,"Você deve inserir uma identificação de jogador.");
		if(BMXBanned[playa] == 1) return SysMsg(playerid, "O privilégio de bicicleta desse jogador já foi removido.");
		if(playerid == playa) return SysMsg(playerid, "Você não pode usar esse comando em si mesmo.");
		if(IsPlayerAdminLevelOK(playa, 1)) return SysMsg(playerid, "Você não pode usar esse comando em outro administradores.");

		SysMsgF(playa, "Administrator %s removeu sua permissão de usar Bmx.", NameEx(playerid));
		SysMsgF(playerid, "Você removeu a permissão de %s de usar Bmx.", NameEx(playa));
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET BMXBanned = 1 WHERE id = %i", MasterAccount[playerid]);
		mysql_pquery(conn, mquery);
		BMXBanned[playa] = 1;
	}
	return true;
}
CMD:playmusic(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);

	new towho[24], playa, musicLink[200];
	if(sscanf(params, "s[24]s[200]", towho, musicLink)) return SysMsg(playerid, "Use: /playmusic (for) [[playerid/name]/todos/admins] [link/stop]");

	if(strcmp(musicLink, "stop") == 0)
	{
		if(strcmp("todos", towho, true) == 0)
		{
			foreach(new i: Player) if(Logged{i}) StopAudioStreamForPlayer(i);
		}
		else if(strcmp("admins", towho, true) == 0)
		{
			foreach(new i: Player) if(IsPlayerAdminLevelOK(i, 1)) StopAudioStreamForPlayer(i);
		}
		else
		{
			if(!IsNumeric(towho)) playa = GetPlayerID(playerid, towho); else playa = strval(towho);
			if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

			StopAudioStreamForPlayer(playa);
		}
	}
	else
	{
		if(strcmp("todos", towho, true) == 0)
		{
			foreach(new i: Player)
			{
				if(Logged{i})
				{
					StopAudioStreamForPlayer(i);
					PlayAudioStreamForPlayerEx(i, musicLink);
					SendClientMessageF(i, COLOR_RED, "DJ %s esta tocando algumas musicas.", GetPlayersFirstName(playerid));
					ListeningBoom[i] = -1;
				}
			}
		}
		else if(strcmp("admins", towho, true) == 0)
		{
			foreach(new i: Player)
			{
				if(IsPlayerAdminLevelOK(i, 1))
				{
					StopAudioStreamForPlayer(i);
					PlayAudioStreamForPlayerEx(i, musicLink);
					SendClientMessageF(i, COLOR_RED, "DJ %s esta tocando algumas musicas.", GetPlayersFirstName(playerid));
					ListeningBoom[i] = -1;
				}
			}
		}
		else
		{
			if(!IsNumeric(towho)) playa = GetPlayerID(playerid, towho);
			else playa = strval(towho);

			if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

			PlayAudioStreamForPlayerEx(playa, musicLink);
			SendClientMessageF(playa, COLOR_RED, "DJ %s esta tocando algumsa musicas.", GetPlayersFirstName(playerid));
		}
	}

	return true;
}
CMD:ahangout(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	SetPlayerPos(playerid, 1452.110717, -1059.402343, 213.411880);
	SetPlayerFacingAngle(playerid, 0.0);
	SetPlayerVirtualWorldEx(playerid, 1337);
	SetPlayerInterior(playerid, 0);
	SendClientMessage(playerid, COLOR_BLUEGREEN, "Bem-vindo ao admin Lounge!");
	return true;
}
CMD:msgp(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, caption[30], message[200], button1[20], button2[20];
	if(sscanf(params, "us[30]s[20]s[20]s[200]", playa, caption, button1, button2, message)) return SysMsg(playerid, "Use: /msgp [playerid/name] [caption] [button1] [button2] [mensagem]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

	Dialog_Show(playa, DIALOG_NONE, DIALOG_STYLE_MSGBOX, caption, message, button1, button2);
	return true;
}
CMD:maths(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new Number1, Number2, chara[2];
	if(sscanf(params, "is[2]i", Number1, chara, Number2)) return SysMsg(playerid,"Use: /maths [número 1] [operator '+' or '-'] [número 2]");

	if(strcmp(chara, "+", true) == 0)
	{
		format(gstr, sizeof(gstr), "Questão: O que é %i + %i ? Use /responder.", Number1, Number2);
		SendClientMessageToAllLogged(COLOR_LIGHTRED, gstr);
		MathsStarted = 1;
		MathsAnswer = Number1 + Number2;
	}
	else if(strcmp(chara, "-", true) == 0)
	{
		format(gstr, sizeof(gstr), "Questão: O que é %i - %i ? Use /responder.", Number1, Number2);
		SendClientMessageToAllLogged(COLOR_LIGHTRED, gstr);
		MathsStarted = 1;
		MathsAnswer = Number1 - Number2;
	}

	return true;
}
CMD:iniciarevento(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);
	if(EventOpen == 1) return SysMsg(playerid,"Já existe um evento.");

	if(isnull(params)) return SysMsg(playerid, "Use: /iniciarevento [Nome do envento]");

	new Float:EventPos[3];
	new Int, VW;
	GetPlayerPos(playerid, EventPos[0], EventPos[1], EventPos[2]);
	Int = GetPlayerInterior(playerid);
	VW = GetPlayerVirtualWorld(playerid);

	EventData[EventX] = EventPos[0];
	EventData[EventY] = EventPos[1];
	EventData[EventZ] = EventPos[2];
	EventData[EventInterior] = Int;
	EventData[EventVW] = VW;
	format(EventData[EventName], 50, params);
	EventOpen = 1;

	format(gstr, sizeof(gstr), "%s iniciou um evento, use /entrarevento para entrar! [Descrição: %s]", NameEx(playerid), params);
	SendClientMessageToAllLogged(COLOR_PINK, gstr);
	format(gstr, sizeof(gstr), "Evento iniciado: %s", params);
	AdminLog(playerid, 0, "", gstr);
	return true;
}
CMD:pararevento(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);//pararevento
	if(EventOpen == 0) return SysMsg(playerid,"Não há evento que ocorrendo.");

	EventData[EventX] = 0.0;
	EventData[EventY] = 0.0;
	EventData[EventZ] = 0.0;
	EventData[EventInterior] = 0;
	EventData[EventVW] = 0;
	format(EventData[EventName], 50, " ");
	EventOpen = 0;

	format(gstr, sizeof(gstr), "%s finalizou o evento. É tarde demais para se juntar.", NameEx(playerid));
	SendClientMessageToAllLogged(COLOR_PINK, gstr);
	AdminLog(playerid, 0, "", "Closed an event");
	return true;
}
CMD:bone(playerid, params[])
{
	if(!Logged{playerid} || !IsPlayerAdmin(playerid)) return true;

	new objectid, boneid, index, Float:X, Float:Y, Float:Z, Float:rX, Float:rY, Float:rZ, Float:sX = 1, Float:sY = 1, Float:sZ = 1;
	if(sscanf(params, "iiiF(0)F(0)F(0)F(0)F(0)F(0)F(1)F(1)F(1)", objectid, boneid, index, X, Y, Z, rX, rY, rZ, sX, sY, sZ)) return SysMsg(playerid,"Use: /bone [object] [bone] [index] [Float:X] [Float:Y] [Float:Z] [Float:rX] [Float:rY] [Float:rZ] [Float:sX] [Float:sY] [Float:sZ]");

	SetPlayerAttachedObject(playerid, index, objectid, boneid, X, Y, Z, rX, rY, rZ, sX, sY, sZ);
	return true;
}
CMD:vobj(playerid, params[])
{
	if(!Logged{playerid} || !IsPlayerAdmin(playerid) || !IsPlayerInAnyVehicle(playerid)) return true;

	new objectid, Float:X, Float:Y, Float:Z, Float:rX, Float:rY, Float:rZ, vehicleid = GetPlayerVehicleID(playerid);
	if(sscanf(params, "iF(0)F(0)F(0)F(0)F(0)F(0)", objectid, X, Y, Z, rX, rY, rZ)) return SysMsg(playerid,"Use: /vobj [object] [Float:X] [Float:Y] [Float:Z] [Float:rX] [Float:rY] [Float:rZ]");

	if(VehObject[vehicleid] != INVALID_OBJECT_ID)
	{
		DestroyDynamicObjectEx(VehObject[vehicleid], "VehObject[vehicleid] 1");
		VehObject[vehicleid] = INVALID_OBJECT_ID;
	}

	VehObject[vehicleid] = CreateVehicleObject(objectid, vehicleid,  X, Y, Z, rX, rY, rZ);
	return true;
}
CMD:delvobj(playerid, params[])
{
	if(!Logged{playerid} || !IsPlayerAdmin(playerid) || GetPlayerVehicleID(playerid) < 1) return true;
	new Vehicleid = GetPlayerVehicleID(playerid);
	if(VehObject[Vehicleid] != INVALID_OBJECT_ID)
	{
		DestroyDynamicObjectEx(VehObject[Vehicleid], "VehObject[vehicleid] 2");
		VehObject[Vehicleid] = INVALID_OBJECT_ID;
	}
	return true;
}
CMD:mute(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, minutes;
	if(sscanf(params, "ui", playa, minutes)) return SysMsg(playerid,"Use: /mute [ID ou nome do jogador] [time in minutes]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(Muted[playa] > 0) return SysMsg(playerid,"Esse jogador já está silenciado.");
	if(minutes < 1 || minutes > 60) return SysMsg(playerid,"Os minutos só podem ser de 1 a 60 minutos");

	Muted[playa] = minutes;
	MySQLUpdateInt(SQLID[playa], "Muted", Muted[playa], "players");

	SysMsgF(playerid,"Você silenciou %s por %i minutos.",NameEx(playa), minutes);
	SysMsgF(playa, "Você foi silenciado por %s por %i minutos. Você não pode falar.",NameEx(playerid),minutes);
	format(gstr, sizeof(gstr), "Silenciado por %i min", minutes);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);

	AddToAdminRecord(SQLID[playa], SQLID[playerid], ADMIN_RECORD_TYPE_MUTE, minutes, "");
	return true;
}
CMD:unmute(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /unmute [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(Muted[playa] == 0) return SysMsg(playerid,"Esse player não está silenciado.");

	Muted[playa] = 0;
	MySQLUpdateInt(SQLID[playa], "Muted", Muted[playa], "players");

	SysMsgF(playerid, "Você desmulto %s",NameEx(playa));
	SysMsgF(playa, "Você foi desmutado por %s. Agora você pode falar.",NameEx(playerid));
	AdminLog(playerid, SQLID[playa], GetName(playa), "Unmuted");
	return true;
}
CMD:doocmute(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, minutes;
	if(sscanf(params, "ui", playa, minutes)) return SysMsg(playerid,"Use: /doocmute [ID ou nome do jogador] [time in minutes]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(playa == playerid) return SysMsg(playerid, "Você não pode usar esse comando em si mesmo.");
	if(IsPlayerAdminLevelOK(playa, 1)) return SysMsg(playerid, "Você não pode usar esse comando em outro admin.");
	if(DOOCMuted[playa] > 0) return SysMsg(playerid,"Este jogador já está desmutado.");
	if(minutes < 1 || minutes > 60) return SysMsg(playerid,"Os minutos só podem ser de 1 a 60 minutos");

	DOOCMuted[playa] = minutes;
	MySQLUpdateInt(SQLID[playa], "DOOCMuted", DOOCMuted[playa], "players");

	SysMsgF(playerid,"Você foi mutado por %s por %i minutos do DOOC.",NameEx(playa), minutes);
	SysMsgF(playa,"Você foi silenciado do DOOC por %i minutos por %s",minutes, NameEx(playerid));
	format(gstr, sizeof(gstr), "Mutado por %i min", minutes);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);

	AddToAdminRecord(SQLID[playa], SQLID[playerid], ADMIN_RECORD_TYPE_MUTE, minutes, "");
	return true;
}
CMD:doocunmute(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /doocunmute [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(DOOCMuted[playa] == 0) return SysMsg(playerid,"O jogador já não está desmutado.");

	DOOCMuted[playa] = 0;
	MySQLUpdateInt(SQLID[playa], "DOOCMuted", DOOCMuted[playa], "players");

	SysMsgF(playerid, "Você desmutou %s do DOOC.",NameEx(playa));
	SysMsgF(playa, "Você não foi mutado de DOOC.",NameEx(playerid));
	AdminLog(playerid, SQLID[playa], GetName(playa), "Unmuted");
	return true;
}
CMD:mutes(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new sub[100], count;

	gstr[0] = EOS;

	foreach(new i: Player)
	{
		if(Logged{i})
		{
			if(Muted[i] > 0)
			{
				format(sub, 100, "%s(ID %i) Global silenciado por %i minutos\n", NameEx(i), i, Muted[i]);
				strcat(gstr, sub);
				count ++;
			}
		}
	}

	if(count == 0) return SysMsg(playerid,"Ninguém está mudo agora.");

	ShowMessage(playerid, "Lista de mudos", gstr, "Pronto");
	return true;
}
CMD:ipcheck(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /ipcheck [IP]");

	mysql_format(conn, mquery, sizeof(mquery), "SELECT Name FROM players WHERE IP='%e' OR RecentIP='%e'", params, params);
	mysql_pquery(conn, mquery, "checkIP", "ds", playerid, params);
	return true;
}
CMD:clientid(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid, "Use: /clientid [playerID ou name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(!strlen(PlayerSerial[playa])) return SysMsg(playerid, "Nenhum serial encontrado para este jogador.");

	SendClientMessageF(playerid, COLOR_WHITE, "Serial do jogo para %s: %s.", NameEx(playa), PlayerSerial[playa]);
	SendSplitMessage(playerid, COLOR_WHITE, "Nota: As séries de jogos não são um identificador único de 100 porcento para um jogador, portanto, não os use como evidências concretas contra uma suspeita de evasão de proibição.");
	return true;
}
CMD:serialcheck(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid, "Use: /clientid [playerID ou name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(!strlen(PlayerSerial[playa])) return SysMsg(playerid, "Nenhuma série encontrada para este jogador.");

	mysql_format(conn, mquery, sizeof(mquery), "SELECT Name FROM players WHERE RecentSerial = '%e'", PlayerSerial[playa]);
	mysql_pquery(conn, mquery, "CheckSerial", "ds", playerid, PlayerSerial[playa]);
	return true;
}
CMD:darxp(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, xp;
	if(sscanf(params, "ui", playa, xp)) return SysMsg(playerid,"Use: /darxp [ID ou nome do jogador] [Quantidade]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");

	if(xp < 1 || xp > 2500) return SysMsg(playerid,"Quantidade de XP inválida! (Deve estar entre 1 e 2500)");

	PlayerXP[playa] += xp;
	MySQLUpdateInt(SQLID[playa], "PlayerXP", PlayerXP[playa], "players");

	SendClientMessageF(playa, COLOR_GREEN, "Admin %s te deu %i Pontos de experiência",NameEx(playerid),xp);
	SendClientMessageF(playerid, COLOR_GREEN, "Você deu a %s %i Pontos de experiência",NameEx(playa),xp);
	format(gstr, sizeof(gstr), "Deu %i XP points", xp);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	return true;
}
CMD:mudartelefone(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, newnumber;
	if(sscanf(params, "ui", playa, newnumber)) return SysMsg(playerid,"Use: /mudartelefone [ID ou Nome] [Novo número]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");

	if(newnumber < 1000000 || newnumber > 9999999) return SysMsg(playerid,"Número inválido. (Deve estar entre 1000000 e 9999999)");
	if(IsPhoneNumberUsed(newnumber) > 0) return SysMsg(playerid,"Número inválido. (Já em uso)");

	mysql_format(conn, mquery, sizeof(mquery), "UPDATE phonecontacts SET PhoneNumber = %i WHERE PhoneNumber = %i", newnumber, PhoneData[playa][pNumber]);
	mysql_pquery(conn, mquery);

	PhoneData[playa][pNumber] = newnumber;
	mysql_format(conn, mquery, sizeof(mquery), "UPDATE phones SET PhoneNumber = %i WHERE id = %i", PhoneData[playa][pNumber], PhoneData[playa][pID]);
	mysql_pquery(conn, mquery);

	SendClientMessageF(playa, COLOR_GREEN, "Admin %s definiu seu número para %i.", NameEx(playerid), newnumber);
	SendClientMessageF(playerid, COLOR_GREEN, "Você definiu o número de %s para %i.", NameEx(playa) ,newnumber);

	format(gstr, sizeof(gstr), "Mudou o número de telefone para %i", newnumber);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	return true;
}
CMD:freeze(playerid, params[])
{
	if(IsPlayerAdminLevelOK(playerid, 1) || IsHelper{playerid})
	{
		new playa = -1;
		if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /freeze [ID ou nome do jogador]");
		if(!IsPlayerAdminLevelOK(playerid, 1) && IsHelper{playerid} && IsAssisting[playerid] != playa) return SysMsg(playerid, "You can't use this command on someone you aren't assisting.");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");

		TogglePlayerControllable(playa, false);
		IsFrozen[playa] = 1;

		if(IsPlayerAdminLevelOK(playerid, 1)) SendClientMessageF(playa, COLOR_LIGHTGREEN, "Admin %s froze you.",NameEx(playerid));
		else if(IsHelper{playerid}) SendClientMessageF(playa, COLOR_LIGHTGREEN, "Helper %s froze you.",NameEx(playerid));
		SendClientMessageF(playerid, COLOR_LIGHTGREEN, "You froze %s",NameEx(playa));
		AdminLog(playerid, SQLID[playa], GetName(playa), "Froze player");
	}
	else return SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:unfreeze(playerid, params[])
{
	if(IsPlayerAdminLevelOK(playerid, 1) || IsHelper{playerid})
	{
		new playa = -1;
		if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /unfreeze [ID ou nome do jogador]");
		if(!IsPlayerAdminLevelOK(playerid, 1) && IsHelper{playerid} && IsAssisting[playerid] != playa) return SysMsg(playerid, "You can't use this command on someone you aren't assisting.");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");

		TogglePlayerControllable(playa, true);
		IsFrozen[playa] = 0;

		if(IsPlayerAdminLevelOK(playerid, 1)) format(gstr, sizeof(gstr),"Admin %s unfroze you.",NameEx(playerid));
		else if(IsHelper{playerid}) format(gstr, sizeof(gstr),"Helper %s unfroze you.",NameEx(playerid));

		SendClientMessage(playa, COLOR_LIGHTGREEN, gstr);
		format(gstr, sizeof(gstr),"You unfroze %s",NameEx(playa));
		SendClientMessage(playerid, COLOR_LIGHTGREEN, gstr);
		AdminLog(playerid, SQLID[playa], GetName(playa), "Unfroze player");
	}
	else return SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:ajail(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /ajail [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

	InitiateAdminJail(playerid, playa);
	return true;
}
CMD:ujail(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /ujail [ID ou nome do jogador]");
	if(InvalidPlayer(playa) || !Logged{playa}) return SysMsg(playerid,"Esse jogador não está conectado e logado.");
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(AdminJailData[playa][0] == 0) return SysMsg(playerid,"Este jogador não está em prisão administrativa.");

	AUnJailPlayer(playa);
	MySQLUpdateInt(SQLID[playa], "AdminJailTime", 0, "players");

	format(gstr, sizeof(gstr), "Admin %s removeu você da prisão administrativa.", NameEx(playerid));
	SendClientMessage(playa, COLOR_RED, gstr);
	format(gstr, sizeof(gstr), "[Admin] %s removeu %s da prisão administrativa.", NameEx(playerid), NameEx(playa));
	AdminBroadcast(gstr, 1);
	AdminLog(playerid, SQLID[playa], GetName(playa), "Removido da admin jail");
	return true;
}
CMD:gmx(playerid, params[])
{
	if(IsPlayerAdminLevelOK(playerid, 3))
	{
		new mins, reason[64];
		if(sscanf(params, "iS()[64]", mins, reason)) return SysMsg(playerid,"Use: /gmx [cronograma 0-10 minutos] [Optional: Breve razão] *Pode ser cancelado com /cancelgmx*");
		if(mins < 0 || mins > 10) return SysMsg(playerid, "Tempo inválido! (0-10)");
		if(mins == 0)
		{
			if(isnull(reason)) format(reason, sizeof(reason), "Não especificado");
			format(gstr, sizeof(gstr), "~n~~n~~n~~n~~n~~n~~b~~h~server reiniciado por~n~~w~%s",  NameEx(playerid));
			GameTextForAll(gstr, 12000, 3);
			AdminLog(playerid, 0, "", "Imediato GMX");
			foreach(new i: Player)
			{
				SetPlayerName(i, MasterAccountName[i]);
			}
			SetTimer("DelayedGameModeExit", 1000, false);
			return true;
		}
		MinutesUntilGMX = mins;
		SendClientMessageToAllF(COLOR_GOLD, "* Admin %s agendou um reinício do servidor em %i minuto(s)", NameEx(playerid), mins);
		//IRC_SayF(IRCBot, IRC_CHANNEL, "7* Admin %s has scheduled a server restart in %i minute(s)", NameEx(playerid), mins);
		//IRC_SayF(IRCBot, IRC_ADMIN_CHANNEL, "7* Admin %s has scheduled a server restart in %i minute(s)", NameEx(playerid), mins);
		if(strlen(reason) > 1)
		{
			SendClientMessageToAllF(COLOR_GOLD, "* Razão: %s", reason);
			//IRC_SayF(IRCBot, IRC_CHANNEL, "7* Reason: %s", reason);
			//IRC_SayF(IRCBot, IRC_ADMIN_CHANNEL, "7* Reason: %s", reason);
		}
		format(gstr, sizeof(gstr), "~n~~n~~n~~b~~h~REINICIO DO SERVE~w~ em ~g~~h~%i MINUTOS", mins);
		GameTextForAll(gstr, 10000, 3);
		format(gstr, sizeof(gstr), "GMX agendado em %i min", mins);
		AdminLog(playerid, 0, "", gstr);
	}
	else return SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:cancelgmx(playerid, params[])
{
	if(IsPlayerAdminLevelOK(playerid, 3))
	{
		if(MinutesUntilGMX == 0) return SysMsg(playerid,"No GMX scheduled.");

		MinutesUntilGMX = 0;

		SendClientMessageToAllF(COLOR_GOLD,"* Admin %s cancelou o reinício do servidor.",NameEx(playerid));
		AdminLog(playerid, 0, "", "GMX Cancelado");
	}
	else return SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:jp(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params))
	{
		if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK) SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		else SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
		return true;
	}

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /jp [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(!IsPlayerAdminLevelOK(playa,1)) return SysMsg(playerid,"Este jogador não pode usar um Jet pack.");

	if(GetPlayerSpecialAction(playa) == SPECIAL_ACTION_USEJETPACK)
	{
		SetPlayerSpecialAction(playa, SPECIAL_ACTION_NONE);
		SendClientMessageF(playa, COLOR_GREEN, "Admin %s removeu seu Jet Pack.",NameEx(playerid));
		SendClientMessageF(playerid, COLOR_GREEN, "Removeu o Jet Pack de %s",NameEx(playa));
	}
	else
	{
		SetPlayerSpecialAction(playa,SPECIAL_ACTION_USEJETPACK);
		SendClientMessageF(playa, COLOR_GREEN, "Admin %s te deu um Jet Pack",NameEx(playerid));
		SendClientMessageF(playerid, COLOR_GREEN, "Você deu a %s um Jet Pack",NameEx(playa));
	}

	return true;
}
CMD:savecp(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new Float:pX, Float:pY, Float:pZ;
	GetPlayerPos(playerid, pX, pY, pZ);

	format(gstr, sizeof(gstr), "{%f, %f, %f} //%s", pX, pY, pZ, params);
	AddToLog("savedpos", gstr);
	SysMsg(playerid, "> Posição de Ponto de Verificação Salvo para Arquivo (Checkpoint).");
	return true;
}
CMD:apayday(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new towho[20];

	if(sscanf(params, "s[24]", towho)) return SysMsg(playerid,"Use: /pagarday [ID ou nome do jogador / Todos]");

	if(strcmp("todos", towho, true) == 0)
	{
		foreach(new i: Player)
		{
			if(Logged{i}) PayDay(i);
		}
		format(gstr, sizeof(gstr),"Todos receberam um Payday pelo Admin %s.",NameEx(playerid));
		SendClientMessageToAllLogged(COLOR_RED,gstr);
		AdminLog(playerid, 0, "", "Deu payday a todos");
	}
	else
	{
		new playa = -1;
		if(!IsNumeric(towho)) playa = GetPlayerID(playerid, towho); else playa = strval(towho);
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(!Logged{playa}) return SysMsg(playerid, NOPLAYER);
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");

		PayDay(playa);

		format(gstr, sizeof(gstr),"Admin %s te deu um Payday.",NameEx(playerid));
		SendClientMessage(playa,COLOR_RED,gstr);
		format(gstr, sizeof(gstr),"Você deu a %s um Payday.",NameEx(playa));
		SendClientMessage(playerid,COLOR_RED,gstr);
		AdminLog(playerid, SQLID[playa], GetName(playa), "Deu um Payday");
	}

	return true;
}
CMD:freezeall(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new PsFrozen = 0;

	foreach(new i: Player)
	{
		if(Logged{i})
		{
			TogglePlayerControllable(i,false);
			PsFrozen ++;
		}
	}

	format(gstr, sizeof(gstr),"Everyone(%i) Has Been Frozen By Admin %s.",PsFrozen,NameEx(playerid));
	SendClientMessageToAllLogged(COLOR_RED,gstr);
	AdminLog(playerid, 0, "", "Congelou todos");
	return true;
}
CMD:unfreezeall(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new PsunFrozen = 0;

	foreach(new i: Player)
	{
		if(Logged{i})
		{
			TogglePlayerControllable(i,true);
			PsunFrozen ++;
		}
	}

	format(gstr, sizeof(gstr),"Everyone(%i) Has Been Un-Frozen By Admin %s.",PsunFrozen,NameEx(playerid));
	SendClientMessageToAllLogged(COLOR_RED,gstr);
	AdminLog(playerid, 0, "", "Descongelou todos");
	return true;
}
CMD:slap(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /slap [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(IsJailed[playa] == 1) return SysMsg(playerid,"Aguarde o jogador sair da cadeia.");
	if(IsCuffed[playa] == 1) return SysMsg(playerid,"Aguarde até que esse jogador seje desalgemado.");

	new vehicleid = GetPlayerVehicleID(playa);
	if(vehicleid == 0)
	{
		new Float:pX,Float:pY,Float:pZ;
		GetPlayerPos(playa,pX,pY,pZ);
		SetPlayerPos(playa,pX,pY,(pZ+5.0));
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		//SendClientMessageF(playa, COLOR_LIGHTBLUE, "Admin %s has slapped you!",NameEx(playerid));
	}
	else
	{
		new Float:vX,Float:vY,Float:vZ;
		GetVehicleVelocity(vehicleid,vX,vY,vZ);
		SetVehicleVelocity(vehicleid,vX,vY,vZ+0.25);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		//SendClientMessageF(playa, COLOR_LIGHTBLUE, "Admin %s has slapped your vehicle!",NameEx(playerid));
	}
	return true;
}
CMD:slapdown(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /slapdown [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(IsJailed[playa] == 1) return SysMsg(playerid,"Aguarde o jogador sair da cadeia.");
	if(IsCuffed[playa] == 1) return SysMsg(playerid,"Aguarde até que esse jogador seje desalgemado.");

	new vehicleid = GetPlayerVehicleID(playa);
	if(vehicleid == 0)
	{
		new Float:pX,Float:pY,Float:pZ;
		GetPlayerPos(playa,pX,pY,pZ);
		SetPlayerPos(playa,pX,pY,(pZ-1.0));
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		//format(gstr, sizeof(gstr),"Admin %s has slapped you!",NameEx(playerid));
		//SendClientMessage(playa,COLOR_LIGHTBLUE,gstr);
	}
	else
	{
		new Float:vX,Float:vY,Float:vZ;
		GetVehicleVelocity(vehicleid,vX,vY,vZ);
		SetVehicleVelocity(vehicleid,vX,vY,vZ-0.25);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
	//	format(gstr, sizeof(gstr),"Admin %s has slapped your vehicle!",NameEx(playerid));
		//SendClientMessage(playa,COLOR_LIGHTBLUE,gstr);
	}
	return true;
}
CMD:doubleslap(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /doubleslap [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(IsJailed[playa] == 1) return SysMsg(playerid,"Aguarde o jogador sair da cadeia.");
	if(IsCuffed[playa] == 1) return SysMsg(playerid,"Aguarde até que esse jogador seje desalgemado.");

	new vehicleid = GetPlayerVehicleID(playa);
	if(vehicleid == 0)
	{
		new Float:pX,Float:pY,Float:pZ;
		GetPlayerPos(playa,pX,pY,pZ);
		SetPlayerPos(playa,pX,pY,(pZ+10.0));
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		//format(gstr, sizeof(gstr),"Admin %s has double-slapped you!",NameEx(playerid));
	//	SendClientMessage(playa,COLOR_LIGHTBLUE,gstr);
	}
	else
	{
		new Float:vX,Float:vY,Float:vZ;
		GetVehicleVelocity(vehicleid,vX,vY,vZ);
		SetVehicleVelocity(vehicleid,vX,vY,vZ+0.75);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		//format(gstr, sizeof(gstr),"Admin %s tem duplo-sleep em seu veículo!",NameEx(playerid));
		SendClientMessage(playa,COLOR_LIGHTBLUE,gstr);
	}
	return true;
}
CMD:uberslap(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /uberslap [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(IsJailed[playa] == 1) return SysMsg(playerid,"Aguarde o jogador sair da cadeia.");
	if(IsCuffed[playa] == 1) return SysMsg(playerid,"Aguarde até que esse jogador seje desalgemado.");

	new vehicleid = GetPlayerVehicleID(playa);
	if(vehicleid == 0)
	{
		new Float:pX,Float:pY,Float:pZ;
		GetPlayerPos(playa,pX,pY,pZ);
		SetPlayerPos(playa,pX,pY,(pZ+30.0));
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		//format(gstr, sizeof(gstr),"Admin %s has uber-slapped you!",NameEx(playerid));
		SendClientMessage(playa,COLOR_LIGHTBLUE,gstr);
	}
	else
	{
		new Float:vX,Float:vY,Float:vZ;
		GetVehicleVelocity(vehicleid,vX,vY,vZ);
		SetVehicleVelocity(vehicleid,vX,vY,vZ+5.0);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		//format(gstr, sizeof(gstr),"Admin %s has uber-slapped your vehicle!",NameEx(playerid));
		SendClientMessage(playa,COLOR_LIGHTBLUE,gstr);
	}

	return true;
}
CMD:queimadinheiro(playerid, params[])//parei aqui
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /queimadinheiro [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");

	BurningMoney[playa] = 1;

	SendClientMessageF(playa, COLOR_YELLOW, "Admin %s Agora está queimando seu dinheiro! MWAHAHAHAHA!", NameEx(playerid));
	SendClientMessageF(playerid, COLOR_YELLOW, "Você está queimando o dinheiro de %s.", NameEx(playa));
	return true;
}
CMD:stopqueimardinheiro(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /stopqueimardinheiro [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(BurningMoney[playa] == 0) return SysMsg(playerid,"Players money is not burning.");

	BurningMoney[playa] = 0;

	format(gstr, sizeof(gstr), "Admin %s parou de queimar seu dinheiro!", NameEx(playerid));
	SendClientMessage(playa, COLOR_YELLOW, gstr);
	format(gstr, sizeof(gstr), "Você parou de queimar o dinheiro de %s.", NameEx(playa));
	SendClientMessage(playerid, COLOR_YELLOW, gstr);
	return true;
}
CMD:setmin(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /setmin [Minute]");
	if(!IsNumeric(params)) return SysMsg(playerid,"O minuto deve ser um número.");
	new Minute = strval(params);
	if(Minute < 0 || Minute > 59) return SysMsg(playerid,"O minuto foi inválido (0 to 59)");
	if(Minute == gServerMinute) return SysMsg(playerid,"Minute já está configurado para isso.");

	gServerMinute = Minute;
	format(gstr, sizeof(gstr),"[Admin] %s mudou o minuto para %i.",NameEx(playerid),Minute);
	AdminBroadcast(gstr, 0);
	format(gstr, sizeof(gstr), "Minuto modificado para %i", Minute);
	AdminLog(playerid, 0, "", gstr);
	return true;
}
CMD:setgravity(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new Float:Grav;
	if(sscanf(params, "f", Grav)) return SysMsg(playerid,"Use: /setgravity [Float:Value]");

	SetGravity(Grav);

	format(gstr, sizeof(gstr),"Admin %s mudou a gravidade para %.6f.",NameEx(playerid),Grav);
	SendClientMessageToAllLogged(COLOR_LIGHTBLUE,gstr);
	format(gstr, sizeof(gstr), "Mudou a gravidade para %.6f", Grav);
	AdminLog(playerid, 0, "", gstr);
	return true;
}
CMD:xyz(playerid, params[])
{
	if(!IsPlayerAdmin(playerid) && !IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new Float:X, Float:Y, Float:Z;
	if(sscanf(params, "fff", X, Y, Z)) return SysMsg(playerid,"Use: /xyz [Float:X] [Float:Y] [Float:Z]");

	SetPlayerPos(playerid, X, Y, Z);
	return true;
}
CMD:tc(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	SysMsgF(playerid, "Contagem de tiques = %i", GetTickCount());
	return true;
}
CMD:setserversenha(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /setserversenha [senha]");

	format(gstr, sizeof(gstr),"senha %s",params);
	SendRconCommand(gstr);
	SysMsgF(playerid, "Nova senha do servidor: %s.",params);
	AdminLog(playerid, 0, "", "Mudou a senha do servidor");
	return true;
}
CMD:saction(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	new vehicleid = GetPlayerVehicleID(playerid);
	if(vehicleid > 0) return SysMsg(playerid,"Você não deve estar em um veículo.");
	if(isnull(params)) return SysMsg(playerid,"Use: /saction [id]");

	if(!IsNumeric(params)) return SysMsg(playerid,"ID deve ser um número.");

	SetPlayerSpecialAction(playerid, strval(params));
	return true;
}
CMD:anim(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);

	new lib[30], aname[30];
	if(sscanf(params, "s[30]s[30]", lib, aname)) return SysMsg(playerid,"Use: /anim [library] [nome]");

	OnePlayAnim(playerid, lib, aname, 3.5, 1, 0, 0, 0, 0);
	return true;
}
CMD:tooc(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	if(ToggleOOC == 0)
	{
		ToggleOOC = 1;
		SendClientMessageToAllLogged(COLOR_WHITE, "Global OOC chat ativada por um administrador.");
		AdminLog(playerid, 0, "", "Ativado global OOC");
	}
	else
	{
		ToggleOOC = 0;
		SendClientMessageToAllLogged(COLOR_WHITE, "Global OOC Chat Desabilitado por um administrador.");
		AdminLog(playerid, 0, "", "Desativado global OOC");
	}

	return true;
}
CMD:tbc(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	if(ToggleBC == 0)
	{
		ToggleBC = 1;
		AdminBroadcast("[Admin] Broadcasting Ativado por um administrador.", 1);
		AdminLog(playerid, 0, "", "Ativado broadcasts");
	}
	else
	{
		ToggleBC = 0;
		AdminBroadcast("[Admin] Broadcasting Desabilitado por um administrador.", 1);
		AdminLog(playerid, 0, "", "Desativado broadcasts");
	}

	return true;
}
CMD:reloadfcars(playerid, params[])//regarregar veiculos de facção refreshfcars
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);

	new fid;
	if(sscanf(params, "i", fid)) return SysMsg(playerid, "Use: /refreshfcars [facção ID]");
	if(fid <= 0 || fid > MAX_FACTIONS-1) return SysMsg(playerid,"Número de facção inválido (check /fids)");

	for(new v = 1, x = GetVehiclePoolSize(); v <= x; v++)
	{
		if(FVehicleData[v][FVFaction] == fid)
		{
			DestroyVehicleEx(v, "v 2");
			ClearVehicleData(v);
		}
	}
	mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM fveh WHERE Faction = %i", fid);
	mysql_pquery(conn, mquery, "LoadFactionVehicles");

	foreach(new i: Player)
	{
		if(IsPlayerAdminLevelOK(i, 1) || Faction[i] == fid)
		{
			SendClientMessageF(i, COLOR_RED, "Admin %s atualizou os veículos das facções de %s", NameEx(playerid), FACTIONS[fid][FactionName]);
		}
	}
	return true;
}
CMD:respawnvf (playerid, params[]) //respawnar veiculo de facção
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

	new vehicle[10], option[10];
	if(sscanf(params, "s[10]S(-1)[10]", vehicle, option)) return SysMsg(playerid,"Use: /respawnvf [Veiculo ID ou Todos] [ID de facção se respawning todos]");

	if(strcmp("all", vehicle, true) == 0 && strcmp("todos", option, true) == 0)
	{
		for(new v = 1, x = GetVehiclePoolSize(); v <= x; v++)
		{
			if(IsVehicleSpawned(v) && FVehicleData[v][FVFaction] != 0)
			{
				if(VehicleBeingTowed(v)) continue;
				if(VehicleIsOccupied(v)) continue;

				RespawnFactionCar(v);
			}
		}
		SendClientMessageToAllLoggedF(COLOR_RED, "Admin %s respawnou TODOS os veículos de facção desocupados.", NameEx(playerid));
	}
	else if(strcmp("todos", vehicle, true) == 0)
	{
		if(strcmp(option, "-1", true) == 0 || !IsNumeric(option)) return SysMsg(playerid,"Use: /respawnvf todos [facção id]");

		new fid = strval(option);
		if(fid <= 0 || fid > MAX_FACTIONS-1) return SysMsg(playerid,"Número de facção inválido (check /fids)");

		new vcount = 0, tcount = 0;
		for(new v = 1, x = GetVehiclePoolSize(); v <= x; v++)
		{
			if(IsVehicleSpawned(v) && FVehicleData[v][FVFaction] == fid && !FVehicleData[v][FImpounded])
			{
				tcount ++;
				if(VehicleBeingTowed(v)) continue;
				if(VehicleIsOccupied(v)) continue;

				vcount ++;
				RespawnFactionCar(v);
			}
		}
		foreach(new i: Player) if(Logged{i} && Faction[i] == fid || playerid == i) SendClientMessageF(i, COLOR_ORANGE, "[Mensagem de facção] %s respawnou %i veiculos da facção %i.", NameEx(playerid), vcount, tcount);
	}
	else
	{
		new v = strval(vehicle);
		if(IsVehicleSpawned(v) && FVehicleData[v][FVFaction] >= 1)
		{
			if(VehicleBeingTowed(v)) return SysMsg(playerid, "Você não pode respawnar um veículo que está sendo rebocado.");
			if(VehicleIsOccupied(v)) return SysMsg(playerid, "Você não pode respawnar um veículo que está ocupado.");
			if(FVehicleData[v][FImpounded]) return SysMsg(playerid, "Você não pode respawnar um veiculo confiscado.");

			RespawnFactionCar(v);
			SendClientMessage(playerid, COLOR_ORANGE, "O veículo foi respawnado.");
		}
	}
	return true;
}
CMD:vid(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new VehId = GetPlayerVehicleID(playerid), Model = GetVehicleModel(VehId), Float:Pos[4], SurfingID = GetPlayerSurfingVehicleID(playerid), SeatID = GetPlayerVehicleSeat(playerid), cols[2];
	GetVehiclePos(VehId,Pos[0],Pos[1],Pos[2]);
	GetVehicleZAngle(VehId,Pos[3]);
	GetVehicleColors(VehId, cols[0], cols[1]);

	SysMsgF(playerid,"Veiculo ID: %i (Surfing ID: %i) | Model ID: %i | Meu lugar ID: %i | Pos: [X]%f, [Y]%f, [Z]%f, [ZA]%f",VehId,SurfingID,Model,SeatID,Pos[0],Pos[1],Pos[2],Pos[3]);

	if(VehId > 0) SysMsgF(playerid,"%s: Janelas: %i(Estado: %i), Motor: %i(Estado: %i), Porta-malas: %i, Assento: %i, Cor: %i,%i", GetVehicleName(VehId),VehicleHasWindows(VehId),WindowState{VehId},VehicleHasEngine(VehId),EngineStatus[VehId],VehicleHasTrunk(VehId),GetVehicleSeatCount(VehId),cols[0],cols[1]);
	return true;
}
CMD:vdamage(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(!IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid,"Você precisa estar em um veiculo.");

	new VehId = GetPlayerVehicleID(playerid);
	new panels, doors, lights, tires;
	GetVehicleDamageStatus(VehId, panels, doors, lights, tires);

	SysMsgF(playerid,"[%s damage] Painéis: %i, Portas: %i, Luzes: %i, Pneus: %i", GetVehicleName(VehId), panels, doors, lights, tires);
	return true;
}
CMD:avfechar(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new VehId = GetPlayerVehicleID(playerid);
	if(VehId == 0) return SysMsg(playerid,"Você precisa estar próximo ao veiculo para fechar.");

	if(Locked{VehId}) return SysMsgF(playerid,"[%s] Já está fechado.",GetVehicleName(VehId));

	Locked{VehId} = true;
	AdminLocked{VehId} = true;
	ToggleVehicleLock(VehId, 1);

	SendClientMessage(playerid, COLOR_GREEN, "> Veiculo Fechado. (Admin)");
	return true;
}
CMD:avabrir(playerid, params[])//abrir e fechar veiculo admin /avabrir //aabrir
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new VehId = GetPlayerVehicleID(playerid);

	if(VehId > 0)
	{
		if(!Locked{VehId}) return SysMsgF(playerid,"[%s] Já está destrancado.",GetVehicleName(VehId));
		Locked{VehId} = false;
		AdminLocked{VehId} = false;
		ToggleVehicleLock(VehId, 0);

		SendClientMessage(playerid, COLOR_GREEN, "> Veiculo Aberto. (Admin)");
	}
	else if(VehId == 0)
	{
		new v = GetClosestVehicle(playerid);
		if(AdminLocked{v})
		{
			new Float:vPos[3];
			GetVehiclePos(v, vPos[0], vPos[1], vPos[2]);
			if(IsPlayerInRangeOfPoint(playerid, 10.0, vPos[0], vPos[1], vPos[2]))
			{
				Locked{v} = false;
				AdminLocked{v} = false;
				ToggleVehicleLock(v, 0);

				SendClientMessage(playerid, COLOR_GREEN, "> Veiculo Aberto. (Admin)");
			}
		}
	}

	return true;
}
CMD:cars(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);

	new playa;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /cars [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsHelper{playerid} && playa != IsAssisting[playerid]) return SysMsg(playerid, "Você não pode usar este comando em um jogador que você não está ajudando.");

	new lockedTxt[9], Vcount = 0, sub[100];

	gstr[0] = EOS;
	for(new v = 1, x = GetVehiclePoolSize(); v <= x; v++)
	{
		if(Vcount < MAX_VEH_PER_PLAYER)
		{
			if(VehicleData[v][VehicleOwnerSQLID] == SQLID[playa])
			{
				if(VehicleData[v][IdVehicle] > 0)
				{
					if(Locked{v}) lockedTxt = "Locked";
					else lockedTxt = "Unlocked";

					if(VehicleData[v][Hotwired] == 1) lockedTxt = "Stolen";

					Vcount ++;
					format(sub, sizeof(sub), "%s - %s (ID: %i  Slot: %i  Reg: %s)\n", GetVehicleNameEx(VehicleData[v][VehicleModel]), lockedTxt, VehicleData[v][IdVehicle], v, VehicleData[v][RegPlate]);
					strcat(gstr, sub);
				}
			}
			else if(ImpoundData[v][iOwnerSQLID] == SQLID[playa])
			{
				if(ImpoundData[v][iImpoundTime] < 1) ImpoundData[v][iImpoundTime] = 0;
				if(ImpoundData[v][iImpoundTime] == 0) format(sub, sizeof(sub), "%s - Atualmente confinado (Aguardando busca)\n", GetVehicleNameEx(ImpoundData[v][iModel]));
				else format(sub, sizeof(sub), "%s - Atualmente confinado (%i minutos restantes)\n", GetVehicleNameEx(ImpoundData[v][iModel]), ImpoundData[v][iImpoundTime]);
				Vcount++;
				strcat(gstr, sub);
			}
			if(RepairData[v][rOwnerSQLID] == SQLID[playa])
			{
				if(RepairData[v][rTime] < gettime()) format(sub, sizeof(sub), "%s - Sendo trabalhado em %s (Aguardando busca)\n", GetVehicleNameEx(RepairData[v][rModel]), GetRepairGarageName(RepairData[v][rGarage]));
				else format(sub, sizeof(sub), "%s - Sendo trabalhado no %s\n", GetVehicleNameEx(RepairData[v][rModel]), GetRepairGarageName(RepairData[v][rGarage]));
				Vcount++;
				strcat(gstr, sub);
			}
		}
	}
	mysql_format(conn, mquery, sizeof(mquery), "SELECT VehicleModel FROM vehicles WHERE NeedsRecovery = 1 AND OwnerSQLID = %i", SQLID[playa]);
	mysql_pquery(conn, mquery, "TheirCarsRecovery", "iisi", playerid, playa, gstr, Vcount);
	return true;
}
CMD:gof(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new Float:Dist, playa = -1;
	if(sscanf(params, "fU(-1)", Dist, playa)) Dist = 3.0;
	if(InvalidPlayer(playa)) playa = playerid;

	new Float:X, Float:Y, Float:Z, Float:Ang;
	GetPlayerPos(playa, X, Y, Z);
	Ang = GetXYInFrontOfPlayer(playa, X, Y, Dist);
	SetPlayerPos(playa, X, Y, Z);
	SetPlayerFacingAngle(playa, Ang);
	return true;
}
CMD:goup(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new Float:Dist, playa = -1;
	if(sscanf(params, "fU(-1)", Dist, playa)) Dist = 3.0;
	if(InvalidPlayer(playa)) playa = playerid;

	SetPlayerPos(playa, PlayerPosX(playa), PlayerPosY(playa), PlayerPosZ(playa) + Dist);
	return true;
}
CMD:godown(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new Float:Dist, playa = -1;
	if(sscanf(params, "fU(-1)", Dist, playa)) Dist = 3.0;
	if(InvalidPlayer(playa)) playa = playerid;

	SetPlayerPos(playa, PlayerPosX(playa), PlayerPosY(playa), PlayerPosZ(playa) - Dist);
	return true;
}
CMD:tele(playerid, params[]) return cmd_teleporte(playerid, params);
CMD:tp(playerid, params[]) return cmd_teleporte(playerid, params);

CMD:teleporte(playerid, params[])
{
	gstr[0] = EOS;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa))
	{
		for(new i = 0; i < sizeof(Teleports); i++)
		{
			format(tgstr, sizeof(tgstr), "%s\n", Teleports[i][TPName]);
			strcat(gstr, tgstr);
		}
		new vehicleid = GetPlayerVehicleID(playerid);

		if(vehicleid != 0) SetPVarInt(playerid, "tpVID", vehicleid);
		SetPVarInt(playerid, "tpID", playerid);
		Dialog_Show(playerid, TPList, DIALOG_STYLE_LIST, "Teleporta você mesmo ...", gstr, "Teleporte", "Cancelar");
		return true;
	}

	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(IsJailed[playa] == 1) return SysMsg(playerid,"Este jogador está em jail.");
	if(IsCuffed[playa] == 1) return SysMsg(playerid,"That player is in cuffs.");

	new vehicleid = GetPlayerVehicleID(playa);

	if(vehicleid != 0) SetPVarInt(playerid, "tpVID", vehicleid);
	SetPVarInt(playerid, "tpID", playa);

	for(new i = 0; i < sizeof(Teleports); i++)
	{
		format(tgstr, sizeof(tgstr), "%s\n", Teleports[i][TPName]);
		strcat(gstr, tgstr);
	}
	Dialog_Show(playerid, TPList, DIALOG_STYLE_LIST, "Teleporta Jogador ...", gstr, "Teleporte", "Cancelar");
	return true;
}
CMD:tpto(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Use: /tpto [nome de teletransporte da lista do /tp] *Use /tptop para outros jogadores*");

	new p = -1;
	for(new x = 0; x < sizeof(Teleports); x++)
	{
		if(strfind(Teleports[x][TPName], params, true) != -1)
		{
			p = x;
			break;
		}
	}
	if(p == -1) return SysMsg(playerid, "Não é possível encontrar o nome teleport.");

	if(IsPlayerInAnyVehicle(playerid))
	{
		new v = GetPlayerVehicleID(playerid);
		SetVehiclePos(v, Teleports[p][TPx],Teleports[p][TPy],Teleports[p][TPz]);
		foreach(new i: Player)
		{
			if(IsPlayerInVehicle(i, v))
			{
				SetPlayerVirtualWorldEx(i ,Teleports[p][TPVw]);
				SetPlayerInterior(i, Teleports[p][TPInt]);
			}
		}
		LinkVehicleToInteriorEx(v, Teleports[p][TPInt]);
		SetVehicleVirtualWorld(v, Teleports[p][TPVw]);
		if(IsInHouseID[playerid] != -1) IsInHouseID[playerid] = -1;
		if(IsInBizzID[playerid] != -1) IsInBizzID[playerid] = -1;
		if(IsInGarageID[playerid] != -1) IsInGarageID[playerid] = -1;
		SendClientMessageF(playerid, COLOR_LIGHTBLUE, "Admin %s teleportou você para %s.",NameEx(playerid),Teleports[p][TPName]);
		format(gstr, sizeof(gstr),"[Admin] %s teleportou %s para %s", NameEx(playerid),NameEx(playerid),Teleports[p][TPName]);
		AdminBroadcast(gstr, 1);
		format(gstr, sizeof(gstr), "Teleportado para %s", Teleports[p][TPName]);
		AdminLog(playerid, SQLID[playerid], GetName(playerid), gstr);
		return true;
	}
	else
	{
		SetPlayerPos(playerid,Teleports[p][TPx],Teleports[p][TPy],Teleports[p][TPz]);
		SetPlayerFacingAngle(playerid,Teleports[p][TPa]);
		SetPlayerInterior(playerid,Teleports[p][TPInt]);
		SetPlayerVirtualWorldEx(playerid,Teleports[p][TPVw]);
		if(IsInHouseID[playerid] != -1) IsInHouseID[playerid] = -1;
		if(IsInBizzID[playerid] != -1) IsInBizzID[playerid] = -1;
		if(IsInGarageID[playerid] != -1) IsInGarageID[playerid] = -1;
		JourneyInterior[playerid] = 0;
		ShamalInterior[playerid] = 0;
		TropicInterior[playerid] = 0;
		TrailerInterior[playerid] = 0;
		SendClientMessageF(playerid,COLOR_LIGHTBLUE, "Admin %s teleportou você para %s.",NameEx(playerid), Teleports[p][TPName]);
		format(gstr, sizeof(gstr),"[Admin] %s teleportou %s para %s.",NameEx(playerid),NameEx(playerid), Teleports[p][TPName]);
		AdminBroadcast(gstr, 1);
		format(gstr, sizeof(gstr), "Teleportado para %s", Teleports[p][TPName]);
		AdminLog(playerid, SQLID[playerid], GetName(playerid), gstr);
		return true;
	}
}
CMD:tptop(playerid, params[])//teleportar jogador
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new loc[32], player = -1;
	if(sscanf(params, "us[32]", player, loc)) return SysMsg(playerid, "Use: /tptop [ID ou nome do jogador] [teleport nome de /tp list]");
	if(InvalidPlayer(player)) return SysMsg(playerid, NOPLAYER);

	new p = -1;
	for(new x = 0; x < sizeof(Teleports); x++)
	{
		if(strfind(Teleports[x][TPName], loc, true) != -1)
		{
			p = x;
			break;
		}
	}
	if(p == -1) return SysMsg(playerid, "Não é possível encontrar o nome teleporte.");

	if(IsPlayerInAnyVehicle(player))
	{
		new v = GetPlayerVehicleID(player);
		SetVehiclePos(v, Teleports[p][TPx],Teleports[p][TPy],Teleports[p][TPz]);
		foreach(new i: Player)
		{
			if(IsPlayerInVehicle(i, v))
			{
				SetPlayerVirtualWorldEx(i ,Teleports[p][TPVw]);
				SetPlayerInterior(i, Teleports[p][TPInt]);
			}
		}
		LinkVehicleToInteriorEx(v, Teleports[p][TPInt]);
		SetVehicleVirtualWorld(v, Teleports[p][TPVw]);
		if(IsInHouseID[player] != -1) IsInHouseID[player] = -1;
		if(IsInBizzID[player] != -1) IsInBizzID[player] = -1;
		if(IsInGarageID[player] != -1) IsInGarageID[player] = -1;
		SendClientMessageF(player, COLOR_LIGHTBLUE, "Admin %s teleportou você para %s.",NameEx(playerid),Teleports[p][TPName]);
		format(gstr, sizeof(gstr),"[Admin] %s teleportou %s para %s", NameEx(playerid),NameEx(player),Teleports[p][TPName]);
		AdminBroadcast(gstr, 1);
		format(gstr, sizeof(gstr), "Teleportado para %s", Teleports[p][TPName]);
		AdminLog(playerid, SQLID[player], GetName(player), gstr);
		return true;
	}
	else
	{
		SetPlayerPos(player,Teleports[p][TPx],Teleports[p][TPy],Teleports[p][TPz]);
		SetPlayerFacingAngle(player,Teleports[p][TPa]);
		SetPlayerInterior(player,Teleports[p][TPInt]);
		SetPlayerVirtualWorldEx(player,Teleports[p][TPVw]);
		if(IsInHouseID[player] != -1) IsInHouseID[player] = -1;
		if(IsInBizzID[player] != -1) IsInBizzID[player] = -1;
		if(IsInGarageID[player] != -1) IsInGarageID[player] = -1;
		JourneyInterior[player] = 0;
		ShamalInterior[player] = 0;
		TropicInterior[player] = 0;
		TrailerInterior[player] = 0;
		SendClientMessageF(player,COLOR_LIGHTBLUE, "Admin %s teleportou você para %s.",NameEx(playerid), Teleports[p][TPName]);
		format(gstr, sizeof(gstr),"[Admin] %s teleportou %s para %s.",NameEx(playerid),NameEx(player), Teleports[p][TPName]);
		AdminBroadcast(gstr, 1);
		format(gstr, sizeof(gstr), "Teleportado para %s", Teleports[p][TPName]);
		AdminLog(playerid, SQLID[player], GetName(player), gstr);
		return true;
	}
}
CMD:trazer(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(IsJailed[playerid] == 1) return SysMsg(playerid,"Aguarde até sair da prisão.");
	if(IsCuffed[playerid] == 1) return SysMsg(playerid,"Esta ação não pode ser executada enquanto você estiver em algemas.");

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /trazer [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(IsJailed[playa] == 1) return SysMsg(playerid,"Este jogador está em jail.");
	if(IsSpectating[playa] >= 0) return SysMsg(playerid,"Você não pode usar este comando em uma pessoa spectando.");

	new Float:pX,Float:pY,Float:pZ;
	new InteriorId,VirtualWorldId;

	GetPlayerPos(playerid,pX,pY,pZ);
	InteriorId = GetPlayerInterior(playerid);
	VirtualWorldId = GetPlayerVirtualWorld(playerid);

	if(!IsPlayerInAnyVehicle(playa)) Teleport(playa, pX + 1.0, pY + 1.0, pZ + 2.0, 0.0, InteriorId, VirtualWorldId);
	else
	{
		new TargetsVehicleId = GetPlayerVehicleID(playa);
		SetVehiclePos(TargetsVehicleId, pX + 2.0, pY + 2.0, pZ + 5.0);
		SetVehicleVirtualWorld(TargetsVehicleId, VirtualWorldId);
		LinkVehicleToInteriorEx(TargetsVehicleId, InteriorId);
		SetPlayerVirtualWorldEx(playa, VirtualWorldId);
		SetPlayerInterior(playa, InteriorId);
	}

	if(IsInHouseID[playa] != -1)
	{
		if(HouseData[IsInHouseID[playa]][HMusicPlaying] == 1)
		{
			StopAudioStreamForPlayer(playa);
		}
	}
	if(IsInHouseID[playerid] != -1)
	{
		IsInHouseID[playa] = IsInHouseID[playerid];
		if(HouseData[IsInHouseID[playerid]][HMusicPlaying] == 1)
		{
			StopAudioStreamForPlayer(playa);
			PlayAudioStreamForPlayerEx(playa, HouseData[IsInHouseID[playerid]][HMusic]);
			ListeningBoom[playa] = -1;
		}
	}
	if(IsInBizzID[playa] != -1)
	{
		if(BizzData[IsInBizzID[playa]][BMusicPlaying] == 1)
		{
			StopAudioStreamForPlayer(playa);
		}
	}
	if(IsInBizzID[playerid] != -1)
	{
		IsInBizzID[playa] = IsInBizzID[playerid];
		if(BizzData[IsInBizzID[playerid]][BMusicPlaying] == 1)
		{
			StopAudioStreamForPlayer(playa);
			PlayAudioStreamForPlayerEx(playa, BizzData[IsInBizzID[playerid]][BMusic]);
			ListeningBoom[playa] = -1;
		}
	}
	if(IsInGarageID[playerid] != -1)
	{
		IsInGarageID[playa] = IsInGarageID[playerid];
	}

	JourneyInterior[playa] = JourneyInterior[playerid];
	ShamalInterior[playa] = ShamalInterior[playerid];
	TropicInterior[playa] = TropicInterior[playerid];
	TrailerInterior[playa] = TrailerInterior[playerid];

	SendClientMessageF(playa, COLOR_LIGHTBLUE, "Admin %s te teleportou a sua posição.",NameEx(playerid));
	SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Você teleportou o jogador %s para sua posição.",NameEx(playa));
	AdminLog(playerid, SQLID[playa], GetName(playa), "Jogador puxado");
	return true;
}
CMD:vget(playerid, params[])
{
	new vehicleid, player;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(sscanf(params, "ii", player, vehicleid)) return SysMsg(playerid, "Use: /vget [playerid] [vehicleid]");
	if(InvalidPlayer(player)) return SysMsg(playerid,"ID inválido.");
	if(IsPlayerNPC(player)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(!Logged{player}) return SysMsg(playerid,"Não está logado");
	if(vehicleid < 1 || vehicleid > MAX_VEHICLES || !IsVehicleSpawned(vehicleid)) return SysMsg(playerid, "You have specified an Veiculo ID inválido.");
	if(IsPlayerInAnyVehicle(player)) return SysMsg(playerid, "Esse jogador já está em um veículo.");

	new seatid = GetVehicleAvailableSeat(vehicleid);
	if(seatid == -1) return SysMsg(playerid, "Não há lugares para entrar.");
	PutPlayerInVehicle(player, vehicleid, seatid);
	return true;
}
CMD:ir(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, playa2 = -1;
	if(sscanf(params, "uU(-1)", playa, playa2)) return SysMsg(playerid,"Use: /ir [ID do jogador] [Optional: Jogador sendo teletransportado]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsSpectating[playa] >= 0) return SysMsg(playerid, "Você não pode se teletransportar para alguém enquanto está vislumbrando outro jogador.");
	if(!Logged{playa}) return SysMsg(playerid, "Este jogador não iniciou sessão (Não está logado).");
	new Float:pX, Float:pY, Float:pZ;

	if(playa2 == -1)
	{
		GetPlayerPos(playa,pX,pY,pZ);

		if(IsSpectating[playerid] >= 0) cmd_spectateoff(playerid);

		if(IsPlayerInAnyVehicle(playerid))
		{
			SetVehiclePos(GetPlayerVehicleID(playerid),pX + 3.5,pY + 3.5,pZ);
			SetVehicleVirtualWorld(GetPlayerVehicleID(playerid),GetPlayerVirtualWorld(playa));
			LinkVehicleToInteriorEx(GetPlayerVehicleID(playerid), GetPlayerInterior(playa));
			SetPlayerInterior(playerid,GetPlayerInterior(playa));
			SetPlayerVirtualWorldEx(playerid,GetPlayerVirtualWorld(playa));
		}
		else Teleport(playerid, pX+2, pY+2, pZ, 0.0, GetPlayerInterior(playa), GetPlayerVirtualWorld(playa));

		SendClientMessageF(playerid, COLOR_LIGHTGREEN,"Você se teleportou até %s", NameEx(playa));
		SendClientMessageF(playa, COLOR_SKYBLUE, "Admin %s se teleportou a sua posição.", NameEx(playerid));

		IsInHouseID[playerid] = IsInHouseID[playa];
		IsInBizzID[playerid] = IsInBizzID[playa];
		IsInGarageID[playerid] = IsInGarageID[playa];

		if(IsInHouseID[playa] != -1)
		{
			StopAudioStreamForPlayer(playerid);
			if(HouseData[IsInHouseID[playa]][HMusicPlaying] == 1) PlayAudioStreamForPlayerEx(playerid, HouseData[IsInHouseID[playa]][HMusic]);
		}
		if(IsInBizzID[playa] != -1)
		{
			StopAudioStreamForPlayer(playerid);
			if(BizzData[IsInBizzID[playa]][BMusicPlaying] == 1) PlayAudioStreamForPlayerEx(playerid, BizzData[IsInBizzID[playa]][BMusic]);
		}

		JourneyInterior[playerid] = 0;
		ShamalInterior[playerid] = 0;
		TropicInterior[playerid] = 0;
		TrailerInterior[playerid] = 0;

		format(gstr, sizeof(gstr), "Jogador teleportado", GetName(playa));
		AdminLog(playerid, SQLID[playa], GetName(playa), "Jogador teleportado");
	}
	else if(IsPlayerConnected(playa2))
	{
		GetPlayerPos(playa,pX,pY,pZ);

		if(IsSpectating[playa2] >= 0) cmd_spectateoff(playa2);

		if(IsPlayerInAnyVehicle(playa2))
		{
			SetVehiclePos(GetPlayerVehicleID(playa2),pX + 3.5,pY + 3.5,pZ);
			SetVehicleVirtualWorld(GetPlayerVehicleID(playa2),GetPlayerVirtualWorld(playa));
			LinkVehicleToInteriorEx(GetPlayerVirtualWorld(playa2), GetPlayerInterior(playa));
		}
		else SetPlayerPos(playa2,pX+2,pY+2,pZ);

		SetPlayerInterior(playa2,GetPlayerInterior(playa));
		SetPlayerVirtualWorldEx(playa2,GetPlayerVirtualWorld(playa));

		IsInHouseID[playa2] = IsInHouseID[playa];
		IsInBizzID[playa2] = IsInBizzID[playa];
		IsInGarageID[playa2] = IsInGarageID[playa];

		if(IsInHouseID[playa] != -1)
		{
			StopAudioStreamForPlayer(playa2);
			if(HouseData[IsInHouseID[playa]][HMusicPlaying] == 1) PlayAudioStreamForPlayerEx(playa2, HouseData[IsInHouseID[playa]][HMusic]);
		}
		if(IsInBizzID[playa] != -1)
		{
			StopAudioStreamForPlayer(playa2);
			if(BizzData[IsInBizzID[playa]][BMusicPlaying] == 1) PlayAudioStreamForPlayerEx(playa2, BizzData[IsInBizzID[playa]][BMusic]);
		}

		JourneyInterior[playa] = JourneyInterior[playa2];
		ShamalInterior[playa] = ShamalInterior[playa2];
		TropicInterior[playa] = TropicInterior[playa2];
		TrailerInterior[playa] = TrailerInterior[playa2];

		if(IsJailed[playa2] == 1) return SysMsg(playerid,"Esse jogador atualmente está em Preso.");
		if(IsCuffed[playa2] == 1) return SysMsg(playerid,"Esse jogador atualmente está algemado.");
		if(IsSpectating[playa2] >= 0) return SysMsg(playerid,"O jogador atualmente está atualmente");

		SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Você teletransportou %s[ID %i] para %s[ID %i]", NameEx(playa2), playa2, NameEx(playa), playa);
		SendClientMessageF(playa2, COLOR_TURQUOISE, "Admin %s te teletransportou para posição de %s.", NameEx(playerid), NameEx(playa));
		format(gstr, sizeof(gstr), "Jogador teletransportado para %s", GetName(playa));
		AdminLog(playerid, SQLID[playa2], GetName(playa2), gstr);
	}
	return true;
}
CMD:ircasa(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new hname[32],h;
	if(sscanf(params, "s[32]", hname)) return SysMsg(playerid,"Use: /ircasa [Nome da casa]");

	h = GetHouseLocation(hname);
	new vehid_P = GetPlayerVehicleID(playerid);
	new vw = 0;

	if(h != -1)
	{
		if(strfind(HouseData[h][HouseDescription], "Flat") != -1) vw = 2;
		if(vehid_P == 0)
		{
			SetPlayerPos(playerid, HouseData[h][oPosX],HouseData[h][oPosY],HouseData[h][oPosZ]);
			SetPlayerVirtualWorldEx(playerid, HouseData[h][HouseExtVW]);
			SetPlayerInterior(playerid, vw);

			IsInHouseID[playerid] = -1;
			IsInGarageID[playerid] = -1;
			IsInBizzID[playerid] = -1;
		}
		else
		{
			SetVehiclePos(vehid_P, HouseData[h][oPosX],HouseData[h][oPosY],HouseData[h][oPosZ]);
			SetVehicleVirtualWorld(vehid_P,HouseData[h][HouseExtVW]);
			LinkVehicleToInteriorEx(vehid_P,vw);
			SetPlayerInterior(playerid,vw);

			IsInHouseID[playerid] = -1;
			IsInGarageID[playerid] = -1;
			IsInBizzID[playerid] = -1;
		}
	}
	else return SysMsg(playerid, "Endereço inválido da casa");
	return true;
}
CMD:irnegocio(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new hname[32],h;
	if(sscanf(params, "s[32]", hname)) return SysMsg(playerid,"Use: /irnegocio [Nome do Negócio]");

	h = GetBizzLocation(hname);
	new vehid_P = GetPlayerVehicleID(playerid);

	if(h != -1)
	{
		if(vehid_P == 0)
		{
			SetPlayerPos(playerid, BizzData[h][oPosX],BizzData[h][oPosY],BizzData[h][oPosZ]);
			SetPlayerVirtualWorldEx(playerid,0);
			SetPlayerInterior(playerid, 0);

			IsInHouseID[playerid] = -1;
			IsInGarageID[playerid] = -1;
			IsInBizzID[playerid] = -1;
		}
		else
		{
			SetVehiclePos(vehid_P, BizzData[h][oPosX],BizzData[h][oPosY],BizzData[h][oPosZ]);
			SetVehicleVirtualWorld(vehid_P,0);
			LinkVehicleToInteriorEx(vehid_P, 0);
			SetPlayerVirtualWorldEx(playerid, 0);
			SetPlayerInterior(playerid, 0);

			IsInHouseID[playerid] = -1;
			IsInGarageID[playerid] = -1;
			IsInBizzID[playerid] = -1;
		}
	}
	else return SysMsg(playerid, "Endereço de negócios inválido");
	return true;
}
CMD:irveh(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(IsJailed[playerid] == 1) return SysMsg(playerid,"Aguarde até sair da prisão.");
	if(IsCuffed[playerid] == 1) return SysMsg(playerid,"Esta ação não pode ser executada enquanto você estiver em algemas.");

	new vid, id;
	if(sscanf(params, "iI(-1)", vid, id)) return SysMsg(playerid,"Use: /irveh [Veiculo ID] [Optional: Jogador sendo teletransportado]");

	if(!IsVehicleSpawned(vid)) return SysMsg(playerid,"Nenhum Veiculo ID gerou.");

	new Float:vX, Float:vY, Float:vZ;
	GetVehiclePos(vid, vX, vY, vZ);
	new vehid = GetPlayerVehicleID(playerid);

	if(id == -1)
	{
		if(IsSpectating[playerid] >= 0) cmd_spectateoff(playerid);
		if(IsInHouseID[playerid] != -1) IsInHouseID[playerid] = -1;
		if(IsInBizzID[playerid] != -1) IsInBizzID[playerid] = -1;

		if(vehid == 0)
		{
			SetPlayerPos(playerid, vX, vY, vZ + 4.0);
			SetPlayerVirtualWorldEx(playerid, GetVehicleVirtualWorld(vid));
			if(FVehicleData[vid][FVSQLID] > 0) SetPlayerInterior(playerid, FVehicleData[vid][TempFVInterior]);
			else SetPlayerInterior(playerid, 0);
		}
		else
		{
			SetVehiclePos(vehid, vX + 4.0, vY + 4.0, vZ + 4.0);
			SetVehicleVirtualWorld(vehid, GetVehicleVirtualWorld(vid));
			if(FVehicleData[vid][FVSQLID] > 0)
			{
				LinkVehicleToInteriorEx(vehid, FVehicleData[vid][TempFVInterior]);
				if(IsFactionVehicle(vehid)) FVehicleData[vehid][TempFVInterior] = FVehicleData[vid][TempFVInterior];
			}
			else LinkVehicleToInterior(vehid, 0);
		}
		SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Você se teletransportou para um %s [ID %i]", GetVehicleName(vid), vid);
	}
	else if(IsPlayerConnected(id))
	{
		if(IsSpectating[id] >= 0) cmd_spectateoff(id);
		if(IsInHouseID[id] != -1) IsInHouseID[id] = -1;
		if(IsInBizzID[id] != -1) IsInBizzID[id] = -1;

		if(vehid == 0)
		{
			SetPlayerPos(id, vX, vY, vZ + 4.0);
			SetPlayerVirtualWorldEx(id, GetVehicleVirtualWorld(vid));
			if(FVehicleData[vid][FVSQLID] > 0) SetPlayerInterior(id, FVehicleData[vid][TempFVInterior]);
			else SetPlayerInterior(id, 0);
		}
		else
		{
			SetVehiclePos(vehid, vX + 4.0, vY + 4.0, vZ + 4.0);
			SetVehicleVirtualWorld(vehid, GetVehicleVirtualWorld(vid));
			if(FVehicleData[vid][FVSQLID] > 0)
			{
				LinkVehicleToInteriorEx(vehid, FVehicleData[vid][TempFVInterior]);
				if(IsFactionVehicle(vehid)) FVehicleData[vehid][TempFVInterior] = FVehicleData[vid][TempFVInterior];
			}
			else LinkVehicleToInterior(vehid, 0);
		}
		SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Você teletransportou %s para %s [ID %i]", NameEx(id), GetVehicleName(vid), vid);
		SendClientMessageF(id, COLOR_TURQUOISE, "Admin %s teletransportou você para um %s [ID %i]", NameEx(playerid), GetVehicleName(vid), vid);
	}
	return true;
}
CMD:getv(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(IsJailed[playerid] == 1) return SysMsg(playerid,"Aguarde até sair da prisão.");
	if(IsCuffed[playerid] == 1) return SysMsg(playerid,"Esta ação não pode ser executada enquanto você estiver em algemas.");

	if(isnull(params)) return SysMsg(playerid,"Use: /getv [Veiculo ID]");
	if(!IsNumeric(params)) return SysMsg(playerid,"Veiculo ID deve ser um número.");

	new vehicleid = strval(params);
	if(vehicleid < 1) return SysMsg(playerid,"Veículo inválido.");
	if(!IsVehicleSpawned(vehicleid)) return SysMsg(playerid,"Nenhum veiculo com esse ID está spawnado.");

	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

	LinkVehicleToInteriorEx(vehicleid, GetPlayerInterior(playerid));
	SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));

	SetVehiclePos(vehicleid, x+4, y+4, z+4);
	return true;
}
CMD:explodir(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	if(IsJailed[playerid] == 1) return SysMsg(playerid,"Aguarde até sair da prisão.");
	if(IsCuffed[playerid] == 1) return SysMsg(playerid,"Esta ação não pode ser executada enquanto você estiver em algemas.");

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /explodir [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsJailed[playa] == 1) return SysMsg(playerid,"Este jogador está em jail.");

	new Float:pX,Float:pY,Float:pZ;

	GetPlayerPos(playa,pX,pY,pZ);
	CreateExplosion(pX,pY,pZ,0,10);
	CreateExplosion(pX,pY,pZ,0,10);
	CreateExplosion(pX,pY,pZ,0,10);

	AdminLog(playerid, SQLID[playa], GetName(playa), "Explode");
	return true;
}
CMD:fakeme(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, action[128];
	if(sscanf(params, "us[128]", playa, action)) return SysMsg(playerid,"Use: /fakeme [playerid/name] [ação]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

	format(gstr, sizeof(gstr), "%s %s",NameEx(playa),action);
	ProxDetector(20.0,playa,gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
	return true;
}
CMD:fakedo(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, action[128];
	if(sscanf(params, "us[128]", playa, action)) return SysMsg(playerid,"Use: /fakedo [playerid/name] [ação]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

	format(gstr, sizeof(gstr), "%s ((%s))",action,NameRP(playa));
	ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
	return true;
}
CMD:disarm(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /disarm [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

	ResetPlayerWeaponsEx(playa);
	SyncPlayerWeapons(playa);

	format(gstr, sizeof(gstr),"Admin %s desarmou você.",NameEx(playerid));
	SendClientMessage(playa, COLOR_LIGHTGREEN, gstr);
	format(gstr, sizeof(gstr),"Você desarmou %s.",NameEx(playa));
	SendClientMessage(playerid, COLOR_LIGHTGREEN, gstr);
	AdminLog(playerid, SQLID[playa], GetName(playa), "Desarmado");
	return true;
}
CMD:rspec(playerid)
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new str[10], rand = GetRandomOnlinePlayer();
	while(rand != playerid && Logged{rand} && IsSpectating[rand] != -1)
	{
		rand = GetRandomOnlinePlayer();
	}
	format(str, sizeof(str), "%i", rand);
	cmd_spectate(playerid, str);
	return true;
}
CMD:spec(playerid, params[]) return cmd_spectate(playerid, params);

CMD:spectate(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /spec [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(playa == playerid) return SysMsg(playerid,"Você não pode specta a si mesmo.");
	if(!Logged{playa}) return SysMsg(playerid, "Este jogador não iniciou sessão. Aguarde até ter iniciado sessão para especificá-los.");
	if(IsSpectating[playa] >= 0) return SysMsg(playerid,"Você não pode falar sobre uma pessoa que também está se encontrando.");
	if(PfSpec[playa][FlySpec] == 1) return SysMsg(playerid, "Você não pode especificar uma pessoa que está usando /fly.");
	if(MasterAccount[playa] == 29469 && MasterAccount[playerid] == 19025) return SysMsg(playerid, "Boa tentativa, camarada. Ame, Emmalee");

	if(IsSpectating[playerid] == -1)
	{
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		TempInfo[playerid][tmX] = X;
		TempInfo[playerid][tmY] = Y;
		TempInfo[playerid][tmZ] = Z;
		TempInfo[playerid][tSkin] = GetPlayerCustomSkin(playerid);
		if(!TempInfo[playerid][tSkin]) { TempInfo[playerid][tSkin] = GetPlayerSkin(playerid); }
		TempInfo[playerid][tInt] = GetPlayerInterior(playerid);
		TempInfo[playerid][tVW] = GetPlayerVirtualWorld(playerid);
	}
	if(PfSpec[playerid][FlySpec] == 1)
	{
		PfSpec[playerid][FlySpec] = 0;
		TogglePlayerSpectating(playerid, false);
		if(IsValidObject(PfSpec[playerid][fsobj]))
			DestroyPlayerObject(playerid, PfSpec[playerid][fsobj]);
	}

	SetPlayerInterior(playerid, GetPlayerInterior(playa));
	SetPlayerVirtualWorldEx(playerid, GetPlayerVirtualWorld(playa));
	TogglePlayerSpectating(playerid, 1);

	new tVehId = GetPlayerVehicleID(playa);

	if(tVehId > 0)
	{
		PlayerSpectateVehicle(playerid, tVehId, SPECTATE_MODE_NORMAL);
		SysMsgF(playerid, "Você está agora observando %s (no veículo) Use /specoff para retornar ao normal.",NameEx(playa));
		IsSpectating[playerid] = playa;
		PlayerTextDrawShow(playerid, pSpecTD[playerid]);
		format(gstr, sizeof(gstr), "Spectando ~P~%s (%i)", NameEx(playa), playa);
		PlayerTextDrawSetString(playerid, pSpecTD[playerid], gstr);
	}
	else
	{
		PlayerSpectatePlayer(playerid, playa, SPECTATE_MODE_NORMAL);
		SysMsgF(playerid, "Você está agora observando %s (a pé) Use /specoff para retornar ao normal.",NameEx(playa));
		IsSpectating[playerid] = playa;
		PlayerTextDrawShow(playerid, pSpecTD[playerid]);
		format(gstr, sizeof(gstr), "Spectando ~P~%s (%i)", NameEx(playa), playa);
		PlayerTextDrawSetString(playerid, pSpecTD[playerid], gstr);
	}

	AdminLog(playerid, SQLID[playa], GetName(playa), "Spectate");
	return true;
}
CMD:fly(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(PfSpec[playerid][FlySpec] == 0) StartFlyEditor(playerid);
	else if(PfSpec[playerid][FlySpec] == 1) EndFlyEditor(playerid);
	return true;
}
CMD:vspec(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);

	new vehicleid = 0;
	if(isnull(params)) return SysMsg(playerid,"Use: /vspec [Veiculo ID]");
	if(!IsNumeric(params) && strval(params) > 0) return SysMsg(playerid,"Use: /vspec [Veiculo ID]");
	vehicleid = strval(params);
	if(vehicleid > MAX_VEHICLES) return SysMsg(playerid, "Veículo inválido.");
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);
	if(IsHelper{playerid} && IsAssisting[playerid] == -1) return SysMsg(playerid, "Você não pode usar este comando se você não estiver em uma assistência.");
	if(IsHelper{playerid} && IsAssisting[playerid] != -1 && VehicleData[vehicleid][VehicleOwnerSQLID] != SQLID[IsAssisting[playerid]]) return SysMsg(playerid, "Você só pode spectar o veículo do jogador que você está ajudando atualmente.");
	if(!IsVehicleSpawned(vehicleid)) return SysMsg(playerid,"Veiculo ID inválido.");

	if(IsSpectating[playerid] == -1)
	{
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		TempInfo[playerid][tmX] = X;
		TempInfo[playerid][tmY] = Y;
		TempInfo[playerid][tmZ] = Z;
		TempInfo[playerid][tSkin] = GetPlayerSkin(playerid);
		TempInfo[playerid][tInt] = GetPlayerInterior(playerid);
		TempInfo[playerid][tVW] = GetPlayerVirtualWorld(playerid);
	}

	TogglePlayerSpectating(playerid, 1);
	SetPlayerVirtualWorldEx(playerid, GetVehicleVirtualWorld(vehicleid));
	if(FVehicleData[vehicleid][FVSQLID] > 0) SetPlayerInterior(playerid, FVehicleData[vehicleid][TempFVInterior]);

	PlayerSpectateVehicle(playerid, vehicleid, SPECTATE_MODE_NORMAL);
	SysMsgF(playerid, "Agora você está spectando o viculo ID %i (%s). Use /specoff para voltar ao normal.",vehicleid,GetVehicleNameEx(GetVehicleModel(vehicleid)));
	IsSpectating[playerid] = 1000;
	return true;
}
CMD:specoff(playerid) return cmd_spectateoff(playerid);
CMD:spectateoff(playerid)
{
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);
	if(IsSpectating[playerid] == -1) return SysMsg(playerid,"Você não está spectando.");
	TogglePlayerSpectating(playerid, 0);
	SetPlayerPos(playerid, TempInfo[playerid][tmX], TempInfo[playerid][tmY], TempInfo[playerid][tmZ]);
	SetPlayerInterior(playerid, TempInfo[playerid][tInt]);
	SetPlayerVirtualWorldEx(playerid, TempInfo[playerid][tVW]);
	SetPlayerSkinEx(playerid, TempInfo[playerid][tSkin]);
	IsSpectating[playerid] = -2;
	SyncPlayerWeapons(playerid);
	SetTimerEx("UnFreezePlayer", 200, 0, "d", playerid);

	ClearTempInfo(playerid);
	if(PfSpec[playerid][FlySpec] == 1) PfSpec[playerid][FlySpec] = 0;

	for(new ao = 0; ao < 10; ao++)
	{
		if(AttachedObjects[playerid][ao][aoModelID] > 0)
		{
			SetPlayerAttachedObject(playerid, ao, AttachedObjects[playerid][ao][aoModelID], AttachedObjects[playerid][ao][aoBone], AttachedObjects[playerid][ao][aoOffset][0], AttachedObjects[playerid][ao][aoOffset][1],
				AttachedObjects[playerid][ao][aoOffset][2], AttachedObjects[playerid][ao][aoRot][0], AttachedObjects[playerid][ao][aoRot][1], AttachedObjects[playerid][ao][aoRot][2], AttachedObjects[playerid][ao][aoScale][0],
					AttachedObjects[playerid][ao][aoScale][1], AttachedObjects[playerid][ao][aoScale][2], AttachedObjects[playerid][ao][aoColor], AttachedObjects[playerid][ao][aoColor]);
		}
	}

	PlayerTextDrawHide(playerid, pSpecTD[playerid]);
	//TextDrawHideForPlayer(playerid, SpeedText[IsSpectating[playerid]]);
	return true;
}
CMD:quemspec(playerid, params[])
{
	new count = 0;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	foreach(new i: Player)
	{
		if(IsSpectating[i] != -1 && AdminLevel[i] >= 1 && IsSpectating[i] != 1000)
		{
			SendClientMessageF(playerid, COLOR_WHITE, "O adminstrador %s está spectando %s.", NameEx(i), NameEx(IsSpectating[i]));
			count++;
		}
	}
	if(count == 0) return SysMsg(playerid, "Ninguem está spectando.");
	return true;
}
CMD:fach(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, achievID;
	if(sscanf(params, "ui", playa, achievID)) return SysMsg(playerid,"Use: /fach [ID ou nome do jogador] [achievement id]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(!Logged{playa}) return SysMsg(playerid,"Player Id is Não está logado");

	if(achievID < 1 || achievID >= MAX_ACHS) return SysMsg(playerid,"Realização inválida.");

	UnlockAchievement(playa, achievID);
	SendClientMessageF(playa, COLOR_LIGHTGREEN, "Admin %s desbloqueou a conquista %i para você.", NameEx(playerid), achievID);
	SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Você desbloqueou a conquista %i para %s.", achievID, NameEx(playa));
	format(gstr, sizeof(gstr), "Conquista desbloqueada %i", achievID);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	return true;
}
CMD:veiculosarea(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Use: /veiculosarea [Nome do modelo]");

	new v = GetVehicleModelIdFromName(params), count = 0;

	gstr[0] = EOS;
	foreach(new i: Player)
	{
		if(GetVehicleModel(GetPlayerVehicleID(i)) == v)
		{
			new zone[MAX_ZONE_NAME];
			GetPlayer3DZone(i, zone, MAX_ZONE_NAME);

			format(gstr, sizeof(gstr), "%s%s (ID: %i, Loc: %s) - %s, %i\n", gstr, NameEx(i), i, zone, GetVehicleNameEx(v), GetPlayerVehicleID(i));
			count++;
		}
	}
	if(count == 0) return SysMsgF(playerid, "Não foi possível encontrar jogadores que dirigissem um(a) %s", params);
	ShowMessage(playerid, "Jogadores em veiculos", gstr, "Pronto");
	return true;
}
CMD:armaslocal(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Use: /armaslocal [nome da arma]");

	new wid = GetWeaponIdFromName(params), count = 0;
	if(wid == -1) return SysMsg(playerid, "Arma inválida.");

	gstr[0] = EOS;
	foreach(new i: Player)
	{
		if(GetPlayerWeapon(i) == wid)
		{
			new wep, ammo, zone[MAX_ZONE_NAME];
			GetPlayerWeaponData(i, GetWeaponSlot(wid), wep, ammo);
			GetPlayer3DZone(i, zone, MAX_ZONE_NAME);

			format(sgstr, sizeof(sgstr), "%s (ID: %i, Loc: %s) - %s, %i munições\n", NameEx(i), i, zone, GetWeaponNameFromID(wid), ammo);
			strcat(gstr, sgstr);
			count++;
		}
	}
	if(count == 0) return SysMsgF(playerid, "Não foi possível encontrar nenhum jogador segurando %s", weaponstring[wid]);
	ShowMessage(playerid, "Jogadores que prendem essa arma", gstr, "Pronto");
	return true;
}
CMD:playerareas(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params))
	{
		SysMsg(playerid, "Use: /playerareas [área de interesse. e.g, montgomery]");
		SysMsg(playerid, "Nota: O nome da área deve MATCH uma das zonas no jogo, caso contrário, nenhum jogador será encontrado.");
		return true;
	}

	new count = 0;

	gstr[0] = EOS;
	foreach(new i: Player)
	{
		new zone[MAX_ZONE_NAME];
		GetPlayer3DZone(i, zone, MAX_ZONE_NAME);
		if(strmatch(zone, params))
		{
			format(gstr, sizeof(gstr), "%s%s (ID: %i) - %s\n", gstr, NameEx(i), i, zone);
			count++;
		}
	}
	if(count == 0) return SysMsgF(playerid, "Não foi possível encontrar jogadores em %s", params);
	ShowMessage(playerid, "Jogadores encontrados na zona", gstr, "Pronto");
	return true;
}
CMD:setmotd(playerid, params[])
{
	new motdid;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(sscanf(params, "is[128]", motdid, gstr)) return SysMsg(playerid,"Use: /setmotd [motd id] [mensagem]") && SysMsg(playerid, "MOTD IDs are 1: Admin, 2: Helper, 3: Player");
	if(motdid < 1 || motdid > 3) return SysMsg(playerid, "Você deve inserir uma ID da MOTD válida. IDs MOTD disponíveis são 1: Admin, 2: Helper, 3: Player");

	if(motdid == 1) //Admin MOTD
	{
		if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, "Você não é o administrador apropriado para modificar este MOTD");
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE motd SET message = '%e' WHERE motdid = %i", gstr, motdid-1);
		mysql_pquery(conn, mquery);
		SendClientMessageF(playerid, COLOR_WHITE, "Você configurou o Admin MOTD para %s", gstr);
		AdminLog(playerid, 0, gstr, "Admin modificado MOTD");
		return true;
	}

	if(motdid == 2) //ajudaer MOTD
	{
		if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, "Você não é o administrador apropriado para modificar este MOTD");
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE motd SET message = '%e' WHERE motdid = %i", gstr, motdid-1);
		mysql_pquery(conn, mquery);
		SendClientMessageF(playerid, COLOR_WHITE, "Você definiu o Helper MOTD para %s", gstr);
		AdminLog(playerid, 0, gstr, "Helper modificado MOTD");
		return true;
	}

	if(motdid == 3) //Player MOTD
	{
		if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, "Você não é o administrador apropriado para modificar este MOTD");
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE motd SET message = '%e' WHERE motdid = %i", gstr, motdid-1);
		mysql_pquery(conn, mquery);
		SendClientMessageF(playerid, COLOR_WHITE, "Você configurou o Player MOTD para %s", gstr);
		AdminLog(playerid, 0, gstr, "Player modificado MOTD");
		return true;
	}
	return true;
}
CMD:set(playerid, params[])
{
	new playa, pname[32], option[24], Value[32], Value2[32];
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(sscanf(params, "s[32]s[24]S(None)[32]S(None)[32]", pname, option, Value, Value2))
	{
		SysMsg(playerid,"Use: /set [Player ID/Veiculo ID] [opção] [valor]");
		SysMsg(playerid,"Opções: VW, Interior, HP, Armour");
		if(IsPlayerAdminLevelOK(playerid, 2)) SysMsg(playerid, "Opções: Skin, combustivel, Weather");
		if(IsPlayerAdminLevelOK(playerid, 3))
		{
			SysMsg(playerid, "Opções: Facção, Rank, Trabalho, Nome, Estilolutar");
			SysMsg(playerid, "Opções: Bebado, Weaponskill, vh");
		}
		if(IsPlayerAdminLevelOK(playerid, 4)) SysMsg(playerid, "Opções: AdminLevel, Time");
		return true;
	}
	if(strmatch("combustivel", pname))
	{
		new playerState = GetPlayerState(playerid);
		if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

		if(!IsNumeric(option)) return SysMsg(playerid,"O valor deve ser um número.");
		if(strval(option) < 0 || strval(option) > 100) return SysMsg(playerid,"O valor deve ser de 0 a 100.");

		new vid = GetPlayerVehicleID(playerid);
		if(vid == 0) return SysMsg(playerid,"Você não está em um veiculo.");
		Fuel[vid] = floatstr(option);

//		UpdateFuelText(vid, gstr);
//		PlayerTextDrawSetString(playerid, FuelText[playerid], gstr);
		//TextDrawShowForPlayer(playerid,FuelText[playerid]);

		if(playerState == PLAYER_STATE_PASSENGER) SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Combustível adicionado para %i no(a) %s(%i)", strval(option),GetVehicleName(vid),vid);

		else if(playerState == PLAYER_STATE_DRIVER && Fuel[vid] >= 10)
		{
	//		PlayerTextDrawShow(playerid, FuelText[playerid]);
			SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Combustível adicionado para %i no(a) %s(%i)", strval(option),GetVehicleName(vid),vid);
		}

		else if(Fuel[vid] < 10 && playerState == PLAYER_STATE_DRIVER) TextDrawShowForPlayer(playerid, LowFuelText);
		TextDrawHideForPlayer(playerid, LowFuelText);
		return true;
	}
	else if(strmatch("vh", pname))
	{
		if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

		new vid = GetPlayerVehicleID(playerid);
		if(vid > 0)
		{
			SetVehicleHealthEx(vid, strval(option));
			SysMsgF(playerid, "Saúde do veículo definida para %i.", strval(option));
		}
		return true;
	}
	else if(strmatch("weather", pname))
	{
		if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

		foreach(new i: Player)
		{
			if(GetPlayerInterior(i) == 0 && GetPlayerVirtualWorld(i) == 0)
			{
				SetPlayerWeather(i, strval(option));
			}
		}
		gServerWeather = strval(option);

		format(gstr, sizeof(gstr),"[Admin] %s mudou o clima para ID %i(%s).",NameEx(playerid),strval(option),GetWeatherName(strval(option)));
		AdminBroadcast(gstr, 0);
		format(gstr, sizeof(gstr), "Mudou o tempo para %i", strval(option));
		AdminLog(playerid, 0, "", gstr);
		return true;
	}
	else if(strmatch("time", pname))
	{
		if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

		gServerHour = strval(option);

		foreach(new i: Player)
		{
			if(IsInHouseID[i] == -1 && IsInBizzID[i] == -1)
			{
				SetPlayerTime(i, gServerHour, gServerMinute);
			}
		}

		format(gstr, sizeof(gstr),"[Admin] %s mudou o tempo para %i.",NameEx(playerid),strval(option));
		AdminBroadcast(gstr, 0);
		format(gstr, sizeof(gstr), "Mudou o tempo para %i", strval(option));
		AdminLog(playerid, 0, "", gstr);
		return true;
	}

	playa = GetPlayerIDs(pname);
	if(InvalidPlayer(playa)) return SysMsg(playerid,"Jogador ou opção inválida.");
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(!Logged{playa}) return SysMsg(playerid,"ID do jogador não está logado.");

	if(strmatch("int", option) || strmatch("interior", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
		if(!IsNumeric(Value)) return SysMsg(playerid, "O valor precisa ser um número.");
		SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Você definiu com sucesso %s's [ID:%i] ID do mundo interior para %i.", NameEx(playa), playa, strval(Value));
		SendClientMessageF(playa, COLOR_LIGHTGREEN, "Admin %s configurou seu mundo interior para ID %i.", NameEx(playerid), strval(Value));
		SetPlayerInterior(playa, strval(Value));
	}
	else if(strmatch("vw", option) || strmatch("virtual", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
		if(!IsNumeric(Value)) return SysMsg(playerid, "O valor precisa ser um número.");
		SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Você definiu com sucesso o Vw de %s [ID:%i] ID do mundo virtual para %i.", NameEx(playa), playa, strval(Value));
		SendClientMessageF(playa, COLOR_LIGHTGREEN, "Admin %s configurou seu mundo virtual para %i.", NameEx(playerid), strval(Value));
		SetPlayerVirtualWorldEx(playa, strval(Value));
	}
	else if(strcmp("faction",option,true) == 0 || strcmp("facção",option,true) == 0)
	{
		if(IsPlayerAdminLevelOK(playerid, 3))
		{
			if(strval(Value) < 0) return SysMsg(playerid,"Valor inválido! (Não há tal número de facção)");
			if(strval(Value) > MAX_FACTIONS-1) return SysMsg(playerid,"Valor inválido! (Não há tal número de facção)");
			if(strval(Value) == Faction[playa]) return SysMsg(playerid,"Valor inválido! (Já definido para esse valor)");
			if(strval(Value) == FACTION_PROP && !CanSetST(playerid)) return SysMsg(playerid,"Você precisa ser convidado para essa facção!");

			if(Faction[playa] > 0 && strval(Value) == 0) MySpawnID[playa] = 1;
			if(Faction[playa] == 0 && strval(Value) > 0) MySpawnID[playa] = 2;

			Faction[playa] = strval(Value);
			FactionRank[playa] = 1;
			SubFactionSpawn[playerid] = 1;
			//GivePlayerWeapons(playa);
			Duty[playerid] = 0;

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE players SET FactionRank = %i, Faction = %i, SubFactionSpawn = %i, MySpawnID = %i WHERE id = %i", FactionRank[playa], Faction[playa], SubFactionSpawn[playa], MySpawnID[playa], SQLID[playa]);
			mysql_pquery(conn, mquery);

			SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Você colocou %s na facção %s(%i).",NameEx(playa),GetFactionNameFromId(strval(Value)),strval(Value));
			SendClientMessageF(playa, COLOR_LIGHTGREEN, "Admin %s colocou você na facção %s(%i).",NameEx(playerid),GetFactionNameFromId(strval(Value)),strval(Value));
			format(gstr, sizeof(gstr), "Set faction to %i", strval(Value));
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			UnlockAchievement(playerid, 5);
		}
		else return SysMsg(playerid, "Você não é uma classificação suficientemente alta para usar essa opção.");
	}
	else if(strcmp("rank",option,true) == 0)
	{
		if(IsPlayerAdminLevelOK(playerid, 3))
		{
			if(strval(Value) < 1 || strval(Value) > 15) return SysMsg(playerid,"Valor inválido! (Nenhum tal número Rank)");
			if(strval(Value) > FACTIONS[Faction[playa]][FactionUberLeaderRank]) return SysMsg(playerid,"Essa patente não existe nessa facção.");
			if(strval(Value) == FactionRank[playa]) return SysMsg(playerid,"Valor inválido! (Já definido para esse valor)");

			FactionRank[playa] = strval(Value);
			MySQLUpdateInt(SQLID[playa], "FactionRank", FactionRank[playa], "players");

			SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Você definiu o rank de facção de %s para %s(%i).",NameEx(playa),GetFactionRankName(Faction[playa], FactionRank[playa]),strval(Value));
			SendClientMessageF(playa, COLOR_LIGHTGREEN, "Admin %s definiu seu rank de facção para %s(%i).",NameEx(playerid),GetFactionRankName(Faction[playa], FactionRank[playa]),strval(Value));
			format(gstr, sizeof(gstr), "Set faction rank to %i", strval(Value));
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		}
		else return SysMsg(playerid, "Você não é um rank alto o suficiente para usar esta opção.");
	}
	else if(strcmp("job",option,true) == 0 || strcmp("trabalho",option,true) == 0)
	{
		if(IsPlayerAdminLevelOK(playerid, 3))
		{
			if(strval(Value) < 0 || strval(Value) > MAX_JOBS) return SysMsg(playerid,"Valor inválido! (Nenhum trabalho desse tipo)");
			if(strval(Value) == Job[playa]) return SysMsg(playerid,"Valor inválido! (Já definido para esse valor)");
			if(strval(Value) == 3) return SysMsg(playerid, "Este trabalho não está mais disponível.");

			Job[playa] = strval(Value);
			MySQLUpdateInt(SQLID[playa], "Job", Job[playa], "players");

			new JName[25];
			switch(Job[playa])
			{
				case 0: JName = "Nenhum";
				case JOB_MECHANIC: JName = "Mecanico";
				case JOB_DRUGDEALER: JName = "Traficante";
				case JOB_MAINTENANCE: JName = "manutenção";
				case JOB_TAXI: JName = "Taxista";
			}

			SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Você adicionou para %s o trabalho %s(%i).",NameEx(playa),JName,strval(Value));
			SendClientMessageF(playa, COLOR_LIGHTGREEN, "Admin %s te deu o trabalho %s(%i).",NameEx(playerid),JName,strval(Value));
			format(gstr, sizeof(gstr), "Definir trabalho para %i(%s)", strval(Value), JName);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		}
		else return SysMsg(playerid, "Você não é uma classificação suficientemente alta para usar essa opção.");
		return true;
	}
	else if(strmatch("hp", option) || strmatch("health", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid,"Você não é uma classificação suficientemente alta para usar essa opção.");

		if(strval(Value) < 0) return SysMsg(playerid,"Invalid health points! (0-100 only)");
		if(strval(Value) > 100 && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"Invalid health points! (0-100 only)");
		if(strval(Value) >= 50) ClearInjuriesForPlayer(playa);

		if(Dead{playa} && strval(Value) >= 50)
		{
			RevivePlayer(playa);
		}

		SetPlayerHealthEx(playa, strval(Value));
		if(IsPlayerMasked{playa}) FormatHealthLabelText(playa, HealthVar[playa], ArmourVar[playa], 2);


		IsDead[playerid] = 0;
		DeathTimer[playerid] = 0;
		SendClientMessageF(playa, COLOR_LIGHTBLUE, "Sua saúde foi definida para %i por %s",strval(Value),NameEx(playerid));
		SendClientMessageF(playerid, COLOR_RED, "Você definiu o hp de %s para %i",NameEx(playa),strval(Value));
		format(gstr, sizeof(gstr), "Defina saúde para %i", strval(Value));
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	}
	else if(strmatch("armour", option) || strmatch("colete", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

		if(strval(Value) < 0 || strval(Value) > 100) return SysMsg(playerid,"Quantidade de armadura inválida! (0-100 somente)");

		SetPlayerArmourEx(playa, strval(Value), 1);

		SendClientMessageF(playa, COLOR_LIGHTBLUE, "Seu colete foi definito para %i por %s",strval(Value),NameEx(playerid));
		SendClientMessageF(playerid, COLOR_RED, "Você definiu o colete de %s para %i",NameEx(playa),strval(Value));
		format(gstr, sizeof(gstr), "Colete definido para %i", strval(Value));
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		if(IsPlayerMasked{playa}) FormatHealthLabelText(playa, HealthVar[playa], ArmourVar[playa], 2);
	}
	else if(strmatch("nome", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);
		if(strcmp(GetName(playa),Value,false) == 0) return SysMsg(playerid,"Já existe um jogador com esse nome.");
		if(!IsValidRoleplayName(Value)) return SysMsg(playerid,"Esse nome não é considerado para jogo de rol.");
		if(MySQLCheckAccount(Value, playerid) != 0) return SysMsg(playerid,"Esse nome já foi retirado no banco de dados.");
		if(strlen(Value) > 24) return SysMsg(playerid,"Error: SAMP só permite nomes com 24 ou menos letras.");
		if(hmData[playa][hmActive] == 1) return SysMsg(playerid, "Este jogador é atualmente aliased. Contate-os por favor pessoalmente se você precisa de mudar seu nome");

		new oldname[MAX_PLAYER_NAME];
		format(oldname, MAX_PLAYER_NAME, GetName(playa));

		if(SetPlayerName(playa, Value) != 1) return SysMsg(playerid, "Esse nome é muito curto, muito longo, em uso, o mesmo ou contém letras inválidas.");

		MySQLUpdateString(SQLID[playa], "Name", Value, "players");
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE phones SET OwnerName = '%e' WHERE OwnerSQLID = %i", Value, SQLID[playa]);
		mysql_pquery(conn, mquery);

		format(PhoneData[playa][pOwnerName], 25, "%s", Value);

		SendClientMessageF(playa,COLOR_DARKBLUE,"Admin %s mudou seu nome para %s.", GetName(playerid), Value);
		SendClientMessageF(playerid, COLOR_RED, "Você mudou o nome de %s para %s.", oldname, Value);
		format(sgstr, sizeof(sgstr), "Nome de %s alterado para %s", oldname, Value);
		AdminLog(playerid, SQLID[playa], GetName(playa), sgstr);

		for(new b = 0; b < MAX_BIZZ_PER_PLAYER; b++)
		{
			if(PlayerBizzID[playa][b] != -1)
			{
				new h = PlayerBizzID[playa][b];

				UpdateBizzLabel(h);
			}
		}
		foreach(new i: Player)
		{
			if(UsingPaint{i})
			{
				format(tgstr, sizeof(tgstr), "%s (%i)", NameEx(playa), playa);
				UpdateDynamic3DTextLabelText(PaintLabels[i][playa], COLOR_ORANGE, tgstr);
			}
		}
	}
	else if(strmatch("skin", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

		//if(IsPlayerInAnyVehicle(playa)) return SysMsg(playerid,"That player is currently in a vehicle, please ask them to exit before setting their skin.");
		if(GetPlayerSpecialAction(playa) == SPECIAL_ACTION_ENTER_VEHICLE || GetPlayerSpecialAction(playa) == SPECIAL_ACTION_EXIT_VEHICLE) return SysMsg(playerid, "Você não pode fazer isso enquanto o jogador está entrando / saindo de um veículo.");
		if(GetPlayerSpecialAction(playa) == SPECIAL_ACTION_DUCK) return SysMsg(playerid,"Você não pode mudar uma pele quando eles estão agachados.");
		if(GetPlayerVehicleID(playa) > 0) return SysMsg(playerid,"Você não pode mudar uma pele quando está em um veículo.");
		if(strval(Value) < 1 || strval(Value) > 30000 || strval(Value) == 74) return SysMsg(playerid,"O ID da skin inválido.");

		new oldskin = GetPlayerSkin(playerid);
		for(new i = 0; i < 4; i++)
		{
			if(Clothes[playa][i] == oldskin)
			{
				Clothes[playa][i] = strval(Value);

				new str[10];
				format(str,sizeof(str),"SkinSet%i",i+1);
				MySQLUpdateInt(SQLID[playa], str, Clothes[playa][i], "players");
				break;
			}
		}

		SetPlayerSkinEx(playa, strval(Value));
		cPlayersSkin[playa] = strval(Value);
		MySQLUpdateInt(SQLID[playa], "Skin", cPlayersSkin[playa], "players");
		format(gstr, sizeof(gstr), "Skin definida para %i", strval(Value));
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	}
	else if(strmatch("estilolutar", option) || strmatch("fight", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);
		if(strmatch("None", Value))
		{
			SysMsg(playerid,"Use: /set [ID ou nome do jogador] estilolutar [Estilo id/name]");
			SysMsg(playerid,"Tipos de estilo: 0-Normal, 1-Boxer, 2-Kungfu");
			return true;
		}

		new StyleType = -1;
		if(IsNumeric(Value))
		{
			if(strval(Value) < 0 || strval(Value) > 2) return SysMsg(playerid,"Estilo inválido (0-2).");
			StyleType = strval(Value);
		}

		if(StyleType == 0 || strcmp("normal",Value,true) == 0)
		{
			if(GetPlayerFightingStyle(playa) == FIGHT_STYLE_NORMAL) return SysMsg(playerid,"Error: Esse jogador já está usando este estilo de luta.");
			SetPlayerFightingStyle(playa, FIGHT_STYLE_NORMAL);
			UsingFightStyle{playa} = FIGHT_STYLE_NORMAL;
			MySQLUpdateInt(SQLID[playa], "FightStyle", FIGHT_STYLE_NORMAL, "players");
			format(gstr, sizeof(gstr),"Admin %s mudou seu estilo de luta para normal.",NameEx(playerid));
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"Você definiu o estilo de luta de %s para normal.",NameEx(playa));
			SendClientMessage(playerid,COLOR_RED, gstr);
			return true;
		}
		if(StyleType == 1 || strcmp("boxer",Value,true) == 0)
		{
			if(GetPlayerFightingStyle(playa) == FIGHT_STYLE_BOXING) return SysMsg(playerid,"Error: Esse jogador já está usando este estilo de luta.");
			SetPlayerFightingStyle(playa, FIGHT_STYLE_BOXING);
			UsingFightStyle{playa} = FIGHT_STYLE_BOXING;

			if(!FightStyleLearned[playa]{FS_BOXING})
			{
				FightStyleLearned[playa]{FS_BOXING} = true;
				MySQLUpdateInt(SQLID[playa], "FightStyleLearnedBoxing", 1, "players");
			}
			MySQLUpdateInt(SQLID[playa], "FightStyle", FIGHT_STYLE_BOXING, "players");
			format(gstr, sizeof(gstr),"Admin %s mudou seu estilo de luta para boxer.",NameEx(playerid));
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"Você mudou o estilo de luta de %s para boxer.",NameEx(playa));
			SendClientMessage(playerid,COLOR_RED, gstr);
			return true;
		}
		if(StyleType == 2 || strcmp("kungfu",Value,true) == 0)
		{
			if(GetPlayerFightingStyle(playa) == FIGHT_STYLE_KUNGFU) return SysMsg(playerid,"Error: Esse jogador já está usando este estilo de luta.");
			SetPlayerFightingStyle(playa, FIGHT_STYLE_KUNGFU);
			UsingFightStyle{playa} = FIGHT_STYLE_KUNGFU;
			if(!FightStyleLearned[playa]{FS_KUNGFU})
			{
				FightStyleLearned[playa]{FS_KUNGFU} = true;
				MySQLUpdateInt(SQLID[playa], "FightStyleLearnedKungFu", 1, "players");
			}
			MySQLUpdateInt(SQLID[playa], "FightStyle", FIGHT_STYLE_KUNGFU, "players");
			format(gstr, sizeof(gstr),"Admin %s mudou seu estilo de luta para kung-fu.",NameEx(playerid));
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"Você mudou o estilo de luta de %s para kung-fu.",NameEx(playa));
			SendClientMessage(playerid,COLOR_RED, gstr);
			return true;
		}
		format(gstr, sizeof(gstr), "Defina estilo de luta para %i/%s", StyleType, Value);
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	}
	else if(strmatch("bebado", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

		new DLevel = strval(Value);
		if(isnull(Value)) return SysMsg(playerid, "Use: /set [ID] bebado [0-50000]");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(DLevel < 0 || DLevel > 50000) return SysMsg(playerid,"Nível inválido. (0-50000)");

		SetPlayerDrunkLevel(playa, DLevel);
		DrunkLevel[playerid] = DLevel;

		format(gstr, sizeof(gstr),"Admin %s mudou sua embriaguez para %i",NameEx(playerid),DLevel);
		SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
		format(gstr, sizeof(gstr),"Você definiu o nível de embriaguez %s para %i",NameEx(playa),DLevel);
		SendClientMessage(playerid,COLOR_RED, gstr);
		format(gstr, sizeof(gstr), "Set level de embriaguez para %i", DLevel);
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	}
	else if(strmatch("weaponskill", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

		new  skill = strval(Value2);
		if(strmatch("None", Value))
		{
			SysMsg(playerid,"Use: /set [ID ou nome do jogador] weaponskill [arma/nome] [skill level]");
			SysMsg(playerid,"Tipo de arma: 0-9mm, 1-Silenced 9mm, 2-D.Eagle, 3-Shotgun, 4-Sawn-off, 5-SPAS, 6-Micro UZI");
			SysMsg(playerid,"Tipo de arma: 7-MP5, 8-AK47, 9-M4, 10-Sniper, *11-TODAS ARMAS*");
			return true;
		}

		new wtype = -1;
		if(IsNumeric(Value))
		{
			if(strval(Value) < 0 || strval(Value) > 11) return SysMsg(playerid,"Tipo de arma inválido.");
			wtype = strval(Value);
		}

		if(skill < 0 || skill > 10) return SysMsg(playerid,"Nível de habilidade inválido. (0 - 10)");

		MySQLUpdateInt(SQLID[playa], "WeaponSkill", skill, "players");

		if(wtype == 0 || strcmp("9mm",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_PISTOL, (skill * 100) - 10);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s definiu sua habilidade de 9mm para %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"Você definiu o nível de habilidade de 9mm de %s para %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Habilidade de 9mm definida para %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 1 || strcmp("silenced9mm",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_PISTOL_SILENCED, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s definiu sua habilidade de 9mm Silenciada para %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"Você definiu o nível de habilidade de 9mm Silenciada de %s para %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Habilidade de 9mm Silenciada definida para %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 2 || strcmp("deagle",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_DESERT_EAGLE, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s definiu sua habilidade de de Desert Eagle para %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"Você definiu o nível de habilidade de Desert Eagle de %s para %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Habilidade de Desert Eagle definida para %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 3 || strcmp("Shotgun",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_SHOTGUN, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s definiu sua habilidade de de Shotgun para %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"Você definiu o nível de habilidade de Shotgun de %s para %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Habilidade de Shotgun definida para %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 4 || strcmp("sawnoff",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_SAWNOFF_SHOTGUN, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s definiu sua habilidade de de Sawn-off para %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"Você definiu o nível de habilidade de Sawn-off de %s para %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Habilidade de Sawn-off definida para %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 5 || strcmp("spas",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_SPAS12_SHOTGUN, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s definiu sua habilidade de de SPAS12 para %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"Você definiu o nível de habilidade de SPAS12 de %s para %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Habilidade de SPAS12 definida para %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 6 || strcmp("uzi",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_MICRO_UZI, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s definiu sua habilidade de de UZI para %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"Você definiu o nível de habilidade de UZI de %s para %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Habilidade de UZI definida para %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 7 || strcmp("mp5",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_MP5, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s definiu sua habilidade de de MP5 para %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"Você definiu o nível de habilidade de MP5 de %s para %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Habilidade de MP5 definida para %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 8 || strcmp("ak47",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_AK47, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s definiu sua habilidade de de AK-47 para %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"Você definiu o nível de habilidade de AK-47 de %s para %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Habilidade de AK-47 definida para %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 9 || strcmp("M4",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_M4, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s definiu sua habilidade de de m4 para %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"Você definiu o nível de habilidade de m4 de %s para %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Habilidade de M4 definida para %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 10 || strcmp("sniper",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_SNIPERRIFLE, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s set your Sniper skill to %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's Sniper to %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Set Sniper weapon skill to %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 11 || strcmp("all",Value,true) == 0 || strcmp("todas",Value,true) == 0)
		{
			SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL,(skill * 100) - 10);
			SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL_SILENCED,(skill * 100) - 1);
			SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE,(skill * 100) - 1);
			SetPlayerSkillLevel(playerid, WEAPONSKILL_SHOTGUN,(skill * 100) - 1);
			SetPlayerSkillLevel(playerid, WEAPONSKILL_SAWNOFF_SHOTGUN,(skill * 100) - 1);
			SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN,(skill * 100) - 1);
			SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI,(skill * 100) - 1);
			SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5,(skill * 100) - 1);
			SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47,(skill * 100) - 1);
			SetPlayerSkillLevel(playerid, WEAPONSKILL_M4,(skill * 100) - 1);
			SetPlayerSkillLevel(playerid, WEAPONSKILL_SNIPERRIFLE,(skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			SendClientMessageF(playa, COLOR_LIGHTGREEN,  "Admin %s definiu todas as habilidades de armas para %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessageF(playerid,COLOR_RED, "Você definiu todos os níveis de arma de %s para %i",NameEx(playa),(skill * 100) - 1);
			format(gstr, sizeof(gstr), "Definir toda a habilidade arma para %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		}
	}
	else if(strmatch("admin", option) || strmatch("adminlevel", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);

		if(isnull(Value)) SysMsg(playerid, "Use: /set [Player ID or Nome_Sobrenome] adminlevel [level 0-4]");
		if(IsPlayerConnected(playa) || !Logged{playa})
		{
			if(playa == playerid) return SysMsg(playerid, "Não pode ser você mesmo.");

			if(strval(Value) < 0 || strval(Value) > 4) return SysMsg(playerid,"Admin nível deve estar entre 0 e 4.");

			AdminLevel[playa] = strval(Value);
			if(IsHelper{playa}) IsHelper{playa} = false;
			mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET AdminLevel = %i, Helper = %i WHERE id = %i", AdminLevel[playa], IsHelper{playa}, MasterAccount[playa]);
			mysql_pquery(conn, mquery);


			if(strval(Value) > AdminLevel[playa]) return PlaySoundForPlayer(playa, 31205);
			SendClientMessageF(playa,COLOR_LIGHTBLUE, "Admin %s mudou o nível de administrador para %i.",NameEx(playerid),AdminLevel[playa]);
			SendClientMessageF(playerid,COLOR_RED, "Você mudou o level de admin de %s para %i.",NameEx(playa),AdminLevel[playa]);
			format(gstr, sizeof(gstr), "Definir nível de administrador para %i", strval(Value));
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		}
		else if(strfind(pname, "_") != -1)
		{
			new sqlid = MySQLCheckMaster_AgainstName(pname);
			if(sqlid <= 1) return SysMsg(playerid, "O nome não foi encontrado. Por favor, inclua o primeiro nome, sobrenome e um título de destaque OU use o ID de identidade atual.");
			if(sqlid == SQLID[playerid]) return SysMsg(playerid, "Não pode ser você mesmo.");

			if(strval(Value) < 0 || strval(Value) > 4) return SysMsg(playerid,"Admin nível deve estar entre 0 e 4.");

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET AdminLevel = %i, Helper = 0 WHERE id = %i", strval(Value), sqlid);
			mysql_pquery(conn, mquery);

			SendClientMessageF(playerid,COLOR_RED, "Você mudou o level de admin de %s para %i.",GetSQLName(sqlid),strval(Value));
			format(gstr, sizeof(gstr), "Definir nível de administrador para %i", strval(Value));
			AdminLog(playerid, sqlid, GetSQLName(sqlid), gstr);
		}
	}
	else return SysMsg(playerid, "Você não está autorizado a usar este comando ou você digitou uma opção inválida.");
	return true;
}
CMD:recordbot(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Use: /record [name *1 WORD*]");

	new VehID = GetPlayerVehicleID(playerid);

	if(VehID > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) StartRecordingPlayerData(playerid, PLAYER_RECORDING_TYPE_DRIVER, params);
	else StartRecordingPlayerData(playerid, PLAYER_RECORDING_TYPE_ONFOOT, params);

	GameTextForPlayer(playerid,"~n~~n~~n~~n~~r~~>~REC",5000,3);

	return true;
}
CMD:stoprecord(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	StopRecordingPlayerData(playerid);
	SendClientMessage(playerid, COLOR_WHITE, ">> The Recording Has Been Saved.");
	return true;
}
CMD:object(playerid, params[])//criar objetos
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new option[24], modelid[24], purpose[64];
	if(sscanf(params, "s[24]S(-1)[24]S()[64]", option, modelid, purpose)) return SysMsg(playerid, "Use: /object [spawn/delete/goto/edit/view/exportar]");

	if(strmatch(option, "spawn"))
	{
		if(strval(modelid) == -1) return SysMsg(playerid, "Digite um ID de modelo válido.");
		if(!strlen(purpose)) return SysMsg(playerid, "Digite uma finalidade para o objeto.");
		if(GetFreeTempObjectSlot() == -1) return SysMsg(playerid, "Não há slots de objetos gratuitos no momento.");
		//if(IsValidModel(strval(modelid))) return SysMsg(playerid, "ID do modelo inválida.");

		new slot = GetFreeTempObjectSlot();
		GetPlayerPos(playerid, TempObjects[slot][ObjectPosX], TempObjects[slot][ObjectPosY], TempObjects[slot][ObjectPosZ]);
		GetPlayerFacingAngle(playerid, TempObjects[slot][ObjectPosRZ]);
		GetXYInFrontOfPlayer(playerid, TempObjects[slot][ObjectPosX], TempObjects[slot][ObjectPosY], 1.5);

		TempObjects[slot][ObjectID] = CreateDynamicObject(strval(modelid),  TempObjects[slot][ObjectPosX], TempObjects[slot][ObjectPosY], TempObjects[slot][ObjectPosZ], 0.0, 0.0, TempObjects[slot][ObjectPosRZ], GetPlayerVirtualWorld(playerid));
		TempObjects[slot][ObjectModel] = strval(modelid);
		TempObjects[slot][ObjectVW] = GetPlayerVirtualWorld(playerid);
		TempObjects[slot][ObjectPosRX] = 0.0;
		TempObjects[slot][ObjectPosRY] = 0.0;
		TempObjects[slot][ObjectPurpose] = purpose;
		TempObjects[slot][SpawnedBy] = SQLID[playerid];

		EditingTempObject[playerid] = slot;
		EditDynamicObject(playerid, TempObjects[slot][ObjectID]);

		format(gstr, sizeof(gstr), "Objeto temporário spawnado. (%i)", strval(modelid));
		AdminLog(playerid, 0, "", gstr);
		return true;
	}
	else if(strmatch(option, "delete"))
	{
		if(strval(modelid) == -1) return SysMsg(playerid, "Digite um slot.");
		if(strval(modelid) < 0 || strval(modelid) > MAX_TEMPOBJECTS) return SysMsgF(playerid, "O slot de objeto deve ser de 0-%i", MAX_TEMPOBJECTS);
		if(TempObjects[strval(modelid)][ObjectID] == INVALID_OBJECT_ID) return SysMsg(playerid, "Nenhum objeto encontrado neste slot.");

		new slot = strval(modelid);
		DestroyDynamicObjectEx(TempObjects[slot][ObjectID], "TempObjects[slot][ObjectID]");
		TempObjects[slot][ObjectID] = INVALID_OBJECT_ID;
		TempObjects[slot][ObjectModel] = 0;
		TempObjects[slot][ObjectVW] = 0;
		TempObjects[slot][ObjectPosX] = 0;
		TempObjects[slot][ObjectPosY] = 0;
		TempObjects[slot][ObjectPosZ] = 0;
		TempObjects[slot][ObjectPosRX] = 0;
		TempObjects[slot][ObjectPosRY] = 0;
		TempObjects[slot][ObjectPosRZ] = 0;
		TempObjects[slot][ObjectPurpose][0] = EOS;
		TempObjects[slot][SpawnedBy] = 0;

		SendClientMessageF(playerid, COLOR_RED, "Você destruiu o objeto %i.", slot);
		return true;
	}
	else if(strmatch(option, "goto"))
	{
		if(strval(modelid) == -1) return SysMsg(playerid, "Please enter a slot.");
		if(strval(modelid) < 0 || strval(modelid) > MAX_TEMPOBJECTS) return SysMsgF(playerid, "O slot de objeto deve ser de 0-%i", MAX_TEMPOBJECTS);
		if(TempObjects[strval(modelid)][ObjectID] == INVALID_OBJECT_ID) return SysMsg(playerid, "Nenhum objeto encontrado neste slot.");

		new slot = strval(modelid);
		SetPlayerPos(playerid, TempObjects[slot][ObjectPosX], TempObjects[slot][ObjectPosY], TempObjects[slot][ObjectPosZ] + 2);
		SetPlayerVirtualWorld(playerid, TempObjects[slot][ObjectVW]);
		SendClientMessageF(playerid, COLOR_RED, "Você tem teletransportado para o objeto %i.", slot);
		return true;
	}
	else if(strmatch(option, "editar"))
	{
		if(strval(modelid) == -1) return SysMsg(playerid, "Por favor, insira um slot.");
		if(strval(modelid) < 0 || strval(modelid) > MAX_TEMPOBJECTS) return SysMsgF(playerid, "O slot de objeto deve ser de 0-%i", MAX_TEMPOBJECTS);
		if(TempObjects[strval(modelid)][ObjectID] == INVALID_OBJECT_ID) return SysMsg(playerid, "Nenhum objeto encontrado neste slot.");

		new slot = strval(modelid);
		if(!IsPlayerInRangeOfPoint(playerid, 50.0, TempObjects[slot][ObjectPosX], TempObjects[slot][ObjectPosY], TempObjects[slot][ObjectPosZ])) return SysMsg(playerid, "Você deve estar mais próximo do objeto para editá-lo.");

		EditingTempObject[playerid] = slot;
		EditDynamicObject(playerid, TempObjects[slot][ObjectID]);
	}
	else if(strmatch(option, "ver"))
	{
		new bigstr[3000], count = 0;
		strcat(bigstr, "Slot\tModel\tPropósito\tSpawnado por\n");
		for(new x = 0; x < MAX_TEMPOBJECTS; x++)
		{
			if(TempObjects[x][ObjectID] != INVALID_OBJECT_ID)
			{
				format(sgstr, sizeof(sgstr), "%i\t%i\t%s\t%s\n", x, TempObjects[x][ObjectModel], TempObjects[x][ObjectPurpose], GetSQLName(TempObjects[x][SpawnedBy]));
				strcat(bigstr, sgstr);
				count ++;
			}
		}
		if(count == 0) return SysMsg(playerid, "Não há objetos spawnado no momento.");
		Dialog_Show(playerid, ObjectTeleport, DIALOG_STYLE_TABLIST_HEADERS, "Objetos temporários atuais", bigstr, "Teleporte", "Fechar");
	}
	else if(strmatch(option, "exportar"))
	{
		if(sscanf(params, "s[24]s[32]", option, modelid)) return SysMsg(playerid, "Use: /object exportar [filename] *Deve incluir .TXT*");

		new File:f = fopen(modelid, io_write);
		for(new x = 0; x < MAX_TEMPOBJECTS; x++)
		{
			if(TempObjects[x][ObjectID] != INVALID_OBJECT_ID)
			{
				format(sgstr, sizeof(sgstr), "CreateDynamicObject(%i, %f, %f, %f, %f, %f, %f); //%s (%s)\r\n",TempObjects[x][ObjectModel], TempObjects[x][ObjectPosX],TempObjects[x][ObjectPosY],
					TempObjects[x][ObjectPosZ], TempObjects[x][ObjectPosRX], TempObjects[x][ObjectPosRY], TempObjects[x][ObjectPosRZ], TempObjects[x][ObjectPurpose], GetSQLName(TempObjects[x][SpawnedBy]));
				fwrite(f, sgstr);
			}
		}
		fclose(f);
	}
	else cmd_object(playerid, "");
	return true;
}
CMD:tagban(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid, "Use: /tagban [playerID ou name] *ISSO NÃO PODE SER REMOVIDO*");
	if(TagBanned{playa}) return SysMsg(playerid, "Este usuário já está banido tag.");

	mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET TagBanned = 1 WHERE id = %i", MasterAccount[playa]);
	mysql_pquery(conn, mquery);

	TagBanned{playa} = true;
	SendClientMessageF(playerid, COLOR_RED, "[Admin] Você baniu %s de usar tag labels.", NameEx(playa));
	SendClientMessageF(playa, COLOR_RED, "Admin %s proibiu-o de usar tag labels.", NameEx(playerid));
	return true;
}
CMD:tag(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(TagBanned{playerid}) return SysMsg(playerid, "Você está proibido de usar este recurso.");
	if(PlayerLevel[playerid] < 4 && !IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, "Você deve ser pelo menos nível 4 para usar esse recurso.");

	new option[24], value[150];
	if(sscanf(params, "s[24]S()[150]", option, value)) return SysMsg(playerid, "Use: /tag [criar/excluir/id/editar]");

	if(strcmp(option, "criar", true) == 0)
	{
		if(isnull(value)) return SysMsg(playerid, "Use: /tag criare [Descrição]");
		if(PlayerHasLabel(playerid) && !IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, "Você já criou uma marca descritiva. Contate por favor um admin para criar mais.");
		if(Dead{playerid}) return SysMsg(playerid, "Não é possível utilizar este recurso enquanto estiver abatido.");
		if(strlen(value) > 140) return SysMsg(playerid, "Sua mensagem de tag é muito longa. Por favor, encurte.");

		new temptext[150];
		temptext = value;
		if(strlen(temptext) > 100) strins(temptext, "\n", 101);
		SetPVarString(playerid, "PendingLabelText", value);
		format(sgstr, sizeof(sgstr), "Tem certeza de que deseja criar uma marca com o seguinte texto?\n\n%s", temptext);
		Dialog_Show(playerid, LabelCreate, DIALOG_STYLE_MSGBOX, "Tem certeza?", sgstr, "Sim", "Não");
		return true;
	}
	else if(strcmp(option, "excluir", true) == 0)
	{
		if(!IsPlayerAdminLevelOK(playerid, 1))
		{
			for(new x = 0; x < MAX_LABELS; x++)
			{
				if(RPLabels[x][LabelOwner] == SQLID[playerid])
				{
					DestroyRPLabel(x);
					SendClientMessage(playerid, COLOR_RED, "Você removeu sua tag.");
					return true;
				}
			}
			SysMsg(playerid, "Não foi possível encontrar uma marca criada por você.");
			return true;
		}
		if(isnull(value)) return SysMsg(playerid, "Use: /tag excluir [tag id] *Use /tag id perto de uma tag para obter o seu ID.*");
		if(!IsNumeric(value)) return SysMsg(playerid, "ID de marca deve ser numérico.");

		new id = strval(value);
		if(id < 0 || id >= MAX_LABELS) return SysMsgF(playerid, "Valor deve ser maior que 0 e menor que %i.", MAX_LABELS);
		if(!RPLabels[id][LabelUsed]) return SysMsg(playerid, "Esta ID de tag não está em uso no momento.");

		DestroyRPLabel(id);
		SendClientMessageF(playerid, COLOR_RED, "Você removeu a tag %i.", id);
		return true;
	}
	else if(strcmp(option, "id", true) == 0)
	{
		if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

		for(new x = 0; x < MAX_LABELS; x++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, RPLabels[x][LabelX], RPLabels[x][LabelY], RPLabels[x][LabelZ]))
			{
				SendClientMessageF(playerid, COLOR_RED, "Este rótulo é de propriedade de %s e seu ID da tag é %i.", GetSQLName(RPLabels[x][LabelOwner]), x);
				return true;
			}
		}
		SysMsg(playerid, "Você não está perto de rótulos.");
		return true;
	}
	else if(strcmp(option, "editar", true) == 0)
	{
		if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

		new value2[150];
		if(sscanf(params, "s[24]s[150]s[150]", option, value, value2))
		if(!IsNumeric(value)) return SysMsg(playerid, "Tag ID deve ser numérico.");
		if(strval(value) < 0 || strval(value) >= MAX_LABELS) return SysMsgF(playerid, "Valor deve ser maior que 0 e menor que %i.", MAX_LABELS);
		if(!RPLabels[strval(value)][LabelUsed]) return SysMsg(playerid, "Que ID de rótulo não está em uso no momento.");
		if(strlen(value2) > 140) return SysMsg(playerid, "Sua mensagem de tag é muito longa. Por favor, encurte.");

		new id = strval(value);
		UpdateDynamic3DTextLabelText(RPLabels[id][LabelID], COLOR_WHITE, value2);

		SendSplitMessageF(playerid, COLOR_RED, "Você atualizou o texto do rótulo para '%s'", value2);
		return true;
	}
	return true;
}
stock PlayerHasLabel(playerid)
{
	for(new x = 0; x < MAX_LABELS; x++)
	{
		if(RPLabels[x][LabelOwner] == SQLID[playerid]) return true;
	}
	return false;
}
stock CreateRPLabel(playerid, text[])
{
	new x = GetFreeRPLabelID();
	if(x == -1) return SysMsg(playerid, "Atualmente não há slots de tag disponíveis.");

	GetPlayerPos(playerid,  RPLabels[x][LabelX], RPLabels[x][LabelY], RPLabels[x][LabelZ]);
	RPLabels[x][LabelID] = CreateDynamic3DTextLabel(text, COLOR_WHITE,  RPLabels[x][LabelX], RPLabels[x][LabelY], RPLabels[x][LabelZ], 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, GetPlayerVirtualWorld(playerid));
	RPLabels[x][LabelUsed] = true;
	RPLabels[x][LabelOwner] = SQLID[playerid];

	SendClientMessage(playerid, COLOR_WHITE, "Você criou com êxito uma marca descritiva.");
	return true;
}
stock DestroyRPLabel(id)
{
	DestroyDynamic3DTextLabel(RPLabels[id][LabelID]);
	RPLabels[id][LabelID] = Text3D:INVALID_3DTEXT_ID;
	RPLabels[id][LabelX] = 0.0;
	RPLabels[id][LabelY] = 0.0;
	RPLabels[id][LabelZ] = 0.0;
	RPLabels[id][LabelUsed] = false;
	RPLabels[id][LabelOwner] = 0;
	return true;
}
stock GetFreeRPLabelID()
{
	for(new x = 0; x < MAX_LABELS; x++)
	{
		if(!RPLabels[x][LabelUsed]) return x;
	}
	return -1;
}
CMD:aspray(playerid, params[])
{
	if(!Logged{playerid}) return SysMsg(playerid,"Você precisa estar logado no servidor para usar essa função.");

	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);
	if(!IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid,"Você deve estar em um veículo para re-spray.");

	new color1, color2;
	if(sscanf(params, "iI(-1)", color1, color2)) return SysMsg(playerid,"Use: /spray [Cor primária] [Optional: Cor secundária]");
	if(color1 < 0 || color1 > 255) return SysMsg(playerid,"A cor primária, deve ser entre 0 e 255");

	if(color2 == -1) color2 = color1;
	else if(color2 < 0 || color2 > 255) return SysMsg(playerid,"A cor secundária 2, deve ser entre 0 e 255.");

	new v = GetPlayerVehicleID(playerid);
	if(v == INVALID_VEHICLE_ID) return SysMsg(playerid, "Você não está em um veículo.");

	if(FVehicleData[v][FVFaction] > 0)
	{
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE fveh SET Col1 = %i, Col2 = %i WHERE id = %i", color1, color2, FVehicleData[v][FVSQLID]);
		mysql_pquery(conn, mquery);

		FVehicleData[v][FVCol1] = color1;
		FVehicleData[v][FVCol2] = color2;

		ChangeVehicleColorEx(v, color1, color2);
		ShowInfoText(playerid,"~G~R~R~E~B~S~Y~P~P~R~W~A~G~Y",3000);

		SendClientMessageF(playerid, COLOR_WHITE, "A cor do veículo da facção mudou para: %s(%i) & %s(%i)", VehicleColors[color1], color1, VehicleColors[color2], color2);
		return true;
	}
	else if(VehicleData[v][VehicleOwnerSQLID] > 0)
	{
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE vehicles SET Color1 = %i, Color2 = %i WHERE id = %i", color1, color2, VehicleData[v][VehSQLID]);
		mysql_pquery(conn, mquery);

		VehicleData[v][vColor1] = color1;
		VehicleData[v][vColor2] = color2;

		ChangeVehicleColorEx(v, color1, color2);
		ShowInfoText(playerid,"~G~R~R~E~B~S~Y~P~P~R~W~A~G~Y",3000);

		SendClientMessageF(playerid, COLOR_WHITE, "Cor do veículo de propriedade mudou para: %s(%i) & %s(%i)", VehicleColors[color1], color1, VehicleColors[color2], color2);
		return true;
	}
	else if(aspawned{v})
	{
		ChangeVehicleColorEx(v, color1, color2);
		SendClientMessageF(playerid, COLOR_WHITE, "Admin spawnou cor do veículo mudou para: %s(%i) & %s(%i)", VehicleColors[color1], color1, VehicleColors[color2], color2);
		return true;
	}
	return true;
}
CMD:vreparar(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new id;
	if(IsPlayerInAnyVehicle(playerid) && sscanf(params, "i", id)) id = GetPlayerVehicleID(playerid);
	else if(sscanf(params, "i", id)) return SysMsg(playerid, "Use: /vreparar [veiculo ID]");
	if(id > GetVehiclePoolSize()) return SysMsg(playerid, "Não há nenhum veiculo.");

	VehicleBroke[id] = 0;
	FuelTypeAfterRefuel[id] = 0;
	PlayerPlaySound(playerid, SOUND_CAR_MOD, 0, 0, 0);
	RepairVehicleEx(id);
	format(gstr, sizeof(gstr), "[Admin] Admin %s reparou o veiculo %s [ID %i].", NameEx(playerid), GetVehicleName(id), id);
	AdminBroadcast(gstr, 1, 4);
	return true;
}
CMD:inajail(playerid, params[])// atualmente ajail /inajail
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new count = 0;
	SendClientMessage(playerid, COLOR_WHITE, "Atualmente Administrado preso");

	foreach(new i: Player)
	{
		if(Logged{i})
		{
			if(AdminJailData[i][0] == 1)
			{
				SendClientMessageF(playerid, COLOR_LIGHTBLUE, "%s (%i) - %i minuto(s) remanescente.", NameEx(i), i, AdminJailData[i][1]);
				count++;
			}
		}
	}

	if(count == 0) SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ninguem");
	return true;
}
CMD:clearstingers(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	foreach(new i: Player)
	{
		if(StingerObjectID[i] >= 1)
		{
			DestroyDynamicObjectEx(StingerObjectID[i], "StingerObjectID[i] 0");
			StingerObjectID[i] = INVALID_OBJECT_ID;
			DestroyDynamicArea(StingerAreaID[i]);
			StingerAreaID[i] = -1;
		}
	}
	SendClientMessage(playerid, COLOR_LIGHTBLUE, "Todos os ferrões limpos.");
	return true;
}
CMD:removerfogo(playerid, params[])//removerfogo
{
	if(!Logged{playerid}) return true;
	if((Faction[playerid] == FACTION_SACFD && FactionRank[playerid] > 8) || IsPlayerAdminLevelOK(playerid, 1))
	{
		new count = 0;
		for(new i = 0; i < MAX_FIRES; i++)
		{
			if(Flame[i][Spawned] == 1)
			{
				count ++;
				RemoveFire(i);
			}
		}
		SendClientMessageF(playerid, COLOR_WHITE, "%i incêndios foram extintos", count);
	}
	else SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:togengine(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new vehicleid, status[5];
	if(sscanf(params, "is[5]", vehicleid, status)) return SysMsg(playerid, "Use: /togengine [Veiculo ID] [on/off]");
	if(vehicleid == INVALID_VEHICLE_ID) return SysMsg(playerid, "Veículo inválido.");

	if(strmatch(status, "on"))
	{
		SendClientMessageF(playerid, COLOR_RED, "Você ativou o motor deste(a) %s (%i)", GetVehicleName(vehicleid), vehicleid);
		ToggleVehicleEngine(vehicleid, 1);
	}
	if(strmatch(status, "off"))
	{
		SendClientMessageF(playerid, COLOR_RED, "Você desativou o motor deste(a) %s (%i)", GetVehicleName(vehicleid), vehicleid);
		ToggleVehicleEngine(vehicleid, 0);
	}
	return true;
}
CMD:criarcasa(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	if(GetFreeHouseArraySlot() == -1) return SysMsg(playerid, "Não há slots de casas gratuitas. (MAX_HOUSES atingiu)");

	new NewHouseCost, NewInsideID, Description[30];
	if(sscanf(params, "iis[30]", NewHouseCost, NewInsideID, Description)) return SysMsg(playerid,"Use: /criarcasa [valor] [opção interior] [descrição]");
	if(NewHouseCost < 1) return SysMsg(playerid,"O custo deve ser > 0");
	if(NewInsideID < 1 || NewInsideID > 29) return SysMsg(playerid,"Não existe tal InsideID.");

	mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO houses (Description,oPosX,oPosY,oPosZ) VALUES ('%e',%f,%f,%f)", Description, PlayerPosX(playerid), PlayerPosY(playerid), PlayerPosZ(playerid));
	mysql_pquery(conn, mquery, "InsertHouse", "ddds", playerid, NewHouseCost, NewInsideID, Description);
	return true;
}

CMD:criargaragem(playerid, params[])
{
	new GarageType, GarageHouse, Float:pos[3], Float:angle;
	if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);
	if(sscanf(params, "iif", GarageType, GarageHouse, angle)) return SysMsg(playerid,"Use: /criargaragem [tipo de garagem] [Casa ID(use /checkid)] [ângulo de saída do veículo]");

	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);

	mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO garages (HouseSQLID, GarageType, OutsideX, OutsideY, OutsideZ, InsideVW, OutsideVAngle) VALUES (%i, %i, %f, %f, %f, %i, %f)", GarageHouse, GarageType, pos[0], pos[1], pos[2], GarageHouse+60000, angle);
	mysql_pquery(conn, mquery, "InsertHouseGarage", "iiifffif", GarageHouse, GarageType, pos[0], pos[1], pos[2], GarageHouse+60000, angle);
	return true;
}


RCRP::InsertHouseGarage(playerid, GarageHouse, GarageType, Float:x, Float:y, Float:z, VW, Float:angle)
{
	new g = GetFreeGarageArraySlot();
	GarageData[g][gID] = cache_insert_id();
	GarageData[g][gHouseID] = GetHouseIDFromSQLID(GarageHouse);
	GarageData[g][gType] = GarageType;
	GarageData[g][oPosX] = x;
	GarageData[g][oPosY] = y;
	GarageData[g][oPosZ] = z;
	GarageData[g][iPosX] = 0.0;
	GarageData[g][iPosY] = 0.0;
	GarageData[g][iPosZ] = 0.0;
	GarageData[g][iAngle] = 0.0;
	GarageData[g][oAngle] = 0.0;
	GarageData[g][oVehicleAngle] = angle;
	GarageData[g][iVehicleAngle] = 0.0;
	GarageData[g][iVirtualWorld] = VW;
	GarageData[g][oVirtualWorld] = 0;
	GarageData[g][GaragePickup] = CreateDynamicPickup(1318, 23, GarageData[g][oPosX], GarageData[g][oPosY], GarageData[g][oPosZ], 0, 0, -1, 10);
	SysMsg(playerid, "A garagem foi criada.");
	return true;
}
RCRP::InsertHouse(playerid, NewHouseCost, NewInsideID, Desc[])
{
	new houseID = cache_insert_id(), vw = houseID+20000;

	mysql_format(conn, mquery, sizeof(mquery), "UPDATE houses SET Price = %i, InsideID = %i, HouseVW = %i, OwnerSQLID = 0 WHERE id = %i", NewHouseCost, NewInsideID, vw, houseID);
	mysql_pquery(conn, mquery);

	mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM houses WHERE id = %i LIMIT 1", houseID);
	mysql_pquery(conn, mquery, "LoadHouses", "d", 1);

	format(gstr, sizeof(gstr), "Casa criada '%s' por $%i", Desc, NewHouseCost);
	AdminLog(playerid, 0, "", gstr);
	return true;
}
CMD:editarcasa(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new houseid = -1;
	for(new h = 0; h < MAX_HOUSES; h++)
	{
		if(IsPlayerInRangeOfPoint(playerid,DOOR_PROXIMITY,HouseData[h][oPosX],HouseData[h][oPosY],HouseData[h][oPosZ]) && GetPlayerVirtualWorld(playerid) == HouseData[h][HouseExtVW])
		{
			houseid = h;
			break;
		}
	}
	if(houseid == -1) return SysMsg(playerid,"Você não está perto de nenhuma casa.");

	new element[10], value[30];
	if(sscanf(params, "s[10]s[30]", element, value)) return SysMsg(playerid,"Use: /editarcasa [opção] [valor] Elementos: Valor, Dono, InsideID, Nome, Steamdist");

	if(strcmp("valor", element, true) == 0)
	{
		if(!IsNumeric(value)) return SysMsg(playerid,"O custo deve ser um número.");
		new NewHouseCost = strval(value);
		if(NewHouseCost < 1) return SysMsg(playerid,"O custo deve ser > 0");

		MySQLUpdateInt(HouseData[houseid][HouseSQLID], "Price", NewHouseCost, "houses");
		HouseData[houseid][HousePrice] = NewHouseCost;

		SysMsgF(playerid, "O preço da casa é agora $%i.", HouseData[houseid][HousePrice]);
		format(gstr, sizeof(gstr), "Casa editada #%i preço para $%i", HouseData[houseid][HouseSQLID], NewHouseCost);
		AdminLog(playerid, 0, "", gstr);
		return true;
	}
	else if(strcmp("insideid", element, true) == 0)
	{
		if(!IsNumeric(value)) return SysMsg(playerid,"Inside ID deve ser um número.");
		new NewInsideID = strval(value);
		if(NewInsideID < 1 || NewInsideID > 35) return SysMsg(playerid,"ID interna inválida.");
		if(NewInsideID == HouseData[houseid][HouseInterior]) return SysMsgF(playerid, "InsideID já está %i", NewInsideID);

		if(NewInsideID == 11)
		{
			new Float:X, Float:Y, Float:Z, houseint;
			if(sscanf(params, "s[10]ifffi", element, NewInsideID, X, Y, Z, houseint)) return SysMsg(playerid,"Use: /editarcasa InsideID 11 [x] [y] [z] [interior]");//interior novo

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE houses SET intPosX = %f, intPosY = %f, intPosZ = %f, InsideID = 11, HouseInterior = %i WHERE id = %i", X, Y, Z, houseint, HouseData[houseid][HouseSQLID]);
			mysql_pquery(conn, mquery);

			HouseData[houseid][InsideID] = NewInsideID;
			HouseData[houseid][HouseInterior] = houseint;
			HouseData[houseid][intPosX] = X;
			HouseData[houseid][intPosY] = Y;
			HouseData[houseid][intPosZ] = Z;

			SysMsgF(playerid, "Casa dentro ID é agora %i. [%f, %f, %f, interior %i]", HouseData[houseid][InsideID], X, Y, Z, houseint);
			return true;
		}

		mysql_format(conn, mquery, sizeof(mquery), "UPDATE houses SET intPosX = 0.0, intPosY = 0.0, intPosZ = 0.0, InsideID = %i WHERE id = %i", NewInsideID, HouseData[houseid][HouseSQLID]);
		mysql_pquery(conn, mquery);

		HouseData[houseid][InsideID] = NewInsideID;
		HouseData[houseid][intPosX] = 0.0;
		HouseData[houseid][intPosY] = 0.0;
		HouseData[houseid][intPosZ] = 0.0;

		SysMsgF(playerid, "Casa dentro ID é agora %i.", HouseData[houseid][InsideID]);
		format(gstr, sizeof(gstr), "Casa editada #%i Inside ID para %i", houseid, NewInsideID);
		AdminLog(playerid, 0, "", gstr);
		return true;
	}
	else if(strcmp("dono", element, true) == 0)
	{
		if(strcmp(value, "None", false) == 0)
		{
			foreach(new i: Player)
			{
				if(HouseData[houseid][HouseOwnerSQLID] == SQLID[i])
				{
					HasHouseKey[i][0] = -1;
					HasHouseKey[i][1] = -1;
					ProcessHouseKey(i);
					break;
				}
			}

			HouseData[houseid][HouseOwnerSQLID] = 0;
			HouseData[houseid][HouseLocked] = 0;
			UpdateHousePickup(houseid);
			MySQLUpdateInt(HouseData[houseid][HouseSQLID], "OwnerSQLID", 0, "houses");
			format(sgstr, sizeof(sgstr), "Casa editada #%i proprietário de NONE", houseid);
			AdminLog(playerid, 0, "", sgstr);
			return true;
		}

		new accid = MySQLCheckAccount(value, playerid);
		if(accid == 0) return SysMsg(playerid, "Nenhuma conta de jogador encontrada.");

		MySQLUpdateInt(HouseData[houseid][HouseSQLID], "OwnerSQLID", accid, "houses");

		foreach(new i: Player)
		{
			if(HouseData[houseid][HouseOwnerSQLID] == SQLID[i])
			{
				HasHouseKey[i][0] = -1;
				HasHouseKey[i][1] = -1;
				ProcessHouseKey(i);
				break;
			}
		}

		HouseData[houseid][HouseOwnerSQLID] = accid;
		SysMsgF(playerid, "Proprietário da casa é agora %s.", GetSQLName(HouseData[houseid][HouseOwnerSQLID]));
		format(gstr, sizeof(gstr), "Casa editada #%i proprietário para %s", GetSQLName(HouseData[houseid][HouseOwnerSQLID]));
		AdminLog(playerid, 0, "", gstr);
		return true;
	}
	else if(strcmp("nome", element, true) == 0)
	{
		MySQLUpdateString(HouseData[houseid][HouseSQLID], "Description", value, "houses");
		format(HouseData[houseid][HouseDescription], 60, value);

		UpdateHouseLabel(houseid);

		SysMsgF(playerid, "Nome da casa é agora %s.", HouseData[houseid][HouseDescription]);
		format(gstr, sizeof(gstr), "Casa editada #%i nome para %s", HouseData[houseid][HouseSQLID], HouseData[houseid][HouseDescription]);
		AdminLog(playerid, 0, "", gstr);
		return true;
	}
	else if(strcmp("streamdist", element, true) == 0)
	{
		if(!IsNumeric(value)) return SysMsg(playerid, "Use: /editarcasa streamdist [valor] *Deve ser numérico*");

		new distance = strval(value);
		if(distance > 25) return SysMsg(playerid, "A distância deve ser 25 ou maior.");

		HouseData[houseid][ExtStreamDist] = float(distance);

		mysql_format(conn, mquery, sizeof(mquery), "UPDATE houses SET ExteriorStreamDistance = %f WHERE id = %i", float(distance), HouseData[houseid][HouseSQLID]);
		mysql_pquery(conn, mquery);

		SysMsgF(playerid, "A distância da mobília exterior da casa ajustou-se a %i", distance);
		return true;
	}
	SysMsg(playerid,"*Usage: /editarcasa [opção] [valor] Elementos: Valor, Dono, InsideID, Nome");
	return true;
}
CMD:editveh(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	if(!IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid, "Você precisa estar em um veiculo.");

	new vehicle = GetPlayerVehicleID(playerid), element[10], value[30];
	if(sscanf(params, "s[10]S()[30]", element, value)) return SysMsg(playerid,"Use: /editveh [opção] [número] Elementos: Valor, Pos, Trancado, placa");

	if(strcmp("valor", element, true) == 0)
	{
		if(vehicle == VehicleData[vehicle][IdVehicle])
		{
			if(isnull(value)) return SysMsg(playerid,"Use: /editveh valor [número]");
			if(!IsNumeric(value)) return SysMsg(playerid,"O custo deve ser um número.");
			new NewVehicleCost = strval(value);
			if(NewVehicleCost < 1) return SysMsg(playerid,"O custo deve ser > 0");

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE vehicles SET Price = %i WHERE id = %i", NewVehicleCost, VehicleData[vehicle][VehSQLID]);
			mysql_pquery(conn, mquery);

			VehicleData[vehicle][VehiclePrice] = NewVehicleCost;
			SysMsgF(playerid, "O valor do veiculo agora é $%i.", VehicleData[vehicle][VehiclePrice]);
			return true;
		}
		return SysMsg(playerid,"Você não estar em nenhum veiculo (de um proprietário).");
	}

	else if(strcmp("pos", element, true) == 0)
	{
		if(VehicleData[vehicle][IdVehicle] > 0) return SysMsg(playerid,"Você não estar em nenhum veiculo (de um proprietário).");

		new Float:vPos[4];
		GetVehiclePos(vehicle, vPos[0], vPos[1], vPos[2]);
		GetVehicleZAngle(vehicle, vPos[3]);

		mysql_format(conn, mquery, sizeof(mquery), "UPDATE vehicles SET LastX = %f, LastY = %f, LastZ = %f, LastRot = %f WHERE id = %i", vPos[0], vPos[1], vPos[2], vPos[3], VehicleData[vehicle][VehSQLID]);
		mysql_pquery(conn, mquery);

		VehicleData[vehicle][LastX] = vPos[0];
		VehicleData[vehicle][LastY] = vPos[1];
		VehicleData[vehicle][LastZ] = vPos[2];
		VehicleData[vehicle][LastRot] = vPos[3];

		SysMsg(playerid, "Posição de veiculo atualizada.");
		return true;
	}

	else if(strcmp("placa", element, true) == 0)
	{
		if(vehicle == 0) return SysMsg(playerid,"Você não estar em nenhum veiculo.");

		if(vehicle == VehicleData[vehicle][IdVehicle])
		{
			if(isnull(value)) return SysMsg(playerid,"Use: /editveh placa [novo número]");
			if(strlen(value) > MAX_REG_PLATE-1) return SysMsg(playerid,"Essa placa é muito grande.");

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE vehicles SET RegPlate = '%e' WHERE id = %i", value, VehicleData[vehicle][VehSQLID]);
			mysql_pquery(conn, mquery);

			format(VehicleData[vehicle][RegPlate], MAX_REG_PLATE, value);

			SysMsgF(playerid,"O número da placa agora é '%s'.", VehicleData[vehicle][RegPlate]);
			return true;
		}
	}
	SysMsg(playerid,"*Usage: /editveh [opção] [valor] opçãões: Valor, Pos, Fechado, Delete, Regplate");
	return true;
}
CMD:reloadgates(playerid)
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	SendRconCommand("reloadfs Doors_And_Gates");
	SendClientMessage(playerid, COLOR_WHITE, "Todos os portões e portas foram {44C300}re-carregados.");
	return true;
}
CMD:reloadpicks(playerid)
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	SendRconCommand("reloadfs picks");
	SendClientMessage(playerid, COLOR_WHITE, "Todos os portões e portas foram {44C300}re-carregados.");
	return true;
}
CMD:reloadmaps(playerid)
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	SendRconCommand("reloadfs Maps");
	SendClientMessage(playerid, COLOR_WHITE, "Todos os mapas foram {44C300}re-carregados.");
	return true;
}
CMD:reloadmaps2(playerid)
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	SendRconCommand("reloadfs Maps2");
	SendClientMessage(playerid, COLOR_WHITE, "Todos os mapas foram {44C300}re-carregados.");
	return true;
}
CMD:reloadmremovidos(playerid)
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	SendRconCommand("reloadfs mremovidos");
	SendClientMessage(playerid, COLOR_WHITE, "Todos os mapas removidos foram {44C300}re-carregados.");
	return true;
}
CMD:reloadfactions(playerid, params[])//reloadfactions
{
	new hof;
	MySQLFetchInt(MasterAccount[playerid], "HoF", hof, "masters");
	if(!IsPlayerAdminLevelOK(playerid, 4) && hof == 0) return SysMsg(playerid, AUTHMSG);

	for(new f = 0; f > 20; f++)
	{
		FACTIONS[f][FactionId] = 0;
		FACTIONS[f][FactionName][0] = 0;
		FACTIONS[f][FNameShort][0] = 0;
		FACTIONS[f][FactionSpawn1][0] = 0;
		FACTIONS[f][FactionSpawn1][1] = 0;
		FACTIONS[f][FactionSpawn1][2] = 0;
		FACTIONS[f][FactionSpawn1][3] = 0;
		FACTIONS[f][FactionSpawn2][0] = 0;
		FACTIONS[f][FactionSpawn2][1] = 0;
		FACTIONS[f][FactionSpawn2][2] = 0;
		FACTIONS[f][FactionSpawn2][3] = 0;
		FACTIONS[f][FactionSpawn3][0] = 0;
		FACTIONS[f][FactionSpawn3][1] = 0;
		FACTIONS[f][FactionSpawn3][2] = 0;
		FACTIONS[f][FactionSpawn3][3] = 0;
		FACTIONS[f][FactionSpawn4][0] = 0;
		FACTIONS[f][FactionSpawn4][1] = 0;
		FACTIONS[f][FactionSpawn4][2] = 0;
		FACTIONS[f][FactionSpawn4][3] = 0;
		FACTIONS[f][FactionSpawn5][0] = 0;
		FACTIONS[f][FactionSpawn5][1] = 0;
		FACTIONS[f][FactionSpawn5][2] = 0;
		FACTIONS[f][FactionSpawn5][3] = 0;
		FACTIONS[f][FactionSpawnVW][0] = 0;
		FACTIONS[f][FactionSpawnVW][1] = 0;
		FACTIONS[f][FactionSpawnVW][2] = 0;
		FACTIONS[f][FactionSpawnVW][3] = 0;
		FACTIONS[f][FactionSpawnVW][4] = 0;
		FACTIONS[f][FactionSpawnInt][0] = 0;
		FACTIONS[f][FactionSpawnInt][1] = 0;
		FACTIONS[f][FactionSpawnInt][2] = 0;
		FACTIONS[f][FactionSpawnInt][3] = 0;
		FACTIONS[f][FactionSpawnInt][4] = 0;
		FACTIONS[f][FactionSpawn1Name][0] = 0;
		FACTIONS[f][FactionSpawn2Name][0] = 0;
		FACTIONS[f][FactionSpawn3Name][0] = 0;
		FACTIONS[f][FactionIsGang] = 0;
		FACTIONS[f][FactionIsActive] = 0;
		FACTIONS[f][FactionBankBalance] = 0;
		FACTIONS[f][FactionRadioChannel] = 0;
		FACTIONS[f][FactionRankPay][0] = 0;
		FACTIONS[f][FactionRankPay][1] = 0;
		FACTIONS[f][FactionRankPay][2] = 0;
		FACTIONS[f][FactionRankPay][3] = 0;
		FACTIONS[f][FactionRankPay][4] = 0;
		FACTIONS[f][FactionRankPay][5] = 0;
		FACTIONS[f][FactionRankPay][6] = 0;
		FACTIONS[f][FactionRankPay][7] = 0;
		FACTIONS[f][FactionRankPay][8] = 0;
		FACTIONS[f][FactionRankPay][9] = 0;
		FACTIONS[f][FactionRankPay][10] = 0;
		FACTIONS[f][FactionRankPay][11] = 0;
		FACTIONS[f][FactionRankPay][12] = 0;
		FACTIONS[f][FactionRankPay][13] = 0;
		FACTIONS[f][FactionRankPay][14] = 0;
		FACTIONS[f][FactionPayDayTax] = 0;
		FACTIONS[f][FactionSkins][0] = 0;
		FACTIONS[f][FactionSkins][1] = 0;
		FACTIONS[f][FactionSkins][2] = 0;
		FACTIONS[f][FactionSkins][3] = 0;
		FACTIONS[f][FactionSkins][4] = 0;
		FACTIONS[f][FactionSkins][5] = 0;
		FACTIONS[f][FactionSkins][6] = 0;
		FACTIONS[f][FactionSkins][7] = 0;
		FACTIONS[f][FactionSkins][8] = 0;
		FACTIONS[f][FactionSkins][9] = 0;
		FACTIONS[f][FactionSkins][10] = 0;
		FACTIONS[f][FactionSkins][11] = 0;
		FACTIONS[f][FactionSkins][12] = 0;
		FACTIONS[f][FactionSkins][13] = 0;
		FACTIONS[f][FactionSkins][14] = 0;
		FACTIONS[f][FactionLeaderRank] = 0;
		FACTIONS[f][FactionUberLeaderRank] = 0;

		for(new x = 0; x < 15; x++)
		{
			FactionRanks[f][x][0] = EOS;
		}
	}

	mysql_pquery(conn, "SELECT * FROM factions ORDER BY id ASC", "LoadFactions");
	SendClientMessage(playerid, COLOR_WHITE, "Todos facções foram {44C300}re-carregadas.");
	AdminLog(playerid, 0, "", "Todos facções da base de dados foram recarregadas");
	return true;
}
CMD:reloadgarages(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);

	for(new i = 0; i < MAX_GARAGES; i++)
	{
		GarageData[i][gID] = 0;
		GarageData[i][gHouseID] = -1;
		GarageData[i][gType] = 0;
		GarageData[i][oPosX] = 0;
		GarageData[i][oPosY] = 0;
		GarageData[i][oPosZ] = 0;
		GarageData[i][iPosX] = 0;
		GarageData[i][iPosY] = 0;
		GarageData[i][iPosZ] = 0;
		GarageData[i][iAngle] = 0;
		GarageData[i][oAngle] = 0;
		GarageData[i][oVehicleAngle] = 0;
		GarageData[i][iVehicleAngle] = 0;
		GarageData[i][iVirtualWorld] = 0;
		GarageData[i][oVirtualWorld] = 0;
		GarageData[i][InsideInt] = 0;
		DestroyDynamicPickup(GarageData[i][GaragePickup]);
		GarageData[i][GaragePickup] = 0;
		GarageData[i][UseHouse] = false;
	}
	mysql_pquery(conn, "SELECT * FROM garages", "LoadGarages");
	SendClientMessage(playerid, COLOR_WHITE, "Todos os portões foram {44C300}re-carregados.");
	return true;
}
CMD:reloadhouse(playerid, params[]) return cmd_reloadhouses(playerid, params);
CMD:reloadhouses(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Use: /reloadhouse [todas / nome da casa]");

	if(strcmp(params, "todas", true) == 0)
	{
		for(new b = 0; b < MAX_HOUSES; b++)
		{
			if(HouseData[b][HouseSQLID] >= 1)
			{
				DestroyDynamicPickup(HouseData[b][HousePickup]);
				DeleteHouseLabel(b);
				ClearHouseFuritureVariables(b);
				ClearOutdoorFurnitureVariables(b);

				HouseData[b][HouseSQLID] = 0;
				HouseData[b][oPosX] = 0;
				HouseData[b][oPosY] = 0;
				HouseData[b][oPosZ] = 0;
				HouseData[b][intPosX] = 0;
				HouseData[b][intPosY] = 0;
				HouseData[b][intPosZ] = 0;
				HouseData[b][HouseInterior] = 0;
				HouseData[b][HouseExtVW] = 0;
				HouseData[b][HousePrice] = 0;
				HouseData[b][HouseOwnerSQLID] = 0;
				HouseData[b][HouseDescription][0] = EOS;
				HouseData[b][HouseLocked] = 0;
				HouseData[b][InsideID] = 0;
				HouseData[b][StoredCash] = 0;
				HouseData[b][StoredWeed] = 0;
				HouseData[b][StoredCocaine] = 0;
				HouseData[b][StoredMoonShine] = 0;
				HouseData[b][StoredPhone] = 0;
				HouseData[b][DoorNoteMessage][0] = 0;
				HouseData[b][HouseVW] = 0;
				HouseData[b][HousePickup] = 0;
				HouseData[b][HouseLabel] = Text3D:INVALID_3DTEXT_ID;
				HouseData[b][HouseLights] = false;
			}
		}
		mysql_tquery(conn, "SELECT * FROM houses", "LoadHouses", "d", 0);
		mysql_tquery(conn, "SELECT * FROM hfurniture ORDER BY HouseSQLID ASC", "LoadHouseFurniture");
		mysql_tquery(conn, "SELECT * FROM efurniture ORDER BY HouseSQLID ASC", "LoadExteriorHouseFurniture");


		SetTimer("ProcessHKeys", 1000, 0);
		SendClientMessage(playerid, COLOR_WHITE, "Todas as casas foram {44C300}re-carregadas.");
		AdminLog(playerid, 0, "", "Todas as casas da base de dados foram re-carregadas.");
	}
	else
	{

		new h = GetHouseLocation(params), sql;
		if(h < 0 || h >= MAX_HOUSES) return SysMsg(playerid, "A casa não é válida.");

		SendClientMessageF(playerid,COLOR_WHITE, "%s (ID %i) {44C300}recarregada", HouseData[h][HouseDescription], HouseData[h][HouseSQLID]);

		DestroyDynamicPickup(HouseData[h][HousePickup]);
		DeleteHouseLabel(h);
		ClearHouseFuritureVariables(h);
		ClearOutdoorFurnitureVariables(h);

		sql = HouseData[h][HouseSQLID];
		HouseData[h][HouseSQLID] = 0;
		HouseData[h][oPosX] = 0;
		HouseData[h][oPosY] = 0;
		HouseData[h][oPosZ] = 0;
		HouseData[h][intPosX] = 0;
		HouseData[h][intPosY] = 0;
		HouseData[h][intPosZ] = 0;
		HouseData[h][HouseInterior] = 0;
		HouseData[h][HouseExtVW] = 0;
		HouseData[h][HousePrice] = 0;
		HouseData[h][HouseOwnerSQLID] = 0;
		HouseData[h][HouseDescription][0] = EOS;
		HouseData[h][HouseLocked] = 0;
		HouseData[h][InsideID] = 0;
		HouseData[h][StoredCash] = 0;
		HouseData[h][StoredWeed] = 0;
		HouseData[h][StoredCocaine] = 0;
		HouseData[h][StoredMoonShine] = 0;
		HouseData[h][StoredPhone] = 0;
		HouseData[h][DoorNoteMessage][0] = 0;
		HouseData[h][HouseVW] = 0;
		HouseData[h][HousePickup] = 0;
		HouseData[h][HouseLabel] = Text3D:INVALID_3DTEXT_ID;
		HouseData[h][HouseLights] = false;

		mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM houses WHERE id = %i LIMIT 1", sql);
		mysql_pquery(conn, mquery, "LoadHouses", "d", 1);

		mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM hfurniture WHERE HouseSQLID = %i", sql);
		mysql_pquery(conn, mquery, "LoadHouseFurniture");

		mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM efurniture WHERE HouseSQLID = %i", sql);
		mysql_pquery(conn, mquery, "LoadExteriorHouseFurniture");

		format(tgstr, sizeof(tgstr), "Reloaded house %i", h);
		AdminLog(playerid, 0, "", tgstr);
	}
	return true;
}
CMD:reloadinteriors(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	for(new i = 0; i < MAX_INTERIORS; i++)
	{
		Interiors[i][interiorID] = 0;
		Interiors[i][oPosX] = 0;
		Interiors[i][oPosY] = 0;
		Interiors[i][oPosZ] = 0;
		Interiors[i][iPosX] = 0;
		Interiors[i][iPosY] = 0;
		Interiors[i][iPosZ] = 0;
		Interiors[i][iAngle] = 0;
		Interiors[i][oAngle] = 0;
		Interiors[i][iInteriorID] = 0;
		Interiors[i][oInteriorID] = 0;
		Interiors[i][iVirtualWorld] = 0;
		Interiors[i][oVirtualWorld] = 0;
		Interiors[i][InteriorNavTo] = 0;
		Interiors[i][IntFaction] = 0;
		Interiors[i][IntFactionRank] = 0;
		Interiors[i][InteriorName][0] = 0;
	}
	mysql_pquery(conn, "SELECT * FROM interiors", "LoadInteriors");
	SendClientMessage(playerid, COLOR_WHITE, "Todos os interior foram {44C300}recarregada.");
	return true;
}
CMD:reloadpickups(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	for(new i = 0; i < MAX_SQLPICKUPS; i++)
	{
		DestroyDynamicPickup(PickupData[i][IGPickupID]);
		PickupData[i][IGPickupID] = 0;
		PickupData[i][PickupText][0] = 0;
		PickupData[i][Xpos] = 0;
		PickupData[i][Ypos] = 0;
		PickupData[i][Zpos] = 0;
		PickupData[i][PickupModel] = 0;
		PickupData[i][WorldID] = 0;
		PickupData[i][PickupType] = 0;
	}
	mysql_pquery(conn, "SELECT * FROM pickups", "LoadAllPickups");
	SendClientMessage(playerid, COLOR_WHITE, "Todas pickups foram {44C300}recarregada.");
	return true;
}
CMD:reloadrentalcars(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	foreach(new i: Player)
	{
		if(RentalCar[i] >= 1) return SysMsg(playerid, "Há um jogador atualmente com veiculo alugado.");
	}
	for(new v = 0, x = GetVehiclePoolSize(); v <= x; v++)
	{
		if(RentalData[v][CarID] != 0)
		{
			DestroyVehicleEx(RentalData[v][CarID], "RentalData[v][CarID]");

			RentalData[v][CarSQLID] = 0;
			RentalData[v][CarID] = 0;
			RentalData[v][CarModel] = 0;
			RentalData[v][rColor1] = 0;
			RentalData[v][rColor2] = 0;
			RentalData[v][CarMileage] = 0.0;
			RentalData[v][rPosX] = 0.0;
			RentalData[v][rPosY] = 0.0;
			RentalData[v][rPosZ] = 0.0;
			RentalData[v][rRot] = 0.0;
			RentalData[v][RentalPrice] = 0;
			RentalData[v][RentalPlate][0] = 0;
		}
	}
	mysql_pquery(conn, "SELECT * FROM `rentals`", "LoadRentalCars");
	SendClientMessage(playerid, COLOR_WHITE, "Todos os veiculos de aluguel foram {44C300}Recarregada.");
	return true;
}
CMD:criarcarrodealuguel(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	if(!IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid, "Você precisa estar em um veiculo para usar esse comando.");
	if(VehicleData[GetPlayerVehicleID(playerid)][VehSQLID] >= 1) return SysMsg(playerid, "Você não pode fazer veículos de propriedade em carros de aluguer.");
	if(FVehicleData[GetPlayerVehicleID(playerid)][FVSQLID] >= 1) return SysMsg(playerid, "Você não pode fazer veículos facção em carros de aluguer.");

	new cost;
	if(sscanf(params, "i", cost)) return SysMsg(playerid, "Use: /criarcarrodealuguel [valor] *Assegure-se de que o veículo está na posição correcta e tem as cores correctas.*");

	new pos[64], Float:vpos[4], v = GetPlayerVehicleID(playerid), col[2], plate[12], model;

	GetVehiclePos(v, vpos[0], vpos[1], vpos[2]);
	GetVehicleZAngle(v, vpos[3]);
	GetVehicleColors(v, col[0], col[1]);
	model = GetVehicleModel(v);

	format(pos, sizeof(pos), "%f,%f,%f,%f", vpos[0], vpos[1], vpos[2], vpos[3]);
	format(plate, sizeof(plate), "%s", GetNewRegPlate());

	DestroyVehicleEx(v, "v 3");
	ClearVehicleData(v);

	mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO rentals (Model, Color1, Color2, Position, Price, RegPlate) VALUES (%i, %i, %i, '%e', %i, '%e')", model, col[0], col[1], pos, cost, plate);
	mysql_pquery(conn, mquery, "LoadNewRentalCar", "d", playerid);
	return true;
}
CMD:fazerveh(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new vid;
	new NewVehCost, NewC1, NewC2, donator, ownerSQLID = -1, mileage, lastoiled;

	vid = GetPlayerVehicleID(playerid);
	if(!vid) return SysMsg(playerid,"Você precisa estar dentro do veiculo.");

	if(sscanf(params, "iiiiiii", NewVehCost, NewC1, NewC2, donator, mileage, lastoiled, ownerSQLID)) return SysMsg(playerid,"Use: /fazerveh [valor] [col1] [col2] [donator 1/0] [mileage] [last oiled] [owner sqlid or 0]");
	if(NewVehCost < 1) return SysMsg(playerid,"O custo deve ser > 0");
	if(NewC1 < 0 || NewC1 > 255) return SysMsg(playerid,"As cores devem estar entre 0-255");
	if(NewC2 < 0 || NewC2 > 255) return SysMsg(playerid,"As cores devem estar entre 0-255");

	mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM vehicles WHERE OwnerSQLID = %i", ownerSQLID);
	mysql_pquery(conn, mquery, "MakeVeh", "dddddddd", playerid, NewVehCost, NewC1, NewC2, donator, mileage, lastoiled, ownerSQLID);
	return true;
}
CMD:cfv(playerid, params[])
{
	new hof;
	MySQLFetchInt(MasterAccount[playerid], "HoF", hof, "masters");
	if(!IsPlayerAdminLevelOK(playerid, 4) && hof != 1) return SysMsg(playerid, AUTHMSG);

	new Float:X, Float:Y, Float:Z, Float:Rot, model, vid, NewC1, NewC2, inter, faction, confirm[12], j;

	vid = GetPlayerVehicleID(playerid);
	if(!vid) return SysMsg(playerid,"Você precisa estar dentro do veiculo.");
	model = GetVehicleModel(vid);
	new t = 0;
	for(j = 0; j < sizeof(AllowedFactionVehs); j++)
	{
		if(model == AllowedFactionVehs[j][0])
		{
			t = 1;
			break;
		}
	}
	if(t == 0) return SysMsg(playerid, "Este veículo não é um veículo de facção aprovado.");

	if(model != AllowedFactionVehs[j][0]) return SysMsg(playerid, "Este veículo não é um veículo de facção aprovado.");
	if(sscanf(params, "iS(none)[12]", faction, confirm)) return SysMsg(playerid, "Use: /cfv [facção ID]");
	if(faction < 1 || faction > MAX_FACTIONS) return SysMsg(playerid,"Facção deve ser mais do que 0.");
	if(FACTIONS[faction][FactionId] == 0) return SysMsg(playerid, "Facção deve ser válida.");

	if(strmatch("none", confirm)) SendSplitMessageF(playerid, COLOR_LIGHTGREEN, "[CFV] Adicionou este %s na facção %s [ID %i] vai custar um total de $%s, tipo (/cfv %i confirmar) para confirmar a transação.", GetVehicleNameEx(AllowedFactionVehs[j][0]), GetFactionNameFromId(faction), faction, format_cash(AllowedFactionVehs[j][1]), faction);
	else if(strmatch("confirmar", confirm))
	{
		if(model != AllowedFactionVehs[j][0]) return SysMsg(playerid, "Este veículo não é um veículo de facção aprovado.");
		if(Cash[playerid] < AllowedFactionVehs[j][1]) return SysMsg(playerid, "Você não tem dinheiro suficiente para executar este comando.");

		new plate[8];
		GetVehiclePos(vid,X,Y,Z);
		GetVehicleZAngle(vid,Rot);
		GetVehicleColors(vid, NewC1, NewC2);
		inter = GetPlayerInterior(playerid);
		format(plate, MAX_REG_PLATE, GetNewRegPlate());

		DestroyVehicleEx(vid, "vid 0");

		mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO fveh (Model, Col1, Col2, Faction, RegPlate, MinRank, LocationX, LocationY, LocationZ, LocationR, Interior, VWorld, Creator) VALUES (%i, %i, %i, %i, '%e', 1, %f, %f, %f, %f, %i, %i, %i)",
			model, NewC1, NewC2, faction, plate, X, Y, Z, Rot, inter, GetPlayerVirtualWorld(playerid), SQLID[playerid]);
		mysql_pquery(conn, mquery, "CreateFVeh");

		GivePlayerCash(playerid, -AllowedFactionVehs[j][1]);

		SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Adicionou este %s na facção %s [ID %i] vai custar um total de $%s.", GetVehicleNameEx(AllowedFactionVehs[j][0]), GetFactionNameFromId(faction), faction, format_cash(AllowedFactionVehs[j][1]));

		format(sgstr, sizeof(sgstr), "Criado f.veh por %s(fid %i), %s", GetFactionNameFromId(faction), faction, GetVehicleName(vid));
		AdminLog(playerid, 0, "", sgstr);
	}
	return true;
}
CMD:dfv(playerid)
{
	new hof;
	MySQLFetchInt(MasterAccount[playerid], "HoF", hof, "masters");
	if(!IsPlayerAdminLevelOK(playerid, 4) && hof != 1) return SysMsg(playerid, AUTHMSG);
	if(!IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid,"Você precisa estar dentro do veiculo.");
	if(!IsFactionVehicle(GetPlayerVehicleID(playerid))) return SysMsg(playerid, "You must be in a faction vehicle.");

	new vid = GetPlayerVehicleID(playerid);
	mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM fveh WHERE id=%i LIMIT 1", FVehicleData[vid][FVSQLID]);
	mysql_pquery(conn, mquery);

	format(sgstr, sizeof(sgstr), "Deleted f.veh for %s(fid %i), %s", GetFactionNameFromId(FVehicleData[vid][FVFaction]), FVehicleData[vid][FVFaction], GetVehicleName(vid));
	AdminLog(playerid, 0, "", sgstr);

	ClearVehicleData(vid);
	DestroyVehicleEx(vid, "vid 1");

	SysMsgF(playerid, "o veiculo de facção ID %i foi deletado.", vid);
	return true;
}
CMD:fids(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	gstr[0] = EOS;
	new fname[35];

	for(new i = 1; i < MAX_FACTIONS; i++)
	{
		if(FACTIONS[i][FactionId] >= 1)
		{
			format(fname, sizeof(fname), "%i - %s\n", FACTIONS[i][FactionId], FACTIONS[i][FactionName]);
			strcat(gstr, fname);
		}
	}
	ShowMessage(playerid, "Facções ID", gstr, "OK");
	return true;
}
CMD:fedit(playerid, params[])
{
	new hof, header[64];
	MySQLFetchInt(MasterAccount[playerid], "HoF", hof, "masters");
	if(IsPlayerAdminLevelOK(playerid, 4)  || hof == 1)
	{
		if(isnull(params)) return SysMsg(playerid, "Use: /fedit [facção ID]");
		if(!IsNumeric(params)) return SysMsg(playerid, "Use: /fedit [facção ID]");
		if(strval(params) >= MAX_FACTIONS) return SysMsg(playerid, "Faction ID exceeds max factions.");
		if(FACTIONS[strval(params)][FactionId] == 0) return SysMsg(playerid, "Invalid faction.");
		new f = strval(params);

		new isgang[8], isactive[8];
		if(FACTIONS[f][FactionIsGang] == 1) format(isgang, 8, "YES");
		else format(isgang, 8, "NO");
		if(FACTIONS[f][FactionIsActive] == 1) format(isactive, 8, "YES");
		else format(isactive, 8, "NO");
		format(gstr, sizeof(gstr), "{FFFFFF}Editar nome da facção\nEditar Abv da facção. [Atual: {D9D925}%s{FFFFFF}]\nEdit Uber Rank [Atual: {D9D925}%s [%i]{ffffff}]\nEditar Rank do líder [Atual: {D9D925}%s [%i]{FFFFFF}]\nEditar líder [Atual: {D9D925}%s{FFFFFF}]\nEditar rádio freq [Atual: {D9D925}%i MHz{FFFFFF}]\nÉ Gang [{D9D925}%s{FFFFFF}]\nÉ ativa [{D9D925}%s{FFFFFF}]", FACTIONS[f][FNameShort],
		GetFactionRankName(f, FACTIONS[f][FactionUberLeaderRank]), FACTIONS[f][FactionUberLeaderRank], GetFactionRankName(f, FACTIONS[f][FactionLeaderRank]), FACTIONS[f][FactionLeaderRank], GetSQLName(FACTIONS[f][FactionLeader]), FACTIONS[f][FactionRadioChannel], isgang, isactive);

		SetPVarInt(playerid, "fEditf", f);
		format(header, sizeof(header), "Menu Editar facção - %s [ID %i]", GetFactionNameFromId(f), f);
		Dialog_Show(playerid, FactionEditMenu, DIALOG_STYLE_LIST, header, gstr, "Selecionar", "Cancelar");
	}
	else return SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:precisao(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid, "Use: /precisao [playerID ou name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(ShotsFired[playa] == 0) return SysMsg(playerid, "Este jogador não disparou nenhuma bala.");

	SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Visualizando a exatidão de {FFFFFF}%s!", NameEx(playa));
	SendClientMessageF(playerid, COLOR_WHITE, "Número de balas disparadas na sessão atual: %i. Número de balas atingidas na sessão atual: %i. Número de headshots na sessão atual: %i.", ShotsFired[playa], ShotsHit[playa], HeadshotsHit[playa]);
	SendClientMessageF(playerid, COLOR_WHITE, "Precisão de acerto total: %.2f. Porcentagem Headshot: %.2f", GetHitAccuracy(playa), GetHeadshotAccuracy(playa));
	return true;
}
CMD:userlog(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, page;
	if(sscanf(params, "ui", playa, page)) return SysMsg(playerid, "Use: /userlog [playerID ou name] [pagina 1 or 2]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(MasterAccount[playa] == 29469 && MasterAccount[playerid] == 19025) return SysMsg(playerid, "É bom tentar, amigo. Amor, Emmalee");
	if(page != 1 && page != 2) return SysMsg(playerid, "Página inválida. Insira 1 ou 2.");

	new bigstring[3000];

	sgstr[0] = EOS;
	if(page == 1)
	{
		for(new x = 24; x != -1; x--)
		{
			if(strlen(ActionLog[playa][x]))
			{
				strunpack(sgstr, ActionLog[playa][x], sizeof(sgstr));
				strcat(bigstring, sgstr);
				strcat(bigstring, "\n");
			}
		}
	}
	else
	{
		for(new x = 49; x != 24; x--)
		{
			if(strlen(ActionLog[playa][x]))
			{
				strunpack(sgstr, ActionLog[playa][x], sizeof(sgstr));
				strcat(bigstring, sgstr);
				strcat(bigstring, "\n");
			}
		}
	}

	if(!strlen(bigstring)) return SysMsg(playerid, "Não foi possível encontrar um registro de ação para este jogador.");

	new sub[32];
	format(sub, 32, "Registro de ação de %s", NameEx(playa));
	ShowMessage(playerid, sub, bigstring, "Fechar!");
	return true;
}
CMD:ccash(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /infodinheiro [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid,"Esse jogador não está conectado.");
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(!Logged{playa}) return SysMsg(playerid,"Esse jogador não está logado.");

	SendClientMessageF(playerid, COLOR_WHITE, "Detalhes financeiros de %s: Dinheiro em mãos: $%s, Saldo bancário: $%s",NameEx(playa), format_cash(Cash[playa]), format_cash(BankBalance[playa]));
	return true;
}
CMD:skiphosp(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return true;

	if(isnull(params))
	{
		ReleaseHospitalizedPlayer(playerid);
		AdminLog(playerid, 0, "", "Skipped hospital");
	}
	else
	{
		new playa = -1;
		if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /skiphosp [player id ou nome]");
		if(!IsInHospital{playa}) return SysMsg(playerid, "That player is not in the hospital.");

		ReleaseHospitalizedPlayer(playa);

		SendClientMessageF(playerid, COLOR_LIGHTGREEN,  "You have successfully skipped %s[ID %i]'s hospital time.", NameEx(playa), playa);
		format(gstr, sizeof(gstr), "[Admin] Admin %s has skipped %s[ID %i]'s hospital.", NameEx(playerid), NameEx(playa), playa);
		AdminBroadcast(gstr, 1, 3);
		SendClientMessage(playa, COLOR_LIGHTRED, "You have been discharged from hospital. Have a nice day and be careful out there!");
		AdminLog(playerid, 0, "", "Skipped hospital for a player");
	}
	return true;
}
/* CMD:ip(playerid, params[])
{
	if(isnull(params))
	{
		SendClientMessageF(playerid, COLOR_WHITE, "IP Address: %s", PlayerIP[playerid]);
		SendClientMessageF(playerid, COLOR_WHITE, "Server Latency: %ims", GetPlayerPing(playerid));
	}
	else
	{
		if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

		new playa = -1;
		if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /ip [ID ou nome do jogador]");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

		//SendClientMessageF(playerid, COLOR_WHITE, "IP Address: %s, Server Latency: %ims", PlayerIP[playa], GetPlayerPing(playa));

		SendClientMessageF(playerid, COLOR_WHITE, "IP Address: %s, Country: %s, Area: %s", PlayerIP[playa], GetPlayerCountryName(playa), GetPlayerCountryRegion(playa));
		SendClientMessageF(playerid, COLOR_WHITE, "Server Latency: %ims, ISP: %s", GetPlayerPing(playa), GetPlayerISP(playa));
	}
	return true;
} */
CMD:refundodinheiro(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 4)) return false;

	new pname[MAX_PLAYER_NAME], playa = -1, amount, sqlid = -1;
	if(sscanf(params, "s[24]i", pname, amount)) return SysMsg(playerid,"Use: /refundodinheiro [playerid ou nome] [Quantidade]");
	if(IsNumeric(pname))
	{
		if(!IsPlayerConnected(strval(pname)) || !Logged{strval(pname)}) return SysMsg(playerid, "O ID do jogador não foi conectado e conectado.");
		playa = strval(pname);
		sqlid = SQLID[playa];
	}
	else
	{
		sqlid = MySQLCheckAccount(pname, playerid);
		if(sqlid <= 0) return SysMsg(playerid, "O nome não foi encontrado. Por favor, inclua o primeiro nome, sobrenome e um título de destaque OU use o ID de identidade atual.");
	}
	if(sqlid == -1) return SysMsg(playerid, "O nome não foi encontrado. Por favor, inclua o primeiro nome, sobrenome e um título de destaque OU use o ID de identidade atual.");
	if(sqlid == SQLID[playerid] && !IsPlayerAdmin(playerid)) return SysMsg(playerid, "Não pode ser você mesmo.");

	if(amount < 1 || amount > 10000000) return SysMsg(playerid,"Amount must be more than 0 and 10,000,000 or less.");

	if(playa >= 0)
	{
		GivePlayerCash(playa, amount);
		MySQLUpdateInt(SQLID[playa], "Cash", Cash[playa], "players");

		format(gstr, sizeof(gstr),"Admin %s refundou a você $%s.", NameEx(playerid), format_cash(amount));
		SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
		format(gstr, sizeof(gstr),"[Admin] %s refundou a %s $%s.", NameEx(playerid), NameEx(playa), format_cash(amount));
		AdminBroadcast(gstr, 0);

		format(gstr, sizeof(gstr),"[%s] O jogador %s(%i) recebeu refundo de $%i do administrador %s(%i). (Total: $%i)", GetServerTimeString(), NameEx(playa), playa, amount, NameEx(playerid), playerid, Cash[playa]);
		AddToLog("cash", gstr);

		format(gstr, sizeof(gstr), "Refund cash $%i", amount);
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	}
	else
	{
		foreach(new i: Player) if(sqlid == SQLID[i]) return SysMsg(playerid, "Nada foi encontrado, use o ID do jogador.");

		new tempval;
		MySQLFetchInt(sqlid, "Cash", tempval, "players");
		tempval += amount;
		MySQLUpdateInt(sqlid, "Cash", tempval, "players");

		format(gstr, sizeof(gstr),"[Admin] %s refundou a %s $%s.", NameEx(playerid), GetSQLName(sqlid), format_cash(amount));
		AdminBroadcast(gstr, 0);

		format(gstr, sizeof(gstr),"[%s] O jogador Offline %s recebeu de refundo $%i do administrador %s(%i). (Total: $%i)", GetServerTimeString(), GetSQLName(sqlid), amount, NameEx(playerid), playerid, tempval);
		AddToLog("cash", gstr);

		format(gstr, sizeof(gstr), "Reembolso em dinheiro $%i", amount);
		AdminLog(playerid, sqlid, GetSQLName(sqlid), gstr);
	}

	return true;
}
CMD:delacc(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return false;

	new sqlid = -1;
	if(isnull(params)) return SysMsg(playerid,"Use: /delacc [Nome_Sobrenome] *Irá deletar uma conta*");
	sqlid = MySQLCheckAccount(params, playerid);
	if(sqlid <= 1) return SysMsg(playerid, "Esse nome não foi encontrado, escreva o (Nome_Sobrenome) corretamente.");
	if(sqlid == SQLID[playerid]) return SysMsg(playerid, "Não pode ser você mesmo.");

	foreach(new p: Player)
	{
		if(sqlid == SQLID[p] && Logged{p})
		{
			SendClientMessageToAllF(COLOR_RED, "Admin %s deletou permanente a conta %s.", NameEx(playerid), NameEx(p));
			KickPlayer(p, 15);
		}
	}
	format(gstr, sizeof(gstr),"[Admin] %s deletou a conta '%s' da database do servidor.", NameEx(playerid), GetSQLName(sqlid));
	AdminBroadcast(gstr, 0);
	format(gstr, sizeof(gstr), "Conta deletada %s(SQLID %i)", GetSQLName(sqlid), sqlid);
	AdminLog(playerid, 0, "", gstr);

	mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM players WHERE id = %i LIMIT 1", sqlid);
	mysql_pquery(conn, mquery);
	return true;
}
CMD:boomboxid(playerid, params[])
{
	if(!Logged{playerid}) return true;
	foreach(new p: Player)
	{
		if(IsPlayerInDynamicArea(playerid, Boomboxes[p][BoomArea]) && IsValidDynamicArea(Boomboxes[p][BoomArea]))
		{
			return SendClientMessageF(playerid, COLOR_OOC, "O ID deste boombox é %i.", p);
		}
	}
	SysMsg(playerid, "Você não está perto de uma boombox, chegue mais perto e tente novamente.");
	return true;
}
CMD:fcarlist(playerid, params[])
{
	for(new j = 0; j < sizeof(AllowedFactionVehs); j++)
	{
		printf("%s - $%s", GetVehicleNameEx(AllowedFactionVehs[j][0]), format_cash(AllowedFactionVehs[j][1]));
	}
	return true;
}
CMD:aesconder(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, CMDFMSG);

	AdminHidden[playerid] = !AdminHidden[playerid];

	if(ADuty[playerid] == 1)
	{
		ADuty[playerid] = 0;
		SetPlayerColor(playerid, 0xFFFFFF00);
		SysMsg(playerid,"O dever de administração foi desligado automaticamente.");

		if(UsingPaint{playerid}) cmd_paint(playerid);
	}

	if(AdminHidden[playerid]) SysMsg(playerid, "Você está escondido agora do /admins.");
	else SysMsg(playerid, "Você não está mais escondido do /admins.");
	return true;
}
CMD:stranger(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new stranger, playa = -1;
	if(sscanf(params, "i", stranger)) return SysMsg(playerid,"Use: /estranho [mascara ID]");

	foreach(new i: Player)
	{
		if(Logged{i} && IsPlayerMasked{i} && MaskLabelNumber[i] == stranger)
		{
			playa = i;
			break;
		}
	}

	if(playa == -1) return SysMsg(playerid,"Não há jogadores atualmente usando esse ID de mascara");

	SendClientMessageF(playerid,COLOR_YELLOW, "*Mascarado %i(%s ID %i)", stranger, NameEx(playa), playa);
	return true;
}
CMD:reportar(playerid, params[])
{
	if(!Logged{playerid}) return true;

	new AdminCount = 0;
	foreach(new i: Player) if(IsPlayerAdminLevelOK(i, 1)) AdminCount ++;
	if(AdminCount == 0) return SysMsg(playerid, "No momento não há admins/helpers online.");

	new playa = -1, reason[150], name[MAX_PLAYER_NAME];
	if(sscanf(params, "s[24]s[150]", name, reason))
	{
		SysMsg(playerid,"Use: /reportar [ID ou nome do jogador] [razão *Max 50 Caracteres*]");
		SysMsg(playerid, "Lembrete: Este comando é para reportar outros jogadores que estão quebrando regras.");
		return SysMsg(playerid, "Aviso: Use /assistencia Se você tiver uma pergunta ou exigir assistência admin.");
	}

	if(strval(name) >= 500)
	{
		foreach(new p: Player)
		{
			if(MaskLabelNumber[p] == strval(name))
			{
				playa = p;
			}
		}
	}
	else playa = GetPlayerIDs(name);
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(playa == playerid) return SysMsg(playerid,"Não pode se reportar a si mesmo.");

	SendReport(playerid, playa, reason);

	foreach(new i: Player)
	{
		if(IsPlayerAdminLevelOK(i, 1))
		{
			SendSplitMessageF(i,COLOR_YELLOW,"* Reporte de %s(%i) sobre %s(%i): %s", NameEx(playerid), playerid, NameEx(playa), playa, reason);
		}
	}

	SendClientMessage(playerid, COLOR_ORANGE, "Relatório enviado a todos os administradores on-line. Use /cancelarreporte se você não precisa mais.");
	return true;
}
CMD:cancelarreporte(playerid, params[])
{
	if(!Logged{playerid}) return true;

	new name[24], playa = -1;
	if(sscanf(params, "s[24]", name)) return SysMsg(playerid,"Use: /cancelarreporte [ID ou nome do jogador]");
	if(strval(name) >= 500)
	{
		foreach(new p: Player)
		{
			if(MaskLabelNumber[p] == strval(name))
			{
				playa = p;
			}
		}
	}
	else playa = GetPlayerIDs(name);
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(playa == playerid) return SysMsg(playerid,"Não pode se reportar.");

	new reportcancelled = 0;
	for(new x = 0; x < MAX_REPORTS; x++)
	{
		if(strmatch(Reports[x][ReportedName], NameEx(playa)))
		{
			Reports[x][ReporterName][0] = EOS;
			Reports[x][ReportedName][0] = EOS;
			Reports[x][ReportReason][0] = EOS;
			Reports[x][ReportTime] = 0;
			reportcancelled = 1;
		}
	}
	if(reportcancelled == 0) SendClientMessage(playerid, COLOR_ORANGE, "Não foi possível encontrar um reporte sobre esse jogador.");
	else SendClientMessageF(playerid, COLOR_ORANGE, "Você cancelou seu reporte. %s.", NameRP(playa));
	return true;
}
CMD:entrarevento(playerid, params[])//entrarevento
{
	if(!Logged{playerid}) return true;
	if(EventOpen == 0) return SysMsg(playerid,"Não há evento.");
	if(IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid,"Você não pode participar em um veículo.");
	if(LastEventPos[playerid][0] != -1.0) return SysMsg(playerid,"Você já está no evento.");

	GetPlayerPos(playerid, LastEventPos[playerid][0], LastEventPos[playerid][1], LastEventPos[playerid][2]);
	LastEventIDs[playerid][0] = GetPlayerInterior(playerid);
	LastEventIDs[playerid][1] = GetPlayerVirtualWorld(playerid);

	SetPlayerPos(playerid, EventData[EventX], EventData[EventY], EventData[EventZ]);
	SetPlayerInterior(playerid, EventData[EventInterior]);
	SetPlayerVirtualWorldEx(playerid, EventData[EventVW]);

	format(gstr, sizeof(gstr), "Você se juntou ao evento: %s. Use /sairevento para sair.", EventData[EventName]);
	SendClientMessage(playerid, COLOR_ORANGE, gstr);
	UnlockAchievement(playerid, 67);
	return true;
}
CMD:exitevent(playerid, params[])//sairevento
{
	if(!Logged{playerid}) return true;
	if(IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid,"Você não pode sair em um veículo.");
	if(LastEventPos[playerid][0] == -1.0) return SysMsg(playerid,"Você não está em um evento.");

	SetPlayerPos(playerid, LastEventPos[playerid][0], LastEventPos[playerid][1], LastEventPos[playerid][2]);
	SetPlayerInterior(playerid, LastEventIDs[playerid][0]);
	SetPlayerVirtualWorldEx(playerid, LastEventIDs[playerid][1]);

	LastEventPos[playerid][0] = -1.0;
	LastEventPos[playerid][1] = -1.0;
	LastEventPos[playerid][2] = -1.0;
	LastEventIDs[playerid][0] = 0;
	LastEventIDs[playerid][1] = 0;

	SendClientMessage(playerid, COLOR_ORANGE, "Você saiu do evento.");
	return true;
}
