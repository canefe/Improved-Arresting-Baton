local optarrest = optarrest or {}

--[[-------------------------------------------------------------------------
isimler
---------------------------------------------------------------------------]]
optarrest.level1_isim = "Basit (120sn)"
optarrest.level2_isim = "Ortalama (240sn)"
optarrest.level3_isim = "Zorlu (480sn)"
optarrest.level4_isim = "Tehlikeli (600sn)"
--[[-------------------------------------------------------------------------
süreler (sn)
---------------------------------------------------------------------------]]
optarrest.level1_sure = 120
optarrest.level2_sure = 240
optarrest.level3_sure = 480
optarrest.level4_sure = 600

if SERVER then util.AddNetworkString("opt_arrest_test") util.AddNetworkString("optarrest")

net.Receive("optarrest", function(len,pl)

	local victim = net.ReadEntity()
	local time = net.ReadInt(32)

	if IsValid(victim) then

		victim:arrest(time,pl)

	end
 
end)


end

net.Receive("opt_arrest_test", function()
local vic = net.ReadEntity()
local Menu = DermaMenu() 		-- Is the same as vgui.Create( "DMenu" )

		-- Adds a simple line spacer

local SubMenu = Menu:AddOption("Seviye blrlynz.")
Menu:AddSpacer()

local btnWithIcon = Menu:AddOption( optarrest.level1_isim )
btnWithIcon:SetIcon( "icon16/lightning.png" )
btnWithIcon.OnMousePressed = function( button, key )
	net.Start("optarrest")
		net.WriteEntity(vic)
		net.WriteInt(optarrest.level1_sure,32)
	net.SendToServer()
	Menu:Remove()
end

local btnWithIcon2 = Menu:AddOption( optarrest.level2_isim )
btnWithIcon2:SetIcon( "icon16/exclamation.png" )
btnWithIcon2.OnMousePressed = function( button, key )
	net.Start("optarrest")
		net.WriteEntity(vic)
		net.WriteInt(optarrest.level2_sure,32)
	net.SendToServer()
	Menu:Remove()
end

local btnWithIcon3 = Menu:AddOption( optarrest.level3_isim )
btnWithIcon3:SetIcon( "icon16/cross.png" )
btnWithIcon3.OnMousePressed = function( button, key )
	net.Start("optarrest")
		net.WriteEntity(vic)
		net.WriteInt(optarrest.level3_sure,32)
	net.SendToServer()
	Menu:Remove()
end

local btnWithIcon4 = Menu:AddOption( optarrest.level4_isim )
btnWithIcon4:SetIcon( "icon16/error.png" )
btnWithIcon4.OnMousePressed = function( button, key )
	net.Start("optarrest")
		net.WriteEntity(vic)
		net.WriteInt(optarrest.level4_sure,32)
	net.SendToServer()
	Menu:Remove()
end


Menu:Open()
Menu:SetPos(ScrW()/2, ScrH()/2)
end)
