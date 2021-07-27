﻿--[[---------------------------------------------------------------------------
DarkRP custom entities
---------------------------------------------------------------------------

This file contains your custom entities.
This file should also contain entities from DarkRP that you edited.

Note: If you want to edit a default DarkRP entity, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the entity to this file and edit it.

The default entities can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua#L111

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomEntityFields

Add entities under the following line:
---------------------------------------------------------------------------]]


		DarkRP.createEntity("Денежный принтер", {
		ent = "money_printer2",
		model = "models/props_c17/consolebox01a.mdl",
		price = 3000,
		max = 1,
		cmd = "gpmp",
})
		DarkRP.createEntity("Бронзовый Денежный принтер", {
		ent = "fg_amber_printer",
		model = "models/props_c17/consolebox01a.mdl",
		price = 1000,
		max = 1,
		cmd = "print1",
})

		DarkRP.createEntity("Сапфировый Денежный принтер", {
		ent = "fg_sapphire_printer",
		model = "models/props_c17/consolebox01a.mdl",
		price = 2000,
		max = 1,
		cmd = "print2",
})

		DarkRP.createEntity("Рубиновый Денежный принтер", {
		ent = "fg_ruby_printer",
		model = "models/props_c17/consolebox01a.mdl",
		price = 5000,
		max = 1,
		cmd = "print3",
})


DarkRP.createEntity("[Premium] Емеральдовый Денежный принтер", {
		ent = "fg_emerald_printer",
		model = "models/props_c17/consolebox01a.mdl",
		price = 6500,
		max = 1,
		cmd = "printprem",
		customCheck = function( ply ) return ply:IsSecondaryUserGroup "premium" end,
		CustomCheckFailMsg = "У вас доожен быть премиум!"
})



DarkRP.createEntity("Плита", {
	ent = "eml_stove",
	model = "models/props_c17/furnitureStove001a.mdl",
	price = 10000,
	max = 10,
	cmd = "buystove",
	allowed = {TEAM_NARK},
})

DarkRP.createEntity("Баллон с газом", {
	ent = "eml_gas",
	model = "models/props_c17/canister01a.mdl",
	price = 2000,
	max = 2,
	cmd = "buygas",
	allowed = {TEAM_NARK},
})

DarkRP.createEntity("Кастрюля", {
	ent = "eml_pot",
	model = "models/props_c17/metalpot001a.mdl",
	price = 1000,
	max = 2,
	cmd = "buypot1",
	allowed = {TEAM_NARK},
})

DarkRP.createEntity("Банка", {
	ent = "eml_jar",
	model = "models/props_lab/jar01a.mdl",
	price = 1000,
	max = 2,
	cmd = "buyjar",
	allowed = {TEAM_NARK},
})


DarkRP.createEntity("Кастрюля под мет", {
	ent = "eml_spot",
	model = "models/props_c17/metalpot001a.mdl",
	price = 1000,
	max = 2,
	cmd = "buyspot",
	allowed = {TEAM_NARK},
})

DarkRP.createEntity("Вода", {
	ent = "eml_water",
	model = "models/props_junk/garbage_plasticbottle003a.mdl",
	price = 500,
	max = 2,
	cmd = "buywater",
	allowed = {TEAM_NARK},
})

DarkRP.createEntity("Соляная кислота", {
	ent = "eml_macid",
	model = "models/props_junk/garbage_plasticbottle001a.mdl",
	price = 500,
	max = 2,
	cmd = "buymacid",
	allowed = {TEAM_NARK},
})

DarkRP.createEntity("Жидкая сера", {
	ent = "eml_sulfur",
	model = "models/props_lab/jar01b.mdl",
	price = 500,
	max = 2,
	cmd = "buysulfur",
	allowed = {TEAM_NARK},
})
DarkRP.createEntity("Жидкий йод", {
	ent = "eml_iodine",
	model = "models/props_lab/jar01b.mdl",
	price = 500,
	max = 2,
	cmd = "buyiodine",
	allowed = {TEAM_NARK},
})
DarkRP.createEntity("Кислота (наркотик для приёма)", {
	ent = "savav_acid",
	model = "models/props_junk/garbage_plasticbottle002a.mdl",
	price = 5000,
	max = 2,
	cmd = "buyacidn",
	allowed = {TEAM_NARK},
})
DarkRP.createEntity("Самогон (наркотик для приёма)", {
	ent = "savav_beer",
	model = "models/props_junk/garbage_glassbottle003a.mdl",
	price = 7500,
	max = 2,
	cmd = "buybeer",
	allowed = {TEAM_NARK},
})
DarkRP.createEntity("Прошлогодний Арбуз (наркотик для приёма)", {
	ent = "savav_watermelon",
	model = "models/props_junk/watermelon01.mdl",
	price = 10000,
	max = 2,
	cmd = "buywatermelon",
	allowed = {TEAM_NARK},
})
DarkRP.createEntity("Просроченный мет (наркотик для приёма)", {
	ent = "savav_meth",
	model = "models/props_junk/glassjug01.mdl",
	price = 15000,
	max = 2,
	cmd = "buybadmeth",
	allowed = {TEAM_NARK},
})
DarkRP.createEntity("Кокс (наркотик для приёма)", {
	ent = "savav_cocaine",
	model = "models/props_junk/garbage_bag001a.mdl",
	price = 20000,
	max = 2,
	cmd = "buycock",
	allowed = {TEAM_NARK},
})
DarkRP.createEntity("Анти-наркотический антидот", {
	ent = "savav_antidtugs",
	model = "models/props_junk/garbage_milkcarton002a.mdl",
	price = 150,
	max = 15,
	cmd = "buyhelpmedrugs",
	allowed = {TEAM_MEDIC},
})
DarkRP.createEntity("Телевизор", {
	ent = "mediaplayer_tv",
	model = "models/props_phx/rt_screen.mdl",
	price = 5000,
	max = 2,
	cmd = "buytv",
	allowed = {TEAM_TRADE},
})
DarkRP.createEntity("Мяч", {
	ent = "sent_soccerball",
	model = "models/props_phx/misc/soccerball.mdl",
	price = 10000,
	max = 2,
	cmd = "buyball",
	allowed = {TEAM_TRADE},
})
DarkRP.createEntity("Тяжелый бронежилет", {
	ent = "ge_armor",
	model = "models/weapons/armor/armor.mdl",
	price = 7000,
	max = 5,
	cmd = "buyarmor",
	allowed = {TEAM_TRADE},
})
DarkRP.createEntity("Рация", {
	ent = "ent_radio",
	model = "models/radio/w_radio.mdl", 	
	price = 5000,
	max = 6,
	cmd = "buyradio",
	allowed = {TEAM_TRADE},
})
DarkRP.createEntity("Вейп", {
	ent = "weapon_vape",
	model = "models/swamponions/vape.mdl",
	price = 50000,
	max = 1,
	cmd = "buyvape",
	allowed = {TEAM_TRADE},
})
DarkRP.createEntity("Многовкусовой вейп", {
	ent = "weapon_vape_juicy",
	model = "models/swamponions/vape.mdl",
	price = 75000,
	max = 1,
	cmd = "buyvape2",
	allowed = {TEAM_TRADE},
})
DarkRP.createEntity("Нелегальный вейп", {
	ent = "weapon_vape_hallucinogenic",
	model = "models/swamponions/vape.mdl",
	price = 125000,
	max = 1,
	cmd = "buyvape3",
	allowed = {TEAM_TRADE},
})

	if SERVER then


		hook.Add("playerBoughtCustomEntity", "awdAWdAWDAWDAWD??!", function(pl, tab, ent)


			if tab.ent == "mediaplayer_tv" then

				ent:SetModel(tab.model)
				ent:SetPos(ent:GetPos())
				ent:PhysicsInit(SOLID_VPHYSICS)
				ent:SetMoveType(MOVETYPE_VPHYSICS)
				ent.ppwhite = true
			end
		end)
	end

--


    DarkRP.createEntity("Печь", {
        ent = "cm_stove",
        model = "models/props_wasteland/kitchen_stove002a.mdl",
        price = 750,
        max = 2,
        cmd = "buycmstove",
        allowed = TEAM_COOK
    })

     DarkRP.createEntity("Мука", {
        ent = "cm_flour",
        model = "models/props_misc/flour_sack-1.mdl",
        price = 50,
        max = 3,
        cmd = "buyflour",
        allowed = TEAM_COOK
    })



--[[ BITMINERS --]]

DarkRP.createEntity("Полка Битмайнера", {
    ent = "ch_bitminer_shelf",
    model = "models/craphead_scripts/bitminers/rack/rack.mdl",
    price = 7500,
    max = 1,
    cmd = "buyminingshelf",
	allowed = {TEAM_BITCOIN}
})
DarkRP.createEntity("Дополнительный Майнер", {
    ent = "ch_bitminer_upgrade_miner",
    model = "models/craphead_scripts/bitminers/utility/miner_solo.mdl",
    price = 350,
    max = 8,
    cmd = "buysingleminer",
	allowed = {TEAM_BITCOIN}
})

DarkRP.createEntity("Электрический Кабель", {
    ent = "ch_bitminer_power_cable",
    model = "models/craphead_scripts/bitminers/utility/plug.mdl",
    price = 200,
    max = 5,
    cmd = "buypowercable",
	allowed = {TEAM_BITCOIN}
})
DarkRP.createEntity("Удленитель", {
    ent = "ch_bitminer_power_combiner",
    model = "models/craphead_scripts/bitminers/power/power_combiner.mdl",
    price = 200,
    max = 1,
    cmd = "buypowercombiner",
	allowed = {TEAM_BITCOIN}
})
DarkRP.createEntity("Улучшение Блока Питания", {
    ent = "ch_bitminer_upgrade_ups",
    model = "models/craphead_scripts/bitminers/utility/ups_solo.mdl",
    price = 1000,
    max = 4,
    cmd = "buyupsupgrade",
	allowed = {TEAM_BITCOIN}
})

DarkRP.createEntity("Охлаждение первого уровня", {
    ent = "ch_bitminer_upgrade_cooling1",
    model = "models/craphead_scripts/bitminers/utility/cooling_upgrade_1.mdl",
    price = 5000,
    max = 1,
    cmd = "buycooling1",
	allowed = {TEAM_BITCOIN}
})
DarkRP.createEntity("Охлаждение второго уровня", {
    ent = "ch_bitminer_upgrade_cooling2",
    model = "models/craphead_scripts/bitminers/utility/cooling_upgrade_2.mdl",
    price = 6000,
    max = 1,
    cmd = "buycooling2",
	allowed = {TEAM_BITCOIN}
})	
DarkRP.createEntity("Охлаждение третьего уровня", {
    ent = "ch_bitminer_upgrade_cooling3",
    model = "models/craphead_scripts/bitminers/utility/cooling_upgrade_3.mdl",
    price = 7000,
    max = 1,
    cmd = "buycooling3",
	allowed = {TEAM_BITCOIN}
})

DarkRP.createEntity("Дизельный Генератор", {
    ent = "ch_bitminer_power_generator",
    model = "models/craphead_scripts/bitminers/power/generator.mdl",
    price = 1500,
    max = 4,
    cmd = "buypowergenerator",
	allowed = {TEAM_BITCOIN}
})
DarkRP.createEntity("Дизель - 50%", {
    ent = "ch_bitminer_power_generator_fuel_small",
    model = "models/craphead_scripts/bitminers/utility/jerrycan.mdl",
    price = 1500,
    max = 5,
    cmd = "buygeneratorfuelsmall",
	allowed = {TEAM_BITCOIN}
})	
--[[
DarkRP.createEntity("Дизель - 75%", {
    ent = "ch_bitminer_power_generator_fuel_medium",
    model = "models/craphead_scripts/bitminers/utility/jerrycan.mdl",
    price = 1000,
    max = 5,
    cmd = "buygeneratorfuelmedium",
	allowed = {TEAM_BITCOIN}
})
DarkRP.createEntity("Дизель - 100%", {
    ent = "ch_bitminer_power_generator_fuel_large",
    model = "models/craphead_scripts/bitminers/utility/jerrycan.mdl",
    price = 1500,
    max = 5,
    cmd = "buygeneratorfuellarge",
	allowed = {TEAM_BITCOIN}
}) --]]

DarkRP.createEntity("Портативный Ядерный Реактор", {
    ent = "ch_bitminer_power_rtg",
    model = "models/craphead_scripts/bitminers/power/rtg.mdl",
    price = 4500,
    max = 2,
    cmd = "buynucleargenerator",
	allowed = {TEAM_BITCOIN}
})  
	
DarkRP.createEntity("Солнечная Панель", {
    ent = "ch_bitminer_power_solar",
    model = "models/craphead_scripts/bitminers/power/solar_panel.mdl",
    price = 3000,
    max = 2,
    cmd = "buysolarpanel",
	allowed = {TEAM_BITCOIN}
})
DarkRP.createEntity("Средство для Отчистки Панелей", {
    ent = "ch_bitminer_upgrade_clean_dirt",
    model = "models/craphead_scripts/bitminers/cleaning/spraybottle.mdl",
    price = 500,
    max = 5,
    cmd = "buydirtcleanfluid",
	allowed = {TEAM_BITCOIN}
})	

DarkRP.createEntity("RGB лента", {
    ent = "ch_bitminer_upgrade_rgb",
    model = "models/craphead_scripts/bitminers/utility/rgb_kit.mdl",
    price = 10000,
    max = 8,
    cmd = "buyrgbkit",
	allowed = {TEAM_BITCOIN}
})