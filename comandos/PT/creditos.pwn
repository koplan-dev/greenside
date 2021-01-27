
CMD:credits(playerid)
{
	if(!Logged{playerid}) return true;

	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_LIGHTRED, "Greenside Roleplay");
	SendClientMessage(playerid, COLOR_WHITE, "Owner: Revolts");
	SendClientMessage(playerid, COLOR_WHITE, "Game Developer: JohnBlack, Struth, Koplan");
	SendClientMessage(playerid, COLOR_WHITE, "Web Developer: Rafanel2, Marcy");
	SendClientMessage(playerid, COLOR_WHITE, "Mapper: Ri$ing ");
	return true;
}

CMD:updates(playerid)
{
	if(!Logged{playerid}) return true;

	new changelog[3200];

/*	strcat(changelog, "{FF0000}2.3.11 R1 - 1 de junho de 2017{FFFFFF}\n");
	strcat(changelog, "/cinfo agora mostra o sinal do telefone.\n");
	strcat(changelog, "Adicionado um atraso de inicialização do mecanismo de helicopters/planes.\n");
	strcat(changelog, "Veículos pessoais com janelas abaixadas podem ser aberto por qualquer um.\n");
	strcat(changelog, "Tipo de combustível contido no galão, pode ser visualizado com /inventario.\n");
	strcat(changelog, "Mudou o interior do armazém para um espaço em branco com apenas um objeto de parede na entrada. Isso permitirá aos usuários adicionar pisos de baixo para suas casas e etc..\n");
	strcat(changelog, "Corrigido um erro em que determinados mods de veículos não puderam ser removidos com /removemods.\n");
	strcat(changelog, "Corrigido um erro onde /stopguestfurnish salvaria valores incorretos.\n");
	strcat(changelog, "Corrigido um erro no qual o cancelamento do reposicionamento de um objeto de vestuário não reaplicaria sua cor se alguém fosse designado.\n");
	strcat(changelog, "Fixed a bug where incorrect businesses were marked as 'Mall' businesses.\n");
	strcat(changelog, "Fixed some issues where the pizza vehicles could be put into repair garages, causing them to be removed permanently.\n");
	strcat(changelog, "Fixed a handful of issues with the impound system.\n");
	strcat(changelog, "Fixed a bug where being put in jail could send you to prison after a relog.\n");
	strcat(changelog, "Fixed bugs that prevented the engine oil alert textdraw from appearing.\n");
	strcat(changelog, "Fixed /resetvest once more.\n\n");*/

	strcat(changelog, "{FF0000}2.3.11 - 12 de Dezembro 2017{FFFFFF}\n");
	strcat(changelog, "O histórico de SMS do telefone mostrará agora uma lista de números que os jogadores enviaram/receberam textos.\n");
	strcat(changelog, "Se adicionou paginação às listas de histórico de SMS e modificou a lista ligeiramente.\n");
	strcat(changelog, "O acesso ao furniture convidados não desaparece depois de efetuar logoff e agora deve ser revogado manualmente.\n");
	strcat(changelog, "Contactos telefónicos refeitos internamente e aumentou o limite de contactos com base no nível doador.\n");
	strcat(changelog, "Executar um jogador derrubado agora requer um tiro na cabeça em vez de dois.\n");
	strcat(changelog, "Os apartamentos não aparecerão mais na lista de propriedades não possuídas.\n");
	strcat(changelog, "Porta-malas agora podem ser usados em motos com espaço de armazenamento de armas muito limitado.\n");
	strcat(changelog, "Corrigido um erro onde os táxis poderiam ser chamados de dentro, dando balizas incorretas.\n");
	strcat(changelog, "Corrigido um erro onde as coletes que poderiam desaparecer depois de se reconectar.\n");
	strcat(changelog, "Corrigido um erro onde as sign de táxi poderia ficar preso em veículos.\n");
	strcat(changelog, "Corrigido um erro em que o temporizador do veículo de sucata não terminaria quando um jogador desconectado, ocasionando o exterminio incorretas do veículo.\n");
	strcat(changelog, "Corrigido mais erros com o sistema de Marijuana.\n\n");

	ShowMessage(playerid, "Ultimas atualizações", changelog, "Fechar!");
	return true;
}
