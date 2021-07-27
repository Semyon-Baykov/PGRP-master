AddCSLuaFile()

ENT.Base = 'base_ai'

ENT.PrintName = 'RG NPC'
ENT.Author = 'KaiL'
ENT.Information = ''
ENT.Category = 'GPRP'
ENT.Editable = false
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.Spawnable = true
ENT.AdminSpawnable = true

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
	function ENT:Initialize()
		AddNPCText( self, 'Роман Петухов', 'Приемная комиссия Росгвардии', Color( 30, 100, 30 ) )
	end
else
	function ENT:Initialize()
		self:SetModel( 'models/player/kerry/odessa_npc.mdl' )
		self:SetHullType( HULL_HUMAN )
		self:SetHullSizeNormal( )
		self:SetNPCState( NPC_STATE_SCRIPT )
		self:SetSolid( SOLID_BBOX )
		self:SetUseType( SIMPLE_USE )
	end

	function ENT:AcceptInput( input, _, ply )
		if string.lower( input ) != 'use' then return end

		if IsValid( ply ) and ply:IsPlayer() then
			ply:SendLua( 'gp_rg.FirstJoinMenu()' )
		end 
	end
end
