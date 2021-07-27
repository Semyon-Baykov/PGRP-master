// Some Util Functions
local function FindPlayerByName( name )
	local retval = nil
	for i,v in pairs( Player.GetAll() ) do
		if v.Nick() == name then retval = v end
	end
	return retval
end

local function FindJobByName( name )
	local retval = nil
	for i,v in pairs( RPExtraTeams ) do
		if string.lower( v.name ) == string.lower( name ) then retval = {i, v} end
	end
	return retval
end

local CATEGORY_NAME = "DarkRP"

// !addmoney
function ulx.addMoney( calling_ply, target_ply, amount )
	local total = target_ply:getDarkRPVar("money") + math.floor(amount)
	total = hook.Call("playerWalletChanged", GAMEMODE, target_ply, amount, target_ply:getDarkRPVar("money")) or total
	target_ply:setDarkRPVar("money", total)
	if target_ply.DarkRPUnInitialized then return end
	DarkRP.storeMoney(target_ply, total)
	ulx.fancyLogAdmin( calling_ply, "#A gave #T $#i", target_ply, amount )
end
local addMoney = ulx.command( CATEGORY_NAME, "ulx addmoney", ulx.addMoney, "!addmoney" )
addMoney:addParam{ type=ULib.cmds.PlayerArg }
addMoney:addParam{ type=ULib.cmds.NumArg, hint="money" }
addMoney:defaultAccess( ULib.ACCESS_ADMIN )
addMoney:help( "Adds money to players DarkRP wallet." )

// !setname
function ulx.setName( calling_ply, target_ply, name )
	ulx.fancyLogAdmin( calling_ply, "#A set #T's RP Name to #s", target_ply, name )
	target_Ply:setRPName( name )
end
local setName = ulx.command( CATEGORY_NAME, "ulx setname", ulx.setName, "!setname" )
setName:addParam{ type=ULib.cmds.PlayerArg }
setName:addParam{ type=ULib.cmds.StringArg, hint="new name", ULib.cmds.takeRestOfLine }
setName:defaultAccess( ULib.ACCESS_ADMIN )
setName:help( "Sets target's RPName." )

local surnames = { 'Смирнов', 'Иванов', 'Кузнецов', 'Новиков', 'Морозов', 'Петров', 'Павлов', 'Семёнов', 'Богданов', 'Воробьёв', 'Тарасов', 'Белов', 'Киселёв', 'Макаров', 'Андреев', 'Ковалёв', 'Ильин', 'Гусев', 'Титов', 'Кузьмин', 'Кудрявцев', 'Баранов', 'Куликов', 'Алексеев', 'Степанов', 'Яковлев', 'Сорокин', 'Сергеев', 'Романов', 'Захаров', 'Борисов', 'Королёв', 'Герасимов', 'Пономарёв', 'Григорьев', 'Лазарев', 'Ершов', 'Никитин', 'Соболев', 'Рябов', 'Цветков', 'Данилов', 'Журавлёв', 'Николаев', 'Крылов', 'Максимов', 'Сидоров', 'Осипов', 'Белоусов', 'Федотов', 'Дорофеев', 'Егоров', 'Матвеев', 'Бобров', 'Дмитриев', 'Анисимов', 'Антонов', 'Тимофеев', 'Никифоров', 'Веселов', 'Филиппов', 'Марков', 'Большаков', 'Суханов', 'Миронов', 'Ширяев', 'Александров', 'Коновалов', 'Шестаков', 'Казаков', 'Громов', 'Фомин', 'Давыдов', 'Мельников', 'Щербаков', 'Блинов', 'Колесников', 'Афанасьев', 'Власов', 'Исаков', 'Тихонов', 'Аксёнов', 'Родионов', 'Котов', 'Зуев', 'Панов', 'Рыбаков', 'Абрамов', 'Воронов', 'Мухин', 'Архипов', 'Трофимов', 'Горшков', 'Овчинников', 'Панфилов', 'Копылов', 'Лобанов', 'Лукин', 'Беляков', 'Потапов', 'Некрасов', 'Хохлов', 'Жданов', 'Наумов', 'Шилов', 'Воронцов', 'Ермаков', 'Дроздов', 'Игнатьев', 'Савин', 'Логинов', 'Сафонов', 'Капустин', 'Кириллов', 'Моисеев', 'Елисеев', 'Кошелев', 'Костин', 'Горбачёв', 'Орехов', 'Ефремов', 'Исаев', 'Евдокимов', 'Калашников', 'Кабанов', 'Носков', 'Юдин', 'Кулагин', 'Лапин', 'Прохоров', 'Нестеров', 'Харитонов', 'Агафонов', 'Муравьёв', 'Ларионов', 'Федосеев', 'Зимин', 'Пахомов', 'Шубин', 'Игнатов', 'Филатов', 'Крюков', 'Рогов', 'Кулаков', 'Терентьев', 'Молчанов', 'Владимиров', 'Артемьев', 'Гурьев', 'Зиновьев', 'Гришин', 'Кононов', 'Дементьев', 'Ситников', 'Симонов', 'Мишин', 'Фадеев', 'Комиссаров', 'Мамонтов', 'Носов', 'Гуляев', 'Шаров', 'Устинов', 'Вишняков', 'Евсеев', 'Лаврентьев', 'Брагин', 'Константинов', 'Корнилов', 'Авдеев', 'Зыков', 'Бирюков', 'Шарапов', 'Никонов', 'Щукин', 'Дьячков', 'Одинцов', 'Сазонов', 'Якушев', 'Красильников', 'Гордеев', 'Самойлов', 'Князев', 'Беспалов', 'Уваров', 'Шашков', 'Бобылёв', 'Доронин', 'Белозёров', 'Рожков', 'Самсонов', 'Мясников', 'Лихачёв', 'Буров', 'Сысоев', 'Фомичёв', 'Русаков', 'Стрелков', 'Гущин', 'Тетерин', 'Колобов', 'Субботин', 'Фокин', 'Блохин', 'Селиверстов', 'Пестов', 'Кондратьев', 'Силин', 'Меркушев', 'Лыткин', 'Туров', 'Адлерберг', 'Армфельт', 'Берг', 'Бок', 'Будберг', 'Вагнер', 'Вульф', 'Крамер', 'Крейц', 'Ланге', 'Мейер', 'Кремер', 'Миллер', 'Михельсон', 'Оффенберг', 'Рихтер', 'Розенбах', 'Розенберг', 'Таубе', 'Унтербергер', 'Фишер', 'Фогль', 'Франк', 'Фукс', 'Циммерман', 'Шварц', 'Шлоссман', 'Шмидт', 'Шредер', 'Шталь', 'Шульц', 'Штейн', 'Шумахер', 'Эрдман', 'Бергер', 'Вебер', 'Гофман', 'Шнайдер', 'Беккер', 'Краузе', 'Шпигель', 'Кригер', 'Арендт', 'Авербах', 'Келлер', 'Пфефер', 'Остерман', 'Клейн', 'Рейснер', 'Фриш', 'Вульферт', 'Вельтман', 'Кауфман', 'Вольф', 'Розен', 'Гердт', 'Гольдшмидт', 'Агарков', 'Ададуров', 'Айдаров', 'Аипов', 'Акинфов', 'Аксаков', 'Акулов', 'Александров', 'Алисов', 'Алмазов', 'Алферов', 'Алфимов', 'Алымов', 'Аминов', 'Амиреджибов', 'Аммосов', 'Андреянов', 'Андроников', 'Анисимов', 'Аничков', 'Анненков', 'Аносов', 'Анфилогов', 'Арапов', 'Арбузов', 'Аргамаков', 'Аристов', 'Арнаутов', 'Артюхов', 'Архаров', 'Архипов', 'Астахов', 'Астрецов', 'Афремов', 'Афросимов', 'Ахматов', 'Ачкасов', 'Ашитков', 'Базаров', 'Базупов', 'Байков', 'Байчуров', 'Балабанов', 'Балашов', 'Баранов', 'Баранцов', 'Баратов', 'Баркалов', 'Барков', 'Барсуков', 'Баршов', 'Барыков', 'Барышников', 'Баскаков', 'Басов', 'Бастанов', 'Батюньков', 'Батюшков', 'Бахтеяров', 'Бачманов', 'Башкирёв', 'Башмаков', 'Бебутов', 'Бегтабеков', 'Бедняков', 'Безсонов', 'Бекарюков', 'Бекетов', 'Беклешов', 'Бекорюков', 'Белевцов', 'Беленьков', 'Белеутов', 'Белехов', 'Беликов', 'Белов', 'Белокопытов', 'Белокрыльцов', 'Бельков', 'Березников', 'Бернов', 'Беспятов', 'Бешенцов', 'Бибиков', 'Бирюков', 'Бледнов', 'Блинов', 'Блудов', 'Бобоедов', 'Бобров', 'Богданов', 'Божков', 'Бокастов', 'Болкунов', 'Болобанов', 'Болотников', 'Болотов', 'Болсунов', 'Болтенков', 'Болтов', 'Болховитинов', 'Борзенков', 'Борзов', 'Борисов', 'Борков', 'Боровитинов', 'Боршеватинов', 'Борщов', 'Ботов', 'Бражников', 'Братцов', 'Брехов', 'Брусенцов', 'Брусилов', 'Брюхатов', 'Брюхов', 'Брянцов', 'Брянчанинов', 'Булатов', 'Булгаков', 'Булдаков', 'Бунаков', 'Бурачков', 'Бурдуков', 'Бурков', 'Бурмантов', 'Буров', 'Бурунов', 'Бурцов', 'Бутаков', 'Бутков', 'Бутримов', 'Бухвостов', 'Бухонов', 'Бухтияров', 'Быков', 'Бычков', 'Вавилов', 'Ваганов', 'Валмасов', 'Вальцов', 'Варенцов', 'Васильчиков', 'Васьков', 'Васьянов', 'Вельяминов', 'Веневитинов', 'Венюков', 'Веселов', 'Ветошников', 'Вешняков', 'Виноградов', 'Владимиров', 'Власенков', 'Власов', 'Влезков', 'Внуков', 'Водов', 'Воейков', 'Вознов', 'Войников', 'Воинов', 'Волков', 'Володимиров', 'Волосатов', 'Волохов', 'Волчков', 'Воробьёв', 'Воронов', 'Воронцов', 'Воропанов', 'Восьянов', 'Вралов', 'Второв', 'Выродов', 'Вязмитинов', 'Гаврилов', 'Галахов', 'Гамов', 'Гарасимов', 'Гарбузов', 'Гедеонов', 'Гедианов', 'Гендриков', 'Герасимов', 'Гладков', 'Глазатов', 'Глазов', 'Глебов', 'Глотов', 'Глушков', 'Говоров', 'Годунов', 'Голиков', 'Головачёв', 'Головков', 'Головленков', 'Гололобов', 'Голоперов', 'Голосов', 'Голостенов', 'Голохвастов', 'Голощанов', 'Голубцов', 'Гончаров', 'Горбов', 'Горбунов', 'Горелов', 'Горихвостов', 'Горлов', 'Городчиков', 'Горохов', 'Горталов', 'Горчаков', 'Горюнов', 'Горяинов', 'Грабленов', 'Греков', 'Гречанинов', 'Грибоедов', 'Григоров', 'Грызлов', 'Грязнов', 'Губастов', 'Гулидов', 'Давидов', 'Давыдов', 'Данилов', 'Даудов', 'Дашков', 'Дворцов', 'Деменков', 'Демидов', 'Демьянов', 'Денисов', 'Десятов', 'Дивов', 'Долгов', 'Доможиров', 'Дондуков', 'Донцов', 'Драгомиров', 'Дубасов', 'Дулов', 'Дурасов', 'Дуров', 'Дьяков', 'Дьячков', 'Евдокимов', 'Евреинов', 'Евсюков', 'Егоров', 'Ельчанинов', 'Емельянов', 'Епифанов', 'Ерлыков', 'Ермолов', 'Ершов', 'Есаулов', 'Есипов', 'Ефименков', 'Ефремов', 'Жданов', 'Жемайлов', 'Жемчужников', 'Жеребцов', 'Житов', 'Жолобов', 'Жуков', 'Захаров', 'Золотарёв', 'Золотилов', 'Зотов', 'Зубатов', 'Зубов', 'Зуров', 'Зыков', 'Иванов', 'Ивков', 'Извеков', 'Изединов', 'Измайлов', 'Измалков', 'Ипатов', 'Исаков', 'Каблуков', 'Кадников', 'Кадочников', 'Казаринов', 'Казнаков', 'Кайсаров', 'Калачов', 'Каленов', 'Калмыков', 'Карабанов', 'Караулов', 'Карачаров', 'Карелов', 'Карпов', 'Касагов', 'Качалов', 'Кашинцов', 'Кашкаров', 'Кирилов', 'Киселёв', 'Кобяков', 'Кожевников', 'Козлов', 'Колзаков', 'Кологривов', 'Комаров', 'Коновалов', 'Корнилов', 'Коробов', 'Королёв', 'Корсаков', 'Костомаров', 'Костров', 'Кочетов', 'Кретов', 'Кречетников', 'Кривцов', 'Кругликов', 'Крюков', 'Кузнецов', 'Купреянов', 'Куроедов', 'Кусаков', 'Кусов', 'Кутайсов', 'Кутузов', 'Кушников', 'Лавров', 'Ларионов', 'Лачинов', 'Лашкарёв', 'Леванидов', 'Левашов', 'Легкобытов', 'Леняков', 'Лермонтов', 'Лесков', 'Лизунов', 'Литвинов', 'Лихачёв', 'Лобанов', 'Логанов', 'Логачёв', 'Ломоносов', 'Лонгинов', 'Лукьянов', 'Лутовинов', 'Лызлов', 'Лыков', 'Львов', 'Любимов', 'Ляпунов', 'Магалов', 'Мазуров', 'Майков', 'Макаров', 'Максимов', 'Мальцов', 'Мамилов', 'Мамонов', 'Мансуров', 'Мантуров', 'Марков', 'Мартынов', 'Мартьянов', 'Масалов', 'Маслов', 'Махов', 'Медников', 'Межаков', 'Мезенцов', 'Мельгунов', 'Мельников', 'Меншиков', 'Меркулов', 'Метальников', 'Мешков', 'Мещеринов', 'Минков', 'Мисюрёв', 'Митков', 'Митрофанов', 'Митусов', 'Михайлов', 'Михалков', 'Мишков', 'Молчанов', 'Монастырёв', 'Мономахов', 'Моргунов', 'Мордвинов', 'Морозов', 'Мосолов', 'Мошков', 'Муравьёв', 'Муратов', 'Муханов', 'Мясников', 'Мясоедов', 'Мяхков', 'Мячков', 'Назаров', 'Назимов', 'Нарбеков', 'Наумов', 'Неверов', 'Недобров', 'Неклюдов', 'Некрасов', 'Некрасов', 'Нелидов', 'Немцов', 'Неофитов', 'Нестеров', 'Никифоров', 'Нилов', 'Новаков', 'Новиков', 'Новосильцов', 'Облеухов', 'Обольянинов', 'Обресков', 'Обухов', 'Огарков', 'Огибалов', 'Одинцов', 'Озеров', 'Окулов', 'Оловенников', 'Орлов', 'Офросимов', 'Павлов', 'Пашков', 'Перхуров', 'Пестов', 'Пестриков', 'Петров', 'Петухов', 'Племянников', 'Позняков', 'Поленов', 'Поливанов', 'Поликарпов', 'Полозов', 'Полуектов', 'Поляков', 'Пономарёв', 'Попов', 'Протасов', 'Протопопов', 'Путилов', 'Пушешников', 'Пятов', 'Радилов', 'Ратманов', 'Ратьков', 'Рахманинов', 'Рахманов', 'Родионов', 'Рожнов', 'Романов', 'Рублёв', 'Саблуков', 'Сабуров', 'Савелов', 'Садыков', 'Сазонов', 'Салов', 'Салтыков', 'Сальков', 'Самойлов', 'Самсонов', 'Сверчков', 'Свистунов', 'Свищов', 'Селезнёв', 'Селиванов', 'Селиверстов', 'Селифонтов', 'Семёнов', 'Скорняков', 'Скуратов', 'Слепцов', 'Смирнов', 'Смольянинов', 'Соймонов', 'Соколов', 'Соловцов', 'Соловьёв', 'Сологубов', 'Солтыков', 'Сомов', 'Сонцов', 'Спиридов', 'Стариков', 'Старовойтов', 'Стаханов', 'Стогов', 'Стрекалов', 'Стремоухов', 'Строганов', 'Стромилов', 'Суворов', 'Судленков', 'Султанов', 'Сумароков', 'Сунбулов', 'Таптыков', 'Тараканов', 'Тарасов', 'Тарханов', 'Тевяшов', 'Тиньков', 'Титов', 'Толочанов', 'Третьяков', 'Троекуров', 'Трубчанинов', 'Трусов', 'Тулупов', 'Тучков', 'Тыртов', 'Уваров', 'Ульянов', 'Урусов', 'Усов', 'Ушаков', 'Фёдоров', 'Федотов', 'Филимонов', 'Филиппов', 'Философов', 'Фролов', 'Фролов', 'Фустов', 'Ханыков', 'Харитонов', 'Харламов', 'Хвостов', 'Херасков', 'Хилков', 'Хитров', 'Хлебников', 'Холщевников', 'Хомутов', 'Хомяков', 'Храпов', 'Хрипунов', 'Хрущов', 'Цветков', 'Цуриков', 'Цыгоров', 'Чарыков', 'Чашников', 'Чеботарёв', 'Чеглоков', 'Чекмарёв', 'Чекунов', 'Чемесов', 'Чемоданов', 'Чемодуров', 'Черемисинов', 'Черепов', 'Черкасов', 'Черкудинов', 'Чернов', 'Черноглазов', 'Чернопятов', 'Чернцов', 'Чернышёв', 'Чертков', 'Чижов', 'Чириков', 'Чистяков', 'Чихачёв', 'Чичагов', 'Чубаров', 'Чулков', 'Чупрасов', 'Шаламов', 'Шалимов', 'Шапенков', 'Шатилов', 'Шатров', 'Шафров', 'Шахматов', 'Шахов', 'Швецов', 'Шебанов', 'Шевцов', 'Шелехов', 'Шестаков', 'Шеховцов', 'Шипов', 'Ширков', 'Шиферов', 'Шихматов', 'Шишков', 'Шишмарёв', 'Шишов', 'Шмаков', 'Шувалов', 'Шулепников', 'Шумаков', 'Шуринов', 'Щеглов', 'Щегловитов', 'Щербаков', 'Щербатов', 'Щербачёв', 'Щербов', 'Щуленников', 'Щуров', 'Эристов', 'Юматов', 'Юрасов', 'Юрлов', 'Юсупов', 'Юшков', 'Яблочков', 'Языков', 'Якимов' }

local names = { 'Абакум', 'Абрам', 'Абросим', 'Аввакум', 'Август', 'Авдей', 'Авдий', 'Авель', 'Авенир', 'Аверий', 'Аверкий', 'Аверьян', 'Авксентий', 'Аврам', 'Аврелиан', 'Автоном', 'Агап', 'Агапий', 'Агапит', 'Агафангел', 'Агафон', 'Аггей', 'Адам', 'Адриан', 'Азар', 'Азарий', 'Акакий', 'Акила', 'Аким', 'Акиндин', 'Акинф', 'Акинфий', 'Аксён', 'Аксентий', 'Александр', 'Алексей', 'Алексий', 'Альберт', 'Альфред', 'Амвросий', 'Амос', 'Амфилохий', 'Ананий', 'Анастасий', 'Анатолий', 'Андрей', 'Андриан', 'Андрон', 'Андроний', 'Андроник', 'Анект', 'Анемподист', 'Аникей', 'Аникий', 'Аникита', 'Анисий', 'Анисим', 'Антиох', 'Антип', 'Антипа', 'Антипий', 'Антон', 'Антонин', 'Антроп', 'Антропий', 'Ануфрий', 'Аполлинарий', 'Аполлон', 'Аполлос', 'Ардалион', 'Ардальон', 'Ареф', 'Арефий', 'Арий', 'Аристарх', 'Аристид', 'Аркадий', 'Арнольд', 'Арон', 'Арсений', 'Арсентий', 'Артамон', 'Артём', 'Артемий', 'Артур', 'Архип', 'Асаф', 'Асафий', 'Аскольд', 'Афанасий', 'Афиноген', 'Афинодор', 'Африкан', 'Бажен', 'Бенедикт', 'Богдан', 'Болеслав', 'Бонифат', 'Бонифатий', 'Борис', 'Борислав', 'Бронислав', 'Будимир', 'Вавила', 'Вадим', 'Валентин', 'Валериан', 'Валерий', 'Варлам', 'Варламий', 'Варнава', 'Варсоноф', 'Варсонофий', 'Варфоломей', 'Василий', 'Вассиан', 'Велизар', 'Велимир', 'Венедикт', 'Вениамин', 'Венцеслав', 'Веньямин', 'Викентий', 'Виктор', 'Викторий', 'Викул', 'Викула', 'Вилен', 'Виленин', 'Вильгельм', 'Виссарион', 'Вит', 'Виталий', 'Витовт', 'Витольд', 'Владилен', 'Владимир', 'Владислав', 'Владлен', 'Влас', 'Власий', 'Вонифат', 'Вонифатий', 'Всеволод', 'Всеслав', 'Вукол', 'Вышеслав', 'Вячеслав', 'Гавриил', 'Гаврил', 'Гаврила', 'Галактион', 'Гедеон', 'Гедимин', 'Геласий', 'Гелий', 'Геннадий', 'Генрих', 'Георгий', 'Герасим', 'Гервасий', 'Герман', 'Гермоген', 'Геронтий', 'Гиацинт', 'Глеб', 'Гораций', 'Горгоний', 'Гордей', 'Гостомысл', 'Гремислав', 'Григорий', 'Гурий', 'Гурьян', 'Давид', 'Давыд', 'Далмат', 'Даниил', 'Данил', 'Данила', 'Дементий', 'Демид', 'Демьян', 'Денис', 'Денисий', 'Димитрий', 'Диомид', 'Дионисий', 'Дмитрий', 'Добромысл', 'Добрыня', 'Довмонт', 'Доминик', 'Донат', 'Доримедонт', 'Дормедонт', 'Дормидбнт', 'Дорофей', 'Досифей', 'Евгений', 'Евграф', 'Евграфий', 'Евдоким', 'Евлампий', 'Евлогий', 'Евмен', 'Евмений', 'Евсей', 'Евстафий', 'Евстахий', 'Евстигней', 'Евстрат', 'Евстратий', 'Евтихий', 'Евфимий', 'Егор', 'Егорий', 'Елизар', 'Елисей', 'Елистрат', 'Елпидифор', 'Емельян', 'Епифан', 'Епифаний', 'Еремей', 'Ермий', 'Ермил', 'Ермила', 'Ермилий', 'Ермолай', 'Ерофей', 'Ефим', 'Ефимий', 'Ефрем', 'Ефремий', 'Захар', 'Захарий', 'Зенон', 'Зиновий', 'Зосим', 'Зосима', 'Иаким', 'Иакинф', 'Иван', 'Игнат', 'Игнатий', 'Игорь', 'Иероним', 'Измаил', 'Измарагд', 'Изосим', 'Изот', 'Изяслав', 'Илларион', 'Илиодор', 'Илья', 'Иннокентий', 'Иоанн', 'Йов', 'Иона', 'Иосафат', 'Иосиф', 'Ипат', 'Ипатий', 'Ипполит', 'Ираклий', 'Иринарх', 'Ириней', 'Иродион', 'Исаак', 'Исаакин', 'Исай', 'Исак', 'Исакий', 'Исидор', 'Иустин', 'Казимир', 'Каллимах', 'Каллиник', 'Каллиопий', 'Каллист', 'Каллистрат', 'Каллисфен', 'Калуф', 'Кандидий', 'Кантидиан', 'Капик', 'Капитон', 'Карион', 'Карл', 'Карп', 'Кастрихий', 'Касьян ', 'Ким', 'Киприан', 'Кир', 'Кириак', 'Кирик', 'Кирилл', 'Кирсан', 'Клавдий', 'Клим', 'Климент', 'Климентий', 'Кондрат', 'Кондратий', 'Конон', 'Конрад', 'Константин', 'Корней', 'Корнелий', 'Корнил', 'Корнилий', 'Ксенофонт', 'Кузьма', 'Куприян', 'Лавр', 'Лаврентий', 'Ладимир', 'Лазарь', 'Ларион', 'Лев', 'Леон', 'Леонард', 'Леонид', 'Леонтий', 'Леопольд', 'Логвин', 'Лонгин', 'Лука', 'Лукан', 'Лукьян', 'Любим', 'Любомир', 'Любомысл', 'Люциан', 'Мавр', 'Маврикий', 'Мавродий', 'Май', 'Макар', 'Макарий', 'Македон', 'Македоний', 'Максим', 'Максимиан', 'Максимилиан', 'Малх', 'Мануил', 'Марат', 'Мардарий', 'Мариан', 'Марин', 'Марк', 'Маркел', 'Маркиан', 'Марлен', 'Мартимьян', 'Мартин', 'Мартиниан', 'Мартирий', 'Мартин', 'Мартьян', 'Матвей', 'Мелентий', 'Мелетий', 'Меркул', 'Меркурий', 'Мефодий', 'Мечислав', 'Милан', 'Милен', 'Милий', 'Мина', 'Минай', 'Мирон', 'Мирослав', 'Мисаил', 'Митрофан', 'Митрофаний', 'Михаил', 'Михей', 'Модест', 'Моисей', 'Мокей', 'Мокий', 'Мстислав', 'Назар', 'Назарий', 'Наркис', 'Натан', 'Наум', 'Нестер', 'Нестор', 'Нефёд', 'Никандр', 'Никанор', 'Никита', 'Никифор', 'Никодим', 'Николай', 'Никон', 'Нил', 'Нифонт', 'Олег', 'Олимпий', 'Онисим', 'Онисифор', 'Онуфрий', 'Орест', 'Осип', 'Оскар', 'Остап', 'Остромир', 'Павел', 'Павлин', 'Паисий', 'Палладий', 'Памфил', 'Памфилий', 'Панкрат', 'Панкратий', 'Пантелей', 'Пантелеймон', 'Панфил', 'Парамон', 'Пармен', 'Парфён', 'Парфений', 'Парфентий', 'Патрикей', 'Патрикий', 'Пафнутий', 'Пахом', 'Пахомий', 'Перфилий', 'Пётр', 'Пимен', 'Питирим', 'Платон', 'Полиевкт', 'Полиект', 'Поликарп', 'Поликарпий', 'Порфир', 'Порфирий', 'Потап', 'Потапий', 'Пров', 'Прокл', 'Прокоп', 'Прокопий', 'Прокофий', 'Протас', 'Протасий', 'Прохор', 'Радий', 'Радим', 'Радислав', 'Радован', 'Ратибор ', 'Ратмир', 'Рафаил', 'Роберт', 'Родион', 'Роман', 'Ростислав', 'Рубен', 'Рувим', 'Рудольф', 'Руслан', 'Рюрик', 'Савва', 'Савватей', 'Савватий', 'Савёл', 'Савелий', 'Саверий', 'Савин ', 'Савиниан', 'Сакердон', 'Салтан', 'Самбила', 'Самсон', 'Самсоний', 'Самуил', 'Светозар', 'Свирид', 'Святополк', 'Святослав', 'Себастьян', 'Севастьян', 'Северин', 'Северьян', 'Селиван', 'Селивёрст', 'Селифан', 'Семён', 'Семион', 'Серапион', 'Серафим', 'Сергей', 'Сигизмунд', 'Сидор', 'Сила', 'Силан', 'Силантий', 'Силуян', 'Сильван', 'Сильвестр', 'Симон', 'Смарагд', 'Созон', 'Созонт', 'Созонтий', 'Сократ', 'Соломон', 'Сосипатр', 'Софон', 'Софоний', 'Софрон', 'Софроний', 'Спартак', 'Спиридон', 'Спиридоний', 'Станимир', 'Стахий', 'Станислав', 'Степан', 'Стоян', 'Стратбник', 'Сысой', 'Тарас', 'Твердислав', 'Творимир', 'Терентий', 'Тертий', 'Тигран', 'Тигрий', 'Тимофей', 'Тимур', 'Тит', 'Тихон', 'Тристан', 'Трифилий', 'Трифон', 'Трофим', 'Увар', 'Ульян', 'Устин', 'Фабиан', 'Фадей', 'Фалалей', 'Фатьян', 'Фёдор', 'Федос', 'Федосей', 'Федосий', 'Федот', 'Федотий', 'Федул', 'Феликс', 'Фемистокл', 'Феогност', 'Феоктист', 'Феофан', 'Феофил', 'Феофилакт', 'Ферапонт', 'Филарет', 'Филат', 'Филимон', 'Филипий', 'Филипп', 'Филофей', 'Фирс', 'Флавиан', 'Флавий', 'Флегонт', 'Флорентий', 'Флорентин', 'Флориан', 'Фока', 'Фома', 'Фортунат', 'Фотий', 'Фридрих', 'Фрол', 'Харитон', 'Харитоний', 'Харлам', 'Харламп', 'Харлампий', 'Хрисанф', 'Христофор', 'Эдуард', 'Эмилий', 'Эмиль', 'Эммануил', 'Эразм', 'Эраст', 'Эрнест', 'Эрнст', 'Ювеналий', 'Юлиан', 'Юлий', 'Юрий', 'Юстиниан', 'Яким', 'Яков', 'Якуб', 'Ян', 'Януарий', 'Ярополк', 'Ярослав' } 


ulx.resetname = function( calling_ply, target_ply )

	local name = table.Random( names ) .. ' ' .. table.Random( surnames )

	DarkRP.retrieveRPNames( name, function( taken )

		if taken then

			ulx.resetname( calling_ply, target_ply )

			return

		end

		ulx.fancyLogAdmin( calling_ply, '#A resetname for #T', target_ply )

		target_ply:setRPName( name )

	end )

end

local resetname = ulx.command( 'DarkRP', 'ulx resetname', ulx.resetname, '!resetname', false, false, true )

resetname:addParam{ type = ULib.cmds.PlayerArg }

resetname:defaultAccess( ULib.ACCESS_ADMIN )

resetname:help( 'Resets the name for player.' )

// !setjob
function ulx.setJob( calling_ply, target_ply, job )
	local newnum = nil
    local newjob = nil
	for i,v in pairs( RPExtraTeams ) do
		if string.find( string.lower( v.name ), string.lower( job ) ) != nil then 
			newnum = i
			newjob = v
		end
	end
	if newnum == nil then
		ULib.tsayError( calling_ply, "That job does not exist!", true )
		return 
	end
	if target_ply:Team() == TEAM_MAYOR then
		if gp_elections.mayor and gp_elections.mayor == target_ply then
			gp_elections.mayor = nil
		end
	end
	target_ply:updateJob(newjob.name)
	target_ply:setSelfDarkRPVar("salary", newjob.salary)
	target_ply:SetTeam( newnum )

	GAMEMODE:PlayerSetModel( target_ply )
	GAMEMODE:PlayerLoadout( target_ply )
	ulx.fancyLogAdmin( calling_ply, "#A set #T's job to #s", target_ply, newjob.name )
end
local setJob = ulx.command( CATEGORY_NAME, "ulx setjob", ulx.setJob, "!setjob" )
setJob:addParam{ type=ULib.cmds.PlayerArg }
setJob:addParam{ type=ULib.cmds.StringArg, hint="new job", ULib.cmds.takeRestOfLine }
setJob:defaultAccess( ULib.ACCESS_ADMIN )
setJob:help( "Sets target's Job." )

// !shipment


// !jobban
function ulx.jobBan( calling_ply, target_ply, job )
	local newnum = nil
    local newname = nil
	for i,v in pairs( RPExtraTeams ) do
		if string.find( v.name, job ) != nil then 
			newnum = i
			newname = v.name
		end
	end
	if newnum == nil then
		ULib.tsayError( calling_ply, "That job does not exist!", true )
		return
	end
	target_ply:teamBan( newnum, 0 )
	ulx.fancyLogAdmin( calling_ply, "#A has banned #T from job #s", target_ply, newname )
end
local jobBan = ulx.command( CATEGORY_NAME, "ulx jobban", ulx.jobBan, "!jobban" )
jobBan:addParam{ type=ULib.cmds.PlayerArg }
jobBan:addParam{ type=ULib.cmds.StringArg, hint="job" }
jobBan:defaultAccess( ULib.ACCESS_ADMIN )
jobBan:help( "Bans target from specified job." )

// !jobunban
function ulx.jobUnBan( calling_ply, target_ply, job )
	local newnum = nil
    local newname = nil
	for i,v in pairs( RPExtraTeams ) do
		if string.find( v.name, job ) != nil then 
			newnum = i
			newname = v.name
		end
	end
	if newnum == nil then
		ULib.tsayError( calling_ply, "That job does not exist!", true )
		return
	end
	target_ply:teamUnBan( newnum )
	ulx.fancyLogAdmin( calling_ply, "#A has unbanned #T from job #s", target_ply, newname, time )
end
local jobUnBan = ulx.command( CATEGORY_NAME, "ulx jobunban", ulx.jobUnBan, "!jobunban" )
jobUnBan:addParam{ type=ULib.cmds.PlayerArg }
jobUnBan:addParam{ type=ULib.cmds.StringArg, hint="job" }
jobUnBan:defaultAccess( ULib.ACCESS_ADMIN )
jobUnBan:help( "Unbans target from specified job." )

// !selldoor
function ulx.sellDoor( calling_ply )
	local trace = util.GetPlayerTrace( calling_ply )
	local traceRes = util.TraceLine( trace )
	local tEnt = traceRes.Entity
	if tEnt:isDoor() and tEnt:isKeysOwned() then
		tEnt:keysUnOwn( tEnt:getDoorOwner() )
		calling_ply:ChatPrint( "Door Sold!" )
	else
		ULib.tsayError( "The Entity must be a door, and it must be owned!" )
	end
end
local sellDoor = ulx.command( CATEGORY_NAME, "ulx selldoor", ulx.sellDoor, "!selldoor" )
sellDoor:defaultAccess( ULib.ACCESS_ADMIN )
sellDoor:help( "Unowns door you are looking at." )

// !doorowner
function ulx.doorOwner( calling_ply, target_ply )
	local trace = util.GetPlayerTrace( calling_ply )
	local traceRes = util.TraceLine( trace )
	local tEnt = traceRes.Entity
	if tEnt:isDoor() then
		if tEnt:isKeysOwned() then tEnt:keysUnOwn( tEnt:getDoorOwner() ) end
		tEnt:keysOwn( target_ply )
	end
end
local doorOwner = ulx.command( CATEGORY_NAME, "ulx doorowner", ulx.doorOwner, "!doorowner" )
doorOwner:addParam{ type=ULib.cmds.PlayerArg }
doorOwner:defaultAccess( ULib.ACCESS_ADMIN )
doorOwner:help( "Sets the door owner of the door you are looking at." )

// !arrest
function ulx.arrest( calling_ply, target_ply, time )
	target_ply:arrest( time or GM.Config.jailtimer, calling_ply )
	ulx.fancyLogAdmin( calling_ply, "#A force arrested #T for #i seconds", target_ply, time or GAMEMODE.Config.jailtimer )
end
local Arrest = ulx.command( CATEGORY_NAME, "ulx arrest", ulx.arrest, "!arrest" )
Arrest:addParam{ type=ULib.cmds.PlayerArg }
Arrest:addParam{ type=ULib.cmds.NumArg, hint="arrest time", min=0, ULib.cmds.optional }
Arrest:defaultAccess( ULib.ACCESS_ADMIN )
Arrest:help( "Force arrest someone." )

// !unarrest
function ulx.unArrest( calling_ply, target_ply )
	if target_ply:isArrested() then target_ply:unArrest( calling_ply ) else
		ULib.tsayError( calling_ply, "The target needs to be arrested in the first place!" )
		return
	end
	ulx.fancyLogAdmin( calling_ply, "#A force unarrested #T", target_ply )
end
local unArrest = ulx.command( CATEGORY_NAME, "ulx unarrest", ulx.unArrest, "!unarrest" )
unArrest:addParam{ type=ULib.cmds.PlayerArg }
unArrest:defaultAccess( ULib.ACCESS_ADMIN )
unArrest:help( "Force unarrest someone." )

// !lockdown
function ulx.lockdown( calling_ply )
	for k,v in pairs(player.GetAll()) do
		v:ConCommand("play npc/overwatch/cityvoice/f_confirmcivilstatus_1_spkr.wav\n")
	end
	lstat = true
	DarkRP.printMessageAll(HUD_PRINTTALK, DarkRP.getPhrase("lockdown_started"))
	RunConsoleCommand("DarkRP_LockDown", 1)
	ulx.fancyLogAdmin( calling_ply, "#A forced a lockdown" )
end
local lockdown = ulx.command( CATEGORY_NAME, "ulx lockdown", ulx.lockdown, "!lockdown" )
lockdown:defaultAccess( ULib.ACCESS_ADMIN )
lockdown:help( "Force a lockdown." )

// !unlockdown
function ulx.unLockdown( calling_ply )
	DarkRP.printMessageAll(HUD_PRINTTALK, DarkRP.getPhrase("lockdown_ended"))
	RunConsoleCommand("DarkRP_LockDown", 0)
	ulx.fancyLogAdmin( calling_ply, "#A force removed the lockdown" )
end
local unLockdown = ulx.command( CATEGORY_NAME, "ulx unlockdown", ulx.unLockdown, "!unlockdown" )
unLockdown:defaultAccess( ULib.ACCESS_ADMIN )
unLockdown:help( "Force remove the lockdown." )