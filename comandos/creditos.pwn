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
