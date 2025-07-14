local bosses = {
	["grand commander soeren"] = 20212021,
	["grand canon dominus"] = 20212022,
	["preceptor lazare"] = 20212023,
	["grand chaplain gaunder"] = 202120221,
	["dazed leaf golem"] = 202120222,
	["scarlett etzel"] = 202120223,
	["ancient spawn of morgathla"] = 202120224,
	["urmahlullu the weakened"] = 202120225,
	["the nightmare beast"] = 202120226,
	["faceless bane"] = 202120227,
	["grand master oberon"] = 202120228,
	["brokul"] = 202120229,
	["alptramun"] = 202120219,
	["izcandar the banished"] = 120212022,
	["maxxenius"] = 220212022,
	["malofur mangrinder"] = 320212022,
	["plagueroot"] = 420212022,
	["dragon"] = 520212022,
	["fugue"] = 620212022,
	["goshnars cruelty"] = 720212022, --
	["the unwelcome"] = 820212022,
	["the dread maiden"] = 920212022,
	["the pale worm"] = 210212022,
	["the fear feaster"] = 220212022,
	["ratmiral blackwhiskers"] = 230212022,
	["goshnar's malice"] = 240212022, --
	["tentuglys head"] = 250212022,  -- 
	["katex blood tongue"] = 260212022,
	["srezz yellow eyes"] = 270212022,
	["utua stone sting"] = 2710212022,
	["yirkas blue scales"] = 2720212022,
	["irgix the flimsy"] = 2730212022,
	["unaz the mean"] = 2740212022,
	["vok the freakish"] = 2750212022,
	["brain head"] = 2760212022,
	["goshnar's hatred"] = 2770212022, --
	["goshnar's spite"] = 27701212022,
	["goshnar's greed"] = 27702212022,
	["goshnar's megalomania"] = 27703212022,
	["lady tenebris"] = 27704212022,
	["lloyd"] = 27705212022,
	["the enraged thorn knight"] = 27706212022,
	["the last lore keeper"] = 27707212022,
	["the time guardian"] = 27708212022,
	["melting frozen horror"] = 27709212022,
	["soul of dragonking zyrtarch"] = 277019212022,
	["the duke of the depths"] = 277029212022,
	["the count of the core"] = 277039212022,
	["the false god"] = 277049212022,
	["the baron from below"] = 277059212022,
	["the souldespoiler"] = 277069212022,
	["the source of corruption"] = 277079212022,
	["ravennous hunger"] = 277099212022,
	["essence of malice"] = 2770991212022,
	["the unarmored voidborn"] = 27709912212022,
	["the sandking"] = 2770992212022,
	["lord azaram"] = 2770992312022,
	["duke krule"] = 2770992412022,
	["sir baeloc"] = 2770992121022,
	["count vlarkorth"] = 2802112024,
	["king zelos"] = 280212024,
	["gaz'haragoth"] = 280212023,
	["furyosa"] = 280212022,
	["jaul"] = 280212122,
	["obujos"] = 280212222,
	["tanjis"] = 280212322,
	["the percht queen"] = 280212323,
	["lokathmor"] = 28021322,
	["ghulosh"] = 28022322,
	["gorzindel"] = 28012322,
	["mazzinor"] = 28212322,
	["the scourge of oblivion"] = 20212322,
	["earl osam"] = 28021232,
	["the primal menace"] = 280212312,
	["megasylvan yselda"] = 280212322,
	["magma bubble"] = 2802212322,
	["timira the many-headed"] = 2802123222,
	["the brainstealer"] = 28022122322,
	["ahau"] = 2802122322,
	["the monster"] = 2820212322,
	["ferumbras"] = 22802123222,
}

local bosspoint = CreatureEvent("MonsterHunter")
function bosspoint.onDeath(creature)

	local targetName = bosses[creature:getName():lower()]
	if not targetName then
		return true
	end
	
	onDeathForDamagingPlayers(creature, function(creature, player)
	if targetName then
		player:addItem(60273, 1)
        sendChannelMessage(9, TALKTYPE_CHANNEL_O, "The player " .. player:getName() .. " killed a boss and won 1 common casket!")
		end
	end)

	return true
end

bosspoint:register()
