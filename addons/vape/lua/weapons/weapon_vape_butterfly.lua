-- weapon_vape_buttefly.lua
-- Defines a vape that flips like a butterfly knife

-- Vape SWEP by Swamp Onions - http://steamcommunity.com/id/swamponions/

if CLIENT then
	include('weapon_vape/cl_init.lua')
else
	include('weapon_vape/shared.lua')
end

SWEP.PrintName = "Вертушка"

SWEP.Instructions = "Обычный вейп. Можно крутить!"

SWEP.VapeAccentColor = Vector(0.2,0.2,0.3)
SWEP.VapeTankColor = Vector(0.1,0.1,0.1)

SWEP.VapeVMAng2 = Vector(360+170,720-108,132)