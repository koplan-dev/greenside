//Comandos de comprar drogas
CMD:comprardrogas(playerid, params[])//buydrug
{
	if(!Logged{playerid}) return true;
	if(Job[playerid] != JOB_DRUGDEALER) return SysMsg(playerid,"Você não é um Revendedor de Drogas.");

	new drugAmount;

	if(IsPlayerInRangeOfPoint(playerid,3.0,206.74,-102.57,4.89)) //Cocaine Point
	{
		if(sscanf(params, "i", drugAmount)) return SysMsgF(playerid, "Use: Cocaine: /comprardrogas [quantidade (gramas)]  Preço: $%i por grama", DRUG_PRICE_COCAINE);
		if(drugAmount < 1 || drugAmount > DRUG_MAX_COCAINE) return SysMsgF(playerid, "Quantidade Inválida. Você só pode obter de 1 - %i gramas de Cocaina.", DRUG_MAX_COCAINE);
		if(Inventory[playerid][Cocaine] + drugAmount > DRUG_MAX_COCAINE) return SysMsgF(playerid, "Quantidade Inválida.");  
		SysMsgF(playerid, "Você não pode pegar tanta droga.");
		SysMsgF(playerid, "Você pode pegar no máximo %i gramas.", DRUG_MAX_COCAINE - Inventory[playerid][Cocaine]);

		new drugValue = drugAmount * DRUG_PRICE_COCAINE;
		if(Cash[playerid] < drugValue) return SysMsgF(playerid, "Você não tem dinheiro suficiente para a Cocaína. Isso custa $%i para %i gramas.", drugValue, drugAmount);

		Inventory[playerid][Cocaine] += drugAmount;
		GivePlayerCash(playerid, -drugValue);
		MySQLUpdateInt(SQLID[playerid], "Cocaine", Inventory[playerid][Cocaine], "players");

		format(gstr, sizeof(gstr),"* The door near %s opens slightly... *", NameRP(playerid));//traduzir
		ProxDetector(7.0,playerid,gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
		format(gstr, sizeof(gstr),"* %s tira um pequeno pacote de dentro da porta. *",NameRP(playerid));
		ProxDetector(7.0,playerid,gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
		format(gstr, sizeof(gstr), "Você recebeu %i gramas de cocaina da distribuidora de drogas por $%i.", drugAmount, drugValue);
		SendClientMessage(playerid, COLOR_WHITE, gstr);
		format(gstr, sizeof(gstr),"* The door near %s is now closed. *", NameRP(playerid));//traduzir
		ProxDetector(7.0,playerid,gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
		return true;
	}

	else if(IsPlayerInRangeOfPoint(playerid,3.0,-753.07,-131.56,65.82) || IsPlayerInRangeOfPoint(playerid,3.0,-416.35,-1760.50,5.77)) //MoonShine Point 1
	{
		if(sscanf(params, "i", drugAmount)) return SysMsgF(playerid, "Use: Moonshine: /comprardrogas [quantidade (litros)]  Preço: $%i por litros.", DRUG_PRICE_MOONSHINE);
		if(drugAmount < 1 || drugAmount > DRUG_MAX_MOONSHINE) return SysMsgF(playerid, "Quantidade Inválida. Você só pode obter 1 - %i litros de MoonShine.", DRUG_MAX_MOONSHINE);
		if(Inventory[playerid][MoonShine] + drugAmount > DRUG_MAX_MOONSHINE) return SysMsgF(playerid, "Quantidade Inválida. Você não pode carregar essa quantidade de MoonShine. Máximo de %i litros.", DRUG_MAX_MOONSHINE - Inventory[playerid][MoonShine]);

		new drugValue = drugAmount * DRUG_PRICE_MOONSHINE;
		if(Cash[playerid] < drugValue) return SysMsgF(playerid, "Você não tem dinheiro suficiente para MoonShine. Isso custa $%i por %i litros.", drugValue, drugAmount);

		Inventory[playerid][MoonShine] += drugAmount;
		GivePlayerCash(playerid, -drugValue);
		MySQLUpdateInt(SQLID[playerid], "MoonShine", Inventory[playerid][MoonShine], "players");

		format(gstr, sizeof(gstr),"* %s pega um pacote do revendedor. *",NameRP(playerid));
		ProxDetector(7.0,playerid,gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
		format(gstr, sizeof(gstr), "Você recebeu %i litros de MoonShine do revendedor custando $%i.", drugAmount, drugValue);
		SendClientMessage(playerid, COLOR_WHITE, gstr);
		return true;
	}
	return true;
}
CMD:usadrogas(playerid, params[])
{
	if(!Logged{playerid}) return true;

	new drug[10], method[10];
	if(sscanf(params, "s[10]S()[10]", drug, method)) return SysMsg(playerid,"Use: /usadrogas [tipo de droga] - Tipos: Marijuana, Moonshine, Cocaina");

	if(strcmp("marijuana", drug, true) == 0)
	{
		if(DrugSpamTimer[playerid] > 0) return SysMsg(playerid,"Você já está drogado.");
		if(Inventory[playerid][Weed] == 0) return SysMsg(playerid,"Você não tem Marijuana.");
		if(Inventory[playerid][Lighter] <= 0) return SysMsg(playerid,"Você precisa de um isqueiro para acender o cigarro de Marijuana.");

		if(sscanf(params, "s[10]s[10]", drug, method)) return SysMsg(playerid,"Use: /usadrogas Marijuana [método: Junta/Bong]");

		if(strcmp("junta", method, true) == 0)
		{
			if(Inventory[playerid][RollingPaper] == 0) return SysMsg(playerid,"Você não tem rolo de papel.");

			if(Inventory[playerid][Weed] > 1) Inventory[playerid][Weed] -= 2;
			else Inventory[playerid][Weed] --;

			Inventory[playerid][Lighter] --;
			Inventory[playerid][RollingPaper] --;

			mysql_format(conn, mquery, sizeof(mquery), "UPDATE players SET RollingPaper = %i, HasLighter = %i, Weed = %i WHERE id = %i", Inventory[playerid][RollingPaper], Inventory[playerid][Lighter], Inventory[playerid][Weed], SQLID[playerid]);
			mysql_pquery(conn, mquery);

			DrugSpamTimer[playerid] = 30;
			DrunkLevel[playerid] = 10000;
			SetPlayerDrunkLevel(playerid, 10000);

			TextDrawShowForPlayer(playerid, WeedEffect);

			new Float:Health;
			GetPlayerHealth(playerid, Health);
			if(Health + 15.0 > 100.0) SetPlayerHealthEx(playerid, 100.0);
			else SetPlayerHealthEx(playerid, Health + 15.0);

			if(!IsPlayerInAnyVehicle(playerid))
			{
				LoopingAnim(playerid,"SMOKING","M_smk_out", 4.0, 1, 0, 0, 0, 0);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
			}

			format(gstr, sizeof(gstr),"* %s rola um baseado, coloca na boca e acende. *",NameRP(playerid));
			ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
			format(gstr, sizeof(gstr), "Você fumou uma maconha. Você tem %i gramas restantes. Você ganhou um impulso de saúde.", Inventory[playerid][Weed]);
			SendClientMessage(playerid, COLOR_WHITE, gstr);
		}
		else if(strcmp("bong", method, true) == 0)
		{
			if(Inventory[playerid][Bong] == 0) return SysMsg(playerid,"Você não tem Bong.");

			if(Inventory[playerid][Weed] > 1) Inventory[playerid][Weed] -= 2;
			else Inventory[playerid][Weed] --;

			Inventory[playerid][Lighter] --;
			MySQLUpdateInt(SQLID[playerid], "HasLighter", Inventory[playerid][Lighter], "players");
			MySQLUpdateInt(SQLID[playerid], "Weed", Inventory[playerid][Weed], "players");

			DrugSpamTimer[playerid] = 30;
			DrunkLevel[playerid] = 10000;
			SetPlayerDrunkLevel(playerid, 10000);

			TextDrawShowForPlayer(playerid, WeedEffect);

			new Float:Health;
			GetPlayerHealth(playerid, Health);
			if(Health + 20.0 > 100.0) SetPlayerHealthEx(playerid, 100.0);
			else SetPlayerHealthEx(playerid, Health + 20.0);

			if(!IsPlayerInAnyVehicle(playerid))
			{
				LoopingAnim(playerid,"SMOKING","M_smk_in", 3.0, 1, 0, 0, 0, 0);
			}

			format(gstr, sizeof(gstr),"* %s pega um bong e fuma maconha. *",NameRP(playerid));
			ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);

			if(random(100) < 5)
			{
				format(gstr, sizeof(gstr),"* %s gets carried away with the weed and accidentally drops their bong, it smashes. *",NameRP(playerid));//traduzir
				ProxDetector(20.0, playerid, gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
				Inventory[playerid][Bong] = 0;
				MySQLUpdateInt(SQLID[playerid], "Bong", Inventory[playerid][Bong], "players");
			}

			format(gstr, sizeof(gstr), "Você fumou alguma erva daninha. Você tem %i gramas restantes. Você ganhou um grande impulso de saúde.", Inventory[playerid][Weed]);
			SendClientMessage(playerid, COLOR_WHITE, gstr);
		}
		return true;
	}
	else if(strcmp("Cocaina", drug, true) == 0)
	{
		if(DrugSpamTimer[playerid] > 0) return SysMsg(playerid,"Você já está drogado.");
		if(Inventory[playerid][Cocaine] == 0) return SysMsg(playerid,"Você não tem cocaína.");

		Inventory[playerid][Cocaine] -= 1;
		MySQLUpdateInt(SQLID[playerid], "Cocaine", Inventory[playerid][Cocaine], "players");
		DrugSpamTimer[playerid] = 30;
		DrunkLevel[playerid] = 10000;
		SetPlayerDrunkLevel(playerid, 10000);
		SetPlayerWeather(playerid, 9);

		new Float:Armour;
		GetPlayerArmour(playerid, Armour);
		if(Armour >= 50.0) return SysMsg(playerid,"((Você não receberá colete adicional quando seu colete for 50 ou superior.))");
		else if(Armour + 25.0 >= 49.0) SetPlayerArmourEx(playerid, 50, 0);
		else SetPlayerArmourEx(playerid, Armour + 25.0, 0);

		if(!IsPlayerInAnyVehicle(playerid)) OnePlayAnim(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);

		format(gstr, sizeof(gstr),"* %s alinha um punhado de cocaína em seu dedo, e rapidamente xeira todo o pó. *",NameRP(playerid));
		ProxDetector(7.0,playerid,gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
		format(gstr, sizeof(gstr), "Você inalou 1 grama de cocaína. Você tem %i gramas restantes, seu colete foi aumentado.", Inventory[playerid][Cocaine]);
		SendClientMessage(playerid, COLOR_WHITE, gstr);
		return true;
	}
	else if(strcmp("MoonShine", drug, true) == 0)
	{
		if(DrugSpamTimer[playerid] > 0) return SysMsg(playerid,"Você já está drogado.");
		if(Inventory[playerid][MoonShine] == 0) return SysMsg(playerid,"Você não tem MoonShine.");

		Inventory[playerid][MoonShine] -= 1;
		MySQLUpdateInt(SQLID[playerid], "MoonShine", Inventory[playerid][MoonShine], "players");
		DrugSpamTimer[playerid] = 20;
		DrunkLevel[playerid] += 16000;
		SetPlayerDrunkLevel(playerid, GetPlayerDrunkLevel(playerid) + 16000);

		new Float:Health;
		GetPlayerHealth(playerid, Health);
		if(Health + 40.0 > 100.0) SetPlayerHealthEx(playerid, 100.0);
		else SetPlayerHealthEx(playerid, Health + 40.0);

		if(!IsPlayerInAnyVehicle(playerid))
		{
			OnePlayAnim(playerid, "VENDING", "VEND_Drink_P", 3.5, 1, 0, 0, 0, 0);
		}

		format(gstr, sizeof(gstr),"* %s pega uma garrafa de Moonshine e bebe. *",NameRP(playerid));
		ProxDetector(7.0,playerid,gstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);
		format(gstr, sizeof(gstr), "Você bebeu 1 litro de MoonShine. Agora você tem %i litros. Você obteve um enorme impulso de saúde, mas está muito bêbado.", Inventory[playerid][MoonShine]);
		SendClientMessage(playerid, COLOR_WHITE, gstr);
		return true;
	}

	return true;
}

CMD:createdrugs(playerid, params[]) //drug comment //parei aqui
{
	if(!Logged{playerid}) return true;
	if(InValidDrugLoc(playerid))
	{
		CreatingDrugs[playerid][0] = 1;
		SelectObject(playerid);
	}
	return true;
}

CMD:checkdrugs(playerid, params[])
{
	if(!Logged{playerid}) return true;
	if(InValidDrugLoc(playerid))
	{
		SelectObject(playerid);
	}
	return true;
}

CMD:usedrugnew(playerid, params[])
{
	if(!Logged{playerid}) return true;

	mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM drugs WHERE drugOwner = %d AND drugAmount > 0 AND drugOwnerType = 'P' LIMIT 20", SQLID[playerid]);
	mysql_pquery(conn, mquery, "ShowPlayerDrugs", "ii", playerid, 0);
	return true;
}

CMD:myingredients(playerid, params[])
{
	if(!Logged{playerid}) return true;

	mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM ingredients WHERE ingOwner = %d AND ingOwnerType = 'P' LIMIT 20", SQLID[playerid]);
	mysql_pquery(conn, mquery, "ShowIngredients", "ii", playerid, 0);
	return true;
}

RCRP::ShowPlayerDrugs(playerid, offset)
{
	format(gstr, sizeof(gstr), "Drug Name\tAmount\n");
	DrugSelectionOffset[playerid] = offset;
	for(new r = 0; r < cache_get_row_count(conn); r++)
	{
		new dName[32];
		cache_get_field_content(r, "drugName", dName, conn);
		format(gstr, sizeof(gstr), "%s%s\t%d\n", gstr, dName, cache_get_field_content_int(r, "drugAmount"));
	}
	if(cache_get_row_count(conn) == 20) strcat(gstr, "Next Page >>\n");
	if(offset >= 1) strcat(gstr, "<< Previous Page");
	if(strmatch(gstr, "Drug Name\tAmount\n")) strcat(gstr, "No drugs to display.");
	Dialog_Show(playerid, ShowPlayerDrugs, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Your drugs", gstr, "Selecionar", "Fechar");
	return true;
}

RCRP::ShowCombineDrugs(playerid, offset)
{
	format(gstr, sizeof(gstr), "Drug Name\tAmount\n");
	DrugSelectionOffset[playerid] = offset;
	for(new r = 0; r < cache_get_row_count(conn); r++)
	{
		new dName[32];
		cache_get_field_content(r, "drugName", dName, conn);
		format(gstr, sizeof(gstr), "%s%s\t%d\n", gstr, dName, cache_get_field_content_int(r, "drugAmount"));
	}
	if(cache_get_row_count(conn) == 20) strcat(gstr, "Next Page >>\n");
	if(offset >= 1) strcat(gstr, "<< Previous Page");
	if(strmatch(gstr, "Drug Name\tAmount\n")) strcat(gstr, "No drugs to display.");
	Dialog_Show(playerid, ShowCombineDrugs, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Your drugs", gstr, "Selecionar", "Fechar");
	return true;
}

RCRP::ShowIngredients(playerid, offset)
{
	format(gstr, sizeof(gstr), "Ingredient Name\tAmount\n");
	DrugSelectionOffset[playerid] = offset;
	for(new r = 0; r < cache_get_row_count(conn); r++)
	{
		format(gstr, sizeof(gstr), "%s%s\t%d\n", gstr, IngredName[cache_get_field_content_int(r, "ingType")], cache_get_field_content_int(r, "ingAmount"));
	}
	if(cache_get_row_count(conn) == 20) strcat(gstr, "Next Page >>\n");
	if(offset >= 1) strcat(gstr, "<< Previous Page");
	if(strmatch(gstr, "Ingredient Name\tAmount\n")) strcat(gstr, "No ingredients to display.");
	Dialog_Show(playerid, ShowIngredients, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Your ingredients", gstr, "Selecionar", "Fechar");
	return true;
}
RCRP::GivePlayerDrugs(playerid, offset)
{
	format(gstr, sizeof(gstr), "Drug Name\tAmount\n");
	DrugSelectionOffset[playerid] = offset;
	for(new r = 0; r < cache_get_row_count(conn); r++)
	{
		new dName[32];
		cache_get_field_content(r, "drugName", dName, conn);
		format(gstr, sizeof(gstr), "%s%s\t%d\n", gstr, dName, cache_get_field_content_int(r, "drugAmount"));
	}
	if(cache_get_row_count(conn) == 20) strcat(gstr, "Next Page >>\n");
	if(offset >= 1) strcat(gstr, "<< Previous Page");
	if(strmatch(gstr, "Drug Name\tAmount\n")) strcat(gstr, "No drugs to display.");
	Dialog_Show(playerid, GivePlayerDrugs, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Your drugs", gstr, "Selecionar", "Fechar");
	return true;
}
RCRP::GivePlayerIngreds(playerid, offset)
{
	format(gstr, sizeof(gstr), "Ingredient Name\tAmount\n");
	DrugSelectionOffset[playerid] = offset;
	for(new r = 0; r < cache_get_row_count(conn); r++)
	{
		format(gstr, sizeof(gstr), "%s%s\t%d\n", gstr, IngredName[cache_get_field_content_int(r, "ingType")], cache_get_field_content_int(r, "ingAmount"));
	}
	if(cache_get_row_count(conn) == 20) strcat(gstr, "Next Page >>\n");
	if(offset >= 1) strcat(gstr, "<< Previous Page");
	if(strmatch(gstr, "Ingredient Name\tAmount\n")) strcat(gstr, "No ingredients to display.");
	Dialog_Show(playerid, GivePlayerIngreds, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Your ingredients", gstr, "Selecionar", "Fechar");
	return true;
}

RCRP::GivePlayerDrug(playerid, drugAmount)
{
	new id = cache_get_field_content_int(0, "id"), amount = cache_get_field_content_int(0, "drugAmount"), drugName[64], drugsComedown[128], drugsEffects[128], drugsOverdose[128];
	cache_get_field_content(0, "drugName", drugName, conn);
	cache_get_field_content(0, "drugComedown", drugsComedown, conn);
	cache_get_field_content(0, "drugEffects", drugsEffects, conn);
	cache_get_field_content(0, "drugOverdose", drugsOverdose, conn);
	new createby = cache_get_field_content_int(0, "drugCreatedBy"), createat = cache_get_field_content_int(0, "drugCreatedAt"), drugtype = cache_get_field_content_int(0, "drugType"), qual = cache_get_field_content_int(0, "drugQuality");
	if(amount < drugAmount || drugAmount == 0)
	{
		format(gstr, sizeof(gstr),  "{FFFFFF}Quantidade Inválida!\nHow many grams of %s do you want to give %s?", drugName, NameRP(GetPVarInt(playerid, "giveDrugs")));
		return Dialog_Show(playerid, GivePlayerDrugAmount, DIALOG_STYLE_INPUT, "{FFFFFF}Give the drugs - Amount", gstr, "Selecionar", "Cancelar");
	}
	if(drugAmount == amount)
	{
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE drugs SET drugOwner = %d WHERE id = %d", SQLID[GetPVarInt(playerid, "giveDrugs")], id);
		mysql_pquery(conn, mquery);
	}
	else
	{
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE drugs SET drugAmount = drugAmount - %d WHERE id = %d", drugAmount, id);
		mysql_pquery(conn, mquery);
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE drugs SET drugAmount = drugAmount + %d WHERE drugOwner = %d AND drugEffects = '%e' AND drugName = '%e'", drugAmount, SQLID[GetPVarInt(playerid, "giveDrugs")], drugsEffects, drugName);
		new Cache:result = mysql_query(conn, mquery);
		if(cache_affected_rows() == 0)
		{
			mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO drugs (drugName, drugCreatedBy, drugCreatedAt, drugOwner, drugOwnerType, drugType, drugEffects, drugComedown, drugOverdose, drugQuality, drugAmount) VALUES ('%e', %d, %d, %d, 'P', %d, '%e', '%e', '%e', %d, %d)",
			drugName, createby, createat, SQLID[GetPVarInt(playerid, "giveDrugs")], drugtype, drugsEffects, drugsComedown, drugsOverdose, qual, drugAmount);
			mysql_pquery(conn, mquery);
		}
		cache_delete(result);
	}

	SendClientMessageF(playerid, COLOR_WHITE, "You gave %s %d grams of %s. You have %d grams left.", NameRP(GetPVarInt(playerid, "giveDrugs")), drugAmount, drugName, amount - drugAmount);
	SendClientMessageF(GetPVarInt(playerid, "giveDrugs"), COLOR_WHITE, "%s gave you %d grams of %s", NameRP(playerid), drugAmount, drugName);

	format(gstr, sizeof(gstr), "* %s hands something over to %s. *",NameRP(playerid),NameRP(GetPVarInt(playerid, "giveDrugs")));
	ProxDetector(20.0,playerid,gstr,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE);
	DeletePVar(playerid, "giveDrugs");
	return true;
}
RCRP::GivePlayerIngred(playerid, iAmount)
{
	new id = cache_get_field_content_int(0, "id"), amount = cache_get_field_content_int(0, "ingAmount"), type = cache_get_field_content_int(0, "ingType");
	if(amount < iAmount || iAmount == 0)
	{
		format(gstr, sizeof(gstr), "{FFFFFF}Quantidade Inválida!\nHow many grams of %s do you want to give %s?", IngredName[type], NameRP(GetPVarInt(playerid, "giveIngred")));
		return Dialog_Show(playerid, GivePlayerIngredAmount, DIALOG_STYLE_INPUT, "{FFFFFF}Give the drugs - Amount", gstr, "Selecionar", "Cancelar");
	}
	if(iAmount == amount)
	{
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE ingredients SET ingOwner = %d WHERE id = %d", SQLID[GetPVarInt(playerid, "giveIngred")], id);
		mysql_pquery(conn, mquery);
	}
	else
	{
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE ingredients SET ingAmount = ingAmount - %d WHERE id = %d", iAmount, id);
		mysql_pquery(conn, mquery);
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE ingredients SET ingAmount = ingAmount + %d WHERE ingOwner = %d AND ingType = %d", iAmount, SQLID[GetPVarInt(playerid, "giveIngred")], type);
		new Cache:result = mysql_query(conn, mquery);
		if(cache_affected_rows() == 0)
		{
			mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO ingredients (ingOwner, ingOwnerType, ingAmount) VALUES (%d, 'P', %d)", SQLID[GetPVarInt(playerid, "giveIngred")], iAmount);
			mysql_pquery(conn, mquery);
		}
		cache_delete(result);
	}
	SendClientMessageF(playerid, COLOR_WHITE, "You gave %s %d grams of %s. You have %d grams left.", NameRP(GetPVarInt(playerid, "giveIngred")), iAmount, IngredName[type], amount - iAmount);
	SendClientMessageF(GetPVarInt(playerid, "giveIngred"), COLOR_WHITE, "%s gave you %d grams of %s", NameRP(playerid), iAmount, IngredName[type]);

	format(gstr, sizeof(gstr), "* %s hands something over to %s. *",NameRP(playerid),NameRP(GetPVarInt(playerid, "giveIngred")));
	ProxDetector(20.0,playerid,gstr,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE);
	DeletePVar(playerid, "giveIngred");
	return true;
}

RCRP::SelectIngredients(playerid)
{
	DrugSelectionOffset[playerid] = cache_get_field_content_int(0, "id");

	Dialog_Show(playerid, SelectIngredients, DIALOG_STYLE_LIST, IngredName[cache_get_field_content_int(0, "ingType")], "Drop Ingredients", "Selecionar", "Cancelar");
	return true;
}


RCRP::SelectPlayerDrug(playerid)
{
	DrugSelectionOffset[playerid] = cache_get_field_content_int(0, "id");

	new dName[32];
	cache_get_field_content(0, "drugName", dName, conn);
	Dialog_Show(playerid, SelectPlayerDrug, DIALOG_STYLE_LIST, dName, "Take Drug\nMix Drugs\nDrop Drug", "Selecionar", "Cancelar");
	return true;
}

RCRP::SelectCombineDrug(playerid)
{
	if(cache_num_rows() == 1)
	{
		mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM drugs WHERE id = %d OR id = %d", CombineDrugID[playerid], cache_get_field_content_int(0, "id"));
		mysql_pquery(conn, mquery, "SelectCombineDrug", "i", playerid);
	}
	else
	{
		new drugData[2][128], comedownData[2][128], Float:effArray[2][15], Float:cmdArray[2][15], drugName[2][64], quality, amount;
		cache_get_field_content(0, "drugEffects", drugData[0], conn, 128);
		cache_get_field_content(1, "drugEffects", drugData[1], conn, 128);
		cache_get_field_content(0, "drugComedown", comedownData[0], conn, 128);
		cache_get_field_content(1, "drugComedown", comedownData[1], conn, 128);
		cache_get_field_content(0, "drugName", drugName[0], conn, 64);
		cache_get_field_content(1, "drugName", drugName[1], conn, 64);
		sscanf(drugData[0], "p<,>a<f>[15]", effArray[0]);
		sscanf(drugData[1], "p<,>a<f>[15]", effArray[1]);
		sscanf(comedownData[0], "p<,>a<f>[15]", cmdArray[0]);
		sscanf(comedownData[1], "p<,>a<f>[15]", cmdArray[1]);

		effArray[0][0] = (effArray[0][0] + effArray[1][0]) / 2;
		cmdArray[0][0] = (cmdArray[0][0] + cmdArray[1][0]) / 2;
		cmdArray[0][1] = (cmdArray[0][1] + cmdArray[1][1]) / 2;
		cmdArray[0][2] = (cmdArray[0][2] + cmdArray[1][2]) / 2;
		for(new j=1; j < 14; j+=2)
		{
			if(effArray[0][j+1] == effArray[1][j+1])
				effArray[0][j] = floatdiv((effArray[0][j] + effArray[1][j]), 2);
			else
				return Dialog_Show(playerid, CombineDrugsError, DIALOG_STYLE_MSGBOX, "{FFFFFF}Mixing drugs - ERROR", "{FFFFFF}The drug you selected doesn't match the composition of the originally selected drug, please choose another.", "Retornar", "");
		}
		for(new j=3; j < 14; j+=2)
		{
			if(cmdArray[0][j+1] == cmdArray[1][j+1])
				cmdArray[0][j] = floatdiv((cmdArray[0][j] + cmdArray[1][j]), 2);
			else
				return Dialog_Show(playerid, CombineDrugsError, DIALOG_STYLE_MSGBOX, "{FFFFFF}Mixing drugs - ERROR", "{FFFFFF}The drug you selected doesn't match the composition of the originally selected drug, please choose another.", "Retornar", "");
		}
		strdel(drugData[0], 0, 128);
		strdel(comedownData[0], 0, 128);
		for(new j=0; j < 15; j++)
		{
			format(drugData[0], 128, "%s%.2f, ", drugData[0], effArray[0][j]);
			format(comedownData[0], 128, "%s%.2f, ", comedownData[0], cmdArray[0][j]);
		}

		quality = (cache_get_field_content_int(0, "drugQuality") + cache_get_field_content_int(1, "drugQuality")) / 2;
		amount = cache_get_field_content_int(0, "drugAmount") + cache_get_field_content_int(1, "drugAmount");

		CombineDrugID[playerid] = cache_get_field_content_int(0, "id");
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE drugs SET drugEffects ='%s', drugComedown = '%s', drugQuality = %d, drugAmount = %d WHERE id = %d", drugData[0], comedownData[0], quality, amount, cache_get_field_content_int(0, "id"));
		mysql_pquery(conn, mquery);
		mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM drugs WHERE id = %d", cache_get_field_content_int(1, "id"));
		mysql_pquery(conn, mquery);
		format(gstr, sizeof(gstr), "%s\n%s", drugName[0], drugName[1]);
		SetPVarString(playerid, "drugCombName", gstr);
		Dialog_Show(playerid, CombinePlayerDrug, DIALOG_STYLE_LIST, "{FFFFFF}Mixing drugs - Choose name", gstr, "Select", "");
	}
	return 1;
}

//Fim da parte 2

RCRP::DropIngredients(playerid, amount)
{
	new iAmount = cache_get_field_content_int(0, "ingAmount"), id = cache_get_field_content_int(0, "id");
	if(amount == iAmount)
	{
		for(new p = 1; p < MAX_INGREDIENTS; p++)
		{
			if(IngredientsData[p][ingredPos][0] == 0.0 && IngredientsData[p][ingredSQLID] == 0)
			{
				IngredientsData[p][ingredSQLID] = id;
				IngredientsData[p][ingredAmount] = amount;
				IngredientsData[p][ingredVW] = GetPlayerVirtualWorld(playerid);
				IngredientsData[p][ingredInt] = GetPlayerInterior(playerid);
				GetPlayerPos(playerid, IngredientsData[p][ingredPos][0], IngredientsData[p][ingredPos][1], IngredientsData[p][ingredPos][2]);
				GetXYInFrontOfPlayer(playerid, IngredientsData[p][ingredPos][0], IngredientsData[p][ingredPos][1], 1.0);
				IngredientsData[p][ingredType] = cache_get_field_content_int(0, "ingType");
				if(amount < 28){
					IngredientsData[p][ingredObj] = CreateDynamicObject(19874, IngredientsData[p][ingredPos][0], IngredientsData[p][ingredPos][1], IngredientsData[p][ingredPos][2] - 1.0, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
					SetDynamicObjectMaterial(IngredientsData[p][ingredObj], 0, 1575, "dyn_drugs", IngColors[cache_get_field_content_int(0, "ingModColor")]);
				}

				else if(amount < 112){
					IngredientsData[p][ingredObj] = CreateDynamicObject(2891, IngredientsData[p][ingredPos][0], IngredientsData[p][ingredPos][1], IngredientsData[p][ingredPos][2] - 1.0, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
					SetDynamicObjectMaterial(IngredientsData[p][ingredObj], 0, 1575, "dyn_drugs", IngColors[cache_get_field_content_int(0, "ingModColor")]);
				}
				else
				{
					IngredientsData[p][ingredObj] = CreateDynamicObject(1279, IngredientsData[p][ingredPos][0], IngredientsData[p][ingredPos][1], IngredientsData[p][ingredPos][2] - 1.0, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
					SetDynamicObjectMaterial(IngredientsData[p][ingredObj], 0, 1575, "dyn_drugs", IngColors[cache_get_field_content_int(0, "ingModColor")]);
				}

				Streamer_Update(playerid);
				mysql_format(conn, mquery, sizeof(mquery), "UPDATE ingredients SET ingOwner = -1, ingOwnerType = 'D', ingPosX = %f, ingPosY = %f, ingPosZ = %f, ingVw = %d, ingInt = %d WHERE id = %d", IngredientsData[p][ingredPos][0], IngredientsData[p][ingredPos][1],
					IngredientsData[p][ingredPos][2] - 1.0, IngredientsData[p][ingredVW], IngredientsData[p][ingredInt], id);
				mysql_pquery(conn, mquery);

				PlayerPlaySound(playerid, 5600, 0.0, 0.0, 0.0);
				SendClientMessageF(playerid, COLOR_YELLOW, "You have dropped %d grams of %s on the ground.", amount, IngredName[IngredientsData[p][ingredType]]);
				format(gstr, sizeof(gstr), "* %s drops something on the ground. *",NameRP(playerid));
				ProxDetector(20.0,playerid,gstr,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE);
				return true;
			}
		}
	}
	else if(amount < iAmount)
	{
		mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO ingredients (ingOwner, ingOwnerType, ingType, ingAmount, ingModel, ingModColor) VALUES (%d, 'D', %d, %d, %d, %d)", -1, cache_get_field_content_int(0, "ingType"), amount, cache_get_field_content_int(0, "ingModel"), cache_get_field_content_int(0, "ingModColor"));
		new Cache:result = mysql_query(conn, mquery);
		DrugSelectionOffset[playerid] = cache_insert_id(conn);
		cache_delete(result, conn);

		mysql_format(conn, mquery, sizeof(mquery), "UPDATE ingredients SET ingAmount = %d WHERE id = %d", iAmount - amount, id);
		mysql_pquery(conn, mquery);

		mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM ingredients WHERE id = %d", DrugSelectionOffset[playerid]);
		mysql_pquery(conn, mquery, "DropIngredients", "ii", playerid, amount);
		return true;
	}
	else
	{
		return Dialog_Show(playerid, DropIngredients, DIALOG_STYLE_INPUT, "{FFFFFF}Dropping ingredients", "{FFFFFF}Quantidade Inválida!\nHow many grams do you want to drop?", "Confirmar", "Cancelar");
	}
	return true;
}


RCRP::DroppingDrugs(playerid, amount)
{
	new drugAmount = cache_get_field_content_int(0, "drugAmount"), drugName[64], id = cache_get_field_content_int(0, "id"), drugsEffects[128], drugsComedown[128], qual = cache_get_field_content_int(0, "drugQuality"), drugsOverdose[128];
	cache_get_field_content(0, "drugName", drugName, conn);
	cache_get_field_content(0, "drugEffects", drugsEffects, conn);
	cache_get_field_content(0, "drugComedown", drugsComedown, conn);
	cache_get_field_content(0, "drugOverdose", drugsOverdose, conn);
	if(amount == drugAmount)
	{
		for(new p = 1; p < MAX_DRUGS; p++)
		{
			if(DrugTakenData[p][effActive] == 0)
			{
				DrugTakenData[p][effSQLID] = id;
				cache_get_field_content(0, "drugEffects", DrugTakenData[p][drugEffects], conn, 128);
				cache_get_field_content(0, "drugComedown", DrugTakenData[p][drugComedown], conn, 128);
				cache_get_field_content(0, "drugOverdose", DrugTakenData[p][drugOverdose], conn, 128);
				GetPlayerPos(playerid, DrugTakenData[p][drugPos][0], DrugTakenData[p][drugPos][1], DrugTakenData[p][drugPos][2]);
				GetXYInFrontOfPlayer(playerid, DrugTakenData[p][drugPos][0], DrugTakenData[p][drugPos][1], 1.0);
				DrugTakenData[p][effDrugType] = cache_get_field_content_int(0, "drugType");
				DrugTakenData[p][effActive] = 2;
				DrugTakenData[p][effTakenBy] = -1;
				DrugTakenData[p][effActivated] = 0;
				DrugTakenData[p][drugVW] = GetPlayerVirtualWorld(playerid);
				DrugTakenData[p][drugInt] = GetPlayerInterior(playerid);
				DrugTakenData[p][drugsQuality] = qual;
				if(amount < 28){
					DrugTakenData[p][drugObj] = CreateDynamicObject(19874, DrugTakenData[p][drugPos][0], DrugTakenData[p][drugPos][1], DrugTakenData[p][drugPos][2] - 1.0, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
					SetDynamicObjectMaterial(DrugTakenData[p][drugObj], 0, 1279, "craigpackage", "drugs");
				}
				else if(amount < 112)
				{
					DrugTakenData[p][drugObj] = CreateDynamicObject(2891, DrugTakenData[p][drugPos][0], DrugTakenData[p][drugPos][1], DrugTakenData[p][drugPos][2] - 1.0, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
					SetDynamicObjectMaterial(DrugTakenData[p][drugObj], 0, 1279, "craigpackage", "drugs");
				}
				else
				{
					DrugTakenData[p][drugObj] = CreateDynamicObject(1279, DrugTakenData[p][drugPos][0], DrugTakenData[p][drugPos][1], DrugTakenData[p][drugPos][2] - 1.0, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
				}
				Streamer_Update(playerid);
				mysql_format(conn, mquery, sizeof(mquery), "UPDATE drugs SET drugOwner = -1, drugOwnerType = 'D', drugPosX = %f, drugPosY = %f, drugPosZ = %f WHERE id = %d", DrugTakenData[p][drugPos][0], DrugTakenData[p][drugPos][1], DrugTakenData[p][drugPos][2] - 1.0, id);
				mysql_pquery(conn, mquery);

				PlayerPlaySound(playerid, 5600, 0.0, 0.0, 0.0);
				SendClientMessageF(playerid, COLOR_YELLOW, "You have dropped %d grams of %s on the ground.", amount, drugName);
				format(gstr, sizeof(gstr), "* %s drops something on the ground. *",NameRP(playerid),NameRP(GetPVarInt(playerid, "giveDrugs")));
				ProxDetector(20.0,playerid,gstr,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE);
				return true;
			}
		}
	}
	else if(amount < drugAmount)
	{
		mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO drugs (drugName, drugCreatedBy, drugCreatedAt, drugOwner, drugOwnerType, drugType, drugEffects, drugComedown, drugOverdose, drugQuality, drugAmount) VALUES ('%e', %d, %d, %d, 'D', %d, '%e', '%e', '%e', %d, %d)",
			drugName, cache_get_field_content_int(0, "drugCreatedBy"), cache_get_field_content_int(0, "drugCreatedAt"), -1, cache_get_field_content_int(0, "drugType"), drugsEffects, drugsComedown, drugsOverdose, qual, amount);
		new Cache:result = mysql_query(conn, mquery);
		DrugSelectionOffset[playerid] = cache_insert_id(conn);
		cache_delete(result, conn);

		mysql_format(conn, mquery, sizeof(mquery), "UPDATE drugs SET drugAmount = %d WHERE id = %d", drugAmount - amount, id);
		mysql_pquery(conn, mquery);

		mysql_format(conn, mquery, sizeof(mquery), "SELECT * FROM drugs WHERE id = %d", DrugSelectionOffset[playerid]);
		mysql_pquery(conn, mquery, "DroppingDrugs", "ii", playerid, amount);
		return true;
	}
	else
	{
		return Dialog_Show(playerid, DropDrugs, DIALOG_STYLE_INPUT, "{FFFFFF}Dropping Drugs", "{FFFFFF}Quantidade Inválida!\nHow many grams do you want to drop?", "Confirmar", "Cancelar");
	}
	return true;
}

RCRP::PickupDrug(playerid, d)
{
	if(cache_num_rows() > 0)
	{
		new amount = cache_get_field_content_int(0, "drugAmount");
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE drugs SET drugAmount = drugAmount + %d WHERE id = %d", amount, cache_get_field_content_int(0, "id"));
		mysql_pquery(conn, mquery);
		mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM drugs WHERE id = %d", DrugTakenData[d][effSQLID]);
		mysql_pquery(conn, mquery);
	}
	else
	{
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE drugs SET drugOwner = %d, drugOwnerType = 'P', drugPosX = 0.0, drugPosY = 0.0, drugPosZ = 0.0 WHERE id = %d", SQLID[playerid], DrugTakenData[d][effSQLID]);
		mysql_pquery(conn, mquery);
	}
	switch(DrugTakenData[d][effAmount])
	{
		case 0..27: SendClientMessage(playerid, COLOR_WHITE, "You picked a small package up from the ground.");
		case 28..111: SendClientMessage(playerid, COLOR_WHITE, "You picked a package up from the ground.");
		default: SendClientMessage(playerid, COLOR_WHITE, "You picked a large package up from the ground.");
	}
	DrugTakenData[d][effActive] = 0;
	DrugTakenData[d][drugPos][0] = 0.0;
	DrugTakenData[d][drugPos][1] = 0.0;
	DrugTakenData[d][drugPos][2] = 0.0;
	ApplyAnimation(playerid, "CARRY", "liftup", 4,0,0,0,0,0,0);
	DestroyDynamicObjectEx(DrugTakenData[d][drugObj], "DrugTakenData[d][drugObj]");
	DrugTakenData[d][drugObj] = INVALID_OBJECT_ID;
	return true;
}

RCRP::PickupIngredient(playerid, d)
{
	if(cache_num_rows() > 0)
	{
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE ingredients SET ingAmount = ingAmount + %d WHERE id = %d", IngredientsData[d][ingredAmount], cache_get_field_content_int(0, "id"));
		mysql_pquery(conn, mquery);
		mysql_format(conn, mquery, sizeof(mquery), "DELETE FROM ingredients WHERE id = %d", IngredientsData[d][ingredSQLID]);
		mysql_pquery(conn, mquery);
	}
	else
	{
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE ingredients SET ingOwner = %d, ingOwnerType = 'P', ingPosX = 0.0, ingPosY = 0.0, ingPosZ = 0.0 WHERE id = %d", SQLID[playerid], IngredientsData[d][ingredSQLID]);
		mysql_pquery(conn, mquery);
	}
	switch(IngredientsData[d][ingredAmount])
	{
		case 0..27: SendClientMessage(playerid, COLOR_WHITE, "You picked a small package up from the ground.");
		case 28..111: SendClientMessage(playerid, COLOR_WHITE, "You picked a package up from the ground.");
		default: SendClientMessage(playerid, COLOR_WHITE, "You picked a large package up from the ground.");
	}
	IngredientsData[d][ingredSQLID] = 0;
	IngredientsData[d][ingredPos][0] = 0.0;
	IngredientsData[d][ingredPos][1] = 0.0;
	IngredientsData[d][ingredPos][2] = 0.0;
	ApplyAnimation(playerid, "CARRY", "liftup", 4,0,0,0,0,0,0);
	DestroyDynamicObjectEx(IngredientsData[d][ingredObj], "IngredientsData[d][ingredObj]");
	IngredientsData[d][ingredObj] = INVALID_OBJECT_ID;
	return true;
}

RCRP::PickupTestIngredient(playerid, type)
{
	if(cache_num_rows() > 0)
	{
		mysql_format(conn, mquery, sizeof(mquery), "UPDATE ingredients SET ingAmount = ingAmount + %d WHERE id = %d", 20, cache_get_field_content_int(0, "id"));
		mysql_pquery(conn, mquery);
	}
	else
	{
		mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO ingredients (ingOwner, ingType, ingOwnerType, ingAmount, ingModColor) VALUES (%d, %d, 'P', %d, %d)", SQLID[playerid], type, 20, random(6));
		mysql_pquery(conn, mquery);

	}

	ApplyAnimation(playerid, "CARRY", "liftup", 4,0,0,0,0,0,0);
	return true;
}

RCRP::DoingDrugsMate(playerid)
{
	for(new p = 1; p < MAX_DRUGS; p++)
	{
		if(DrugTakenData[p][effActive] == 0)
		{
			new drugTakenCount = 0;
			for(new ov = 0; ov < 10; ov++)
			{
				if(DrugsTaken[playerid][ov] > 0)
					drugTakenCount++;
			}
			if(drugTakenCount >= 10)
			{
				format(gstr, sizeof(gstr), "%s lurches forward, violently vomiting up the contents of his stomach", NameRP(playerid));
				ProxDetector(20.0,playerid,gstr,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE,COLOR_EMOTE);
				cmd_vomit(playerid, "");
				return true;
			}
			new effectsData[128], comedownData[128], overdoseData[128], Float:effArray[15], Float:cmdArray[15], Float:ovrArray[18], l = 0;
			cache_get_field_content(0, "drugEffects", effectsData, conn);
			cache_get_field_content(0, "drugComedown", comedownData, conn);
			cache_get_field_content(0, "drugOverdose", overdoseData, conn);
			sscanf(overdoseData, "p<,>a<f>[18]", ovrArray);
			sscanf(effectsData, "p<,>a<f>[15]", effArray);
			sscanf(comedownData, "p<,>a<f>[15]", cmdArray);
			for(new e = 1; e < 13; e+=2)
			{
				DrugTakenData[p][effAmount][l] = effArray[e];
				DrugTakenData[p][effType][l] = effArray[e+1];
				l++;
			}
			l = 0;
			for(new k = 3; k < 13; k+=2)
			{
				DrugTakenData[p][cmdAmount][l] = cmdArray[k];
				DrugTakenData[p][cmdType][l] = cmdArray[k + 1];
				l++;
			}
			l = 0;
			for(new k = 3; k < 13; k+=2)
			{
				DrugTakenData[p][ovrAmount][l] = ovrArray[k];
				DrugTakenData[p][ovrType][l] = ovrArray[k+1];
				l++;
			}
			DrugTakenData[p][ovrMax] = floatround(ovrArray[1]);
			DrugTakenData[p][ovrDuration] = floatround(ovrArray[0]);
			DrugTakenData[p][effDuration] = floatround(cmdArray[0]);
			DrugTakenData[p][cmdStart] = floatround(cmdArray[1]);
			DrugTakenData[p][effSQLID] = cache_get_field_content_int(0, "id");
			DrugTakenData[p][effDrugType] = cache_get_field_content_int(0, "drugType");
			DrugTakenData[p][effTimeTo] = floatround(effArray[0]);
			DrugTakenData[p][effActive] = 1;
			DrugTakenData[p][effTakenBy] = SQLID[playerid];
			DrugTakenData[p][effActivated] = 0;
			for(new d = 0; d < 10; d++)
			{
				if(DrugsTaken[playerid][d] == -1)
				{
					DrugsTaken[playerid][d] = p;
					break;
				}
			}
			break;
		}
	}
	return true;
}

RCRP::RedoingDrugsMate(playerid, d)
{
	new effectsData[128], Float:effArray[15], l = 0;
	cache_get_field_content(0, "drugEffects", effectsData, conn);
	sscanf(effectsData, "p<,>a<f>[15]", effArray);
	for(new e = 1; e < 13; e+=2)
	{
		DrugTakenData[d][effAmount][l] = effArray[e];
		DrugTakenData[d][effType][l] = effArray[e+1];
		l++;
	}
	DrugTakenData[d][effSQLID] = cache_get_field_content_int(0, "id");
	DrugTakenData[d][effTimeTo] = floatround(effArray[0]);
	DrugTakenData[d][effTakenBy] = SQLID[playerid];
	return true;
}

RCRP::RetrieveIngInfo(playerid, offset)
{
	format(gstr, sizeof(gstr), "Ingredient\tAmount\n");
	for(new r = 0; r < cache_get_row_count(conn); r++)
	{
		TempIngData[playerid][ingAmount][r] = cache_get_field_content_int(r, "ingAmount");
		TempIngData[playerid][ingType][r] = cache_get_field_content_int(r, "ingType");
		TempIngData[playerid][ingID][r] = cache_get_field_content_int(r, "id");
		TempIngData[playerid][ingModel][r] = cache_get_field_content_int(r, "ingModel");
		if(TempIngData[playerid][ingAmount][r] != 0)
			format(gstr, sizeof(gstr), "%s%s\t%d\n", gstr, IngredName[TempIngData[playerid][ingType][r]], TempIngData[playerid][ingAmount][r]);
	}
	if(cache_get_row_count(conn) == 20) strcat(gstr, "Next Page >>\n");
	if(offset == 1) strcat(gstr, "<< Previous Page");
	if(strmatch(gstr, "Ingredient\tAmount\n")) strcat(gstr, "No ingredients to display.");
	Dialog_Show(playerid, DisplayIngredients, DIALOG_STYLE_TABLIST_HEADERS, "Ingredient Inventory", gstr, "Selecionar", "Cancelar");
	return true;
}

RCRP::CombineDrug(playerid)
{
	for(new i=0; i<3; i++)
	{
		if(DrugCombineData[playerid][5 + i] != 0)
		{
			for(new l=0; l<3; l++)
			{
				if(i != l && DrugCombineData[playerid][5+i] == DrugCombineData[playerid][5+l] && DrugCombineData[playerid][5+l] > 0)
				{
					SendClientMessage(playerid, COLOR_RED, "Error: You can not use 2 of the same ingredient, increase the amount instead.");
					PlayerTextDrawSetPreviewModel(playerid, DrugCombineP[playerid][1 + l], 18631);
					DrugCombineData[playerid][1+l] = 18631;
					PlayerTextDrawShow(playerid, DrugCombineP[playerid][1+l]);
					PlayerTextDrawHide(playerid, DrugCombineP[playerid][4]);
					TextDrawHideForPlayer(playerid, DrugCombine[7]);
					mysql_format(conn, mquery, sizeof(mquery), "UPDATE ingredients SET ingAmount = ingAmount + %d WHERE id = %d", DrugCombineData[playerid][13+l],
						DrugCombineData[playerid][17+l]);
					mysql_pquery(conn, mquery);
					DrugCombineData[playerid][5+l] = 0;
					DrugCombineData[playerid][13+l] = 0;
					DrugCombineData[playerid][17+1] = 0;
					return SelectTextDraw(playerid, COLOR_ORANGE);
				}
			}
		}
		if(DrugCombineData[playerid][12] < 1)
		{
			SendClientMessage(playerid, COLOR_RED, "Error: You must use an ingredient in the first slot to create a compound.");
			return SelectTextDraw(playerid, COLOR_ORANGE);
		}
		if(DrugCombineData[playerid][13] < 1 && DrugCombineData[playerid][14] < 1 && DrugCombineData[playerid][15] < 1)
		{
			SendClientMessage(playerid, COLOR_RED, "Error: You must use atleast two ingredients in order to create a new drug.");
			return SelectTextDraw(playerid, COLOR_ORANGE);
		}
		if(DrugCombineData[playerid][13+i] != DrugCombineData[playerid][12] && DrugCombineData[playerid][13+i] >= 1)
		{
			SendClientMessage(playerid, COLOR_RED, "Error: You must use the same amount of ingredients for all ingredients.");
			PlayerTextDrawSetPreviewModel(playerid, DrugCombineP[playerid][1 + i], 18631);
			DrugCombineData[playerid][1+i] = 18631;
			PlayerTextDrawShow(playerid, DrugCombineP[playerid][1+i]);
			PlayerTextDrawHide(playerid, DrugCombineP[playerid][4]);
			TextDrawHideForPlayer(playerid, DrugCombine[7]);
			mysql_format(conn, mquery, sizeof(mquery), "UPDATE ingredients SET ingAmount = ingAmount + %d WHERE id = %d", DrugCombineData[playerid][13+i],
				DrugCombineData[playerid][17+i]);
			mysql_pquery(conn, mquery);
			DrugCombineData[playerid][5+i] = 0;
			DrugCombineData[playerid][13+i] = 0;
			DrugCombineData[playerid][17+i] = 0;
			return SelectTextDraw(playerid, COLOR_ORANGE);
		}
	}

	CancelIngMenu(playerid);
	new furniData[64];
	for(new j = 0; j < 20; j++)
	{
		FurniDrugInfo[IsInHouseID[playerid]][CreatingDrugs[playerid][2]][j] = DrugCombineData[playerid][j];
		format(furniData, sizeof(furniData), "%s%d,", furniData, FurniDrugInfo[IsInHouseID[playerid]][CreatingDrugs[playerid][2]][j]);
	}

	mysql_format(conn, mquery, sizeof(mquery), "UPDATE hfurniture SET drugBeingCreated = '%s' WHERE id = %d", furniData, HouseData[IsInHouseID[playerid]][FurnSQLID][CreatingDrugs[playerid][2]]);
	mysql_pquery(conn, mquery);
	CreatingDrugs[playerid][0] = -1;
	HouseData[IsInHouseID[playerid]][DrugTimer][CreatingDrugs[playerid][2]] = 30;
	return true;
	//Drug making magic!
}

RCRP::ExplosionTimer(playerid)
{
	if(ExploTimer[playerid] >= 1)
	{
		if(ExploTimer[playerid] == 2)
		{
			new Float:ppos1[3];
			GetPlayerPos(playerid, ppos1[0], ppos1[1], ppos1[2]);
			PlayerPlaySound(playerid, 1159, ppos1[0], ppos1[1], ppos1[2]);
		}
		if(ExploTimer[playerid] < 13)
		{
			new tempstr[32];
			format(tempstr, sizeof(tempstr), "LD_NONE:explm%02d", ExploTimer[playerid]);
			PlayerTextDrawSetString(playerid, NewDrugTDP[playerid], tempstr);
			PlayerTextDrawShow(playerid, NewDrugTDP[playerid]);
		}
		else if(ExploTimer[playerid] == 13)
		{
			PlayerTextDrawHide(playerid, NewDrugTDP[playerid]);
			PlayerTextDrawSetString(playerid, NewDrugTDP[playerid], "LD_NONE:explm01");
		}
		else if(ExploTimer[playerid] == 17)
		{
			ExploTimer[playerid] = 0;
			print(IngredName[FurniDrugInfo[IsInHouseID[playerid]][CreatingDrugs[playerid][2]][4]]);
			//Base effect calculation
			new Float:baseEffectPerc[4], usedBase, dAmount = FurniDrugInfo[IsInHouseID[playerid]][CreatingDrugs[playerid][2]][13];
			for(new i=0; i < sizeof(BaseEffects); i++)
			{
				if(strmatch(IngredName[FurniDrugInfo[IsInHouseID[playerid]][CreatingDrugs[playerid][2]][4]], BaseEffects[i][baseName]))
				{
					usedBase = i;
					baseEffectPerc[0] = BaseEffects[i][baseEffect1][0];
					baseEffectPerc[1] = BaseEffects[i][baseEffect2][0];
					baseEffectPerc[2] = BaseEffects[i][baseEffect3][0];
					baseEffectPerc[3] = BaseEffects[i][baseEffect4][0];
					break;
				}
			}

			new weightedTotal = floatround(baseEffectPerc[0] + baseEffectPerc[1] + baseEffectPerc[2] + baseEffectPerc[3]) * 100, Float:randChos, effRand;
			new Float:comedownData[17], Float:overdoseData[17];

			randChos = randomEx(50, weightedTotal);

			while(randChos > 0)
			{
				effRand = random(4);
				randChos = floatsub(randChos, baseEffectPerc[effRand]);
			}
			new Float:basePreEffects[19];
			switch(effRand)
			{
				case 0:
					for(new i=0; i < 19; i++)
						basePreEffects[i] = BaseEffects[usedBase][baseEffect1][i+1];
				case 1:
					for(new i=0; i < 19; i++)
						basePreEffects[i] = BaseEffects[usedBase][baseEffect2][i+1];
				case 2:
					for(new i=0; i < 19; i++)
						basePreEffects[i] = BaseEffects[usedBase][baseEffect3][i+1];
				case 3:
					for(new i=0; i < 19; i++)
						basePreEffects[i] = BaseEffects[usedBase][baseEffect4][i+1];
			}

			new Float:effectCalc[17], b=1;
			effectCalc[0] = basePreEffects[0];
			for(new i = 1; i < 19; i+=3)
			{
				effectCalc[b] = floatdiv(randomEx(floatround(basePreEffects[i] * 100), floatround(basePreEffects[i+1] * 100)), 100);
				effectCalc[b+1] = basePreEffects[i+2];
				b+=2;
			}

			//Bringing in ingredient calculation
			new ingredID[3];
			for(new i=0; i < 3; i++)
			{
				if(FurniDrugInfo[IsInHouseID[playerid]][CreatingDrugs[playerid][2]][5 + i] == -1) continue;
				for(new g=1; g < sizeof(IngredEffects); g++)
				{
					if(strmatch(IngredName[FurniDrugInfo[IsInHouseID[playerid]][CreatingDrugs[playerid][2]][5 + i]], IngredEffects[g][ingName]))
					{
						if(IngredEffects[g][ingUsedBase] == FurniDrugInfo[IsInHouseID[playerid]][CreatingDrugs[playerid][2]][4])
						{
							ingredID[i] = g;
							break;
						}
					}
				}
			}
			for(new j = 0; j < 17; j++)
			{
				comedownData[j] = BaseEffects[usedBase][baseComedown][j];
				overdoseData[j] = BaseEffects[usedBase][baseOverdose][j];
			}

			for(new i=0; i<3; i++)
			{
				if(ingredID[i] <= 0) continue;
				new k = 0;
				for(new l=0; l < 5; l++)
				{
					if(IngredEffects[ingredID[i]][ingType][l] != 0)
					{
						for(new j=2; j < 11; j+=2)
						{
							switch(IngredEffects[ingredID[i]][ingType][l])
							{
								case 11.0:
								{
									effectCalc[0] += effectCalc[0] * IngredEffects[ingredID[i]][ingEffects][k+1];
									break;
								}
								case 12.0:
								{
									for(new x=4; x < 11; x+=2)
									{
										if(effectCalc[x] == 0.0)
										{
											effectCalc[x] = 12.0;
											effectCalc[x-1] = IngredEffects[ingredID[i]][ingEffects][k+1];
											break;
										}
									}
									break;
								}
								case 13.0:
								{
									for(new z = 4; z < 15; z+=2)
										if(comedownData[z] == 0.0)
											comedownData[z] = 13.0;
								}
							}
							if(IngredEffects[ingredID[i]][ingType][l] == effectCalc[j] || (IngredEffects[ingredID[i]][ingType][l] == 3.0 && (effectCalc[j] == 1.0 || effectCalc[j] == 2.0)))
							{
								if(IngredEffects[ingredID[i]][ingEffects][k] > 0.0)
								{
									switch(IngredEffects[ingredID[i]][ingEffects][k])
									{
										case 1.0:
										{
											effectCalc[j-1] = effectCalc[j-1] + floatmul(effectCalc[j-1], floatdiv(randomEx(floatround(IngredEffects[ingredID[i]][ingEffects][k+1] * 100),
												floatround(IngredEffects[ingredID[i]][ingEffects][k+2] * 100)), 100));
											break;
										}
										default:
										{
											new Float:percVal[2];
											percVal[0] = IngredEffects[ingredID[i]][ingEffects][k];
											percVal[1] = floatsub(1.0, IngredEffects[ingredID[i]][ingEffects][k]);
											randChos = randomEx(50, 100);

											while(randChos > 0)
											{
												effRand = random(2);
												randChos = floatsub(randChos, percVal[effRand]);
											}
											effectCalc[j-1] = effectCalc[j-1] + (effectCalc[j-1] * IngredEffects[ingredID[i]][ingEffects][k+effRand]);
											break;
										}
									}
								}
							}
						}
					}
					k+=3;
				}
			}

			//calculate drug quality reduction from level
			new drugQuality = 100, Float:percVal[6][2], p=0;
			for(new x = 0; x < 15; x+=3)
			{
				percVal[p][0] = DrugLevelEffects[x];
				percVal[p][1] = x;
				p++;
			}
			percVal[5][0] = 0.02;
			randChos = randomEx(50, 100);

			while(randChos > 0)
			{
				effRand = random(6);
				randChos = floatsub(randChos, percVal[effRand][0]);
			}

			switch(effRand)
			{
				case 5:
				{
					drugQuality = 100;
				}
				default:
				{
					new percEx = randomEx(floatround(DrugLevelEffects[floatround(percVal[effRand][1]) + 1] * 100), floatround(DrugLevelEffects[floatround(percVal[effRand][1]) + 2] * 100)), virtualLevel = DrugLevel[playerid];
					if(DrugLevel[playerid] > 9) virtualLevel *= 2;
					if(DrugLevel[playerid] > 15) virtualLevel += floatround(floatmul(virtualLevel, 0.25));
					drugQuality -= floatround(floatmul(drugQuality, floatdiv(percEx - floatmul(percEx, floatdiv(virtualLevel * 2, 100)), 100)));
				}
			}

			//include comedown data

			new newComedown[128], newOverdose[128];
			new newDrug[128];
			for(new e=0; e < 17; e++)
			{
				format(newComedown, 128, "%s%.2f, ", newComedown, comedownData[e]);
				format(newDrug, 128, "%s%.2f, ", newDrug, effectCalc[e]);
				format(newOverdose, 128, "%s%.2f, ", newOverdose, overdoseData[e]);
			}
			strdel(newComedown, strlen(newComedown) - 2, strlen(newComedown));
			strdel(newDrug, strlen(newDrug) - 2, strlen(newDrug));
			strdel(newOverdose, strlen(newOverdose) - 2, strlen(newOverdose));

			mysql_format(conn, mquery, sizeof(mquery), "INSERT INTO drugs (drugName, drugCreatedBy, drugCreatedAt, drugOwner, drugOwnerType, drugType, drugEffects, drugComedown, drugOverdose, drugQuality, drugAmount) VALUES ('New Drug', %d, %d, %d, 'P', %d, '%e', '%e', '%e', %d, %d)",
				SQLID[playerid], gettime(), SQLID[playerid], FurniDrugInfo[IsInHouseID[playerid]][CreatingDrugs[playerid][2]][4], newDrug, newComedown, newOverdose, drugQuality, floatround(dAmount * randomEx(2, 3)));
			mysql_pquery(conn, mquery, "DrugSQLID", "i", playerid);

			TextDrawShowForPlayer(playerid, NewDrugTD[2]);
			SelectTextDraw(playerid, COLOR_ORANGE);
			KillTimer(ExpTimer[playerid]);
			return true;
		}
		ExploTimer[playerid]++;
	}
	return true;
}

RCRP::DrugSQLID(playerid)
{
	SetPVarInt(playerid, "drugSQLID", cache_insert_id());
	return true;
}

RCRP::LoadDroppedDrugs()
{
	for(new d = 0, x = cache_num_rows(); d < x; d++)
	{
		for(new dr = 1; dr < MAX_DRUGS; dr++)
		{
			if(DrugTakenData[dr][effActive] == 0)
			{
				DrugTakenData[dr][effSQLID] = cache_get_field_content_int(d, "id");
				DrugTakenData[dr][effActive] = 2;
				DrugTakenData[dr][effAmount] = cache_get_field_content_int(d, "drugAmount");
				DrugTakenData[dr][drugVW] = cache_get_field_content_int(d, "drugVW");
				DrugTakenData[dr][drugInt] = cache_get_field_content_int(d, "drugInt");
				DrugTakenData[dr][drugPos][0] = cache_get_field_content_float(d, "drugPosX");
				DrugTakenData[dr][drugPos][1] = cache_get_field_content_float(d, "drugPosY");
				DrugTakenData[dr][drugPos][2] = cache_get_field_content_float(d, "drugPosZ");
				cache_get_field_content(d, "drugEffects", DrugTakenData[dr][drugEffects], conn, 128);
				cache_get_field_content(d, "drugComedown", DrugTakenData[dr][drugComedown], conn, 128);
				cache_get_field_content(d, "drugOverdose", DrugTakenData[dr][drugOverdose], conn, 128);
				DrugTakenData[dr][effDrugType] = cache_get_field_content_int(d, "drugType");
				DrugTakenData[dr][effTakenBy] = -1;
				DrugTakenData[dr][effActivated] = 0;
				if(DrugTakenData[dr][effAmount] < 28){
					DrugTakenData[dr][drugObj] = CreateDynamicObject(19874, DrugTakenData[dr][drugPos][0], DrugTakenData[dr][drugPos][1], DrugTakenData[dr][drugPos][2], 0.0, 0.0, 0.0, DrugTakenData[dr][drugVW], DrugTakenData[dr][drugInt]);
					SetDynamicObjectMaterial(DrugTakenData[dr][drugObj], 0, 1279, "craigpackage", "drugs");
				}
				else if(DrugTakenData[dr][effAmount] < 112)
				{
					DrugTakenData[dr][drugObj] = CreateDynamicObject(2891, DrugTakenData[dr][drugPos][0], DrugTakenData[dr][drugPos][1], DrugTakenData[dr][drugPos][2], 0.0, 0.0, 0.0, DrugTakenData[dr][drugVW], DrugTakenData[dr][drugInt]);
					SetDynamicObjectMaterial(DrugTakenData[dr][drugObj], 0, 1279, "craigpackage", "drugs");
				}
				else
				{
					DrugTakenData[dr][drugObj] = CreateDynamicObject(1279, DrugTakenData[dr][drugPos][0], DrugTakenData[dr][drugPos][1], DrugTakenData[dr][drugPos][2], 0.0, 0.0, 0.0, DrugTakenData[dr][drugVW], DrugTakenData[dr][drugInt]);
				}
				break;
			}
		}
	}
	printf("%d loaded drugs", cache_num_rows());
	return true;
}

RCRP::LoadDroppedIngred()
{
	for(new d = 0, x = cache_num_rows(); d < x; d++)
	{
		for(new dr = 1; dr < MAX_INGREDIENTS; dr++)
		{
			if(IngredientsData[dr][ingredPos][0] == 0.0)
			{
				IngredientsData[dr][ingredSQLID] = cache_get_field_content_int(d, "id");
				IngredientsData[dr][ingredAmount] = cache_get_field_content_int(d, "ingAmount");
				IngredientsData[dr][ingredVW] = cache_get_field_content_int(d, "ingVW");
				IngredientsData[dr][ingredInt] = cache_get_field_content_int(d, "ingInt");
				IngredientsData[dr][ingredPos][0] = cache_get_field_content_float(d, "ingPosX");
				IngredientsData[dr][ingredPos][1] = cache_get_field_content_float(d, "ingPosY");
				IngredientsData[dr][ingredPos][2] = cache_get_field_content_float(d, "ingPosZ");
				IngredientsData[dr][ingredType] = cache_get_field_content_int(d, "ingType");
				if(IngredientsData[dr][ingredAmount] < 28){
					IngredientsData[dr][ingredObj] = CreateDynamicObject(19874, IngredientsData[dr][ingredPos][0], IngredientsData[dr][ingredPos][1], IngredientsData[dr][ingredPos][2], 0.0, 0.0, 0.0, IngredientsData[dr][ingredVW], IngredientsData[dr][ingredInt]);
					SetDynamicObjectMaterial(IngredientsData[dr][ingredObj], 0, 1575, "dyn_drugs", IngColors[cache_get_field_content_int(d, "ingModColor")]);
				}

				else if(IngredientsData[dr][ingredAmount] < 112){
					IngredientsData[dr][ingredObj] = CreateDynamicObject(2891, IngredientsData[dr][ingredPos][0], IngredientsData[dr][ingredPos][1], IngredientsData[dr][ingredPos][2], 0.0, 0.0, 0.0, IngredientsData[dr][ingredVW], IngredientsData[dr][ingredInt]);
					SetDynamicObjectMaterial(IngredientsData[dr][ingredObj], 0, 1575, "dyn_drugs", IngColors[cache_get_field_content_int(d, "ingModColor")]);
				}
				else
				{
					IngredientsData[dr][ingredObj] = CreateDynamicObject(1279, IngredientsData[dr][ingredPos][0], IngredientsData[dr][ingredPos][1], IngredientsData[dr][ingredPos][2], 0.0, 0.0, 0.0, IngredientsData[dr][ingredVW], IngredientsData[dr][ingredInt]);
					SetDynamicObjectMaterial(IngredientsData[dr][ingredObj], 0, 1575, "dyn_drugs", IngColors[cache_get_field_content_int(d, "ingModColor")]);
				}
				break;
			}
		}
	}
	printf("%d loaded ingredients", cache_num_rows());
	return true;
}

stock CancelIngMenu(playerid)
{
	for(new i=0; i < sizeof(DrugCombine); i++)
		TextDrawHideForPlayer(playerid, DrugCombine[i]);
	for(new i=0; i < sizeof(DrugCombineP[]); i++)
		PlayerTextDrawHide(playerid, DrugCombineP[playerid][i]);
	return true;
}

RCRP::InValidDrugLoc(playerid)
{
	new cookerObj[6] = {2017, 2135, 2144, 2170, 2339, 2417};
	if(IsInHouseID[playerid] != -1) {
		for(new f = 0; f < MAX_HFURNITURE; f++) {
			for(new a = 0; a < 6; a++) {
				if(HouseData[IsInHouseID[playerid]][FurnModel][f] == cookerObj[a]) {
					new Float:oP[3];
					GetDynamicObjectPos(HouseData[IsInHouseID[playerid]][FurnObject][f], oP[0], oP[1], oP[2]);
					if(IsPlayerInRangeOfPoint(playerid, 2.0, oP[0], oP[1], oP[2]))
						return 1;
				}
			}
		}
	}
	else SysMsg(playerid, "Você precisa estar dentro de uma propriedade para usar esse comando.");
	return false;
}

stock IsDruggedUp(playerid)
{
	for(new dr = 0; dr < 10; dr++)
	{
		if(DrugsTaken[playerid][dr] > 0)
		{
			return true;
		}
	}
	return false;
}
//Fim dos comandos de drogas
