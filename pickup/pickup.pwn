public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	if(IsPlayerSpawned(playerid)) UnlockAchievement(playerid, 2);
	new i = 0;

	for(i = 0; i < MAX_HOUSES; i++)
	{
		if(pickupid == HouseData[i][HousePickup])
		{
			if(HouseData[i][HouseOwnerSQLID] == 0)
			{
				format(gstr, sizeof(gstr),"~R~Casa a venda ~Y~%s~N~~W~Valor: ~G~$%s~N~~W~Para comprar use /comprarcasa",HouseData[i][HouseDescription], format_cash(HouseData[i][HousePrice]));
				ShowInfoText(playerid, gstr, 5000);
			}
			else if(HouseData[i][HouseOwnerSQLID] == -5)
			{
				format(gstr, sizeof(gstr),"~Y~%s~N~~W~SA Trading",HouseData[i][HouseDescription]);
				ShowInfoText(playerid, gstr, 5000);
			}
			else
			{
				format(gstr, sizeof(gstr),"~Y~%s~N~~W~Dono: ~G~%s",HouseData[i][HouseDescription],GetSQLName(HouseData[i][HouseOwnerSQLID]));
				ShowInfoText(playerid, gstr, 5000);
			}
			if(IsDelivering[playerid] == 1 && HasPizza{playerid})
			{
				for(new x = 0; x < 10; x++)
				{
					if(PizzaHomes[playerid][x] == i)
					{
						new tip = random(200);
						RemovePlayerAttachedObject(playerid, PizzaIndex[playerid]);
						SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

						format(sgstr, sizeof(sgstr),"* %s entrega uma pizza para %s. *", NameRP(playerid), HouseData[i][HouseDescription]);
						ProxDetector(20.0,playerid,sgstr, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE, COLOR_EMOTE);

						GivePlayerCash(playerid, tip);
						PizzaIndex[playerid] = -1;
						PizzaHomes[playerid][x] = -1;
						HasPizza{playerid} = false;
						DestroyDynamicMapIcon(PizzaMarkers[playerid][x]);
						PizzaMarkers[playerid][x] = -1;

						if(GetPlayerPizzaDeliveryCount(playerid) == 0)
						{
							SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Você entregou a pizza para %s e recebeu $%i de gorjeta.", HouseData[i][HouseDescription], tip);
							SendClientMessage(playerid, COLOR_LIGHTGREEN, "Você terminou de entregar todas as suas pizzas. Por favor, volte para o Montgomery Pizza Stack para cobrar seu salário.");
							SetPlayerCheckpointEx(playerid, 1377.9711, 269.0072, 19.5669, 4.0);
							DeliverIndex[playerid] = 1;
						}
						else SendClientMessageF(playerid, COLOR_LIGHTGREEN, "Você entregou a pizza para %s e recebeu $%i de gorjeta. Use /entregarcasas para encontrar a sua próxima casa.", HouseData[i][HouseDescription], tip);
						break;
					}
				}
			}
			return true;
		}
	}
	for(i = 0; i < MAX_BIZZ; i++)
	{
		if(pickupid == BizzData[i][BizzPickup])
		{
			if(BizzData[i][BizzOwnerSQLID] == 0)
			{
				format(gstr, sizeof(gstr),"~B~%s~N~~R~A venda! ~W~Valor: ~G~$%s ~W~Pagamento: ~G~$%s~N~~W~Use /comprarempresa para comprar este negocio!",BizzData[i][BizzDescription],format_cash(BizzData[i][BizzPrice]),format_cash(BizzData[i][Payout]));
				ShowInfoText(playerid, gstr, 5000);
			}
			else if(BizzData[i][BizzOwnerSQLID] == -5)
			{
				format(gstr, sizeof(gstr),"~B~%s~N~~W~Dono: SA Trading ~N~~W~Escreva /entrar para entrar. Taxa de entrada: ~G~$%i",BizzData[i][BizzDescription],BizzData[i][EnterFee]);
				ShowInfoText(playerid, gstr, 5000);
			}
			else
			{
				if(BizzData[i][BizzType] > 0 || BizzData[i][IsSpecial] == 1)
				{
					format(gstr, sizeof(gstr),"~B~%s~N~~W~Dono: ~G~%s~N~~W~Escreva /entrar para entrar. Taxa de entrada: ~G~$%i",BizzData[i][BizzDescription],GetSQLName(BizzData[i][BizzOwnerSQLID]),BizzData[i][EnterFee]);
					ShowInfoText(playerid, gstr, 5000);
				}
				if(BizzData[i][BizzType] == BIZZ_TYPE_STATIC && BizzData[i][IsSpecial] == 0)
				{
					format(gstr, sizeof(gstr),"~B~%s~N~~W~Dono: ~G~%s",BizzData[i][BizzDescription],GetSQLName(BizzData[i][BizzOwnerSQLID]));
					ShowInfoText(playerid, gstr, 5000);
				}
			}
			return true;
		}
	}
//============================== Pickups ======================================//

	for(i = 0; i < MAX_GARAGES; i++)
	{
		if(pickupid == GarageData[i][GaragePickup])
		{
			new h = GarageData[i][gHouseID];
			format(gstr, sizeof(gstr), "~Y~Garagem da casa de %s~N~~W~Escreva /entrar para entrar", HouseData[h][HouseDescription]);
			ShowInfoText(playerid, gstr, 5000);
			return true;
		}
	}
//Hospital montgomery
//==============================================================================//
	for(i = 0; i < sizeof(extmonthosp); i++)
	{
		if(pickupid == extmonthosp[i])
		{
			ShowInfoText(playerid, "~R~Montgomery Hospital~N~~W~Use /entrar", 5000);
			return true;
		}
	}
//==============================================================================//Interior FD
	for(i = 0; i < sizeof(pickup1); i++)
	{
		if(pickupid == pickup1[i])
		{
			ShowInfoText(playerid, "~R~SACFD health~N~~W~Use /health", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(pickup2); i++)
	{
		if(pickupid == pickup2[i])
		{
			ShowInfoText(playerid, "~R~SACFD Uniformes~N~~W~ /uniforme", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(pickup3); i++)
	{
		if(pickupid == pickup3[i])
		{
			ShowInfoText(playerid, "~R~Red County Fire Departament~N~~W~Escreva /entrar para entrar~N~~W~", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(pickup4); i++)
	{
		if(pickupid == pickup4[i])
		{
			ShowInfoText(playerid, "~R~FD Garagem~N~~W~Escreva /sair para sair~N~~W~", 5000);
			return true;
		}
	}
//==============================================================================//
	for(i = 0; i < sizeof(pickusilvert); i++)
	{
		if(pickupid == pickusilvert[i])
		{
			ShowInfoText(playerid, "~b~SA Trading~N~~W~Escreva /propriedades~N~~W~", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(pickupbanco); i++)
	{
		if(pickupid == pickupbanco[i])
		{
			ShowInfoText(playerid, "~b~BANCO~N~~W~Escreva /banco para acessar sua conta~N~~W~", 5000);
			return true;
		}
	}
//==============================================================================//elite truck
	for(i = 0; i < sizeof(eltruck); i++)
	{
		if(pickupid == eltruck[i])
		{
			ShowInfoText(playerid, "~b~Elite Trucking~N~~p~Inicie o trabalho: ~W~/truck", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(eltruck1); i++)
	{
		if(pickupid == eltruck1[i])
		{
			ShowInfoText(playerid, "~b~Elite Trucking acesso de veiculos~N~~w~Escreva /entrar para entrar", 5000);
			return true;
		}
	}
//==============================================================================//all

	for(i = 0; i < sizeof(pickworkjob); i++)
	{
		if(pickupid == pickworkjob[i])
		{
			ShowInfoText(playerid, "~g~Reciclagem e Manutencao ~N~~W~Use /trabalho~N~~W~Use /esvaziarsaco", 5000);//
			return true;
		}
	}
	for(i = 0; i < sizeof(prefeituraangel); i++)
	{
		if(pickupid == prefeituraangel[i])
		{
			ShowInfoText(playerid, "~B~Angel Pine Prefeitura~N~~W~Use /entrar", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(prefeiturapal); i++)
	{
		if(pickupid == prefeiturapal[i])
		{
			ShowInfoText(playerid, "~B~Palomino Creek Prefeitura~N~~W~Use /entrar", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(prefeiturafor); i++)
	{
		if(pickupid == prefeiturafor[i])
		{
			ShowInfoText(playerid, "~B~Fort Carson Prefeitura~N~~W~Use /entrar", 5000);//Prefeitura Fort Carson
			return true;
		}
	}
	for(i = 0; i < sizeof(anprepalo1); i++)//anuncio andar de baixo
	{
		if(pickupid == anprepalo1[i])
		{
			ShowInfoText(playerid, "~p~Publicidade~N~~g~Anuncio Normal:~N~~w~/an(uncio)~N~~g~Anuncio Privado:~N~~w~/anuncioprivado", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(ansannews); i++)//Anuncio San News
	{
		if(pickupid == ansannews[i])
		{
			ShowInfoText(playerid, "~p~Publicidade SAN Network~N~~g~Anuncio Normal:~N~~w~/an(uncio)~N~~g~Anuncio Privado:~N~~w~/anuncioprivado", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(paydaypalomino); i++)//receber pagamento Palomino creek
	{
		if(pickupid == paydaypalomino[i])
		{
			ShowInfoText(playerid, "~g~Prefeitura~N~~W~/payday [numero]~N~~W~/pagar multa [valor]", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(jobinfopick); i++)//receber pagamento Palomino creek
	{
		if(pickupid == jobinfopick[i])
		{
			ShowInfoText(playerid, "~b~Emprego~N~~W~/ajudatrabalho", 5000);
			return true;
		}
	}

	for(i = 0; i < sizeof(pescapick); i++)//Pesca
	{
		if(pickupid == pescapick[i])
		{
			ShowInfoText(playerid, "~b~Pescaria~N~~W~use /pescar~N~~R~Proibido pesca sem permissao~N~~w~/dpeixe /dtodospeixes /fishes", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(eltpick); i++)//Elite truck
	{
		if(pickupid == eltpick[i])
		{
			ShowInfoText(playerid, "~b~Elete Trucking~N~~g~Gas Station Management~N~~w~/checkfuel~N~~w~/deliverfuel", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(destruirveiculopk); i++)//destruir veiculo
	{
		if(pickupid == destruirveiculopk[i])
		{
			ShowInfoText(playerid, "~r~Destruir veiculos~N~~W~use /destruirveiculo", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(pescapick2); i++)//Pesca
	{
		if(pickupid == pescapick2[i])
		{
			ShowInfoText(playerid, "~b~Loja de pesca~N~~W~Use /comprar /venderpeixes /vendercaixa", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(pedagiopagar); i++)//Pedagios
	{
		if(pickupid == pedagiopagar[i])
		{
			ShowInfoText(playerid, "~g~Pedagio~N~~W~Use /pedagio para passar", 5000);
			return true;
		}
	}



	for(i = 0; i < sizeof(apostapick); i++)//APOSTA
	{
		if(pickupid == apostapick[i])
		{
			ShowInfoText(playerid, "~b~Ajuda apostas~N~~W~Use /aposta~N~~W~Voce pode apostar em numeros de cavalo de 1-5", 5000);
			return true;
		}
	}

//============================== policia ======================================//

	for(i = 0; i < sizeof(helthAduty); i++)
	{
		if(pickupid == helthAduty[i])
		{
			ShowInfoText(playerid, "~B~Police Saude e Colete~N~~W~Use /health", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(pickAduty); i++)
	{
		if(pickupid == pickAduty[i])
		{
			ShowInfoText(playerid, "~B~Police Computer~N~~W~Trabalhar:~Y~ /duty~N~~W~Ver Criminosos:~Y~ /procurados~N~~W~Computador:~Y~ /mdc", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(cctvPick); i++)
	{
		if(pickupid == cctvPick[i])
		{
			ShowInfoText(playerid, "~B~Sistema de vigilancia policial~N~~W~ /cctv", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(swatPick); i++)
	{
		if(pickupid == swatPick[i])
		{
			ShowInfoText(playerid, "~B~Swat Duty~N~~W~ /swat", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(copskinPick); i++)
	{
		if(pickupid == copskinPick[i])
		{
			ShowInfoText(playerid, "~R~Armario~N~~W~ /uniforme", 5000);
			return true;
		}
	}
//==============================================================================//
	for(i = 0; i < sizeof(pegajobPickupID); i++)
	{
		if(pickupid == pegajobPickupID[i])
		{
			ShowInfoText(playerid, "~G~Trabalho Mecanico~N~~W~/pegartrabalho", 5000);//Mecanico
			return true;
		}
	}

	for(i = 0; i < sizeof(pegajob1PickupID); i++)
	{
		if(pickupid == pegajob1PickupID[i])
		{
			ShowInfoText(playerid, "~G~Reciclagem e Manutencao~N~~W~/pegartrabalho", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(pegajob2PickupID); i++)
	{
		if(pickupid == pegajob2PickupID[i])
		{
			ShowInfoText(playerid, "~G~Revendedor de Drogas~N~~W~/pegartrabalho", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(comprardrogasID); i++)
	{
		if(pickupid == comprardrogasID[i])
		{
			ShowInfoText(playerid, "~G~Local do Drogas~N~~g~Substancia:~G~Cocaina~N~~W~/comprardrogas", 5000);
			return true;
		}
	}

//==============================================================================//
	for(i = 0; i < MAX_SQLPICKUPS; i++)
	{
		if(pickupid == PickupData[i][IGPickupID])
		{
			ShowInfoText(playerid, PickupData[i][PickupText], 5000);
			return true;
		}
	}
//==============================================================================//
	for(i = 0; i < sizeof(CompraPickupID); i++)
	{
		if(pickupid == CompraPickupID[i])
		{
			ShowInfoText(playerid, "~Y~/comprar", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(CompraPickup1ID); i++)
	{
		if(pickupid == CompraPickup1ID[i])
		{
			ShowInfoText(playerid, "~G~Loja Geral~N~~W~/Comprar~N~~W~/Comprarbilhete", 5000);
			return true;
		}
	}		
//==============================================================================//
	for(i = 0; i < sizeof(AtmPickupID); i++)
	{
		if(pickupid == AtmPickupID[i])
		{
			ShowInfoText(playerid, "~G~[ATM] Caixa Eletronico~N~~W~/atm", 5000);
			return true;
		}
	}

//==============================================================================//Repair garagem palomino
	for(i = 0; i < sizeof(garagenID); i++)
	{
		if(pickupid == garagenID[i])
		{
			ShowInfoText(playerid, "~B~Repair Garagem~N~~W~/reparar~N~~W~/pegarveiculo~N~~W~/mod", 5000);
			return true;
		}
	}

//==============================================================================//concessionarias
//concessionaria carros
	for(i = 0; i < sizeof(ConcessID); i++)
	{
		if(pickupid == ConcessID[i])
		{
			ShowInfoText(playerid, "~B~Dillimore Veiculos~N~~W~/vercarros~N~~W~/verestoque", 5000);
			return true;
		}
	}
//concessionaria motos
	for(i = 0; i < sizeof(dilimoreMotosID); i++)
	{
		if(pickupid == dilimoreMotosID[i])
		{
			ShowInfoText(playerid, "~B~Dillimore Motocicletas~N~~W~/vermotocicletas~N~~W~/verestoque", 5000);
			return true;
		}
	}
//concessionaria barco
	for(i = 0; i < sizeof(ConceBarcosID); i++)
	{
		if(pickupid == ConceBarcosID[i])
		{
			ShowInfoText(playerid, "~B~Bayside Barcos~N~~W~/verbarcos~N~~W~/verestoque", 5000);
			return true;
		}
	}
//==============================================================================//Dmv

	for(i = 0; i < sizeof(dmvpickup); i++)
	{
		if(pickupid == dmvpickup[i])
		{
			ShowInfoText(playerid, "~P~Montgomery DMV~N~~W~Escreva /entrar para entrar~N~~W~", 5000);
			return true;
		}
	}

//==============================================================================// //Montgomery Center information

	for(i = 0; i < sizeof(centerinfoID); i++)
	{
		if(pickupid == centerinfoID[i])
		{
			ShowInfoText(playerid, "~B~Montgomery Information Center~N~~W~Dono: ~G~Dwayner Marquez~N~~W~Escreva /entrar para entrar. Taxa de entrada: ~G~$0.", 5000);
			return true;
		}
	}

//===================================================================================//Dmv onde usa o comando dmv

	for(i = 0; i < sizeof(dmvcomandopickup); i++)
	{
		if(pickupid == dmvcomandopickup[i])
		{
			ShowInfoText(playerid, "~G~Departamento de Veiculos~N~~W~Auto Escola~N~~B~/dmv~N~~W~", 5000);
			return true;
		}
	}
//==============================================================================//Center info

	for(i = 0; i < sizeof(picklinfoID); i++)
	{
		if(pickupid == picklinfoID[i])
		{
			ShowInfoText(playerid, "~G~~N~~B~Drivers License~N~~W~/licencainfo~N~~W~", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(picklinfo2ID); i++)
	{
		if(pickupid == picklinfo2ID[i])
		{
			ShowInfoText(playerid, "~G~~N~~B~Centro Info~N~~W~/info~N~~W~", 5000);
			return true;
		}
 	}
	for(i = 0; i < sizeof(picklinfo5ID); i++)
	{
		if(pickupid == picklinfo5ID[i])
		{
			ShowInfoText(playerid, "~G~~N~~G~Trabalho de Taxista~N~~W~/pegartrabalho~N~~W~", 5000);
			return true;
		}
 	}
	for(i = 0; i < sizeof(picklinfo4ID); i++)
	{
		if(pickupid == picklinfo4ID[i])
		{
			ShowInfoText(playerid, "~G~~N~~B~Veiculos a Venda~N~~W~/vendainfo~N~~W~", 5000);
			return true;
		}
 	}
	for(i = 0; i < sizeof(picklinfo1ID); i++)
	{
		if(pickupid == picklinfo1ID[i])
		{
			ShowInfoText(playerid, "~G~~N~~g~Telefone Publico~N~~W~Chamar:~N~~b~/telefonepublico~N~~W~$5 para ligar", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(picklinfo3ID); i++)
	{
		if(pickupid == picklinfo3ID[i])
		{
			ShowInfoText(playerid, "~G~~N~~B~Veiculos de Aluguel~N~~W~/alugarvinfo", 5000);
			return true;
		}
	}

//========================================================//
//Dmv custom
	for(i = 0; i < sizeof(customdmvpickup); i++)
	{
		if(pickupid == customdmvpickup[i])
		{
			ShowInfoText(playerid, "~G~~N~~R~Registro Privado~N~~W~/customreg~N~~W~", 5000);
			return true;
		}
	}
//-------------------Pickup Lojas------------------------//
	for(i = 0; i < sizeof(bincopickupID); i++)
	{
		if(pickupid == bincopickupID[i])
		{
			ShowInfoText(playerid, "~G~~N~~R~Loja de Roupas~N~~W~/comprarroupas~N~~W~", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(prolapspickupID); i++)
	{
		if(pickupid == prolapspickupID[i])
		{
			ShowInfoText(playerid, "~G~~N~~R~Loja de Roupas~N~~W~/comprarroupas~N~~W~", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(deidepickupID); i++)
	{
		if(pickupid == deidepickupID[i])
		{
			ShowInfoText(playerid, "~G~~N~~R~Loja de Roupas~N~~W~/comprarroupas~N~~W~", 5000);
			return true;
		}
	}
	for(i = 0; i < sizeof(suburbanpickupID); i++)
	{
		if(pickupid == suburbanpickupID[i])
		{
			ShowInfoText(playerid, "~G~~N~~R~Loja de Roupas~N~~W~/comprarroupas~N~~W~", 5000);
			return true;
		}
	}

//-------------------------------------------------------------------------------------------------------//
	for(i = 0; i < MAX_BUSSTOPS; i++)
	{
		if(pickupid == BusPickupID[i])
		{
			KillTimer(TextTimer[playerid]);
			format(gstr, sizeof(gstr), "Ponto de Onibus ~W~%s", BusStopDescription[i]);

			new closestPlayer = -1, closestIdx = MAX_BUSSTOPS;
			foreach(new p: Player)
			{
				if(IsDrivingBus{p} && BusRouteIndex[p] <= i)
				{
					closestPlayer = p;
					if(BusRouteIndex[p] < closestIdx) closestIdx = BusRouteIndex[p];
				}
			}

			if(closestPlayer >= 0)
			{
				new dueTime[54], dueH = gServerHour, dueM = gServerMinute;
				dueM += (i - BusRouteIndex[closestPlayer]);
				if(dueM >= 60)
				{
					dueM -= 60;
					dueH ++;
					if(dueH > 23)
					{
						dueM = 0;
					}
				}

				format(dueTime, sizeof(dueTime), "~N~~Y~Nenhum Onibus em rota ~W~%02d:%02d~N~/verrota", dueH, dueM);
				strcat(gstr, dueTime);
			}
			else strcat(gstr, "~N~~Y~Nenhum Onibus em rota~N~~W~/verrota");

			ShowInfoText(playerid, gstr, 5000);
			return true;
		}
	}

	for(i = 0; i < MAX_MOTELROOMS; i++)
	{
		if(pickupid == MotelData[i][RoomPickupID])
		{
			format(gstr, sizeof(gstr),"~B~Quarto de Motel~n~~w~Alugado por: ~g~%s~n~~w~Escreva /enter para entrar no local",GetSQLName(MotelData[i][RoomOwner]));
			ShowInfoText(playerid, gstr, 5000);
			return true;
		}
	}

	return true;
}
