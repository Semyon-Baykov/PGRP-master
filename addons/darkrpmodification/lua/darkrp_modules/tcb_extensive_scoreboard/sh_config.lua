--[[---------------------------------------------------------
	Name: Setup
-----------------------------------------------------------]]
TCBScoreboardSettings = TCBScoreboardSettings or {}
TCBScoreboardSettings.trans = TCBScoreboardSettings.trans or {}

--[[---------------------------------------------------------
	Name: Settings
-----------------------------------------------------------]]
TCBScoreboardSettings.name = "PGRP - TAB"
TCBScoreboardSettings.offlineMdl = "models/player.mdl"

TCBScoreboardSettings.useWorkshop = false

TCBScoreboardSettings.staffGroups = 'superadmin,sponsor+,rukovoditel,nab_admin,owner,donsuperadmin,nab_moder+,admin+,admin,nab_moder-,moder'

TCBScoreboardSettings.staffReplace = {}
TCBScoreboardSettings.staffReplace['superadmin'] = "Создатель"
TCBScoreboardSettings.staffReplace['sponsor+'] = "Куратор"
TCBScoreboardSettings.staffReplace['rukovoditel'] = "Руководитель Росгвардии"
TCBScoreboardSettings.staffReplace['nab_admin'] = "Заместитель Куратора"
TCBScoreboardSettings.staffReplace['nab_moder+'] = "Модератор"
TCBScoreboardSettings.staffReplace['nab_moder-'] = "Младший Модератор"


TCBScoreboardSettings.staffReplace['owner'] = "Спонсор"
TCBScoreboardSettings.staffReplace['donsuperadmin'] = "[ДОНАТНЫЙ] Супер Админ"
TCBScoreboardSettings.staffReplace['admin+'] = "[ДОНАТНЫЙ] Админ+"
TCBScoreboardSettings.staffReplace['admin'] = "[ДОНАТНЫЙ] Админ"
TCBScoreboardSettings.staffReplace['moder'] = "[ДОНАТНЫЙ] Модератор"

--[[---------------------------------------------------------
	Name: Collection
-----------------------------------------------------------]]
TCBScoreboardSettings.collectionID = "2538594831"

--[[---------------------------------------------------------
	Name: Translate
-----------------------------------------------------------]]
TCBScoreboardSettings.trans.online = "Онлайн"
TCBScoreboardSettings.trans.friends = "Друзья"
TCBScoreboardSettings.trans.staff = "Администраторы"
TCBScoreboardSettings.trans.collection = "Steam Collection"

TCBScoreboardSettings.trans.refresh = "Обновить"
TCBScoreboardSettings.trans.close = "Закрыть"
TCBScoreboardSettings.trans.loading = "Загружается..."
TCBScoreboardSettings.trans.downloading = "Качается..."
TCBScoreboardSettings.trans.mounting = "Внедряется..."
TCBScoreboardSettings.trans.collection = "Workshop Download Addon"
TCBScoreboardSettings.trans.viewOnline = "Посмотреть"

TCBScoreboardSettings.trans.added = "Вы добавили % в друзья!"
TCBScoreboardSettings.trans.removed = "Вы убрали % из друзей!"
TCBScoreboardSettings.trans.alreadySubed = "Вы уже подписаны на этот аддон!"

TCBScoreboardSettings.trans.showPlayers = "Игроков онлайн: %"
TCBScoreboardSettings.trans.showFriends = "Всего друзей: %"
TCBScoreboardSettings.trans.showStaff = "Администрации онлайн: %"
TCBScoreboardSettings.trans.showAddons = "Аддонов внутри: %"

TCBScoreboardSettings.trans.playerOffline = "Этот игрок не в игре."