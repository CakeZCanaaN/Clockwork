--[[
	� 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode
--]]

local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("PlyVoiceBan");
COMMAND.tip = "Ban a player from the server.";
COMMAND.text = "<string Name|SteamID|IPAddress>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if (IsValid(target)) then
		if (!target:GetData("VoiceBan")) then
			target:SetData("VoiceBan", true);
		else
			Clockwork.player:Notify(player, target:Name().." is already banned from using voice!");
		end;
	end;
end;

COMMAND:Register();