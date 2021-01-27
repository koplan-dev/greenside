//admin commands
CMD:removeskin(playerid, params[]) return cmd_removeskin(playerid, params);
CMD:rskin(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, slot;
	if(sscanf(params, "ui", playa, slot)) return SysMsg(playerid, "Usage: /rskin [playerid or name] [skin slot 1-5]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(playa == playerid) return SysMsg(playerid, "Cannot be yourself.");
	if(slot > 5 || slot < 1) return SysMsg(playerid, "Invalid slot. Please enter 1-5.");

	slot --;
	if(Clothes[playa][slot] == 0) return SysMsg(playerid, "They do not have clothes in that slot.");
	if(Clothes[playa][slot] == cPlayersSkin[playa]) return SysMsg(playerid, "They are currently wearing that skin, get them to change it.");

	Clothes[playa][slot] = 0;
	slot ++;

	new str[10];
	format(str,sizeof(str),"SkinSet%i",slot);
	MySQLUpdateInt(SQLID[playa], str, Clothes[playa][slot-1], "players");

	SendClientMessageF(playerid, COLOR_RED, "You have removed %s's skin from slot %i.", NameEx(playa), slot);
	SendClientMessageF(playa, COLOR_RED, "Admin %s has removed your skin from slot %i.", NameEx(playerid), slot);
	return true;
}
CMD:viewskins(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid, "Usage: /viewskins [playerid or name]");
	if(InvalidPlayer(playerid)) return SysMsg(playerid, NOPLAYER);

	new tempstr[50];
	format(gstr, sizeof(gstr), "Inventory Clothes: ");

	for(new i = 0; i < 4; i++)
	{
		if(Clothes[playa][i] > 0)
		{
			format(tempstr, 50, "[Slot %i: %i] ", i+1, Clothes[playa][i]);
			strcat(gstr, tempstr);
		}
		else
		{
			format(tempstr, 50, "[Slot %i: Empty] ", i+1);
			strcat(gstr, tempstr);
		}
	}
	if(Clothes[playa][4] > 0)
	{
		format(tempstr, 50, "[Faction: %i] ", Clothes[playa][4]);
		strcat(gstr, tempstr);
	}
	else strcat(gstr, "[Faction: Empty] ");

	SendClientMessage(playerid, COLOR_WHITE, gstr);
	return true;
}
CMD:watchlist(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Usage: /watchlist [view/add/remove]");

	if(strcmp(params, "view", true) == 0)
	{
		mysql_pquery(conn, "SELECT * FROM watchlist", "ShowWatchlistInfo", "i", playerid);
	}
	else if(strfind(params, "add", true) != -1)
	{
		new option[12], maname[25], info[150];
		if(sscanf(params, "s[12]s[25]s[150]", option, maname, info)) return SysMsg(playerid, "Usage: /watchlist add [Master Account name] [information]");
		if(!strlen(maname)) return SysMsg(playerid, "Please enter a Master Account name.");
		if(!strlen(info)) return SysMsg(playerid, "You must enter information about the watchlist entry.");

		new sqlid = MySQLCheckMaster_AgainstName(maname);
		if(sqlid == 0) return SysMsg(playerid, "Unable to find an MA with that name");

		mysql_format(conn, mquery, sizeof(mquery), "SELECT NULL FROM watchlist WHERE Player = %i", sqlid);
		mysql_pquery(conn, mquery, "AddUserToWatchlist", "iiss", playerid, sqlid, maname, info);
		return true;
	}
	else if(strfind(params, "remove", true) != -1)
	{
		new option[12], id;
		if(sscanf(params, "s[12]i", option, id)) return SysMsg(playerid, "Usage: /watchlist remove [ID from /watchlist view]");

		mysql_format(conn, mquery, sizeof(mquery), "SELECT NULL FROM watchlist WHERE id = %i", id);
		mysql_pquery(conn, mquery, "ProcessWatchlistRemoval", "ii", playerid, id);
	}
	return true;
}
GREENSIDE::ShowWatchlistInfo(playerid)
{
	if(!cache_num_rows()) return SysMsg(playerid, "The watchlist is currently empty.");

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
		SendSplitMessageF(playerid, COLOR_WHITE, "Entry %i: [%s - %s]", id[i], GetMasterName(player[i]), reason[i]);
	}
	return true;
}
GREENSIDE::ProcessWatchlistRemoval(playerid, id)
{
	if(!cache_num_rows()) return SendClientMessage(playerid, COLOR_WHITE, "No watchlist entry found.");

	mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM watchlist WHERE id = %i", id);
	mysql_pquery(conn, mquery);

	SendClientMessage(playerid, COLOR_WHITE, "Watchlist entry removed.");
	return true;
}
GREENSIDE::AddUserToWatchlist(playerid, sqlid, maname[], info[])
{
	if(cache_num_rows()) return SendClientMessage(playerid, COLOR_WHITE, "This user is already on the watchlist.");

	mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO watchlist (Player, Reason, AdminSQLID) VALUES (%i, '%e', %i)", sqlid, info, SQLID[playerid]);
	mysql_pquery(conn, mquery);

	SendClientMessageF(playerid, COLOR_WHITE, "You have added %s to the watchlist.", maname);
	return true;
}
CMD:usernote(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new accountname[25], note[150];
	if(sscanf(params, "s[25]s[150]", accountname, note)) return SysMsg(playerid, "Usage: /usernote [Master Account Name] [Note]");
	if(!strlen(accountname)) return SysMsg(playerid, "You must enter an MA name");
	if(!strlen(note)) return SysMsg(playerid, "You must enter a note.");

	new sqlid = MySQLCheckMaster_AgainstName(accountname);
	if(sqlid == 0) return SysMsg(playerid, "Could not find an MA with that name");

	mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET UserNote = '%e' WHERE id = %i", note, sqlid);
	mysql_pquery(conn, mquery);

	SendClientMessageF(playerid, COLOR_WHITE, "You have added a note to %s's account.", accountname);
	return true;
}
CMD:removeusernote(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Usage: /removeusernote [Master Account name]");

	new sqlid = MySQLCheckMaster_AgainstName(params);
	if(sqlid == 0) return SysMsg(playerid, "could not find an MA with that name.");

	mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET UserNote = '' WHERE id = %i", sqlid);
	mysql_pquery(conn, mquery);

	SendClientMessageF(playerid, COLOR_WHITE, "You have removed the user note from %s's account.", params);
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
CMD:downedplayers(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new downedcount = 0;
	foreach(new i: Player)
	{
		if(Dead{i})
		{
			downedcount ++;
			SendClientMessageF(playerid, COLOR_WHITE, "%s (ID %i) is downed. Death timer: %i seconds.", NameEx(i), i, DeathTimer[i]);
		}
	}
	if(downedcount == 0) SendClientMessage(playerid, COLOR_WHITE, "No downed players currently.");
	return true;
}
CMD:paint(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, CMDFMSG);

	if(!UsingPaint{playerid})
	{
		if(ADuty[playerid] != 1) return SysMsg(playerid, "You must be on aduty to turn this on.");
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
		SendClientMessage(playerid, COLOR_RED, "[Admin] You have enabled text labels for all of the players.");
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
		SendClientMessage(playerid, COLOR_RED, "[Admin] You have disabled text labels for all of the players.");
	}
	return true;
}
CMD:pvars(playerid)
{
	new varname[128], varcount = GetPVarsUpperIndex(playerid);
	if(varcount == 0) return SendClientMessage(playerid, -1, "No PVars found on your playerid.");
	for(new i = 0; i < varcount; i++)
	{
		GetPVarNameAtIndex(playerid, i, varname, 128);
		switch(GetPVarType(playerid, varname))
		{
			case PLAYER_VARTYPE_NONE: format(sgstr, sizeof(sgstr), "pVar %i: {FF0000}UNUSED", i);
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
CMD:reports(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(IsPlayerAdminLevelOK(playerid, 1))
	{
		gstr[0] = EOS;
		for(new x = 0; x < MAX_REPORTS; x++)
		{
			if(strlen(Reports[x][ReporterName]))
			{
				format(sgstr, sizeof(sgstr), "Report from %s about %s. {FF0000}Click to view reason{FFFFFF}\n", Reports[x][ReporterName], Reports[x][ReportedName], Reports[x][ReportReason]);
				strcat(gstr, sgstr);
			}
		}
		if(!strlen(gstr)) return SysMsg(playerid, "No active reports.");
		Dialog_Show(playerid, ReportsList, DIALOG_STYLE_LIST, "Active Reports", gstr, "Details", "Close");
	}
	return true;
}
CMD:cleanupmdc(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return true;

	mysql_pquery(conn, "SELECT SuspectSQLID FROM mdc GROUP BY SuspectSQLID", "MDCCleanup", "d", playerid);
	return true;
}
GREENSIDE::MDCCleanup(playerid)
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
	SysMsgF(playerid, "%i accounts removed from MDC.", c);
	return true;
}
CMD:ah(playerid)
{
	if(!Logged{playerid}) return true;

	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	SendClientMessage(playerid, COLOR_RED, "Help > Admin Help");

	SendClientMessage(playerid, COLOR_WHITE, "Trial Admin Commands:");
	SendClientMessage(playerid, COLOR_ORANGE, "/aduty /a /kick /ban /tban /view(t|d)bans /dateban /(un)mute /dooc(un)mute /mutes /stats [id] /ip [id] /asay /aboombox /confirmname");
	SendClientMessage(playerid, COLOR_ORANGE, "/assist /assists /endassist /cars /togamsg /afklist /strangers /vehicles /vid /checkguns /checkplayer /checkaccount /removedateban");
	SendClientMessage(playerid, COLOR_ORANGE, "/ajail /acases /aunjail /getp /gotop /gotov /getv /spectate /spectateoff /rspec /vdamage /slap /slapdown /adminrecord /punish /tunban");
	SendClientMessage(playerid, COLOR_ORANGE, "/warn /warnings /ipcheck /vspec /reefer /a(un)lock /delv /ahangout /whospawned /whois /unban /setunbandate /acceptra /revive /removefires");
	SendClientMessage(playerid, COLOR_ORANGE, "/freeze /unfreeze /set /inventory [id] /gotoh /gotob /checkallguns /teleport /removemask /xyz /vget /acars /whospec /tpto /vget /acars");
	SendClientMessage(playerid, COLOR_ORANGE, "/whospec /tpto /ahide /arealookup /weaponlookup /vehiclelookup /accuracy /object /paint /downedplayers /clientid /guninfo /actionlog");
	SendClientMessage(playerid, COLOR_ORANGE, "/rskin");


	if(IsPlayerAdminLevelOK(playerid, 2))
	{
		SendClientMessage(playerid, COLOR_WHITE, "Admin Commands:");
		SendClientMessage(playerid, COLOR_ORANGE, "/disableaccount /enableaccount /v /flip /makehelper /disarm /ccash /createstillfire /fids /afrespawn");
	}

	if(IsPlayerAdminLevelOK(playerid, 3))
	{
		SendClientMessage(playerid, COLOR_WHITE, "Lead Admin Commands:");
		SendClientMessage(playerid, COLOR_ORANGE, "/an /kill [id] /bc /countdown /startevent /stopevent /gmx /cancelgmx /giveweapon /afix");
		SendClientMessage(playerid, COLOR_ORANGE, "/(un)freezeall /(give/remove)license /changepn /refunddrug");
		SendClientMessage(playerid, COLOR_ORANGE, "/(un)banip /disableaccid /doubleslap /createfire /tooc");
	}

	if(IsPlayerAdminLevelOK(playerid, 4))
	{
		SendClientMessage(playerid, COLOR_WHITE, "Management Commands:");
		SendClientMessage(playerid, COLOR_ORANGE, "/vehattach /settime /anim /fedit /cfv /dfv /rbanip /reloadfactions /refundcash /achangepass /pke /xyz /gtoghc /addfuel");
		SendClientMessage(playerid, COLOR_WHITE, "Additional commands via RCON can be found by using /rch");
	}

	SendClientMessage(playerid, COLOR_WHITE, "All commands below your rank can also be used.");
	return true;
}
CMD:adminhelp(playerid, params[]) return cmd_ah(playerid);
CMD:ahelp(playerid, params[]) return cmd_ah(playerid);
CMD:achangepass(playerid, params[])
{
	//if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);

	new accountname[MAX_PLAYER_NAME], password[50], hashpass[150], sqlid;
	if(sscanf(params, "s[20]s[50]", accountname, password)) return SysMsg(playerid,"Usage: /achangepass [ma name] [new password]");
	sqlid = MySQLCheckMaster_AgainstName(accountname);
	if(sqlid <= 1) return SysMsg(playerid,"This name was not found.");

	WP_Hash(hashpass, 150, password);
	MySQLUpdateString(sqlid, "Password", hashpass, "masters");

	format(gstr, sizeof(gstr), "You have changed %s's password to '%s'", GetSQLName(sqlid), password);
	SendClientMessage(playerid, COLOR_RED, gstr);
	AdminLog(playerid, sqlid, accountname, "Changed an accounts password");
	return true;
}
CMD:addfuel(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new fuelamount, fuelplace[6], fueltype[7];
	if(sscanf(params, "s[6]s[7]i", fuelplace, fueltype, fuelamount)) return SysMsg(playerid,"Usage: /addfuel [mont,pc,dil,bce,bcw,elq,fc,ap,aps,flint,aper] [petrol/diesel] [amount]");

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


	if(!strcmp(fueltype, "petrol"))
	{
		if(FuelStations[fidx][PetrolAmount] + fuelamount > FuelStations[fidx][PetrolAmountMax]) return SysMsg(playerid,"Station cannot hold this much fuel.");
		FuelStations[fidx][PetrolAmount] += fuelamount;
		UpdateFuelStationSign(fidx);

		format(gstr, sizeof(gstr), "Admin %s added %i gallons of Petrol to the %s gas station.", NameEx(playerid), fuelamount, FuelStations[fidx][StationDescription]);
		SendClientMessageToAllLogged(COLOR_OOC, gstr);
		format(gstr, sizeof(gstr), "Added %i petrol to %s gas station", fuelamount, FuelStations[fidx][StationDescription]);
		AdminLog(playerid, 0, "", gstr);
		return true;
	}
	else if(!strcmp(fueltype, "diesel"))
	{
		if(FuelStations[fidx][DieselAmount] + fuelamount > FuelStations[fidx][DieselAmountMax]) return SysMsg(playerid,"Station cannot hold this much fuel.");
		FuelStations[fidx][DieselAmount] += fuelamount;
		UpdateFuelStationSign(fidx);

		format(gstr, sizeof(gstr), "Admin %s added %i gallons of Diesel to the %s gas station.", NameEx(playerid), fuelamount, FuelStations[fidx][StationDescription]);
		SendClientMessageToAllLogged(COLOR_OOC, gstr);
		format(gstr, sizeof(gstr), "Added %i diesel to %s gas station", fuelamount, FuelStations[fidx][StationDescription]);
		AdminLog(playerid, 0, "", gstr);
		return true;
	}

	SysMsg(playerid,"Error with parameters.");
	return true;
}
CMD:gtogdooc(playerid)
{
	if(!Logged{playerid}) return SysMsg(playerid,"Please login first.");
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	GlobalDOOCMute = !GlobalDOOCMute;
	if(!GlobalDOOCMute) SendClientMessageToAllLogged(COLOR_DONATE, "The Donator OOC chat channel has been enabled.");
	else SendClientMessageToAllLogged(COLOR_DONATE, "The Donator OOC chat channel has been disabled.");

	return true;
}
CMD:togamsg(playerid)
{
	if(!Logged{playerid}) return SysMsg(playerid,"Please login first.");
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(ADuty[playerid] == 1) return SysMsg(playerid,"You may not modify this while on duty.");

	AdminMsgToggle{playerid} = !AdminMsgToggle{playerid};
	if(AdminMsgToggle{playerid}) SendClientMessage(playerid, COLOR_WHITE, "Certain Admin Messages are now enabled for you.");
	else SendClientMessage(playerid, COLOR_WHITE, "Certain Admin Messages are now disabled for you.");

	return true;
}
CMD:togip(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	IPTog{playerid} = !IPTog{playerid};
	if(IPTog{playerid}) SysMsg(playerid, "IP addresses will no longer show for you in joining messages.");
	else SysMsg(playerid, "IP addresses will now show for you in joining messages.");

	return true;
}
CMD:afklist(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	gstr[0] = EOS;

	foreach(new i: Player)
	{
		if(Logged{i} && IsAFK{i})
		{
			format(sgstr, sizeof(sgstr), "%s(%i) - %i minutes (Reason: %s)\n", NameEx(i), i, AwayMinutes[i], AFKReason[i]);
			strcat(gstr, sgstr);
		}
	}

	if(!strlen(gstr)) return SysMsg(playerid, "No AFK players.");
	else ShowMessage(playerid, "Server AFK List", gstr, "Ok");
	return true;
}
CMD:strangers(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new sub[60], count = 0;

	gstr[0] = EOS;
	foreach(new i: Player)
	{
		if(Logged{i} && IsPlayerMasked{i} && MaskHideName{i})
		{
			if(count > 0) format(sub, sizeof(sub), "\nStranger_%i - %s(ID %i)", MaskLabelNumber[i], NameEx(i), i);
			else format(sub, sizeof(sub), "Stranger_%i - %s(ID %i)", MaskLabelNumber[i], NameEx(i), i);
			count ++;
			strcat(gstr, sub);
		}
	}

	if(count > 0) ShowMessage(playerid, "Server Mask List", gstr, "Ok");
	return true;
}
CMD:rch(playerid)
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	SendClientMessage(playerid, COLOR_RED, "Help > RCON Admin Help");
	SendClientMessage(playerid, COLOR_WHITE, "RCON Commands:");
	SendClientMessage(playerid, COLOR_ORANGE, "/makedonator /dlevelup /selloldassets /sellbanassets /payday /setgravity");
	SendClientMessage(playerid, COLOR_ORANGE, "/kickall /healall /vlabel /delvlabel /gt /msgall /playsound /msgp /bone /sdo /plantbomb /explode /disarmbomb");
	SendClientMessage(playerid, COLOR_ORANGE, "/maths /attach /uberslap /burnmoney /stopburnmoney /blowup /setserverpass /tc /fach");
	SendClientMessage(playerid, COLOR_ORANGE, "/saction /fakeme /recordbot /stoprecord /makehouse /edithouse /reloadhouses /makeveh /editveh");
	SendClientMessage(playerid, COLOR_ORANGE, "/makepickup /makebizz /editbizz /reloadbizz /reloadpickups /croom /givexp /delacc /reloadweaponinfo");
	return true;
}
CMD:vehicles(playerid)
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

	Dialog_Show(playerid,DIALOG_NONE,DIALOG_STYLE_LIST,"Vehicle Data",gstr,"Done","");
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
	if(IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid, "You cannot spawn another vehicle while you are inside of one.");

	new vehiclename[20];
	if(sscanf(params, "s[20]", vehiclename)) return SysMsg(playerid,"Usage: /v [model name] [Optional: Primary Color] [Optional: Secondary Color]");
	if(GetVehiclePoolSize()+1 > MAX_VEHICLES) return SysMsg(playerid,"Error: Approaching Vehicle Limit.");
	new Car = GetVehicleModelIdFromName(vehiclename);
	if(Car == -1)
	{
		Car = strval(vehiclename);
		if(Car < 400 || Car > 611) return SysMsg(playerid,"That does not appear to be a valid vehicle. Please use the model name or ID.");
	}

	if(!IsPlayerAdmin(playerid))
	{
		new restrictedModels[12] = {406, 425, 432, 447, 537, 538, 569, 570, 577, 590, 592, 520};

		for(new i = 0; i < sizeof(restrictedModels); i++) if(Car == restrictedModels[i]) return SysMsg(playerid, "Vehicle is on restricted spawn.");
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

	SendClientMessageF(playerid, COLOR_LIGHTGREEN,  "Vehicle Spawned: {FFFFFF}%s{00FF00} (ID {FFFFFF}%i{00FF00}, Model {FFFFFF}%i{00FF00})", GetVehicleName(carid), carid, Car);
	format(sgstr, sizeof(sgstr), "Vehicle Spawned: %s (ID %i, Model %i)", GetVehicleName(carid), carid, Car);
	AdminLog(playerid, 0, "", sgstr);
	return true;
}
CMD:veh(playerid, params[]) return cmd_v(playerid, params);
CMD:whospawned(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new vehid = GetPlayerVehicleID(playerid);
	if(vehid == 0) if(sscanf(params, "i", vehid)) return SysMsg(playerid,"Usage: /whospawned [vehicle id] OR /whospawned if you're in a vehicle");

	new whospawned[MAX_PLAYER_NAME], h, m, diff = gettime() - VehicleSpawnedBy[vehid][1];

	if(VehicleSpawnedBy[vehid][0] == 0) format(whospawned, MAX_PLAYER_NAME, "the Server");
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
	SendClientMessageF(playerid, COLOR_WHITE, "[%s, ID %i] Spawned by %s %ih and %im ago.", GetVehicleName(vehid), vehid, whospawned, h, m);
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
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid,"You are not authorized to use that command.");
	gstr[0] = EOS;
	for(new v = 1, x = GetVehiclePoolSize(); v <= x; v++)
	{
		if(VehicleSpawnedBy[v][0] != 0)
		{
			format(gstr, sizeof(gstr), "%s%i - %s - Spawned by: %s\n", gstr, v, GetVehicleName(v), GetSQLName(VehicleSpawnedBy[v][0]));
			count++;
		}
	}
	if(count == 0) return SysMsg(playerid,"There are no admin spawned vehicles at this time.");
	Dialog_Show(playerid, AdminCarList, DIALOG_STYLE_LIST, "Admin Vehicles", gstr, "Despawn", "Cancel");
	return true;
}

CMD:setvh(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new vid = GetPlayerVehicleID(playerid);
	if(vid > 0)
	{
		SetVehicleHealthEx(vid, strval(params));
		SysMsgF(playerid, "Vehicle Health Set To %i.", strval(params));
	}
	return true;
}
CMD:ln(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	SendClientMessageF(playerid, COLOR_WHITE, "Draw: %i", WinningLotteryNumber);
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
		format(gstr, sizeof(gstr), "Vehicle Flipped: %s(%i)", GetVehicleName(id),id);
		SendClientMessage(playerid, COLOR_LIGHTGREEN,  gstr);
	}
	else return SysMsg(playerid,"You are not in a vehicle.");

	return true;
}
CMD:flip(playerid, params[]) return cmd_fl(playerid, params);
CMD:giveweapon(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, gunid[30], reason[8];

	if(sscanf(params, "us[30]s[8]", playa, gunid, reason)) return SysMsg(playerid,"Usage: /giveweapon [player id or name] [weapon id/part of name] [event/refund/faction]");

	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(GetFreeWeaponObjectIndex(playa) == -1) return SysMsg(playerid, "That player can't carry another weapon right now, they have too many holstered.");

	new wid;
	if(!IsNumeric(gunid)) wid = GetWeaponIdFromName(gunid);
	else wid = strval(gunid);

	if(wid == -1) return SysMsg(playerid,"Invalid Weapon.");
	if(wid < 0 || wid > 47) return SysMsg(playerid,"Invalid Weapon.");
	if(wid == 19 || wid == 20 || wid == 21) return SysMsg(playerid,"Invalid Weapon.");

	new ammo = GetDefaultWeaponAmmo(wid);
	if(!IsPlayerAdmin(playa) && IsBanWeapon(wid)) return SysMsg(playerid,"That player can't have that weapon.");

	new wname[30];
	wname = GetWeaponNameFromID(wid);
	if(!WeaponCheck(playa, wid) && IsActualGun(wid)) return SysMsg(playerid, "This player cannot take this weapon. They either have two sidearms or one primary weapon plus a sidearm on their person.");
	if(WeaponData[playa][GetWeaponSlot(wid)][Weapon] >= 1) return SysMsg(playerid, "This player already has a weapon in that slot.");

	if(strcmp("refund", reason, true) == 0)
	{
		GivePlayerWeaponEx(playa, wid, ammo, 1, -1, 1, SQLID[playerid]);

		format(sgstr, sizeof(sgstr),"Admin %s refunded you a weapon: %s(Id:%i) Ammo: %i", NameEx(playerid), wname, wid, ammo);
		SendClientMessage(playa, COLOR_LIGHTGREEN,  sgstr);
		format(sgstr, sizeof(sgstr),"[Admin] %s refunded %s a weapon: %s(Id:%i) Ammo: %i", NameEx(playerid), NameEx(playa), wname, wid, ammo);
		AdminBroadcast(sgstr, 1);
		format(sgstr, sizeof(sgstr), "Give weapon %s, ammo=%i, reason=Refund", wname, ammo);
		AdminLog(playerid, SQLID[playa], GetName(playa), sgstr);
	}
	else if(strcmp("event", reason, true) == 0)
	{
		GivePlayerWeapon(playa, wid, ammo);
		HasEventWeapon{playa} = true;

		format(sgstr, sizeof(sgstr),"Admin %s gave you a weapon for an event: %s(Id:%i) Ammo: %i", NameEx(playerid), wname, wid, ammo);
		SendClientMessage(playa, COLOR_LIGHTGREEN,  sgstr);
		format(sgstr, sizeof(sgstr),"[Admin] %s gave %s a weapon for an event: %s(Id:%i) Ammo: %i", NameEx(playerid), NameEx(playa), wname, wid, ammo);
		AdminBroadcast(sgstr, 1);
		format(sgstr, sizeof(sgstr), "Give weapon %s, ammo=%i, reason=Event", wname, ammo);
		AdminLog(playerid, SQLID[playa], GetName(playa), sgstr);

		format(sgstr, sizeof(sgstr), "[%s] %s (%i) has been given %s with %i ammo. [EVENT]", GetServerTimeString(), NameEx(playa), playa, weaponstring[wid], ammo);
	}
	else if(strcmp("faction", reason, true) == 0)
	{
		GivePlayerWeaponEx(playa, wid, ammo, 3, -1, 1, SQLID[playerid]);

		format(sgstr, sizeof(sgstr),"Admin %s refunded you a faction weapon: %s(Id:%i) Ammo: %i", NameEx(playerid), wname, wid, ammo);
		SendClientMessage(playa, COLOR_LIGHTGREEN,  sgstr);
		format(sgstr, sizeof(sgstr),"[Admin] %s refunded %s a faction weapon: %s(Id:%i) Ammo: %i", NameEx(playerid), NameEx(playa), wname, wid, ammo);
		AdminBroadcast(sgstr, 1);
		format(sgstr, sizeof(sgstr), "Give weapon %s, ammo=%i, reason=Faction Wep", wname, ammo);
		AdminLog(playerid, SQLID[playa], GetName(playa), sgstr);
	}
	else SysMsg(playerid,"Usage: /giveweapon [player id or name] [weapon id/part of name] [event/refund]");
	return true;
}
CMD:guninfo(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid, "Usage: /guninfo [playerid or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

	mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM weapons WHERE WeaponPossession = 1 AND OwnerSQLID = %i AND Deleted = 0", SQLID[playa]);
	mysql_pquery(conn, mquery, "ShowWeaponInfo", "i", playerid);
	return true;
}
GREENSIDE::ShowWeaponInfo(playerid)
{
	if(!cache_num_rows()) return SysMsg(playerid, "This player does not have any weapons on their client.");

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
		SendSplitMessageF(playerid, COLOR_BLUE, "[Weapon ID %i (%s, %i ammo)] Creator name: %s, Origin: %s, Timestamp %s", id[i], GetWeaponNameFromID(weaponid[i]), ammo[i], GetSQLName(creator[i]), GetWeaponOrigin(origin[i]), UnixDate(timestamp[i], 0, 0));
	}
	return true;
}
stock GetWeaponOrigin(origin)
{
	new worigin[32];
	switch(origin)
	{
		case 1: worigin = "Admin Refund";
		case 2: worigin = "Illegal Weapon";
		case 3: worigin = "Faction Weapon";
		case 4: worigin = "Licensed Weapon";
		case 7: worigin = "Storebought Item";
	}
	return worigin;
}
CMD:cg(playerid, params[]) return cmd_checkguns(playerid, params);
CMD:checkguns(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /checkguns [playerid/name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");

	new clientID, clientAmmo, wCount = 0;

	for(new w = 0; w < MAX_TOTAL_WEAPONS; w++)
	{
		GetPlayerWeaponData(playa, w, clientID, clientAmmo);

		if(clientID == WEAPON_SILENCED && HasTaser{playa}) continue;

		if(clientID > 0 || WeaponData[playa][w][Weapon] > 0)
		{
			if(clientID == WeaponData[playa][w][Weapon] && WeaponData[playa][w][WeaponID] != 0)
			{
				SendClientMessageF(playerid, 0x63FF2DFF, "[SERVER & CLIENT] %s(ID %i) Slot %i | %s(ID %i - %i C.Ammo - %i S.Ammo)", NameEx(playa), playa, w, GetWeaponNameFromID(clientID), clientID, clientAmmo, WeaponData[playa][w][WeaponAmmo]);
				wCount ++;
			}
			else if(clientID != WeaponData[playa][w][Weapon] && WeaponData[playa][w][Weapon] == 0 && clientAmmo > 0 && WeaponData[playa][w][WeaponID] == 0)
			{
				SendClientMessageF(playerid, 0xF2CD3BFF, "[CLIENT ONLY] %s(ID %i) Slot %i | %s(ID %i - %i C.Ammo - %i S.Ammo)", NameEx(playa), playa, w, GetWeaponNameFromID(clientID), clientID, clientAmmo, WeaponData[playa][w][WeaponAmmo]);
				wCount ++;
			}
			else if(clientID != WeaponData[playa][w][Weapon] && clientID == 0)
			{
				SendClientMessageF(playerid, 0xF2CD3BFF, "[SERVER ONLY] %s(ID %i) Slot %i | %s(ID %i - %i C.Ammo - %i S.Ammo)", NameEx(playa), playa, w, GetWeaponNameFromID(WeaponData[playa][w][Weapon]), WeaponData[playa][w][Weapon], clientAmmo, WeaponData[playa][w][WeaponAmmo]);
				wCount ++;
			}
		}
	}

	if(wCount == 0) SendClientMessage(playerid, COLOR_LIGHTBLUE, "This player has no weapons to show.");

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
					format(gstr, sizeof(gstr),"%s (ID %i) Possible Hack - Slot %i, Weapon %s(ID %i), %i Ammo", NameEx(i), i, w, GetWeaponNameFromID(clientID), clientID, clientAmmo);
					SendClientMessage(playerid, COLOR_DARKBLUE, gstr);
				}
			}
		}
	}

	SendClientMessage(playerid, COLOR_DARKBLUE, "Checked all players for hacked weapons.");
	return true;
}
CMD:refunddrug(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new pname[MAX_PLAYER_NAME], playa = -1, drug[10], amount;
	if(sscanf(params, "s[24]s[10]i", pname, drug, amount)) return SysMsg(playerid,"Usage: /refunddrug [player id OR Full_Name] [weed/cocaine/moonshine] [amount]");
	new sqlid = -1;
	if(IsNumeric(pname))
	{
		if(!IsPlayerConnected(strval(pname)) || !Logged{strval(pname)}) return SysMsg(playerid, "Player ID was not connected and logged in.");
		playa = strval(pname);
		sqlid = SQLID[playa];
	}
	else
	{
		sqlid = MySQLCheckAccount(pname, playerid);
		if(sqlid <= 0) return SysMsg(playerid, "Name was not found. Please include first name, last name and an underscore OR use there current ingame ID.");
	}
	if(sqlid == -1) return SysMsg(playerid, "Name was not found. Please include first name, last name and an underscore OR use there current ingame ID.");
	if(sqlid == SQLID[playerid] && !IsPlayerAdmin(playerid)) return SysMsg(playerid, "Cannot be yourself.");

	if(playa >= 0)
	{
		if(strcmp("weed", drug, true) == 0)
		{
			if(amount < 1) return SysMsg(playerid,"That amount was invalid.");
			if(amount + Inventory[playa][Weed] > DRUG_MAX_WEED) return SysMsgF(playerid, "Invalid amount, %s wouldnt be able to carry that much Weed. You can give a maximum of %i grams.", NameEx(playa), DRUG_MAX_WEED - Inventory[playa][Weed]);

			Inventory[playa][Weed] += amount;
			MySQLUpdateInt(SQLID[playa], "Weed", Inventory[playa][Weed], "players");

			format(gstr, sizeof(gstr),"Admin %s has refunded you %i grams of Weed.", NameEx(playerid), amount);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"[Admin] %s has refunded %s %i grams of Weed.", NameEx(playerid), NameEx(playa), amount);
			AdminBroadcast(gstr, 0);
			format(gstr, sizeof(gstr), "Refund drug %i x %s", amount, drug);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(strcmp("cocaine", drug, true) == 0)
		{
			if(amount < 1) return SysMsg(playerid,"That amount was invalid.");
			if(amount + Inventory[playa][Cocaine] > DRUG_MAX_COCAINE) return SysMsgF(playerid, "Invalid amount, %s wouldnt be able to carry that much Cocaine. You can give a maximum of %i grams.", NameEx(playa), DRUG_MAX_COCAINE - Inventory[playa][Cocaine]);

			Inventory[playa][Cocaine] += amount;
			MySQLUpdateInt(SQLID[playa], "Cocaine", Inventory[playa][Cocaine], "players");

			format(gstr, sizeof(gstr),"Admin %s has refunded you %i grams of Cocaine.", NameEx(playerid), amount);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"[Admin] %s has refunded %s %i grams of Cocaine.", NameEx(playerid), NameEx(playa), amount);
			AdminBroadcast(gstr, 0);
			format(gstr, sizeof(gstr), "Refund drug %i x %s", amount, drug);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(strcmp("moonshine", drug, true) == 0)
		{
			if(amount < 1) return SysMsg(playerid,"That amount was invalid.");
			if(amount + Inventory[playa][MoonShine] > DRUG_MAX_MOONSHINE) return SysMsgF(playerid, "Invalid amount, %s wouldnt be able to carry that much MoonShine. You can give a maximum of %i litre(s).", NameEx(playa), DRUG_MAX_MOONSHINE - Inventory[playa][MoonShine]);

			Inventory[playa][MoonShine] += amount;
			MySQLUpdateInt(SQLID[playa], "MoonShine", Inventory[playa][MoonShine], "players");

			format(gstr, sizeof(gstr),"Admin %s has refunded you %i litre(s) of MoonShine.", NameEx(playerid), amount);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"[Admin] %s has refunded %s %i litre(s) of MoonShine.", NameEx(playerid), NameEx(playa), amount);
			AdminBroadcast(gstr, 0);
			format(gstr, sizeof(gstr), "Refund drug %i x %s", amount, drug);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
	}
	else
	{
		foreach(new i: Player) if(sqlid == SQLID[i]) return SysMsg(playerid, "Full_Name cannot be an online player, use the player ID instead.");

		if(strcmp("weed", drug, true) == 0)
		{
			if(amount < 1) return SysMsg(playerid,"That amount was invalid.");

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE players SET Weed = Weed + %i WHERE id = %i", amount, sqlid);
			mysql_pquery(conn, mquery);
			format(gstr, sizeof(gstr),"[Admin] %s has refunded %s %i grams of Weed.", NameEx(playerid), GetSQLName(sqlid), amount);
			AdminBroadcast(gstr, 0);
			format(gstr, sizeof(gstr), "Refund drug %i x %s", amount, drug);
			AdminLog(playerid, sqlid, GetSQLName(sqlid), gstr);
			return true;
		}
		if(strcmp("cocaine", drug, true) == 0)
		{
			if(amount < 1) return SysMsg(playerid,"That amount was invalid.");

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE players SET Cocaine = Cocaine + %i WHERE id = %i", amount, sqlid);
			mysql_pquery(conn, mquery);
			format(gstr, sizeof(gstr),"[Admin] %s has refunded %s %i grams of Cocaine.", NameEx(playerid), GetSQLName(sqlid), amount);
			AdminBroadcast(gstr, 0);
			format(gstr, sizeof(gstr), "Refund drug %i x %s", amount, drug);
			AdminLog(playerid, sqlid, GetSQLName(sqlid), gstr);
			return true;

		}
		if(strcmp("moonshine", drug, true) == 0)
		{
			if(amount < 1) return SysMsg(playerid,"That amount was invalid.");

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE players SET MoonShine = MonnShine + %i WHERE id = %i", amount, sqlid);
			mysql_pquery(conn, mquery);
			format(gstr, sizeof(gstr),"[Admin] %s has refunded %s %i litres of MoonShine.", NameEx(playerid), GetSQLName(sqlid), amount);
			AdminBroadcast(gstr, 0);
			format(gstr, sizeof(gstr), "Refund drug %i x %s", amount, drug);
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
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /checkplayer [playerid/name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
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

	SendClientMessageF(playerid, COLOR_LIGHTBLUE, "Player Data - %s ID:%i - State: %s - Completed Tutorial: %s",NameEx(id),id, GetPlayerStateEx(id), tutstatus);
	SendClientMessageF(playerid, COLOR_WHITE, "Health: %.0f(Server:%f) - Armour: %.0f(Server:%f) - Armed Weapon: %s(%i)",Health,HealthVar[id],Armour,ArmourVar[id],GetWeaponNameFromID(armedWeapon),armedWeapon);
	SendClientMessageF(playerid, COLOR_WHITE, "Cash Server: %i - Cash Client: %i",Cash[id],GPM);
	SendClientMessageF(playerid,COLOR_WHITE, "Location: %s (%f[X], %f[Y], %f[Z], %f[RA]) - Interior ID: %i - VW: %i", zone, X, Y, Z, Ang, Interior, World);
	if(IsPlayerInAnyVehicle(id)) SendClientMessageF(playerid, COLOR_WHITE, "Vehicle info: %s - %i", GetVehicleName(GetPlayerVehicleID(id)), GetPlayerVehicleID(id));
	return true;
}
CMD:cp(playerid, params[]) return cmd_checkplayer(playerid, params);
CMD:givelicense(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, licensename[6];
	if(sscanf(params, "us[6]", playa, licensename)) return SysMsg(playerid,"Usage: /givelicense [player id or name] [car/bike/boat/plane/heli/large]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");

	new lic = -1, sqlname[24];
	if(strcmp("car", licensename, true) == 0) { lic = 0; sqlname = "LicenseCar"; }
	else if(strcmp("large", licensename, true) == 0) { lic = 1; sqlname = "LicenseLargeVehicle"; }
	else if(strcmp("bike", licensename, true) == 0) { lic = 2; sqlname = "LicenseBike"; }
	else if(strcmp("boat", licensename, true) == 0) { lic = 3; sqlname = "LicenseBoat"; }
	else if(strcmp("heli", licensename, true) == 0) { lic  = 4; sqlname = "LicenseHelicopter"; }
	else if(strcmp("plane", licensename, true) == 0) { lic = 5; sqlname = "LicensePlane"; }

	else return SysMsg(playerid,"No such license.");

	if(Licenses[playa][lic] == 1) return SysMsg(playerid,"They already have this license.");
	Licenses[playa][lic] = 1;
	MySQLUpdateInt(SQLID[playa], sqlname, Licenses[playa][lic], "players");

	for(new tu = 0; tu < sizeof(licensename); tu++) licensename[tu] = toupper(licensename[tu]);
	format(gstr, sizeof(gstr),"Admin %s gave you a %s license.", NameEx(playerid), licensename);
	SendClientMessage(playa,COLOR_WHITE, gstr);
	format(gstr, sizeof(gstr),"You gave %s a %s license.", NameEx(playa), licensename);
	SendClientMessage(playerid,COLOR_WHITE, gstr);

	format(gstr, sizeof(gstr), "Give %s license", licensename);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	return true;
}
CMD:removelicense(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, licensename[6];
	if(sscanf(params, "us[6]", playa, licensename)) return SysMsg(playerid,"Usage: /removelicense [player id or name] [car/bike/boat/plane/heli/large]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");

	new lic = -1, sqlname[24];
	if(strcmp("car", licensename, true) == 0) { lic = 0; sqlname = "LicenseCar"; }
	else if(strcmp("large", licensename, true) == 0) { lic = 1; sqlname = "LicenseLargeVehicle"; }
	else if(strcmp("bike", licensename, true) == 0) { lic = 2; sqlname = "LicenseBike"; }
	else if(strcmp("boat", licensename, true) == 0) { lic = 3; sqlname = "LicenseBoat"; }
	else if(strcmp("heli", licensename, true) == 0) { lic  = 4; sqlname = "LicenseHelicopter"; }
	else if(strcmp("plane", licensename, true) == 0) { lic = 5; sqlname = "LicensePlane"; }
	else return SysMsg(playerid,"No such license.");

	if(Licenses[playa][lic] == 0) return SysMsg(playerid,"They don't have this license.");
	Licenses[playa][lic] = 0;
	MySQLUpdateInt(SQLID[playa], sqlname, Licenses[playa][lic], "players");

	for(new tu = 0; tu < sizeof(licensename); tu++) licensename[tu] = toupper(licensename[tu]);
	SendClientMessageF(playa,COLOR_WHITE, "Admin %s has removed your %s license.", NameEx(playerid), licensename);
	SendClientMessageF(playerid,COLOR_WHITE, "You removed %s's %s license.", NameEx(playa), licensename);

	format(gstr, sizeof(gstr), "Remove %s license", licensename);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	return true;
}
CMD:checkaccount(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Usage: /checkaccount [Firstname_Lastname OR in-game id]");

	new sqlid = -1, maid = -1;
	if(IsNumeric(params))
	{
		new pid = strval(params);
		if(pid < 0 || pid >= MAX_PLAYERS) return SysMsg(playerid,"Invalid ID");
		if(!IsPlayerConnected(pid)) return SysMsg(playerid,"Player ID is not connected.");
		if(!Logged{pid}) return SysMsg(playerid,"Player ID is not logged in, SQLID could not be found.");

		sqlid = SQLID[pid];
		maid = MasterAccount[pid];
	}
	else
	{
		sqlid = MySQLCheckAccount(params, playerid);
		maid = MySQLCheckMaster_AgainstSQLID(sqlid);
	}

	if(sqlid <= 0) return SysMsg(playerid, "Name was not found. Please include first name, last name and an underscore or just use the in-game ID.");

	mysql_format(conn, mquery, sizeof(mquery), "SELECT RegisterDate, IP, RecentIP, RecentSerial, AccountDisabled, Online FROM players WHERE id = %i", sqlid);
	mysql_pquery(conn, mquery, "CheckAccountData", "iii", playerid, sqlid, maid);
	return true;
}
CMD:whois(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Usage: /whois [Firstname_Lastname / MA Name or in-game id]");

	new sqlid = -1;

	if(IsNumeric(params))
	{
		new pid = strval(params);
		if(pid < 0 || pid >= MAX_PLAYERS) return SysMsg(playerid,"Invalid ID");
		if(!IsPlayerConnected(pid)) return SysMsg(playerid,"Player ID is not connected.");
		if(!Logged{pid}) return SysMsg(playerid,"Player ID is not logged in, thus SQLID could not be found.");

		sqlid = SQLID[pid];
	}
	else sqlid = MySQLCheckAccount(params, playerid);

	new masterID;
	if(sqlid <= 0) masterID = MySQLCheckMaster_AgainstName(params);
	else masterID = MySQLCheckMaster_AgainstSQLID(sqlid);

	if(masterID <= 0) return SysMsg(playerid, "Name was not found. Please include first name, last name and an underscore or just use the in-game ID.");

	mysql_format(conn, mquery, sizeof(mquery), "SELECT Username,EMail,GeoDetails,RegTimeStamp FROM masters WHERE id=%i LIMIT 1", masterID);
	mysql_pquery(conn, mquery, "WhoIsPrime", "ddd", playerid, sqlid, masterID);
	return true;
}
CMD:aduty(playerid, params[])
{
	if(!Logged{playerid}) return SysMsg(playerid,"Please login first.");
	if(!IsPlayerAdminLevelOK(playerid, 1)) return true;

	if(isnull(params)) return SysMsg(playerid,"Usage: /aduty ['on' / 'off' / 'dnd']");

	if(strcmp("on",params,true) == 0)
	{
		if(ADuty[playerid] == 1) return SysMsg(playerid, "Admin Duty is already on.");
		if(IsAFK{playerid}) return SysMsg(playerid, "You are AFK.");
		if(AdminHidden[playerid]) return SysMsg(playerid, "You are incognito.");

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
		if(ADuty[playerid] == 0) return SysMsg(playerid, "Admin Duty is already off.");

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
		SysMsg(playerid,"Admin Duty off, enjoy your roleplay.");
		AdminLog(playerid, 0, "", "Admin duty off");
		return true;
	}
	else if(strcmp("dnd",params,true) == 0)
	{
		if(ADuty[playerid] == 1) cmd_aduty(playerid, "off");
		if(ADuty[playerid] == 2) return SysMsg(playerid, "Admin Duty is already DND.");

		ADuty[playerid] = 2;
		SetPlayerColor(playerid, 0xFFFFFF00);
		SysMsg(playerid,"Set to do not disturb.");
		AdminLog(playerid, 0, "", "Admin duty DND");
		return true;
	}

	SysMsg(playerid,"Usage: /aduty ['on' / 'off' / 'dnd']");
	return true;
}
CMD:adminrecord(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Usage: /adminrecord [Firstname_Lastname OR Player ID]");
	new sqlid = -1;
	if(IsNumeric(params))
	{
		if(!IsPlayerConnected(strval(params)) || !Logged{strval(params)}) return SysMsg(playerid, "Player ID was not connected and logged in.");
		sqlid = SQLID[strval(params)];
	}
	else
	{
		sqlid = MySQLCheckAccount(params, playerid);
	}

	if(sqlid <= 0) return SysMsg(playerid, "Name was not found. Please include first name, last name and an underscore OR use there current ingame ID.");

	ViewAdminRecord[playerid] = sqlid;
	Dialog_Show(playerid, AdminRecordMenu, DIALOG_STYLE_LIST, "Admin Record", "{FFFFFF}VIEW {FFCE2E}GENERAL{FFFFFF} RECORD\nView {FFCE2E}Kick{FFFFFF} Log\nView {FFCE2E}Perm Ban{FFFFFF} Log\nView {FFCE2E}Temp Ban{FFFFFF} Log\nView {FFCE2E}Date Ban{FFFFFF} Log\nView {FFCE2E}Admin Jail{FFFFFF} Log\nView {FFCE2E}Mute{FFFFFF} Log", "Select", "Cancel");
	return true;
}
CMD:myadminrecord(playerid, params[])
{
	if(!Logged{playerid}) return true;

	mysql_format(conn, mquery, sizeof(mquery), "SELECT COUNT(*) AS punishments, RecordType FROM adminrecord WHERE PlayerSQLID = %i GROUP BY RecordType", SQLID[playerid]);
	mysql_pquery(conn, mquery, "LoadMyAdminRecord", "i", playerid);
	return true;
}
GREENSIDE::LoadMyAdminRecord(playerid)
{
	gstr[0] = EOS;

	new punishments[7];
	for(new i = 0, r = cache_num_rows(); i < r; i++)
	{
		punishments[cache_get_field_content_int(i, "RecordType")] = cache_get_field_content_int(i, "punishments");
	}

	strcat(gstr, "{B42E26}MY ADMIN RECORD\n\n{FFFFFF}Below you can find a basic version of your Admin Record.\n");
	strcat(gstr, "It does not include details such as reasons and dates since it is only intended to be a quick overview for joining factions etc.\n\n\n");

	format(sgstr, sizeof(sgstr), "{FFFFFF}Total Times Kicked: {249CFF}%i\n", punishments[ADMIN_RECORD_TYPE_KICK]);
	strcat(gstr, sgstr);

	format(sgstr, sizeof(sgstr), "{FFFFFF}Total Times Perm Banned: {249CFF}%i\n", punishments[ADMIN_RECORD_TYPE_PERMBAN]);
	strcat(gstr, sgstr);

	format(sgstr, sizeof(sgstr), "{FFFFFF}Total Times Temp Banned: {249CFF}%i\n", punishments[ADMIN_RECORD_TYPE_TEMPBAN]);
	strcat(gstr, sgstr);

	format(sgstr, sizeof(sgstr), "{FFFFFF}Total Times Date Banned: {249CFF}%i\n", punishments[ADMIN_RECORD_TYPE_DATEBAN]);
	strcat(gstr, sgstr);

	format(sgstr, sizeof(sgstr), "{FFFFFF}Total Times Admin Jailed: {249CFF}%i\n", punishments[ADMIN_RECORD_TYPE_AJAIL]);
	strcat(gstr, sgstr);

	format(sgstr, sizeof(sgstr), "{FFFFFF}Total Times Muted: {249CFF}%i\n", punishments[ADMIN_RECORD_TYPE_MUTE]);
	strcat(gstr, sgstr);

	ShowMessage(playerid, "Admin Record", gstr, "OK");
	return true;
}
CMD:warn(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, reason[100];
	if(sscanf(params, "us[100]", playa, reason)) return SysMsg(playerid,"Usage: /warn [player id or name] [reason]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(IsPlayerAdminLevelOK(playa, 1)) return SysMsg(playerid,"Cannot warn an Admin.");

	if(SQLID[playa] > 0)
	{
		new datestring[12], y, m, d;
		getdate(y, m, d);
		format(datestring, sizeof(datestring), "%i/%i/%i", d, m, y);
		mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO warnings (PlayerSQLID,AdminName,Reason,Datestamp) VALUES (%i,'%e','%e','%e')", SQLID[playa], NameEx(playerid), reason, datestring);
		mysql_pquery(conn, mquery, "");
	}

	format(gstr, sizeof(gstr),"* ADMIN WARNING from %s: %s", NameEx(playerid), reason);
	SendClientMessage(playa, COLOR_RED, gstr);
	SendClientMessage(playa, COLOR_WHITE, "* Further breach of the server rules will force the admin team to take action.");
	format(gstr, sizeof(gstr),"[Admin] %s warns %s (%s)", NameEx(playerid), NameEx(playa), reason);
	AdminBroadcast(gstr, 1);
	format(gstr, sizeof(gstr), "Warns for '%s'", reason);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	return true;
}
CMD:warnings(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Usage: /warnings [Firstname_Lastname OR Player ID]");
	new sqlid = -1;
	if(IsNumeric(params))
	{
		if(!IsPlayerConnected(strval(params)) || !Logged{strval(params)}) return SysMsg(playerid, "Player ID is not connected and logged in.");
		sqlid = SQLID[strval(params)];
	}
	else
	{
		sqlid = MySQLCheckAccount(params, playerid);
	}

	if(sqlid <= 0) return SysMsg(playerid, "Name was not found. Please include first name, last name and an underscore OR use there current ingame ID.");

	mysql_format(conn, mquery, sizeof(mquery), "SELECT AdminName,Datestamp,Reason FROM warnings WHERE PlayerSQLID = %i ORDER BY id DESC LIMIT 15", sqlid);
	mysql_pquery(conn, mquery, "AdminWarnings", "dd", playerid, sqlid);
	return true;
}
CMD:sqlid(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Usage: /sqlid [Firstname_Lastname OR Player ID]");
	new sqlid = -1, playa;
	if(IsNumeric(params))
	{
		playa = strval(params);
		if(!IsPlayerConnected(playa) || !Logged{playa}) return SysMsg(playerid, "Player ID was not connected and logged in.");
		sqlid = SQLID[playa];

		format(gstr, sizeof(gstr), "%s(ID %i) SQLID %i", GetName(playa), playa, sqlid);
		SendClientMessage(playerid, COLOR_WHITE, gstr);
	}
	else
	{
		sqlid = MySQLCheckAccount(params, playerid);
		if(sqlid <= 0) return SysMsg(playerid, "Name was not found. Please include first name, last name and an underscore OR use there current ingame ID.");

		format(gstr, sizeof(gstr), "%s SQLID %i", params, sqlid);
		SendClientMessage(playerid, COLOR_WHITE, gstr);
	}

	return true;
}
CMD:reefer(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);

	new option[12];
	if(sscanf(params, "s[12]", option))
	{
		SysMsg(playerid, "Usage: /reefer [option] | Available Options: Respawn, Spec");
		SendClientMessageF(playerid, COLOR_WHITE, "Reefer ID {00CDC6}%i", ReeferID());
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
				vR = 1;
			}
		}
		if(vR == 0)
		{
			SetVehicleToRespawnEx(ReeferID());
			format(gstr, sizeof(gstr), "You have successfully respawned the Fishing Reefer (ID:%i)", ReeferID());
			SendClientMessage(playerid, COLOR_LIGHTGREEN, gstr);
		}
		else
		{
			format(gstr, sizeof(gstr), "You can't respawn the Fishing Reefer (ID:%i) whilst people are using it.", ReeferID());
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
		SysMsgF(playerid, "You are now spectating vehicle ID %i (%s). Use /specoff to return to normal.", ReeferID(), GetVehicleName(ReeferID()));
		IsSpectating[playerid] = 1000;
	}
	return true;
}
CMD:countdown(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);
	if(IsCounting > 0) return true;

	CountdownTimer = SetTimer("Countdown",1000,1);
	IsCounting = 6;

	format(gstr, sizeof(gstr),"%s Has Started A Countdown.",NameEx(playerid));
	SendClientMessageToAllLogged(COLOR_WHITE, gstr);
	AdminLog(playerid, 0, "", "Starts a countdown");
	return true;
}
CMD:makehelper(playerid, params[])
{
	if(IsPlayerAdminLevelOK(playerid, 2))
	{
		new playa[32], level;
		if(sscanf(params, "s[32]", playa)) return SysMsg(playerid,"Usage: /makehelper [Full_Name / ID]");

		new player = GetPlayerIDs(playa);
		if(player != INVALID_PLAYER_ID)
		{
			if(IsPlayerNPC(player)) return SysMsg(playerid,"That player is a NPC.");
			if(!Logged{player}) return SysMsg(playerid,"That player isn't even logged.");

			switch(IsHelper{player})
			{
				case 1:
				{
					format(gstr, sizeof(gstr),"Admin %s has removed you from the Helper team.",NameEx(playerid));
					SendClientMessage(player,COLOR_LIGHTBLUE,gstr);
					format(gstr, sizeof(gstr),"You have successfully removed %s from the Helper team.",NameEx(player));
					AdminLog(playerid, SQLID[player], GetName(player), "removed from the Helper team");
					IsHelper{player} = false;
					SendClientMessage(playerid,COLOR_RED,gstr);
					MySQLUpdateInt(MasterAccount[player], "Helper", IsHelper{player}, "masters");
				}
				default:
				{
					format(gstr, sizeof(gstr),"Admin %s has hired you into the Helper team.",NameEx(playerid));
					SendClientMessage(player,COLOR_LIGHTBLUE,gstr);
					format(gstr, sizeof(gstr),"You have hired %s into the Helper team.",NameEx(player));
					AdminLog(playerid, SQLID[player], GetName(player), "hired into the helper team");
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
					format(gstr, sizeof(gstr),"You have removed %s from the Helper team.", playa);
					AdminLog(playerid, sid, playa, "removed from the helper team.");
					MySQLUpdateInt(sid, "Helper", 1, "masters");
					SendClientMessage(playerid,COLOR_RED,gstr);
				}
				default:
				{
					format(gstr, sizeof(gstr),"You have hired %s into the Helper team.", playa);
					AdminLog(playerid, sid, playa, "hired into the helper team.");
					MySQLUpdateInt(sid, "Helper", 0, "masters");
					SendClientMessage(playerid,COLOR_RED,gstr);
				}
			}
		}
		else return SysMsg(playerid, "For use offline, please make sure you enter their Full_Name.");
	}
	else return SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:makemeadmin(playerid, params[])
{
	#if DB_SERVER != DB_SERVER_MAIN

		AdminLevel[playerid] = 4;
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET AdminLevel = %i, Helper = 0, HasRCON = 1 WHERE id = %i", AdminLevel[playerid], MasterAccount[playerid]);
		mysql_pquery(conn, mquery);
		SendClientMessage(playerid, -1, "grats ur admin level 4.");
		return true;

	#else

		SendClientMessage(playerid, -1, "This isn't the dev server you little shit.");
		return true;

	#endif
}
CMD:makedonator(playerid, params[])
{
	if(IsPlayerAdmin(playerid))
	{
		new playa = -1, level;
		if(sscanf(params, "ui", playa, level)) return SysMsg(playerid,"Usage: /makedonator [player id or name] [0 - 4]");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
		if(!Logged{playa}) return SysMsg(playerid,"That player isn't even logged.");

		if(level < 0 || level > 4) return SysMsg(playerid,"Level must be 0 - 4.");
		if(IsDonator[playa] == level) return SysMsg(playerid,"They are already this type of donator.");

		IsDonator[playa] = level;
		MySQLUpdateInt(SQLID[playa], "IsDonator", IsDonator[playa], "players");

		if(IsDonator[playa] > 0)
		{
			format(gstr, sizeof(gstr),"Congratulations to %s. They now have the rank of Level %i Donator.",NameEx(playa),IsDonator[playa]);
			SendClientMessageToAllLogged(COLOR_DONATE, gstr);
			UnlockAchievement(playa, 31);
		}
		else
		{
			SendClientMessageF(playa, COLOR_LIGHTBLUE, "Admin %s has removed your Donator rank.", NameEx(playerid));
			SendClientMessageF(playerid, COLOR_RED, "You removed %s's Donator rank.", NameEx(playa));
		}

		format(gstr, sizeof(gstr), "Set donator level to %i", level);
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
	if(sscanf(params, "us[10]", playa, level)) return SysMsg(playerid,"Usage: /dlevelup [player id or name] [weapon/level]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(!Logged{playa}) return SysMsg(playerid,"That player isn't even logged.");

	if(strcmp("weapon", level, true) == 0)
	{
		if(WeaponSkillLevel[playa] == 10) return SysMsg(playerid,"There skill is maxed out.");

		WeaponSkillLevel[playa] ++;
		MySQLUpdateInt(SQLID[playerid], "WeaponSkill", WeaponSkillLevel[playerid], "players");

		SendClientMessageF(playa, COLOR_LIGHTBLUE, "Admin %s has increased your weapon skill by 1.", NameEx(playerid));
		SendClientMessageF(playerid, COLOR_RED, "You added 1 weapon skill to %s.", NameEx(playa));
		format(gstr, sizeof(gstr), "Gave a free donator weapon skill level, now %i", WeaponSkillLevel[playa]);
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		return true;
	}
	if(strcmp("level", level, true) == 0)
	{
		PlayerLevel[playa] ++;
		MySQLUpdateInt(SQLID[playa], "PlayerLevel", PlayerLevel[playa], "players");

		SendClientMessageF(playa, COLOR_LIGHTBLUE, "Admin %s has increased your level by 1.", NameEx(playerid));
		SendClientMessageF(playerid, COLOR_RED, "You added 1 level to %s.", NameEx(playa));
		format(gstr, sizeof(gstr), "Gave a free donator player level, now %i", PlayerLevel[playa]);
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		return true;
	}
	SysMsg(playerid,"Invalid option");
	return true;
}
CMD:punish(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new sqlid = -1, reason[128], punishment[6], playername[MAX_PLAYER_NAME], time = -1, adminLvl;
	if(sscanf(params, "s[24]s[6]is[128]", playername, punishment, time, reason)) return SysMsg(playerid,"Usage: /punish [Full_Name] [ajail/ban/tban/dban] [time | use 0 for 'ban' option | ajail = minutes | tban = hours | dban = days] [reason]");

	sqlid = MySQLCheckAccount(playername, playerid);
	if(sqlid <= 0) return SysMsg(playerid,"The account name was not found.");

	foreach(new i: Player) if(SQLID[i] == sqlid) return SysMsg(playerid,"That player is online, please use the regular Admin commands.");

	MySQLFetchInt(sqlid, "AdminLevel", adminLvl, "masters");
	if(adminLvl > 0 && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"You cannot punish an Admin.");

	if(strcmp("ajail", punishment, true) == 0)
	{
		if(time == -1) return SysMsg(playerid,"Usage: /punish [player name] [ajail] [time in minutes] [reason]");
		if(time < 10 || time > 90) return SysMsg(playerid,"Time must be between 10 and 90 minutes.");

		new currentTime = 0;
		MySQLFetchInt(sqlid, "AdminJailTime", currentTime, "players");
		currentTime += time;
		if(currentTime > 200) return SysMsg(playerid,"This account already has a long Admin Jail time, you may not add any more.");

		MySQLUpdateInt(sqlid, "AdminJailTime", currentTime, "players");
		AddToAdminRecord(sqlid, SQLID[playerid], ADMIN_RECORD_TYPE_AJAIL, time, reason);

		if(currentTime > time) format(gstr, sizeof(gstr), "[Admin] %s has added %i minutes of Admin Jail time to the account %s [Reason: %s]", NameEx(playerid), time, playername, reason);
		else format(gstr, sizeof(gstr), "[Admin] %s has Admin Jailed the account %s for %i minutes [Reason: %s]", NameEx(playerid), playername, time, reason);

		AdminBroadcast(gstr, 0);

		format(gstr, sizeof(gstr), "[/punish] Admin jailed for %i min '%s'", time, reason);
		AdminLog(playerid, sqlid, playername, gstr);
		return true;
	}

	if(strcmp("ban", punishment, true) == 0)
	{
		new pIP[18];
		MySQLFetchString(sqlid, "RecentIP", pIP, "players");

		if(MySQLCheckIPBanned(pIP) == 1) return SysMsg(playerid,"That IP is already banned.");
		if(MySQLCheckAccountBanned(sqlid) == 1) return SysMsg(playerid,"That account is already banned.");

		new datestring[50];
		format(datestring, sizeof(datestring), "%s %s", GetDateString(), GetTimeStringAndSec());

		mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO bans (PSQLID, BannedIP, PlayerName, BanDate, BannedBy, Reason, MasterAccount) VALUES (%i, '%e', '%e', '%e', '%e', '%e', %i)", sqlid, pIP, GetSQLName(sqlid), datestring, MasterAccountName[playerid], reason, MySQLCheckMaster_AgainstSQLID(sqlid));
		mysql_pquery(conn, mquery, "");

		AddToAdminRecord(sqlid, SQLID[playerid], ADMIN_RECORD_TYPE_PERMBAN, -1, reason);

		format(gstr, sizeof(gstr), "[Admin] %s has banned the account %s [Reason: %s]", NameEx(playerid), playername, reason);
		AdminBroadcast(gstr, 0);

		format(gstr, sizeof(gstr), "[/punish] Perm banned for '%s'", reason);
		AdminLog(playerid, sqlid, playername, gstr);
		return true;
	}

	if(strcmp("tban", punishment, true) == 0)
	{
		if(time == -1) return SysMsg(playerid,"Usage: /punish [player name] [tban] [time in hours] [reason]");
		if(time < 1 || time > 24) return SysMsg(playerid,"Time must be between 1 and 24 hours.");
		if(strlen(reason) > 150) return SysMsg(playerid,"Please shorten your reason.");

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

				format(gstr, sizeof(gstr), "[Admin] %s has banned the account %s for %i hour(s) [Reason: %s]", NameEx(playerid), playername, time, reason);
				AdminBroadcast(gstr, 0);

				format(gstr, sizeof(gstr), "[/punish] Time banned for %i hours '%s'", time, reason);
				AdminLog(playerid, sqlid, playername, gstr);
				return true;
			}
		}

		SysMsg(playerid, "Temp ban failed to execute.");
		return true;
	}

	if(strcmp("dban", punishment, true) == 0)
	{
		new pIP[18];
		MySQLFetchString(sqlid, "RecentIP", pIP, "players");

		if(MySQLCheckTempBanned(sqlid, pIP) > 0) return SysMsg(playerid,"That account, IP or master account is already date banned.");

		if(time == -1) return SysMsg(playerid,"Usage: /punish [player name] [dban] [amount of days] [reason]");
		if(time < 2 || time > 14) return SysMsg(playerid,"Days must be between 2 and 14.");

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
			case 1,21,31: format(thstndrd, sizeof(thstndrd), "st");
			case 2,22: format(thstndrd, sizeof(thstndrd), "nd");
			case 3,23: format(thstndrd, sizeof(thstndrd), "rd");
			default: format(thstndrd, sizeof(thstndrd), "th");
		}

		format(datestr, sizeof(datestr), "%i%s %s %i", cd, thstndrd, GetMonthName(cm), cy);

		mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO tbans (PlayerName,BannedBy,BannedIP,BanReason,PlayerSQLID,UnbanDate,UnbanD,UnbanM,UnbanY,DaysBanned,MasterAccount) VALUES ('%e','%e','%e','%e',%i,'%e',%i,%i,%i,%i,%i)", GetSQLName(sqlid), GetName(playerid), pIP, reason, sqlid, datestr, cd, cm, cy, time, MySQLCheckMaster_AgainstSQLID(sqlid));
		mysql_pquery(conn, mquery, "");

		AddToAdminRecord(sqlid, SQLID[playerid], ADMIN_RECORD_TYPE_DATEBAN, time, reason);

		format(gstr, sizeof(gstr), "[Admin] %s has banned the account %s until %s (%i days) [Reason: %s]", NameEx(playerid), playername, datestr, time, reason);
		AdminBroadcast(gstr, 0);

		format(gstr, sizeof(gstr), "[/punish] Date banned for %i days '%s'", time, reason);
		AdminLog(playerid, sqlid, playername, gstr);
		return true;
	}
	SysMsg(playerid,"Invalid punishment type.");
	return true;
}
CMD:kick(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, reason[150];
	if(sscanf(params, "uS(Not Specified)[150]", playa, reason)) return SysMsg(playerid,"Usage: /kick [player id or name] [reason]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa) && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"That player is a NPC.");
	if(playa == playerid) return SysMsg(playerid,"Player can't Be Yourself.");
	if(IsPlayerAdminLevelOK(playa,1) && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"You may not kick another Admin.");

	format(sgstr, sizeof(sgstr), "Admin %s kicked %s [Reason: %s]", NameEx(playerid), NameEx(playa), reason);
	SendClientMessageToAllLogged(COLOR_RED,sgstr);
	KickPlayer(playa, 7);

	AddToAdminRecord(SQLID[playa], SQLID[playerid], ADMIN_RECORD_TYPE_KICK, -1, reason);

	format(sgstr, sizeof(sgstr), "Kicked for '%s'", reason);
	AdminLog(playerid, SQLID[playa], GetName(playa), sgstr);
	return true;
}
CMD:kickall(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	SendClientMessageToAllF(COLOR_RED,"Admin %s kicked all players from the server.",NameEx(playerid),params);
	foreach(new i: Player) if(i != playerid) KickPlayer(i, 8);

	AdminLog(playerid, 0, "", "Kick all players");
	return true;
}
CMD:revive(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /revive [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(!Dead{playa}) return SysMsg(playerid,"That player isn't injured.");

	RevivePlayer(playa);

	SendClientMessageF(playerid, COLOR_RED,"You have revived %s.", NameEx(playa));
	SendClientMessageF(playa, COLOR_RED, "Admin %s has revived you.", NameEx(playerid));
	return true;
}
CMD:ban(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, reason[150];
	if(sscanf(params, "uS(Not Specified)[150]", playa, reason)) return SysMsg(playerid,"Usage: /ban [player id or name] [reason]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(IsPlayerAdmin(playa)) return SendClientMessage(playerid, COLOR_WHITE, "SERVER: Access Denied");
	if(IsPlayerAdminLevelOK(playa,1) > 0 && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"You may not ban another Admin.");

	if(playa == playerid) return SysMsg(playerid,"Player can't Be Yourself.");

	format(sgstr, sizeof(sgstr),"Admin %s Banned %s [Reason: %s]",NameEx(playerid),NameEx(playa),reason);
	SendClientMessageToAllLogged(COLOR_RED, sgstr);
	UnlockAchievement(playa, 73);
	MySQLBanPlayer(playa, MasterAccountName[playerid], reason);

	AddToAdminRecord(SQLID[playa], SQLID[playerid], ADMIN_RECORD_TYPE_PERMBAN, -1, reason);

	format(sgstr, sizeof(sgstr), "Perm banned for '%s'", reason);
	AdminLog(playerid, SQLID[playa], GetName(playa), sgstr);
	return true;
}
CMD:tban(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, hours, reason[150];
	if(sscanf(params, "uiS()[150]", playa, hours, reason)) return SysMsg(playerid,"Usage: /tban [player id or name] [time (in hours)] [reason]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(IsPlayerAdmin(playa)) return SendClientMessage(playerid, COLOR_WHITE, "SERVER: Access Denied");
	if(IsPlayerAdminLevelOK(playa,1) && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"You may not ban another Admin.");
	if(playa == playerid) return SysMsg(playerid,"Player can't Be Yourself.");
	if(!Logged{playa}) return SendClientMessage(playerid, COLOR_WHITE, "Player is not logged in.");

	if(hours < 1 || hours > 24) return SysMsg(playerid,"Time must be between 1 and 24 hours.");
	if(isnull(reason)) format(reason, sizeof(reason), "Not Specified");

	for(new ban = 0; ban < MAX_TEMPBANS; ban++)
	{
		if(TempBans[ban][TempBanActive] == 0)
		{
			format(gstr, sizeof(gstr),"Admin %s Banned %s for %i hour(s) [Reason: %s]", NameEx(playerid), NameEx(playa), hours, reason);
			SendClientMessageToAllLogged(COLOR_RED,gstr);

			TempBans[ban][TempBanSQLID] = SQLID[playa];
			TempBans[ban][TempBanActive] = 1;
			TempBans[ban][TempBanTime] = hours * 60;
			TempBans[ban][BanningAdmin] = SQLID[playerid];

			format(TempBans[ban][TempBanIP], 16, PlayerIP[playa]);
			format(TempBans[ban][TempBanReason], 150, reason);

			KickPlayer(playa, 9);
			AddToAdminRecord(SQLID[playa], SQLID[playerid], ADMIN_RECORD_TYPE_TEMPBAN, hours, reason);
			format(gstr, sizeof(gstr), "Time banned for %i hours '%s'", hours, reason);
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

	if(isnull(params)) return SysMsg(playerid,"Usage: /tunban [Player_Name]");

	for(new ban = 0; ban < MAX_TEMPBANS; ban++)
	{
		if(TempBans[ban][TempBanActive] == 1)
		{
			if(strcmp(GetSQLName(TempBans[ban][TempBanSQLID]), params, true) == 0)
			{
				format(gstr, sizeof(gstr), "[Admin] %s has unbanned %s from the temporary ban list.", NameEx(playerid), GetSQLName(TempBans[ban][TempBanSQLID]));
				AdminBroadcast(gstr, 0);
				AdminLog(playerid, TempBans[ban][TempBanSQLID], GetSQLName(TempBans[ban][TempBanSQLID]), "Removed time ban");

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
	SysMsg(playerid, "Player is not banned, please use the correct format while searching: Firstname_Lastname.");
	return true;
}
CMD:removedateban(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Usage: /removedateban [Player_Name]");

	mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM tbans WHERE PlayerName = '%e' AND Unbanned = 0", params);
	mysql_pquery(conn, mquery, "");

	SysMsgF(playerid, "Date ban for %s has been deleted.", params);
	AdminLog(playerid, 0, params, "Removed date ban");

	return true;
}
CMD:viewdbans(playerid, params[])
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
	if(sscanf(params, "s[20]i", playername, days)) return SysMsg(playerid,"Usage: /setunbandate [Player_Name] [Days until unban]");
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
		SysMsg(playerid,"No bans were found for that name.");
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

	format(gstr, sizeof(gstr), "[Admin] %s has set %s's permanent ban to expire on %s(%i days away)", NameEx(playerid), playername, datestr, days);
	AdminBroadcast(gstr, 0);
	format(gstr, sizeof(gstr), "Set perm ban to expire in %i days", days);
	AdminLog(playerid, bannedsqlid, playername, gstr);

	DeleteBan(banID);
	mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO tbans (PlayerName,BannedBy,BannedIP,BanReason,PlayerSQLID,UnbanDate,UnbanD,UnbanM,UnbanY,DaysBanned,MasterAccount) VALUES ('%e','%e','%e','%e',%i,'%e',%i,%i,%i,%i,%i)", playername, bannedby, bannedip, banreason, bannedsqlid, datestr, cd, cm, cy, days, MySQLCheckMaster_AgainstSQLID(bannedsqlid));
	mysql_pquery(conn, mquery, "");
	return true;
}
CMD:viewtbans(playerid, params[])
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

			format(sub, 90, "%s [%s, %i minutes, Reason: '%s']\n", GetSQLName(TempBans[ban][TempBanSQLID]), TempBans[ban][TempBanIP], TempBans[ban][TempBanTime], TempBans[ban][TempBanReason]);
			strcat(gstr, sub);
			count ++;
		}
	}

	if(count == 0) return SysMsg(playerid, "Nobody is temp banned.");

	ShowMessage(playerid, "Temp Ban List", gstr, "Done");
	return true;
}
CMD:dban(playerid, params[]) return cmd_dateban(playerid, params);
CMD:dateban(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, days, reason[150];
	if(sscanf(params, "uis[150]", playa, days, reason)) return SysMsg(playerid,"Usage: /dateban [player id or name] [days] [reason]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(IsPlayerAdmin(playa)) return SendClientMessage(playerid, COLOR_WHITE, "SERVER: Access Denied");
	if(IsPlayerAdminLevelOK(playa,1) && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"You may not ban another Admin.");
	if(playa == playerid) return SysMsg(playerid,"Player can't Be Yourself.");
	if(!Logged{playa}) return SendClientMessage(playerid, COLOR_WHITE, "Player is not logged in.");

	if((days < 2 || days > 14) && !IsPlayerAdmin(playerid)) return SysMsg(playerid,"Days must be between 2 and 14.");
	if(strlen(reason) > 149) return SysMsg(playerid,"Your reason was too long, please use a maximum of 150 letters.");

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

	format(gstr, sizeof(gstr), "Admin %s Banned %s until %s (%i days) [Reason: %s]", NameEx(playerid), NameEx(playa), datestr, days, reason);
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
		if(sscanf(params, "us[40]", playa, reason)) return SysMsg(playerid,"Usage: /rban [player id or name] [reason]");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
		if(playa == playerid) return SysMsg(playerid,"Player can't Be Yourself.");

		if(isnull(reason)) format(reason, sizeof(reason), "Not Specified");

		new ip1, ip2, ip3, ip4;
		sscanf(PlayerIP[playa], "p<.>iiii", ip1, ip2, ip3, ip4);

		format(gstr, sizeof(gstr), "banip %i.%i.*.*", ip1, ip2);
		SendRconCommand(gstr);

		format(gstr, sizeof(gstr),"Admin %s Range Banned %s [Reason: %s]",NameEx(playerid),NameEx(playa),reason);
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
		if(isnull(params)) return SysMsg(playerid,"Usage: /rbanip [ip]");

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
		if(sscanf(params, "s[16]S()[150]", ip, reason)) return SysMsg(playerid,"Usage: /banip [IP] [reason] *DO NOT USE AN IP WILDCARD*");
		if(strfind(reason, "*") != -1) return SysMsg(playerid, "YOU USED A WILDCARD.");

		if(isnull(reason)) format(reason, sizeof(reason), "Not Specified");

		format(gstr, sizeof(gstr),"Admin %s banned IP %s [Reason: %s]",NameEx(playerid),ip,reason);
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
		if(isnull(params)) return SysMsg(playerid,"Usage: /banhost [hostname]");

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
		if(isnull(params)) return SysMsg(playerid,"Usage: /unbanip [IP]");
		if(MySQLCheckIPBanned(params) == 0) return SysMsg(playerid,"That IP is not banned so cannot be unbanned.");

		mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM bans WHERE BannedIP = '%e'", params);
		mysql_pquery(conn, mquery, "");

		format(gstr, sizeof(gstr),"[Admin] %s removed all bans with the IP: %s",NameEx(playerid),params);
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

	if(isnull(params)) return SysMsg(playerid,"Usage: /unban [Firstname_Lastname]");
	new banid = GetBanID(params);

	if(banid > 0)
	{
		DeleteBan(banid);
		format(gstr, sizeof(gstr),"[Admin] %s unbanned %s.", NameEx(playerid), params);
		AdminBroadcast(gstr, 0);
		AdminLog(playerid, 0, params, "Unbanned account");
	}
	else SendClientMessage(playerid, COLOR_WHITE, "No ban found for that name.");
	return true;
}
CMD:disableaccount(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /disableaccount [player id]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(!Logged{playa}) return SysMsg(playerid,"Player is not logged in.");
	if(playa == playerid) return SysMsg(playerid, "You cannot disable your own account.");

	MySQLUpdateInt(SQLID[playa], "AccountDisabled", 1, "players");

	format(gstr, sizeof(gstr),"Admin %s has disabled your account.", NameEx(playerid));
	SendClientMessage(playa, COLOR_RED, gstr);
	SendClientMessage(playa, COLOR_RED, "You will no longer be able to access this account.");
	AdminLog(playerid, SQLID[playa], GetName(playa), "Disabled account");

	format(gstr, sizeof(gstr),"Admin %s has disabled %s's account.", NameEx(playerid), NameEx(playa));
	KickPlayer(playa, 13);
	SendClientMessageToAllLogged(COLOR_RED, gstr);
	return true;
}
CMD:enableaccount(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Usage: /enableaccount [Firstname_Lastname]");
	new sqlid = MySQLCheckAccount(params, playerid);
	if(sqlid <= 0) return SysMsg(playerid,"This name was not found.");

	new status;
	MySQLFetchInt(sqlid, "AccountDisabled", status, "players");
	if(status == 0) return SysMsg(playerid,"That account is already enabled.");

	MySQLUpdateInt(sqlid, "AccountDisabled", 0, "players");

	format(gstr, sizeof(gstr),"[Admin] %s has re-enabled %s's account.", NameEx(playerid), GetSQLName(sqlid));
	AdminBroadcast(gstr, 0);
	AdminLog(playerid, sqlid, GetSQLName(sqlid), "Enabled account");
	return true;
}
CMD:disableaccid(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Usage: /disableaccid [account id]");
	if(!IsNumeric(params)) return SysMsg(playerid,"Invalid account.");
	new account = strval(params);
	if(account < 0) return SysMsg(playerid,"Invalid account.");

	MySQLUpdateInt(account, "AccountDisabled", 1, "players");

	format(gstr, sizeof(gstr),"Account %i was disabled.", account);
	SendClientMessage(playerid, COLOR_RED, gstr);
	AdminLog(playerid, account, GetSQLName(account), "Disabled account");
	return true;
}
CMD:gt(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, towho[20], style, secTime, text[75];
	if(sscanf(params, "s[20]iis[75]", towho, style, secTime, text)) return SysMsg(playerid,"Usage: /gt [playerid/name /all] [style] [time(seconds)] [text]");

	if(strcmp(towho,"all",true) == 0) playa = 1000;
	else
	{
		if(!IsNumeric(towho)) playa = GetPlayerID(playerid, towho); else playa = strval(towho);
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	}

	if(style < 0 || style > 6) return SysMsg(playerid,"Invalid Style.");
	if(secTime < 1 || secTime > 10) return SysMsg(playerid,"Invalid Time.");

	if(playa == 1000) GameTextForAll(text, secTime*1000, style);
	else GameTextForPlayer(playa, text, secTime*1000, style);

	return true;
}
CMD:bc(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);
	if(ToggleBC == 0) return SysMsg(playerid,"Broadcast is disabled.");

	if(isnull(params)) return SysMsg(playerid,"Usage: /bc [MESSAGE]");

	GameTextForAll(params, 10000, 3);
	format(gstr, sizeof(gstr), "Broadcast: %s", params);
	AdminLog(playerid, 0, "", gstr);
	return true;
}
CMD:an(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Usage: (OOC Announcement) /an [message]");

	new anMsg[196];
	format(anMsg,196,"Announcement from %s: %s", NameEx(playerid), params);
	SendClientMessageToAllLogged(0x00FFFFFF,anMsg);
	strins(anMsg, "11", 0);
	//IRC_Say(IRCBot, IRC_CHANNEL, anMsg);
	//IRC_Say(IRCBot, IRC_ADMIN_CHANNEL, anMsg);
	format(anMsg, sizeof(anMsg), "Announcement: %s", params);
	AdminLog(playerid, 0, "", anMsg);
	return true;
}
CMD:asay(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Usage: /asay [message]");

	format(sgstr, sizeof(sgstr),"* Admin %s: %s", NameEx(playerid), params);
	SendClientMessageToAllLogged(0xC520FFFF, sgstr);
	strins(sgstr, "6", 0);
	//IRC_Say(IRCBot, IRC_CHANNEL, sgstr);
	//IRC_Say(IRCBot, IRC_ADMIN_CHANNEL, sgstr);
	format(sgstr, sizeof(sgstr), "Asay: %s", params);
	AdminLog(playerid, 0, "", sgstr);
	return true;
}
CMD:areasay(playerid, params[])
{
	if(IsPlayerAdminLevelOK(playerid, 1))
	{
		new playa = -1, range, message[196];
		if(sscanf(params, "iis[196]", playa, range, message)) return SysMsg(playerid,"Usage: /areasay [playerid] [range] [message]");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
		if(!Logged{playa}) return SysMsg(playerid,"That player isn't logged in.");
		if(range == 0) return SysMsg(playerid, "Please enter a range greater than 0.");
		foreach(new i: Player)
		{
			if(Logged{i} && IsPlayerInRangeOfPoint(i, range, PlayerPosX(playa), PlayerPosY(playa), PlayerPosZ(playa)) || i == playerid)
			{
				SendClientMessageF(i, 0xC520FFFF, "* [AREA] Admin %s: %s", NameEx(playerid), message);
			}
		}
		format(gstr, sizeof(gstr), "Area say: %s", params);
		AdminLog(playerid, 0, "", gstr);
	}
	else SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:pke(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, toggle;
	if(sscanf(params, "ui", playa, toggle)) return SysMsg(playerid,"Usage: Ping King Exemption /pke [playerid/name] [0/1]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(!Logged{playa}) return SysMsg(playerid,"That player isn't even logged.");
	if(toggle < 0 || toggle > 1) return SysMsg(playerid, "Toggle must be 0 or 1.");

	if(toggle == 0) PingKickExemption{playa} = false;
	else PingKickExemption{playerid} = true;
	MySQLUpdateInt(SQLID[playa], "PingKickExemption", toggle, "players");

	if(toggle == 0)
	{
		SendClientMessageF(playa, COLOR_RED, "Admin %s has made you liable to high ping kicks.", NameEx(playerid));
		SendClientMessageF(playerid, COLOR_RED, "You have allowed %s to be ping kicked.", NameEx(playa));
		AdminLog(playerid, SQLID[playa], GetName(playa), "Ping Kick Exemption set to 0");
	}
	else
	{
		SendClientMessageF(playa, COLOR_RED, "Admin %s has made you exempt to high ping kicks.", NameEx(playerid));
		SendClientMessageF(playerid, COLOR_RED, "You have made %s exempt from ping kicks.", NameEx(playa));
		AdminLog(playerid, SQLID[playa], GetName(playa), "Ping Kick Exemption set to 1");
	}

	return true;
}
CMD:msgall(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new caption[30], message[200], button1[20], button2[20];
	if(sscanf(params, "s[30]s[20]s[20]s[200]", caption, button1, button2, message)) return SysMsg(playerid, "Usage: /msgall [caption] [button1] [button2] [message]");

	foreach(new i: Player) if(Logged{i}) Dialog_Show(i, DIALOG_NONE, DIALOG_STYLE_MSGBOX, caption, message, button1, button2);
	return true;
}
CMD:playsound(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new towho[20], playa, soundid;
	if(sscanf(params, "s[20]i", towho, soundid)) return SysMsg(playerid, "Usage: /playsound [playerid/name] [sound id]");

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
		if(sscanf(params, "s[64]I(-1)", option, playa)) return SysMsg(playerid, "Usage: /aboombox [ban / delete] [Optional: ID]");

		if(playa == -1)
		{
			foreach(new p: Player)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.0, Boomboxes[p][BoomPos][0], Boomboxes[p][BoomPos][1], Boomboxes[p][BoomPos][2]))
				{
					if(strmatch(option, "delete"))
					{
						SetPVarInt(playerid, "bbID", p);
						format(gstr, sizeof(gstr), "Are you sure you want to delete %s's boombox?", NameRP(p));
						return Dialog_Show(playerid, BoomboxDelete, DIALOG_STYLE_MSGBOX, "Boombox Menu", gstr, "Yes", "Cancel");
					}
					else if(strmatch(option, "ban"))
					{
						SetPVarInt(playerid, "bbID", p);
						format(gstr, sizeof(gstr), "Are you sure you want to ban %s from using boomboxes?", NameRP(p));
						return Dialog_Show(playerid, BoomboxBan, DIALOG_STYLE_MSGBOX, "Boombox Menu", gstr, "Yes", "Cancel");
					}
				}
			}
			return SysMsg(playerid, "No boombox found, use /aboombox [playerid] instead.");
		}
		else if(IsPlayerConnected(playa))
		{
			if(strmatch(option, "delete"))
			{
				if(Boomboxes[playa][BoomOID] == SQLID[playa])
				{
					SetPVarInt(playerid, "bbID", playa);
					format(gstr, sizeof(gstr), "Are you sure you want to delete %s's boombox?", NameRP(playa));
					return Dialog_Show(playerid, BoomboxDelete, DIALOG_STYLE_MSGBOX, "Boombox Menu", gstr, "Yes", "Cancel");
				}
				else return SysMsg(playerid, "That player doesn't have an active boombox.");
			}
			else if(strmatch(option, "ban"))
			{
				SetPVarInt(playerid, "bbID", playa);
				format(gstr, sizeof(gstr), "Are you sure you want to ban %s from using boomboxes?", NameRP(playa));
				return Dialog_Show(playerid, BoomboxBan, DIALOG_STYLE_MSGBOX, "Boombox Menu", gstr, "Yes", "Cancel");
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
		if(sscanf(params, "u", playa)) return SysMsg(playerid, "Usage: /bmxban [playerid or name]");
		if(!IsNumeric(params)) return SysMsg(playerid,"You must enter a player ID.");
		if(BMXBanned[playa] == 1) return SysMsg(playerid, "That player's bike privilege has already been removed.");
		if(playerid == playa) return SysMsg(playerid, "You cannot BMX ban yourself.");
		if(IsPlayerAdminLevelOK(playa, 1)) return SysMsg(playerid, "You can't BMX ban other admins.");

		SysMsgF(playa, "Administrator %s has revoked your bike permission.", NameEx(playerid));
		SysMsgF(playerid, "You have revoked %s's bike permission.", NameEx(playa));
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
	if(sscanf(params, "s[24]s[200]", towho, musicLink)) return SysMsg(playerid, "Usage: /playmusic (for) [[playerid/name]/all/admins] [link/stop]");

	if(strcmp(musicLink, "stop") == 0)
	{
		if(strcmp("all", towho, true) == 0)
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
		if(strcmp("all", towho, true) == 0)
		{
			foreach(new i: Player)
			{
				if(Logged{i})
				{
					StopAudioStreamForPlayer(i);
					PlayAudioStreamForPlayerEx(i, musicLink);
					SendClientMessageF(i, COLOR_RED, "DJ %s is spinning up some tunes yo.", GetPlayersFirstName(playerid));
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
					SendClientMessageF(i, COLOR_RED, "DJ %s is spinning up some tunes yo.", GetPlayersFirstName(playerid));
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
			SendClientMessageF(playa, COLOR_RED, "DJ %s is spinning up some tunes yo.", GetPlayersFirstName(playerid));
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
	SendClientMessage(playerid, COLOR_BLUEGREEN, "Welcome to the Admin Lounge!");
	return true;
}
CMD:msgp(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, caption[30], message[200], button1[20], button2[20];
	if(sscanf(params, "us[30]s[20]s[20]s[200]", playa, caption, button1, button2, message)) return SysMsg(playerid, "Usage: /msgp [playerid/name] [caption] [button1] [button2] [message]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

	Dialog_Show(playa, DIALOG_NONE, DIALOG_STYLE_MSGBOX, caption, message, button1, button2);
	return true;
}
CMD:maths(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new Number1, Number2, chara[2];
	if(sscanf(params, "is[2]i", Number1, chara, Number2)) return SysMsg(playerid,"Usage: /maths [number 1] [operator '+' or '-'] [number 2]");

	if(strcmp(chara, "+", true) == 0)
	{
		format(gstr, sizeof(gstr), "Question: What is %i + %i ? Use /answer.", Number1, Number2);
		SendClientMessageToAllLogged(COLOR_LIGHTRED, gstr);
		MathsStarted = 1;
		MathsAnswer = Number1 + Number2;
	}
	else if(strcmp(chara, "-", true) == 0)
	{
		format(gstr, sizeof(gstr), "Question: What is %i - %i ? Use /answer.", Number1, Number2);
		SendClientMessageToAllLogged(COLOR_LIGHTRED, gstr);
		MathsStarted = 1;
		MathsAnswer = Number1 - Number2;
	}

	return true;
}
CMD:startevent(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);
	if(EventOpen == 1) return SysMsg(playerid,"There is already an event taking place.");

	if(isnull(params)) return SysMsg(playerid, "Usage: /startevent [event name]");

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

	format(gstr, sizeof(gstr), "%s has started an event, use /JoinEvent to get involved! [Description: %s]", NameEx(playerid), params);
	SendClientMessageToAllLogged(COLOR_PINK, gstr);
	format(gstr, sizeof(gstr), "Started event: %s", params);
	AdminLog(playerid, 0, "", gstr);
	return true;
}
CMD:stopevent(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);
	if(EventOpen == 0) return SysMsg(playerid,"There is no event taking place.");

	EventData[EventX] = 0.0;
	EventData[EventY] = 0.0;
	EventData[EventZ] = 0.0;
	EventData[EventInterior] = 0;
	EventData[EventVW] = 0;
	format(EventData[EventName], 50, " ");
	EventOpen = 0;

	format(gstr, sizeof(gstr), "%s has closed the event. It is too late to join.", NameEx(playerid));
	SendClientMessageToAllLogged(COLOR_PINK, gstr);
	AdminLog(playerid, 0, "", "Closed an event");
	return true;
}
CMD:bone(playerid, params[])
{
	if(!Logged{playerid} || !IsPlayerAdmin(playerid)) return true;

	new objectid, boneid, index, Float:X, Float:Y, Float:Z, Float:rX, Float:rY, Float:rZ, Float:sX = 1, Float:sY = 1, Float:sZ = 1;
	if(sscanf(params, "iiiF(0)F(0)F(0)F(0)F(0)F(0)F(1)F(1)F(1)", objectid, boneid, index, X, Y, Z, rX, rY, rZ, sX, sY, sZ)) return SysMsg(playerid,"Usage: /bone [object] [bone] [index] [Float:X] [Float:Y] [Float:Z] [Float:rX] [Float:rY] [Float:rZ] [Float:sX] [Float:sY] [Float:sZ]");

	SetPlayerAttachedObject(playerid, index, objectid, boneid, X, Y, Z, rX, rY, rZ, sX, sY, sZ);
	return true;
}
CMD:vobj(playerid, params[])
{
	if(!Logged{playerid} || !IsPlayerAdmin(playerid) || !IsPlayerInAnyVehicle(playerid)) return true;

	new objectid, Float:X, Float:Y, Float:Z, Float:rX, Float:rY, Float:rZ, vehicleid = GetPlayerVehicleID(playerid);
	if(sscanf(params, "iF(0)F(0)F(0)F(0)F(0)F(0)", objectid, X, Y, Z, rX, rY, rZ)) return SysMsg(playerid,"Usage: /vobj [object] [Float:X] [Float:Y] [Float:Z] [Float:rX] [Float:rY] [Float:rZ]");

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
	if(sscanf(params, "ui", playa, minutes)) return SysMsg(playerid,"Usage: /mute [player id or name] [time in minutes]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(Muted[playa] > 0) return SysMsg(playerid,"Player is already Muted.");
	if(minutes < 1 || minutes > 60) return SysMsg(playerid,"Minutes can only be 1 to 60 minutes");

	Muted[playa] = minutes;
	MySQLUpdateInt(SQLID[playa], "Muted", Muted[playa], "players");

	SysMsgF(playerid,"You Muted %s for %i minutes.",NameEx(playa), minutes);
	SysMsgF(playa, "You have been Muted by %s for %i minutes. You can't Talk.",NameEx(playerid),minutes);
	format(gstr, sizeof(gstr), "Muted for %i min", minutes);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);

	AddToAdminRecord(SQLID[playa], SQLID[playerid], ADMIN_RECORD_TYPE_MUTE, minutes, "");
	return true;
}
CMD:unmute(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /unmute [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(Muted[playa] == 0) return SysMsg(playerid,"Player is already Unmuted.");

	Muted[playa] = 0;
	MySQLUpdateInt(SQLID[playa], "Muted", Muted[playa], "players");

	SysMsgF(playerid, "You Un-Muted %s",NameEx(playa));
	SysMsgF(playa, "You Have Been Un-Muted By %s. You Can Now Talk.",NameEx(playerid));
	AdminLog(playerid, SQLID[playa], GetName(playa), "Unmuted");
	return true;
}
CMD:doocmute(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, minutes;
	if(sscanf(params, "ui", playa, minutes)) return SysMsg(playerid,"Usage: /doocmute [player id or name] [time in minutes]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(playa == playerid) return SysMsg(playerid, "You cannot mute yourself.");
	if(IsPlayerAdminLevelOK(playa, 1)) return SysMsg(playerid, "You cannot mute another admin.");
	if(DOOCMuted[playa] > 0) return SysMsg(playerid,"Player is already Muted.");
	if(minutes < 1 || minutes > 60) return SysMsg(playerid,"Minutes can only be 1 to 60 minutes");

	DOOCMuted[playa] = minutes;
	MySQLUpdateInt(SQLID[playa], "DOOCMuted", DOOCMuted[playa], "players");

	SysMsgF(playerid,"You muted %s for %i minutes from DOOC.",NameEx(playa), minutes);
	SysMsgF(playa,"You have been muted from DOOC for %i minutes by %s",minutes, NameEx(playerid));
	format(gstr, sizeof(gstr), "Muted for %i min", minutes);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);

	AddToAdminRecord(SQLID[playa], SQLID[playerid], ADMIN_RECORD_TYPE_MUTE, minutes, "");
	return true;
}
CMD:doocunmute(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /doocunmute [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(DOOCMuted[playa] == 0) return SysMsg(playerid,"Player is already Unmuted.");

	DOOCMuted[playa] = 0;
	MySQLUpdateInt(SQLID[playa], "DOOCMuted", DOOCMuted[playa], "players");

	SysMsgF(playerid, "You unmuted %s from DOOC.",NameEx(playa));
	SysMsgF(playa, "You have been unmuted from DOOC.",NameEx(playerid));
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
				format(sub, 100, "%s(ID %i) Global Muted for another %i minutes\n", NameEx(i), i, Muted[i]);
				strcat(gstr, sub);
				count ++;
			}
		}
	}

	if(count == 0) return SysMsg(playerid,"Nobody is muted right now.");

	ShowMessage(playerid, "Mute List", gstr, "Done");
	return true;
}
CMD:ipcheck(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Usage: /ipcheck [IP]");

	mysql_format(conn, mquery, sizeof(mquery), "SELECT Name FROM players WHERE IP='%e' OR RecentIP='%e'", params, params);
	mysql_pquery(conn, mquery, "checkIP", "ds", playerid, params);
	return true;
}
CMD:clientid(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid, "Usage: /clientid [playerid or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(!strlen(PlayerSerial[playa])) return SysMsg(playerid, "No serial found for this player.");

	SendClientMessageF(playerid, COLOR_WHITE, "Game Serial for %s: %s.", NameEx(playa), PlayerSerial[playa]);
	SendSplitMessage(playerid, COLOR_WHITE, "Note: Game serials are not a 100 percent unique identifier for a player, so please don't use them as concrete evidence against a ban evasion suspicion.");
	return true;
}
CMD:serialcheck(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid, "Usage: /clientid [playerid or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(!strlen(PlayerSerial[playa])) return SysMsg(playerid, "No serial found for this player.");

	mysql_format(conn, mquery, sizeof(mquery), "SELECT Name FROM players WHERE RecentSerial = '%e'", PlayerSerial[playa]);
	mysql_pquery(conn, mquery, "CheckSerial", "ds", playerid, PlayerSerial[playa]);
	return true;
}
CMD:givexp(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, xp;
	if(sscanf(params, "ui", playa, xp)) return SysMsg(playerid,"Usage: /givexp [player id or name] [amount]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");

	if(xp < 1 || xp > 2500) return SysMsg(playerid,"Invalid XP amount! (Must be between 1 and 2500)");

	PlayerXP[playa] += xp;
	MySQLUpdateInt(SQLID[playa], "PlayerXP", PlayerXP[playa], "players");

	SendClientMessageF(playa, COLOR_GREEN, "Admin %s gave you %i Experience Points",NameEx(playerid),xp);
	SendClientMessageF(playerid, COLOR_GREEN, "You gave %s %i Experience Points",NameEx(playa),xp);
	format(gstr, sizeof(gstr), "Gave %i XP points", xp);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	return true;
}
CMD:changepn(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, newnumber;
	if(sscanf(params, "ui", playa, newnumber)) return SysMsg(playerid,"Usage: /changepn [player id/part of name] [number]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");

	if(newnumber < 1000000 || newnumber > 9999999) return SysMsg(playerid,"Invalid number. (Must be between 1000000 and 9999999)");
	if(IsPhoneNumberUsed(newnumber) > 0) return SysMsg(playerid,"Invalid number. (Already in use)");

	mysql_format(conn, mquery, sizeof(mquery), "UPDATE phonecontacts SET PhoneNumber = %i WHERE PhoneNumber = %i", newnumber, PhoneData[playa][pNumber]);
	mysql_pquery(conn, mquery);

	PhoneData[playa][pNumber] = newnumber;
	mysql_format(conn, mquery, sizeof(mquery), "UPDATE phones SET PhoneNumber = %i WHERE id = %i", PhoneData[playa][pNumber], PhoneData[playa][pID]);
	mysql_pquery(conn, mquery);

	SendClientMessageF(playa, COLOR_GREEN, "Admin %s set your phone number to %i.", NameEx(playerid), newnumber);
	SendClientMessageF(playerid, COLOR_GREEN, "You set %s's phone number to %i.", NameEx(playa) ,newnumber);

	format(gstr, sizeof(gstr), "Changed phone number to %i", newnumber);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	return true;
}
CMD:freeze(playerid, params[])
{
	if(IsPlayerAdminLevelOK(playerid, 1) || IsHelper{playerid})
	{
		new playa = -1;
		if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /freeze [player id or name]");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");

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
		if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /unfreeze [player id or name]");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");

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
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /ajail [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

	InitiateAdminJail(playerid, playa);
	return true;
}
CMD:aunjail(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /aunjail [player id or name]");
	if(InvalidPlayer(playa) || !Logged{playa}) return SysMsg(playerid,"That player is not connected and logged in.");
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(AdminJailData[playa][0] == 0) return SysMsg(playerid,"That player is not Admin Jailed.");

	AUnJailPlayer(playa);
	MySQLUpdateInt(SQLID[playa], "AdminJailTime", 0, "players");

	format(gstr, sizeof(gstr), "Admin %s has removed you from the Admin Jail.", NameEx(playerid));
	SendClientMessage(playa, COLOR_RED, gstr);
	format(gstr, sizeof(gstr), "[Admin] %s has removed %s from the Admin Jail.", NameEx(playerid), NameEx(playa));
	AdminBroadcast(gstr, 1);
	AdminLog(playerid, SQLID[playa], GetName(playa), "Removed from admin jail");
	return true;
}
CMD:gmx(playerid, params[])
{
	if(IsPlayerAdminLevelOK(playerid, 3))
	{
		new mins, reason[64];
		if(sscanf(params, "iS()[64]", mins, reason)) return SysMsg(playerid,"Usage: /gmx [schedule 0-10 minutes] [Optional: brief reason] *Can be aborted with /cancelgmx*");
		if(mins < 0 || mins > 10) return SysMsg(playerid, "Invalid Time! (0-10)");
		if(mins == 0)
		{
			if(isnull(reason)) format(reason, sizeof(reason), "Not Specified");
			format(gstr, sizeof(gstr), "~n~~n~~n~~n~~n~~n~~b~~h~server restarted by~n~~w~%s",  NameEx(playerid));
			GameTextForAll(gstr, 12000, 3);
			AdminLog(playerid, 0, "", "Immediate GMX");
			foreach(new i: Player)
			{
				SetPlayerName(i, MasterAccountName[i]);
			}
			SetTimer("DelayedGameModeExit", 1000, false);
			return true;
		}
		MinutesUntilGMX = mins;
		SendClientMessageToAllF(COLOR_GOLD, "* Admin %s has scheduled a server restart in %i minute(s)", NameEx(playerid), mins);
		//IRC_SayF(IRCBot, IRC_CHANNEL, "7* Admin %s has scheduled a server restart in %i minute(s)", NameEx(playerid), mins);
		//IRC_SayF(IRCBot, IRC_ADMIN_CHANNEL, "7* Admin %s has scheduled a server restart in %i minute(s)", NameEx(playerid), mins);
		if(strlen(reason) > 1)
		{
			SendClientMessageToAllF(COLOR_GOLD, "* Reason: %s", reason);
			//IRC_SayF(IRCBot, IRC_CHANNEL, "7* Reason: %s", reason);
			//IRC_SayF(IRCBot, IRC_ADMIN_CHANNEL, "7* Reason: %s", reason);
		}
		format(gstr, sizeof(gstr), "~n~~n~~n~~b~~h~SERVER RESTART~w~ in ~g~~h~%i MINUTES", mins);
		GameTextForAll(gstr, 10000, 3);
		format(gstr, sizeof(gstr), "Scheduled GMX in %i min", mins);
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

		SendClientMessageToAllF(COLOR_GOLD,"* Admin %s has cancelled the server restart.",NameEx(playerid));
		AdminLog(playerid, 0, "", "Cancelled GMX");
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
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /jp [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(!IsPlayerAdminLevelOK(playa,1)) return SysMsg(playerid,"That player can't use a Jet Pack.");

	if(GetPlayerSpecialAction(playa) == SPECIAL_ACTION_USEJETPACK)
	{
		SetPlayerSpecialAction(playa, SPECIAL_ACTION_NONE);
		SendClientMessageF(playa, COLOR_GREEN, "Admin %s removed your Jet Pack",NameEx(playerid));
		SendClientMessageF(playerid, COLOR_GREEN, "You removed %s's Jet Pack",NameEx(playa));
	}
	else
	{
		SetPlayerSpecialAction(playa,SPECIAL_ACTION_USEJETPACK);
		SendClientMessageF(playa, COLOR_GREEN, "Admin %s gave you a Jet Pack",NameEx(playerid));
		SendClientMessageF(playerid, COLOR_GREEN, "You gave %s a Jet Pack",NameEx(playa));
	}

	return true;
}
CMD:savecp(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new Float:pX, Float:pY, Float:pZ;
	GetPlayerPos(playerid, pX, pY, pZ);

	format(gstr, sizeof(gstr), "{%f, %f, %f} //%s", pX, pY, pZ, params);
	SysMsg(playerid, "> Saved Checkpoint Position To File.");
	return true;
}
CMD:apayday(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new towho[20];

	if(sscanf(params, "s[24]", towho)) return SysMsg(playerid,"Usage: /payday [player id or name / ALL]");

	if(strcmp("all", towho, true) == 0)
	{
		foreach(new i: Player)
		{
			if(Logged{i}) PayDay(i);
		}
		format(gstr, sizeof(gstr),"Everyone was given a Payday by Admin %s.",NameEx(playerid));
		SendClientMessageToAllLogged(COLOR_RED,gstr);
		AdminLog(playerid, 0, "", "Gave everyone a Payday");
	}
	else
	{
		new playa = -1;
		if(!IsNumeric(towho)) playa = GetPlayerID(playerid, towho); else playa = strval(towho);
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(!Logged{playa}) return SysMsg(playerid, NOPLAYER);
		if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");

		PayDay(playa);

		format(gstr, sizeof(gstr),"Admin %s gave you a Payday.",NameEx(playerid));
		SendClientMessage(playa,COLOR_RED,gstr);
		format(gstr, sizeof(gstr),"You gave %s a Payday.",NameEx(playa));
		SendClientMessage(playerid,COLOR_RED,gstr);
		AdminLog(playerid, SQLID[playa], GetName(playa), "Gave a Payday");
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
	AdminLog(playerid, 0, "", "Froze all");
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
	AdminLog(playerid, 0, "", "Defrosted all");
	return true;
}
CMD:slap(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /slap [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(IsJailed[playa] == 1) return SysMsg(playerid,"Please wait until they are out of jail.");
	if(IsCuffed[playa] == 1) return SysMsg(playerid,"Please wait until they are out of the cuffs.");

	new vehicleid = GetPlayerVehicleID(playa);
	if(vehicleid == 0)
	{
		new Float:pX,Float:pY,Float:pZ;
		GetPlayerPos(playa,pX,pY,pZ);
		SetPlayerPos(playa,pX,pY,(pZ+5.0));
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		SendClientMessageF(playa, COLOR_LIGHTBLUE, "Admin %s has slapped you!",NameEx(playerid));
	}
	else
	{
		new Float:vX,Float:vY,Float:vZ;
		GetVehicleVelocity(vehicleid,vX,vY,vZ);
		SetVehicleVelocity(vehicleid,vX,vY,vZ+0.25);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		SendClientMessageF(playa, COLOR_LIGHTBLUE, "Admin %s has slapped your vehicle!",NameEx(playerid));
	}
	return true;
}
CMD:slapdown(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /slapdown [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(IsJailed[playa] == 1) return SysMsg(playerid,"Please wait until they are out of jail.");
	if(IsCuffed[playa] == 1) return SysMsg(playerid,"Please wait until they are out of the cuffs.");

	new vehicleid = GetPlayerVehicleID(playa);
	if(vehicleid == 0)
	{
		new Float:pX,Float:pY,Float:pZ;
		GetPlayerPos(playa,pX,pY,pZ);
		SetPlayerPos(playa,pX,pY,(pZ-1.0));
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		format(gstr, sizeof(gstr),"Admin %s has slapped you!",NameEx(playerid));
		SendClientMessage(playa,COLOR_LIGHTBLUE,gstr);
	}
	else
	{
		new Float:vX,Float:vY,Float:vZ;
		GetVehicleVelocity(vehicleid,vX,vY,vZ);
		SetVehicleVelocity(vehicleid,vX,vY,vZ-0.25);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		format(gstr, sizeof(gstr),"Admin %s has slapped your vehicle!",NameEx(playerid));
		SendClientMessage(playa,COLOR_LIGHTBLUE,gstr);
	}
	return true;
}
CMD:doubleslap(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /doubleslap [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(IsJailed[playa] == 1) return SysMsg(playerid,"Please wait until they are out of jail.");
	if(IsCuffed[playa] == 1) return SysMsg(playerid,"Please wait until they are out of the cuffs.");

	new vehicleid = GetPlayerVehicleID(playa);
	if(vehicleid == 0)
	{
		new Float:pX,Float:pY,Float:pZ;
		GetPlayerPos(playa,pX,pY,pZ);
		SetPlayerPos(playa,pX,pY,(pZ+10.0));
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		format(gstr, sizeof(gstr),"Admin %s has double-slapped you!",NameEx(playerid));
		SendClientMessage(playa,COLOR_LIGHTBLUE,gstr);
	}
	else
	{
		new Float:vX,Float:vY,Float:vZ;
		GetVehicleVelocity(vehicleid,vX,vY,vZ);
		SetVehicleVelocity(vehicleid,vX,vY,vZ+0.75);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		format(gstr, sizeof(gstr),"Admin %s has double-slapped your vehicle!",NameEx(playerid));
		SendClientMessage(playa,COLOR_LIGHTBLUE,gstr);
	}
	return true;
}
CMD:uberslap(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /uberslap [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(IsJailed[playa] == 1) return SysMsg(playerid,"Please wait until they are out of jail.");
	if(IsCuffed[playa] == 1) return SysMsg(playerid,"Please wait until they are out of the cuffs.");

	new vehicleid = GetPlayerVehicleID(playa);
	if(vehicleid == 0)
	{
		new Float:pX,Float:pY,Float:pZ;
		GetPlayerPos(playa,pX,pY,pZ);
		SetPlayerPos(playa,pX,pY,(pZ+30.0));
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		format(gstr, sizeof(gstr),"Admin %s has uber-slapped you!",NameEx(playerid));
		SendClientMessage(playa,COLOR_LIGHTBLUE,gstr);
	}
	else
	{
		new Float:vX,Float:vY,Float:vZ;
		GetVehicleVelocity(vehicleid,vX,vY,vZ);
		SetVehicleVelocity(vehicleid,vX,vY,vZ+5.0);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		PlayerPlaySound(playa, SOUND_SLAP, 0,0,0);
		format(gstr, sizeof(gstr),"Admin %s has uber-slapped your vehicle!",NameEx(playerid));
		SendClientMessage(playa,COLOR_LIGHTBLUE,gstr);
	}

	return true;
}
CMD:burnmoney(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /burnmoney [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");

	BurningMoney[playa] = 1;

	SendClientMessageF(playa, COLOR_YELLOW, "Admin %s is now burning your money! MWAHAHAHAHA!", NameEx(playerid));
	SendClientMessageF(playerid, COLOR_YELLOW, "You are now burning %s's money.", NameEx(playa));
	return true;
}
CMD:stopburnmoney(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /stopburnmoney [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(BurningMoney[playa] == 0) return SysMsg(playerid,"Players money is not burning.");

	BurningMoney[playa] = 0;

	format(gstr, sizeof(gstr), "Admin %s has stopped burning your money!", NameEx(playerid));
	SendClientMessage(playa, COLOR_YELLOW, gstr);
	format(gstr, sizeof(gstr), "You have stopped burning %s's money.", NameEx(playa));
	SendClientMessage(playerid, COLOR_YELLOW, gstr);
	return true;
}
CMD:setmin(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Usage: /setmin [Minute]");
	if(!IsNumeric(params)) return SysMsg(playerid,"Minute must be a number.");
	new Minute = strval(params);
	if(Minute < 0 || Minute > 59) return SysMsg(playerid,"Minute was invalid (0 to 59)");
	if(Minute == gServerMinute) return SysMsg(playerid,"Minute is already set to that.");

	gServerMinute = Minute;
	format(gstr, sizeof(gstr),"[Admin] %s has changed the minute to %i.",NameEx(playerid),Minute);
	AdminBroadcast(gstr, 0);
	format(gstr, sizeof(gstr), "Changed minute to %i", Minute);
	AdminLog(playerid, 0, "", gstr);
	return true;
}
CMD:setgravity(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new Float:Grav;
	if(sscanf(params, "f", Grav)) return SysMsg(playerid,"Usage: /setgravity [Float:Value]");

	SetGravity(Grav);

	format(gstr, sizeof(gstr),"Admin %s has changed the gravity to %.6f.",NameEx(playerid),Grav);
	SendClientMessageToAllLogged(COLOR_LIGHTBLUE,gstr);
	format(gstr, sizeof(gstr), "Changed the gravity to %.6f", Grav);
	AdminLog(playerid, 0, "", gstr);
	return true;
}
CMD:xyz(playerid, params[])
{
	if(!IsPlayerAdmin(playerid) && !IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new Float:X, Float:Y, Float:Z;
	if(sscanf(params, "fff", X, Y, Z)) return SysMsg(playerid,"Usage: /xyz [Float:X] [Float:Y] [Float:Z]");

	SetPlayerPos(playerid, X, Y, Z);
	return true;
}
CMD:tc(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	SysMsgF(playerid, "Tick Count = %i", GetTickCount());
	return true;
}
CMD:setserverpass(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Usage: /setserverpass [password]");

	format(gstr, sizeof(gstr),"password %s",params);
	SendRconCommand(gstr);
	SysMsgF(playerid, "New Server Password: %s.",params);
	AdminLog(playerid, 0, "", "Changed the server password");
	return true;
}
CMD:saction(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	new vehicleid = GetPlayerVehicleID(playerid);
	if(vehicleid > 0) return SysMsg(playerid,"You must not be in a vehicle.");
	if(isnull(params)) return SysMsg(playerid,"Usage: /saction [id]");

	if(!IsNumeric(params)) return SysMsg(playerid,"ID must be a number.");

	SetPlayerSpecialAction(playerid, strval(params));
	return true;
}
CMD:anim(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);

	new lib[30], aname[30];
	if(sscanf(params, "s[30]s[30]", lib, aname)) return SysMsg(playerid,"Usage: /anim [library] [name]");

	OnePlayAnim(playerid, lib, aname, 3.5, 1, 0, 0, 0, 0);
	return true;
}
CMD:tooc(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	if(ToggleOOC == 0)
	{
		ToggleOOC = 1;
		SendClientMessageToAllLogged(COLOR_WHITE, "Global OOC Chat Enabled By An Admin.");
		AdminLog(playerid, 0, "", "Enabled global OOC");
	}
	else
	{
		ToggleOOC = 0;
		SendClientMessageToAllLogged(COLOR_WHITE, "Global OOC Chat Disabled By An Admin.");
		AdminLog(playerid, 0, "", "Disabled global OOC");
	}

	return true;
}
CMD:tbc(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	if(ToggleBC == 0)
	{
		ToggleBC = 1;
		AdminBroadcast("[Admin] Broadcasting Enabled By An Admin.", 1);
		AdminLog(playerid, 0, "", "Enabled broadcasts");
	}
	else
	{
		ToggleBC = 0;
		AdminBroadcast("[Admin] Broadcasting Disabled By An Admin.", 1);
		AdminLog(playerid, 0, "", "Disabled broadcasts");
	}

	return true;
}
CMD:refreshfcars(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);

	new fid;
	if(sscanf(params, "i", fid)) return SysMsg(playerid, "Usage: /refreshfcars [faction ID]");
	if(fid <= 0 || fid > MAX_FACTIONS-1) return SysMsg(playerid,"Invalid faction number (check /fids)");

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
			SendClientMessageF(i, COLOR_RED, "Admin %s has refreshed the faction vehicles of %s", NameEx(playerid), FACTIONS[fid][FactionName]);
		}
	}
	return true;
}
CMD:afrespawn(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

	new vehicle[10], option[10];
	if(sscanf(params, "s[10]S(-1)[10]", vehicle, option)) return SysMsg(playerid,"Usage: /afrespawn [vehicle id OR all] [faction id if respawning all]");

	if(strcmp("all", vehicle, true) == 0 && strcmp("all", option, true) == 0)
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
		SendClientMessageToAllLoggedF(COLOR_RED, "Admin %s has respawned ALL unoccupied faction vehicles.", NameEx(playerid));
	}
	else if(strcmp("all", vehicle, true) == 0)
	{
		if(strcmp(option, "-1", true) == 0 || !IsNumeric(option)) return SysMsg(playerid,"Usage: /afrespawn all [faction id]");

		new fid = strval(option);
		if(fid <= 0 || fid > MAX_FACTIONS-1) return SysMsg(playerid,"Invalid faction number (check /fids)");

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
		foreach(new i: Player) if(Logged{i} && Faction[i] == fid || playerid == i) SendClientMessageF(i, COLOR_ORANGE, "[Faction Message] %s has respawned %i out of %i faction vehicles.", NameEx(playerid), vcount, tcount);
	}
	else
	{
		new v = strval(vehicle);
		if(IsVehicleSpawned(v) && FVehicleData[v][FVFaction] >= 1)
		{
			if(VehicleBeingTowed(v)) return SysMsg(playerid, "You can't respawn a vehicle that is being towed.");
			if(VehicleIsOccupied(v)) return SysMsg(playerid, "You can't respawn a vehicle that is occupied.");
			if(FVehicleData[v][FImpounded]) return SysMsg(playerid, "You can't frespawn a vehicle that is impounded.");

			RespawnFactionCar(v);
			SendClientMessage(playerid, COLOR_ORANGE, "Vehicle has been respawned.");
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

	SysMsgF(playerid,"Vehicle ID: %i (Surfing ID: %i) | Model ID: %i | My Seat ID: %i | Pos: [X]%f, [Y]%f, [Z]%f, [ZA]%f",VehId,SurfingID,Model,SeatID,Pos[0],Pos[1],Pos[2],Pos[3]);

	if(VehId > 0) SysMsgF(playerid,"%s: Windows: %i(State: %i), Engine: %i(State: %i), Trunk: %i, Seats: %i, Color: %i,%i", GetVehicleName(VehId),VehicleHasWindows(VehId),WindowState{VehId},VehicleHasEngine(VehId),EngineStatus[VehId],VehicleHasTrunk(VehId),GetVehicleSeatCount(VehId),cols[0],cols[1]);
	return true;
}
CMD:vdamage(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(!IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid,"You must be in a vehicle.");

	new VehId = GetPlayerVehicleID(playerid);
	new panels, doors, lights, tires;
	GetVehicleDamageStatus(VehId, panels, doors, lights, tires);

	SysMsgF(playerid,"[%s damage] Panels: %i, Doors: %i, Lights: %i, Tires: %i", GetVehicleName(VehId), panels, doors, lights, tires);
	return true;
}
CMD:alock(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new VehId = GetPlayerVehicleID(playerid);
	if(VehId == 0) return SysMsg(playerid,"You must be in a vehicle to lock it.");

	if(Locked{VehId}) return SysMsgF(playerid,"[%s] Already Locked.",GetVehicleName(VehId));

	Locked{VehId} = true;
	AdminLocked{VehId} = true;
	ToggleVehicleLock(VehId, 1);

	SendClientMessage(playerid, COLOR_GREEN, "> Vehicle Locked. (Admin)");
	return true;
}
CMD:aunlock(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new VehId = GetPlayerVehicleID(playerid);

	if(VehId > 0)
	{
		if(!Locked{VehId}) return SysMsgF(playerid,"[%s] Already Unlocked.",GetVehicleName(VehId));
		Locked{VehId} = false;
		AdminLocked{VehId} = false;
		ToggleVehicleLock(VehId, 0);

		SendClientMessage(playerid, COLOR_GREEN, "> Vehicle Unlocked. (Admin)");
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

				SendClientMessage(playerid, COLOR_GREEN, "> Vehicle Unlocked. (Admin)");
			}
		}
	}

	return true;
}
CMD:cars(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);

	new playa;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /cars [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

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
				if(ImpoundData[v][iImpoundTime] == 0) format(sub, sizeof(sub), "%s - Currently Impounded (Awaiting Collection)\n", GetVehicleNameEx(ImpoundData[v][iModel]));
				else format(sub, sizeof(sub), "%s - Currently Impounded (%i minutes left)\n", GetVehicleNameEx(ImpoundData[v][iModel]), ImpoundData[v][iImpoundTime]);
				Vcount++;
				strcat(gstr, sub);
			}
			if(RepairData[v][rOwnerSQLID] == SQLID[playa])
			{
				if(RepairData[v][rTime] < gettime()) format(sub, sizeof(sub), "%s - Being worked on at the %s (Awaiting Collection)\n", GetVehicleNameEx(RepairData[v][rModel]), GetRepairGarageName(RepairData[v][rGarage]));
				else format(sub, sizeof(sub), "%s - Being worked on at the %s\n", GetVehicleNameEx(RepairData[v][rModel]), GetRepairGarageName(RepairData[v][rGarage]));
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
CMD:tele(playerid, params[]) return cmd_teleport(playerid, params);
CMD:tp(playerid, params[]) return cmd_teleport(playerid, params);

CMD:teleport(playerid, params[])
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
		Dialog_Show(playerid, TPList, DIALOG_STYLE_LIST, "TP yourself to ...", gstr, "Teleport", "Cancel");
		return true;
	}

	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(IsJailed[playa] == 1) return SysMsg(playerid,"That player is in jail.");
	if(IsCuffed[playa] == 1) return SysMsg(playerid,"That player is in cuffs.");

	new vehicleid = GetPlayerVehicleID(playa);

	if(vehicleid != 0) SetPVarInt(playerid, "tpVID", vehicleid);
	SetPVarInt(playerid, "tpID", playa);

	for(new i = 0; i < sizeof(Teleports); i++)
	{
		format(tgstr, sizeof(tgstr), "%s\n", Teleports[i][TPName]);
		strcat(gstr, tgstr);
	}
	Dialog_Show(playerid, TPList, DIALOG_STYLE_LIST, "TP player to ...", gstr, "Teleport", "Cancel");
	return true;
}
CMD:tpto(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Usage: /tpto [teleport name from /tp list] *Use /tptop for other players*");

	new p = -1;
	for(new x = 0; x < sizeof(Teleports); x++)
	{
		if(strfind(Teleports[x][TPName], params, true) != -1)
		{
			p = x;
			break;
		}
	}
	if(p == -1) return SysMsg(playerid, "Unable to find teleport name.");

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
		SendClientMessageF(playerid, COLOR_LIGHTBLUE, "Admin %s has teleported you to %s.",NameEx(playerid),Teleports[p][TPName]);
		format(gstr, sizeof(gstr),"[Admin] %s has teleported %s to %s", NameEx(playerid),NameEx(playerid),Teleports[p][TPName]);
		AdminBroadcast(gstr, 1);
		format(gstr, sizeof(gstr), "Teleported to %s", Teleports[p][TPName]);
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
		SendClientMessageF(playerid,COLOR_LIGHTBLUE, "Admin %s has teleported you to %s.",NameEx(playerid), Teleports[p][TPName]);
		format(gstr, sizeof(gstr),"[Admin] %s has teleported %s to %s.",NameEx(playerid),NameEx(playerid), Teleports[p][TPName]);
		AdminBroadcast(gstr, 1);
		format(gstr, sizeof(gstr), "Teleported to %s", Teleports[p][TPName]);
		AdminLog(playerid, SQLID[playerid], GetName(playerid), gstr);
		return true;
	}
}
CMD:tptop(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new loc[32], player = -1;
	if(sscanf(params, "us[32]", player, loc)) return SysMsg(playerid, "Usage: /tptop [player ID or name] [teleport name from /tp list]");
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
	if(p == -1) return SysMsg(playerid, "Unable to find teleport name.");

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
		SendClientMessageF(player, COLOR_LIGHTBLUE, "Admin %s has teleported you to %s.",NameEx(playerid),Teleports[p][TPName]);
		format(gstr, sizeof(gstr),"[Admin] %s has teleported %s to %s", NameEx(playerid),NameEx(player),Teleports[p][TPName]);
		AdminBroadcast(gstr, 1);
		format(gstr, sizeof(gstr), "Teleported to %s", Teleports[p][TPName]);
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
		SendClientMessageF(player,COLOR_LIGHTBLUE, "Admin %s has teleported you to %s.",NameEx(playerid), Teleports[p][TPName]);
		format(gstr, sizeof(gstr),"[Admin] %s has teleported %s to %s.",NameEx(playerid),NameEx(player), Teleports[p][TPName]);
		AdminBroadcast(gstr, 1);
		format(gstr, sizeof(gstr), "Teleported to %s", Teleports[p][TPName]);
		AdminLog(playerid, SQLID[player], GetName(player), gstr);
		return true;
	}
}
CMD:getp(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(IsJailed[playerid] == 1) return SysMsg(playerid,"Please wait until you are out of jail.");
	if(IsCuffed[playerid] == 1) return SysMsg(playerid,"This action cannot be performed while you are in handcuffs.");

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /getp [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(IsJailed[playa] == 1) return SysMsg(playerid,"That player is in jail.");
	if(IsSpectating[playa] >= 0) return SysMsg(playerid,"You can't get a person who is spectating.");

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

	SendClientMessageF(playa, COLOR_LIGHTBLUE, "Admin %s has teleported you to them",NameEx(playerid));
	SendClientMessageF(playerid, COLOR_LIGHTGREEN, "You have teleported %s to your position.",NameEx(playa));
	AdminLog(playerid, SQLID[playa], GetName(playa), "Get player");
	return true;
}
CMD:vget(playerid, params[])
{
	new vehicleid, player;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(sscanf(params, "ii", player, vehicleid)) return SysMsg(playerid, "Usage: /vget [playerid] [vehicleid]");
	if(InvalidPlayer(player)) return SysMsg(playerid,"Invalid ID.");
	if(IsPlayerNPC(player)) return SysMsg(playerid,"That player is a NPC.");
	if(!Logged{player}) return SysMsg(playerid,"Not logged in.");
	if(vehicleid < 1 || vehicleid > MAX_VEHICLES || !IsVehicleSpawned(vehicleid)) return SysMsg(playerid, "You have specified an invalid vehicle ID.");
	if(IsPlayerInAnyVehicle(player)) return SysMsg(playerid, "That player is already in a vehicle.");

	new seatid = GetVehicleAvailableSeat(vehicleid);
	if(seatid == -1) return SysMsg(playerid, "There are no seats left to enter.");
	PutPlayerInVehicle(player, vehicleid, seatid);
	return true;
}
CMD:gotop(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, playa2 = -1;
	if(sscanf(params, "uU(-1)", playa, playa2)) return SysMsg(playerid,"Usage: /gotop [ID Teleporting to] [Optional: Player being teleported]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsSpectating[playa] >= 0) return SysMsg(playerid, "You cannot teleport to someone while they're spectating another player.");
	if(!Logged{playa}) return SysMsg(playerid, "This player has not logged in.");
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

		SendClientMessageF(playerid, COLOR_LIGHTGREEN,"You have teleported to %s", NameEx(playa));
		SendClientMessageF(playa, COLOR_SKYBLUE, "Admin %s has teleported to your position.", NameEx(playerid));

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

		format(gstr, sizeof(gstr), "Teleported player", GetName(playa));
		AdminLog(playerid, SQLID[playa], GetName(playa), "Teleported player");
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

		if(IsJailed[playa2] == 1) return SysMsg(playerid,"That player is currently in jail.");
		if(IsCuffed[playa2] == 1) return SysMsg(playerid,"That player is currently cuffed.");
		if(IsSpectating[playa2] >= 0) return SysMsg(playerid,"That player is currently spectating");

		SendClientMessageF(playerid, COLOR_LIGHTGREEN, "You have teleported %s[ID %i] to %s[ID %i]", NameEx(playa2), playa2, NameEx(playa), playa);
		SendClientMessageF(playa2, COLOR_TURQUOISE, "Admin %s has teleported you to %s's position.", NameEx(playerid), NameEx(playa));
		format(gstr, sizeof(gstr), "Teleported player to %s", GetName(playa));
		AdminLog(playerid, SQLID[playa2], GetName(playa2), gstr);
	}
	return true;
}
CMD:gotoh(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new hname[32],h;
	if(sscanf(params, "s[32]", hname)) return SysMsg(playerid,"Usage: /gotoh [House Name]");

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
	else return SysMsg(playerid, "Invalid House Address");
	return true;
}
CMD:gotob(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new hname[32],h;
	if(sscanf(params, "s[32]", hname)) return SysMsg(playerid,"Usage: /gotob [Business Name]");

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
	else return SysMsg(playerid, "Invalid Business Address");
	return true;
}
CMD:gotov(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(IsJailed[playerid] == 1) return SysMsg(playerid,"Please wait until you are out of jail.");
	if(IsCuffed[playerid] == 1) return SysMsg(playerid,"This action cannot be performed while you are in handcuffs.");

	new vid, id;
	if(sscanf(params, "iI(-1)", vid, id)) return SysMsg(playerid,"Usage: /gotov [Vehicle ID] [Optional: Player being teleported]");

	if(!IsVehicleSpawned(vid)) return SysMsg(playerid,"No such vehicle ID spawned.");

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
		SendClientMessageF(playerid, COLOR_LIGHTGREEN, "You have teleported to a %s [ID %i]", GetVehicleName(vid), vid);
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
		SendClientMessageF(playerid, COLOR_LIGHTGREEN, "You have teleported %s to a %s [ID %i]", NameEx(id), GetVehicleName(vid), vid);
		SendClientMessageF(id, COLOR_TURQUOISE, "Admin %s has teleported you to a %s [ID %i]", NameEx(playerid), GetVehicleName(vid), vid);
	}
	return true;
}
CMD:getv(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(IsJailed[playerid] == 1) return SysMsg(playerid,"Please wait until you are out of jail.");
	if(IsCuffed[playerid] == 1) return SysMsg(playerid,"This action cannot be performed while you are in handcuffs.");

	if(isnull(params)) return SysMsg(playerid,"Usage: /getv [vehicle id]");
	if(!IsNumeric(params)) return SysMsg(playerid,"Vehicle ID must be a number.");

	new vehicleid = strval(params);
	if(vehicleid < 1) return SysMsg(playerid,"Invalid vehicle.");
	if(!IsVehicleSpawned(vehicleid)) return SysMsg(playerid,"No such vehicle ID spawned.");

	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

	LinkVehicleToInteriorEx(vehicleid, GetPlayerInterior(playerid));
	SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));

	SetVehiclePos(vehicleid, x+4, y+4, z+4);
	return true;
}
CMD:blowup(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	if(IsJailed[playerid] == 1) return SysMsg(playerid,"Please wait until you are out of jail.");
	if(IsCuffed[playerid] == 1) return SysMsg(playerid,"This action cannot be performed while you are in handcuffs.");

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /blowup [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsJailed[playa] == 1) return SysMsg(playerid,"That player is in jail.");

	new Float:pX,Float:pY,Float:pZ;

	GetPlayerPos(playa,pX,pY,pZ);
	CreateExplosion(pX,pY,pZ,0,10);
	CreateExplosion(pX,pY,pZ,0,10);
	CreateExplosion(pX,pY,pZ,0,10);

	AdminLog(playerid, SQLID[playa], GetName(playa), "Blows up");
	return true;
}
CMD:fakeme(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, action[128];
	if(sscanf(params, "us[128]", playa, action)) return SysMsg(playerid,"Usage: /fakeme [playerid/name] [action]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

	format(gstr, sizeof(gstr), "%s %s",NameEx(playa),action);
	ProxDetector(20.0,playa,gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
	return true;
}
CMD:fakedo(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, action[128];
	if(sscanf(params, "us[128]", playa, action)) return SysMsg(playerid,"Usage: /fakedo [playerid/name] [action]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

	format(gstr, sizeof(gstr), "%s ((%s))",action,NameRP(playa));
	ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
	return true;
}
CMD:disarm(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /disarm [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

	ResetPlayerWeaponsEx(playa);
	SyncPlayerWeapons(playa);

	format(gstr, sizeof(gstr),"Admin %s has disarmed you.",NameEx(playerid));
	SendClientMessage(playa, COLOR_LIGHTGREEN, gstr);
	format(gstr, sizeof(gstr),"You have disarmed %s.",NameEx(playa));
	SendClientMessage(playerid, COLOR_LIGHTGREEN, gstr);
	AdminLog(playerid, SQLID[playa], GetName(playa), "Disarmed");
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
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /spectate [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(playa == playerid) return SysMsg(playerid,"You can't spectate yourself.");
	if(!Logged{playa}) return SysMsg(playerid, "This player has not logged in. Please wait until they have logged in to spectate them.");
	if(IsSpectating[playa] >= 0) return SysMsg(playerid,"You can't spectate a person who is also spectating.");
	if(PfSpec[playa][FlySpec] == 1) return SysMsg(playerid, "You can't spectate a person who is using /fly.");
	if(MasterAccount[playa] == 29469 && MasterAccount[playerid] == 19025) return SysMsg(playerid, "Nice try, buddy. Love, Emmalee");

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
	if(PfSpec[playerid][FlySpec] == 1)
	{
		PfSpec[playerid][FlySpec] = 0;
		TogglePlayerSpectating(playerid, false);
		if(IsValidObject(PfSpec[playerid][fsobj]))
			DestroyPlayerObject(playerid, PfSpec[playerid][fsobj]);
	}

	TogglePlayerSpectating(playerid, 1);
	SetPlayerInterior(playerid, GetPlayerInterior(playa));
	SetPlayerVirtualWorldEx(playerid, GetPlayerVirtualWorld(playa));

	new tVehId = GetPlayerVehicleID(playa);

	if(tVehId > 0)
	{
		PlayerSpectateVehicle(playerid, tVehId, SPECTATE_MODE_NORMAL);
		SysMsgF(playerid, "You are now spectating %s (in vehicle) Use /specoff to return to normal.",NameEx(playa));
		IsSpectating[playerid] = playa;
		PlayerTextDrawShow(playerid, pSpecTD[playerid]);
		format(gstr, sizeof(gstr), "Spectating ~P~%s (%i)", NameEx(playa), playa);
		PlayerTextDrawSetString(playerid, pSpecTD[playerid], gstr);
	}
	else
	{
		PlayerSpectatePlayer(playerid, playa, SPECTATE_MODE_NORMAL);
		SysMsgF(playerid, "You are now spectating %s (on foot) Use /specoff to return to normal.",NameEx(playa));
		IsSpectating[playerid] = playa;
		PlayerTextDrawShow(playerid, pSpecTD[playerid]);
		format(gstr, sizeof(gstr), "Spectating ~P~%s (%i)", NameEx(playa), playa);
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
	if(isnull(params)) return SysMsg(playerid,"Usage: /vspec [vehicle id]");
	if(!IsNumeric(params) && strval(params) > 0) return SysMsg(playerid,"Usage: /vspec [vehicle id]");
	vehicleid = strval(params);
	if(vehicleid > MAX_VEHICLES) return SysMsg(playerid, "Invalid vehicle.");
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);
	if(!IsVehicleSpawned(vehicleid)) return SysMsg(playerid,"Invalid Vehicle ID.");

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
	SysMsgF(playerid, "You are now spectating vehicle ID %i (%s). Use /specoff to return to normal.",vehicleid,GetVehicleNameEx(GetVehicleModel(vehicleid)));
	IsSpectating[playerid] = 1000;
	return true;
}
CMD:specoff(playerid) return cmd_spectateoff(playerid);
CMD:spectateoff(playerid)
{
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);
	if(IsSpectating[playerid] == -1) return SysMsg(playerid,"You are not spectating.");
	TogglePlayerSpectating(playerid, 0);
	SetPlayerPos(playerid, TempInfo[playerid][tmX], TempInfo[playerid][tmY], TempInfo[playerid][tmZ]);
	SetPlayerInterior(playerid, TempInfo[playerid][tInt]);
	SetPlayerVirtualWorldEx(playerid, TempInfo[playerid][tVW]);
	SetPlayerSkinEx(playerid, TempInfo[playerid][tSkin]);
	IsSpectating[playerid] = -1;
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
CMD:whospec(playerid, params[])
{
	new count = 0;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	foreach(new i: Player)
	{
		if(IsSpectating[i] != -1 && AdminLevel[i] >= 1 && IsSpectating[i] != 1000)
		{
			SendClientMessageF(playerid, COLOR_WHITE, "Administrator %s is spectating %s.", NameEx(i), NameEx(IsSpectating[i]));
			count++;
		}
	}
	if(count == 0) return SysMsg(playerid, "Nobody is spectating.");
	return true;
}
CMD:fach(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, achievID;
	if(sscanf(params, "ui", playa, achievID)) return SysMsg(playerid,"Usage: /fach [player id or name] [achievement id]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(!Logged{playa}) return SysMsg(playerid,"Player Id is not logged in.");

	if(achievID < 1 || achievID >= MAX_ACHS) return SysMsg(playerid,"Invalid Achievement.");

	UnlockAchievement(playa, achievID);
	SendClientMessageF(playa, COLOR_LIGHTGREEN, "Admin %s has unlocked achievement %i for you.", NameEx(playerid), achievID);
	SendClientMessageF(playerid, COLOR_LIGHTGREEN, "You unlocked achievement %i for %s.", achievID, NameEx(playa));
	format(gstr, sizeof(gstr), "Unlocked achievement %i", achievID);
	AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	return true;
}
CMD:vehiclelookup(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Usage: /vehiclelookup [vehicle model name]");

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
	if(count == 0) return SysMsgF(playerid, "Could not find any players driving a(n) %s", params);
	ShowMessage(playerid, "Players in that vehicle", gstr, "Done");
	return true;
}
CMD:weaponlookup(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Usage: /weaponlookup [weapon name]");

	new wid = GetWeaponIdFromName(params), count = 0;
	if(wid == -1) return SysMsg(playerid, "Invalid weapon.");

	gstr[0] = EOS;
	foreach(new i: Player)
	{
		if(GetPlayerWeapon(i) == wid)
		{
			new wep, ammo, zone[MAX_ZONE_NAME];
			GetPlayerWeaponData(i, GetWeaponSlot(wid), wep, ammo);
			GetPlayer3DZone(i, zone, MAX_ZONE_NAME);

			format(sgstr, sizeof(sgstr), "%s (ID: %i, Loc: %s) - %s, %i ammo\n", NameEx(i), i, zone, GetWeaponNameFromID(wid), ammo);
			strcat(gstr, sgstr);
			count++;
		}
	}
	if(count == 0) return SysMsgF(playerid, "Could not find any players holding %s", weaponstring[wid]);
	ShowMessage(playerid, "Players holding that weapon", gstr, "Done");
	return true;
}
CMD:arealookup(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params))
	{
		SysMsg(playerid, "Usage: /arealookup [area of interest. e.g, montgomery]");
		SysMsg(playerid, "Note: Area name must MATCH one of the zones ingame, otherwise no players will be found.");
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
	if(count == 0) return SysMsgF(playerid, "Could not find any players in %s", params);
	ShowMessage(playerid, "Players found in that zone", gstr, "Done");
	return true;
}
CMD:setmotd(playerid, params[])
{
	new motdid;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(sscanf(params, "is[128]", motdid, gstr)) return SysMsg(playerid,"Usage: /setmotd [motd id] [message]") && SysMsg(playerid, "MOTD IDs are 1: Admin, 2: Helper, 3: Player");
	if(motdid < 1 || motdid > 3) return SysMsg(playerid, "You must enter a valid MOTD ID. Available MOTD IDs are 1: Admin, 2: Helper, 3: Player");

	if(motdid == 1) //Admin MOTD
	{
		if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, "You are not the appropriate admin rank to modify this MOTD");
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE motd SET message = '%e' WHERE motdid = %i", gstr, motdid-1);
		mysql_pquery(conn, mquery);
		SendClientMessageF(playerid, COLOR_WHITE, "You have set the Admin MOTD to %s", gstr);
		AdminLog(playerid, 0, gstr, "Changed Admin MOTD");
		return true;
	}

	if(motdid == 2) //Helper MOTD
	{
		if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, "You are not the appropriate admin rank to modify this MOTD");
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE motd SET message = '%e' WHERE motdid = %i", gstr, motdid-1);
		mysql_pquery(conn, mquery);
		SendClientMessageF(playerid, COLOR_WHITE, "You have set the Helper MOTD to %s", gstr);
		AdminLog(playerid, 0, gstr, "Changed Helper MOTD");
		return true;
	}

	if(motdid == 3) //Player MOTD
	{
		if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, "You are not the appropriate admin rank to modify this MOTD");
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE motd SET message = '%e' WHERE motdid = %i", gstr, motdid-1);
		mysql_pquery(conn, mquery);
		SendClientMessageF(playerid, COLOR_WHITE, "You have set the Player MOTD to %s", gstr);
		AdminLog(playerid, 0, gstr, "Changed Player MOTD");
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
		SysMsg(playerid,"Usage: /set [Player ID/Vehicle ID] [option] [value]");
		SysMsg(playerid,"Options: VW, Interior, HP, Armour");
		if(IsPlayerAdminLevelOK(playerid, 2)) SysMsg(playerid, "Options: Skin, Fuel, Weather");
		if(IsPlayerAdminLevelOK(playerid, 3))
		{
			SysMsg(playerid, "Options: Faction, Rank, Job, Name, Fightstyle");
			SysMsg(playerid, "Options: Drunk, Weaponskill, vh");
		}
		if(IsPlayerAdminLevelOK(playerid, 4)) SysMsg(playerid, "Options: AdminLevel, Time");
		return true;
	}
	if(strmatch("fuel", pname))
	{
		new playerState = GetPlayerState(playerid);
		if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

		if(!IsNumeric(option)) return SysMsg(playerid,"Amount must be a number.");
		if(strval(option) < 0 || strval(option) > 100) return SysMsg(playerid,"Amount must be 0 to 100.");

		new vid = GetPlayerVehicleID(playerid);
		if(vid == 0) return SysMsg(playerid,"Not in a vehicle.");
		Fuel[vid] = floatstr(option);

	//	UpdateFuelText(vid, gstr);
//		PlayerTextDrawSetString(playerid, FuelText[playerid], gstr);
		//TextDrawShowForPlayer(playerid,FuelText[playerid]);

		if(playerState == PLAYER_STATE_PASSENGER) SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Fuel Set To %i In This %s(%i)", strval(option),GetVehicleName(vid),vid);

		else if(playerState == PLAYER_STATE_DRIVER && Fuel[vid] >= 10)
		{
			//PlayerTextDrawShow(playerid, FuelText[playerid]);
			SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Fuel Set To %i In This %s(%i)", strval(option),GetVehicleName(vid),vid);
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
			SysMsgF(playerid, "Vehicle Health Set To %i.", strval(option));
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

		format(gstr, sizeof(gstr),"[Admin] %s has changed the weather to ID %i(%s).",NameEx(playerid),strval(option),GetWeatherName(strval(option)));
		AdminBroadcast(gstr, 0);
		format(gstr, sizeof(gstr), "Changed weather to %i", strval(option));
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

		format(gstr, sizeof(gstr),"[Admin] %s has changed the time to %i.",NameEx(playerid),strval(option));
		AdminBroadcast(gstr, 0);
		format(gstr, sizeof(gstr), "Changed time to %i", strval(option));
		AdminLog(playerid, 0, "", gstr);
		return true;
	}

	playa = GetPlayerIDs(pname);
	if(InvalidPlayer(playa)) return SysMsg(playerid,"Invalid player or option.");
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(!Logged{playa}) return SysMsg(playerid,"Player ID is not logged in.");

	if(strmatch("int", option) || strmatch("interior", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
		if(!IsNumeric(Value)) return SysMsg(playerid, "The value needs to be a number.");
		SendClientMessageF(playerid, COLOR_LIGHTGREEN, "You have successfully set %s's [ID:%i] interior world ID to %i.", NameEx(playa), playa, strval(Value));
		SendClientMessageF(playa, COLOR_LIGHTGREEN, "Admin %s has set your interior world to ID %i.", NameEx(playerid), strval(Value));
		SetPlayerInterior(playa, strval(Value));
	}
	else if(strmatch("vw", option) || strmatch("virtual", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
		if(!IsNumeric(Value)) return SysMsg(playerid, "The value needs to be a number.");
		SendClientMessageF(playerid, COLOR_LIGHTGREEN, "You have successfully set %s's [ID:%i] virtual world ID to %i.", NameEx(playa), playa, strval(Value));
		SendClientMessageF(playa, COLOR_LIGHTGREEN, "Admin %s has set your virtual world to ID %i.", NameEx(playerid), strval(Value));
		SetPlayerVirtualWorldEx(playa, strval(Value));
	}
	else if(strcmp("faction",option,true) == 0)
	{
		if(IsPlayerAdminLevelOK(playerid, 3))
		{
			if(strval(Value) < 0) return SysMsg(playerid,"Invalid value! (No Such Faction Number)");
			if(strval(Value) > MAX_FACTIONS-1) return SysMsg(playerid,"Invalid value! (No Such Faction Number)");
			if(strval(Value) == Faction[playa]) return SysMsg(playerid,"Invalid value! (Already Set To That value)");
			if(strval(Value) == FACTION_PROP && !CanSetST(playerid)) return SysMsg(playerid,"That faction is invite only!");

			if(Faction[playa] > 0 && strval(Value) == 0) MySpawnID[playa] = 1;
			if(Faction[playa] == 0 && strval(Value) > 0) MySpawnID[playa] = 2;

			Faction[playa] = strval(Value);
			FactionRank[playa] = 1;
			SubFactionSpawn[playerid] = 1;
			//GivePlayerWeapons(playa);
			Duty[playerid] = 0;

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE players SET FactionRank = %i, Faction = %i, SubFactionSpawn = %i, MySpawnID = %i WHERE id = %i", FactionRank[playa], Faction[playa], SubFactionSpawn[playa], MySpawnID[playa], SQLID[playa]);
			mysql_pquery(conn, mquery);

			SendClientMessageF(playerid, COLOR_LIGHTGREEN, "You have set %s's faction to %s(%i).",NameEx(playa),GetFactionNameFromId(strval(Value)),strval(Value));
			SendClientMessageF(playa, COLOR_LIGHTGREEN, "Admin %s has set your faction to %s(%i).",NameEx(playerid),GetFactionNameFromId(strval(Value)),strval(Value));
			format(gstr, sizeof(gstr), "Set faction to %i", strval(Value));
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			UnlockAchievement(playerid, 5);
		}
		else return SysMsg(playerid, "You are not a high enough rank to use this option.");
	}
	else if(strcmp("rank",option,true) == 0)
	{
		if(IsPlayerAdminLevelOK(playerid, 3))
		{
			if(strval(Value) < 1 || strval(Value) > 15) return SysMsg(playerid,"Invalid value! (No Such Rank Number)");
			if(strval(Value) > FACTIONS[Faction[playa]][FactionUberLeaderRank]) return SysMsg(playerid,"That rank does not exist in that faction.");
			if(strval(Value) == FactionRank[playa]) return SysMsg(playerid,"Invalid value! (Already Set To That value)");

			FactionRank[playa] = strval(Value);
			MySQLUpdateInt(SQLID[playa], "FactionRank", FactionRank[playa], "players");

			SendClientMessageF(playerid, COLOR_LIGHTGREEN, "You have set %s's faction rank to %s(%i).",NameEx(playa),GetFactionRankName(Faction[playa], FactionRank[playa]),strval(Value));
			SendClientMessageF(playa, COLOR_LIGHTGREEN, "Admin %s has set your faction rank to %s(%i).",NameEx(playerid),GetFactionRankName(Faction[playa], FactionRank[playa]),strval(Value));
			format(gstr, sizeof(gstr), "Set faction rank to %i", strval(Value));
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		}
		else return SysMsg(playerid, "You are not a high enough rank to use this option.");
	}
	else if(strcmp("job",option,true) == 0)
	{
		if(IsPlayerAdminLevelOK(playerid, 3))
		{
			if(strval(Value) < 0 || strval(Value) > MAX_JOBS) return SysMsg(playerid,"Invalid value! (No Such Job)");
			if(strval(Value) == Job[playa]) return SysMsg(playerid,"Invalid value! (Already Set To That value)");
			if(strval(Value) == 3) return SysMsg(playerid, "This job is no longer available.");

			Job[playa] = strval(Value);
			MySQLUpdateInt(SQLID[playa], "Job", Job[playa], "players");

			new JName[25];
			switch(Job[playa])
			{
				case 0: JName = "None";
				case JOB_MECHANIC: JName = "Mechanic";
				case JOB_DRUGDEALER: JName = "Drug Dealer";
				case JOB_TAXI: JName = "Taxi Driver";
			}

			SendClientMessageF(playerid, COLOR_LIGHTGREEN, "You have set %s's job to %s(%i).",NameEx(playa),JName,strval(Value));
			SendClientMessageF(playa, COLOR_LIGHTGREEN, "Admin %s has set your job to %s(%i).",NameEx(playerid),JName,strval(Value));
			format(gstr, sizeof(gstr), "Set job to %i(%s)", strval(Value), JName);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		}
		else return SysMsg(playerid, "You are not a high enough rank to use this option.");
		return true;
	}
	else if(strmatch("hp", option) || strmatch("health", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid,"You are not a high enough rank to use this option.");

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
		SendClientMessageF(playa, COLOR_LIGHTBLUE, "Your health has been set to %i by %s",strval(Value),NameEx(playerid));
		SendClientMessageF(playerid, COLOR_RED, "You have set %s's health to %i",NameEx(playa),strval(Value));
		format(gstr, sizeof(gstr), "Set health to %i", strval(Value));
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	}
	else if(strmatch("armour", option) || strmatch("armor", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

		if(strval(Value) < 0 || strval(Value) > 100) return SysMsg(playerid,"Invalid armour amount! (0-100 only)");

		SetPlayerArmourEx(playa, strval(Value), 1);

		SendClientMessageF(playa, COLOR_LIGHTBLUE, "Your armour has been set to %i by %s",strval(Value),NameEx(playerid));
		SendClientMessageF(playerid, COLOR_RED, "You have set %s's armour to %i",NameEx(playa),strval(Value));
		format(gstr, sizeof(gstr), "Set armour to %i", strval(Value));
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		if(IsPlayerMasked{playa}) FormatHealthLabelText(playa, HealthVar[playa], ArmourVar[playa], 2);
	}
	else if(strmatch("name", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);
		if(strcmp(GetName(playa),Value,false) == 0) return SysMsg(playerid,"That player already has that name.");
		if(!IsValidRoleplayName(Value)) return SysMsg(playerid,"That name isn't deemed roleplay.");
		if(MySQLCheckAccount(Value, playerid) != 0) return SysMsg(playerid,"That name is already taken in the database.");
		if(strlen(Value) > 24) return SysMsg(playerid,"Error: SAMP only allows names with 24 or less letters.");
		if(hmData[playa][hmActive] == 1) return SysMsg(playerid, "This player is currently aliased. Please contact them personally if you need to change their name");

		new oldname[MAX_PLAYER_NAME];
		format(oldname, MAX_PLAYER_NAME, GetName(playa));

		if(SetPlayerName(playa, Value) != 1) return SysMsg(playerid, "That name is too short, too long, in use, the same or contains invalid letters.");

		MySQLUpdateString(SQLID[playa], "Name", Value, "players");
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE phones SET OwnerName = '%e' WHERE OwnerSQLID = %i", Value, SQLID[playa]);
		mysql_pquery(conn, mquery);

		format(PhoneData[playa][pOwnerName], 25, "%s", Value);

		SendClientMessageF(playa,COLOR_DARKBLUE,"Admin %s has changed your name to %s.", GetName(playerid), Value);
		SendClientMessageF(playerid, COLOR_RED, "You changed %s's name to %s.", oldname, Value);
		format(sgstr, sizeof(sgstr), "Changed %s's name to %s", oldname, Value);
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
		if(GetPlayerSpecialAction(playa) == SPECIAL_ACTION_ENTER_VEHICLE || GetPlayerSpecialAction(playa) == SPECIAL_ACTION_EXIT_VEHICLE) return SysMsg(playerid, "You cannot do this while the player is entering/exiting a vehicle.");
		if(GetPlayerSpecialAction(playa) == SPECIAL_ACTION_DUCK) return SysMsg(playerid,"You cannot change a skin when they are crouched.");
		if(GetPlayerVehicleID(playa) > 0) return SysMsg(playerid,"You cannot change a skin when they are in a vehicle.");
		if(strval(Value) < 1 || strval(Value) > 311 || strval(Value) == 74) return SysMsg(playerid,"Skin ID was invalid.");

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
		format(gstr, sizeof(gstr), "Set skin to %i", strval(Value));
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	}
	else if(strmatch("fightstyle", option) || strmatch("fight", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);
		if(strmatch("None", Value))
		{
			SysMsg(playerid,"Usage: /set [player id or name] fightstyle [style id/name]");
			SysMsg(playerid,"Style Types: 0-Normal, 1-Boxer, 2-Kungfu");
			return true;
		}

		new StyleType = -1;
		if(IsNumeric(Value))
		{
			if(strval(Value) < 0 || strval(Value) > 2) return SysMsg(playerid,"Invalid Style (0-2).");
			StyleType = strval(Value);
		}

		if(StyleType == 0 || strcmp("normal",Value,true) == 0)
		{
			if(GetPlayerFightingStyle(playa) == FIGHT_STYLE_NORMAL) return SysMsg(playerid,"Error: Already that fighting style.");
			SetPlayerFightingStyle(playa, FIGHT_STYLE_NORMAL);
			UsingFightStyle{playa} = FIGHT_STYLE_NORMAL;
			MySQLUpdateInt(SQLID[playa], "FightStyle", FIGHT_STYLE_NORMAL, "players");
			format(gstr, sizeof(gstr),"Admin %s set your fighting style to normal.",NameEx(playerid));
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's fighting style to normal.",NameEx(playa));
			SendClientMessage(playerid,COLOR_RED, gstr);
			return true;
		}
		if(StyleType == 1 || strcmp("boxer",Value,true) == 0)
		{
			if(GetPlayerFightingStyle(playa) == FIGHT_STYLE_BOXING) return SysMsg(playerid,"Error: Already that fighting style.");
			SetPlayerFightingStyle(playa, FIGHT_STYLE_BOXING);
			UsingFightStyle{playa} = FIGHT_STYLE_BOXING;

			if(!FightStyleLearned[playa]{FS_BOXING})
			{
				FightStyleLearned[playa]{FS_BOXING} = true;
				MySQLUpdateInt(SQLID[playa], "FightStyleLearnedBoxing", 1, "players");
			}
			MySQLUpdateInt(SQLID[playa], "FightStyle", FIGHT_STYLE_BOXING, "players");
			format(gstr, sizeof(gstr),"Admin %s set your fighting style to boxer.",NameEx(playerid));
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's fighting style to boxer.",NameEx(playa));
			SendClientMessage(playerid,COLOR_RED, gstr);
			return true;
		}
		if(StyleType == 2 || strcmp("kungfu",Value,true) == 0)
		{
			if(GetPlayerFightingStyle(playa) == FIGHT_STYLE_KUNGFU) return SysMsg(playerid,"Error: Already that fighting style.");
			SetPlayerFightingStyle(playa, FIGHT_STYLE_KUNGFU);
			UsingFightStyle{playa} = FIGHT_STYLE_KUNGFU;
			if(!FightStyleLearned[playa]{FS_KUNGFU})
			{
				FightStyleLearned[playa]{FS_KUNGFU} = true;
				MySQLUpdateInt(SQLID[playa], "FightStyleLearnedKungFu", 1, "players");
			}
			MySQLUpdateInt(SQLID[playa], "FightStyle", FIGHT_STYLE_KUNGFU, "players");
			format(gstr, sizeof(gstr),"Admin %s set your fighting style to kung-fu.",NameEx(playerid));
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's your fighting style to kung-fu.",NameEx(playa));
			SendClientMessage(playerid,COLOR_RED, gstr);
			return true;
		}
		format(gstr, sizeof(gstr), "Set fight style to %i/%s", StyleType, Value);
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	}
	else if(strmatch("drunk", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

		new DLevel = strval(Value);
		if(isnull(Value)) return SysMsg(playerid, "Usage: /set [ID] drunk [0-50000]");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
		if(DLevel < 0 || DLevel > 50000) return SysMsg(playerid,"Invalid Drunk Level. (0-50000)");

		SetPlayerDrunkLevel(playa, DLevel);
		DrunkLevel[playerid] = DLevel;

		format(gstr, sizeof(gstr),"Admin %s has changed your drunkenness to %i",NameEx(playerid),DLevel);
		SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
		format(gstr, sizeof(gstr),"You set %s's drunkenness to %i",NameEx(playa),DLevel);
		SendClientMessage(playerid,COLOR_RED, gstr);
		format(gstr, sizeof(gstr), "Set drunk level to %i", DLevel);
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	}
	else if(strmatch("weaponskill", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

		new  skill = strval(Value2);
		if(strmatch("None", Value))
		{
			SysMsg(playerid,"Usage: /set [player id or name] weaponskill [weapon type/name] [skill level]");
			SysMsg(playerid,"Weapon Type: 0-9mm, 1-Silenced 9mm, 2-D.Eagle, 3-Shotgun, 4-Sawn-off, 5-SPAS, 6-Micro UZI");
			SysMsg(playerid,"Weapon Type: 7-MP5, 8-AK47, 9-M4, 10-Sniper, *11-ALL WEAPONS*");
			return true;
		}

		new wtype = -1;
		if(IsNumeric(Value))
		{
			if(strval(Value) < 0 || strval(Value) > 11) return SysMsg(playerid,"Invalid Gun Type.");
			wtype = strval(Value);
		}

		if(skill < 0 || skill > 10) return SysMsg(playerid,"Invalid Skill Level. (0 - 10)");

		MySQLUpdateInt(SQLID[playa], "WeaponSkill", skill, "players");

		if(wtype == 0 || strcmp("9mm",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_PISTOL, (skill * 100) - 10);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s set your 9mm Pistol skill to %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's 9mm Pistol skill to %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Set 9mm weapon skill to %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 1 || strcmp("silenced9mm",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_PISTOL_SILENCED, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s set your Silenced 9mm Pistol skill to %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's Silenced 9mm Pistol skill to %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Set silenced 9mm weapon skill to %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 2 || strcmp("deagle",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_DESERT_EAGLE, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s set your Desert Eagle skill to %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's Desert Eagle skill to %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Set d.eagles weapon skill to %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 3 || strcmp("Shotgun",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_SHOTGUN, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s set your Shotgun skill to %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's Shotgun skill to %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Set shotgun weapon skill to %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 4 || strcmp("sawnoff",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_SAWNOFF_SHOTGUN, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s set your Sawn-off Shotgun skill to %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's Sawn-off Shotgun skill to %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Set sawn-off weapon skill to %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 5 || strcmp("spas",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_SPAS12_SHOTGUN, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s set your SPAS12 skill to %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's SPAS12 skill to %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Set spas12 weapon skill to %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 6 || strcmp("uzi",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_MICRO_UZI, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s set your Micro UZI skill to %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's Micro UZI skill to %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Set micro UZI weapon skill to %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 7 || strcmp("mp5",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_MP5, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s set your MP5 skill to %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's MP5 skill to %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Set MP5 weapon skill to %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 8 || strcmp("ak47",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_AK47, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s set your AK-47 skill to %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's AK-47 skill to %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Set AK47 weapon skill to %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
			return true;
		}
		if(wtype == 9 || strcmp("M4",Value,true) == 0)
		{
			SetPlayerSkillLevel(playa, WEAPONSKILL_M4, (skill * 100) - 1);
			WeaponSkillLevel[playa] = skill;
			format(gstr, sizeof(gstr),"Admin %s set your M4 skill to %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
			format(gstr, sizeof(gstr),"You set %s's M4 skill to %i",NameEx(playa),(skill * 100) - 1);
			SendClientMessage(playerid,COLOR_RED, gstr);
			format(gstr, sizeof(gstr), "Set M4 weapon skill to %i", (skill * 100) - 1);
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
		if(wtype == 11 || strcmp("all",Value,true) == 0)
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
			SendClientMessageF(playa, COLOR_LIGHTGREEN,  "Admin %s set all you weapon skills to %i",NameEx(playerid),(skill * 100) - 1);
			SendClientMessageF(playerid,COLOR_RED, "You set all of %s's weapon skills to %i",NameEx(playa),(skill * 100) - 1);
			format(gstr, sizeof(gstr), "Set ALL weapon skill to %i", (skill * 100) - 1);
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		}
	}
	else if(strmatch("admin", option) || strmatch("adminlevel", option))
	{
		if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);

		if(isnull(Value)) SysMsg(playerid, "Usage: /set [Player ID or Full_Name] adminlevel [level 0-4]");
		if(IsPlayerConnected(playa) || !Logged{playa})
		{
			if(playa == playerid) return SysMsg(playerid, "Cannot be yourself.");

			if(strval(Value) < 0 || strval(Value) > 4) return SysMsg(playerid,"Admin level must be between 0 and 4.");

			AdminLevel[playa] = strval(Value);
			if(IsHelper{playa}) IsHelper{playa} = false;
			mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET AdminLevel = %i, Helper = %i WHERE id = %i", AdminLevel[playa], IsHelper{playa}, MasterAccount[playa]);
			mysql_pquery(conn, mquery);


			if(strval(Value) > AdminLevel[playa]) return PlaySoundForPlayer(playa, 31205);
			SendClientMessageF(playa,COLOR_LIGHTBLUE, "Admin %s has changed your admin level to %i.",NameEx(playerid),AdminLevel[playa]);
			SendClientMessageF(playerid,COLOR_RED, "You changed %s's admin level to %i.",NameEx(playa),AdminLevel[playa]);
			format(gstr, sizeof(gstr), "Set admin level to %i", strval(Value));
			AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
		}
		else if(strfind(pname, "_") != -1)
		{
			new sqlid = MySQLCheckMaster_AgainstName(pname);
			if(sqlid <= 1) return SysMsg(playerid, "Name was not found. Please include first name, last name and an underscore OR use there current ingame ID.");
			if(sqlid == SQLID[playerid]) return SysMsg(playerid, "Cannot be yourself.");

			if(strval(Value) < 0 || strval(Value) > 4) return SysMsg(playerid,"Admin level must be between 0 and 4.");

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET AdminLevel = %i, Helper = 0 WHERE id = %i", strval(Value), sqlid);
			mysql_pquery(conn, mquery);

			SendClientMessageF(playerid,COLOR_RED, "You changed %s's admin level to %i.",GetSQLName(sqlid),strval(Value));
			format(gstr, sizeof(gstr), "Set admin level to %i", strval(Value));
			AdminLog(playerid, sqlid, GetSQLName(sqlid), gstr);
		}
	}
	else return SysMsg(playerid, "You are not authorized to use this command or you have entered an invalid option.");
	return true;
}
CMD:recordbot(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	if(isnull(params)) return SysMsg(playerid,"Usage: /record [name *1 WORD*]");

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
CMD:object(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new option[24], modelid[24], purpose[64];
	if(sscanf(params, "s[24]S(-1)[24]S()[64]", option, modelid, purpose)) return SysMsg(playerid, "Usage: /object [spawn/destroy/goto/edit/view/export]");

	if(strmatch(option, "spawn"))
	{
		if(strval(modelid) == -1) return SysMsg(playerid, "Please enter a valid model ID.");
		if(!strlen(purpose)) return SysMsg(playerid, "Please enter a purpose for the object.");
		if(GetFreeTempObjectSlot() == -1) return SysMsg(playerid, "There are no free object slots at the moment.");
		if(IsValidModel(strval(modelid))) return SysMsg(playerid, "Invalid model ID.");

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

		format(gstr, sizeof(gstr), "Spawned temporary object. (%i)", strval(modelid));
		AdminLog(playerid, 0, "", gstr);
		return true;
	}
	else if(strmatch(option, "destroy"))
	{
		if(strval(modelid) == -1) return SysMsg(playerid, "Please enter a slot.");
		if(strval(modelid) < 0 || strval(modelid) > MAX_TEMPOBJECTS) return SysMsgF(playerid, "Object slot must be from 0-%i", MAX_TEMPOBJECTS);
		if(TempObjects[strval(modelid)][ObjectID] == INVALID_OBJECT_ID) return SysMsg(playerid, "No object found in this slot.");

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

		SendClientMessageF(playerid, COLOR_RED, "You have destroyed object %i.", slot);
		return true;
	}
	else if(strmatch(option, "goto"))
	{
		if(strval(modelid) == -1) return SysMsg(playerid, "Please enter a slot.");
		if(strval(modelid) < 0 || strval(modelid) > MAX_TEMPOBJECTS) return SysMsgF(playerid, "Object slot must be from 0-%i", MAX_TEMPOBJECTS);
		if(TempObjects[strval(modelid)][ObjectID] == INVALID_OBJECT_ID) return SysMsg(playerid, "No object found in this slot.");

		new slot = strval(modelid);
		SetPlayerPos(playerid, TempObjects[slot][ObjectPosX], TempObjects[slot][ObjectPosY], TempObjects[slot][ObjectPosZ] + 2);
		SetPlayerVirtualWorld(playerid, TempObjects[slot][ObjectVW]);
		SendClientMessageF(playerid, COLOR_RED, "You have teleported to object %i.", slot);
		return true;
	}
	else if(strmatch(option, "edit"))
	{
		if(strval(modelid) == -1) return SysMsg(playerid, "Please enter a slot.");
		if(strval(modelid) < 0 || strval(modelid) > MAX_TEMPOBJECTS) return SysMsgF(playerid, "Object slot must be from 0-%i", MAX_TEMPOBJECTS);
		if(TempObjects[strval(modelid)][ObjectID] == INVALID_OBJECT_ID) return SysMsg(playerid, "No object found in this slot.");

		new slot = strval(modelid);
		if(!IsPlayerInRangeOfPoint(playerid, 50.0, TempObjects[slot][ObjectPosX], TempObjects[slot][ObjectPosY], TempObjects[slot][ObjectPosZ])) return SysMsg(playerid, "You must be closer to the object to edit it.");

		EditingTempObject[playerid] = slot;
		EditDynamicObject(playerid, TempObjects[slot][ObjectID]);
	}
	else if(strmatch(option, "view"))
	{
		new bigstr[3000], count = 0;
		strcat(bigstr, "Slot\tModel\tPurpose\tSpawned By\n");
		for(new x = 0; x < MAX_TEMPOBJECTS; x++)
		{
			if(TempObjects[x][ObjectID] != INVALID_OBJECT_ID)
			{
				format(sgstr, sizeof(sgstr), "%i\t%i\t%s\t%s\n", x, TempObjects[x][ObjectModel], TempObjects[x][ObjectPurpose], GetSQLName(TempObjects[x][SpawnedBy]));
				strcat(bigstr, sgstr);
				count ++;
			}
		}
		if(count == 0) return SysMsg(playerid, "There are no objects spawned at the moment.");
		Dialog_Show(playerid, ObjectTeleport, DIALOG_STYLE_TABLIST_HEADERS, "Current Temporary Objects", bigstr, "Teleport", "Close");
	}
	else if(strmatch(option, "export"))
	{
		if(sscanf(params, "s[24]s[32]", option, modelid)) return SysMsg(playerid, "Usage: /object export [filename] *MUST INCLUDE .TXT*");

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
	if(sscanf(params, "u", playa)) return SysMsg(playerid, "Usage: /tagban [playerid or name] *THIS CANNOT BE REMOVED*");
	if(TagBanned{playa}) return SysMsg(playerid, "This user is already tag banned.");

	mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET TagBanned = 1 WHERE id = %i", MasterAccount[playa]);
	mysql_pquery(conn, mquery);

	TagBanned{playa} = true;
	SendClientMessageF(playerid, COLOR_RED, "[Admin] You have banned %s from using tag labels.", NameEx(playa));
	SendClientMessageF(playa, COLOR_RED, "Admin %s has banned you from using tag labels.", NameEx(playerid));
	return true;
}
CMD:tag(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(TagBanned{playerid}) return SysMsg(playerid, "You are banned from using this feature.");
	if(PlayerLevel[playerid] < 4 && !IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, "You must be at least level 4 to use this feature.");

	new option[24], value[150];
	if(sscanf(params, "s[24]S()[150]", option, value)) return SysMsg(playerid, "Usage: /tag [create/destroy/id/edit]");

	if(strcmp(option, "create", true) == 0)
	{
		if(isnull(value)) return SysMsg(playerid, "Usage: /tag create [description]");
		if(PlayerHasLabel(playerid) && !IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, "You've already created a descriptive tag. Please contact an admin to create more.");
		if(Dead{playerid}) return SysMsg(playerid, "You cannot used this feature while downed.");
		if(strlen(value) > 140) return SysMsg(playerid, "Your tag message is too long. Please shorten it.");

		new temptext[150];
		temptext = value;
		if(strlen(temptext) > 100) strins(temptext, "\n", 101);
		SetPVarString(playerid, "PendingLabelText", value);
		format(sgstr, sizeof(sgstr), "Are you sure you wish to create a tag with the following text?\n\n%s", temptext);
		Dialog_Show(playerid, LabelCreate, DIALOG_STYLE_MSGBOX, "Are you sure?", sgstr, "Yes", "No");
		return true;
	}
	else if(strcmp(option, "destroy", true) == 0)
	{
		if(!IsPlayerAdminLevelOK(playerid, 1))
		{
			for(new x = 0; x < MAX_LABELS; x++)
			{
				if(RPLabels[x][LabelOwner] == SQLID[playerid])
				{
					DestroyRPLabel(x);
					SendClientMessage(playerid, COLOR_RED, "You have removed your label.");
					return true;
				}
			}
			SysMsg(playerid, "Could not find a tag created by you.");
			return true;
		}
		if(isnull(value)) return SysMsg(playerid, "Usage: /tag destroy [tag id] *Use /tag id near a tag to get its ID.*");
		if(!IsNumeric(value)) return SysMsg(playerid, "Tag ID must be numeric.");

		new id = strval(value);
		if(id < 0 || id >= MAX_LABELS) return SysMsgF(playerid, "Value must be greater than 0 and less than %i.", MAX_LABELS);
		if(!RPLabels[id][LabelUsed]) return SysMsg(playerid, "This label ID is currently not in use.");

		DestroyRPLabel(id);
		SendClientMessageF(playerid, COLOR_RED, "You have removed label %i.", id);
		return true;
	}
	else if(strcmp(option, "id", true) == 0)
	{
		if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

		for(new x = 0; x < MAX_LABELS; x++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, RPLabels[x][LabelX], RPLabels[x][LabelY], RPLabels[x][LabelZ]))
			{
				SendClientMessageF(playerid, COLOR_RED, "This label is owned by %s and its label ID is %i.", GetSQLName(RPLabels[x][LabelOwner]), x);
				return true;
			}
		}
		SysMsg(playerid, "You are not near any labels.");
		return true;
	}
	else if(strcmp(option, "edit", true) == 0)
	{
		if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

		new value2[150];
		if(sscanf(params, "s[24]s[150]s[150]", option, value, value2))
		if(!IsNumeric(value)) return SysMsg(playerid, "Tag ID must be numeric.");
		if(strval(value) < 0 || strval(value) >= MAX_LABELS) return SysMsgF(playerid, "Value must be greater than 0 and less than %i.", MAX_LABELS);
		if(!RPLabels[strval(value)][LabelUsed]) return SysMsg(playerid, "That label ID is currently not in use.");
		if(strlen(value2) > 140) return SysMsg(playerid, "Your tag message is too long. Please shorten it.");

		new id = strval(value);
		UpdateDynamic3DTextLabelText(RPLabels[id][LabelID], COLOR_WHITE, value2);

		SendSplitMessageF(playerid, COLOR_RED, "You have updated the label text to '%s'", value2);
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
	if(x == -1) return SysMsg(playerid, "There are currently no label slots available.");

	GetPlayerPos(playerid,  RPLabels[x][LabelX], RPLabels[x][LabelY], RPLabels[x][LabelZ]);
	RPLabels[x][LabelID] = CreateDynamic3DTextLabel(text, COLOR_WHITE,  RPLabels[x][LabelX], RPLabels[x][LabelY], RPLabels[x][LabelZ], 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, GetPlayerVirtualWorld(playerid));
	RPLabels[x][LabelUsed] = true;
	RPLabels[x][LabelOwner] = SQLID[playerid];

	SendClientMessage(playerid, COLOR_WHITE, "You have successfully created a descriptive tag.");
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
	if(!Logged{playerid}) return SysMsg(playerid,"You must be logged in to use this feature.");

	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);
	if(!IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid,"You must be in a vehicle to re-spray.");

	new color1, color2;
	if(sscanf(params, "iI(-1)", color1, color2)) return SysMsg(playerid,"Usage: /spray [Primary color] [Optional: Secondary color]");
	if(color1 < 0 || color1 > 255) return SysMsg(playerid,"Primary color must be between 0 and 255.");

	if(color2 == -1) color2 = color1;
	else if(color2 < 0 || color2 > 255) return SysMsg(playerid,"Secondary color 2 must be between 0 and 255.");

	new v = GetPlayerVehicleID(playerid);
	if(v == INVALID_VEHICLE_ID) return SysMsg(playerid, "You are not in a vehicle.");

	if(FVehicleData[v][FVFaction] > 0)
	{
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE fveh SET Col1 = %i, Col2 = %i WHERE id = %i", color1, color2, FVehicleData[v][FVSQLID]);
		mysql_pquery(conn, mquery);

		FVehicleData[v][FVCol1] = color1;
		FVehicleData[v][FVCol2] = color2;

		ChangeVehicleColorEx(v, color1, color2);
		ShowInfoText(playerid,"~G~R~R~E~B~S~Y~P~P~R~W~A~G~Y",3000);

		SendClientMessageF(playerid, COLOR_WHITE, "Faction vehicle color changed to: %s(%i) & %s(%i)", VehicleColors[color1], color1, VehicleColors[color2], color2);
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

		SendClientMessageF(playerid, COLOR_WHITE, "Owned vehicle color changed to: %s(%i) & %s(%i)", VehicleColors[color1], color1, VehicleColors[color2], color2);
		return true;
	}
	else if(aspawned{v})
	{
		ChangeVehicleColorEx(v, color1, color2);
		SendClientMessageF(playerid, COLOR_WHITE, "Admin spawned vehicle color changed to: %s(%i) & %s(%i)", VehicleColors[color1], color1, VehicleColors[color2], color2);
		return true;
	}
	return true;
}
CMD:afix(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 3)) return SysMsg(playerid, AUTHMSG);

	new id;
	if(IsPlayerInAnyVehicle(playerid) && sscanf(params, "i", id)) id = GetPlayerVehicleID(playerid);
	else if(sscanf(params, "i", id)) return SysMsg(playerid, "Usage: /afix [vehicleid]");
	if(id > GetVehiclePoolSize()) return SysMsg(playerid, "No such vehicle.");

	VehicleBroke[id] = 0;
	FuelTypeAfterRefuel[id] = 0;
	PlayerPlaySound(playerid, SOUND_CAR_MOD, 0, 0, 0);
	RepairVehicleEx(id);
	format(gstr, sizeof(gstr), "[Admin] Admin %s has admin fixed an %s [ID %i].", NameEx(playerid), GetVehicleName(id), id);
	AdminBroadcast(gstr, 1, 4);
	return true;
}
CMD:acases(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new count = 0;
	SendClientMessage(playerid, COLOR_WHITE, "Currently Admin Jailed ");

	foreach(new i: Player)
	{
		if(Logged{i})
		{
			if(AdminJailData[i][0] == 1)
			{
				SendClientMessageF(playerid, COLOR_LIGHTBLUE, "%s (%i) - %i minute(s) remaining.", NameEx(i), i, AdminJailData[i][1]);
				count++;
			}
		}
	}

	if(count == 0) SendClientMessage(playerid, COLOR_LIGHTBLUE, "None");
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
	SendClientMessage(playerid, COLOR_LIGHTBLUE, "All stingers cleared.");
	return true;
}
CMD:removefires(playerid, params[])
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
		SendClientMessageF(playerid, COLOR_WHITE, "%i fires have been extinguished", count);
	}
	else SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:togengine(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new vehicleid, status[5];
	if(sscanf(params, "is[5]", vehicleid, status)) return SysMsg(playerid, "Usage: /togengine [vehicle ID] [on/off]");
	if(vehicleid == INVALID_VEHICLE_ID) return SysMsg(playerid, "Invalid vehicle.");

	if(strmatch(status, "on"))
	{
		SendClientMessageF(playerid, COLOR_RED, "You have enabled the engine of this %s (%i)", GetVehicleName(vehicleid), vehicleid);
		ToggleVehicleEngine(vehicleid, 1);
	}
	if(strmatch(status, "off"))
	{
		SendClientMessageF(playerid, COLOR_RED, "You have disable the engine of this %s (%i)", GetVehicleName(vehicleid), vehicleid);
		ToggleVehicleEngine(vehicleid, 0);
	}
	return true;
}
CMD:makehouse(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	if(GetFreeHouseArraySlot() == -1) return SysMsg(playerid, "No free house slots. (MAX_HOUSES reached)");

	new NewHouseCost, NewInsideID, Description[30];
	if(sscanf(params, "iis[30]", NewHouseCost, NewInsideID, Description)) return SysMsg(playerid,"Usage: /makehouse [cost] [inside option] [desc]");
	if(NewHouseCost < 1) return SysMsg(playerid,"Cost must be > 0");
	if(NewInsideID < 1 || NewInsideID > 29) return SysMsg(playerid,"No such InsideID.");

	mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO houses (Description,oPosX,oPosY,oPosZ) VALUES ('%e',%f,%f,%f)", Description, PlayerPosX(playerid), PlayerPosY(playerid), PlayerPosZ(playerid));
	mysql_pquery(conn, mquery, "InsertHouse", "ddds", playerid, NewHouseCost, NewInsideID, Description);
	return true;
}
CMD:makegarage(playerid, params[])
{
	new GarageType, GarageHouse, Float:pos[3], Float:angle;
	if(!IsPlayerAdminLevelOK(playerid, 4)) return SysMsg(playerid, AUTHMSG);
	if(sscanf(params, "iif", GarageType, GarageHouse, angle)) return SysMsg(playerid,"Usage: /makegarage [garage type] [house ID(use /checkid at house)] [vehicle exit angle]");

	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);

	mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO garages (HouseSQLID, GarageType, OutsideX, OutsideY, OutsideZ, InsideVW, OutsideVAngle) VALUES (%i, %i, %f, %f, %f, %i, %f)", GarageHouse, GarageType, pos[0], pos[1], pos[2], GarageHouse+60000, angle);
	mysql_pquery(conn, mquery, "InsertHouseGarage", "iiifffif", GarageHouse, GarageType, pos[0], pos[1], pos[2], GarageHouse+60000, angle);
	return true;
}
GREENSIDE::InsertHouseGarage(playerid, GarageHouse, GarageType, Float:x, Float:y, Float:z, VW, Float:angle)
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
	SysMsg(playerid, "Garage has been created.");
	return true;
}
GREENSIDE::InsertHouse(playerid, NewHouseCost, NewInsideID, Desc[])
{
	new houseID = cache_insert_id(), vw = houseID+20000;

	mysql_format(conn, mquery, sizeof(mquery), "UPDATE houses SET Price = %i, InsideID = %i, HouseVW = %i, OwnerSQLID = 0 WHERE id = %i", NewHouseCost, NewInsideID, vw, houseID);
	mysql_pquery(conn, mquery);

	mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM houses WHERE id = %i LIMIT 1", houseID);
	mysql_pquery(conn, mquery, "LoadHouses", "d", 1);

	format(gstr, sizeof(gstr), "Created house '%s' for $%i", Desc, NewHouseCost);
	AdminLog(playerid, 0, "", gstr);
	return true;
}
CMD:edithouse(playerid, params[])
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
	if(houseid == -1) return SysMsg(playerid,"You are not near any house.");

	new element[10], value[30];
	if(sscanf(params, "s[10]s[30]", element, value)) return SysMsg(playerid,"Usage: /edithouse [element] [value] Elements: Cost, Owner, InsideID, Name, Steamdist");

	if(strcmp("cost", element, true) == 0)
	{
		if(!IsNumeric(value)) return SysMsg(playerid,"Cost must be a number.");
		new NewHouseCost = strval(value);
		if(NewHouseCost < 1) return SysMsg(playerid,"Cost must be > 0");

		MySQLUpdateInt(HouseData[houseid][HouseSQLID], "Price", NewHouseCost, "houses");
		HouseData[houseid][HousePrice] = NewHouseCost;

		SysMsgF(playerid, "House Price Is Now $%i.", HouseData[houseid][HousePrice]);
		format(gstr, sizeof(gstr), "Edited house #%i price to $%i", HouseData[houseid][HouseSQLID], NewHouseCost);
		AdminLog(playerid, 0, "", gstr);
		return true;
	}
	else if(strcmp("insideid", element, true) == 0)
	{
		if(!IsNumeric(value)) return SysMsg(playerid,"Inside ID must be a number.");
		new NewInsideID = strval(value);
		if(NewInsideID < 1 || NewInsideID > 35) return SysMsg(playerid,"Invalid Inside ID.");
		if(NewInsideID == HouseData[houseid][HouseInterior]) return SysMsgF(playerid, "InsideID is already %i", NewInsideID);

		if(NewInsideID == 11)
		{
			new Float:X, Float:Y, Float:Z, houseint;
			if(sscanf(params, "s[10]ifffi", element, NewInsideID, X, Y, Z, houseint)) return SysMsg(playerid,"Usage: /edithouse InsideID 11 [x] [y] [z] [interior]");

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE houses SET intPosX = %f, intPosY = %f, intPosZ = %f, InsideID = 11, HouseInterior = %i WHERE id = %i", X, Y, Z, houseint, HouseData[houseid][HouseSQLID]);
			mysql_pquery(conn, mquery);

			HouseData[houseid][InsideID] = NewInsideID;
			HouseData[houseid][HouseInterior] = houseint;
			HouseData[houseid][intPosX] = X;
			HouseData[houseid][intPosY] = Y;
			HouseData[houseid][intPosZ] = Z;

			SysMsgF(playerid, "House Inside ID Is Now %i. [%f, %f, %f, interior %i]", HouseData[houseid][InsideID], X, Y, Z, houseint);
			return true;
		}

		mysql_format(conn, mquery, sizeof(mquery), "UPDATE houses SET intPosX = 0.0, intPosY = 0.0, intPosZ = 0.0, InsideID = %i WHERE id = %i", NewInsideID, HouseData[houseid][HouseSQLID]);
		mysql_pquery(conn, mquery);

		HouseData[houseid][InsideID] = NewInsideID;
		HouseData[houseid][intPosX] = 0.0;
		HouseData[houseid][intPosY] = 0.0;
		HouseData[houseid][intPosZ] = 0.0;

		SysMsgF(playerid, "House Inside ID Is Now %i.", HouseData[houseid][InsideID]);
		format(gstr, sizeof(gstr), "Edited house #%i inside ID to %i", houseid, NewInsideID);
		AdminLog(playerid, 0, "", gstr);
		return true;
	}
	else if(strcmp("owner", element, true) == 0)
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
			format(sgstr, sizeof(sgstr), "Edited house #%i owner to NONE", houseid);
			AdminLog(playerid, 0, "", sgstr);
			return true;
		}

		new accid = MySQLCheckAccount(value, playerid);
		if(accid == 0) return SysMsg(playerid, "No player account found.");

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
		SysMsgF(playerid, "House Owner Is Now %s.", GetSQLName(HouseData[houseid][HouseOwnerSQLID]));
		format(gstr, sizeof(gstr), "Edited house #%i owner to %s", GetSQLName(HouseData[houseid][HouseOwnerSQLID]));
		AdminLog(playerid, 0, "", gstr);
		return true;
	}
	else if(strcmp("name", element, true) == 0)
	{
		MySQLUpdateString(HouseData[houseid][HouseSQLID], "Description", value, "houses");
		format(HouseData[houseid][HouseDescription], 60, value);

		UpdateHouseLabel(houseid);

		SysMsgF(playerid, "House Name Is Now %s.", HouseData[houseid][HouseDescription]);
		format(gstr, sizeof(gstr), "Edited house #%i name to %s", HouseData[houseid][HouseSQLID], HouseData[houseid][HouseDescription]);
		AdminLog(playerid, 0, "", gstr);
		return true;
	}
	else if(strcmp("streamdist", element, true) == 0)
	{
		if(!IsNumeric(value)) return SysMsg(playerid, "Usage: /edithouse streamdist [value] *Must be numeric*");

		new distance = strval(value);
		if(distance > 25) return SysMsg(playerid, "Distance must be 25 or greater.");

		HouseData[houseid][ExtStreamDist] = float(distance);

		mysql_format(conn, mquery, sizeof(mquery), "UPDATE houses SET ExteriorStreamDistance = %f WHERE id = %i", float(distance), HouseData[houseid][HouseSQLID]);
		mysql_pquery(conn, mquery);

		SysMsgF(playerid, "House exterior furniture distance set to %i", distance);
		return true;
	}
	SysMsg(playerid,"*Usage: /edithouse [element] [value] Elements: Cost, Owner, InsideID, Name");
	return true;
}
CMD:editveh(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	if(!IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid, "You must be in a vehicle.");

	new vehicle = GetPlayerVehicleID(playerid), element[10], value[30];
	if(sscanf(params, "s[10]S()[30]", element, value)) return SysMsg(playerid,"Usage: /editveh [element] [value] Elements: Cost, Pos, Locked, Regplate");

	if(strcmp("cost", element, true) == 0)
	{
		if(vehicle == VehicleData[vehicle][IdVehicle])
		{
			if(isnull(value)) return SysMsg(playerid,"Usage: /editveh Cost [value]");
			if(!IsNumeric(value)) return SysMsg(playerid,"Cost must be a number.");
			new NewVehicleCost = strval(value);
			if(NewVehicleCost < 1) return SysMsg(playerid,"Cost must be > 0");

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE vehicles SET Price = %i WHERE id = %i", NewVehicleCost, VehicleData[vehicle][VehSQLID]);
			mysql_pquery(conn, mquery);

			VehicleData[vehicle][VehiclePrice] = NewVehicleCost;
			SysMsgF(playerid, "Vehicle price is now $%i.", VehicleData[vehicle][VehiclePrice]);
			return true;
		}
		return SysMsg(playerid,"You are not in any vehicle (owned).");
	}

	else if(strcmp("pos", element, true) == 0)
	{
		if(VehicleData[vehicle][IdVehicle] > 0) return SysMsg(playerid,"You are not in any vehicle (owned).");

		new Float:vPos[4];
		GetVehiclePos(vehicle, vPos[0], vPos[1], vPos[2]);
		GetVehicleZAngle(vehicle, vPos[3]);

		mysql_format(conn, mquery, sizeof(mquery), "UPDATE vehicles SET LastX = %f, LastY = %f, LastZ = %f, LastRot = %f WHERE id = %i", vPos[0], vPos[1], vPos[2], vPos[3], VehicleData[vehicle][VehSQLID]);
		mysql_pquery(conn, mquery);

		VehicleData[vehicle][LastX] = vPos[0];
		VehicleData[vehicle][LastY] = vPos[1];
		VehicleData[vehicle][LastZ] = vPos[2];
		VehicleData[vehicle][LastRot] = vPos[3];

		SysMsg(playerid, "Vehicle Position Updated.");
		return true;
	}

	else if(strcmp("regplate", element, true) == 0)
	{
		if(vehicle == 0) return SysMsg(playerid,"You are not in any vehicle.");

		if(vehicle == VehicleData[vehicle][IdVehicle])
		{
			if(isnull(value)) return SysMsg(playerid,"Usage: /editveh Regplate [plate]");
			if(strlen(value) > MAX_REG_PLATE-1) return SysMsg(playerid,"Regplate was too long.");

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE vehicles SET RegPlate = '%e' WHERE id = %i", value, VehicleData[vehicle][VehSQLID]);
			mysql_pquery(conn, mquery);

			format(VehicleData[vehicle][RegPlate], MAX_REG_PLATE, value);

			SysMsgF(playerid,"Vehicle reg plate is now '%s'.", VehicleData[vehicle][RegPlate]);
			return true;
		}
	}
	SysMsg(playerid,"*Usage: /editveh [element] [value] Elements: Cost, Pos, Locked, Delete, Regplate");
	return true;
}
CMD:reloadgates(playerid)
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	SendRconCommand("reloadfs Doors_And_Gates");
	SendClientMessage(playerid, COLOR_WHITE, "All gates and doors {44C300}reloaded.");
	return true;
}
CMD:reloadmaps(playerid)
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	SendRconCommand("reloadfs Maps");
	SendClientMessage(playerid, COLOR_WHITE, "All maps {44C300}reloaded.");
	return true;
}
CMD:reloadfactions(playerid, params[])
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
	SendClientMessage(playerid, COLOR_WHITE, "All Factions {44C300}reloaded.");
	AdminLog(playerid, 0, "", "Reloaded all factions from database");
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
	SendClientMessage(playerid, COLOR_WHITE, "All garages {44C300}reloaded.");
	return true;
}
CMD:reloadhouse(playerid, params[]) return cmd_reloadhouses(playerid, params);
CMD:reloadhouses(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	if(isnull(params)) return SysMsg(playerid, "Usage: /reloadhouse [all / house address]");

	if(strcmp(params, "all", true) == 0)
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
		SendClientMessage(playerid, COLOR_WHITE, "All houses {44C300}reloaded.");
		AdminLog(playerid, 0, "", "Reloaded all houses from database");
	}
	else
	{

		new h = GetHouseLocation(params), sql;
		if(h < 0 || h >= MAX_HOUSES) return SysMsg(playerid, "House is not valid.");

		SendClientMessageF(playerid,COLOR_WHITE, "%s (ID %i) {44C300}reloaded", HouseData[h][HouseDescription], HouseData[h][HouseSQLID]);

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
	SendClientMessage(playerid, COLOR_WHITE, "All interiors {44C300}reloaded.");
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
	SendClientMessage(playerid, COLOR_WHITE, "All pickups {44C300}reloaded.");
	return true;
}
CMD:reloadrentalcars(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	foreach(new i: Player)
	{
		if(RentalCar[i] >= 1) return SysMsg(playerid, "A player is currently renting a rental car. As such you cannot reload them.");
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
	SendClientMessage(playerid, COLOR_WHITE, "All rental vehicles {44C300}reloaded.");
	return true;
}
CMD:makerentalcar(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);
	if(!IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid, "You must be in a vehicle to use this command.");
	if(VehicleData[GetPlayerVehicleID(playerid)][VehSQLID] >= 1) return SysMsg(playerid, "You cannot make owned vehicles into rental cars.");
	if(FVehicleData[GetPlayerVehicleID(playerid)][FVSQLID] >= 1) return SysMsg(playerid, "You cannot make faction vehicles into rental cars.");

	new cost;
	if(sscanf(params, "i", cost)) return SysMsg(playerid, "Usage: /makerentalcar [cost] *Please ensure the vehicle is in the correct position and has the correct colors.*");

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
CMD:makeveh(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SysMsg(playerid, AUTHMSG);

	new vid;
	new NewVehCost, NewC1, NewC2, donator, ownerSQLID = -1, mileage, lastoiled;

	vid = GetPlayerVehicleID(playerid);
	if(!vid) return SysMsg(playerid,"You must be in a vehicle first.");

	if(sscanf(params, "iiiiiii", NewVehCost, NewC1, NewC2, donator, mileage, lastoiled, ownerSQLID)) return SysMsg(playerid,"Usage: /makeveh [cost] [col1] [col2] [donator 1/0] [mileage] [last oiled] [owner sqlid or 0]");
	if(NewVehCost < 1) return SysMsg(playerid,"Cost must be > 0");
	if(NewC1 < 0 || NewC1 > 255) return SysMsg(playerid,"Colors must be between 0-255");
	if(NewC2 < 0 || NewC2 > 255) return SysMsg(playerid,"Colors must be between 0-255");

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
	if(!vid) return SysMsg(playerid,"You must be in a vehicle first.");
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
	if(t == 0) return SysMsg(playerid, "This vehicle is not an approved faction vehicle.");

	if(model != AllowedFactionVehs[j][0]) return SysMsg(playerid, "This vehicle is not an approved faction vehicle.");
	if(sscanf(params, "iS(none)[12]", faction, confirm)) return SysMsg(playerid, "Usage: /cfv [Faction ID]");
	if(faction < 1 || faction > MAX_FACTIONS) return SysMsg(playerid,"Faction must be more than 0.");
	if(FACTIONS[faction][FactionId] == 0) return SysMsg(playerid, "Faction must be valid.");

	if(strmatch("none", confirm)) SendSplitMessageF(playerid, COLOR_LIGHTGREEN, "[CFV] Setting this %s into the faction %s [ID %i] will cost a total of $%s, type /cfv %i confirm to complete the transaction.", GetVehicleNameEx(AllowedFactionVehs[j][0]), GetFactionNameFromId(faction), faction, format_cash(AllowedFactionVehs[j][1]), faction);
	else if(strmatch("confirm", confirm))
	{
		if(model != AllowedFactionVehs[j][0]) return SysMsg(playerid, "This vehicle is not an approved faction vehicle.");
		if(Cash[playerid] < AllowedFactionVehs[j][1]) return SysMsg(playerid, "You don't have enough cash to perform this command.");

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

		SendClientMessageF(playerid, COLOR_LIGHTGREEN, "You have successfully set a %s into faction %s[ID %i] at the cost of $%s.", GetVehicleNameEx(AllowedFactionVehs[j][0]), GetFactionNameFromId(faction), faction, format_cash(AllowedFactionVehs[j][1]));

		format(sgstr, sizeof(sgstr), "Created f.veh for %s(fid %i), %s", GetFactionNameFromId(faction), faction, GetVehicleName(vid));
		AdminLog(playerid, 0, "", sgstr);
	}
	return true;
}
CMD:dfv(playerid)
{
	new hof;
	MySQLFetchInt(MasterAccount[playerid], "HoF", hof, "masters");
	if(!IsPlayerAdminLevelOK(playerid, 4) && hof != 1) return SysMsg(playerid, AUTHMSG);
	if(!IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid,"You must be in a vehicle first.");
	if(!IsFactionVehicle(GetPlayerVehicleID(playerid))) return SysMsg(playerid, "You must be in a faction vehicle.");

	new vid = GetPlayerVehicleID(playerid);
	mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM fveh WHERE id=%i LIMIT 1", FVehicleData[vid][FVSQLID]);
	mysql_pquery(conn, mquery);

	format(sgstr, sizeof(sgstr), "Deleted f.veh for %s(fid %i), %s", GetFactionNameFromId(FVehicleData[vid][FVFaction]), FVehicleData[vid][FVFaction], GetVehicleName(vid));
	AdminLog(playerid, 0, "", sgstr);

	ClearVehicleData(vid);
	DestroyVehicleEx(vid, "vid 1");

	SysMsgF(playerid, "Faction Vehicle ID %i has been deleted.", vid);
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
	ShowMessage(playerid, "Faction ID's", gstr, "OK");
	return true;
}
CMD:fedit(playerid, params[])
{
	new hof, header[64];
	MySQLFetchInt(MasterAccount[playerid], "HoF", hof, "masters");
	if(IsPlayerAdminLevelOK(playerid, 4)  || hof == 1)
	{
		if(isnull(params)) return SysMsg(playerid, "Usage: /fedit [Faction ID]");
		if(!IsNumeric(params)) return SysMsg(playerid, "Usage: /fedit [Faction ID]");
		if(strval(params) >= MAX_FACTIONS) return SysMsg(playerid, "Faction ID exceeds max factions.");
		if(FACTIONS[strval(params)][FactionId] == 0) return SysMsg(playerid, "Invalid faction.");
		new f = strval(params);

		new isgang[8], isactive[8];
		if(FACTIONS[f][FactionIsGang] == 1) format(isgang, 8, "YES");
		else format(isgang, 8, "NO");
		if(FACTIONS[f][FactionIsActive] == 1) format(isactive, 8, "YES");
		else format(isactive, 8, "NO");
		format(gstr, sizeof(gstr), "{FFFFFF}Edit Faction Name\nEdit Faction Abv. [Current: {D9D925}%s{FFFFFF}]\nEdit Uber Rank [Current: {D9D925}%s [%i]{ffffff}]\nEdit Leader Rank [Current: {D9D925}%s [%i]{FFFFFF}]\nEdit Leader [Current: {D9D925}%s{FFFFFF}]\nEdit Radio Freq [Current: {D9D925}%i MHz{FFFFFF}]\nIs Gang [{D9D925}%s{FFFFFF}]\nIs Active [{D9D925}%s{FFFFFF}]", FACTIONS[f][FNameShort],
			GetFactionRankName(f, FACTIONS[f][FactionUberLeaderRank]), FACTIONS[f][FactionUberLeaderRank], GetFactionRankName(f, FACTIONS[f][FactionLeaderRank]), FACTIONS[f][FactionLeaderRank], GetSQLName(FACTIONS[f][FactionLeader]), FACTIONS[f][FactionRadioChannel], isgang, isactive);

		SetPVarInt(playerid, "fEditf", f);
		format(header, sizeof(header), "Faction Edit Menu - %s [ID %i]", GetFactionNameFromId(f), f);
		Dialog_Show(playerid, FactionEditMenu, DIALOG_STYLE_LIST, header, gstr, "Select", "Cancel");
	}
	else return SysMsg(playerid, AUTHMSG);
	return true;
}
CMD:accuracy(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid, "Usage: /accuracy [playerid or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(ShotsFired[playa] == 0) return SysMsg(playerid, "This player hasn't fired any bullets.");

	SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Viewing the hit accuracy of {FFFFFF}%s!", NameEx(playa));
	SendClientMessageF(playerid, COLOR_WHITE, "Number of bullets fired in current session: %i. Number of bullets hit in current session: %i. Numbers of headshots in current session: %i.", ShotsFired[playa], ShotsHit[playa], HeadshotsHit[playa]);
	SendClientMessageF(playerid, COLOR_WHITE, "Total Hit Accuracy: %.2f. Headshot Percentage: %.2f", GetHitAccuracy(playa), GetHeadshotAccuracy(playa));
	return true;
}
CMD:actionlog(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new playa = -1, page;
	if(sscanf(params, "ui", playa, page)) return SysMsg(playerid, "Usage: /actionlog [playerid or name] [page 1 or 2]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(MasterAccount[playa] == 29469 && MasterAccount[playerid] == 19025) return SysMsg(playerid, "Nice try, buddy. Love, Emmalee");
	if(page != 1 && page != 2) return SysMsg(playerid, "Invalid page. Please enter 1 or 2.");

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

	if(!strlen(bigstring)) return SysMsg(playerid, "Could not find an action log for this player.");

	new sub[32];
	format(sub, 32, "Action log of %s", NameEx(playa));
	ShowMessage(playerid, sub, bigstring, "Neat!");
	return true;
}
CMD:ccash(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 2)) return SysMsg(playerid, AUTHMSG);

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /ccash [player id or name]");
	if(InvalidPlayer(playa)) return SysMsg(playerid,"That player is not connected.");
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(!Logged{playa}) return SysMsg(playerid,"That player is not logged in.");

	SendClientMessageF(playerid, COLOR_WHITE, "Financial Details For %s: Cash In Hand: $%s, Bank Balance: $%s",NameEx(playa), format_cash(Cash[playa]), format_cash(BankBalance[playa]));
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
		if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /skiphosp [playerid id or name]");
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
		if(sscanf(params, "u", playa)) return SysMsg(playerid,"Usage: /ip [player id or name]");
		if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);

		//SendClientMessageF(playerid, COLOR_WHITE, "IP Address: %s, Server Latency: %ims", PlayerIP[playa], GetPlayerPing(playa));

		SendClientMessageF(playerid, COLOR_WHITE, "IP Address: %s, Country: %s, Area: %s", PlayerIP[playa], GetPlayerCountryName(playa), GetPlayerCountryRegion(playa));
		SendClientMessageF(playerid, COLOR_WHITE, "Server Latency: %ims, ISP: %s", GetPlayerPing(playa), GetPlayerISP(playa));
	}
	return true;
} */
CMD:refundcash(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 4)) return false;

	new pname[MAX_PLAYER_NAME], playa = -1, amount, sqlid = -1;
	if(sscanf(params, "s[24]i", pname, amount)) return SysMsg(playerid,"Usage: /refundcash [player id OR Full_Name ONLY] [amount]");
	if(IsNumeric(pname))
	{
		if(!IsPlayerConnected(strval(pname)) || !Logged{strval(pname)}) return SysMsg(playerid, "Player ID was not connected and logged in.");
		playa = strval(pname);
		sqlid = SQLID[playa];
	}
	else
	{
		sqlid = MySQLCheckAccount(pname, playerid);
		if(sqlid <= 0) return SysMsg(playerid, "Name was not found. Please include first name, last name and an underscore OR use there current ingame ID.");
	}
	if(sqlid == -1) return SysMsg(playerid, "Name was not found. Please include first name, last name and an underscore OR use there current ingame ID.");
	if(sqlid == SQLID[playerid] && !IsPlayerAdmin(playerid)) return SysMsg(playerid, "Cannot be yourself.");

	if(amount < 1 || amount > 10000000) return SysMsg(playerid,"Amount must be more than 0 and 10,000,000 or less.");

	if(playa >= 0)
	{
		GivePlayerCash(playa, amount);
		MySQLUpdateInt(SQLID[playa], "Cash", Cash[playa], "players");

		format(gstr, sizeof(gstr),"Admin %s has refunded you $%s.", NameEx(playerid), format_cash(amount));
		SendClientMessage(playa, COLOR_LIGHTGREEN,  gstr);
		format(gstr, sizeof(gstr),"[Admin] %s has refunded %s $%s.", NameEx(playerid), NameEx(playa), format_cash(amount));
		AdminBroadcast(gstr, 0);

		format(gstr, sizeof(gstr),"[%s] Player %s(%i) has been refunded $%i from Admin %s(%i). (Total: $%i)", GetServerTimeString(), NameEx(playa), playa, amount, NameEx(playerid), playerid, Cash[playa]);

		format(gstr, sizeof(gstr), "Refund cash $%i", amount);
		AdminLog(playerid, SQLID[playa], GetName(playa), gstr);
	}
	else
	{
		foreach(new i: Player) if(sqlid == SQLID[i]) return SysMsg(playerid, "Full_Name cannot be an online player, use the player ID instead.");

		new tempval;
		MySQLFetchInt(sqlid, "Cash", tempval, "players");
		tempval += amount;
		MySQLUpdateInt(sqlid, "Cash", tempval, "players");

		format(gstr, sizeof(gstr),"[Admin] %s has refunded %s $%s.", NameEx(playerid), GetSQLName(sqlid), format_cash(amount));
		AdminBroadcast(gstr, 0);

		format(gstr, sizeof(gstr),"[%s] Offline player %s has been refunded $%i from Admin %s(%i). (Total: $%i)", GetServerTimeString(), GetSQLName(sqlid), amount, NameEx(playerid), playerid, tempval);

		format(gstr, sizeof(gstr), "Refund cash $%i", amount);
		AdminLog(playerid, sqlid, GetSQLName(sqlid), gstr);
	}

	return true;
}
CMD:delacc(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return false;

	new sqlid = -1;
	if(isnull(params)) return SysMsg(playerid,"Usage: /delacc [Full_Name ONLY] *Will delete an account*");
	sqlid = MySQLCheckAccount(params, playerid);
	if(sqlid <= 1) return SysMsg(playerid, "Name was not found. Please include first name, last name and an underscore.");
	if(sqlid == SQLID[playerid]) return SysMsg(playerid, "Cannot be yourself.");

	foreach(new p: Player)
	{
		if(sqlid == SQLID[p] && Logged{p})
		{
			SendClientMessageToAllF(COLOR_RED, "Admin %s has permanently deleted %s's account.", NameEx(playerid), NameEx(p));
			KickPlayer(p, 15);
		}
	}
	format(gstr, sizeof(gstr),"[Admin] %s has deleted the account '%s' from the database.", NameEx(playerid), GetSQLName(sqlid));
	AdminBroadcast(gstr, 0);
	format(gstr, sizeof(gstr), "Deleted account %s(SQLID %i)", GetSQLName(sqlid), sqlid);
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
			return SendClientMessageF(playerid, COLOR_OOC, "The ID of this boombox is ID %i.", p);
		}
	}
	SysMsg(playerid, "You are not near any boomboxes, move closer to the boombox and try again.");
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
CMD:ahide(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, CMDFMSG);

	AdminHidden[playerid] = !AdminHidden[playerid];

	if(ADuty[playerid] == 1)
	{
		ADuty[playerid] = 0;
		SetPlayerColor(playerid, 0xFFFFFF00);
		SysMsg(playerid,"Admin Duty has been turned off automatically.");

		if(UsingPaint{playerid}) cmd_paint(playerid);
	}

	if(AdminHidden[playerid]) SysMsg(playerid, "You are now hidden from /admins.");
	else SysMsg(playerid, "You are no longer hidden from /admins.");
	return true;
}
CMD:stranger(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);

	new stranger, playa = -1;
	if(sscanf(params, "i", stranger)) return SysMsg(playerid,"Usage: /stranger [stranger ID]");

	foreach(new i: Player)
	{
		if(Logged{i} && IsPlayerMasked{i} && MaskLabelNumber[i] == stranger)
		{
			playa = i;
			break;
		}
	}

	if(playa == -1) return SysMsg(playerid,"There are no players currently using that Stranger ID");

	SendClientMessageF(playerid,COLOR_YELLOW, "*Stranger %i(%s ID %i)", stranger, NameEx(playa), playa);
	return true;
}
CMD:report(playerid, params[])
{
	if(!Logged{playerid}) return true;

	new AdminCount = 0;
	foreach(new i: Player) if(IsPlayerAdminLevelOK(i, 1)) AdminCount ++;
	if(AdminCount == 0) return SysMsg(playerid, "Nobody is available to answer your report.");

	new playa = -1, reason[150], name[MAX_PLAYER_NAME];
	if(sscanf(params, "s[24]s[150]", name, reason))
	{
		SysMsg(playerid,"Usage: /report [player id or name] [reason *Max 50 Length*]");
		return SysMsg(playerid, "Reminder: This command is for reporting other players for breaking rules. Use /assistance if you have a question or require admin assistance.");
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
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(playa == playerid) return SysMsg(playerid,"You can't report yourself.");

	SendReport(playerid, playa, reason);

	foreach(new i: Player)
	{
		if(IsPlayerAdminLevelOK(i, 1))
		{
			SendSplitMessageF(i,COLOR_YELLOW,"* Report from %s(%i) about %s(%i): %s", NameEx(playerid), playerid, NameEx(playa), playa, reason);
		}
	}

	SendClientMessage(playerid, COLOR_ORANGE, "Report submitted to all online Admins to be reviewed. Use /cancelreport if you no longer need us.");
	return true;
}
CMD:cancelreport(playerid, params[])
{
	if(!Logged{playerid}) return true;

	new name[24], playa = -1;
	if(sscanf(params, "s[24]", name)) return SysMsg(playerid,"Usage: /cancelreport [player id or name]");
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
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"That player is a NPC.");
	if(playa == playerid) return SysMsg(playerid,"You can't report yourself.");

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
	if(reportcancelled == 0) SendClientMessage(playerid, COLOR_ORANGE, "Could not find a report on that player.");
	else SendClientMessageF(playerid, COLOR_ORANGE, "You have cancelled your report on %s.", NameRP(playa));
	return true;
}
CMD:joinevent(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(EventOpen == 0) return SysMsg(playerid,"There is no event taking place.");
	if(IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid,"You can't join in a vehicle.");
	if(LastEventPos[playerid][0] != -1.0) return SysMsg(playerid,"You are already in the event.");

	GetPlayerPos(playerid, LastEventPos[playerid][0], LastEventPos[playerid][1], LastEventPos[playerid][2]);
	LastEventIDs[playerid][0] = GetPlayerInterior(playerid);
	LastEventIDs[playerid][1] = GetPlayerVirtualWorld(playerid);

	SetPlayerPos(playerid, EventData[EventX], EventData[EventY], EventData[EventZ]);
	SetPlayerInterior(playerid, EventData[EventInterior]);
	SetPlayerVirtualWorldEx(playerid, EventData[EventVW]);

	format(gstr, sizeof(gstr), "You have joined the event: %s. Use /ExitEvent to quit from it.", EventData[EventName]);
	SendClientMessage(playerid, COLOR_ORANGE, gstr);
	UnlockAchievement(playerid, 67);
	return true;
}
CMD:exitevent(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(IsPlayerInAnyVehicle(playerid)) return SysMsg(playerid,"You can't exit in a vehicle.");
	if(LastEventPos[playerid][0] == -1.0) return SysMsg(playerid,"You are not in an event.");

	SetPlayerPos(playerid, LastEventPos[playerid][0], LastEventPos[playerid][1], LastEventPos[playerid][2]);
	SetPlayerInterior(playerid, LastEventIDs[playerid][0]);
	SetPlayerVirtualWorldEx(playerid, LastEventIDs[playerid][1]);

	LastEventPos[playerid][0] = -1.0;
	LastEventPos[playerid][1] = -1.0;
	LastEventPos[playerid][2] = -1.0;
	LastEventIDs[playerid][0] = 0;
	LastEventIDs[playerid][1] = 0;

	SendClientMessage(playerid, COLOR_ORANGE, "You have quit the event.");
	return true;
}