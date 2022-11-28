-----------------------------------
-- Area: Eastern Adoulin (257)
--  NPC: Chamlele
-- Type: Temp Trade
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------


-----------------------------------
-- Temp Trades
-----------------------------------
local itemTrades =
{

[	1	] = {trade = {	26740	, {4059, 5}}, reward =	26741	}, -- 	boii mask +1
[	2	] = {trade = {	26742	, {4059, 5}}, reward =	26743	}, -- 	bhikku crown +1
[	3	] = {trade = {	26744	, {4059, 5}}, reward =	26745	}, -- 	ebers cap +1
[	4	] = {trade = {	26746	, {4059, 5}}, reward =	26747	}, -- 	wicce petasos +1
[	5	] = {trade = {	26748	, {4059, 5}}, reward =	26749	}, -- 	lethargy chappel +1
[	6	] = {trade = {	26750	, {4059, 5}}, reward =	26751	}, -- 	skulker's bonnet +1
[	7	] = {trade = {	26752	, {4059, 5}}, reward =	26753	}, -- 	chevalier's armet +1
[	8	] = {trade = {	26754	, {4059, 5}}, reward =	26755	}, -- 	heathen's burgonet +1
[	9	] = {trade = {	26756	, {4059, 5}}, reward =	26757	}, -- 	nukumi cabasset +1
[	10	] = {trade = {	26758	, {4059, 5}}, reward =	26759	}, -- 	fili calot +1
[	11	] = {trade = {	26760	, {4059, 5}}, reward =	26761	}, -- 	amini gapette +1
[	12	] = {trade = {	26762	, {4059, 5}}, reward =	26763	}, -- 	kasuga kabuto +1
[	13	] = {trade = {	26764	, {4059, 5}}, reward =	26765	}, -- 	hattori zukin +1
[	14	] = {trade = {	26766	, {4059, 5}}, reward =	26767	}, -- 	peltast's mezail +1
[	15	] = {trade = {	26768	, {4059, 5}}, reward =	26769	}, -- 	beckoner's horn +1
[	16	] = {trade = {	26770	, {4059, 5}}, reward =	26771	}, -- 	hashishin kavuk +1
[	17	] = {trade = {	26772	, {4059, 5}}, reward =	26773	}, -- 	chasseur's tricorne +1
[	18	] = {trade = {	26774	, {4059, 5}}, reward =	26775	}, -- 	karagoz capello +1
[	19	] = {trade = {	26776	, {4059, 5}}, reward =	26777	}, -- 	maculele tiara +1
[	20	] = {trade = {	26778	, {4059, 5}}, reward =	26779	}, -- 	arbatel bonnet +1
[	21	] = {trade = {	26780	, {4059, 5}}, reward =	26781	}, -- 	azimuth hood +1
[	22	] = {trade = {	26782	, {4059, 5}}, reward =	26783	}, -- 	erilaz galea +1
[	23	] = {trade = {	26898	, {4059, 5}}, reward =	26899	}, -- 	boii lorica +1
[	24	] = {trade = {	26900	, {4059, 5}}, reward =	26901	}, -- 	bhikku cyclas +1
[	25	] = {trade = {	26902	, {4059, 5}}, reward =	26903	}, -- 	ebers bliaud +1
[	26	] = {trade = {	26904	, {4059, 5}}, reward =	26905	}, -- 	wicce coat +1
[	27	] = {trade = {	26906	, {4059, 5}}, reward =	26907	}, -- 	lethargy sayon +1
[	28	] = {trade = {	26908	, {4059, 5}}, reward =	26909	}, -- 	skulker's vest +1
[	29	] = {trade = {	26910	, {4059, 5}}, reward =	26911	}, -- 	chevalier's cuirass +1
[	30	] = {trade = {	26912	, {4059, 5}}, reward =	26913	}, -- 	heathen's cuirass +1
[	31	] = {trade = {	26914	, {4059, 5}}, reward =	26915	}, -- 	nukumi gausape +1
[	32	] = {trade = {	26916	, {4059, 5}}, reward =	26917	}, -- 	fili hongreline +1
[	33	] = {trade = {	26918	, {4059, 5}}, reward =	26919	}, -- 	amini caban +1
[	34	] = {trade = {	26920	, {4059, 5}}, reward =	26921	}, -- 	kasuga domaru +1
[	35	] = {trade = {	26922	, {4059, 5}}, reward =	26923	}, -- 	hattori ningi +1
[	36	] = {trade = {	26924	, {4059, 5}}, reward =	26925	}, -- 	peltast's plackart +1
[	37	] = {trade = {	26926	, {4059, 5}}, reward =	26927	}, -- 	beckoner's doublet +1
[	38	] = {trade = {	26928	, {4059, 5}}, reward =	26929	}, -- 	hashishin mintan +1
[	39	] = {trade = {	26930	, {4059, 5}}, reward =	26931	}, -- 	chasseur's frac +1
[	40	] = {trade = {	26932	, {4059, 5}}, reward =	26933	}, -- 	karagoz farsetto +1
[	41	] = {trade = {	26934	, {4059, 5}}, reward =	26935	}, -- 	maculele casaque +1
[	42	] = {trade = {	26936	, {4059, 5}}, reward =	26937	}, -- 	arbatel gown +1
[	43	] = {trade = {	26938	, {4059, 5}}, reward =	26939	}, -- 	azimuth coat +1
[	44	] = {trade = {	26940	, {4059, 5}}, reward =	26941	}, -- 	erilaz surcoat +1
[	45	] = {trade = {	27052	, {4059, 5}}, reward =	27053	}, -- 	boii mufflers +1
[	46	] = {trade = {	27054	, {4059, 5}}, reward =	27055	}, -- 	bhikku gloves +1
[	47	] = {trade = {	27056	, {4059, 5}}, reward =	27057	}, -- 	ebers mitts +1
[	48	] = {trade = {	27058	, {4059, 5}}, reward =	27059	}, -- 	wicce gloves +1
[	49	] = {trade = {	27060	, {4059, 5}}, reward =	27061	}, -- 	lethargy gantherots +1
[	50	] = {trade = {	27062	, {4059, 5}}, reward =	27063	}, -- 	skulker's armlets +1
[	51	] = {trade = {	27064	, {4059, 5}}, reward =	27065	}, -- 	chevalier's gauntlets +1
[	52	] = {trade = {	27066	, {4059, 5}}, reward =	27067	}, -- 	heathen's gauntlets +1
[	53	] = {trade = {	27068	, {4059, 5}}, reward =	27069	}, -- 	nukumi manoplas +1
[	54	] = {trade = {	27070	, {4059, 5}}, reward =	27071	}, -- 	fili manchettes +1
[	55	] = {trade = {	27072	, {4059, 5}}, reward =	27073	}, -- 	amini glovelettes +1
[	56	] = {trade = {	27074	, {4059, 5}}, reward =	27075	}, -- 	kasuga kote +1
[	57	] = {trade = {	27076	, {4059, 5}}, reward =	27077	}, -- 	hattori tekko +1
[	58	] = {trade = {	27078	, {4059, 5}}, reward =	27079	}, -- 	peltast's vambraces +1
[	59	] = {trade = {	27080	, {4059, 5}}, reward =	27081	}, -- 	beckoner's bracers +1
[	60	] = {trade = {	27082	, {4059, 5}}, reward =	27083	}, -- 	hashishin bazubands +1
[	61	] = {trade = {	27084	, {4059, 5}}, reward =	27085	}, -- 	chasseur's gants +1
[	62	] = {trade = {	27086	, {4059, 5}}, reward =	27087	}, -- 	karagoz guanti +1
[	63	] = {trade = {	27088	, {4059, 5}}, reward =	27089	}, -- 	maculele bangles +1
[	64	] = {trade = {	27090	, {4059, 5}}, reward =	27091	}, -- 	arbatel bracers +1
[	65	] = {trade = {	27092	, {4059, 5}}, reward =	27093	}, -- 	azimuth gloves +1
[	66	] = {trade = {	27094	, {4059, 5}}, reward =	27095	}, -- 	erilaz gauntlets +1
[	67	] = {trade = {	27237	, {4059, 5}}, reward =	27238	}, -- 	boii cuisses +1
[	68	] = {trade = {	27239	, {4059, 5}}, reward =	27240	}, -- 	bhikku hose +1
[	69	] = {trade = {	27241	, {4059, 5}}, reward =	27242	}, -- 	ebers pantaloons +1
[	70	] = {trade = {	27243	, {4059, 5}}, reward =	27244	}, -- 	wicce chausses +1
[	71	] = {trade = {	27245	, {4059, 5}}, reward =	27246	}, -- 	lethargy fuseau +1
[	72	] = {trade = {	27247	, {4059, 5}}, reward =	27248	}, -- 	skulker's culottes +1
[	73	] = {trade = {	27249	, {4059, 5}}, reward =	27250	}, -- 	chevalier's cuisses +1
[	74	] = {trade = {	27251	, {4059, 5}}, reward =	27252	}, -- 	heathen's flanchard +1
[	75	] = {trade = {	27253	, {4059, 5}}, reward =	27254	}, -- 	nukumi quijotes +1
[	76	] = {trade = {	27255	, {4059, 5}}, reward =	27256	}, -- 	fili rhingrave +1
[	77	] = {trade = {	27257	, {4059, 5}}, reward =	27258	}, -- 	amini brague +1
[	78	] = {trade = {	27259	, {4059, 5}}, reward =	27260	}, -- 	kasuga haidate +1
[	79	] = {trade = {	27261	, {4059, 5}}, reward =	27262	}, -- 	hattori hakama +1
[	80	] = {trade = {	27263	, {4059, 5}}, reward =	27264	}, -- 	peltast's cuissots +1
[	81	] = {trade = {	27265	, {4059, 5}}, reward =	27266	}, -- 	beckoner's spats +1
[	82	] = {trade = {	27267	, {4059, 5}}, reward =	27268	}, -- 	hashishin tayt +1
[	83	] = {trade = {	27269	, {4059, 5}}, reward =	27270	}, -- 	chasseur's culottes +1
[	84	] = {trade = {	27271	, {4059, 5}}, reward =	27272	}, -- 	karagoz pantaloni +1
[	85	] = {trade = {	27273	, {4059, 5}}, reward =	27274	}, -- 	maculele tights +1
[	86	] = {trade = {	27275	, {4059, 5}}, reward =	27276	}, -- 	arbatel pants +1
[	87	] = {trade = {	27277	, {4059, 5}}, reward =	27278	}, -- 	azimuth tights +1
[	88	] = {trade = {	27279	, {4059, 5}}, reward =	27280	}, -- 	erilaz leg guards +1
[	89	] = {trade = {	27411	, {4059, 5}}, reward =	27412	}, -- 	boii calligae +1
[	90	] = {trade = {	27413	, {4059, 5}}, reward =	27414	}, -- 	bhikku gaiters +1
[	91	] = {trade = {	27415	, {4059, 5}}, reward =	27416	}, -- 	ebers duckbills +1
[	92	] = {trade = {	27417	, {4059, 5}}, reward =	27418	}, -- 	wicce sabots +1
[	93	] = {trade = {	27419	, {4059, 5}}, reward =	27420	}, -- 	lethargy houseaux +1
[	94	] = {trade = {	27421	, {4059, 5}}, reward =	27422	}, -- 	skulker's poulaines +1
[	95	] = {trade = {	27423	, {4059, 5}}, reward =	27424	}, -- 	chevalier's sabatons +1
[	96	] = {trade = {	27425	, {4059, 5}}, reward =	27426	}, -- 	heathen's sollerets +1
[	97	] = {trade = {	27427	, {4059, 5}}, reward =	27428	}, -- 	nukumi ocreae +1
[	98	] = {trade = {	27429	, {4059, 5}}, reward =	27430	}, -- 	fili cothurnes +1
[	99	] = {trade = {	27431	, {4059, 5}}, reward =	27432	}, -- 	amini bottillons +1
[	100	] = {trade = {	27433	, {4059, 5}}, reward =	27434	}, -- 	kasuga sune-ate +1
[	101	] = {trade = {	27435	, {4059, 5}}, reward =	27436	}, -- 	hattori kyahan +1
[	102	] = {trade = {	27437	, {4059, 5}}, reward =	27438	}, -- 	peltast's schynbalds +1
[	103	] = {trade = {	27439	, {4059, 5}}, reward =	27440	}, -- 	beckoner's pigaches +1
[	104	] = {trade = {	27441	, {4059, 5}}, reward =	27442	}, -- 	hashishin basmak +1
[	105	] = {trade = {	27443	, {4059, 5}}, reward =	27444	}, -- 	chasseur's bottes +1
[	106	] = {trade = {	27445	, {4059, 5}}, reward =	27446	}, -- 	karagoz scarpe +1
[	107	] = {trade = {	27447	, {4059, 5}}, reward =	27448	}, -- 	maculele toeshoes +1
[	108	] = {trade = {	27449	, {4059, 5}}, reward =	27450	}, -- 	arbatel loafers +1
[	109	] = {trade = {	27451	, {4059, 5}}, reward =	27452	}, -- 	azimuth gaiters +1
[	110	] = {trade = {	27453	, {4059, 5}}, reward =	27454	}, -- 	erilaz greaves +1

}

function onTrade(player, npc, trade)
	local itemtrades
	local tradedCombo = 0
	
	-- Check for matching trade
	if tradedCombo == 0 then -- and player:getCharVar("KillCounter_Kirin") >= 1 and player:getCharVar("KillCounter_JailofLove") >= 1 then
		for k, v in pairs(itemTrades) do
			if npcUtil.tradeHasExactly(trade, v.trade) then
				tradedCombo = k
				break
			end
		end
	end
	
	-- Found a match
	if tradedCombo > 0 then --  and not player:hasItem(itemTrades[tradedCombo].reward) 
		local ID = zones[player:getZoneID()]
		local reward = itemTrades[tradedCombo].reward
	
		for i = 6, 17 do
			if (tradedCombo == i and player:hasItem(itemTrades[tradedCombo].reward)) then
				player:messageSpecial(ID.text.CANNOT_OBTAIN_MORE)
				return
			end
		end
		
		player:confirmTrade()
		player:addItem(itemTrades[tradedCombo].reward, 1)
		player:messageSpecial(ID.text.ITEM_OBTAINED, itemTrades[tradedCombo].reward)
		player:PrintToPlayer(string.format("Chamulele: Well. There ya go. Augments do not carry over."),tpz.msg.channel.NS_SAY)
	end
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Chamulele: I'm a temporary NPC for upgrading your Empyrean Armor to +1 for 5 plutons!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

end
