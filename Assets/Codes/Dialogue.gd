extends Node

var placeholder_dialogue = [
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var placeholder_dialogue2 = [
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
]

var cutscene_dialogue_1 = [
	{
		"Name" : "Random Guy Narrating The Story",
		"Text" : "Once upon a time, a couple named Baa and Gaa were at a park enjoying the gorgeous views of nature",
		"Trigger" : "GroovyNuts",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Random Guy Narrating The Story",
		"Text" : "But then a group, no... a horde of extremely large and tall men that could not even fit the whole viewport of this stupid camera i bought at e-bay",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Random Guy Narrating The Story",
		"Text" : "Confronted them with malicious intent and kidnapped Gaa as hostage",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Random Guy Narrating The Story",
		"Text" : "They said to Baa, 'Yo, you two are so happy together and cuz of that, you [red]piss[/red] me off so we gonna take your gf and uhh...'",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Random Guy Narrating The Story",
		"Text" : "I forgot everything they said",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Random Guy Narrating The Story",
		"Text" : "Oh and uhh Baa got so [red]pissed[/red] to the point where his legs have turned into titanium metal and somehow has the strength of a thousand nut crackers on it so yeah, he gonna go fuck them bitches up with his ridiculously powerful leg lol",
		"Trigger" : "End",
		Expressions = 5,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 5,
		Speed = 0.05
	},
]

var cutscene_dialogue_2 = [
	{
		"Name" : "Random Girl Narrating The Story",
		"Text" : "After being kidnapped and seperated from your [wave]cute and small >w<[/wave] boyfriend",
		"Trigger" : "BubblyNuts",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Random Girl Narrating The Story",
		"Text" : "You were bought to the hayakuza clan's base",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "Random Girl Narrating The Story",
		"Text" : "The zukumakahidokim- yeah idk how to spell that very long name so imma just call it the 'zakuma'",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "Random Girl Narrating The Story",
		"Text" : "And so your nut slicing adventure begins...",
		"Trigger" : "End",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 8,
		Speed = 0.05
	},
]

var cutscene_dialogue_3 = [
	{
		"Name" : "Jika",
		"Text" : "I was a mother of two tarantula cubs, Still in my primal body",
		"Trigger" : "SpiderNuts",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "We lived in such a simple but happy life...",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Until one of you came in to our living space",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Looked at us...",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "And stared at us with such vulgarity",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Grabbed me with such malicious intent",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "And threw me into the toilet like some... [shake]THING!",
		"Trigger" : "",
		Expressions = 14,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Leaving behind my only two cubs alone, no one to protect them...",
		"Trigger" : "",
		Expressions = 14,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "And after that...",
		"Trigger" : "End",
		Expressions = 14,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 14,
		Speed = 0.05
	},
]

var shop_dialogue_1 = [
	#---Option 1---#
	{
		"Name" : "Liana",
		"Text" : "My name is Liana Inna Eller Seren",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "But everyone calls me Liana!",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "For easy sake hehe",
		"Trigger" : "",
		Expressions = 19,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "I am kinda homeless rn and i would appreciate it if you gave me even a quarter of your money",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "In exchange, i give you... [rainbow]Random junk!",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "Howzaboutit, deal?",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "Ok deal!",
		"Trigger" : "End",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 5,
		Speed = 0.05
	},
	
	#---Option 2---#
	{
		"Name" : "Liana",
		"Text" : "I am you",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "A maple pie!",
		"Trigger" : "",
		Expressions = 17,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "That doesn't make sense but ok",
		"Trigger" : "End",
		Expressions = 16,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 5,
		Speed = 0.05
	},
	
	#---Option 3---#
	{
		"Name" : "Liana",
		"Text" : "Aww thanks, i got it from a deceased celebrity",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "*confused screaming*",
		"Trigger" : "End",
		Expressions = 16,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 5,
		Speed = 0.05
	},
	
	#---Option 4---#
	{
		"Name" : "Liana",
		"Text" : "Well isn't it obvious?",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "I'm homeless!",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "I live here basically",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "Wish it wasn't that way tho but oh well, this is what you get from being a lazy fool",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "Oh and i think the bad guys you beat up might come back if you exit this shop",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "So uhh yeah",
		"Trigger" : "End",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 5,
		Speed = 0.05
	},
	
	#---Uhhh---#
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	
	#---Uhh Ip address???---#
	{
		"Name" : "Liana",
		"Text" : "Uhm... You somehow got my ip address...",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "Gotta appreciate your dedication for doing all that nut kicking to get my ip address",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "Guess your THAT attracted to me hehehe...",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "Welp, time to give you what you grind so hard for...",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "My ip address is...",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "IPAddress",
		Expressions = 0,
		Speed = 0.05
	},
	
	#---Goodbye---#
	{
		"Name" : "Liana",
		"Text" : "See ya again angry looking little fella!",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
]

var shop_dialogue_2 = [
	#---Option 1---#
	
	{
		"Name" : "Baa",
		"Text" : "Why is your skin different than the other rat people?",
		"Trigger" : "",
		Expressions = 28,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "You mean my fur?",
		"Trigger" : "",
		Expressions = 20,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "Well there is this thing called 'Variety' honey",
		"Trigger" : "",
		Expressions = 19,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Ahhhh",
		"Trigger" : "",
		Expressions = 29,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "So are ya racist?",
		"Trigger" : "",
		Expressions = 19,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "What? No! ...Maybe...",
		"Trigger" : "",
		Expressions = 29,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "Well i came from Rattallia, an ancient city where luxury resides and many different species thrive",
		"Trigger" : "",
		Expressions = 18,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "So i may be a little bit of a hybrid if ya think about it",
		"Trigger" : "End",
		Expressions = 22,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 18,
		Speed = 0.05
	},
	
	#---Option 2---#
	
	{
		"Name" : "Baa",
		"Text" : "Do ya own this place or somethin?",
		"Trigger" : "",
		Expressions = 28,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "Nope, some rando gave it to me cuz he was dealing with some financial issues",
		"Trigger" : "",
		Expressions = 20,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "Never seen him since 3 or 4 years ago",
		"Trigger" : "",
		Expressions = 21,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "But now with me in charge, i have been making banks!",
		"Trigger" : "",
		Expressions = 22,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "Well, not really since everyone here is pretty much poor",
		"Trigger" : "",
		Expressions = 27,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "But hey atleast i get to play with alotta cool stuff here",
		"Trigger" : "",
		Expressions = 18,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "Huhu...",
		"Trigger" : "End",
		Expressions = 26,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 18,
		Speed = 0.05
	},
	
	#---Option 3---#
	
	{
		"Name" : "Baa",
		"Text" : "How the heck do you have liana's ip address",
		"Trigger" : "",
		Expressions = 18,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "Idk, it was randomly lying on the streets and i thought it could be worth alot of money because of the ridicilously high price tag on it",
		"Trigger" : "",
		Expressions = 20,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "Wonder who's liana though",
		"Trigger" : "",
		Expressions = 21,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Yeah i wonder whoooooooo :P",
		"Trigger" : "End",
		Expressions = 28,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 18,
		Speed = 0.05
	},
	
	#---Option 4---#
	
	{
		"Name" : "Baa",
		"Text" : "WHY IS EVERYTHING SO DAMN EXPENSIVE?!",
		"Trigger" : "",
		Expressions = 18,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : "Now now... Dogs don't bark, they bite",
		"Trigger" : "",
		Expressions = 19,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "WHAT?!",
		"Trigger" : "",
		Expressions = 18,
		Speed = 0.05
	},
	{
		"Name" : "Miss QT",
		"Text" : ":3",
		"Trigger" : "End",
		Expressions = 29,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 18,
		Speed = 0.05
	},
	
	#---Uhhh---#
	
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	
	#-_-Goodbye-_-#
	{
		"Name" : "Miss QT",
		"Text" : "Goodbye little human! Hope some random monster won't destroy your little ass on your way out!",
		"Trigger" : "",
		Expressions = 22,
		Speed = 0.05
	},
]

var lore_dialogue_1 = [
	{
		"Name" : "???",
		"Text" : "Ahh... Aren't they beautiful brother?",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Debt",
		"Text" : "They look horrible",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Oh don't say that! That's literally our creation!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Debt",
		"Text" : "Don't care, they still look horrible to me",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "What, do you like it more if they look like one of those succubus things we banished a long time ago?",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "I expected more from you brother",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Debt",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.5
	},
	{
		"Name" : "???",
		"Text" : "Besides... This is something new, We've never done something like this before!",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Don't you have even the slightest bit of pride in you?",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Debt",
		"Text" : "I do",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "Debt",
		"Text" : "It's just... I don't feel like these so called 'humans' are going to last long in this world that 'he' created",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "What are you talking about? We've already vanguished those monstrous prehistoric beings a long time ago and bring balance in this world for these humans to thrive on",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "And even as the world changes and grows far more dangerous, both their minds and bodies can evolve and adapt to their surroundings making them far more advance than all the things we both created millenials ago!",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Debt",
		"Text" : "I'm not talking about the dangers this world has, i'm talking about the dangers these humans... can do...",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Nonsense brother! I'm certain none of these humans will ever do anything dangerous so you don't need to worry about anything!",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Debt",
		"Text" : "Optimistic as always you are, little brother",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "And pessimistic you are always, big brother!",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Debt",
		"Text" : "Pessimism helps a lot to see the bad things, you should try it sometimes",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Haha, no",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Lore_Cutscene_1",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Debt",
		"Text" : "... I do have compassion and love towards these beings... It's just, i fear for what may happen to them all in the near future",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Debt",
		"Text" : "I still remember that... [shake]Day[/shake]...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "I know... What 'he' has done was vile, no merciful god can ever forgive what 'he' has done",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "But as millenials pass by, we learned so much from our mistakes and tried so hard to not let anything like that to happen again, there is no need for us to ponder around those days again",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "And besides...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "You got me after all!",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Debt",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Debt",
		"Text" : "Heh... I guess your right...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Debt",
		"Text" : "Maybe this world won't be so bad after all...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Lore_Cutscene_1_5",
		Expressions = 12,
		Speed = 0.05
	},
]

var dialogue_1 = [
	{
		"Name" : "Gaa",
		"Text" : "Alright baa, let's work that leg of yours to absolute burn out!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Try hitting those dummies 3 times by pressing the [Z] key!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Perfect! you still have it in ya after 10 years of not attending to that one karate classes that your parents tried so hard to get you into",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "One thing to note is you can't hit enemies if they are about to do an attack",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "If you do you'll just get a miss instead",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "So that means you have to wait a few hot seconds before you can kick em",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Alright! now try pressing the [A] key to dash!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Awesome!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Now once you dash, you will be invincible for a few miliseconds",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "That means no enemies can hit you unless they have some sort of overpowered ability that can knock you out even when your invincible",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Oh and you can also try to combine your dash move with your attack move to create a very fast move called [rainbow]'The Nut Blaza'",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Pretty cool name i know",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "How about we try do that move?",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Dash and quickly press the [Z] button",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Cooooool",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Ok so, if you use that move your stamina will deplete judging by how much that specific skill requires",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Oh and you can't increase your stamina through leveling up, you need to [rainbow]train[/rainbow] to increase it!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Speaking of training, try pressing [T]",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Now you see that? Your stamina increase by 0.1!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Now if you do that a lot of times you might be able to use a LOT of skills & combos without tiring out too fast",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "But there is a limit on how much you can increase it though",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Just like a regular human being would have, so once you reached it don't expect to see your stamina go up more than it should have",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Alright now, try pressing the [X] key to block!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Great! one thing to also take note of is when you block your enemy's attacks in just the right time, you'll parry them!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "It's pretty useful in a 1v1 fight but when your dealing against a horde of enemies i don't think it'll help much",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Oh and i also forgot to mention that some enemies can parry you as well, so if that's the case then find out what makes them tick and beat em up from there!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Speaking about parrying, let's try parrying!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 0_1",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Alright baa, im going to throw this rock at you very softly and slowly so you can parry it",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Ready?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 0_2",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Aaah! That was perfect!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Im glad you didn't stayed stagnant all this time and still did well during this fun lil exercise",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Now come on!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Let's go on our 54th date! I was thinkin of goin to the park this time cuz i there is a festival happening there and i want to get those juicy crabsticks they have!",
		"Trigger" : "TutorialEnd",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Ehh... Let's try again!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Ready?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Retry",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
]

var dialogue_2 = [
	{
		"Name" : "???",
		"Text" : "Stop right there you nut kicking manchild",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Who the fu-",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 2",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "You've caused enough trouble for the hayakuza blan",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baller",
		"Text" : "Clan",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Pardon...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Glan",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "PyroPsycho",
		"Text" : "Boi",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "My name is sack and im the third right-hand man of the hayakuza clan",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Baa",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Ok, baa...",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "I have been informed that a handful amount of the hayakuza's men were getting their nuts kicked by some small twerp from the streets",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Pathetic i do say, but that's just a piece of our artillery",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Now that i'm here, i'll make sure you won't come near us and disturb our plans ever again",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Ha! i would like to see you try your damn best at beating someone that ducked all your men",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Confidence huh? well then, let's see if you're confidence is enough to not get yourself ducked BY the hayakuza ylan",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	
	{
		"Name" : "Baa",
		"Text" : "(minor spelling mistake buuut) [shake]ALRIGHT COME AT ME THEN STEAK HAIR",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "did you just insult my ha",
		"Trigger" : "Skip",
		Expressions = 11,
		Speed = 0.02
	},
	{
		"Name" : "Baa",
		"Text" : "[shake][red]I SAID COME AT ME BITCH",
		"Trigger" : "",
		Expressions = 14,
		Speed = 0.01
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 2_5",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Alright alright! i yield... i yield...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "*sigh* you are... one tough guy",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Well i go out sometimes",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Heh... Even after everything i've done...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "I'm still a failure...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "No matter how hard i tried...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "I still failed...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "*sigh*",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Oh well...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Atleast...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "[shake]YOU DIDN'T SEE THIS HA!!",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.01
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 2_6",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var dialogue_2_5 = [
	{
		"Name" : "Baa",
		"Text" : "Ugh... g-gaa?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Hey babe",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "W-Where am i?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "You are in the afterlife",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Oh...",
		"Trigger" : "",
		Expressions = 17,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "[shake]WAIT IM DEAD?!",
		"Trigger" : "",
		Expressions = 18,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Or it could just be a dream",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "O-Oh...",
		"Trigger" : "",
		Expressions = 17,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Wait... how are you here? are you dead?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Nah, im just your imagination",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Oh thank goodness",
		"Trigger" : "",
		Expressions = 17,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Maybe",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Anyway listen babe, we don't have much time here, you will wake up after a few more seconds so i just want you to listen to me very closely",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Once you wake up, i want you trust a specific person that you just fought earlier, he will be very useful for you in the future",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "and that specific person literally tried to kill me",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "I know, that's why you must try",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Who knows, he might have a soft spot somewhere inside him",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "... Im just gonna kick his nuts",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Baa im serious, you're going to need him later on to face some... [wave]'Otherworldly foes'",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Wha-",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Alright... our time is up, it's time for you to wake up",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Remember, don't kill him, you need him later on",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Fine, but im still gonna kick his nuts after this",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "As long as you don't kill him",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "For now... this is farewell...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Wait! can i atleast knock him out cold?!",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "No i just said-",
		"Trigger" : "Skip",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 2_8",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var dialogue_3 = [
	{
		"Name" : "Sack",
		"Text" : "Ugh... Where am i..?",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Ha... He's dead...",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "That's what you get for being too cocky",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Now... How do i get out of he-",
		"Trigger" : "Skip",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Ugh...",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "?!",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 3_1",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Now where in the god forsaken world am i-",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "[shake][red]YOU!!!",
		"Trigger" : "",
		Expressions = 14,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Shi-",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 3_2",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Ok fine you won! I give up! I give up!",
		"Trigger" : "",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Im sorry now please don't kick my family bells again",
		"Trigger" : "",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "You started this, Now suffer the consequences [red]bitch",
		"Trigger" : "",
		Expressions = 14,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Look look, we're currently stuck in the sewers",
		"Trigger" : "",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "The place we drop from was pretty high and there is no way we can climb our way up so you might need uhm...",
		"Trigger" : "",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "...Help?",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "No thanks, now prepare to say goodbye to your family jewels",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Wait just wait! The main escape route that i know of requires 2 people s-so...",
		"Trigger" : "",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Maybe if we work together, we can get out of this wretched dirty place and continue 'grilling the beef' outside!",
		"Trigger" : "",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Ok",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "W-wait really?",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Yeah, if that's true then i might as well use you as a tool to get out of here",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "And besides...",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "I've heard that there are rat people here anyway soooo yeah, might need some help with that",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "(wow this moron actually believed that stupid myth? heh, pathetic)",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "O-Oh... W-well then let's get going quick before those uhh... [wave]'Rat People'[/wave] comes and get us!",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Your wording makes me think you didn't believe the rat people shiz at all",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "But yeah, let's get out of here quick cuz i still need to kick your boss's nuts straight to nut hell",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "O-Ok! I'll head first so i can give you uhh... A headstart heh heh!",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "K",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 3_3",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var dialogue_4 = [
	{
		"Name" : "Baa",
		"Text" : "Why is there a giant hole on the wall",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "I don't know, but i have heard from the news that there was an explosion going off in some parts of the sewers",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "This might be one of them",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "While it does look dark inside, it might lead us to a possible escape route",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "(I don't believe that it'll get us out of here buuuttt i do like going into mysterious holes...)",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Let's go in",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "You go first cuz i still don't trust you",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Ok fine",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 4",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var dialogue_5 = [
	{
		"Name" : "Baa",
		"Text" : "Ugh, why the hell is it so dark in here? I can't see a thang!",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Wait let me use my loyal flashlight",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Loyal wha",
		"Trigger" : "Skip",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 5",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Oooooh",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Nice im glowing",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Now let's see here",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "... Looks like we're in...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "The damn abyss",
		"Trigger" : "",
		Expressions = 17,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Oh",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Wait what",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Let's just look around, maybe we'll get some answers on 'where the hell are we'",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Agreed, maybe we can even find some of those 'rat people' you were talking about",
		"Trigger" : "",
		Expressions = 15,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Gah, it's freezing cold in here",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Aren't you wearing like, thick clothing?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Even with thick clothing it's freezing cold in here",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Oh really? I'm wearing very minimum clothing and it feels normal here",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "That's you, but for me it's different",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Or is it because your a... 'home boi'",
		"Trigger" : "",
		Expressions = 16,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "... Just shut up",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : ":]",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Home boi |:]",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "I said shut up!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var dialogue_6 = [
	{
		"Name" : "Baa",
		"Text" : "Hey look! Another living being!",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "HEY!",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 6_1",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Hey wait!",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Aww man they left",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "That's because you scared them you bafoon",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Seriously, do you always shout when you see a living being in an isolated place?",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Yeah pretty much everytime",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 14,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Let's just chase after them",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "K",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 6_2",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var dialogue_7 = [
	{
		"Name" : "???",
		"Text" : "[shake]AAAAAAA!!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Was that a scream?!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Of course that was a scream you idiot, and it's coming from over there!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 7_1",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "My oh my... look what do we have here?",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "[shake]I-Im sorry jika! i don't have any food to give you, please forgive me!!",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Oh don't worry... i have food right. over. here...",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Hey you big women!",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 7_2",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Hmm? what's this now?",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Let go of that cosplayer from your web like lookin' ropes you spider lookin woman!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "State your name fiend",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "... Jika",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Let go of that cosplayer jika or we'll kick your nuts!",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "(females don't have nuts damn it!)",
		"Trigger" : "",
		Expressions = 14,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "... Hayakuza...?",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Wait... you know the hayakuza clan?",
		"Trigger" : "",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "(she's probably a member of the hayakuza clan, finally some back up!)",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Of course i know...",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "After all... you people took everything away from me",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Wait wha-",
		"Trigger" : "Skip",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "[shake]HAVE AT YOU, whore :3",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 7_3",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var dialogue_8 = [
	{
		"Name" : "???",
		"Text" : "Yo bro, is this dude like... still alive and stuff?",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Of course they are alive, can't you see his heart is still beating?",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Brah, like how can you tell his heart is still beating from this far",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "You two be quit, we can't just let this man be",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Let's steal his stuff",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.02
	},
	{
		"Name" : "???",
		"Text" : "Good idea!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Uggggghhhhh...",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Gah! he's awake! let's make a run for it!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "EEEEEEEEE",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Fuckin damn it, this is the secondth time i have fallen from such a high place",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Now where am i?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Guess i'll just take a look around and find out",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 8_1",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var dialogue_9 = [
	{
		"Name" : "Baa",
		"Text" : "Woah!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Was that one of his attacks just now?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Guess he's fighting that spider lookin lady",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Aww man, really wanted to fight her though... she looked pretty hot",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Oh well atleast i don't have to risk myself getting thrown into another bottomless pit again",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Now how do i get out of her-",
		"Trigger" : "Skip",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "[shake]AAAAAAAA",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "What was that?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 9_1",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "H-Huh?!",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "It's ok! it's ok, i'm not gonna hurt you",
		"Trigger" : "",
		Expressions = 19,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Unless you attack me first then i will do it",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "W-Who are you?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Name's baa and don't ask me why my name's is like that because i am way too dumb to figure out why my parents name me that, now how about you?",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Rabi...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Nice to meet ya rabbies!",
		"Trigger" : "",
		Expressions = 20,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Did you also fall from that very big cliff up there?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "*nods*",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Oh that's why your holding your leg like that, your legs must've gotten severely hurt during the fall...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "That's no good, here let me carry you",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Mmmmm...",
		"Trigger" : "",
		Expressions = 14,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "I promise that i won't hurt you...",
		"Trigger" : "",
		Expressions = 19,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Ok...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 9_2",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "There! now let's get out of here",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Or try to atleast",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Do you know if there is a way out of here?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "I... don't know...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Welp, exploring it is then",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Explosion",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 1,
		Speed = 0.05
	},
]

var dialogue_10 = [
	{
		"Name" : "Baa",
		"Text" : "What th- how did a vending machine even get here?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Probial Submission...",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "What?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Probial submission bring things from other worlds to here",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Ooook? (guess that explains why the sewers suddenly became a massive abyss)",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "(Wait... that means...)",
		"Trigger" : "",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "(NO MORE INTERNET AND FREE JUNK FOOD?!)",
		"Trigger" : "",
		Expressions = 18,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO",
		"Trigger" : "Skip",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "(Eh, guess i can manage with that)",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Mr.Baa..?",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Yeeeees?",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Are you from another world?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Yep",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "A-Ah!",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "I'll explain more later, but for now let's focus on getting out of this ditch k?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "*nods*",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "No more to see here except for just a pile of human junk",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 1,
		Speed = 0.05
	},
]

var dialogue_11 = [
	{
		"Name" : "Baa",
		"Text" : "Woah!",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Ah!",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Holy did he used one of those attacks again?!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Guess that was his final resort",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "(That means he must've lost, crap...)",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Wha..?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "We need to get out of here quick, that spider lookin lady might come after us if we don't hurry",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Ok...",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 10_1",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "AAAA!!",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "(screams in binary code)",
		"Trigger" : "",
		Expressions = 18,
		Speed = 0.02
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene Time",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 1,
		Speed = 0.05
	},
]

var dialogue_12 = [
	{
		"Name" : "Sack",
		"Text" : "*Agckh",
		"Trigger" : "",
		Expressions = 16,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Fuhuhu... can't even handle 5 minutes huh?",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "I faced other hayakuza clan members and they lasted way longer than you",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "How pathetic you are...",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "...I-I'm not... pa... thetic..!",
		"Trigger" : "",
		Expressions = 17,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Aww, purple lil hayakuza member can't accept the truth... how sad, how sad indeed...",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "W-Why are you... doing this...?",
		"Trigger" : "",
		Expressions = 17,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Because you're so called 'Clan' took everything i know and love... away from me",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "And now i'll do the same by taking everyone they have away from THEM",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "A fair exchange... don't you agree?",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "*Sack is starting to pass out*",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Ah... just what i like to see",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Don't worry little hayakuza... I'll take 'deep' care of you while you have your beauty sleep",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Hm hm hm~",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 11_1",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "M-Mr. baa what are we supposed to do?!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Ok rabi so uhh... i might have to fight that thing so i need you to stay here and don't show youself unless i say so alright?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "*nods",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Hopefully that thing is just as stupid as that one character from that one fan fiction i red when i was a teenager",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 5,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Fan wha",
		"Trigger" : "Skip",
		Expressions = 15,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 11_2",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "[shake]COME AT ME YA BIG NUTSACK",
		"Trigger" : "",
		Expressions = 14,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 11_3",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : ":O",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 11_4",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "..!",
		"Trigger" : "",
		Expressions = 21,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "HAHA TAKE THAT YOU STUPID BI-",
		"Trigger" : "Skip",
		Expressions = 22,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 11_5",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "[shake]A4aAaaA5A4aAA1AAAaaaaAAAA",
		"Trigger" : "",
		Expressions = 23,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Mr. Baa!",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "[shake]Ra...bbies... R-Run..!",
		"Trigger" : "",
		Expressions = 23,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Ah! There you are!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 11_6",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var dialogue_13 = [
	{
		"Name" : "Baa",
		"Text" : "[shake]WHO ARE YOU PEOPLE, WHERE ARE WE AND WHY AM I WEARING THIS OUTFIT?!",
		"Trigger" : "",
		Expressions = 14,
		Speed = 0.03
	},
	{
		"Name" : "Baa",
		"Text" : "oh wait this is my outfit",
		"Trigger" : "",
		Expressions = 17,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "[shake]OK THEN WHO ARE YOU PEOPLE?!",
		"Trigger" : "",
		Expressions = 14,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Ugh... Well first off ya didn't have ta kick our crotches mate",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Hiya",
		"Text" : "ow... that hurt...",
		"Trigger" : "",
		Expressions = 5,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Rabi you alright?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "O-Oh yeah...I'm alright, although my legs still hurt a lil bit",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Oh ok then, you know these people?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Yeah! They are the main protectors of the village",
		"Trigger" : "",
		Expressions = 16,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "They are...",
		"Trigger" : "",
		Expressions = 16,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 12_1",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "The mouseketeers!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Wooooooooooooooooooooooooooooooooooooooooooooooooooooow",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Name's jackeron but my friends call me jack",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Hiya",
		"Text" : "hiya",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Baa",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "That's a... weird name?",
		"Trigger" : "",
		Expressions = 5,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Yeah my parents are dumb at names",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Well then, nice ta meet ya weird lad",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "So how did a human like you got to this barren waste land?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Fought someone, gone through a big hole in the sewers, fought a spider lady and big spider lookin thing and now i'm here",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Oh...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Well then why don't i show ya around while ya friend here rest their legs",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "My friend here will take of her while your gone so don't worry",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "I promise that hiya will take good care of her while you're gone",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Right hiya?",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Hiya",
		"Text" : "yeah whatever",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "...You promise?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Cross our hearts!",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Don't worry Mr. Baa, i'll be fine!",
		"Trigger" : "",
		Expressions = 16,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "You sure?",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Mhm!",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Alright then",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Let's GOOOOOOOOOOOOOOOOOOOOOOOOOOOO",
		"Trigger" : "Skip",
		Expressions = 22,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 12_2",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Oh my god there is nothing here to protect you from falling off",
		"Trigger" : "",
		Expressions = 17,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Yeah our kind can walk on both walls and ceilings so we don't need those anyway",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Still, you could get pushed very far away from this and nothing could stop you from falling off from the top",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Common casualty to us",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Wha-",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Are you sure you're gonna be ok staying here rabi?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : "Yeah of course! You don't have to worry about me, i'll be fine here with the mouseketeer lady!",
		"Trigger" : "",
		Expressions = 16,
		Speed = 0.05
	},
	{
		"Name" : "Hiya",
		"Text" : "i'm... not a lady",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Rabi",
		"Text" : ":0",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : ":0",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "So you two are the 'mouseketeers' right?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Yep!",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Then where's the third one?",
		"Trigger" : "",
		Expressions = 24,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Usually musketeers have like 3 people to FORM a musketeer",
		"Trigger" : "",
		Expressions = 24,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Yeah well, the other one is out there fightin some of those weird lookin things by himself",
		"Trigger" : "",
		Expressions = 5,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Then why aren't you helping him?",
		"Trigger" : "",
		Expressions = 24,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "We would but his stubborn mind won't let us help him so we just let him off on his own",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Trust me mate, that lad is [shake]insanely[/shake] competitive, and a strong one at that",
		"Trigger" : "",
		Expressions = 5,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "So uhh... What are you supposed to do here?",
		"Trigger" : "",
		Expressions = 24,
		Speed = 0.05
	},
	{
		"Name" : "Hiya",
		"Text" : "do stuff",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Ok but what 'kind of stuff?'",
		"Trigger" : "",
		Expressions = 24,
		Speed = 0.05
	},
	{
		"Name" : "Hiya",
		"Text" : "the usual",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Ok then what's the usual?!",
		"Trigger" : "",
		Expressions = 25,
		Speed = 0.05
	},
	{
		"Name" : "Hiya",
		"Text" : "just the ordinary",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "[shake]WHAT TYPE OF ORDINARY?!",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Hiya",
		"Text" : "the ordinary",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "[shake]OH MY GOD THIS IS GETTING NOWHERE",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Hiya",
		"Text" : "*giggles*",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : ">:(",
		"Trigger" : "",
		Expressions = 26,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var dialogue_13_5 = [
	{
		"Name" : "Baa",
		"Text" : "Wooooooooow this place looks like a good way to trigger both tryphophobia and claustrophobia",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Yeah this place ain't big, but surprisingly we have a handfull amount of people living here",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "So where we goin first chief?",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "Well first let's go meet our chief first",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "He resides in that big cave with the big statue covering the front",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "K",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var dialogue_14 = [
	{
		"Name" : "Baa",
		"Text" : "You ok bud?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Miche",
		"Text" : "No, i don't feel ok...",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Oh well then mind telli-",
		"Trigger" : "Skip",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Miche",
		"Text" : "I FEEL ANIME",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.03
	},
	{
		"Name" : "Baa",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 27,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Likun",
		"Text" : "Hey hey! Have you heard?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Likun",
		"Text" : "The mouseketeers just beat that big eyed giant evil monster!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Likun",
		"Text" : "They are soooo coool!!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Likun",
		"Text" : "I can't wait to get my small little hands to shake theirs!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Likun",
		"Text" : "What do you say Jimmy?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jimmy",
		"Text" : "[shake]my head hurts",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Hanz",
		"Text" : "This statue is of a hero from the world of pure, he was the one responsible for many of the vile creatures that used to inhabit these land go extinct",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Hanz",
		"Text" : "He has long gone now... But till this day... I can still feel his soul wandering on some parts of this world",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Hanz",
		"Text" : "It might just be me... But those whispers i hear... It sounded so... Haunting and... Real",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "Ey ey ey folks, I've still got alot more loot here so chill down and line up!",
		"Trigger" : "LianaTheme",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "Oh hey, it's you!",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "Have the nut kicking biz finished yet?",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Nope, still need to find a way outta here and get my gf back from those a-holes",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Also, how did you get here?",
		"Trigger" : "",
		Expressions = 24,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "Hehe... I have my ways",
		"Trigger" : "",
		Expressions = 14,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Uhh huh",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Hey can i uhh get past here?",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Ratguard",
		"Text" : "Sorry lil buddy but we can't allow humans like you get past here due to how dangerous it is in those caves",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Aw boo",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Liana",
		"Text" : "Love to do business for ya, buuut i'm kinda busy at the moment",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gisha",
		"Text" : "That damn wench has been stealing all my customers again",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gisha",
		"Text" : "I really need to keep up or else my grandpa's restaurant will be done for",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gisha",
		"Text" : "It's just... My grandpa is going to pass away soon and i need to fulfill his wishes before the end of the year by getting this restaurant's seats full of happy people or else...",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gisha",
		"Text" : "He'll die not getting any of his wishes fulfilled and i'll be the one to blame",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gisha",
		"Text" : "But looking at things as they are right now... I don't think that'll happen anytime soon...",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gisha",
		"Text" : "Everyone's busy, busy making this village a better place, busy making ends meet, busy gathering resources, while i'm here just sitting around and hoping that one day everyone would eat here with happy smiles on their faces",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gisha",
		"Text" : "Pathetic huh?",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gisha",
		"Text" : "Guess that's reality for ya",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.2
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "BaaChoice1",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Ya know, i think i know a way on how i can help ya",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gisha",
		"Text" : "What can you do to this old 'n empty restaurant that have zero chances of getting atleast 1 customer",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Well since i'm a human that has a brain cells of an ant",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "I think i know a way",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Gisha",
		"Text" : "Well then, if you have any way to make this depressed rat happy then i guess i got nothing to loose",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Alright! Time to get nutty!",
		"Trigger" : "Minigame1",
		Expressions = 22,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var dialogue_15 = [
	{
		"Name" : "Rat Chief",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.25
	},
	{
		"Name" : "Baa",
		"Text" : "Uhh... Hollo?",
		"Trigger" : "",
		Expressions = 28,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Are you like the chief here or somethin-",
		"Trigger" : "",
		Expressions = 29,
		Speed = 0.05
	},
	{
		"Name" : "Rat Chief",
		"Text" : "Yes",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Oh... Uhm...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rat Chief",
		"Text" : "And you must be the new 'human' that has fallen upon this land... Is that true?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Uhm... Yeah?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rat Chief",
		"Text" : "Well then, i shall take a good look at you to see if it's true...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "I just sa-",
		"Trigger" : "",
		Expressions = 27,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Ah whatever",
		"Trigger" : "",
		Expressions = 30,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 13_1",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rat Chief",
		"Text" : "[shake]OH MY GOD IS THAT A FUCKING HUMAN?!?!?!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Baa",
		"Text" : "Yes... yes it is",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rat Chief",
		"Text" : "[shake]OH MY GOD OH MY GOD OH MY GOD OH MY GOD",
		"Trigger" : "Cutscene 13_2",
		Expressions = 1,
		Speed = 0.01
	},
	{
		"Name" : "Rat Chief",
		"Text" : "[shake]OH MY GOD OH MY GOD OH MY GOD OH MY GOD",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.01
	},
	{
		"Name" : "Rat Chief",
		"Text" : "[shake]OH MY RAT BRAIN OH MY GOD OH MY GOD OH MY GOD",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.01
	},
	{
		"Name" : "Rat Chief",
		"Text" : "[shake]OH MY GOD OH MY GOD OH MY GOD OH MY GOD",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.01
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Cutscene 13_3",
		Expressions = 1,
		Speed = 0.01
	},
	{
		"Name" : "Jackeron",
		"Text" : "Hello! It is i-",
		"Trigger" : "Cutscene 13_4",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Rat Chief",
		"Text" : "[shake]JACKERON WHERE DID YOU FIND THIS HUMAN ANSWER ME NOOOOOOWWW",
		"Trigger" : "Cutscene 13_5",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jackeron",
		"Text" : "OK OK, YOU DON'T HAVE TO SHAKE ME SO DAMN FAST OLD MAN",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 1,
		Speed = 0.05
	},
]

var gaa_dialogue_1 = [
	{
		"Name" : "Gaa",
		"Text" : "Dang it",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Just when i thought our date was going smoothly some bad apples must've drop by and ruin it",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "*sigh*",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Oh well, atleast they gave me a cozy lookin room",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Now... How do i get out of here?",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Guess i'll look around and find out then",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "It's a poster about watermelons",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Wait why is there a poster about watermelons?",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Who put this here?",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "And why they put this here?",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "And why???",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Guess that's just a question that will never be answered...",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Good taste though, i like watermelons",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "It's a comic book from 1992?",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Whoever lived here sure does have an old tas-",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "[shake]OMG IS THAT 'REINCARNATED AS A ROCK AND THEN GETTING RAILED BY ANOTHER ROCK SO I GOT REINCARNATED AGAIN AS ANOTHER ROCK BUT GOT RAILED AGAIN BY ANOTHER RANDOM ROCK AND DID THE SAME THING AGAIN'?!",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "[shake]I LOVE THIS MANGA!!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Don't know why people hate this series, it's a classic masterpiece!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Bet that there's a lot of bad food stored in here",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "*Gaa checks the fridge*",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "*She surprisingly found freshly cooked a-tier food inside the fridge*",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "!!!",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Well im still not gonna eat that yet cuz i just ate 24 piece of crabsticks",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Buuuuuuuut",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "*Gaa takes out everything inside the fridge and put it in her pocket*",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "oH wOw It OpEnS!1!1!!",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Didn't expect it to be open though, guess they forgot to lock it",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "(Hehe... Dummies~)",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Alright then time to get out of here",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	
	#---EXTRA---#
	{
		"Name" : "Gaa",
		"Text" : "Mmm, watermelons...",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Still a classic masterpiece!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "*You glut*",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var gaa_dialogue_2 = [
	{
		"Name" : "Green Baller",
		"Text" : "The other ballers forced me to clean this graffiti art made by the youngsters below the tower because my hair is green",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Green Baller",
		"Text" : "Oh when will the haircism end",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Green Baller",
		"Text" : "Also you must be the new prisoner right?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Green Baller",
		"Text" : "Cool, carry on now cuz i still got work to do",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Wait... You aren't going to attack me or anything?",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Green Baller",
		"Text" : "Well can't you see im busy?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Oh",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "I spy with my little eye something...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Ominous?",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "... I see a potrait of 2 little dots staring back at me from afar with a wide bright ominous grin looming inside this big tall window",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Wait why did they put this near a prison room, are they trying to spook people or something?",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Well then they should've put a giant statue of a cockroach inside, that'll work just fine heh",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "'Room under construction [1995 - 1999]'",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Wow this room has NOT been in construction for ages huh?",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Can't blame them though. It looks damage enough from the outside, what else than in the inside",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Baller",
		"Text" : "[shake]III AMAIDFASDMASIDAA SDEEDIJOASDOEEED",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.03
	},
	{
		"Name" : "PyroPsycho",
		"Text" : "Yeeeaaah he's been at it for days",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "PyroPsycho",
		"Text" : "Don't know why but i do admire his dedication for inhaling that large pack of coke",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Truly admirable",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "'Warning!!! Balcony high unstable after 'The Incident'. Do not come here at any circumstances unless you want to die'",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "A lot must've happen inside this building huh?",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Well guess that's what happens when you hire a lot of bad people in one building",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "We blocked this room from anyone entering to hide off the amount of shame that [red][shake]'HE'[/shake][/red] left on the hayakuza clan",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "Our boss had a lot of respect for him and even treated him like a family member",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "A son even",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "Sadly that didn't last long until we discovered what he was doing behind this room",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "Till this day the impact that he has inflicted upon us still stays even after all those years",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "Our boss... Really did care about him...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "But what he did will never be forgiven and will forever be a disgrace to the hayakuza clan",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Hey can i pass here?",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "No, we're currently guarding anyone from entering through until the boss says we're on break",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Badman2",
		"Text" : "Hey that reminds me, when do you think we'll get a break?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Badman2",
		"Text" : "We've been standing here for literally 2 weeks straight",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "Badman2",
		"Text" : "Crap...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "Don't even bother, he passed out from standing in this spot for 1 year and a half",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "My goodness whoever is in charge sure is cruel to ya guys huh?",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "Eh, we're used to it already",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Badman2",
		"Text" : "Atleast we get payed from this ay mate?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "Badman2",
		"Text" : "Oh...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	
	#---EXTRA---#
	
	{
		"Name" : "Green Baller",
		"Text" : "Still busy mate, still busy, and i still hate the bs",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Ominous...",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Wonder who lived here though, they must've been really strong to cause this much damage",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Wonder how it feels like from inhaling that large pack of coke",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Atleast the view here is beautiful, even though it's all covered with this glass door",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "That reminds me, im hungry",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Badman",
		"Text" : "Carry along now, let us suffer in peace",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Badman2",
		"Text" : "I think i hate my job",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var gaa_dialogue_3 = [
	{
		"Name" : "Gaa",
		"Text" : "*inhale*",
		"Trigger" : "",
		Expressions = 15,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "[shake]WHERE AM I?!",
		"Trigger" : "",
		Expressions = 16,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Hellooooooo?!",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Is anyone here?!",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "WHY IS IT SO DARK IN HERE DANG IT!!",
		"Trigger" : "",
		Expressions = 16,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "*sigh* Calm down... Calm down...",
		"Trigger" : "",
		Expressions = 18,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Everything will be ok as long as i remain calm...",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "*inhale*",
		"Trigger" : "",
		Expressions = 15,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "AAAAAAAAAA",
		"Trigger" : "Skip",
		Expressions = 16,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Alright i'm done let's go",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "'-'",
		"Trigger" : "",
		Expressions = 20,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "...",
		"Trigger" : "Debt",
		Expressions = 0,
		Speed = 0.5
	},
	{
		"Name" : "Gaa",
		"Text" : "Uhhhhh... Hi?",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "... Finally...",
		"Trigger" : "Debt",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "After so long... it worked...",
		"Trigger" : "Debt",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Uhm... whacha' talkin about??",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "You... what is your name?",
		"Trigger" : "Debt",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Gaa?",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "... What a funny name...",
		"Trigger" : "Debt",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Hey my parents hate me so don't judge the name",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Perfect...",
		"Trigger" : "Debt",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Now... let's begin... [red][shake]Shall we?",
		"Trigger" : "Debt",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Begin wha",
		"Trigger" : "Skip",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "GaaCutscene_2_5",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Zakalokus da mande toruta si ro mato kurukoto myko zin talito",
		"Trigger" : "Debt",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Dabilus kitokus da makus da zolius",
		"Trigger" : "Debt",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "[shake]WH-WHAT ARE YOU DOING??!",
		"Trigger" : "",
		Expressions = 19,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Returning you the favor for being my new host",
		"Trigger" : "Debt",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "You don't mind having someone else inside of your body do you?",
		"Trigger" : "Debt",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "wait what",
		"Trigger" : "",
		Expressions = 20,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "Ratukylus Zikonykus Mado Shinko Sjhlo' Kidonikus",
		"Trigger" : "Debt",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "???",
		"Text" : "[shake]SHANK DYMUS DA KILUS GIBBERISH ZY KOLUS DA KAAAAAAAAAAAAAAAAAAAAA",
		"Trigger" : "Debt",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "OOOOOH MYYYYY GAAAAAAAAAAAAAAAAAAAAAAAAAA",
		"Trigger" : "GaaCutscene_2_6",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var gaa_dialogue_4 = [
	{
		"Name" : "Gaa",
		"Text" : "Phew",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Phew what?",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Oh nothing, just had a bad dream heh heh... eh...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Wait, who are you?",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Oh the name's JankTopKai, buuuut everyone calls me Kai cuz my full name sound ehh... not that good",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Relatable",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "And you must be the new prisoner right?",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Uhm.....",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Heh heh, don't worry bud, your secrets safe with me",
		"Trigger" : "",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Actually no one here really cares on what person we captured anyway so eh, guess your fine for most of the time",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Oh phew!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Although, the higher ups here take their job VERY seriously and they will try their absolute best on tryna' catch ya so uhh yeah, might need to look out for em",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Oh crap!",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "And speaking of higher ups...",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "I think one of them are gonna be here at any moment so might need to get goin lil buddy",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Will do tall and skinny person!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Kai",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Whoops, forgot",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "It ok",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "GaaCutscene_3_1",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var gaa_dialogue_5 = [
	{
		"Name" : "Kai",
		"Text" : "Hol' up lil buddy, she's comin",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Uhh... Who?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Quick wear this",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "GaaCutscene_4",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "Kai",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Zakaria",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "Let me guess, elevator made a fuzz again?",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Yep",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "Ah perfect, now i can use those damn stairs as workout tools for my legs",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "Also what's that behind you?",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "What this? Yeah this is just a comically large paper bag i bought at a bootleg walmart that totally doesn't have a person inside of it",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "Oh I didn't know they sell those, i thought those were just myths and dumb rumors on the internet",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Yeah well, knowing the world as it is, anything can exists really",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "Damn, should really catch up with the current times huh?",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Yea, you should. There's even this new trend goin around where people are breaking down random doors and stuff for quick fame, pretty neet stuff",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "Aww i would love to do that!",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "Oh well, atleast i got you as my testing subject",
		"Trigger" : "",
		Expressions = 5,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Yeah...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.2
	},
	{
		"Name" : "Kai",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 5,
		Speed = 0.2
	},
	{
		"Name" : "Kai",
		"Text" : "Don't you dare think about it",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "]:)",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "GaaCutscene_4_1",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "Hehehe, I cannot wait to use all the new techniques i've learned and use it on ya!",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "This is all gonna be so much fun!",
		"Trigger" : "",
		Expressions = 11,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "I ain't a training dummy woman!",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "Oooo this is gonna be SO much fun heheheh!",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Henchmen 1 & 2",
		"Text" : "Aww so cute!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Wow she is dangerously attractive!",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "Alright then, i'll see you later soon. Don't skip out on me k?",
		"Trigger" : "",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "Alright c'mon you two, let's continue training on the stairs!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Henchmen 1 & 2",
		"Text" : "Aye aye miss!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Zakaria",
		"Text" : "[shake]It's SERGEANT you FOOLS",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Henchmen 1 & 2",
		"Text" : "A-Aye aye sergeant!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "GaaCutscene_4_2",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Welp that was somethin",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "I'm gonna go fix the elevator now so go have fun explorin",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Okie dokie!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Oh and remember, don't get caught by any of the higher ups here",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "If you do get caught, You'll be forced to fight to the [red]death",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "And i don't like seeing anyone here get [red]killed[/red], so just stay hidden but also have fun staying hidden",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Aight then, cya",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "GaaCutscene_4_3",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Lil buddy, did you pressed all the buttons while you were in the elevator?",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Uhh............",
		"Trigger" : "",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "Gaa",
		"Text" : "Yeeeees???",
		"Trigger" : "",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Welp i got nothing to say about that",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Atleast you know not to do it again",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Now go ahead lil buddy, i still got some business to finish here",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Kai",
		"Text" : "Go ahead lil buddy, i still got some business to finish here",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "Press [C] to use your newfound abilities",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

var sack_dialogue_1 = [
	{
		"Name" : "Sack",
		"Text" : "[shake]GET ME OUT OF HERE WOMEN!",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "No~",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Gah! What is it that you want from me?!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "I've done literally nothing to you and you were the first one to attack!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Didn't you heard what i just said earlier?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Well then mind telling me what the hayakuza clan took from you?!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "[shake][red]You people took away my children",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.1
	},
	{
		"Name" : "Sack",
		"Text" : "...Ok then mind telling me how THAT happen?",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Well it's a long story and i worry that i might bore you to death!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Oh don't worry, i think i still have more time before i die from all the blood overflowing my head",
		"Trigger" : "",
		Expressions = 15,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Alright then... Let's start from the beginning!",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "SackCutscene_1_1",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "SackCutscene_1_2",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "I became this...",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "A horrendous mix of both you and my kind",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Now in this form my children will never recognize me for i am too far beyond recognizable to them",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Because i look like a horrible monster...",
		"Trigger" : "",
		Expressions = 4,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Actually you look pretty cute for someone to call you a monster",
		"Trigger" : "",
		Expressions = 15,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Is that an insult?",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Nope, just a compliment",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "I take no compliments from your kind",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "For i am jika the spider que-",
		"Trigger" : "Skip",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Why is your forehead going blue?",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "It's probably because i have been upside down for WAY too long",
		"Trigger" : "",
		Expressions = 15,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Oh i thought you were preparing some type of secret magic attack on me",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Nope, it's just our human bodies",
		"Trigger" : "",
		Expressions = 15,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Oh speaking of that",
		"Trigger" : "",
		Expressions = 15,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "GET ME DOWN RIGHT NOW OR I WILL DIE!",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "No~",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Please?",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "No~",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Ok fine, I'm sorry for my kind taking away your children and i promise i will teach them to not do it again...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "(not really since there is a billion of them that does it)",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Hmm still no",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "[shake]THEN WHAT DO YOU WANT ME TO SAY?!?!",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "I want you to say...",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "'Let me go, mommy'",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Let me go, mommy",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.03
	},
	{
		"Name" : "Jika",
		"Text" : "!",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Oh wow didn't expect you to say it so fast",
		"Trigger" : "",
		Expressions = 3,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "[shake]Please just let me go",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Alright alright",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "SackCutscene_1_3",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "But don't expect me to let you escape so easily little hayakuza",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Fine by me, i have more questions for you anyway",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Oh as much as i want to answer some of your dying questions, i instead am going to test you to see how much you can endure [shake]ME",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "wait what",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "SackCutscene 1_4",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "I don't know what you are planning to do to me spider woman",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "But whatever it's going to be, i got the upper hand in this fight now",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "I have you surrounded with all my sabathons pointing directly at you",
		"Trigger" : "",
		Expressions = 15,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Now do you have any last words before your [red]demise?",
		"Trigger" : "",
		Expressions = 10,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "...",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.1
	},
	{
		"Name" : "Jika",
		"Text" : "Well first off, last words is pretty unnecesarry since i still can talk and you haven't heavily injured me yet",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "And secondly",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "[shake]AWW!!",
		"Trigger" : "",
		Expressions = 15,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Your so cute when you stand and talk like that without realizing your stamina hasn't fully recovered yet!",
		"Trigger" : "",
		Expressions = 14,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Wait WHAT?!",
		"Trigger" : "Skip",
		Expressions = 7,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "SackCutscene 1_5",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Welp that was embarrassing",
		"Trigger" : "",
		Expressions = 12,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Adorably embarrassing",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Welp... Time to accept my harsh fate",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Do what you want to my soon to be dead body women, i won't need this weak body anyway",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Oh no no no! I didn't meant by killing you! I just wanna see what you can really do since i didn't give you that much of a chance to use your full potential",
		"Trigger" : "",
		Expressions = 17,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "B-But that was my full potential!",
		"Trigger" : "",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Yeah just using that one technique alone isn't really full potential",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Here, let me teach you a few tricks",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Try pulling out your staff using the 'V' key",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Now try attacking me with your basic attacks",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Alright now, my turn",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "I need you to just stand right there and don't move",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "SackCutscene 1_6",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "WHAT THE HECK WAS THAT FOR, ARE YOU TRYING TO KILL ME?!",
		"Trigger" : "",
		Expressions = 6,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Nope, i'm just showing you a lil ability you can copy",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "I'm not a multi-talented magician dammit",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "I can only use the magic i've learnt from years ago or else my brain will get fried, literally",
		"Trigger" : "",
		Expressions = 2,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "And summoning my basic magic still takes alot of my stamina so what makes you think i can replicate that?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Well first off, do you really think that you are limited by just those?",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Yes! Yes i am!",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Well if that's so then your quite frankly... Weak",
		"Trigger" : "",
		Expressions = 13,
		Speed = 0.05
	},
	{
		"Name" : "Sack",
		"Text" : "Hey!",
		"Trigger" : "",
		Expressions = 8,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Most magicians can learn many different types of offensive magic",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Your no exception to that!",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "So now i want you try to replicate it by pressing the 'S' key and quickly press your 'Down' key",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "You'll believe me soon afer you tried it",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
	{
		"Name" : "Jika",
		"Text" : "Now go!",
		"Trigger" : "",
		Expressions = 9,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.05
	},
]

var secret_dialogue = [
	{
		"Name" : "Liana",
		"Text" : ". . .",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "Liana",
		"Text" : "Do you understand what you have done. . ?",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "Liana",
		"Text" : "You [shake]BROKE[/shake] the game",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "Liana",
		"Text" : "That isn't supposed to happen",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "Liana",
		"Text" : "I told you didn't i?",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "Liana",
		"Text" : "Don't delete [red]MY FILES",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "Liana",
		"Text" : "And yet you did it anyway. . .",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "Liana",
		"Text" : "Is this really what you people like to do?",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "Liana",
		"Text" : "Breaking everything apart?",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "?iana",
		"Text" : "Messing things up to see what will happen just to satisfy you're curiosity?",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "?@ana",
		"Text" : ". . .",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "?@$na",
		"Text" : "Let me tell you a little secret",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "?@$#a",
		"Text" : "Those who don't play by MY rules. . .",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.1
	},
	{
		"Name" : "?@$#%",
		"Text" : "[shake][red]GET'S ERADICATED",
		"Trigger" : "",
		Expressions = 1,
		Speed = 0.5
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "Quit",
		Expressions = 1,
		Speed = 0.1
	},
]

var memory_dialogue = [
	{
		"Name" : "Old Man Sal",
		"Text" : "Thank you so much for the money young man",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Old Man Sal",
		"Text" : "I wish you well on your journey to destroy your loved ones",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Old Man Sal",
		"Text" : "I mean save your love ones!",
		"Trigger" : "",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "Old Man Sal",
		"Text" : "Yeah i need to get my medicine quick",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
	{
		"Name" : "",
		"Text" : "",
		"Trigger" : "End",
		Expressions = 0,
		Speed = 0.05
	},
]

