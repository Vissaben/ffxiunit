local math = require('math')
local string = require('string')
local ui = require('core.ui')
local player = require('player')
local party = require('party')
local target = require('target')
local memory = require('memory')
local windower = require('windower')
local items = require('items')

local Player_dialog = {}
local Party1_dialog = {}
local Party2_dialog = {}
local Party3_dialog = {}
local Party4_dialog = {}
local Party5_dialog = {}
local Party5_closed = {}

local configuration = {
    common = {
	    hp_color = white,
		string_player = 'Arial size:14px color:white',
		string_party1 = 'Arial size:14px color:white',
		string_party2 = 'Arial size:14px color:white',
		string_party3 = 'Arial size:14px color:white',
		string_party4 = 'Arial size:14px color:white',
		string_party5 = 'Arial size:14px color:white',
	},
	background = {
	    x = 0,
        y = 0,
        width = 200,
        height = 55,
	},
	player = {
	    style = 'simple',
        x = 250,
        y = 250,
        width = 300,
        height = 55,
	    resizable = true,
	    movable = true,
	    closable = true,
	    color = ui.color.transparent,
	},
	party1 = {
	    style = 'simple',
        x = 250,
        y = 250,
        width = 200,
        height = 55,
	    resizable = true,
	    movable = true,
	    closable = true,
	    color = ui.color.transparent,
	},
	party2 = {
	    style = 'simple',
        x = 250,
        y = 250,
        width = 200,
        height = 55,
	    resizable = true,
	    movable = true,
	    closable = true,
	    color = ui.color.transparent,
	},
	party3 = {
	    style = 'simple',
        x = 250,
        y = 250,
        width = 200,
        height = 55,
	    resizable = true,
	    movable = true,
	    closable = true,
	    color = ui.color.transparent,
	},
	party4 = {
	    style = 'simple',
        x = 250,
        y = 250,
        width = 200,
        height = 55,
	    resizable = true,
	    movable = true,
	    closable = true,
	    color = ui.color.transparent,
	},
	party5 = {
	    style = 'simple',
        x = 250,
        y = 250,
        width = 200,
        height = 55,
	    resizable = true,
	    movable = true,
	    closable = true,
	    color = ui.color.transparent,
	},
}

ui.display(function()
    Player_dialog = ui.window('distance', configuration.player, function()
	    local scrn_width = windower.settings.ui_size.width
		local scrn_height = windower.settings.ui_size.height
		configuration.player.x = scrn_width - 305
		configuration.player.y = scrn_height - 60
	    ui.location(0, 0)
		ui.image(windower.package_path .. '/imgs/Unit.png', configuration.background)
	    ui.location(4, 2)
	    ui.text('[Lvl '.. player.main_job_level .. ' ' .. player.name .. ']{' .. configuration.common.string_player .. '}')
		ui.location(175, 2)
		ui.text('[Gil: ' .. comma_value(items.gil) .. ']{Arial size:14px color:white}')
		ui.location(10, 24)
		ui.size(160, 14)
		configuration.common.hp_color = ui.color.deepskyblue
		ui.progress(player.hp_percent/100, {color = configuration.common.hp_color})
		ui.location(65, 25)
		ui.text('[' .. player.hp .. '/' .. player.hp_max .. ']{Arial size:11px color:white}')
		ui.location(10, 37)
		ui.size(160, 14)
		configuration.common.hp_color = ui.color.cadetblue
		ui.progress(player.mp_percent/100, {color = configuration.common.hp_color})
		ui.location(65, 38)
		ui.text('[' .. player.mp .. '/' .. player.mp_max .. ']{Arial size:11px color:white}')
		ui.location(175, 24)
		ui.size(100, 14)
		configuration.common.hp_color = ui.color.orchid
		ui.progress(get_party(1, 'tpp'), {color = configuration.common.hp_color})
		ui.location(215, 25)
		ui.text('[' .. player.tp .. ']{Arial size:11px color:white}')
		ui.location(175, 37)
		ui.size(50, 14)
		configuration.common.hp_color = ui.color.deepskyblue
		ui.progress(get_pet('hp'), {color = configuration.common.hp_color})
		ui.location(190, 38)
		ui.text('[' .. get_pet('hpp') .. ']{Arial size:11px color:white}')
		ui.location(225, 37)
		ui.size(50, 14)
		configuration.common.hp_color = ui.color.orchid
		local pettp = 100
		if pet then
		    
		end
		ui.progress(pettp, {color = configuration.common.hp_color})
	end)
	
	if party[2] then
		Party1_dialog = ui.window('distance', configuration.party1, function()
			local scrn_width = windower.settings.ui_size.width
			local scrn_height = windower.settings.ui_size.height
			configuration.party1.x = scrn_width - 205
			configuration.party1.y = scrn_height - 120
			ui.location(0, 0)
			ui.image(windower.package_path .. '/imgs/Unit2.png', configuration.background)
			ui.location(4, 2)
			ui.text('['.. get_party(2, 'name') .. ']{' .. configuration.common.string_party1 .. '}')
			ui.location(175, 2)
			ui.text('[]{Arial size:14px color:white}')
			ui.location(10, 24)
			ui.size(160, 14)
			configuration.common.hp_color = ui.color.deepskyblue
			ui.progress(get_party(2, 'hpp'), {color = configuration.common.hp_color})
			ui.location(65, 25)
			ui.text('[' .. get_party(2, 'hp') .. '-' .. get_party(2, 'hpp') .. '%]{Arial size:11px color:white}')
			ui.location(10, 37)
			ui.size(160, 14)
			configuration.common.hp_color = ui.color.cadetblue
			ui.progress(get_party(2, 'mpp'), {color = configuration.common.hp_color})
			ui.location(65, 38)
			ui.text('[' .. get_party(2, 'mp') .. '-' .. get_party(2, 'mpp') .. '%]{Arial size:11px color:white}')
			ui.location(70, 4)
			ui.size(100, 14)
			configuration.common.hp_color = ui.color.orchid
			ui.progress(get_party(2, 'tpp'), {color = configuration.common.hp_color})
			ui.location(110, 5)
			ui.text('[' .. get_party(2, 'tp') .. ']{Arial size:11px color:white}')
		end)
	end
	
	if party[3] then
		Party2_dialog = ui.window('distance', configuration.party2, function()
			local scrn_width = windower.settings.ui_size.width
			local scrn_height = windower.settings.ui_size.height
			configuration.party2.x = scrn_width - 205
			configuration.party2.y = scrn_height - 180
			ui.location(0, 0)
			ui.image(windower.package_path .. '/imgs/Unit2.png', configuration.background)
			ui.location(4, 2)
			ui.text('['.. get_party(3, 'name') .. ']{' .. configuration.common.string_party2 .. '}')
			ui.location(175, 2)
			ui.text('[]{Arial size:14px color:white}')
			ui.location(10, 24)
			ui.size(160, 14)
			configuration.common.hp_color = ui.color.deepskyblue
			ui.progress(get_party(3, 'hpp'), {color = configuration.common.hp_color})
			ui.location(65, 25)
			ui.text('[' .. get_party(3, 'hp') .. '-' .. get_party(3, 'hpp') .. '%]{Arial size:11px color:white}')
			ui.location(10, 37)
			ui.size(160, 14)
			configuration.common.hp_color = ui.color.cadetblue
			ui.progress(get_party(3, 'hpp'), {color = configuration.common.hp_color})
			ui.location(65, 38)
			ui.text('[' .. get_party(3, 'mp') .. '-' .. get_party(3, 'mpp') .. '%]{Arial size:11px color:white}')
			ui.location(70, 4)
			ui.size(100, 14)
			configuration.common.hp_color = ui.color.orchid
			ui.progress(get_party(3, 'tpp'), {color = configuration.common.hp_color})
			ui.location(110, 5)
			ui.text('[' .. get_party(3, 'tp') .. ']{Arial size:11px color:white}')
		end)
	end
	
	if party[4] then
		Party3_dialog = ui.window('distance', configuration.party3, function()
			local scrn_width = windower.settings.ui_size.width
			local scrn_height = windower.settings.ui_size.height
			configuration.party3.x = scrn_width - 205
			configuration.party3.y = scrn_height - 240
			ui.location(0, 0)
			ui.image(windower.package_path .. '/imgs/Unit2.png', configuration.background)
			ui.location(4, 2)
			ui.text('['.. get_party(4, 'name') .. ']{' .. configuration.common.string_party3 .. '}')
			ui.location(175, 2)
			ui.text('[]{Arial size:14px color:white}')
			ui.location(10, 24)
			ui.size(160, 14)
			configuration.common.hp_color = ui.color.deepskyblue
			ui.progress(get_party(4, 'hpp'), {color = configuration.common.hp_color})
			ui.location(65, 25)
			ui.text('[' .. get_party(4, 'hp') .. '-' .. get_party(4, 'hpp') .. '%]{Arial size:11px color:white}')
			ui.location(10, 37)
			ui.size(160, 14)
			configuration.common.hp_color = ui.color.cadetblue
			ui.progress(get_party(4, 'mpp'), {color = configuration.common.hp_color})
			ui.location(65, 38)
			ui.text('[' .. get_party(4, 'mp') .. '-' .. get_party(4, 'mpp') .. '%]{Arial size:11px color:white}')
			ui.location(70, 4)
			ui.size(100, 14)
			configuration.common.hp_color = ui.color.orchid
			ui.progress(get_party(4, 'tpp'), {color = configuration.common.hp_color})
			ui.location(110, 5)
			ui.text('[' .. get_party(4, 'tp') .. ']{Arial size:11px color:white}')
		end)
	end
	
	if party[5] then
		Party4_dialog = ui.window('distance', configuration.party4, function()
			local scrn_width = windower.settings.ui_size.width
			local scrn_height = windower.settings.ui_size.height
			configuration.party4.x = scrn_width - 205
			configuration.party4.y = scrn_height - 300
			ui.location(0, 0)
			ui.image(windower.package_path .. '/imgs/Unit2.png', configuration.background)
			ui.location(4, 2)
			ui.text('['.. get_party(5, 'name') .. ']{' .. configuration.common.string_party4 .. '}')
			ui.location(175, 2)
			ui.text('[]{Arial size:14px color:white}')
			ui.location(10, 24)
			ui.size(160, 14)
			configuration.common.hp_color = ui.color.deepskyblue
			ui.progress(get_party(5, 'hpp'), {color = configuration.common.hp_color})
			ui.location(65, 25)
			ui.text('[' .. get_party(5, 'hp') .. '-' .. get_party(5, 'hpp') .. '%]{Arial size:11px color:white}')
			ui.location(10, 37)
			ui.size(160, 14)
			configuration.common.hp_color = ui.color.cadetblue
			ui.progress(get_party(5, 'mpp'), {color = configuration.common.hp_color})
			ui.location(65, 38)
			ui.text('[' .. get_party(5, 'mp') .. '-' .. get_party(5, 'mpp') .. '%]{Arial size:11px color:white}')
			ui.location(70, 4)
			ui.size(100, 14)
			configuration.common.hp_color = ui.color.orchid
			ui.progress(get_party(5, 'tpp'), {color = configuration.common.hp_color})
			ui.location(110, 5)
			ui.text('[' .. get_party(5, 'tp') .. ']{Arial size:11px color:white}')
		end)
	end
	
	if party[6] then
		Party5_dialog = ui.window('party5_window', configuration.party5, function()
			local scrn_width = windower.settings.ui_size.width
			local scrn_height = windower.settings.ui_size.height
			configuration.party5.x = scrn_width - 205
			configuration.party5.y = scrn_height - 360
			ui.location(0, 0)
			ui.image(windower.package_path .. '/imgs/Unit2.png', configuration.background)
			ui.location(4, 2)
			ui.text('['.. get_party(6, 'name') .. ']{' .. configuration.common.string_party5 .. '}')
			ui.location(175, 2)
			ui.text('[]{Arial size:14px color:white}')
			ui.location(10, 24)
			ui.size(160, 14)
			configuration.common.hp_color = ui.color.deepskyblue
			ui.progress(get_party(6, 'hpp'), {color = configuration.common.hp_color})
			ui.location(65, 25)
			ui.text('[' .. get_party(6, 'hp') .. '-' .. get_party(6, 'hpp') .. '%]{Arial size:11px color:white}')
			ui.location(10, 37)
			ui.size(160, 14)
			configuration.common.hp_color = ui.color.cadetblue
			ui.progress(get_party(6, 'mpp'), {color = configuration.common.hp_color})
			ui.location(65, 38)
			ui.text('[' .. get_party(6, 'mp') .. '-' .. get_party(6, 'mpp') .. '%]{Arial size:11px color:white}')
			ui.location(70, 4)
			ui.size(100, 14)
			configuration.common.hp_color = ui.color.orchid
			ui.progress(get_party(6, 'tpp'), {color = configuration.common.hp_color})
			ui.location(110, 5)
			ui.text('[' .. get_party(6, 'tp') .. ']{Arial size:11px color:white}')
		end)
	end
	
	get_target()
end)

function get_pet(stat)
	local tmp = 0
	if target.pet then
		local pet = target.pet
		tmp = pet.hp_percent
	end
	return tmp
end

function get_party(unit, value)
    local tmp
	if party[unit] then
        if value == 'name' then tmp = party[unit].name
		elseif value == 'hp' then tmp = party[unit].hp
		elseif value == 'hpp' then tmp = party[unit].hp_percent
		elseif value == 'mp' then tmp = party[unit].mp
		elseif value == 'mpp' then tmp = party[unit].mp_percent
		elseif value == 'tp' then tmp = party[unit].tp
		elseif value == 'tpp' then tmp = math.sqrt(party[unit].tp/3000)
		end
	else
	    tmp = 0
    end
	return tmp
end

function get_target()
    local cur_target
	if target.t then cur_target = target.t
	    if party[2] then
			if cur_target.id == party[2].id then configuration.common.string_party1 = 'Arial size:14px color:yellow' else configuration.common.string_party1 = 'Arial size:14px color:white' end
		end
		if party[3] then
			if cur_target.id == party[3].id then configuration.common.string_party2 = 'Arial size:14px color:yellow' else configuration.common.string_party2 = 'Arial size:14px color:white' end
		end
		if party[4] then
			if cur_target.id == party[4].id then configuration.common.string_party3 = 'Arial size:14px color:yellow' else configuration.common.string_party3 = 'Arial size:14px color:white' end
		end
		if party[5] then
			if cur_target.id == party[5].id then configuration.common.string_party4 = 'Arial size:14px color:yellow' else configuration.common.string_party4 = 'Arial size:14px color:white' end
		end
		if party[6] then
			if cur_target.id == party[6].id then configuration.common.string_party5 = 'Arial size:14px color:yellow' else configuration.common.string_party5 = 'Arial size:14px color:white' end
		end
	else
		configuration.common.string_party1 = 'Arial size:14px color:white'
		configuration.common.string_party2 = 'Arial size:14px color:white'
		configuration.common.string_party3 = 'Arial size:14px color:white'
		configuration.common.string_party4 = 'Arial size:14px color:white'
		configuration.common.string_party5 = 'Arial size:14px color:white'
	end
end

function comma_value(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end