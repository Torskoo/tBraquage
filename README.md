# Braquage FiveM - RageUI v2

Ce script FiveM propose un script de Braquage entièrement configurable, conçu spécifiquement pour ESX Legacy. Le menu est optimisé pour une utilisation fluide avec une utilisation minimale du CPU (0.00ms). Veuillez noter que ce script est mis à disposition sans support, en cas de report de problème, veuillez me contacter sur Discord (Torskoo_), script toujours maintenu à jours.

## Configuration

### Modification des temps/gains des braquges

Dans le fichier `config.lua`, vous pouvez modifier les gains et le temps de chaque braquage en ajustant les paramètres sous la section `Braquage`.

```lua
Braquage = {
		Position = {
			-- Permet d'ajouter ou de supprimer des banques (position exact du point de braquage)
			{ x = 146.96296691895, y = -1045.9333496094, z = 28.368032455444 },  -- 1 / 8
			{ x = -1211.1370849609, y = -336.52755737305, z = 36.781162261963 },  -- 2 / 8
			{ x = -2956.744140625, y = 481.7004699707, z = 14.697064399719 },    -- 3 / 8
			{ x = -103.40770721436, y = 6475.4189453125, z = 29.64709854126 },   -- 4 / 8
			{ x = 311.09878540039, y = -284.19415283203, z = 53.165054321289 },  -- 5 / 8
			{ x = -353.86306762695, y = -55.289680480957, z = 48.03776550293 },  -- 6 / 8
			{ x = 253.33299255371, y = 228.42306518555, z = 101.68330383301 },  -- 7 / 8
			{ x = 1176.0723876953, y = 2712.6469726563, z = 37.088062286377 }   -- 8 / 8
		},
		Config = {
			-- Liste des braquages disponibles (pas de maximum, récompense et temps ajustable.)
			{name = "Commencer le braquage ~b~débutant", sousname = "Récompense : 15000~g~$~s~ ",  time = 0.0002, money = 15000},
			{name = "Commencer le braquage ~b~intermédiaire", sousname = "Récompense : 30000~g~$~s~ ",  time = 0.0003, money = 30000},
			{name = "Commencer le braquage ~b~expérimenté", sousname = "Récompense : 55000~g~$~s~ ",  time = 0.0004, money = 55000}
		},
		Cooldown = {
			-- Cooldown (temps d'attente) entre chaque braquage
			Temps = "6000000" -- en ms (6000000ms = 100 minutes)
		}
	}
```

**Avertissement** : Assurez-vous de comprendre le fonctionnement de ESX Legacy et du framework RageUI v2 avant de procéder à des modifications avancées.
