--------------------------------------------------------------
-- func: !TKhelpdesk
-- auth: Barthandalus
-- desc: Randomized tips from TK.
--------------------------------------------------------------

cmdprops =
{
   permission = 0,
   parameters = ""
}

function onTrigger(player, mobId)
	local deckShuffle = math.random(1, 100)
	if deckShuffle == 1 then
		player:PrintToPlayer(string.format("TK: No."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 2 then	
		player:PrintToPlayer(string.format("TK: Have you read the wiki?"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 3 then	
		player:PrintToPlayer(string.format("TK: I'm like 99%% positive that I'm right."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 4 then		
		player:PrintToPlayer(string.format("TK: Have you tried it?"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 5 then	
		player:PrintToPlayer(string.format("TK: I find it hard to believe."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 6 then	
		player:PrintToPlayer(string.format("TK: Maybe this isn't the server for you."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 7 then	
		player:PrintToPlayer(string.format("TK: Screw your meeting."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 8 then	
		player:PrintToPlayer(string.format("TK: I'm going to the gym."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 9 then	
		player:PrintToPlayer(string.format("TK: Scholar is a superior subjob."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 10 then	 
		player:PrintToPlayer(string.format("TK: BAAAAARRRTTTT!"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 11 then	 
		player:PrintToPlayer(string.format("TK: NAAAARRRRRR!"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 12 then	 
		player:PrintToPlayer(string.format("TK: If you're not subbing BLU are you even tanking?"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 13 then	 
		player:PrintToPlayer(string.format("TK: I can turn a PLD with Majesty into a Meta Healer, sub SCH."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 14 then	 
		player:PrintToPlayer(string.format("TK: Seriously though, read the wiki."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 15 then	 
		player:PrintToPlayer(string.format("TK: If you're reading this, you're still alive... for now."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 16 then	 
		player:PrintToPlayer(string.format("TK: Just go home."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 17 then	 
		player:PrintToPlayer(string.format("TK: We aren't going to do that."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 18 then	 
		player:PrintToPlayer(string.format("TK: I've sent this to you before."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 19 then	 
		player:PrintToPlayer(string.format("TK: I need to get my local restaurant supply to tune my stove."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 20 then	 
	    player:PrintToPlayer(string.format("TK: 1 percent HP boost isn't to be scoffed at."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 21 then	 
		player:PrintToPlayer(string.format("TK: It's too early for this."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 22 then	 
		player:PrintToPlayer(string.format("TK: Nar is the mean one."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 23 then	 
		player:PrintToPlayer(string.format("TK: PC characters are superior to trusts."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 24 then	 
		player:PrintToPlayer(string.format("TK: Sublimation is better."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 25 then	 
		player:PrintToPlayer(string.format("TK: Your stats matter more than iLvl."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 26 then	 
		player:PrintToPlayer(string.format("TK: You're*"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 27 then	 
		player:PrintToPlayer(string.format("TK: There's always Ambuscade."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 28 then	 
		player:PrintToPlayer(string.format("TK: There's too many ANMs."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 29 then	 
		player:PrintToPlayer(string.format("TK: There's not enough ANMs."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 30 then	 
		player:PrintToPlayer(string.format("TK: I think mob's should hit harder."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 31 then	 
		player:PrintToPlayer(string.format("TK: -DT is your best friend."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 32 then	 
		player:PrintToPlayer(string.format("TK: If you can't face death, are you actually a Runefencer?"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 33 then	 
		player:PrintToPlayer(string.format("TK: Death is a learning experience, is not my quote."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 34 then	 
		player:PrintToPlayer(string.format("TK: People play here, find its challenging, and quit. Don't quit."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 35 then	 
		player:PrintToPlayer(string.format("TK: I love you Bart."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 36 then	 
		player:PrintToPlayer(string.format("TK: F&%%# you Bart."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 37 then	 
		player:PrintToPlayer(string.format("TK: I am working Hard today."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 38 then	 
		player:PrintToPlayer(string.format("TK: DREAM Weapons will be hard to get."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 39 then	 
		player:PrintToPlayer(string.format("TK: I'll get to Bahamut soon."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 40 then	 
		player:PrintToPlayer(string.format("TK: Two PLD, Aegis on both, send in 10 Shiva's."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 41 then	 
		player:PrintToPlayer(string.format("TK: Tip 1, git gud. "),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 42 then	 
		player:PrintToPlayer(string.format("TK: Can't win if you don't play."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 43 then	 
		player:PrintToPlayer(string.format("TK: It's intentional."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 44 then	 
		player:PrintToPlayer(string.format("TK: Hear me out."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 45 then	 
		player:PrintToPlayer(string.format("TK: Neat."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 46 then	 
		player:PrintToPlayer(string.format("TK: Why does everyone think I am mean?"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 47 then	 
		player:PrintToPlayer(string.format("TK: The level of meme entries is painfully disappointing."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 48 then	 
		player:PrintToPlayer(string.format("TK: Caldera, the product of TK's shield lack PTSD."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 49 then	 
		player:PrintToPlayer(string.format("TK: Don't use that plugin, you will be immediately banned."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 50 then	 
		player:setPos(78, 6, 34, 127, 154) --Nidhogg's butthole.
	elseif deckShuffle == 51 then	 
		player:PrintToPlayer(string.format("TK: Go fight my slow burn ANM's."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 52 then	 
		player:PrintToPlayer(string.format("TK: I just didn't feel like it."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 53 then	 
		player:PrintToPlayer(string.format("TK: To be fair."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 54 then	 
		player:PrintToPlayer(string.format("TK: I like it."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 55 then	 
		player:PrintToPlayer(string.format("TK: That's gonna be nasty."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 56 then	 
		player:PrintToPlayer(string.format("TK: Have you seen these kids nowadays?"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 57 then	 
		player:PrintToPlayer(string.format("TK: You gave Maat Camlann's Torment?"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 58 then	 
		player:PrintToPlayer(string.format("TK: What have I done?"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 59 then	 
		player:PrintToPlayer(string.format("TK: Have you ever shot wild hogs from a helicopter?"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 60 then	 
		player:PrintToPlayer(string.format("TK: Don't do that."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 61 then	 
		player:PrintToPlayer(string.format("TK: Not everyone knows how to run a jack."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 62 then	 
		player:PrintToPlayer(string.format("TK: Why are we RO'ing?"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 63 then	 
		player:PrintToPlayer(string.format("TK: Hey Bart."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 64 then	 
		player:PrintToPlayer(string.format("TK: Come here a minute."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 65 then	 
		player:PrintToPlayer(string.format("TK: Dear Lord."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 66 then	 
		player:PrintToPlayer(string.format("TK: Oh my God."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 67 then	 
		player:PrintToPlayer(string.format("TK: MY RDM TANK IS AWESOME!"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 68 then	 
		player:PrintToPlayer(string.format("TK: Sounds like a plan to me."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 69 then	 
		player:PrintToPlayer(string.format("TK: You're delusional."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 70 then	 
		player:PrintToPlayer(string.format("TK: Don't engage, just say no."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 71 then	 
		player:PrintToPlayer(string.format("TK: It's too late, you've lost the moment."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 72 then	 
		player:PrintToPlayer(string.format("TK: Strawberry and Vanilla."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 73 then	 
		player:PrintToPlayer(string.format("TK: RDM for the win."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 74 then	 
		player:PrintToPlayer(string.format("TK: All you have to do is literally try."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 75 then	 
		player:PrintToPlayer(string.format("TK: False."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 76 then	 
		player:PrintToPlayer(string.format("TK: Bart broke it."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 77 then	 
		player:PrintToPlayer(string.format("TK: WOAH HOLD THE F$^%%# UP."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 78 then	 
		player:PrintToPlayer(string.format("TK: Daddy, I thought you couldn't run because you're old... Kid's a savage."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 79 then	 
		player:PrintToPlayer(string.format("TK: Hang on."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 80 then	 
		player:PrintToPlayer(string.format("TK: Sucks to be you."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 81 then	 
		player:PrintToPlayer(string.format("TK: That armor is Garbage."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 82 then	 
		player:PrintToPlayer(string.format("TK: The SU1 armor sucks."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 83 then	 
		player:PrintToPlayer(string.format("TK: It's super easy."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 84 then	 
		player:PrintToPlayer(string.format("TK: It's not going to be easy."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 85 then	 
		player:PrintToPlayer(string.format("TK: Never gonna give you up."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 86 then	 
		player:PrintToPlayer(string.format("TK: Never gonna let you down. "),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 87 then	 
		player:PrintToPlayer(string.format("TK: Never gonna run around and desert you."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 88 then	 
		player:PrintToPlayer(string.format("TK: Never gonna make you cry."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 89 then	 
		player:PrintToPlayer(string.format("TK: Never gonna say goodbye."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 90 then	 
		player:PrintToPlayer(string.format("TK: Never gonna tell a lie and hurt you."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 91 then	 
		player:PrintToPlayer(string.format("TK: Muh Corsair empy boots tho."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 92 then	 
		player:PrintToPlayer(string.format("TK: How's that big hole in your chest?"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 93 then	 
		player:PrintToPlayer(string.format("TK: That's not correct."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 94 then	 
		player:PrintToPlayer(string.format("TK: Wrong."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 95 then	 
		player:PrintToPlayer(string.format("TK: No way."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 96 then	 
		player:PrintToPlayer(string.format("TK: Hell no."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 97 then	 
		player:PrintToPlayer(string.format("TK: To jail with you."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 98 then	 
		player:PrintToPlayer(string.format("TK: Naaar, will you write me an NPC for Ambuscade capes?"),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 99 then	 
		player:PrintToPlayer(string.format("TK: I'm the nice one."),tpz.msg.channel.SYSTEM_3)
	elseif deckShuffle == 100 then	
		player:PrintToPlayer(string.format("TK: DIE!"),tpz.msg.channel.SYSTEM_3)   
		player:injectActionPacket(4, 205) -- Flare II
		player:injectActionPacket(4, 207) -- Freeze II
		player:injectActionPacket(4, 209) -- Tornado II
		player:injectActionPacket(4, 211) -- Quake II
		player:injectActionPacket(4, 213) -- Burst II
		player:injectActionPacket(4, 215) -- Flood II
		player:setHP(0)
		player:setMP(0)
		player:setAnimation(0)
		player:timer(10000, function(playerArg)
		    playerArg:sendRaise(3)
		end)
	end
end