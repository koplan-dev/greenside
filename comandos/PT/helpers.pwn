//Comando para Helpers
CMD:solicitaradmin(playerid, params[])
{
	if(!IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);
	if(IsAssisting[playerid] == -1) return SysMsg(playerid, "Você está atualmente lidando com um pedido de assistência.");
	if(RequestingAdmin[playerid] != -1) return SysMsg(playerid, "Você já tem uma solicitação do administrador ativa.");
	SysMsg(playerid, "Por favor, seja paciente ou /cancelra para cancelar a solicitação.");

	new reason[128];
	if(sscanf(params, "s[128]", reason)) return SendClientMessage(playerid, COLOR_WHITE, "Use: /solicitaradmin [Detalhe do pedido]");

	new as[8];
	format(gstr, sizeof(gstr), "* Helper %s [ID:%i] Está solicitando assistência para ajudar um player, [Detalhes: %s]. Use /acceptra para aceitar.", NameEx(playerid), playerid, reason);
	AdminBroadcast(gstr, 1);
	format(gstr, sizeof(gstr), "Helper %s solicitou que um administrador ingressasse na sessão. Seja paciente e aguarde.", NameEx(playerid));
	SendAssistChat(playerid, gstr);
	SendClientMessage(playerid, COLOR_YELLOW, "O seu pedido foi enviado. Seja paciente e espere um administrador estar disponível.");
	RequestingAdmin[playerid] = gettime();
	NeedsAssistance[playerid] = -1;
	ARCount++;
	format(as, 8, "%i!", ARCount);
	TextDrawSetString(AdminRequestTD, as);
	format(AssistanceMsg[playerid], 180, reason);
	return true;
}
CMD:ajudar(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);
	if(NeedsAssistance[playerid] != -1) return SysMsg(playerid, "Você tem um pedido de assistência pendente.");
	if(IsAssisting[playerid] >= 0 || BeingAssistedBy[playerid] >= 0) return SysMsg(playerid, "Você está atualmente em uma assistência.");
	SysMsg(playerid, "Por favor use /fassistencia(Para finalizar) antes de usar esse comando.");

	new playa = -1;
	if(sscanf(params, "u", playa)) return SysMsg(playerid,"Use: /ajudar [ID ou nome do jogador]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(NeedsAssistance[playa] == -1) return SysMsg(playerid,"Esse jogador não precisa de assistência.");
	if(playa == playerid) return SysMsg(playerid,"Você não pode usar este comando em si mesmo.");

	new tmp, hr = 0, mins = 0, timeago[17];

	tmp = gettime() - NeedsAssistance[playa];

	StringReplace(AssistanceMsg[playa], "'", "''");
	mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO assists (`AssistBy`, `AssistedBy`, `RequestedAdmin`, `AssistReason`, `AssistLength`, `AssistTimeWaiting`, `AssistEndedBy`, `AssistEndReason`) VALUES (%i, %i, 0, '%e', 0, %i, 0, ' ')", MasterAccount[playa], MasterAccount[playerid], AssistanceMsg[playa], tmp);
	new Cache:result = mysql_query(conn, mquery);
	AssistTableID[playerid] = cache_insert_id();
	cache_delete(result);

	while(tmp > 3600)
	{
		hr++;
		tmp -= 3600;
	}
	while(tmp > 60)
	{
		mins++;
		tmp -= 60;
	}

	if(hr > 0) format(timeago, sizeof(timeago), "%i hr e %i min", hr, mins);
	else if(mins > 0 && hr == 0) format(timeago, sizeof(timeago), "%i min", mins);
	else format(timeago, sizeof(timeago), "%i sec", tmp);

	format(gstr, sizeof(gstr), "[Assistente] %s agora está ajudando %s(%i) depois de esperar %s.", NameEx(playerid), NameEx(playa), playa, timeago);
	AdminBroadcast(gstr, 1);
	HelperBroadcast(gstr);
	if(IsPlayerAdminLevelOK(playerid, 1)) SendClientMessageF(playa, COLOR_YELLOW, "* Admin %s agora está ajudando você, depois de esperar %s. Por favor, use: /ac para discutir seu problema, se necessário.", NameEx(playerid), timeago);
	else if(IsHelper{playerid}) SendClientMessageF(playa, COLOR_YELLOW, "* Helper %s agora está ajudando você, depois de esperar %s. Por favor, use: /ac para discutir seu problema, se necessário.", NameEx(playerid), timeago);
	SendSplitMessageF(playerid, COLOR_YELLOW, "* Agora você está dando assistência a %s(ID %i) com: '%s'", NameEx(playa), playa, AssistanceMsg[playa]);

	IsAssisting[playerid] = playa;
	BeingAssistedBy[playa] = playerid;
	NeedsAssistance[playa] = -1;
	AssistanceMsg[playa][0] = EOS;

	if(AdminLevel[playa] == 0)
	{
		if(AdminLevel[playerid] > 0 || IsHelper{playerid})
		{
			mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET AssistCount = AssistCount + 1, AdminScore = AdminScore + 1 WHERE id = %i", MasterAccount[playerid]);
			mysql_pquery(conn, mquery);
		}
	}

	AdminLog(playerid, SQLID[playa], GetName(playa), "Inicia sessão de assistência");
	return true;
}
CMD:assists(playerid)
{
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);
	new count = 0, queue[MAX_PLAYERS][2];

	gstr[0] = EOS;
	foreach(new i: Player)
	{
		if(NeedsAssistance[i] > 0)
		{
			queue[count][0] = NeedsAssistance[i];
			queue[count][1] = i;
			count ++;
		}
		else if(RequestingAdmin[i] > 1 && IsPlayerAdminLevelOK(playerid, 1))
		{
			queue[count][0] = RequestingAdmin[i];
			queue[count][1] = i;
			count++;
		}
	}

	if(count == 0) return SendClientMessage(playerid, COLOR_WHITE, "Ninguém precisa de assistência neste momento.");

	SortDeepArray(queue, 0);

	new assist[64], hr = 0, mins = 0, tmp, timeago[14], a;

	format(assist, sizeof(assist), "ACP - Todos os pedidos ativos ({00FF00}%i{ffffff}):", count);

	count = 0;
	for(a = 0; a < MAX_PLAYERS; a++)
	{
		if(queue[a][0] > 0)
		{
			tmp = gettime() - queue[a][0];
			hr = 0;
			mins = 0;
			count ++;

			while(tmp > 3600)
			{
				hr++;
				tmp -= 3600;
			}
			while(tmp > 60)
			{
				mins++;
				tmp -= 60;
			}

			if(hr > 0) format(timeago, sizeof(timeago), "%i hr e %i min", hr, mins);
			else if(mins > 0 && hr == 0) format(timeago, sizeof(timeago), "%i min", mins);
			else format(timeago, sizeof(timeago), "%i sec", tmp);

			new thstndrd[3];
			switch(count)
			{
				case 1,21,31,41,51,61,71,81,91,101: thstndrd = "";//st
				case 2,22,32,42,52,62,72,82,92,102: thstndrd = "";//nd
				case 3,23,33,43,53,63,73,83,93,103: thstndrd = "";//rd
				default: thstndrd = "";//th
			}
			new msg[64];
			strmid(msg, AssistanceMsg[queue[a][1]], 0, 64);

			if(RequestingAdmin[queue[a][1]] > 1) format(sgstr, sizeof(sgstr), "{FF0000}%i%s (%s atrás): %s(ID %i) '%s'\n", count, thstndrd, timeago, NameEx(queue[a][1]), queue[a][1], msg);
			else format(sgstr, sizeof(sgstr), "{FBFF00}%i%s (%s atrás): %s(ID %i) '%s'\n", count, thstndrd, timeago, NameEx(queue[a][1]), queue[a][1], msg);
			strcat(gstr, sgstr);
		}
	}
	Dialog_Show(playerid, AssistList, DIALOG_STYLE_LIST, assist, gstr, "Info", "Fechar");
	return true;
}
CMD:fassistencia(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);
	if(IsAssisting[playerid] == -1) return SysMsg(playerid,"Você não está ajudando ninguém.");

	if(IsHelper{playerid} && BeingAssistedBy[playerid] != -1)
	{
		format(sgstr, sizeof(sgstr), "{00D0FF}O Helper %s(%i) saiu. Admin %s está agora a prestar assistência exclusiva.", NameEx(playerid), playerid, NameEx(BeingAssistedBy[playerid]));
		SendAssistChat(playerid, sgstr);
		BeingAssistedBy[IsAssisting[playerid]] = BeingAssistedBy[playerid];
		BeingAssistedBy[BeingAssistedBy[playerid]] = -1;
		IsAssisting[IsAssisting[playerid]] = -1;
		BeingAssistedBy[playerid] = -1;
		IsAssisting[playerid] = -1;
		AssistTableID[playerid] = -1;
		RequestingAdmin[playerid] = -1;
	}
	else if(IsPlayerAdminLevelOK(playerid, 1) && BeingAssistedBy[playerid] != -1)
	{
		format(sgstr, sizeof(sgstr), "{00D0FF}Admin %s(%i) saiu. Helper %s está agora a prestar assistência exclusiva.", NameEx(playerid), playerid, NameEx(BeingAssistedBy[playerid]));
		SendAssistChat(playerid, sgstr);
		BeingAssistedBy[IsAssisting[playerid]] = BeingAssistedBy[playerid];
		BeingAssistedBy[BeingAssistedBy[playerid]] = -1;
		IsAssisting[IsAssisting[playerid]] = -1;
		BeingAssistedBy[playerid] = -1;
		IsAssisting[playerid] = -1;
		AssistTableID[playerid] = -1;
		RequestingAdmin[playerid] = -1;
	}
	else Dialog_Show(playerid, AssistEnd, DIALOG_STYLE_LIST, "Finalizar assistência", "O jogador foi atendido\nFalsa assistência\nAssistência não mais necessária\nJogador AFK\nJogador não responde\nNão pode ajudar o jogador", "Finalizar", "Cancelar");
	return true;
}
CMD:toghmsg(playerid, params[])
{
	if(!IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);
	HelperMsgTog[playerid] = !HelperMsgTog[playerid];

	if(HelperMsgTog[playerid]) SendClientMessage(playerid, COLOR_LIGHTGREEN, "Helper mensagens ativadas.");
	else SendClientMessage(playerid, COLOR_LIGHTGREEN, "Helper  mensagens desativadas.");

	return true;
}
CMD:assist(playerid, params[])
{
	if(!Logged{playerid}) return true;

	new AdminCount = 0;
	foreach(new i: Player) if(IsPlayerAdminLevelOK(i, 1) || IsHelper{i}) AdminCount ++;
	if(AdminCount == 0) return SendClientMessage(playerid,COLOR_ORANGE,"Ninguém está disponível para responder sua solicitação de assistência.");
	if(NeedsAssistance[playerid] != -1) return SendClientMessage(playerid,COLOR_ORANGE,"Você já solicitou assistência, por favor /cancelarassistencia.");
	if(IsAssisting[playerid] >= 0 || BeingAssistedBy[playerid] >= 0) return SendClientMessage(playerid, COLOR_ORANGE, "Você já está recebendo assistência. Peça ao ajudante para terminar a sessão primeiro.");

	Dialog_Show(playerid, AssistCreate, DIALOG_STYLE_INPUT, "Solicitando Assistência", "Por favor, diga-nos por que você precisa de assistência:", "Enviar", "Cancelar");
	return true;
}
CMD:cancelarassistencia(playerid, params[])
{
	if(NeedsAssistance[playerid] == -1) return SysMsg(playerid,"Você não está solicitando assistência.");

	NeedsAssistance[playerid] = -1;
	AssistanceMsg[playerid][0] = EOS;

	SendClientMessage(playerid, COLOR_WHITE, "Sua solicitação de assistência foi cancelada.");

	foreach(new i: Player)
	{
		if(IsHelper{i} || IsPlayerAdminLevelOK(i, 1) && AdminMsgToggle{i})
		{
			SendClientMessageF(i, COLOR_RED, "* %s(ID %i) cancelou sua assistência", NameEx(playerid), playerid);
		}
	}
	return true;
}
CMD:ac(playerid, params[])
{
	if(IsAssisting[playerid] >= 0 || BeingAssistedBy[playerid] >= 0)
	{
		if(isnull(params)) return SysMsg(playerid,"Use: Chat de assistência: /ac [mensagem]");

		if(IsPlayerAdminLevelOK(playerid, 1)) format(gstr, sizeof(gstr), "[AC] Admin %s(%i): %s", NameEx(playerid), playerid, params);
		else if(IsHelper{playerid}) format(gstr, sizeof(gstr), "[AC] Helper %s(%i): %s", NameEx(playerid), playerid, params);
		else format(gstr, sizeof(gstr), "[AC] %s(%i): %s", NameEx(playerid), playerid, params);

		SendAssistChat(playerid, gstr);
		return true;
	}
	SysMsg(playerid, "Você não está ajudando ou está sendo assistido.");
	return true;
}
CMD:acceptra(playerid, params[])
{
	if(!IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, AUTHMSG);
	if(IsAssisting[playerid] != -1) return SysMsg(playerid, "Você já está atendendo um pedido de assistência.");
	SysMsg(playerid, "Por favor, use: /fassistencia(Para finalizar) para deixar a sessão atual.");

	new id;
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_WHITE, "Use: /aceitarajudante [parte do nome / ID]");
	if(InvalidPlayer(id)) return SysMsg(playerid, NOPLAYER);
	if(!IsHelper{id}) return SysMsg(playerid, "Esse jogador não é um ajudante registrado.");
	if(RequestingAdmin[id] == -1) return SysMsg(playerid, "Esse ajudante não pediu ajuda.");

	MySQLUpdateInt(AssistTableID[id], "RequestedAdmin", MasterAccount[playerid], "assists");
	MySQLUpdateString(AssistTableID[id], "RAReason", AssistanceMsg[id], "assists");

	AssistTableID[playerid] = AssistTableID[id];
	BeingAssistedBy[playerid] = id;
	RequestingAdmin[id] = -1;
	IsAssisting[playerid] = IsAssisting[id];
	BeingAssistedBy[id] = playerid;
	IsAssisting[IsAssisting[id]] = playerid;
	format(gstr, sizeof(gstr), "{00D0FF}Admin %s[ID:%i] entrou no chat de assistência. Por favor, use: /ac para se comunicar.", NameRP(playerid), playerid);
	SendAssistChat(playerid, gstr);
	format(gstr, sizeof(gstr), "[Admin] Admin %s[ID %i] aceitou a solicitação de assitência do helper %s[ID %i].", NameEx(playerid), playerid, NameEx(id), id);
	AdminBroadcast(gstr, 1);
	mysql_format(conn, mquery, sizeof(mquery), "UPDATE masters SET AssistCount = AssistCount + 1, AdminScore = AdminScore + 1 WHERE id = %i", MasterAccount[playerid]);
	mysql_pquery(conn, mquery);
	return true;
}
CMD:toghc(playerid)
{
	if(!Logged{playerid}) return true;
	if(GlobalHelperChatTog) return SysMsg(playerid, "Este bate-papo foi desativado globalmente.");
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);

	HelperTog{playerid} = !HelperTog{playerid};
	SendClientMessage(playerid, COLOR_LIGHTGREEN, (HelperTog{playerid}) ? ("Helper chat agora está desativado para você.") : ("Helper chat agora está habilitado para você."));
	return true;
}
CMD:hc(playerid, params[])
{
	if(GlobalHelperChatTog && !IsPlayerAdminLevelOK(playerid, 1)) return SysMsg(playerid, "Este bate-papo está desativado globalmente.");
	if(HelperTog{playerid}) return SysMsg(playerid, "Você atualmente possui este bate-papo desativado.");
	if(isnull(params)) return SysMsg(playerid, "Use: Helper Chat: /hc [mensagem]");
	if(!IsPlayerAdminLevelOK(playerid, 1) && !IsHelper{playerid}) return SysMsg(playerid, AUTHMSG);

	foreach(new i: Player)
	{
		if(IsPlayerAdminLevelOK(i, 1) || IsHelper{i})
		{
			if(HelperTog{i}) continue;

			if(AdminLevel[playerid] != 0) SendSplitMessageF(i, COLOR_LIGHTGREEN, "[Helper] Admin %s: %s", NameEx(playerid), params);
			else SendSplitMessageF(i, COLOR_LIGHTGREEN, "[Helper] Helper %s: %s", NameEx(playerid), params);
		}
	}
	/* if(AdminLevel[playerid] != 0) IRC_SayF(IRCBot, IRC_ADMIN_CHANNEL, "9[Helper] Admin %s: %s", NameEx(playerid), params);
	else IRC_SayF(IRCBot, IRC_ADMIN_CHANNEL, "9[Helper] Helper %s: %s", NameEx(playerid), params); */
	return true;
}
CMD:confirmnome(playerid, params[])
{
	gstr[0] = EOS;
	if(IsPlayerAdminLevelOK(playerid, 1) || IsHelper{playerid})
	{
		foreach(new i: Player)
		{
			if(WantsNameChange[i][0] == 1)
			{
				format(gstr, sizeof(gstr), "%s{FFFFFF}%s(%i) está pedindo para alterar o nome para %s\n",gstr, NameEx(i), i, RPName(NameChange[i]));
			}
		}
		if(strlen(gstr) >= 10) Dialog_Show(playerid, NameChange1, DIALOG_STYLE_LIST, "Confirmação de troca de nomes", gstr, "Selecionar", "Fechar");
		else Dialog_Show(playerid, NameChange1, DIALOG_STYLE_LIST, "Confirma troca de nome", "\n\t{FFFFFF}Sem fundos necessários", "Selecionar", "Fechar");
	}
	return true;
}
//fim dos comandos de Helper