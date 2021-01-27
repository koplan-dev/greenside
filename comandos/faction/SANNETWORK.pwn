CMD:news(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_NEWS) return SysMsg(playerid,"Você deve ser membro da News Corp.");
	if(Duty[playerid] == 0) return SysMsg(playerid,"Você deve estar de serviço para usar isso.");
	if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você deve ser pelo menos o ranking 2 to use this.");

	if(isnull(params)) return SysMsg(playerid,"Use: /news [mensagem]");

	NewsToggle{playerid} = true;

	foreach(new i: Player)
	{
		if(Logged{i} && NewsToggle{i})
		{
			SendSplitMessageF(i, COLOR_PINK, "[NEWS] %s %s: %s", GetFactionRankName(Faction[playerid], FactionRank[playerid]), NameEx(playerid), params);
		}
	}

	return true;
}
CMD:checkweather(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_NEWS) return SysMsg(playerid,"Você deve ser membro da News Corp.");
	if(Duty[playerid] == 0) return SysMsg(playerid,"Você deve estar de serviço para usar isso.");

	SendClientMessageF(playerid, COLOR_WHITE, "[Previão do tempo] Atual: %s, Esperado: %s", GetWeatherName(gServerWeather), GetWeatherName(gServerUpcomingWeather));
	return true;
}
CMD:interview(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_NEWS) return SysMsg(playerid,"Você deve ser membro da News Corp.");
	if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você deve ser pelo menos o ranking 2 para usar isso.");
	if(Duty[playerid] == 0) return SysMsg(playerid,"Você deve estar de serviço para usar isso.");
	if(Interviewer != -1) return SysMsg(playerid,"Já existe uma entrevista.");

	new playa = -1, showname[20];
	if(sscanf(params, "us[20]", playa, showname)) return SysMsg(playerid,"Use: /entrevista [player id ou nome] [mostrar nome]");
	if(InvalidPlayer(playa)) return SysMsg(playerid, NOPLAYER);
	if(IsPlayerNPC(playa)) return SysMsg(playerid,"Esse jogador é um NPC.");
	if(playa == playerid) return SysMsg(playerid,"Você não pode entrevistar-se.");

	InterviewPlayer = playa;
	Interviewer = playerid;
	format(InterviewName, 20, showname);

	SendClientMessageF(InterviewPlayer, COLOR_WHITE, "%s começou uma entrevista com você. Use '/ichat' para entrar no ar!", NameEx(Interviewer));
	SendClientMessageF(Interviewer, COLOR_WHITE, "Você começou uma entrevista com %s. Use '/ichat' para conversar durante uma entrevista!", NameEx(InterviewPlayer));
	return true;
}
CMD:ichat(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(InterviewPlayer != playerid && Interviewer != playerid) return SysMsg(playerid,"Você não está em uma entrevista.");

	if(isnull(params)) return SysMsg(playerid,"Use: /ichat [mensagem]");

	NewsToggle{playerid} = true;

	if(InterviewPlayer == playerid)
	{
		foreach(new i: Player)
		{
			if(Logged{i} && NewsToggle{i})
			{
				SendSplitMessageF(i, COLOR_PINK, "[ENTREVISTA DE NOTÍCIAS] %s %s: %s", InterviewName, NameEx(playerid), params);
			}
		}
	}
	else if(Interviewer == playerid)
	{
		foreach(new i: Player)
		{
			if(Logged{i} && NewsToggle{i})
			{
				SendSplitMessageF(i, COLOR_PINK, "[ENTREVISTA DE NOTÍCIAS] Hospedeiro %s: %s", NameEx(playerid), params);
			}
		}
	}
	return true;
}
CMD:endinterview(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_NEWS) return SysMsg(playerid,"Você deve ser membro da News Corp.");
	if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você deve ser pelo menos o ranking 2 to use this.");
	if(Duty[playerid] == 0) return SysMsg(playerid,"Você deve estar de serviço para usar isso.");
	if(Interviewer == -1) return SysMsg(playerid,"Não há entrevista.");
	if(Interviewer != playerid) return SysMsg(playerid,"Você não é o anfitrião da entrevista.");

	format(gstr, sizeof(gstr),"A entrevista foi encerrada por %s.", NameEx(Interviewer));
	SendClientMessage(InterviewPlayer,COLOR_WHITE,gstr);
	format(gstr, sizeof(gstr),"Você encerrou a entrevista com %s.", NameEx(InterviewPlayer));
	SendClientMessage(Interviewer,COLOR_WHITE,gstr);

	InterviewPlayer = -1;
	Interviewer = -1;
	InterviewName[0] = 0;
	return true;
}
CMD:starttalkshow(playerid)
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_NEWS) return SysMsg(playerid,"Você deve ser membro da News Corp.");
	if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você deve ser pelo menos o ranking 2 to use this.");
	if(Duty[playerid] == 0) return SysMsg(playerid,"Você deve estar de serviço para usar isso.");
	if(TalkshowHost != -1) return SysMsg(playerid,"Já existe um programa de entrevistas ao vivo.");

	TalkshowHost = playerid;
	SendClientMessage(TalkshowHost, COLOR_WHITE, "Você iniciou um programa de entrevistas. Use /tchat para falar no ar!");
	foreach(new i: Player) if(Logged{i} && Faction[i] == FACTION_NEWS && i != playerid)  SendClientMessageF(i, COLOR_PINK, "[TALKSHOW ALERTA] %s começou um programa de entrevistas.", NameEx(playerid));
	return true;
}
CMD:endtalkshow(playerid)
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_NEWS) return SysMsg(playerid,"Você deve ser membro da News Corp.");
	if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você deve ser pelo menos o ranking 2 to use this.");
	if(Duty[playerid] == 0) return SysMsg(playerid,"Você deve estar de serviço para usar isso.");
	if(TalkshowHost == -1) return SysMsg(playerid, "Não há talk shows ao vivo no momento.");

	TalkshowHost = -1;
	TalkshowPlayer = -1;
	for(new x = 0; x < sizeof(TalkshowCallers); x++) TalkshowCallers[x] = -1;

	SendClientMessage(playerid, COLOR_PINK, "Você encerrou o programa de entrevistas.");
	foreach(new i: Player) if(Logged{i} && Faction[i] == FACTION_NEWS && i != playerid)  SendClientMessageF(i, COLOR_PINK, "[TALKSHOW ALERTA] %s terminou seu programa de entrevistas.", NameEx(playerid));
	return true;
}
CMD:callers(playerid)
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_NEWS) return SysMsg(playerid,"Você deve ser membro da News Corp.");
	if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você deve ser pelo menos o ranking 2 to use this.");
	if(Duty[playerid] == 0) return SysMsg(playerid,"Você deve estar de serviço para usar isso.");
	if(TalkshowHost == -1) return SysMsg(playerid, "Não há talk shows ao vivo no momento.");

	new playa, callers = 0;
	for(new x = 0; x < sizeof(TalkshowCallers); x++)
	{
		if(TalkshowCallers[x] != -1)
		{
			playa = TalkshowCallers[x];
			callers ++;

			SendClientMessageF(playerid, COLOR_PINK, "Chamador %i: %s [PN: %i]", callers, PhoneData[playa][pOwnerName], PhoneData[playa][pNumber]);
		}
	}
	return true;
}
CMD:aceitarchamado(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_NEWS) return SysMsg(playerid,"Você deve ser membro da News Corp.");
	if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você deve ser pelo menos o ranking 2 to use this.");
	if(Duty[playerid] == 0) return SysMsg(playerid,"Você deve estar de serviço para usar isso.");
	if(TalkshowHost == -1) return SysMsg(playerid, "Não há talk shows ao vivo no momento.");

	new callernumber;
	if(sscanf(params, "i", callernumber)) return SysMsg(playerid, "Use: /aceitarchamado [Chamador do ID /chamarers]");
	if(callernumber < 0 && callernumber > sizeof(TalkshowCallers)) return SysMsgF(playerid, "Chamador ID deve ser maior que 0 e menos de %i", sizeof(TalkshowCallers));
	if(TalkshowCallers[callernumber - 1] == -1) return SendClientMessageF(playerid, COLOR_PINK, "Não há ninguém na linha %i", callernumber + 1);

	TalkshowPlayer = TalkshowCallers[callernumber - 1];
	SendClientMessageF(TalkshowPlayer, COLOR_PINK, "Você está agora ao vivo em um talk show com %s. Use /tchat para falar.", NameEx(playerid));
	SendClientMessageF(playerid, COLOR_PINK, "%s agora está em live no talk show.", NameEx(TalkshowPlayer));
	return true;
}
CMD:finalizarchamada(playerid)
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_NEWS) return SysMsg(playerid,"Você deve ser membro da News Corp.");
	if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você deve ser pelo menos o ranking 2 to use this.");
	if(Duty[playerid] == 0) return SysMsg(playerid,"Você deve estar de serviço para usar isso.");
	if(TalkshowHost == -1) return SysMsg(playerid, "Não há talk shows ao vivo no momento.");
	if(TalkshowPlayer == -1) return SysMsg(playerid, "Atualmente, você não está em uma chamada com alguém.");

	SendClientMessage(TalkshowPlayer, COLOR_PINK, "Sua conexão com SAN foi fechada.");
	SendClientMessageF(TalkshowHost, COLOR_PINK, "Você encerrou a chamada com %s", NameEx(TalkshowPlayer));

	TalkshowPlayer = -1;
	return true;
}
CMD:denycaller(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_NEWS) return SysMsg(playerid,"Você deve ser membro da News Corp.");
	if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você deve ser pelo menos o ranking 2 to use this.");
	if(Duty[playerid] == 0) return SysMsg(playerid,"Você deve estar de serviço para usar isso.");
	if(TalkshowHost == -1) return SysMsg(playerid, "Não há shows de entrevistas ao vivo no momento.");

	new callernumber;
	if(sscanf(params, "i", callernumber)) return SysMsg(playerid, "Use: /aceitarchamado [Chamador do ID /chamarers]");
	if(callernumber < 0 && callernumber > sizeof(TalkshowCallers)) return SysMsgF(playerid, "Chamador ID deve ser maior que 0 e menos de %i", sizeof(TalkshowCallers));
	if(TalkshowCallers[callernumber - 1] == -1) return SendClientMessageF(playerid, COLOR_PINK, "Não há ninguém online %i", callernumber + 1);

	SendClientMessageF(playerid, COLOR_PINK, "Você negou a chamada de %s.", NameEx(TalkshowCallers[callernumber - 1]));
	TalkshowCallers[callernumber - 1] = -1;
	return true;
}
CMD:toglines(playerid)
{
	if(!Logged{playerid}) return true;
	if(Faction[playerid] != FACTION_NEWS) return SysMsg(playerid,"Você deve ser membro da News Corp.");
	if(FactionRank[playerid] < 2) return SysMsg(playerid,"Você deve ser pelo menos o ranking 2 to use this.");
	if(Duty[playerid] == 0) return SysMsg(playerid,"Você deve estar de serviço para usar isso.");
	if(TalkshowHost == -1) return SysMsg(playerid, "Não há talk shows ao vivo no momento.");

	SANCallers = !SANCallers;
	if(SANCallers) SendClientMessage(playerid, COLOR_PINK, "Você abriu as linhas de chamadas da SAN.");
	else SendClientMessage(playerid, COLOR_PINK, "Você fechou as linhas de chamadas da SAN.");
	return true;
}
CMD:tchat(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(TalkshowPlayer != playerid && TalkshowHost != playerid) return SysMsg(playerid, "Você não está em um programa de entrevistas.");
	if(isnull(params)) return SysMsg(playerid, "Use: /tchat [mensagem]");

	NewsToggle{playerid} = true;

	foreach(new i: Player)
	{
		if(Logged{i} && NewsToggle{i})
		{
			if(TalkshowHost == playerid) SendSplitMessageF(i, COLOR_PINK, "[TALK SHOW] Hospedeiro %s: %s", NameEx(playerid), params);
			else if(TalkshowPlayer == playerid) SendSplitMessageF(i, COLOR_PINK, "[TALK SHOW] Chamador %s: %s", NameEx(playerid), params);
		}
	}
	return true;
}