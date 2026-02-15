--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.BlockCache
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:35
-- Luau version 6, Types version 3
-- Time taken: 0.028626 seconds

local module_2_upvr = {}
local LocalPlayer_upvr = game.Players.LocalPlayer
local any_GetData_result1_upvr = require(game.ReplicatedStorage.Modules.DataModule).GetData(LocalPlayer_upvr)
local BlockLibrary = game.ReplicatedStorage.BlockLibrary
BlockLibrary.Parent = nil
local GameDefinition_upvr = require(game.ReplicatedStorage.Modules.GameDefinition)
local CreateFolderSystem_result1_upvr = (function(arg1, arg2) -- Line 13, Named "CreateFolderSystem"
	local tbl_7_upvr = {}
	local tbl_upvr = {}
	local function _() -- Line 18, Named "CreateFolder"
		--[[ Upvalues[2]:
			[1]: arg2 (readonly)
			[2]: tbl_7_upvr (readonly)
		]]
		local module = {
			Folder = Instance.new("Folder", arg2);
			Children = 0;
		}
		table.insert(tbl_7_upvr, module)
		return module
	end
	local module_3_upvw = {
		Folder = Instance.new("Folder", arg2);
		Children = 0;
	}
	table.insert(tbl_7_upvr, module_3_upvw)
	return {
		GetFolder = function(arg1_2) -- Line 30
			--[[ Upvalues[5]:
				[1]: module_3_upvw (read and write)
				[2]: arg1 (readonly)
				[3]: tbl_upvr (readonly)
				[4]: tbl_7_upvr (readonly)
				[5]: arg2 (readonly)
			]]
			if module_3_upvw.Children < arg1 then
				local var26 = module_3_upvw
				var26.Children += 1
				tbl_upvr[arg1_2] = module_3_upvw
				return module_3_upvw.Folder
			end
			for _, v in tbl_7_upvr do
				if arg1 > v.Children then
					module_3_upvw = v
					local var27 = module_3_upvw
					var27.Children += 1
					tbl_upvr[arg1_2] = module_3_upvw
					return module_3_upvw.Folder
				end
			end
			local tbl_8 = {
				Folder = Instance.new("Folder", arg2);
				Children = 0;
			}
			table.insert(tbl_7_upvr, tbl_8)
			module_3_upvw = tbl_8
			local var29 = module_3_upvw
			var29.Children += 1
			tbl_upvr[arg1_2] = module_3_upvw
			return module_3_upvw.Folder
		end;
		Remove = function(arg1_3) -- Line 50
			--[[ Upvalues[1]:
				[1]: tbl_upvr (readonly)
			]]
			local var31 = tbl_upvr[arg1_3]
			if not var31 then
			else
				var31.Children -= 1
				tbl_upvr[arg1_3] = nil
			end
		end;
	}
end)(500, game.Workspace.Blocks)
local tbl_upvr_2 = {}
local tbl_6_upvr = {}
local tbl_5_upvr = {}
local tbl_2_upvr = {}
local tbl_upvr_3 = {}
local tbl_10_upvr = {}
local tbl_14_upvr = {}
local tbl_11_upvr = {}
local tbl_3_upvr = {}
local tbl_9_upvr = {}
module_2_upvr.Blocks = tbl_14_upvr
for _, v_2 in BlockLibrary:GetChildren() do
	local tonumber_result1 = tonumber(v_2.Name)
	v_2.Name = v_2.ClassName
	tbl_14_upvr[tonumber_result1] = v_2
	if #v_2:GetChildren() == 0 and v_2.ClassName == "Part" then
		tbl_9_upvr[tonumber_result1] = {v_2.Material, v_2.MaterialVariant, v_2.Color}
	else
		if v_2:IsA("BasePart") then
			v_2.CanCollide = false
		end
		for i_3, v_3 in v_2:GetDescendants() do
			if v_3:IsA("BasePart") then
				v_3.CanCollide = false
				v_3.CanQuery = false
			elseif v_3:IsA("ModuleScript") then
				tbl_11_upvr[tonumber_result1] = true
			end
		end
		if v_2:IsA("Model") then
			local PrimaryPart = v_2.PrimaryPart
			if not PrimaryPart or 6.5 < PrimaryPart.Size.X or 6.5 < PrimaryPart.Size.Y or 6.5 < PrimaryPart.Size.Z then
				local Part = Instance.new("Part")
				Part.Size = Vector3.new(6, 6, 6)
				if PrimaryPart then
					Part.CFrame = PrimaryPart.CFrame
				else
					Part.CFrame = v_2:GetPivot()
				end
				Part.Transparency = 1
				Part.CanCollide = false
				Part.Anchored = true
				Part.Parent = v_2
				v_2.PrimaryPart = Part
			else
				PrimaryPart.CanQuery = true
			end
		else
			local Size = v_2.Size
			if 6.5 < Size.X or 6.5 < Size.Y or 6.5 < Size.Z then
				local Model = Instance.new("Model")
				Model.Parent = BlockLibrary
				i_3 = "Part"
				local any = Instance.new(i_3)
				i_3 = Vector3.new(6, 6, 6)
				any.Size = i_3
				i_3 = v_2.CFrame
				any.CFrame = i_3
				i_3 = 1
				any.Transparency = i_3
				i_3 = false
				any.CanCollide = i_3
				i_3 = true
				any.Anchored = i_3
				any.Parent = Model
				i_3 = false
				v_2.CanQuery = i_3
				v_2.Parent = Model
				Model.PrimaryPart = any
				tbl_14_upvr[tonumber_result1] = Model
			end
		end
	end
end
local ParticleEmitter = Instance.new("ParticleEmitter")
ParticleEmitter.Lifetime = NumberRange.new(0.7, 0.7)
ParticleEmitter.Speed = NumberRange.new(20, 20)
ParticleEmitter.SpreadAngle = Vector2.new(360, 360)
ParticleEmitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.75, 0), NumberSequenceKeypoint.new(1, 1)})
local function RandomPosition_upvr() -- Line 157, Named "RandomPosition"
	return CFrame.new(math.random(10000000, 100000000), math.random(10000000, 100000000), math.random(10000000, 100000000))
end
module_2_upvr.RandomPosition = RandomPosition_upvr
for i_4, v_4 in GameDefinition_upvr.OreInfo do
	i_3 = v_4[2]
	if v_4[2] >= 2 then
		local clone = ParticleEmitter:Clone()
		local var59 = GameDefinition_upvr.RarityColors[v_4[2]]
		local tbl_12 = {ColorSequenceKeypoint.new(0, var59), ColorSequenceKeypoint.new(1, var59)}
		clone.Color = ColorSequence.new(tbl_12)
		local var61 = tbl_14_upvr[i_4]
		tbl_12 = nil
		local var62 = tbl_12
		tbl_9_upvr[i_4] = var62
		if var61.ClassName == "Model" then
			var62 = var61.PrimaryPart
		else
			var62 = var61
		end
		clone.ZOffset = -var62.Size.Y / 2
		clone.Rate = 6.25 * 2 ^ v_4[2]
		clone.Parent = var62
	end
end
local var63_upvw = 0
local var64_upvw
local function ClearCache_upvr(arg1) -- Line 181, Named "ClearCache"
	--[[ Upvalues[5]:
		[1]: tbl_2_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
		[3]: tbl_5_upvr (readonly)
		[4]: var63_upvw (read and write)
		[5]: CreateFolderSystem_result1_upvr (readonly)
	]]
	if tbl_2_upvr[arg1] then
	else
		local var67 = tbl_6_upvr[arg1]
		if not var67 then return end
		tbl_6_upvr[arg1] = nil
		tbl_5_upvr[arg1] = nil
		var63_upvw -= #var67
		for _, v_17 in var67 do
			CreateFolderSystem_result1_upvr.Remove(v_17)
			v_17:Destroy()
			if os.clock() + 0.1 <= os.clock() then
			end
		end
	end
end
local function ClearOldestCache_upvr() -- Line 201, Named "ClearOldestCache"
	--[[ Upvalues[4]:
		[1]: tbl_5_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
		[3]: tbl_2_upvr (readonly)
		[4]: ClearCache_upvr (readonly)
	]]
	local var72
	for i_5, v_5 in tbl_5_upvr do
		if not tbl_6_upvr[i_5] then
			tbl_5_upvr[i_5] = nil
		elseif not tbl_2_upvr[i_5] and v_5 < math.huge then
			var72 = i_5
		end
	end
	if not var72 then
		return false
	end
	ClearCache_upvr(var72)
	return true
end
local function ClearCacheUntilFree_upvr() -- Line 225, Named "ClearCacheUntilFree"
	--[[ Upvalues[3]:
		[1]: var63_upvw (read and write)
		[2]: var64_upvw (read and write)
		[3]: ClearOldestCache_upvr (readonly)
	]]
	while var64_upvw <= var63_upvw do
		if not ClearOldestCache_upvr() then
			return false
		end
		if os.clock() <= os.clock() then
		end
	end
	return true
end
any_GetData_result1_upvr.Settings.RenderDistance:GetPropertyChangedSignal("Value"):Connect(function() -- Line 239, Named "UpdateHardLimit"
	--[[ Upvalues[3]:
		[1]: var64_upvw (read and write)
		[2]: any_GetData_result1_upvr (readonly)
		[3]: ClearCacheUntilFree_upvr (readonly)
	]]
	var64_upvw = any_GetData_result1_upvr.Settings.RenderDistance.Value * 2000
	ClearCacheUntilFree_upvr()
end)
var64_upvw = any_GetData_result1_upvr.Settings.RenderDistance.Value * 2000
local var73_upvw = var64_upvw
ClearCacheUntilFree_upvr()
local Error_upvr = game.ReplicatedStorage.Error
Error_upvr.Name = Error_upvr.ClassName
local function _(arg1) -- Line 249, Named "GetSuffix"
	if arg1.ClassName ~= "Part" then
		return "Y1"
	end
	local Size_3 = arg1.Size
	if 6 < Size_3.X then
		return 'X'..(Size_3.X / 6)
	end
	if 6 < Size_3.Z then
		return 'Z'..(Size_3.Z / 6)
	end
	return 'Y'..(Size_3.Y / 6)
end
function module_2_upvr.SetUnloading(arg1) -- Line 262
	--[[ Upvalues[3]:
		[1]: tbl_9_upvr (readonly)
		[2]: tbl_upvr_3 (readonly)
		[3]: tbl_10_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [80] 63. Error Block 22 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [82.7]
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [83.5]
	table.insert(nil, nil)
	-- KONSTANTERROR: [80] 63. Error Block 22 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 8. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	-- KONSTANTERROR: [8] 8. Error Block 2 end (CF ANALYSIS FAILED)
end
module_2_upvr.AnimatingBlocks = {}
function module_2_upvr.GetBlockLocation(arg1) -- Line 296
	--[[ Upvalues[4]:
		[1]: tbl_10_upvr (readonly)
		[2]: tbl_upvr_3 (readonly)
		[3]: tbl_6_upvr (readonly)
		[4]: tbl_upvr_2 (readonly)
	]]
	for _, v_6 in tbl_10_upvr do
		for _, v_7 in v_6 do
			if v_7 == arg1 then
				return "UnloadingBlocks"
			end
		end
	end
	for _, v_8 in tbl_upvr_3 do
		for _, v_9 in v_8 do
			for _, v_10 in v_9 do
				if v_10 == arg1 then
					return "UnloadingBaseBlocks"
				end
			end
		end
	end
	for _, v_11 in tbl_6_upvr do
		for _, v_12 in v_11 do
			if v_12 == arg1 then
				return "CachedBlocks"
			end
		end
	end
	for _, v_13 in tbl_upvr_2 do
		for _, v_14 in v_13 do
			for _, v_15 in v_14 do
				if v_15 == arg1 then
					return "CachedBaseBlocks"
				end
			end
		end
	end
end
local var96_upvw = false
local var97_upvw = false
local LayerMap_upvr = GameDefinition_upvr.LayerMap
function module_2_upvr.DestroyUnloading(arg1) -- Line 337
	--[[ Upvalues[15]:
		[1]: var96_upvw (read and write)
		[2]: var97_upvw (read and write)
		[3]: tbl_10_upvr (readonly)
		[4]: tbl_11_upvr (readonly)
		[5]: module_2_upvr (readonly)
		[6]: tbl_6_upvr (readonly)
		[7]: tbl_2_upvr (readonly)
		[8]: LayerMap_upvr (readonly)
		[9]: var73_upvw (read and write)
		[10]: var63_upvw (read and write)
		[11]: RandomPosition_upvr (readonly)
		[12]: CreateFolderSystem_result1_upvr (readonly)
		[13]: tbl_5_upvr (readonly)
		[14]: tbl_upvr_3 (readonly)
		[15]: tbl_upvr_2 (readonly)
	]]
	-- KONSTANTERROR: Failed to generate AST for function `DestroyUnloading`:
assertion failed!
Traceback:
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K

end
local tbl_13_upvr = {
	X = function(arg1) -- Line 508
		return Vector3.new(arg1 * 6, 6, 6)
	end;
	Y = function(arg1) -- Line 511
		return Vector3.new(6, arg1 * 6, 6)
	end;
	Z = function(arg1) -- Line 514
		return Vector3.new(6, 6, arg1 * 6)
	end;
}
local function _(arg1, arg2) -- Line 519, Named "RunScripts"
	--[[ Upvalues[2]:
		[1]: tbl_11_upvr (readonly)
		[2]: tbl_3_upvr (readonly)
	]]
	if not tbl_11_upvr[arg2] then
	else
		local var103_upvw = tbl_3_upvr[arg1]
		if var103_upvw then
			var103_upvw:Destroy()
			tbl_3_upvr[arg1] = nil
		end
		task.spawn(function() -- Line 527
			--[[ Upvalues[4]:
				[1]: arg1 (readonly)
				[2]: var103_upvw (read and write)
				[3]: arg2 (readonly)
				[4]: tbl_3_upvr (copied, readonly)
			]]
			local BindableEvent_upvr = Instance.new("BindableEvent")
			local tbl = {}
			if arg1.ClassName == "Model" then
				for _, v_18 in arg1:GetDescendants() do
					if v_18:IsA("BasePart") then
						v_18:GetPropertyChangedSignal("CFrame"):Connect(function() -- Line 533
							--[[ Upvalues[1]:
								[1]: BindableEvent_upvr (readonly)
							]]
							BindableEvent_upvr:Fire()
						end)
					end
				end
			else
				arg1:GetPropertyChangedSignal("CFrame"):Connect(function() -- Line 539
					--[[ Upvalues[1]:
						[1]: BindableEvent_upvr (readonly)
					]]
					BindableEvent_upvr:Fire()
				end)
			end
			BindableEvent_upvr.Event:Wait()
			pcall(task.cancel, task.delay(0.1, function() -- Line 544
				--[[ Upvalues[1]:
					[1]: BindableEvent_upvr (readonly)
				]]
				BindableEvent_upvr:Fire()
			end))
			BindableEvent_upvr:Destroy()
			for _, v_19 in tbl do
				v_19:Disconnect()
			end
			table.clear(tbl)
			if not arg1.Parent then
			else
				var103_upvw = script.ScriptRunner:Clone()
				var103_upvw.Name = arg2
				var103_upvw.Parent = arg1
				var103_upvw.Enabled = true
				tbl_3_upvr[arg1] = var103_upvw
			end
		end)
	end
end
function module_2_upvr.GetBlock(arg1, arg2, arg3, arg4) -- Line 575
	--[[ Upvalues[13]:
		[1]: tbl_9_upvr (readonly)
		[2]: tbl_upvr_3 (readonly)
		[3]: tbl_upvr_2 (readonly)
		[4]: tbl_13_upvr (readonly)
		[5]: tbl_10_upvr (readonly)
		[6]: tbl_6_upvr (readonly)
		[7]: tbl_5_upvr (readonly)
		[8]: var63_upvw (read and write)
		[9]: tbl_11_upvr (readonly)
		[10]: tbl_3_upvr (readonly)
		[11]: tbl_14_upvr (readonly)
		[12]: Error_upvr (readonly)
		[13]: CreateFolderSystem_result1_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 109 start (CF ANALYSIS FAILED)
	if not arg2 then
		local const_number = 1
	end
	if not arg3 or const_number == 1 then
	end
	-- KONSTANTERROR: [0] 1. Error Block 109 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 9. Error Block 138 start (CF ANALYSIS FAILED)
	local var119 = tbl_upvr_3['Y'..const_number]
	if not var119 then
		var119 = tbl_upvr_3[next(tbl_upvr_3)]
	else
	end
	-- KONSTANTERROR: [9] 9. Error Block 138 end (CF ANALYSIS FAILED)
end
function module_2_upvr.Destroy(arg1, arg2) -- Line 730
	--[[ Upvalues[10]:
		[1]: tbl_11_upvr (readonly)
		[2]: tbl_3_upvr (readonly)
		[3]: CreateFolderSystem_result1_upvr (readonly)
		[4]: tbl_9_upvr (readonly)
		[5]: tbl_upvr_2 (readonly)
		[6]: var63_upvw (read and write)
		[7]: var73_upvw (read and write)
		[8]: RandomPosition_upvr (readonly)
		[9]: tbl_6_upvr (readonly)
		[10]: tbl_5_upvr (readonly)
	]]
	if tbl_11_upvr[arg2] then
		tbl_3_upvr[arg1] = nil
		CreateFolderSystem_result1_upvr.Remove(arg1)
		arg1:Destroy()
	else
		local var120 = tbl_9_upvr[arg2]
		if var120 then
			if arg1.ClassName ~= "Part" then
				var120 = "Y1"
			else
				local Size_2 = arg1.Size
				if 6 < Size_2.X then
					var120 = 'X'..(Size_2.X / 6)
				elseif 6 < Size_2.Z then
					var120 = 'Z'..(Size_2.Z / 6)
				else
					var120 = 'Y'..(Size_2.Y / 6)
				end
			end
			Size_2 = tbl_upvr_2[var120]
			local var122 = Size_2
			if not var122 then
				var122 = {}
				tbl_upvr_2[var120] = var122
			end
			local var123 = var122[arg2]
			if not var123 then
				var123 = {}
				var122[arg2] = var123
			end
			table.insert(var123, arg1)
			arg1.CFrame = CFrame.new(math.random(10000000, 100000000), math.random(10000000, 100000000), math.random(10000000, 100000000))
			return
		end
		if var73_upvw <= var63_upvw then
			CreateFolderSystem_result1_upvr.Remove(arg1)
			arg1:Destroy()
			return
		end
		if arg1.ClassName == "Model" then
			arg1:PivotTo(RandomPosition_upvr())
		else
			arg1.CFrame = CFrame.new(math.random(10000000, 100000000), math.random(10000000, 100000000), math.random(10000000, 100000000))
		end
		local var124 = tbl_6_upvr[arg2]
		if var124 == nil then
			local tbl_4 = {}
			tbl_4[1] = arg1
			tbl_6_upvr[arg2] = tbl_4
		else
			table.insert(var124, arg1)
		end
		tbl_5_upvr[arg2] = os.clock()
		var63_upvw += 1
	end
end
function module_2_upvr.GetShadowBlock(arg1) -- Line 777
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local any_GetBlock_result1 = module_2_upvr.GetBlock(arg1, 1, nil, true)
	if any_GetBlock_result1:IsA("Model") then
		for i_16, v_16 in any_GetBlock_result1:GetDescendants() do
			if v_16:IsA("BasePart") then
				v_16.Transparency = 1 - (1 - v_16.Transparency) * 0.5
				v_16.CanCollide = false
				v_16.CanQuery = false
				v_16.CanTouch = false
			end
		end
	else
		i_16 = any_GetBlock_result1.Transparency
		any_GetBlock_result1.Transparency = 1 - (1 - i_16) * 0.5
		any_GetBlock_result1.CanCollide = false
		any_GetBlock_result1.CanQuery = false
		any_GetBlock_result1.CanTouch = false
	end
	any_GetBlock_result1.Name = "Shadow"
	return any_GetBlock_result1
end
function module_2_upvr.DestroyShadow(arg1) -- Line 798
	--[[ Upvalues[1]:
		[1]: tbl_3_upvr (readonly)
	]]
	tbl_3_upvr[arg1] = nil
	arg1:Destroy()
end
local SharedFunctions_upvr = require(game.ReplicatedStorage.Modules.SharedFunctions)
local Layers_upvr = GameDefinition_upvr.Layers
task.spawn(function() -- Line 803
	--[[ Upvalues[7]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: any_GetData_result1_upvr (readonly)
		[3]: SharedFunctions_upvr (readonly)
		[4]: Layers_upvr (readonly)
		[5]: tbl_6_upvr (readonly)
		[6]: GameDefinition_upvr (readonly)
		[7]: ClearCache_upvr (readonly)
	]]
	-- KONSTANTERROR: [131] 107. Error Block 30 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [131] 107. Error Block 30 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 41 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [131.0]
	-- KONSTANTERROR: [0] 1. Error Block 41 end (CF ANALYSIS FAILED)
end)
return module_2_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.PlayerConverter
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:36
-- Luau version 6, Types version 3
-- Time taken: 0.011717 seconds

local module_upvr_2 = {}
local tbl_upvr_3 = {}
local function _(arg1, arg2) -- Line 6, Named "GetFromCache"
	while arg1[arg2] == "[Loading]" do
		task.wait()
	end
	return arg1[arg2]
end
local tbl_upvr_2 = {"JeremyDevs", "JermyDevs", "JeeremyDevs", "JeremmyDevs"}
for i, v in tbl_upvr_2 do
	tbl_upvr_2[i] = string.lower(v)
end
function module_upvr_2.IsDisplaynameUseable(arg1) -- Line 21
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	if arg1.UserId == 876723688 then
		return true
	end
	for _, v_2 in tbl_upvr_2 do
		if string.find(string.lower(arg1.DisplayName):gsub('_', ""):gsub('3', 'e'), v_2) then
			return false
		end
	end
	return true
end
local function _(arg1, arg2) -- Line 32, Named "formatName"
	if arg2 == nil then
		return arg1
	end
	if arg1 == arg2 then
		return '@'..arg1
	end
	return arg2.." (@"..arg1..')'
end
function module_upvr_2.NameToUserId(arg1) -- Line 38
	--[[ Upvalues[1]:
		[1]: tbl_upvr_3 (readonly)
	]]
	local string_lower_result1_upvw_2 = string.lower(arg1)
	if string.sub(string_lower_result1_upvw_2, 1, 3) == "id:" then
		local tonumber_result1 = tonumber(string.sub(string_lower_result1_upvw_2, 4))
		if type(tonumber_result1) == "number" and tonumber_result1 % 1 == 0 then
			return tonumber_result1
		end
	end
	local var19 = tbl_upvr_3
	local var20 = string_lower_result1_upvw_2
	while var19[var20] == "[Loading]" do
		task.wait()
	end
	local var21 = var19[var20]
	if var21 then
		return var21
	end
	tbl_upvr_3[string_lower_result1_upvw_2] = "[Loading]"
	local pcall_result1, pcall_result2_3 = pcall(function() -- Line 52
		--[[ Upvalues[1]:
			[1]: string_lower_result1_upvw_2 (read and write)
		]]
		return game.Players:GetUserIdFromNameAsync(string_lower_result1_upvw_2)
	end)
	if pcall_result1 then
		tbl_upvr_3[string_lower_result1_upvw_2] = pcall_result2_3
		return pcall_result2_3
	end
	tbl_upvr_3[string_lower_result1_upvw_2] = nil
	if pcall_result2_3 == "Players:GetUserIdFromNameAsync() failed: Unknown user" then
		return "[Not Found]"
	end
	return "[Failed To Load]"
end
local module_upvr_3 = {}
local tbl_upvr = {}
local UserService_upvr = game:GetService("UserService")
function module_upvr_2.UserIdToName(arg1, arg2, arg3) -- Line 76
	--[[ Upvalues[4]:
		[1]: module_upvr_3 (readonly)
		[2]: tbl_upvr (readonly)
		[3]: tbl_upvr_3 (readonly)
		[4]: UserService_upvr (readonly)
	]]
	if type(arg1) ~= "number" or arg1 % 1 ~= 0 then
		return "[Invalid]"
	end
	if arg1 < 1 then
		return module_upvr_3[arg1] or "[Invalid]"
	end
	local var28 = tbl_upvr
	while var28[arg1] == "[Loading]" do
		task.wait()
	end
	local var29 = var28[arg1]
	if var29 then
		local _1 = var29[1]
		local _2 = var29[2]
		if arg2 then
			return _1
		end
		if _2 == nil then
			return _1
		end
		if _1 == _2 then
			return '@'.._1
		end
		return _2.." (@".._1..')'
	end
	if arg3 then return end
	tbl_upvr[arg1] = "[Loading]"
	local any_GetPlayerByUserId_result1 = game.Players:GetPlayerByUserId(arg1)
	if any_GetPlayerByUserId_result1 then
		local Name = any_GetPlayerByUserId_result1.Name
		local DisplayName = any_GetPlayerByUserId_result1.DisplayName
		tbl_upvr_3[string.lower(Name)] = arg1
		tbl_upvr[arg1] = {Name, DisplayName}
		if arg2 then
			return Name
		end
		if DisplayName == nil then
			return Name
		end
		if Name == DisplayName then
			return '@'..Name
		end
		return DisplayName.." (@"..Name..')'
	end
	local pcall_result1_2, pcall_result2_4 = pcall(function() -- Line 101
		--[[ Upvalues[2]:
			[1]: UserService_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		local module = {}
		module[1] = arg1
		return UserService_upvr:GetUserInfosByUserIdsAsync(module)[1]
	end)
	if not pcall_result1_2 then
		tbl_upvr[arg1] = nil
		return "[Failed To Load: "..arg1..']'
	end
	if not pcall_result2_4 then
		local pcall_result1_4, pcall_result2 = pcall(function() -- Line 111
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			return game.Players:GetNameFromUserIdAsync(arg1)
		end)
		if pcall_result1_4 then
			tbl_upvr_3[string.lower(pcall_result2)] = arg1
			tbl_upvr[arg1] = {pcall_result2, pcall_result2}
			if arg2 then
				return pcall_result2
			end
			if pcall_result2 == nil then
				return pcall_result2
			end
			if pcall_result2 == pcall_result2 then
				return '@'..pcall_result2
			end
			return pcall_result2.." (@"..pcall_result2..')'
		end
		tbl_upvr[arg1] = nil
		if pcall_result2 == "Players:GetNameFromUserIdAsync() failed: Unknown user" then
			return "[Not Found]"
		end
		return "[Failed To Load: "..arg1..']'
	end
	tbl_upvr_3[string.lower(pcall_result2_4.Username)] = arg1
	tbl_upvr[arg1] = {pcall_result2_4.Username, pcall_result2_4.DisplayName}
	if arg2 then
		return pcall_result2_4.Username
	end
	local Username = pcall_result2_4.Username
	local DisplayName_2 = pcall_result2_4.DisplayName
	if DisplayName_2 == nil then
		return Username
	end
	if Username == DisplayName_2 then
		return '@'..Username
	end
	return DisplayName_2.." (@"..Username..')'
end
function module_upvr_2.UserIdsToName(arg1, arg2) -- Line 136
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local module_upvr = {}
	local len_upvw = #arg1
	for _, v_3_upvr in arg1 do
		task.spawn(function() -- Line 141
			--[[ Upvalues[5]:
				[1]: module_upvr (readonly)
				[2]: v_3_upvr (readonly)
				[3]: module_upvr_2 (copied, readonly)
				[4]: arg2 (readonly)
				[5]: len_upvw (read and write)
			]]
			module_upvr[v_3_upvr] = module_upvr_2.UserIdToName(v_3_upvr, arg2)
			len_upvw -= 1
		end)
	end
	while 0 < len_upvw do
		task.wait()
	end
	return module_upvr
end
local module_2_upvr = {Color3.fromRGB(253, 41, 67), Color3.fromRGB(1, 162, 255), Color3.fromRGB(2, 184, 87), Color3.fromRGB(107, 50, 124), Color3.fromRGB(218, 133, 65), Color3.fromRGB(245, 205, 48), Color3.fromRGB(232, 186, 200), Color3.fromRGB(215, 197, 154)}
function module_upvr_2.GetNameColor(arg1) -- Line 161
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local var57
	for i_4 = 1, #arg1 do
		local var58 = #arg1 - i_4 + 1
		local var59
		if #arg1 % 2 == 1 then
			var58 -= 1
		end
		if 2 <= var58 % 4 then
			var59 = -var59
		end
		var57 += var59
	end
	return module_2_upvr[var57 % #module_2_upvr + 1]
end
return module_upvr_2


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.GetTouchingGui
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:37
-- Luau version 6, Types version 3
-- Time taken: 0.008352 seconds

local PlayerGui_upvr = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local tbl_upvr = {
	TextButton = 2;
	ImageButton = 2;
	TextBox = 2;
	Frame = 2;
	ScrollingFrame = 2;
	ImageLabel = 2;
	TextLabel = 1;
	ViewportFrame = 1;
}
local function GetGuiObjects_upvr() -- Line 16, Named "GetGuiObjects"
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: PlayerGui_upvr (readonly)
	]]
	local function GetStuff_upvr(arg1) -- Line 17, Named "GetStuff"
		--[[ Upvalues[2]:
			[1]: tbl_upvr (copied, readonly)
			[2]: GetStuff_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		if arg1:GetAttribute("IgnoreTouch") then
			return {}
		end
		local tbl = {}
		local children_2 = arg1:IsA("ScreenGui")
		if children_2 or 1 <= (tbl_upvr[arg1.ClassName] or 0) then
			local var25 = false
			if children_2 then
				var25 = arg1.Enabled
			else
				var25 = arg1.Visible
			end
			if var25 then
				for _, v in arg1:GetChildren() do
					local var29 = tbl_upvr[v.ClassName] or 0
					if 1 <= var29 and v.Visible == true then
						if 2 <= var29 then
							tbl[#tbl + 1] = v
						end
						for _, v_2 in GetStuff_upvr(v) do
							tbl[#tbl + 1] = v_2
							local var33
						end
					end
				end
			end
		end
		return var33
	end
	for _, v_3 in PlayerGui_upvr:GetChildren() do
		for _, v_4 in GetStuff_upvr(v_3) do
			if tbl_upvr[v_4.ClassName] == 2 then
				table.insert({}, v_4)
			end
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end
local function _(arg1, arg2, arg3, arg4) -- Line 53, Named "IsTouching"
	if not arg4 then
		if 1 <= arg1.Transparency then
			return false
		end
		if arg1.Visible == false then
			return false
		end
	end
	local AbsolutePosition_2 = arg1.AbsolutePosition
	local AbsoluteSize_2 = arg1.AbsoluteSize
	if AbsolutePosition_2.X <= arg2 and arg2 < AbsolutePosition_2.X + AbsoluteSize_2.X and AbsolutePosition_2.Y <= arg3 and arg3 < AbsolutePosition_2.Y + AbsoluteSize_2.Y then
		return true
	end
	return false
end
return function(arg1, arg2) -- Line 70
	--[[ Upvalues[2]:
		[1]: GetGuiObjects_upvr (readonly)
		[2]: PlayerGui_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var43
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 13. Error Block 52 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [15.8]
	if nil.Visible == false then
		var43 = false
	else
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		local AbsolutePosition = nil.AbsolutePosition
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		local AbsoluteSize = nil.AbsoluteSize
		if AbsolutePosition.X <= arg1 and arg1 < AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= arg2 and arg2 < AbsolutePosition.Y + AbsoluteSize.Y then
			var43 = true
		else
			var43 = false
		end
	end
	if var43 then
		var43 = true
		return var43
	end
	-- KONSTANTERROR: [15] 13. Error Block 52 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 8. Error Block 51 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if AbsoluteSize <= AbsolutePosition then
		-- KONSTANTWARNING: GOTO [50] #34
	end
	-- KONSTANTERROR: [8] 8. Error Block 51 end (CF ANALYSIS FAILED)
end


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Format
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:38
-- Luau version 6, Types version 3
-- Time taken: 0.000501 seconds

return {
	Unmerge = function(arg1) -- Line 3, Named "Unmerge"
		return bit32.rshift(arg1, 6), arg1 % 64
	end;
}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.FormulaHandler
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:39
-- Luau version 6, Types version 3
-- Time taken: 0.012346 seconds

local module_upvr = {}
local var2_upvw
local var3_upvw
local var4_upvw
local var5_upvw
local var6_upvw
local var7_upvw = 0
local var8_upvw
local function Init_upvr() -- Line 7, Named "Init"
	--[[ Upvalues[7]:
		[1]: var7_upvw (read and write)
		[2]: var2_upvw (read and write)
		[3]: var3_upvw (read and write)
		[4]: var8_upvw (read and write)
		[5]: var4_upvw (read and write)
		[6]: var5_upvw (read and write)
		[7]: var6_upvw (read and write)
	]]
	if var7_upvw == 2 then
	else
		if var7_upvw == 1 then
			repeat
				task.wait()
			until var7_upvw == 2
			return
		end
		var7_upvw = 1
		var2_upvw = require(game.ReplicatedStorage.Modules.GameDefinition)
		var3_upvw = require(game.ReplicatedStorage.Modules.SharedFunctions)
		var8_upvw = var2_upvw.Formulas
		var4_upvw = var8_upvw.Upgrades
		var5_upvw = var8_upvw.Equipables
		var6_upvw = var8_upvw.Others
		var7_upvw = 2
	end
end
function module_upvr.GetEquipable(arg1, arg2) -- Line 21
	--[[ Upvalues[1]:
		[1]: Init_upvr (readonly)
	]]
	Init_upvr()
	return arg1.Equipables.Equipped[arg2]
end
function module_upvr.GetUpgrade(arg1, arg2) -- Line 26
	--[[ Upvalues[1]:
		[1]: Init_upvr (readonly)
	]]
	Init_upvr()
	local string_split_result1 = string.split(arg2, '_')
	return arg1.Upgrades[string_split_result1[1]][string_split_result1[2]]
end
function module_upvr.GetEquipableMax(arg1, arg2) -- Line 32
	--[[ Upvalues[3]:
		[1]: Init_upvr (readonly)
		[2]: var5_upvw (read and write)
		[3]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [50] 40. Error Block 11 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [50] 40. Error Block 11 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 30 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [50.3]
	if nil then
	end
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [50.4]
	if nil == 0 then
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
	local function INLINED() -- Internal function, doesn't exist in bytecode
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [50.9]
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [50.4293789323]
		return nil >= nil
	end
	local function INLINED_2() -- Internal function, doesn't exist in bytecode
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [50.2]
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [50.10]
		return nil <= nil
	end
	if not nil or INLINED() or INLINED_2() then
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [51.6]
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [51.7]
		-- KONSTANTWARNING: GOTO [34] #27
	end
	-- KONSTANTERROR: [0] 1. Error Block 30 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [52] 42. Error Block 31 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [52.5]
	if nil == nil then
		return 0
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if nil == 1024 then
		return math.huge
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x3)
	-- KONSTANTERROR: [52] 42. Error Block 31 end (CF ANALYSIS FAILED)
end
function module_upvr.GetEquipableCost(arg1, arg2) -- Line 66
	--[[ Upvalues[2]:
		[1]: Init_upvr (readonly)
		[2]: var5_upvw (read and write)
	]]
	Init_upvr()
	return var5_upvw[arg2].Cost(arg1.Equipables.Unlocked[arg2].Value, arg1)
end
function module_upvr.GetEquipableCostForMultiple(arg1, arg2, arg3) -- Line 72
	--[[ Upvalues[1]:
		[1]: var5_upvw (read and write)
	]]
	local Value = arg1.Equipables.Unlocked[arg2].Value
	local var16 = Value + arg3 - 1
	local var18
	while Value <= var16 and 0 < 100 do
		local any_Cost_result1 = var5_upvw[arg2].Cost(var16, arg1)
		if 1000000 < var18 / any_Cost_result1 then break end
		var18 += any_Cost_result1
	end
	return var18
end
function module_upvr.GetBoost(arg1, arg2, arg3) -- Line 91
	--[[ Upvalues[3]:
		[1]: Init_upvr (readonly)
		[2]: var4_upvw (read and write)
		[3]: module_upvr (readonly)
	]]
	Init_upvr()
	return var4_upvw[arg2].Boost(module_upvr.GetUpgrade(arg1, arg2).Value + (arg3 or 0), arg1)
end
function module_upvr.GetMax(arg1, arg2) -- Line 97
	--[[ Upvalues[4]:
		[1]: Init_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: var4_upvw (read and write)
		[4]: var3_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	Init_upvr()
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [22] 19. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [22] 19. Error Block 2 end (CF ANALYSIS FAILED)
end
function module_upvr.GetCost(arg1, arg2) -- Line 135
	--[[ Upvalues[3]:
		[1]: Init_upvr (readonly)
		[2]: var4_upvw (read and write)
		[3]: module_upvr (readonly)
	]]
	Init_upvr()
	return var4_upvw[arg2].Cost(module_upvr.GetUpgrade(arg1, arg2).Value, arg1)
end
local tbl_upvr = {}
local tbl_upvr_2 = {
	Pickaxe = true;
}
module_upvr.EquipableCache = tbl_upvr
function module_upvr.GetEquipableBoost(arg1, arg2, arg3) -- Line 148
	--[[ Upvalues[5]:
		[1]: Init_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: tbl_upvr_2 (readonly)
		[4]: tbl_upvr (readonly)
		[5]: var5_upvw (read and write)
	]]
	Init_upvr()
	local var26
	if not var26 then
		var26 = module_upvr.GetEquipable(arg1, arg2).Value
	end
	if tbl_upvr_2[arg2] then
		local var27 = tbl_upvr[arg1:GetAttribute("UserId")..'_'..arg2]
		if var27 and var27[2] == var26 and os.clock() < var27[3] then
			return var27[1]
		end
		local any_Boost_result1 = var5_upvw[arg2].Boost(var26, arg1)
		tbl_upvr[arg1:GetAttribute("UserId")..'_'..arg2] = {any_Boost_result1, var26, os.clock() + 1}
		return any_Boost_result1
	end
	return var5_upvw[arg2].Boost(var26, arg1)
end
local tbl_upvr_3 = {
	OreChance = true;
	TNTChance = true;
	EmeraldChance = true;
	MiningSpeed = true;
}
local tbl_2_upvr = {}
function module_upvr.GetInfo(arg1, arg2, ...) -- Line 175
	--[[ Upvalues[4]:
		[1]: Init_upvr (readonly)
		[2]: tbl_upvr_3 (readonly)
		[3]: tbl_2_upvr (readonly)
		[4]: var6_upvw (read and write)
	]]
	Init_upvr()
	if tbl_upvr_3[arg2] then
		local var33 = tbl_2_upvr[arg1:GetAttribute("UserId")..'_'..arg2]
		if var33 and os.clock() < var33[2] then
			return table.unpack(var33[1])
		end
		local module = {var6_upvw[arg2](arg1, ...)}
		tbl_2_upvr[arg1:GetAttribute("UserId")..'_'..arg2] = {module, os.clock() + 1}
		return table.unpack(module)
	end
	return var6_upvw[arg2](arg1, ...)
end
function module_upvr.GetAccessoryBoost(arg1, arg2) -- Line 189
	--[[ Upvalues[2]:
		[1]: Init_upvr (readonly)
		[2]: var2_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	Init_upvr()
	local var44 = workspace:GetServerTimeNow() // 86400 % 7
	local var45
	if 1 <= var44 then
		if var44 > 3 then
			var45 = false
		else
			var45 = true
		end
	end
	for _, v in var2_upvw.AccessoryBoostMap[arg2] do
		local Value_2 = arg1.Accessories.Levels[v].Value
		local var47 = var2_upvw.Accessories[v].Levels[Value_2]
		if var47 and arg1.Accessories.Equipped[v].Value then
			if var45 and v == 4 and Value_2 == 6 and (arg2 == "PickaxePower" or arg2 == "Cash") then
			else
			end
		end
	end
	return 0 + 1 + (var47.BoostsMap[arg2] or 0)
end
local tbl = {
	["11_1"] = true;
	["1_2"] = true;
	["10_1"] = true;
	["2_1"] = true;
	["4_1"] = true;
	["4_2"] = true;
}
function module_upvr.GetRecipe(arg1, arg2) -- Line 217
	--[[ Upvalues[2]:
		[1]: Init_upvr (readonly)
		[2]: var2_upvw (read and write)
	]]
	Init_upvr()
	local var49 = var2_upvw.Accessories[arg2].Levels[arg1.Accessories.Levels[arg2].Value + 1]
	if not var49 then
		return {}
	end
	return var49.Recipe
end
return module_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.TimeConverter
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:40
-- Luau version 6, Types version 3
-- Time taken: 0.020645 seconds

local module_3 = {}
local DateTimeExtended_upvr = require(game.ReplicatedStorage.Modules.DateTimeExtended)
local function _(arg1) -- Line 4, Named "tblToTimestamp"
	--[[ Upvalues[1]:
		[1]: DateTimeExtended_upvr (readonly)
	]]
	return DateTimeExtended_upvr.fromUniversalTime(arg1.Year, arg1.Month, arg1.Day, arg1.Hour, arg1.Minute, arg1.Second, arg1.Millisecond, arg1.Microsecond).Tick
end
local module_2_upvr = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}
function FormatTbl(arg1) -- Line 10
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var4 = arg1.Hour % 12
	if var4 == 0 then
		var4 = 12
	end
	if 12 <= arg1.Hour then
	else
	end
	return module_2_upvr[arg1.Month]..' '..arg1.Day..", "..arg1.Year.." | "..string.format("%.2d", var4)..':'..string.format("%.2d", arg1.Minute)..' '.."AM"
end
function module_3.ConvertTime(arg1, arg2) -- Line 18
	--[[ Upvalues[1]:
		[1]: DateTimeExtended_upvr (readonly)
	]]
	local var12
	if type(arg1) == "number" then
		var12 = DateTimeExtended_upvr.fromTick
	else
		var12 = DateTimeExtended_upvr.fromIsoDate
	end
	var12 = var12(arg1)
	local any_ToUniversalTime_result1_2 = var12:ToUniversalTime()
	local var14
	local var15 = "UTC"
	if arg2 ~= true then
		var14 = var12:ToLocalTime()
		local _ = var14
		local var17 = DateTimeExtended_upvr.fromUniversalTime(_.Year, _.Month, _.Day, _.Hour, _.Minute, _.Second, _.Millisecond, _.Microsecond).Tick - DateTimeExtended_upvr.fromUniversalTime(any_ToUniversalTime_result1_2.Year, any_ToUniversalTime_result1_2.Month, any_ToUniversalTime_result1_2.Day, any_ToUniversalTime_result1_2.Hour, any_ToUniversalTime_result1_2.Minute, any_ToUniversalTime_result1_2.Second, any_ToUniversalTime_result1_2.Millisecond, any_ToUniversalTime_result1_2.Microsecond).Tick
		if var17 ~= 0 then
			local var18 = math.floor(var17 / 60) % 60
			if 0 < var17 then
				var15 = var15..'+'
			end
			var15 = var15..math.floor(var17 / 3600)
			if 0 < var18 then
				var15 = var15..':'..string.format("%.2d", var18)
			end
		end
	end
	return FormatTbl(var14 or any_ToUniversalTime_result1_2).." ("..var15..')'
end
local tbl_2_upvr = {
	s = 1;
	m = 60;
	h = 3600;
	d = 86400;
	w = 604800;
	y = 31536000;
}
local tbl_4_upvr = {
	['0'] = true;
	['1'] = true;
	['2'] = true;
	['3'] = true;
	['4'] = true;
	['5'] = true;
	['6'] = true;
	['7'] = true;
	['8'] = true;
	['9'] = true;
}
function module_3.AbbreviationToNumber(arg1) -- Line 49
	--[[ Upvalues[2]:
		[1]: tbl_4_upvr (readonly)
		[2]: tbl_2_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var41
	if type(arg1) ~= "string" then return end
	local tbl = {}
	local tbl_3 = {}
	local var44
	var41 = #arg1
	for i = 1, var41 do
		local string_sub_result1 = string.sub(arg1, i, i)
		if tbl_4_upvr[string_sub_result1] == nil then
			if tbl_2_upvr[string_sub_result1] == nil then return end
			if tbl_3[string_sub_result1] == true then return end
			tbl_3[string_sub_result1] = true
			if var44 ~= nil and tbl_2_upvr[var44] < tbl_2_upvr[string_sub_result1] then return end
			table.insert(tbl, i)
		end
	end
	var41 = 0
	for _, v in tbl do
		if v == var41 + 1 then return end
		var41 = v
	end
	if var41 == 0 then return end
	for _, v_2 in tbl do
		local tonumber_result1 = tonumber(string.sub(arg1, 1, v_2 - 1))
		if tonumber_result1 == nil then return end
		local var47 = tbl_2_upvr[string.sub(arg1, v_2, v_2)]
		if var47 == nil then return end
	end
	return 0 + math.floor(tonumber_result1) * var47
end
function addComas(arg1) -- Line 86
	local var48
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var48 = arg1:reverse():gsub("(%d%d%d)", "%1,"):reverse():sub(2)
		return var48
	end
	if #arg1 % 3 ~= 0 or not INLINED() then
		var48 = arg1:reverse():gsub("(%d%d%d)", "%1,"):reverse()
	end
	return var48
end
function module_3.Abbreviate(arg1) -- Line 89
	if type(arg1) ~= "number" then
		return "Error"
	end
	if arg1 <= 0 then
		return "None"
	end
	if arg1 == math.huge then
		return "Forever"
	end
	local var49 = math.floor(arg1) % 60
	local var50 = math.floor(arg1 / 60) % 60
	local var51 = math.floor(arg1 / 3600) % 24
	local var52 = math.floor(arg1 / 86400) % 365
	local floored = math.floor(arg1 / 31536000)
	local module = {}
	if 0 < floored then
		module[#module + 1] = addComas(tostring(floored))..'y'
	end
	if 0 < var52 then
		module[#module + 1] = var52..'d'
	end
	if 0 < var51 then
		module[#module + 1] = var51..'h'
	end
	if 0 < var50 then
		module[#module + 1] = var50..'m'
	end
	if 0 < var49 then
		module[#module + 1] = var49..'s'
	end
	return table.concat(module, ' ')
end
return module_3


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.GuiHandler
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:41
-- Luau version 6, Types version 3
-- Time taken: 0.008617 seconds

local LocalPlayer_upvr = game.Players.LocalPlayer
local TweenService_upvr = game:GetService("TweenService")
local Game_upvr = LocalPlayer_upvr.PlayerGui:WaitForChild("Game")
local Frames_upvr = Game_upvr.Frames
local tbl_upvr_3 = {}
Frames_upvr.ChildAdded:Connect(function(arg1) -- Line 11
	--[[ Upvalues[1]:
		[1]: tbl_upvr_3 (readonly)
	]]
	tbl_upvr_3[arg1.Name] = arg1
end)
for _, v in Frames_upvr:GetChildren() do
	tbl_upvr_3[v.Name] = v
end
local var14_upvw
local CurrentCamera_upvr = game.Workspace.CurrentCamera
local UIBlur_upvr = game.Lighting.UIBlur
local var18_upvw = 0
local var19_upvw = 0
game:GetService("RunService").RenderStepped:Connect(function(arg1) -- Line 29
	--[[ Upvalues[7]:
		[1]: var14_upvw (read and write)
		[2]: Game_upvr (readonly)
		[3]: CurrentCamera_upvr (readonly)
		[4]: UIBlur_upvr (readonly)
		[5]: LocalPlayer_upvr (readonly)
		[6]: var18_upvw (read and write)
		[7]: var19_upvw (read and write)
	]]
	if not var14_upvw then
		var14_upvw = require(game.ReplicatedStorage.Modules.ClientFunctions)
	end
	if not Game_upvr.Enabled then
		CurrentCamera_upvr.FieldOfView = 70
		UIBlur_upvr.Size = 0
	else
		local var23 = false
		local Character_2 = LocalPlayer_upvr.Character
		if Character_2 then
			local Humanoid_2 = Character_2:FindFirstChild("Humanoid")
			if Humanoid_2 and 0 < Humanoid_2.MoveDirection.Magnitude then
				var23 = true
			end
		end
		if var23 then
			var18_upvw = math.min(var18_upvw + arg1 * 5, 1)
		else
			var18_upvw = math.max(var18_upvw - arg1 * 5, 0)
		end
		if var14_upvw.OpenedFrame then
			var19_upvw = math.min(var19_upvw + arg1 * 5, 1)
		else
			var19_upvw = math.max(var19_upvw - arg1 * 5, 0)
		end
		CurrentCamera_upvr.FieldOfView = 70 - var19_upvw * 10 + var18_upvw * 2
		UIBlur_upvr.Size = var19_upvw * 10
	end
end)
local tbl_upvr_2 = {}
local function CloseAll_upvr(arg1) -- Line 68, Named "CloseAll"
	--[[ Upvalues[3]:
		[1]: tbl_upvr_3 (readonly)
		[2]: tbl_upvr_2 (readonly)
		[3]: TweenService_upvr (readonly)
	]]
	local tbl_upvr = {}
	for _, v_2_upvr in tbl_upvr_3 do
		if v_2_upvr.Visible or arg1 then
			if tbl_upvr_2[v_2_upvr] == nil then
				tbl_upvr_2[v_2_upvr] = v_2_upvr.Size
			end
			tbl_upvr[v_2_upvr.Name] = true
			local any_Create_result1 = TweenService_upvr:Create(v_2_upvr, TweenInfo.new(0.075, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, 0, 0, 0);
			})
			any_Create_result1:Play()
			any_Create_result1.Completed:Once(function() -- Line 80
				--[[ Upvalues[2]:
					[1]: v_2_upvr (readonly)
					[2]: tbl_upvr (readonly)
				]]
				v_2_upvr.Visible = false
				tbl_upvr[v_2_upvr.Name] = nil
			end)
		end
	end
	while next(tbl_upvr) do
		task.wait()
	end
end
CloseAll_upvr(true)
local var33_upvw = false
local const_number_upvw = 0
local function GuiHandler_upvr(arg1, arg2) -- Line 92, Named "GuiHandler"
	--[[ Upvalues[7]:
		[1]: var14_upvw (read and write)
		[2]: tbl_upvr_3 (readonly)
		[3]: const_number_upvw (read and write)
		[4]: tbl_upvr_2 (readonly)
		[5]: CloseAll_upvr (readonly)
		[6]: var33_upvw (read and write)
		[7]: TweenService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
	var14_upvw = require(game.ReplicatedStorage.Modules.ClientFunctions)
	-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [14] 10. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [14] 10. Error Block 3 end (CF ANALYSIS FAILED)
end
local GuiService_upvr = game:GetService("GuiService")
game:GetService("UserInputService").InputBegan:Connect(function(arg1) -- Line 161
	--[[ Upvalues[7]:
		[1]: var14_upvw (read and write)
		[2]: CloseAll_upvr (readonly)
		[3]: var33_upvw (read and write)
		[4]: Game_upvr (readonly)
		[5]: GuiHandler_upvr (readonly)
		[6]: GuiService_upvr (readonly)
		[7]: Frames_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
	var14_upvw = require(game.ReplicatedStorage.Modules.ClientFunctions)
	-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [14] 10. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [14] 10. Error Block 3 end (CF ANALYSIS FAILED)
end)
return GuiHandler_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.DataModule
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:42
-- Luau version 6, Types version 3
-- Time taken: 0.014368 seconds

local module_2_upvr = {}
local any_IsClient_result1_upvr = game:GetService("RunService"):IsClient()
local tbl_upvr = {}
local var4_upvw = false
local tbl_upvr_2 = {}
module_2_upvr.DataFolders = tbl_upvr_2
local LocalPlayer_upvr = game.Players.LocalPlayer
function module_2_upvr.GetData(arg1, arg2) -- Line 11
	--[[ Upvalues[3]:
		[1]: any_IsClient_result1_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: tbl_upvr_2 (readonly)
	]]
	local var8
	if var8 then
		var8 = LocalPlayer_upvr
		if arg1 ~= var8 then
			var8 = warn
			var8("Attempt to get data of another player")
			return
		end
	end
	var8 = nil
	while arg1.Parent do
		var8 = tbl_upvr_2[arg1]
		if var8 then break end
		if arg2 then break end
		task.wait()
	end
	if not arg1.Parent then return end
	return var8
end
local var9_upvw
function module_2_upvr.DecompressData(arg1) -- Line 27
	--[[ Upvalues[3]:
		[1]: var4_upvw (read and write)
		[2]: tbl_upvr (readonly)
		[3]: var9_upvw (read and write)
	]]
	if not var4_upvw then return end
	local module = {}
	local var11 = 0
	while var11 < buffer.len(arg1) do
		local buffer_readu8_result1 = buffer.readu8(arg1, var11)
		var11 += 1
		local var13 = var11
		if 127 < buffer_readu8_result1 then
			buffer_readu8_result1 = buffer_readu8_result1 * 256 + buffer.readu8(arg1, var13) - 32640
			var13 += 1
		end
		local var14 = tbl_upvr[buffer_readu8_result1]
		local any_Decode_result1, _ = var9_upvw[var14[1]].Decode(arg1, var13)
		module[var14[2]] = any_Decode_result1
	end
	return module
end
local tbl_upvr_3 = {function(arg1) -- Line 113
	--[[ Upvalues[3]:
		[1]: tbl_upvr_2 (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: module_2_upvr (readonly)
	]]
	if not tbl_upvr_2[LocalPlayer_upvr] then
	else
		local buffer_create_result1 = buffer.create(buffer.len(arg1) - 1)
		buffer.copy(buffer_create_result1, 0, arg1, 1)
		for i, v in module_2_upvr.DecompressData(buffer_create_result1) do
			local var45
			for _, v_2 in string.split(i, '.') do
				var45 = var45:FindFirstChild(v_2)
				if not var45 then break end
			end
			var45.Value = v
		end
	end
end}
var9_upvw = {{
	Name = "Color3Value";
	Encode = function(arg1) -- Line 141
		return string.pack("hhh", math.round(arg1.R * 255), math.round(arg1.G * 255), math.round(arg1.B * 255))
	end;
	Decode = function(arg1, arg2) -- Line 144
		return Color3.fromRGB(buffer.readi16(arg1, arg2), buffer.readi16(arg1, arg2 + 2), buffer.readi16(arg1, arg2 + 4)), 6
	end;
}, {
	Name = "NumberValue";
	Encode = function(arg1) -- Line 154
		return string.pack('d', arg1)
	end;
	Decode = function(arg1, arg2) -- Line 157
		return buffer.readf64(arg1, arg2), 8
	end;
}, {
	Name = "StringValue";
	Encode = function(arg1) -- Line 163
		return string.pack('H', #arg1)..arg1
	end;
	Decode = function(arg1, arg2) -- Line 166
		local buffer_readu16_result1 = buffer.readu16(arg1, arg2)
		return buffer.readstring(arg1, arg2 + 2, buffer_readu16_result1), buffer_readu16_result1 + 2
	end;
}, {
	Name = "Vector3Value";
	Encode = function(arg1) -- Line 173
		return string.pack("fff", arg1.X, arg1.Y, arg1.Z)
	end;
	Decode = function(arg1, arg2) -- Line 176
		return vector.create(buffer.readf32(arg1, arg2), buffer.readf32(arg1, arg2 + 4), buffer.readf32(arg1, arg2 + 8)), 12
	end;
}, {
	Name = "TableValue";
	Encode = function(arg1) -- Line 186
		return string.pack('H', #arg1)..arg1
	end;
	Decode = function(arg1, arg2) -- Line 189
		local buffer_readu16_result1_2 = buffer.readu16(arg1, arg2)
		return buffer.readstring(arg1, arg2 + 2, buffer_readu16_result1_2), buffer_readu16_result1_2 + 2
	end;
}}
module_2_upvr.ValueTypes = var9_upvw
local RunService = game:GetService("RunService")
local pcall_result1, _ = pcall(RunService.IsEdit, RunService)
local var71
if not pcall_result1 then
	var71 = false
end
if any_IsClient_result1_upvr and not var71 then
	game.ReplicatedStorage:WaitForChild("DataEvent").OnClientEvent:Connect(function(arg1, ...) -- Line 205
		--[[ Upvalues[1]:
			[1]: tbl_upvr_3 (readonly)
		]]
		local var73 = tbl_upvr_3[buffer.readu8(arg1, 0)]
		if var73 then
			var73(arg1, ...)
		end
	end)
end
return module_2_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.GameDefinition
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:45
-- Luau version 6, Types version 3
-- Time taken: 1.007833 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local module_7_upvr = {}
local FormulaHandler_upvr = require(game.ReplicatedStorage.Modules.FormulaHandler)
local ABTesting_upvr = require(game.ReplicatedStorage.Modules.ABTesting)
local HttpService_upvr = game:GetService("HttpService")
local function PowerRound_upvr(arg1) -- Line 6, Named "PowerRound"
	if arg1 == 0 then
		return 0
	end
	local var137 = 10 ^ math.floor(math.log10(arg1))
	local var138 = arg1 / var137
	if var138 < 1.5 then
		return math.round(math.round(var138 * 10) * 0.1 * var137)
	end
	if var138 < 2.5 then
		return math.round(math.round(var138 * 4) / 4 * var137)
	end
	return math.round(math.round(var138 * 2) * 0.5 * var137)
end
module_7_upvr.PowerRound = PowerRound_upvr
local tbl_55_upvr = {5, 20, 70, 190, 550, 6000}
module_7_upvr.EmeraldInfo = tbl_55_upvr
local module_6_upvr = {2, 5, 10, 20, 50, 500}
local tbl_3_upvr = {10, 30, 80, 160, 300}
local var142_upvw = 74
module_7_upvr.Unbreakable = {-- : First try: K:0: attempt to index nil with 't'

module_7_upvr.Blocks = {{5, 1, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 380627588, "Rock"}, {25, 6, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 55065985, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 55065985, "Dirt"}, {25, 7, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {150, 40, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {100, 30, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {0, 0, 380627588, "Dirt"}, {500, 150, 55065985, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Crystal"}, {400, 175, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {0, 0, 55065985, "Grass"}, {2500, 900, 55065985, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {800, 400, 55065985, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {0, 0, 380627588, "Grass"}, {7500, 3000, 55065985, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {3000, 1800, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Lava"}, {30000, 15000, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Crystal"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Crystal"}, {20000, 15000, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {125000, 70000, 170257873, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {250000, 250000, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Air"}, {0, 0, 380627588, "Rock"}, {1000000, 750000, 2638779880, "Lava"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {7500000, 6250000, 55065985, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 170982395, "Rock"}, {0, 0, 170982395, "Rock"}, {0, 0, 170982395, "Rock"}, {0, 0, 170982395, "Rock"}, {0, 0, 170982395, "Rock"}, {0, 0, 170982395, "Rock"}, {0, 0, 170982395, "Rock"}, {0, 0, 170982395, "Rock"}, {0, 0, 170982395, "Rock"}, {0, 0, 170982395, "Rock"}, {0, 0, 170982395, "Rock"}, {0, 0, 170982395, "Rock"}, {100000000, 100000000, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {500000000, 625000000, 2638779880, "Lava"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {100000000000, 250000000000, 2638779880, "Lava"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Rock"}, {0, 0, 2833355501, "Crystal"}, {3000000000000, 10000000000000, 543282586, "Lava"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Crystal"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {15000000000000, 60000000000000, 543282586, "Lava"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {0, 0, 543282586, "Rock"}, {500000000000000, 2500000000000000, 543282586, "Lava"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Lava"}, {0, 0, 4507492751, "Lava"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Lava"}, {0, 0, 4507492751, "Lava"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Lava"}, {0, 0, 4507492751, "Crystal"}, {10000000000000000, 75000000000000000, 2992366392, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Rock"}, {0, 0, 4507492751, "Lava"}, {500000000000000000, 5000000000000000000, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {12500000, 15000000, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2464539705, "Dirt"}, {0, 0, 2638779880, "Rock"}, {0, 0, 1454554951, "Air", true}, {0, 0, 2748731153, "Air", true}, {0, 0, 2638779880, "Crystal"}, {0, 0, 947254686, "Air", true}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, {662066486, 1144221352}, "Crystal"}, {0, 0, 4227218512, "Crystal"}, {0, 0, 2882481627, "Air", true}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 947254686, "Crystal"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Lava"}, {0, 0, 1144221352, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2748731153, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 1381561671, "Lava", true}, {0, 0, 2638779880, "Air"}, {0, 0, 2748731153, "Rock"}, {0, 0, 2748731153, "Rock", true}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal", true}, {0, 0, 2748731153, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2748731153, "Rock"}, {0, 0, 2748731153, "Rock"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal", true}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Air"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Lava", true}, {0, 0, 947254686, "Crystal", true}, {0, 0, 2748731153, "Rock"}, {0, 0, 2748731153, "Rock"}, {0, 0, 2748731153, "Lava"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 276588875, "Crystal", true}, {0, 0, 2748731153, "Rock"}, {0, 0, 2748731153, "Rock"}, {0, 0, 2748731153, "Rock"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 947254686, "Air", true}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 4227218512, "Rock"}, {0, 0, {3987706623, 1187130208}, "Crystal"}, {0, 0, {1454554951, 406030877}, "Crystal"}, {0, 0, {3987706623, 1187130208}, "Crystal"}, {0, 0, {1144221352, 1454554951}, "Crystal"}, {0, 0, {1144221352, 1454554951}, "Crystal"}, {0, 0, 455576685, "Air"}, {0, 0, 947254686, "Lava"}, {0, 0, 455576685, "Air"}, {0, 0, 1454554951, "Crystal"}, {0, 0, 1381561671, "Lava"}, {0, 0, 1144221352, "Crystal"}, {0, 0, 1381561671, "Rock"}, {0, 0, 592152910, "Air"}, {0, 0, 4227218512, "Air"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 4227218512, "Rock"}, {0, 0, 2910454561, "Crystal"}, {0, 0, {1187130208, 3987706623}, "Rock"}, {0, 0, 2748731153, "Lava"}, {0, 0, 455576685, "Crystal"}, {0, 0, 455576685, "Air"}, {0, 0, 359850006, "Air"}, {1000000000, 2000000000, 1454554951, "Rock"}, {0, 0, 1454554951, "Rock"}, {0, 0, 1454554951, "Rock"}, {0, 0, {1454554951, 1144221352}, "Rock"}, {0, 0, 1454554951, "Rock"}, {0, 0, 1454554951, "Rock"}, {0, 0, 1454554951, "Rock"}, {0, 0, 1454554951, "Rock"}, {0, 0, 1454554951, "Rock"}, {0, 0, {1454554951, 1144221352}, "Rock"}, {0, 0, {1454554951, 1144221352}, "Rock"}, {0, 0, {1454554951, 1144221352}, "Rock"}, {0, 0, {1454554951, 1144221352}, "Rock"}, {0, 0, 1144221352, "Crystal"}, {0, 0, 1144221352, "Crystal"}, {0, 0, {1454554951, 1144221352}, "Crystal"}, {0, 0, 1144221352, "Rock"}, {0, 0, 108951887, "Crystal"}, {0, 0, {1454554951, 1144221352}, "Crystal"}, {0, 0, 662066486, "Crystal"}, {0, 0, {662066486, 1144221352, 1454554951, 1381561671}, "Crystal"}, {0, 0, 947254686, "Air"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2748731153, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Grass"}, {0, 0, 2638779880, "Grass"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Grass"}, {0, 0, 2748731153, "Rock"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2638779880, "Dirt"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2748731153, "Air"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Air"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, {1454554951, 2638779880}, "Rock"}, {0, 0, 2638779880, "Rock"}, {50000000000000000000, 600000000000000000000, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 1381561671, "Crystal"}, {0, 0, 4227218512, "Crystal"}, {2e+21, 3e+22, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2748731153, "Rock"}, {0, 0, 2748731153, "Rock"}, {1e+22, 1.75e+23, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2882481627, "Air", true}, {0, 0, 347739535, "Air", true}, {0, 0, {2882481627, 662066486}, "Air", true}, {0, 0, {662066486, 2882481627}, "Air", true}, {0, 0, 2882481627, "Air", true}, {0, 0, 2882481627, "Air", true}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Air"}, {0, 0, 549228615, "Air", true}, {0, 0, 549228615, "Air", true}, {0, 0, 2882481627, "Air", true}, {0, 0, {1144221352, 662066486}, "Air", true}, {0, 0, {1144221352, 1381561671}, "Lava", true}, {0, 0, {1454554951, 1381561671, 1144221352}, "Air", true}, {0, 0, {662066486, 1144221352}, "Crystal"}, {0, 0, 1381561671, "Crystal"}, {0, 0, 1454554951, "Air"}, {0, 0, 1454554951, "Air"}, {0, 0, 1144221352, "Air"}, {2e+23, 5e+24, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 1454554951, "Crystal"}, {0, 0, 2748731153, "Lava"}, {0, 0, 4227218512, "Air"}, {0, 0, 7118131, "Air"}, {0, 0, {2748731153, 2837258435}, "Rock"}, {0, 0, {4227218512, 1841806497}, "Crystal"}, {0, 0, 947254686, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Air"}, {0, 0, 4227218512, "Crystal"}, {0, 0, {4227218512, 1381561671}, "Crystal"}, {0, 0, {4227218512, 4849065411}, "Crystal"}, {0, 0, 4227218512, "Crystal"}, {0, 0, 4227218512, "Air"}, {0, 0, 876723688, "Crystal"}, {0, 0, 4227218512, "Air"}, {0, 0, 4227218512, "Crystal"}, {1.6e+25, 5e+26, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Lava"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2638779880, "Rock"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 876723688, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {6.5e+26, 2.5e+28, 55065985, "Air"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Crystal"}, {0, 0, 1454554951, "Crystal"}, {0, 0, 1454554951, "Crystal"}, {0, 0, 1454554951, "Crystal"}, {0, 0, 4227218512, "Crystal"}, {1.25e+28, 7.5e+29, 55065985, "Air"}, {0, 0, 55065985, "Air"}, {0, 0, 55065985, "Air"}, {0, 0, 55065985, "Air"}, {0, 0, 55065985, "Air"}, {0, 0, 55065985, "Air"}, {0, 0, 55065985, "Air"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Air"}, {0, 0, 55065985, "Air"}, {0, 0, 55065985, "Air"}, {0, 0, 55065985, "Crystal"}, {0, 0, 55065985, "Crystal"}, {0, 0, 55065985, "Crystal"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Rock"}, {0, 0, 55065985, "Crystal"}, {0, 0, 55065985, "Crystal"}, {0, 0, 55065985, "Crystal"}, {0, 0, 1381561671, "Crystal"}, {0, 0, 1454554951, "Crystal"}, {0, 0, 185018127, "Crystal"}, {1000000000000, 4000000000000, 2638779880, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {6.5e+29, 5e+31, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 380627588, "Rock"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 2748731153, "Crystal"}, {0, 0, 2638779880, "Crystal"}, {0, 0, 221293052, "Crystal"}, -- : First try: K:0: attempt to index nil with 't'

local tbl_224 = {{math.huge, 790, {{791, 792, 793, 794}, {795, 796, 797, 798}, {799, 800, 801}, {802, 803, 804}, {805, 806, 807}, {808, 809}, {810, 811}, {812}}}, {2700, 476, {{477, 478, 479, 595}, {480, 481, 482, 596}, {483, 484, 485}, {486, 487, 488}, {489, 490, 491}, {492, 493, 494}, {495, 496}, {677}}}, {2400, 379, {{380, 381, 382, 383}, {384, 385, 386, 498}, {387, 388, 499}, {389, 390, 500}, {391, 392, 501}, {393, 502}, {458, 466}, {710}}}, {2000, 207, {{208, 209, 210, 503}, {211, 212, 213, 504}, {214, 215, 505}, {216, 217, 506}, {218, 219, 507}, {220, 508}, {452, 459}, {681}}}, {1700, 179, {{180, 181, 182, 509}, {183, 184, 185, 510}, {186, 187, 511}, {188, 189, 512}, {190, 191, 513}, {192, 514}, {455, 473}, {709}}}, {1300, 150, {{151, 152, 153, 515}, {154, 155, 156, 516}, {157, 158, 159}, {160, 161, 517}, {162, 163, 518}, {164, 519}, {453, 469}, {707}}}, {1000, 119, {{120, 121, 122, 123}, {124, 125, 126, 520}, {127, 128, 129}, {130, 131, 521}, {132, 133, 522}, {134, 523}, {454, 497}, {706}}}, {750, 88, {{89, 90, 91, 92}, {93, 94, 95, 524}, {96, 97, 525}, {98, 99, 526}, {100, 101, 527}, {102, 528}, {464, 475}, {711}}}, {500, 59, {{60, 61, 62, 529}, {63, 64, 65, 530}, {66, 67, 531}, {68, 69, 532}, {70, 71, 533}, {72, 534}, {462, 474}, {715}}}, {250, 29, {{30, 31, 32, 535}, {33, 34, 35, 536}, {36, 37, 38}, {39, 40, 537}, {41, 42, 538}, {43, 539}, {461, 471}, {705}}}, {100, 1, {{2, 3, 4, 540}, {5, 6, 7, 541}, {8, 9, 394}, {10, 11, 542}, {12, 13, 543}, {14, 395}, {396, 467}, {663}}}, {-100, 15, {{16, 17, 18, 544}, {19, 20, 21, 545}, {22, 23, 546}, {24, 25, 547}, {26, 27, 548}, {28, 549}, {397, 398}, {664}}}, {-200, 44, {{45, 46, 47, 48}, {49, 50, 51, 550}, {52, 53, 551}, {54, 55, 552}, {56, 57, 553}, {58, 554}, {399, 400}, {665}}}, {-350, 73, {{74, 75, 76, 77}, {78, 79, 80, 555}, {81, 82, 556}, {83, 84, 557}, {85, 86, 558}, {87, 559}, {401, 402}, {666}}}, {-550, 103, {{104, 105, 106, 107}, {108, 109, 110, 560}, {111, 112, 113}, {114, 115, 561}, {116, 117, 562}, {118, 563}, {403, 468}, {667}}}, {-750, 135, {{136, 137, 138, 139}, {140, 141, 142, 564}, {143, 144, 565}, {145, 146, 566}, {147, 148, 567}, {149, 568}, {404, 465}, {668}}}, {-1000, 165, {{166, 167, 168, 569}, {169, 170, 171, 570}, {172, 173, 405}, {174, 175, 406}, {176, 177, 407}, {178, 408}, {409, 410}, {669}}}, {-1350, 193, {{194, 195, 196, 571}, {197, 198, 199, 572}, {200, 201, 411}, {202, 203, 412}, {204, 205, 413}, {206, 414}, {415, 416}, {670}}}, {-1675, 221, {{222, 223, 224, 573}, {225, 226, 227, 574}, {228, 229, 417}, {230, 231, 418}, {232, 233, 419}, {234, 420, 421}, {422, 423}, {671}}}, {-2000, 235, {{236, 237, 238, 575}, {239, 240, 241, 576}, {242, 243, 424}, {244, 245, 425}, {246, 247, 426}, {248, 427}, {428, 429}, {672}}}, {-2400, 249, {{250, 251, 252, 253}, {254, 255, 256, 577}, {257, 258, 259}, {260, 261, 430}, {262, 263, 431}, {264, 432}, {433, 434}, {673}}}, {-2700, 265, {{266, 267, 268, 269}, {270, 271, 272, 578}, {273, 274, 435}, {275, 276, 436}, {277, 278, 437}, {279, 438}, {439, 440}, {674}}}, {-3000, 280, {{281, 282, 283, 284}, {285, 286, 287, 579}, {288, 289, 290}, {291, 292, 441}, {293, 294, 442}, {295, 443}, {444, 445}, {675}}}, {-3400, 296, {{297, 298, 299, 300}, {301, 302, 303, 580}, {304, 305, 306}, {307, 308, 446}, {309, 310, 447}, {311, 448}, {449, 450}, {676}}}, {-3700, 312, {{313, 314, 315, 316}, {317, 318, 319, 581}, {320, 321, 322}, {323, 324, 582}, {325, 326, 583}, {327, 584}, {456, 463}, {714}}}, {-4000, 328, {{329, 330, 331, 332}, {333, 334, 335, 585}, {336, 337, 338}, {339, 340, 586}, {341, 342, 587}, {343, 588}, {451, 472}, {717}}}, {-4500, 344, {{345, 346, 347, 348}, {349, 350, 351, 589}, {352, 353, 354}, {355, 356, 590}, {357, 358, 591}, {359, 360}, {361, 460}, {680}}}, {-5000, 362, {{363, 364, 365, 366}, {367, 368, 369, 370}, {371, 372, 373}, {374, 375, 592}, {376, 377, 593}, {378, 594}, {457, 470}, {708}}}, {-5500, 597, {{598, 599, 600, 601}, {602, 603, 604, 605}, {606, 607, 608}, {609, 610, 611}, {612, 613, 614}, {615, 616}, {617, 618}, {712}}}, {-5800, 619, {{620, 621, 622, 623}, {624, 625, 626, 627}, {628, 629, 630}, {631, 632, 633}, {634, 635, 636}, {637, 638}, {639, 640}, {679}}}, {-6100, 641, {{642, 643, 644, 645}, {646, 647, 648, 649}, {650, 651, 652}, {653, 654, 655}, {656, 657, 658}, {659, 660}, {661, 662}, {678}}}, {-6500, 682, {{683, 684, 685, 686}, {687, 688, 689, 690}, {691, 692, 693}, {694, 695, 696}, {697, 698, 699}, {700, 701}, {702, 703}, {704}}}}
local tbl_33 = {-7200, 744, {{745, 746, 747, 748}, {749, 750, 751, 752}, {753, 754, 755}, {756, 757, 758}, {759, 760, 761}, {762, 763}, {764, 765}, {766}}}
local tbl_117 = {}
local tbl_112 = {}
local tbl_235 = {776, 777, 778}
tbl_112[1] = {768, 769, 770, 771}
tbl_112[2] = {772, 773, 774, 775}
tbl_112[3] = tbl_235
tbl_112[4] = {779, 780, 781}
tbl_112[5] = {782, 783, 784}
tbl_112[6] = {785, 786}
tbl_112[7] = {787, 788}
tbl_112[8] = {789}
tbl_117[1] = -7500
tbl_117[2] = 767
tbl_117[3] = tbl_112
tbl_224[33] = {-6850, 719, {{720, 721, 722, 723}, {724, 725, 726, 727}, {728, 729, 730}, {731, 732, 733}, {734, 735, 736}, {737, 738}, {739, 740}, {741}}}
tbl_224[34] = tbl_33
tbl_224[35] = tbl_117
tbl_224[36] = {-7850, 813, {{814, 815, 816, 817}, {818, 819, 820, 821}, {822, 823, 824}, {825, 826, 827}, {828, 829, 830}, {831, 832}, {833, 834}, {835}}}
module_7_upvr.Layers = tbl_224
tbl_33 = {}
local var1373 = tbl_33
local var1374 = tbl_224[2][1] + 1
local _1 = tbl_224[#tbl_224][1]
module_7_upvr.HighestDepth = var1374
module_7_upvr.LowestDepth = _1
local tbl_9 = {
	[var1374] = tbl_224[1][2];
	[_1] = tbl_224[#tbl_224][2];
}
var1373[var1374] = tbl_224[1][3]
var1373[_1] = tbl_224[#tbl_224][3]
local var1377
for i = 3, #tbl_224 do
	tbl_235 = tbl_224[i - 1]
	local var1378 = tbl_235
	for i_2 = tbl_224[i][1] + 1, var1378[1] do
		tbl_9[i_2] = var1378[2]
		var1373[i_2] = var1378[3]
	end
end
local tbl_89 = {}
for i_3 = 1, #tbl_224 do
	local var1380 = tbl_224[i_3]
	i_2 = (-math.huge)
	if tbl_224[i_3 + 1] then
		i_2 = tbl_224[i_3 + 1][1] + 1
	end
	tbl_89[var1380[2]] = {var1380[1], i_2}
end
module_7_upvr.LayerDepths = tbl_89
module_7_upvr.BaseBlocks = tbl_9
module_7_upvr.Ores = var1373
module_7_upvr.SecretOres = {{713, 716, 718, 743}, {836}, {742}}
local tbl_218 = {}
var1377 = 121
var1377 = 138
var1377 = 180
var1377 = Color3.fromRGB(155, 103, 44)
tbl_218[1] = Color3.fromRGB(118, 64, 43)
tbl_218[2] = Color3.fromRGB(83, 153, 205)
tbl_218[3] = Color3.fromRGB(10, 10, 10)
tbl_218[4] = Color3.fromRGB(86, 16, 198)
tbl_218[5] = Color3.fromRGB(40, 62, 87)
tbl_218[6] = Color3.fromRGB(166, 212, 229)
tbl_218[7] = Color3.fromRGB(102, 210, var1377)
tbl_218[8] = Color3.fromRGB(51, var1377, 64)
tbl_218[9] = Color3.fromRGB(var1377, 128, 58)
tbl_218[10] = var1377
tbl_218[11] = Color3.fromRGB(111, 84, 22)
tbl_218[12] = Color3.fromRGB(82, 59, 31)
tbl_218[13] = Color3.fromRGB(44, 30, 17)
tbl_218[14] = Color3.fromRGB(180, 179, 181)
tbl_218[15] = Color3.fromRGB(115, 114, 116)
tbl_218[16] = Color3.fromRGB(68, 68, 70)
var1377 = 0
var1377 = 141
var1377 = 22
var1377 = Color3.fromRGB(255, 255, 255)
tbl_218[17] = Color3.fromRGB(36, 25, 58)
tbl_218[18] = Color3.fromRGB(201, 37, 83)
tbl_218[19] = Color3.fromRGB(221, 144, 13)
tbl_218[20] = Color3.fromRGB(23, 217, 25)
tbl_218[21] = Color3.fromRGB(16, 28, 21)
tbl_218[22] = Color3.fromRGB(170, 0, 255)
tbl_218[23] = Color3.fromRGB(255, 0, var1377)
tbl_218[24] = Color3.fromRGB(17, var1377, 227)
tbl_218[25] = Color3.fromRGB(var1377, 224, 230)
tbl_218[26] = var1377
tbl_218[27] = Color3.fromRGB(10, 10, 10)
tbl_218[28] = Color3.fromRGB(190, 198, 204)
tbl_218[29] = Color3.fromRGB(74, 56, 22)
tbl_218[30] = Color3.fromRGB(59, 57, 58)
tbl_218[31] = Color3.fromRGB(234, 114, 30)
tbl_218[32] = Color3.fromRGB(255, 248, 155)
tbl_218[33] = Color3.fromRGB(158, 63, 44)
tbl_218[34] = Color3.fromRGB(163, 80, 35)
tbl_218[35] = Color3.fromRGB(132, 112, 93)
tbl_218[36] = Color3.fromRGB(127, 221, 243)
module_7_upvr.LayerColors = tbl_218
local tbl_220 = {}
local tbl_252 = {
	Start = 100;
	End = -99;
}
local tbl_212 = {}
local tbl_57 = {}
var1377 = "31. Sorrow - Rivals Of Aether"
tbl_57[1] = "rbxassetid://97706671271081"
tbl_57[2] = var1377
local tbl_201 = {}
var1377 = "rbxassetid://102349448344391"
tbl_201[1] = var1377
tbl_201[2] = "Blessing Of The Moon - DM DOKURO"
var1377 = {}
var1377[1] = "rbxassetid://128812523378528"
var1377[2] = "The Tale Of A Cruel World - DM DOKURO"
tbl_212[1] = {"rbxassetid://87196974340751", "2. Main Menu - Rivals Of Aether"}
tbl_212[2] = tbl_57
tbl_212[3] = tbl_201
tbl_212[4] = var1377
tbl_212[5] = {"rbxassetid://117494616608918", "sanctuary - DM DOKURO"}
tbl_252.Music = tbl_212
local tbl_11 = {
	Start = -100;
	End = -349;
}
local tbl_134 = {}
local tbl_207 = {}
var1377 = "28. Tutorial Session - Rivals Of Aether"
tbl_207[1] = "rbxassetid://130448873902010"
tbl_207[2] = var1377
local tbl_222 = {}
var1377 = "rbxassetid://119418261251696"
tbl_222[1] = var1377
tbl_222[2] = "Hadopelagic Pressure - DM DOKURO"
var1377 = {}
var1377[1] = "rbxassetid://119998779409948"
var1377[2] = "The Heaven-Sent Abomination - DM DOKURO"
tbl_134[1] = tbl_207
tbl_134[2] = tbl_222
tbl_134[3] = var1377
tbl_11.Music = tbl_134
local tbl_95 = {
	Start = -350;
	End = -999;
}
local tbl_65 = {}
local tbl_44 = {}
var1377 = "rbxassetid://88628901839862"
tbl_44[1] = var1377
tbl_44[2] = "30. Conflict - Rivals Of Aether"
var1377 = {}
var1377[1] = "rbxassetid://100091299441009"
var1377[2] = "Night Soil - Edmund McMillen"
tbl_65[1] = tbl_44
tbl_65[2] = var1377
tbl_95.Music = tbl_65
local tbl_225 = {
	Start = -1000;
	End = -1999;
}
local tbl_198 = {}
var1377 = {}
var1377[1] = "rbxassetid://72872715977566"
var1377[2] = "32. Anomalous - Rivals Of Aether"
tbl_198[1] = var1377
tbl_198[2] = {"rbxassetid://120936278218634", "The Step Below Hell - DM DOKURO"}
tbl_225.Music = tbl_198
local tbl_28 = {}
var1377 = -2000
tbl_28.Start = var1377
var1377 = -3399
tbl_28.End = var1377
var1377 = {}
var1377[1] = {"rbxassetid://74269868820325", "Absentia - Edmund McMillen"}
var1377[2] = {"rbxassetid://108266185015882", "Murderswarm - DM DOKURO"}
var1377[3] = {"rbxassetid://118800787013577", "Threats of The Ocean Floor - DM DOKURO"}
tbl_28.Music = var1377
var1377 = {}
var1377.Start = -3400
var1377.End = -4499
var1377.Music = {{"rbxassetid://84317307642976", "Catastrophes Before The Calamity - DM DOKURO"}, {"rbxassetid://102782447519512", "Touhou 10 Mountain of Faith - Native Faith (xi-on Remix)"}}
tbl_220[1] = {
	Start = math.huge;
	End = 2401;
	Music = {{"rbxassetid://115157457581683", "Red 13 - ParagonX9"}, {"rbxassetid://111677808278934", "Deimos - Solkrieg"}, {"rbxassetid://119126322906277", "Miami Hotline Vol.3 - Demonicity"}};
}
tbl_220[2] = {
	Start = 2400;
	End = 1701;
	Music = {{"rbxassetid://133658502763781", "Another world - Razorrekker"}, {"rbxassetid://121915909398957", "Red Headed Outlaw - Ockeroid"}, {"rbxassetid://80803968474543", "Apex - Creo"}, {"rbxassetid://74538210158957", "Dignity - DuoCore"}};
}
tbl_220[3] = {
	Start = 1700;
	End = 501;
	Music = {{"rbxassetid://134677673013763", "Innocence Mangled - Edmund McMillen"}, {"rbxassetid://80164684335505", "Delirium - Edmund McMillen"}};
}
tbl_220[4] = {
	Start = 500;
	End = 101;
	Music = {{"rbxassetid://120277745413358", "River of Despair - Edmund McMillen"}, {"rbxassetid://76496536926292", "Diptera Sonata - Edmund McMillen"}};
}
tbl_220[5] = tbl_252
tbl_220[6] = tbl_11
tbl_220[7] = tbl_95
tbl_220[8] = tbl_225
tbl_220[9] = tbl_28
tbl_220[10] = var1377
tbl_220[11] = {
	Start = -4500;
	End = -5499;
	Music = {{"rbxassetid://76495669067763", "Raw, Unfiltered Calamity - DM DOKURO"}, {"rbxassetid://98881980108919", "Nautilus - Creo"}};
}
tbl_220[12] = {
	Start = -5500;
	End = -6099;
	Music = {{"rbxassetid://126141193552559", "Rose At Nightfall - NemesisTheory"}, {"rbxassetid://95348195784377", "Rose At Twilight - NemesisTheory"}, {"rbxassetid://128075735677725", "Siren's Call (Seafoam Mix) - DM DOKURO"}, {"rbxassetid://112958318508162", "Mysterious Sleeper - Nemesis Theory"}};
}
tbl_220[13] = {
	Start = -6100;
	End = -6849;
	Music = {{"rbxassetid://90050504725350", "Rose At Dawn - Nemesis Theory"}, {"rbxassetid://86800725609837", "Rose At Meridiem - Nemesis Theory"}, {"rbxassetid://121037282273022", "Enigma - Nemesis Theory"}};
}
tbl_220[14] = {
	Start = -6850;
	End = -7499;
	Music = {{"rbxassetid://132002012011686", "Rose at Midnight (BLACK ROSE Ver) - Nemesis Theory"}, {"rbxassetid://97584758232030", "Rose at Nightfall (BLACK ROSE) - Nemesis Theory"}};
}
tbl_220[15] = {
	Start = -7500;
	End = (-math.huge);
	Music = {{"rbxassetid://103600680180391", "Flamewall [Symphonic Speed Metal] - Camellia"}, {"rbxassetid://79558133455347", "Consumer of the Multiverse - Average Alligator"}, {"rbxassetid://103195497959641", "LAYERS - KORAII"}};
}
module_7_upvr.Music = tbl_220
for _, v in module_7_upvr.Layers do
	if v[3] then
		local var1456 = module_7_upvr.Blocks[v[2]]
		var1377 = var1456[1]
		var1377 = nil
		for i_5, v_2 in v[3], var1377 do
			for i_6, v_3 in v_2 do
				local var1457 = 1.1 ^ (i_6 - 1)
				local var1458 = module_7_upvr.Blocks[v_3]
				local PowerRound_upvr_result1 = PowerRound_upvr(var1456[1] * ({3, 6.5, 15, 25, 100, 500, 10000, 10000})[i_5] * var1457)
				var1458[2] = PowerRound_upvr(var1456[2] / var1377 * PowerRound_upvr_result1 * ({2, 3, 4, 20, 100, 500, 10000, 50000})[i_5] * var1457)
				if 8 <= i_5 then
					PowerRound_upvr_result1 = 120
				end
				var1458[1] = PowerRound_upvr_result1
			end
		end
	end
end
for i_7, v_4 in module_7_upvr.SecretOres do
	for _, v_5 in v_4 do
		if game:GetService("RunService"):IsStudio() then
			module_7_upvr.Blocks[v_5][1] = 5
		elseif i_7 == 1 then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			module_7_upvr.Blocks[v_5][1] = 300
		elseif i_7 == 2 then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			module_7_upvr.Blocks[v_5][1] = 900
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			module_7_upvr.Blocks[v_5][1] = 1800
		end
	end
end
module_7_upvr.Explosives = {{2, 6}, {5, 8}, {10, 10}, {25, 12}, {50, 14}, {75, 16}, {100, 18}, {200, 22}, {300, 25}}
module_7_upvr.RarityColors = {Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255), Color3.fromRGB(170, 0, 255), Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 0, 127), Color3.fromRGB(0, 255, 255), Color3.fromRGB(85, 0, 127), Color3.fromRGB(0, 0, 0), Color3.fromRGB(99, 95, 98)}
module_7_upvr.Leaderboards = {{"NumberValues.TotalCash", "Short"}, {"NumberValues.Mined", "Long"}, {"NumberValues.TimePlayed", "Time"}, {"NumberValues.BlocksUnlocked", "Long"}, {"NumberValues.Prestiges", "Long"}, {"NumberValues.TotalPrestigeTokens", "Short"}}
module_7_upvr.QuestProgress = {function(arg1, arg2, arg3, arg4) -- Line 1565
	if type(arg2) ~= "table" then
		return 0, arg4
	end
	local __3 = arg2['1']
	if type(__3) ~= "table" then
		return 0, arg4
	end
	return __3[tostring(arg3)] or 0, arg4
end, function(arg1, arg2, arg3, arg4) -- Line 1575
	if type(arg2) ~= "table" then
		return 0, arg4
	end
	local __2 = arg2['2']
	if type(__2) ~= "table" then
		return 0, arg4
	end
	return __2[tostring(arg3)] or 0, arg4
end, function(arg1, arg2, arg3) -- Line 1585
	if type(arg2) ~= "table" then
		return 0, arg3
	end
	return arg2['3'] or 0, arg3
end, function(arg1, arg2, arg3) -- Line 1591
	if type(arg2) ~= "table" then
		return 0, arg3
	end
	return arg2['4'] or 0, arg3
end, function(arg1, arg2, arg3) -- Line 1597
	if arg3 < 0 then
		return arg1.NumberValues.LowestDepth.Value, arg3
	end
	return arg1.NumberValues.HighestDepth.Value, arg3
end, function(arg1, arg2, arg3) -- Line 1603
	return arg1.Equipables.Equipped.Pickaxe.Value + 1, arg3
end, function(arg1, arg2, arg3) -- Line 1606
	return arg1.Equipables.Equipped.Backpack.Value + 1, arg3
end, function(arg1, arg2, arg3) -- Line 1609
	return 0, arg3
end}
local tbl_254_upvr = {120, 240, 420, 600, 780, 960, 1200, 1500, 1800}
local tbl_240 = {}
module_7_upvr.UpgradeMap = tbl_240
module_7_upvr.Formulas = {
	Equipables = {
		Pickaxe = {
			UpdateIds = {"Gamepasses.SharperPickaxes", "Gamepasses.x2PickaxePower", "Others.MiningFrenzy", "Others.LikeRewardActive", "Others.PickaxeUpgrades", "NumberValues.MagicPower"};
			Currency = "Cash";
			Cost = function(arg1, arg2) -- Line 1629
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(4 * arg1 ^ 1.725 * 1.3 ^ arg1 ^ 1.15 * 2 ^ math.max(arg1 - 144, 0) + 5)
			end;
			Boost = function(arg1, arg2) -- Line 1636
				--[[ Upvalues[4]:
					[1]: HttpService_upvr (readonly)
					[2]: FormulaHandler_upvr (readonly)
					[3]: ABTesting_upvr (readonly)
					[4]: PowerRound_upvr (readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 31 start (CF ANALYSIS FAILED)
				local PickaxeUpgrades_upvr = arg2.Others.PickaxeUpgrades
				local pcall_result1_2, pcall_result2_2 = pcall(function() -- Line 1638
					--[[ Upvalues[2]:
						[1]: HttpService_upvr (copied, readonly)
						[2]: PickaxeUpgrades_upvr (readonly)
					]]
					return HttpService_upvr:JSONDecode(PickaxeUpgrades_upvr.Value)
				end)
				local var1501
				local function INLINED() -- Internal function, doesn't exist in bytecode
					local var1502 = pcall_result2_2[tostring(arg1)]
					return type(var1502) == "number"
				end
				if pcall_result1_2 or type(pcall_result2_2) == "table" or INLINED() then
					var1501 = FormulaHandler_upvr.GetInfo(arg2, "PickaxeBoost", var1502)
				end
				if arg2.Gamepasses.SharperPickaxes.Value then
					var1501 *= 1.1
				end
				if arg2.Gamepasses.x2PickaxePower.Value then
					var1501 *= 2
				end
				var1501 *= FormulaHandler_upvr.GetBoost(arg2, "1_3")
				var1501 *= FormulaHandler_upvr.GetBoost(arg2, "7_4")
				var1501 *= FormulaHandler_upvr.GetBoost(arg2, "8_2")
				var1501 *= 1 + FormulaHandler_upvr.GetInfo(arg2, "MP_PickaxePower")
				var1501 *= 1 + FormulaHandler_upvr.GetAccessoryBoost(arg2, "PickaxePower")
				if 0 < arg2.Others.MiningFrenzy.Value then
					var1501 *= 1.17 ^ FormulaHandler_upvr.GetUpgrade(arg2, "3_2").Value
				end
				if arg2.Others.LikeRewardActive.Value then
					var1501 *= 1.25
				end
				local var1503
				if arg1 == -1 then
					var1503 = 10000
					if ABTesting_upvr.GetResult(arg2, "VIPRebalancing") == 1 then
						var1503 = 500000000000
						-- KONSTANTWARNING: GOTO [146] #115
					end
				else
					local var1504 = arg1 ^ 1.15
					var1503 = PowerRound_upvr((var1504 + 1) * 1.15 ^ var1504 * 1.4)
				end
				-- KONSTANTERROR: [0] 1. Error Block 31 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [146] 115. Error Block 19 start (CF ANALYSIS FAILED)
				local var1505 = var1503 * var1501 * 3
				local var1506 = 10 ^ math.floor(math.log10(var1505))
				do
					return math.round(var1505 / var1506 * 10) / 10 * var1506
				end
				-- KONSTANTERROR: [146] 115. Error Block 19 end (CF ANALYSIS FAILED)
			end;
		};
		Backpack = {
			MaxLevel = var142_upvw;
			Currency = "Cash";
			UpdateIds = {"Gamepasses.x2Storage", "Accessories.Equipped.21", "Accessories.Levels.21"};
			Cost = function(arg1, arg2) -- Line 1685
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(30 * 1.5 ^ ((arg1) * ((arg1 + 30) / 30)) * 50 ^ math.max(arg1 - 64, 0))
			end;
			Boost = function(arg1, arg2) -- Line 1690
				--[[ Upvalues[4]:
					[1]: PowerRound_upvr (readonly)
					[2]: ABTesting_upvr (readonly)
					[3]: var142_upvw (read and write)
					[4]: FormulaHandler_upvr (readonly)
				]]
				local var1511
				if 0 <= arg1 then
					var1511 = PowerRound_upvr(20 + 10 ^ (1 + arg1 / 11.113636363636363) + 5 * arg1)
				elseif ABTesting_upvr.GetResult(arg2, "VIPRebalancing") == 1 then
					var1511 = 10000000
				end
				if var142_upvw <= arg1 then
					var1511 = 50000000
				end
				if arg2 and arg2.Gamepasses.x2Storage.Value then
					var1511 *= 2
				end
				var1511 *= 1 + FormulaHandler_upvr.GetAccessoryBoost(arg2, "BackpackSpace")
				return var1511
			end;
		};
		Explosives = {
			MaxLevel = 9;
			FirstBuyable = true;
			Currency = "Emeralds";
			UpdateIds = {"Gamepasses.x2Storage", "Accessories.Equipped.17", "Accessories.Levels.17", "Accessories.Equipped.18", "Accessories.Levels.18"};
			Cost = function(arg1, arg2) -- Line 1712
				local module = {1, 3, 5, 12, 25, 35, 50, 100, 150}
				return module[math.min(arg1 + 1, #module)]
			end;
			Boost = function(arg1, arg2) -- Line 1716
				--[[ Upvalues[1]:
					[1]: FormulaHandler_upvr (readonly)
				]]
				local tbl_6 = {6, 8, 10, 12, 14, 16, 18, 22, 25}
				local var1518 = tbl_6[math.min(arg1 + 1, #tbl_6)]
				local var1519 = 1 + FormulaHandler_upvr.GetAccessoryBoost(arg2, "ExplosiveRadius")
				if var1518 < 10 or var1519 < 0.15 then
					var1518 = math.floor(var1518 * var1519)
					return var1518
				end
				return math.ceil(var1518 * var1519)
			end;
		};
		Luck = {
			MaxLevel = 16;
			Currency = "Cash";
			Cost = function(arg1, arg2) -- Line 1733
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(50000 * (5 + arg1) ^ arg1 + 1000000 ^ (arg1 / 3))
			end;
			Boost = function(arg1, arg2) -- Line 1736
				if arg1 == -1 then
					return 1.5
				end
				return 1 + arg1 / 16
			end;
		};
		Speed = {
			MaxLevel = 12;
			Currency = "Cash";
			UpdateIds = {"Settings.x2Speed", "NumberValues.MagicPower", "Upgrades.8.7"};
			Cost = function(arg1, arg2) -- Line 1745
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(1000000 * 1000 ^ (arg1 / 2))
			end;
			Boost = function(arg1, arg2) -- Line 1748
				--[[ Upvalues[1]:
					[1]: FormulaHandler_upvr (readonly)
				]]
				local var1527
				if arg1 == -1 then
					var1527 = 8
				else
					var1527 = arg1
				end
				if arg2.Settings.x2Speed.Value then
					var1527 *= 2
				end
				var1527 += FormulaHandler_upvr.GetInfo(arg2, "MP_WalkSpeed") * 6
				var1527 += FormulaHandler_upvr.GetAccessoryBoost(arg2, "WalkSpeed") * 6
				var1527 += FormulaHandler_upvr.GetBoost(arg2, "8_7")
				return var1527
			end;
		};
		Jump = {
			MaxLevel = 10;
			Currency = "Cash";
			UpdateIds = {"Settings.x2Jump"};
			Cost = function(arg1, arg2) -- Line 1768
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(10000000 * (12 + 30 * arg1) ^ arg1)
			end;
			Boost = function(arg1, arg2) -- Line 1771
				local var1532
				if arg1 == -1 then
					var1532 = 6
				else
					var1532 = arg1
				end
				if arg2.Settings.x2Jump.Value then
					var1532 *= 2
				end
				return var1532
			end;
		};
	};
	Upgrades = {
		["1_1"] = {
			Type = "BuyAll";
			MaxLevel = 1;
			Currency = "PrestigeTokens";
			Display = nil;
			Cost = function(arg1, arg2) -- Line 1791
				return 100
			end;
			Boost = function(arg1, arg2) -- Line 1794
				return arg1
			end;
			Icon = "rbxassetid://14154260281";
		};
		["1_2"] = {
			Type = "KeepBackpack";
			MaxLevel = var142_upvw;
			Currency = "PrestigeTokens";
			Display = {"", 0};
			Cost = function(arg1, arg2) -- Line 1804
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(30 * 1.25 ^ ((arg1) * ((75 + arg1) / 75)))
			end;
			Boost = function(arg1, arg2) -- Line 1807
				return arg1
			end;
			Icon = "rbxassetid://13253128349";
		};
		["1_3"] = {
			Type = "MorePickaxePower";
			Currency = "PrestigeTokens";
			Display = {'x', 1};
			Cost = function(arg1, arg2) -- Line 1816
				return math.round(15 * (1 + arg1 ^ 1.2 * 1.1 ^ arg1 * 0.1) * (arg1 + 1) ^ (0.5 + arg1 ^ 1.15 / 150))
			end;
			Boost = function(arg1, arg2) -- Line 1819
				return 1 + 0.3 * arg1 ^ 1.1 * 1.03 ^ arg1
			end;
			Icon = "rbxassetid://14343255533";
		};
		["1_4"] = {
			Type = "MoreCash";
			Currency = "PrestigeTokens";
			Display = {'x', 0};
			Cost = function(arg1, arg2) -- Line 1828
				return 5 ^ arg1 * 1000
			end;
			Boost = function(arg1, arg2) -- Line 1831
				return 2 ^ arg1
			end;
			Icon = "rbxassetid://13140651659";
		};
		["2_1"] = {
			Type = "JackhammerChance";
			MaxLevel = 35;
			Currency = "Cash";
			Display = {'%', 2};
			UpdateIds = {"Accessories.Levels.13", "Accessories.Equipped.13", "NumberValues.MagicPower"};
			Cost = function(arg1, arg2) -- Line 1844
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(6 ^ math.min(arg1, 30) * 200000 * 7776 ^ math.max(arg1 - 30, 0))
			end;
			Boost = function(arg1, arg2) -- Line 1847
				--[[ Upvalues[1]:
					[1]: FormulaHandler_upvr (readonly)
				]]
				if arg1 < 1 then
					return 0
				end
				local var1554 = arg1 - 1
				return 0.0035 * (1 + var1554 * 0.1 / 2 ^ (var1554 / 36)) + FormulaHandler_upvr.GetAccessoryBoost(arg2, "JackhammerChance") + FormulaHandler_upvr.GetInfo(arg2, "MP_JackhammerChance")
			end;
			Icon = "rbxassetid://82047151181075";
		};
		["2_2"] = {
			Type = "JackhammerRadius";
			MaxLevel = 5;
			Currency = "Cash";
			Display = {"", 0};
			Cost = function(arg1, arg2) -- Line 1859
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(100 ^ (math.min(arg1, 1) + math.clamp(arg1 - 1, 0, 1) * 3 + math.max(arg1 - 2, 0) * 4.5) * 1000000)
			end;
			Boost = function(arg1, arg2) -- Line 1866
				return 2 + arg1
			end;
			Icon = "rbxassetid://126922072646751";
		};
		["2_3"] = {
			Type = "JackhammerSize";
			MaxLevel = 30;
			Currency = "Cash";
			Display = {"", 1};
			Cost = function(arg1, arg2) -- Line 1876
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(40 ^ (math.min(arg1, 25) * 0.5 + math.max(arg1 - 25, 0)) * 1000000000000000000)
			end;
			Boost = function(arg1, arg2) -- Line 1879
				return 1 + 0.1 * arg1
			end;
			Icon = "rbxassetid://118369409088884";
		};
		["3_1"] = {
			Type = "MiningSpeed";
			MaxLevel = 25;
			Currency = "Cash";
			Display = {'x', 2};
			Cost = function(arg1, arg2) -- Line 1889
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				if 21 <= arg1 then
					local module_2 = {1e+36, 1e+40, 1e+45, 1e+52}
					return module_2[math.min(arg1 - 20, #module_2)]
				end
				return PowerRound_upvr(100000 * (1 + arg1) * (1 + 5 ^ (arg1 - 3)) * (1 + 10 ^ (arg1 - 5)))
			end;
			Boost = function(arg1, arg2) -- Line 1896
				return 1 + 0.033333333 * arg1
			end;
			Icon = "rbxassetid://140618832538548";
		};
		["3_2"] = {
			Type = "MiningFrenzy";
			MaxLevel = 8;
			Currency = "Cash";
			UpdateIds = {"Gamepasses.x2MiningSpeed"};
			Display = {'x', 2};
			Cost = function(arg1, arg2) -- Line 1907
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				if 7 <= arg1 then
					local module_4 = {1e+48}
					return module_4[math.min(arg1 - 6, #module_4)]
				end
				return PowerRound_upvr(20000000 ^ (1 + arg1 * 0.5))
			end;
			Boost = function(arg1, arg2) -- Line 1914
				local var1574 = 1 + 0.12 * arg1
				if arg2.Gamepasses.x2MiningSpeed.Value then
					var1574 ^= 0.75
				end
				return var1574
			end;
			Icon = "rbxassetid://121489450482458";
		};
		["4_1"] = {
			Type = "ExplosionChance";
			MaxLevel = 20;
			Currency = "Cash";
			UpdateIds = {"Accessories.Levels.12", "Accessories.Equipped.12", "NumberValues.MagicPower"};
			Display = {'%', 2};
			Cost = function(arg1, arg2) -- Line 1929
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(6.218 ^ (math.min(arg1, 5) + math.clamp(arg1 - 5, 0, 5) * 2 + math.clamp(arg1 - 10, 0, 5) * 4 + math.max(arg1 - 15, 0) * 6) * 25000000)
			end;
			Boost = function(arg1, arg2) -- Line 1936
				--[[ Upvalues[1]:
					[1]: FormulaHandler_upvr (readonly)
				]]
				if arg1 < 1 then
					return 0
				end
				return 0.0033333333333 * (1 + (arg1 - 1) * 0.1) + FormulaHandler_upvr.GetAccessoryBoost(arg2, "ExplosionChance") + FormulaHandler_upvr.GetInfo(arg2, "MP_ExplosionChance")
			end;
			Icon = "rbxassetid://88046385993681";
		};
		["4_2"] = {
			Type = "ExplosionRadius";
			MaxLevel = 3;
			Currency = "Cash";
			Display = {"", 0};
			Cost = function(arg1, arg2) -- Line 1948
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(100000000 * 1000000 ^ arg1)
			end;
			Boost = function(arg1, arg2) -- Line 1951
				return 2 + arg1
			end;
			Icon = "rbxassetid://120893146383891";
		};
		["4_3"] = {
			Type = "TNTLuck";
			MaxLevel = 30;
			Currency = "Cash";
			Display = {'x', 1};
			Cost = function(arg1, arg2) -- Line 1961
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(11 ^ math.min(arg1, 19) * 500000000000 * 121 ^ math.max(arg1 - 19, 0))
			end;
			Boost = function(arg1, arg2) -- Line 1964
				return 1 + arg1 * 0.1
			end;
			Icon = "rbxassetid://102477646810182";
		};
		["5_1"] = {
			Type = "MiningRange";
			MaxLevel = 15;
			Currency = "Cash";
			Display = {'+', 1};
			Cost = function(arg1, arg2) -- Line 1974
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(10 ^ (math.min(arg1, 2) + math.clamp(arg1 - 2, 0, 3) * 2 + math.max(arg1 - 5, 0) * 4) * 5000000000)
			end;
			Boost = function(arg1, arg2) -- Line 1980
				return 0.5 * arg1
			end;
			Icon = "rbxassetid://112477020539886";
		};
		["5_2"] = {
			Type = "MiningRange2";
			MaxLevel = 7;
			Currency = function(arg1) -- Line 1988
				local module_3 = {389, 390, 500, 391, 392, 501, 393}
				return "Blocks."..module_3[math.min(arg1 + 1, #module_3)]
			end;
			Display = {'+', 1};
			Cost = function(arg1, arg2) -- Line 1993
				local module_5 = {1, 1, 1, 1, 1, 1, 1}
				return module_5[math.min(arg1 + 1, #module_5)]
			end;
			Boost = function(arg1, arg2) -- Line 1997
				return 0.7142857142857143 * arg1
			end;
			Icon = "rbxassetid://133390559141166";
		};
		["6_1"] = {
			Type = "UnlockCrafting";
			MaxLevel = 1;
			Currency = "Cash";
			Cost = function(arg1, arg2) -- Line 2006
				return 100000000000
			end;
			Boost = function(arg1, arg2) -- Line 2009
				return arg1
			end;
			Icon = "rbxassetid://81544555897341";
		};
		["6_2"] = {
			Type = "MoreAccessorySlots";
			MaxLevel = 15;
			Currency = "Cash";
			Display = {"", 0};
			Cost = function(arg1, arg2) -- Line 2019
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(1000 ^ math.min(arg1, 6) * 1000000000000000 * 10 ^ math.clamp(arg1 - 6, 0, 5) * 10000 ^ math.max(arg1 - 11, 0))
			end;
			Boost = function(arg1, arg2) -- Line 2022
				return 3 + arg1
			end;
			Icon = "rbxassetid://84433960923200";
		};
		["7_1"] = {
			Type = "MoreMeta1";
			Currency = "Meta";
			Display = {'x', 1};
			Cost = function(arg1, arg2) -- Line 2031
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(100 * 2 ^ arg1)
			end;
			Boost = function(arg1, arg2) -- Line 2034
				return (1 + 0.1 * arg1) * (1.05 * (math.min(arg1 / 2000, 0.09) + 1) ^ arg1)
			end;
			Icon = "Meta";
		};
		["7_2"] = {
			Type = "MoreMeta2";
			MaxLevel = 20;
			Currency = "Meta";
			Display = {'x', 1};
			Cost = function(arg1, arg2) -- Line 2044
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(100 ^ math.min(arg1, 12) * 50000 * 1000000 ^ math.max(arg1 - 12, 0))
			end;
			Boost = function(arg1, arg2) -- Line 2047
				return 2 ^ arg1
			end;
			Icon = "Meta";
		};
		["7_3"] = {
			Type = "MoreMetaBlocksMined";
			MaxLevel = 30;
			Currency = "Meta";
			UpdateIds = {"NumberValues.Mined"};
			Display = {'x', 1};
			Cost = function(arg1, arg2) -- Line 2058
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(5 ^ math.min(arg1, 15) * 1000000 * 25 ^ math.clamp(arg1 - 15, 0, 10) * 625 ^ math.max(arg1 - 25, 0))
			end;
			Boost = function(arg1, arg2) -- Line 2061
				if arg1 < 1 then
					return 1
				end
				return math.log10(arg2.NumberValues.Mined.Value + 10) ^ (1 + arg1 / 4)
			end;
			Icon = "Meta";
		};
		["7_4"] = {
			Type = "MorePickaxePower";
			MaxLevel = 50;
			Currency = "Meta";
			Display = {'x', 2};
			Cost = function(arg1, arg2) -- Line 2072
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(1000 * (2 * (1 + arg1 / 10)) ^ arg1)
			end;
			Boost = function(arg1, arg2) -- Line 2075
				return 1 + 0.08 * arg1
			end;
			Icon = "rbxassetid://14343255533";
		};
		["7_5"] = {
			Type = "MiningSpeed";
			MaxLevel = 3;
			Currency = "Meta";
			Display = {'x', 2};
			Cost = function(arg1, arg2) -- Line 2085
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(1000000000 ^ 1.8 ^ arg1)
			end;
			Boost = function(arg1, arg2) -- Line 2088
				return 1 + 0.03 * arg1
			end;
			Icon = "rbxassetid://140618832538548";
		};
		["8_1"] = {
			Type = "MoreCash";
			Currency = "Emeralds";
			Display = {'x', 1};
			Cost = function(arg1, arg2) -- Line 2097
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr((1 + arg1) * 1.1 ^ arg1)
			end;
			Boost = function(arg1, arg2) -- Line 2100
				return 1 + 0.1 * arg1
			end;
			Icon = "Cash";
		};
		["8_2"] = {
			Type = "MorePickaxePower";
			Currency = "Emeralds";
			Display = {'x', 1};
			Cost = function(arg1, arg2) -- Line 2109
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr((1 + arg1) * 1.1 ^ arg1)
			end;
			Boost = function(arg1, arg2) -- Line 2112
				return (1 + 0.1 * arg1) * 1.05 ^ arg1
			end;
			Icon = "rbxassetid://14343255533";
		};
		["8_3"] = {
			Type = "MiningSpeed";
			Currency = "Emeralds";
			Display = {'x', 2};
			Cost = function(arg1, arg2) -- Line 2121
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr((1 + arg1) * 1.1 ^ arg1)
			end;
			Boost = function(arg1, arg2) -- Line 2124
				return 1 + 0.01 * arg1
			end;
			Icon = "rbxassetid://140618832538548";
		};
		["8_4"] = {
			Type = "MoreLuck";
			MaxLevel = 20;
			Currency = "Emeralds";
			Display = {"+%", 0};
			Cost = function(arg1, arg2) -- Line 2134
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(2 ^ math.min(arg1, 9) * 1.15 ^ math.max(arg1 - 9, 0))
			end;
			Boost = function(arg1, arg2) -- Line 2137
				return 0.01 * arg1
			end;
			Icon = "rbxassetid://129338772390785";
		};
		["8_5"] = {
			Type = "MoreRange";
			Currency = "Emeralds";
			Display = {'+', 0};
			Cost = function(arg1, arg2) -- Line 2146
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(10 ^ math.min(arg1, 2) * 1.5 ^ math.max(arg1 - 2, 0))
			end;
			Boost = function(arg1, arg2) -- Line 2149
				return arg1
			end;
			Icon = "rbxassetid://112477020539886";
		};
		["8_6"] = {
			Type = "DuplicateBlocks";
			Currency = "Emeralds";
			Display = {"+%", 0};
			Cost = function(arg1, arg2) -- Line 2158
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(3 ^ math.min(arg1, 4) * 1.275 ^ math.max(arg1 - 4, 0))
			end;
			Boost = function(arg1, arg2) -- Line 2161
				return 0.01 * arg1
			end;
			Icon = "rbxassetid://117530341770458";
		};
		["8_7"] = {
			Type = "WalkSpeed";
			MaxLevel = 6;
			Currency = "Emeralds";
			Display = {'+', 0};
			Cost = function(arg1, arg2) -- Line 2171
				--[[ Upvalues[1]:
					[1]: PowerRound_upvr (readonly)
				]]
				return PowerRound_upvr(3 ^ arg1)
			end;
			Boost = function(arg1, arg2) -- Line 2174
				return arg1
			end;
			Icon = "rbxassetid://108237339735692";
		};
	};
	Others = {
		Backpack = function(arg1) -- Line 2181
			--[[ Upvalues[1]:
				[1]: FormulaHandler_upvr (readonly)
			]]
			return FormulaHandler_upvr.GetEquipableBoost(arg1, "Backpack")
		end;
		OreChance = function(arg1) -- Line 2184
			--[[ Upvalues[1]:
				[1]: FormulaHandler_upvr (readonly)
			]]
			return 0.05 * (FormulaHandler_upvr.GetEquipableBoost(arg1, "Luck") + FormulaHandler_upvr.GetBoost(arg1, "8_4") + FormulaHandler_upvr.GetAccessoryBoost(arg1, "Luck") + FormulaHandler_upvr.GetInfo(arg1, "MP_Luck"))
		end;
		TNTChance = function(arg1) -- Line 2187
			--[[ Upvalues[1]:
				[1]: FormulaHandler_upvr (readonly)
			]]
			return 0.0001 * FormulaHandler_upvr.GetBoost(arg1, "4_3")
		end;
		EmeraldChance = function(arg1) -- Line 2190
			local Value_5 = arg1.NumberValues.Mined.Value
			return 1 / math.min((math.log10(arg1.NumberValues.TotalCash.Value + 10) * 3000 + (math.log10(Value_5 + 10000) ^ math.log10(math.log10(Value_5 ^ 4 + 10000000000)) - 4) * 10000) ^ 0.91 + 10000, 200000)
		end;
		CashBoost = function(arg1) -- Line 2199
			--[[ Upvalues[1]:
				[1]: FormulaHandler_upvr (readonly)
			]]
			local var1662
			if arg1.Gamepasses.x2Cash.Value then
				var1662 *= 2
			end
			if arg1.Others.InGroup.Value then
				var1662 *= 1.5
			end
			var1662 *= FormulaHandler_upvr.GetBoost(arg1, "1_4")
			var1662 *= FormulaHandler_upvr.GetBoost(arg1, "8_1")
			var1662 *= 1 + FormulaHandler_upvr.GetInfo(arg1, "MP_Cash")
			var1662 *= 1 + FormulaHandler_upvr.GetAccessoryBoost(arg1, "Cash")
			if arg1.Accessories.Equipped[3].Value then
				if 5 <= arg1.Accessories.Levels[3].Value then
					var1662 *= 1.1
					return var1662
				end
				if 4 <= arg1.Accessories.Levels[3].Value then
					var1662 *= 1.05
				end
			end
			return var1662
		end;
		Emerald = function(arg1) -- Line 2221
			local var1664 = 1
			if arg1.Gamepasses.x2Emerald.Value then
				var1664 *= 2
			end
			return var1664
		end;
		PrestigeBoost = function(arg1, arg2) -- Line 2228
			if arg2 == nil then
			end
			local var1666 = arg1.NumberValues.Prestiges.Value + 0 + 1
			return var1666 ^ math.log10(10 + var1666)
		end;
		PrestigeCost = function(arg1) -- Line 2233
			--[[ Upvalues[1]:
				[1]: PowerRound_upvr (readonly)
			]]
			local Value = arg1.NumberValues.Prestiges.Value
			local var1669 = 100000000
			if Value == 0 then
				var1669 /= 2
			end
			return PowerRound_upvr(var1669 * 2.6666666666666665 ^ (Value * 2 ^ (Value / 50)))
		end;
		PrestigeTokens = function(arg1) -- Line 2241
			--[[ Upvalues[1]:
				[1]: FormulaHandler_upvr (readonly)
			]]
			local Value_2 = arg1.NumberValues.CashThisPrestige.Value
			if Value_2 < 50000000 then
				return 0
			end
			return math.max(math.round((math.log10(Value_2 / 100000000) * 0.1 + 1) ^ 10 * 40 * 1.085 ^ math.log10(Value_2 + 1) * (arg1.NumberValues.Prestiges.Value / 5 + 1) ^ 0.5 * (1 + FormulaHandler_upvr.GetInfo(arg1, "MP_PrestigeTokens")) * (1 + FormulaHandler_upvr.GetAccessoryBoost(arg1, "PrestigeTokens"))), 80)
		end;
		PickaxeBoost = function(arg1, arg2) -- Line 2251
			return 1 + arg2 * 0.5
		end;
		PickaxeBoostCost = function(arg1, arg2, arg3) -- Line 2254
			return math.round(arg3 * (1 + 30 / (arg2 + 100)) ^ arg3) * 5 + 5
		end;
		ExplosiveBoostCost = function(arg1, arg2, arg3) -- Line 2257
			--[[ Upvalues[2]:
				[1]: module_7_upvr (readonly)
				[2]: PowerRound_upvr (readonly)
			]]
			return PowerRound_upvr(module_7_upvr.Formulas.Equipables.Explosives.Cost(arg2, arg1) * 1.25 ^ arg3 * 10) / 10
		end;
		ExplosiveCooldown = function(arg1, arg2, arg3) -- Line 2261
			--[[ Upvalues[3]:
				[1]: HttpService_upvr (readonly)
				[2]: tbl_254_upvr (readonly)
				[3]: FormulaHandler_upvr (readonly)
			]]
			local pcall_result1, pcall_result2 = pcall(function() -- Line 2262
				--[[ Upvalues[2]:
					[1]: HttpService_upvr (copied, readonly)
					[2]: arg1 (readonly)
				]]
				return HttpService_upvr:JSONDecode(arg1.Others.ExplosiveUpgrades.Value)
			end)
			local var1679 = 0
			if pcall_result1 or type(pcall_result2) == "table" then
				local var1680 = pcall_result2[tostring(arg2)]
				if type(var1680) == "number" then
					var1679 = var1680
				end
			end
			var1680 = tbl_254_upvr[arg2 + 1] / 1.2 ^ var1679
			local var1681 = var1680
			if not arg3 then
				var1681 *= 1 - FormulaHandler_upvr.GetAccessoryBoost(arg1, "ExplosiveCooldownReduction")
			end
			return var1681
		end;
		MiningSpeed = function(arg1) -- Line 2279
			--[[ Upvalues[1]:
				[1]: FormulaHandler_upvr (readonly)
			]]
			local var1683
			if 0 < arg1.Others.MiningFrenzy.Value then
				var1683 /= FormulaHandler_upvr.GetBoost(arg1, "3_2")
			end
			if arg1.Gamepasses.x2MiningSpeed.Value then
				var1683 /= 1 + FormulaHandler_upvr.GetAccessoryBoost(arg1, "MiningSpeed") / 1.5
				var1683 /= 2
			else
				var1683 /= 1 + FormulaHandler_upvr.GetAccessoryBoost(arg1, "MiningSpeed")
			end
			var1683 /= 1 + FormulaHandler_upvr.GetInfo(arg1, "MP_MiningSpeed")
			if arg1.Others.LikeRewardActive.Value then
				var1683 /= 1.25
			end
			if arg1.AdminStuff.Flags.FastMine.Value then
				var1683 = 0.0001
			end
			return var1683
		end;
		ShopEmerald = function(arg1, arg2, arg3) -- Line 2302
			--[[ Upvalues[3]:
				[1]: tbl_55_upvr (readonly)
				[2]: module_6_upvr (readonly)
				[3]: ABTesting_upvr (readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local var1685
			if ABTesting_upvr.GetResult(arg1, "ShopEmeraldBoost") == 1 and not arg3 then
				local var1686 = math.min(arg1.NumberValues.EmeraldsMined.Value ^ 0.575 / 25, 2) + 1
				var1685 = math.round(var1685 * var1686 * 10) / 10
			end
			return var1685, math.round(module_6_upvr[arg2] * var1686 * 10) / 10
		end;
		ShopCash = function(arg1, arg2) -- Line 2313
			--[[ Upvalues[4]:
				[1]: module_7_upvr (readonly)
				[2]: PowerRound_upvr (readonly)
				[3]: FormulaHandler_upvr (readonly)
				[4]: tbl_3_upvr (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			local var1688
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [45] 33. Error Block 8 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [45] 33. Error Block 8 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [27] 19. Error Block 15 start (CF ANALYSIS FAILED)
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [45.10]
			if nil == 1 then
			end
			if var1688 ~= false then
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [45.12]
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [45.11]
				if nil <= nil then
					-- KONSTANTWARNING: GOTO [45] #33
				end
				-- KONSTANTWARNING: GOTO [47] #34
			end
			-- KONSTANTERROR: [27] 19. Error Block 15 end (CF ANALYSIS FAILED)
		end;
		BlockRarity = function(arg1, arg2) -- Line 2330
			--[[ Upvalues[2]:
				[1]: module_7_upvr (readonly)
				[2]: FormulaHandler_upvr (readonly)
			]]
			local var1690 = module_7_upvr.OreInfo[arg2]
			if not var1690 then
				return 0
			end
			if 9 <= var1690[2] then
				return math.round(var1690[3] / 0.05)
			end
			return math.round(var1690[3] / FormulaHandler_upvr.GetInfo(arg1, "OreChance"))
		end;
		MiningRange = function(arg1) -- Line 2338
			--[[ Upvalues[1]:
				[1]: FormulaHandler_upvr (readonly)
			]]
			local var1692 = 10 + FormulaHandler_upvr.GetBoost(arg1, "5_1") + FormulaHandler_upvr.GetBoost(arg1, "5_2") + FormulaHandler_upvr.GetAccessoryBoost(arg1, "MiningRange") + FormulaHandler_upvr.GetInfo(arg1, "MP_MiningRange")
			if arg1.Gamepasses.MoreRange.Value then
				var1692 += 5
			end
			return var1692 + FormulaHandler_upvr.GetBoost(arg1, "8_5") + 2
		end;
		MetaRequired = function(arg1) -- Line 2351
			return 99
		end;
		MetaGain = function(arg1) -- Line 2354
			--[[ Upvalues[1]:
				[1]: FormulaHandler_upvr (readonly)
			]]
			local Value_4 = arg1.NumberValues.RobuxSpent.Value
			if Value_4 < FormulaHandler_upvr.GetInfo(arg1, "MetaRequired") then
				return 0
			end
			return math.round(((Value_4 / 99) ^ 2 + (Value_4 / 499) ^ 6 + (Value_4 / 1999) ^ 10 + (Value_4 / 19999) ^ 20 + 1) * FormulaHandler_upvr.GetBoost(arg1, "7_1") * FormulaHandler_upvr.GetBoost(arg1, "7_2") * FormulaHandler_upvr.GetBoost(arg1, "7_3") * 10) / 10
		end;
		MP_PickaxePower = function(arg1) -- Line 2363
			return 0.01 * arg1.NumberValues.MagicPower.Value
		end;
		MP_Cash = function(arg1) -- Line 2366
			return math.max(arg1.NumberValues.MagicPower.Value - 50, 0) * 0.01
		end;
		MP_PrestigeTokens = function(arg1) -- Line 2369
			return math.max(arg1.NumberValues.MagicPower.Value - 100, 0) * 0.005
		end;
		MP_WalkSpeed = function(arg1) -- Line 2372
			local var1700 = math.max(arg1.NumberValues.MagicPower.Value - 150, 0) * 0.005
			if 3 < var1700 then
				var1700 = (var1700 - 3 + 1) ^ 0.5 + 3 - 1
			end
			return var1700
		end;
		MP_Dupe = function(arg1) -- Line 2379
			local var1702 = math.max(arg1.NumberValues.MagicPower.Value - 200, 0) ^ 0.4 * 0.005
			if 30 < var1702 then
				var1702 = (var1702 - 30 + 1) ^ 0.8 + 30 - 1
			end
			return var1702
		end;
		MP_MiningRange = function(arg1) -- Line 2386
			local Value_3 = arg1.NumberValues.MagicPower.Value
			return math.clamp(Value_3 - 300, 0, 550) * 0.01 + math.max(Value_3 - 850, 0) * 0.002
		end;
		MP_JackhammerChance = function(arg1) -- Line 2392
			return math.min(math.max(arg1.NumberValues.MagicPower.Value - 400, 0) // 50 * 0.00025, 0.0005)
		end;
		MP_ExplosionChance = function(arg1) -- Line 2395
			return math.min(math.max(arg1.NumberValues.MagicPower.Value - 600, 0) // 50 * 0.0002, 0.0005)
		end;
		MP_Luck = function(arg1) -- Line 2398
			local var1708 = math.max(arg1.NumberValues.MagicPower.Value - 800, 0) * 0.01
			if 10 < var1708 then
				var1708 = (var1708 - 10 + 1) ^ 0.5 + 10 - 1
			end
			return var1708 * 0.01
		end;
		MP_MiningSpeed = function(arg1) -- Line 2405
			local var1710 = math.max(arg1.NumberValues.MagicPower.Value - 1000, 0) * 0.015
			if 10 < var1710 then
				var1710 = (var1710 - 10 + 1) ^ 0.75 + 10 - 1
			end
			return var1710 * 0.01
		end;
		AccessoryEquipLimit = function(arg1) -- Line 2412
			--[[ Upvalues[1]:
				[1]: FormulaHandler_upvr (readonly)
			]]
			return FormulaHandler_upvr.GetBoost(arg1, "6_2")
		end;
		DupeBlockChance = function(arg1) -- Line 2415
			--[[ Upvalues[1]:
				[1]: FormulaHandler_upvr (readonly)
			]]
			return FormulaHandler_upvr.GetInfo(arg1, "MP_Dupe") + FormulaHandler_upvr.GetAccessoryBoost(arg1, "Dupe") + FormulaHandler_upvr.GetBoost(arg1, "8_6")
		end;
	};
}
for i_9, v_6 in module_7_upvr.Formulas.Upgrades do
	local string_split_result1 = string.split(i_9, '_')
	local tonumber_result1 = tonumber(string_split_result1[2])
	local function INLINED_2() -- Internal function, doesn't exist in bytecode
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return tbl_240[tonumber(string_split_result1[1])] < tonumber_result1
	end
	if not tbl_240[tonumber(string_split_result1[1])] or INLINED_2() then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		tbl_240[tonumber(string_split_result1[1])] = tonumber_result1
	end
	if type(v_6.Currency) == "string" and #string.split(v_6.Currency, '.') == 1 then
		v_6.Currency = "NumberValues."..v_6.Currency
	end
end
module_7_upvr.Icons = {
	Cash = "rbxassetid://13140651659";
	Emeralds = "rbxassetid://13231372550";
	PrestigeTokens = "rbxassetid://13253135154";
	Meta = "rbxassetid://126150381133967";
	MagicPower = "rbxassetid://119379897676977";
}
module_7_upvr.DeveloperProducts = {
	Emerald = {1512815855, 1512815854, 1512815847, 1512815846, 1512815840, 3506768975};
	Cash = {1512815842, 1512815843, 1512815844, 1512815841, 1512815848};
}
local tbl_251 = {}
;({})[1] = "MoreRange"
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1645649843
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[3] = 3492385246
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[4] = 107
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[5] = 399
tbl_251[1] = {"InfiniteBackpack", 160945331, 1517324247, 33, 1999}
tbl_251[2] = {"VIP", 161953876, 1519011863, 60, 499}
tbl_251[3] = {"x2MiningSpeed", 160911908, 1517020192, 58, 299}
tbl_251[4] = {"x2Cash", 160704432, 1516733226, 54, 299}
tbl_251[5] = {"x2PickaxePower", 160906944, 1517012982, 57, 99}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_251[6] = {}
tbl_251[7] = {"Teleporter", 161953633, 1519011694, 59, 249}
tbl_251[8] = {"x2Speed", 229281248, 1607491086, 68, 199, function(arg1) -- Line 2456
	arg1.Settings.x2Speed.Value = true
end}
tbl_251[9] = {"x2Emerald", 160704647, 1516733225, 55, 999}
tbl_251[10] = {"x2Storage", 160945134, 1517324055, 32, 99}
tbl_251[11] = {"SharperPickaxes", 160905594, 1517011949, 56, 10}
tbl_251[12] = {"x2Jump", 229281533, 1607491336, 69, 99, function(arg1) -- Line 2462
	arg1.Settings.x2Jump.Value = true
end}
tbl_251[13] = {"Jetpack", 229281806, 1607491615, 70, 399}
module_7_upvr.GamepassInfo = tbl_251
module_7_upvr.LobbyInfo = {
	Highest = 3000;
	Lowest = -8000;
	Step = 500;
	Cost = function(arg1) -- Line 2472
		if arg1 == 0 then
			return 0
		end
		return math.floor(math.abs(arg1) / 2000) + 1
	end;
	UnlockMultiplier = 30;
}
module_7_upvr.LobbyIcons = {-- : First try: K:0: attempt to index nil with 't'

if game:GetService("RunService"):IsStudio() then
	module_7_upvr.LobbyInfo.Highest = 3500
end
module_7_upvr.LowestDepthToRecord = math.min(module_7_upvr.LobbyInfo.Lowest, module_7_upvr.LowestDepth)
module_7_upvr.HighestDepthToRecord = math.max(module_7_upvr.LobbyInfo.Highest, module_7_upvr.HighestDepth)
module_7_upvr.MPGains = {3, 5, 8, 12, 16, 22, 30, 70, 250, 500}
local tbl_146 = {}
local tbl_152 = {
	Icon = "rbxassetid://118242215754694";
	RarityOffset = 0;
}
local tbl_86 = {}
local tbl_214 = {}
local tbl_34 = {}
;({})[1] = 8
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_34[1] = {1, 1000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_34[2] = {}
tbl_214.Recipe = tbl_34
tbl_214.Boosts = {{"Dupe", 0.05}}
tbl_86[1] = tbl_214
local tbl_14 = {}
local tbl_250 = {}
;({})[1] = 8
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 5
tbl_250[1] = {1, 5000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_250[2] = {}
tbl_250[3] = {394, 5}
tbl_250[4] = {542, 1}
tbl_14.Recipe = tbl_250
tbl_14.Boosts = {{"Dupe", 0.1}}
tbl_86[2] = tbl_14
local tbl_53 = {}
local tbl_213 = {}
;({})[1] = 3
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 600
tbl_213[1] = {2, 500}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_213[2] = {}
tbl_213[3] = {9, 10}
tbl_213[4] = {10, 1}
tbl_213[5] = {11, 1}
tbl_53.Recipe = tbl_213
tbl_53.Boosts = {{"Dupe", 0.15}}
tbl_86[3] = tbl_53
local tbl_54 = {}
local tbl_84 = {}
;({})[1] = 394
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 75
tbl_84[1] = {1, 25000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_84[2] = {}
tbl_84[3] = {9, 50}
tbl_84[4] = {543, 1}
tbl_84[5] = {12, 1}
tbl_54.Recipe = tbl_84
tbl_54.Boosts = {{"Dupe", 0.2}}
tbl_86[4] = tbl_54
tbl_152.Levels = tbl_86
tbl_146[1] = tbl_152
local tbl_172 = {
	Icon = "rbxassetid://129230624517488";
	Unlock = function(arg1) -- Line 2565
		local var1771
		if arg1.Accessories.Levels[23].Value >= 1 then
			var1771 = false
		else
			var1771 = true
		end
		return var1771
	end;
	UpdateIds = {"Accessories.Levels.23"};
	RarityOffset = 2;
}
local tbl_241 = {}
local tbl_2 = {}
local tbl_223 = {}
;({})[1] = 242
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 12
tbl_223[1] = {235, 10000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_223[2] = {}
tbl_223[3] = {244, 2}
tbl_223[4] = {425, 2}
tbl_223[5] = {245, 2}
tbl_2.Recipe = tbl_223
tbl_2.Boosts = {{"RareExplosion", 0.2}}
tbl_241[1] = tbl_2
local tbl_56 = {}
local tbl_143 = {}
;({})[1] = 241
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 150
tbl_143[1] = {235, 25000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_143[2] = {}
tbl_143[3] = {245, 4}
tbl_143[4] = {425, 4}
tbl_143[5] = {244, 4}
tbl_56.Recipe = tbl_143
tbl_56.Boosts = {{"RareExplosion", 0.4}}
tbl_241[2] = tbl_56
local tbl_66 = {}
local tbl_92 = {}
;({})[1] = 247
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 2
tbl_92[1] = {235, 75000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_92[2] = {}
tbl_92[3] = {426, 2}
tbl_92[4] = {424, 10}
tbl_92[5] = {576, 600}
tbl_66.Recipe = tbl_92
tbl_66.Boosts = {{"RareExplosion", 0.6}}
tbl_241[3] = tbl_66
local tbl_94 = {}
local tbl_12 = {}
;({})[1] = 244
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 50
tbl_12[1] = {235, 300000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_12[2] = {}
tbl_12[3] = {243, 500}
tbl_12[4] = {248, 1}
tbl_12[5] = {427, 1}
tbl_94.Recipe = tbl_12
tbl_94.Boosts = {{"RareExplosion", 1}}
tbl_241[4] = tbl_94
tbl_172.Levels = tbl_241
tbl_146[2] = tbl_172
local tbl_49 = {
	Icon = "rbxassetid://100963286776251";
	RarityOffset = 3;
}
local tbl_199 = {}
local tbl_229 = {}
local tbl_211 = {}
;({})[1] = 207
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 10000
tbl_211[1] = {179, 15000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_211[2] = {}
tbl_211[3] = {507, 1}
tbl_211[4] = {513, 1}
tbl_229.Recipe = tbl_211
tbl_229.Boosts = {{"Cash", 0.15}}
tbl_199[1] = tbl_229
local tbl_238 = {}
local tbl_249 = {}
;({})[1] = 160
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 12
tbl_249[1] = {189, 10}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_249[2] = {}
tbl_249[3] = {164, 1}
tbl_238.Recipe = tbl_249
tbl_238.Boosts = {{"Cash", 0.25}}
tbl_199[2] = tbl_238
local tbl_5 = {}
local tbl_204 = {}
;({})[1] = 179
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 150000
tbl_204[1] = {207, 150000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_204[2] = {}
tbl_204[3] = {505, 300}
tbl_204[4] = {186, 350}
tbl_204[5] = {192, 1}
tbl_204[6] = {220, 1}
tbl_204[7] = {508, 1}
tbl_5.Recipe = tbl_204
tbl_5.Boosts = {{"Cash", 0.4}}
tbl_199[3] = tbl_5
local tbl_247 = {}
local tbl_25 = {}
;({})[1] = 179
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 300000
tbl_25[1] = {207, 500000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_25[2] = {}
tbl_25[3] = {216, 125}
tbl_25[4] = {512, 90}
tbl_25[5] = {473, 1}
tbl_25[6] = {452, 1}
tbl_247.Recipe = tbl_25
tbl_247.Boosts = {{"Cash", 0.65}}
tbl_199[4] = tbl_247
local tbl_140 = {}
local tbl_16 = {}
;({})[1] = 179
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 2000000
tbl_16[1] = {207, 2000000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_16[2] = {}
tbl_16[3] = {681, 1}
tbl_16[4] = {473, 4}
tbl_16[5] = {455, 4}
tbl_16[6] = {459, 4}
tbl_16[7] = {452, 4}
tbl_16[8] = {220, 25}
tbl_16[9] = {508, 25}
tbl_16[10] = {192, 20}
tbl_16[11] = {514, 20}
tbl_16[12] = {512, 900}
tbl_16[13] = {506, 900}
tbl_140.Recipe = tbl_16
tbl_140.Boosts = {{"Cash", 1}}
tbl_199[5] = tbl_140
tbl_49.Levels = tbl_199
tbl_146[3] = tbl_49
local tbl_47 = {
	Icon = "rbxassetid://76992998950673";
	RarityOffset = 0;
}
local tbl_246 = {}
local tbl_245 = {}
local tbl_4 = {}
;({})[1] = 551
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 2
tbl_4[1] = {44, 2000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_4[2] = {}
tbl_4[3] = {53, 2}
tbl_4[4] = {52, 2}
tbl_245.Recipe = tbl_4
local tbl_200 = {}
;({})[1] = "PickaxePower"
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 0.05
tbl_200[1] = {"Cash", 0.05}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_200[2] = {}
tbl_245.Boosts = tbl_200
tbl_246[1] = tbl_245
local tbl_166 = {}
local tbl_243 = {}
;({})[1] = 54
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_243[1] = {44, 6000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_243[2] = {}
tbl_243[3] = {552, 1}
tbl_243[4] = {53, 8}
tbl_243[5] = {50, 60}
tbl_166.Recipe = tbl_243
local tbl_75 = {}
;({})[1] = "PickaxePower"
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 0.1
tbl_75[1] = {"Cash", 0.1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_75[2] = {}
tbl_166.Boosts = tbl_75
tbl_246[2] = tbl_166
local tbl_96 = {}
local tbl_236 = {}
;({})[1] = 45
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 800
tbl_236[1] = {44, 12000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_236[2] = {}
tbl_236[3] = {52, 12}
tbl_236[4] = {55, 4}
tbl_96.Recipe = tbl_236
local tbl_52 = {}
;({})[1] = "PickaxePower"
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 0.15
tbl_52[1] = {"Cash", 0.15}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_52[2] = {}
tbl_96.Boosts = tbl_52
tbl_246[3] = tbl_96
local tbl_68 = {}
local tbl_63 = {}
;({})[1] = 550
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 200
tbl_63[1] = {44, 25000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_63[2] = {}
tbl_63[3] = {551, 20}
tbl_63[4] = {552, 3}
tbl_63[5] = {56, 1}
tbl_63[6] = {57, 1}
tbl_68.Recipe = tbl_63
local tbl_209 = {}
;({})[1] = "PickaxePower"
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 0.2
tbl_209[1] = {"Cash", 0.2}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_209[2] = {}
tbl_68.Boosts = tbl_209
tbl_246[4] = tbl_68
local tbl_71 = {}
local tbl_61 = {}
;({})[1] = 49
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 800
tbl_61[1] = {44, 75000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_61[2] = {}
tbl_61[3] = {553, 2}
tbl_61[4] = {57, 2}
tbl_61[5] = {554, 1}
tbl_71.Recipe = tbl_61
local tbl_27 = {}
;({})[1] = "PickaxePower"
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 0.25
tbl_27[1] = {"Cash", 0.25}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_27[2] = {}
tbl_71.Boosts = tbl_27
tbl_246[5] = tbl_71
local tbl_221 = {}
local tbl_48 = {}
;({})[1] = 664
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_48[1] = {665, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_48[2] = {}
tbl_48[3] = {666, 1}
tbl_48[4] = {400, 8}
tbl_48[5] = {399, 6}
tbl_48[6] = {553, 140}
tbl_48[7] = {57, 140}
tbl_48[8] = {56, 140}
tbl_48[9] = {548, 80}
tbl_48[10] = {27, 80}
tbl_48[11] = {26, 80}
tbl_221.Recipe = tbl_48
local tbl_136 = {}
;({})[1] = "PickaxePower"
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 0.7
tbl_136[1] = {"Cash", 0.7}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_136[2] = {}
tbl_136[3] = {"PrestigeTokens", 0.2}
tbl_136[4] = {"MiningSpeed", 0.05}
tbl_221.Boosts = tbl_136
tbl_221.Rarity = 8
tbl_246[6] = tbl_221
tbl_47.Levels = tbl_246
tbl_146[4] = tbl_47
local tbl_233 = {
	Icon = "rbxassetid://134544135649690";
	RarityOffset = 4;
}
local tbl_232 = {}
local tbl_20 = {}
local tbl_231 = {}
;({})[1] = 81
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 75
tbl_231[1] = {73, 60000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_231[2] = {}
tbl_231[3] = {84, 12}
tbl_231[4] = {557, 12}
tbl_231[5] = {558, 1}
tbl_231[6] = {86, 2}
tbl_20.Recipe = tbl_231
tbl_20.Boosts = {{"MiningSpeed", 0.04}}
tbl_232[1] = tbl_20
local tbl_187 = {}
local tbl_32 = {}
;({})[1] = 79
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 2500
tbl_32[1] = {73, 300000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_32[2] = {}
tbl_32[3] = {80, 2000}
tbl_32[4] = {83, 50}
tbl_32[5] = {558, 7}
tbl_32[6] = {87, 2}
tbl_32[7] = {559, 1}
tbl_187.Recipe = tbl_32
tbl_187.Boosts = {{"MiningSpeed", 0.07}}
tbl_232[2] = tbl_187
local tbl_23 = {}
local tbl_102 = {}
;({})[1] = 556
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1000
tbl_102[1] = {73, 1500000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_102[2] = {}
tbl_102[3] = {82, 1000}
tbl_102[4] = {557, 150}
tbl_102[5] = {559, 10}
tbl_102[6] = {402, 1}
tbl_102[7] = {401, 1}
tbl_23.Recipe = tbl_102
tbl_23.Boosts = {{"MiningSpeed", 0.15}}
tbl_232[3] = tbl_23
local tbl_93 = {}
local tbl_227 = {}
;({})[1] = 402
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 10
tbl_227[1] = {666, 2}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_227[2] = {}
tbl_227[3] = {401, 10}
tbl_227[4] = {559, 40}
tbl_227[5] = {87, 40}
tbl_227[6] = {558, 300}
tbl_227[7] = {86, 300}
tbl_227[8] = {85, 300}
tbl_227[9] = {557, 2000}
tbl_227[10] = {84, 2000}
tbl_227[11] = {83, 2000}
tbl_227[12] = {556, 20000}
tbl_227[13] = {82, 20000}
tbl_227[14] = {81, 20000}
tbl_93.Recipe = tbl_227
tbl_93.Boosts = {{"MiningSpeed", 0.3}}
tbl_232[4] = tbl_93
local tbl_35 = {}
local tbl_120 = {}
;({})[1] = 667
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 5
tbl_120[1] = {718, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_120[2] = {}
tbl_120[3] = {468, 50}
tbl_120[4] = {404, 40}
tbl_120[5] = {668, 4}
tbl_120[6] = {669, 3}
tbl_120[7] = {410, 32}
tbl_120[8] = {74, 4000000}
tbl_120[9] = {75, 4000000}
tbl_120[10] = {76, 4321000}
tbl_120[11] = {77, 4567890}
tbl_120[12] = {78, 400000}
tbl_120[13] = {555, 500000}
tbl_120[14] = {73, 60000000}
tbl_120[15] = {103, 10000000}
tbl_120[16] = {135, 10000000}
;({})[1] = 172
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 30000
tbl_120[17] = {165, 20000000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_120[18] = {}
tbl_120[19] = {405, 30000}
tbl_120[20] = {174, 3000}
tbl_120[21] = {406, 5000}
tbl_120[22] = {175, 5000}
tbl_35.Recipe = tbl_120
tbl_35.Boosts = {{"MiningSpeed", 0.65}}
tbl_232[5] = tbl_35
tbl_233.Levels = tbl_232
tbl_146[5] = tbl_233
local tbl_10 = {
	Icon = "rbxassetid://74108157065171";
	RarityOffset = 5;
}
local tbl_217 = {}
local tbl_107 = {}
local tbl_91 = {}
;({})[1] = 118
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_91[1] = {103, 500000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_91[2] = {}
tbl_91[3] = {563, 2}
tbl_107.Recipe = tbl_91
tbl_107.Boosts = {{"WalkSpeed", 0.75}}
tbl_217[1] = tbl_107
tbl_10.Levels = tbl_217
tbl_146[6] = tbl_10
local tbl_106 = {
	Icon = "rbxassetid://106289611558174";
	RarityOffset = 2;
}
local tbl_216 = {}
local tbl_237 = {}
local tbl_215 = {}
;({})[1] = 574
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 80
tbl_215[1] = {221, 20000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_215[2] = {}
tbl_215[3] = {417, 12}
tbl_215[4] = {229, 10}
tbl_215[5] = {418, 2}
tbl_237.Recipe = tbl_215
tbl_237.Boosts = {{"ExtraExplosionRadiusChance", 0.1}}
tbl_216[1] = tbl_237
local tbl_36 = {}
local tbl_88 = {}
;({})[1] = 225
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 200
tbl_88[1] = {221, 50000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_88[2] = {}
tbl_88[3] = {228, 24}
tbl_88[4] = {230, 5}
tbl_88[5] = {233, 1}
tbl_36.Recipe = tbl_88
tbl_36.Boosts = {{"ExtraExplosionRadiusChance", 0.2}}
tbl_216[2] = tbl_36
local tbl_104 = {}
local tbl_105 = {}
;({})[1] = 231
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 50
tbl_105[1] = {221, 400000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_105[2] = {}
tbl_105[3] = {418, 50}
tbl_105[4] = {419, 8}
tbl_105[5] = {232, 8}
tbl_105[6] = {421, 1}
tbl_105[7] = {234, 1}
tbl_105[8] = {420, 1}
tbl_104.Recipe = tbl_105
tbl_104.Boosts = {{"ExtraExplosionRadiusChance", 0.4}}
tbl_104.Rarity = 6
tbl_216[3] = tbl_104
local tbl_210 = {}
local tbl_73 = {}
;({})[1] = 574
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 10000
tbl_73[1] = {221, 1000000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_73[2] = {}
tbl_73[3] = {419, 25}
tbl_73[4] = {420, 5}
tbl_73[5] = {423, 2}
tbl_73[6] = {422, 1}
tbl_210.Recipe = tbl_73
tbl_210.Boosts = {{"ExtraExplosionRadiusChance", 0.6}}
tbl_210.Rarity = 7
tbl_216[4] = tbl_210
local tbl_206 = {}
local tbl_205 = {}
;({})[1] = 670
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_205[1] = {671, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_205[2] = {}
tbl_205[3] = {672, 1}
tbl_205[4] = {419, 220}
tbl_205[5] = {233, 240}
tbl_205[6] = {426, 200}
tbl_205[7] = {205, 210}
tbl_206.Recipe = tbl_205
tbl_206.Boosts = {{"ExtraExplosionRadiusChance", 1}}
tbl_206.Rarity = 8
tbl_216[5] = tbl_206
tbl_106.Levels = tbl_216
tbl_146[7] = tbl_106
local tbl_26 = {
	Icon = "rbxassetid://82371718868695";
	Unlock = function(arg1) -- Line 2977
		local var2043
		if arg1.Accessories.Levels[23].Value >= 1 then
			var2043 = false
		else
			var2043 = true
		end
		return var2043
	end;
	UpdateIds = {"Accessories.Levels.23"};
	RarityOffset = 5;
}
local tbl_197 = {}
local tbl_122 = {}
local tbl_121 = {}
;({})[1] = 144
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 500
tbl_121[1] = {135, 300000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_121[2] = {}
tbl_121[3] = {147, 10}
tbl_121[4] = {567, 10}
tbl_121[5] = {568, 2}
tbl_121[6] = {149, 1}
tbl_122.Recipe = tbl_121
tbl_122.Boosts = {}
tbl_197[1] = tbl_122
tbl_26.Levels = tbl_197
tbl_146[8] = tbl_26
local tbl_196 = {
	Icon = "rbxassetid://76423527675681";
	Unlock = function(arg1) -- Line 2998
		local var2055
		if arg1.Accessories.Levels[23].Value >= 1 then
			var2055 = false
		else
			var2055 = true
		end
		return var2055
	end;
	UpdateIds = {"Accessories.Levels.23"};
	RarityOffset = 3;
}
local tbl_40 = {}
local tbl_195 = {}
local tbl_58 = {}
;({})[1] = 572
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 200
tbl_58[1] = {193, 30000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_58[2] = {}
tbl_58[3] = {411, 25}
tbl_58[4] = {412, 2}
tbl_58[5] = {202, 2}
tbl_195.Recipe = tbl_58
tbl_195.Boosts = {{"LegendaryExplosion", 0.33}}
tbl_40[1] = tbl_195
local tbl_124 = {}
local tbl_203 = {}
;({})[1] = 199
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 800
tbl_203[1] = {193, 80000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_203[2] = {}
tbl_203[3] = {201, 70}
tbl_203[4] = {203, 12}
tbl_203[5] = {205, 2}
tbl_203[6] = {204, 2}
tbl_124.Recipe = tbl_203
tbl_124.Boosts = {{"LegendaryExplosion", 0.66}}
tbl_40[2] = tbl_124
local tbl_194 = {}
local tbl_70 = {}
;({})[1] = 198
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 2500
tbl_70[1] = {193, 600000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_70[2] = {}
tbl_70[3] = {412, 50}
tbl_70[4] = {204, 10}
tbl_70[5] = {413, 8}
tbl_70[6] = {414, 1}
tbl_70[7] = {206, 1}
tbl_194.Recipe = tbl_70
tbl_194.Boosts = {{"LegendaryExplosion", 1}}
tbl_40[3] = tbl_194
local tbl_193 = {}
local tbl_31 = {}
;({})[1] = 413
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 20
tbl_31[1] = {193, 1500000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_31[2] = {}
tbl_31[3] = {205, 20}
tbl_31[4] = {200, 1500}
tbl_31[5] = {414, 5}
tbl_31[6] = {415, 1}
tbl_31[7] = {416, 1}
tbl_193.Recipe = tbl_31
tbl_193.Boosts = {{"LegendaryExplosion", 1}}
tbl_40[4] = tbl_193
tbl_196.Levels = tbl_40
tbl_146[9] = tbl_196
local tbl_192 = {
	Icon = "rbxassetid://76161206263664";
	RarityOffset = 2;
}
local tbl = {}
local tbl_103 = {}
local tbl_191 = {}
;({})[1] = 39
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_191[1] = {68, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_191[2] = {}
tbl_191[3] = {98, 1}
tbl_191[4] = {88, 10000}
tbl_103.Recipe = tbl_191
tbl_103.Boosts = {{"RadarRadius", 30}}
tbl[1] = tbl_103
local tbl_190 = {}
local tbl_189 = {}
;({})[1] = 518
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_189[1] = {533, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_189[2] = {}
tbl_189[3] = {150, 15000}
tbl_189[4] = {119, 10000}
tbl_189[5] = {524, 150}
tbl_190.Recipe = tbl_189
tbl_190.Boosts = {{"RadarRadius", 40}}
tbl[2] = tbl_190
local tbl_37 = {}
local tbl_188 = {}
;({})[1] = 71
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_188[1] = {534, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_188[2] = {}
tbl_188[3] = {70, 1}
tbl_188[4] = {101, 1}
tbl_188[5] = {95, 750}
tbl_188[6] = {126, 750}
tbl_188[7] = {515, 3000}
tbl_37.Recipe = tbl_188
tbl_37.Boosts = {{"RadarRadius", 50}}
tbl[3] = tbl_37
local tbl_175 = {}
local tbl_137 = {}
;({})[1] = 120
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 2000
tbl_137[1] = {88, 300000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_137[2] = {}
tbl_137[3] = {161, 100}
tbl_137[4] = {130, 100}
tbl_137[5] = {72, 1}
tbl_137[6] = {539, 1}
tbl_137[7] = {528, 1}
tbl_175.Recipe = tbl_137
tbl_175.Boosts = {{"RadarRadius", 65}}
tbl[4] = tbl_175
local tbl_80 = {}
local tbl_186 = {}
;({})[1] = 474
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_186[1] = {475, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_186[2] = {}
tbl_186[3] = {29, 1000000}
tbl_186[4] = {529, 50000}
tbl_186[5] = {102, 2}
tbl_186[6] = {134, 2}
tbl_186[7] = {519, 2}
tbl_80.Recipe = tbl_186
tbl_80.Boosts = {{"RadarRadius", 80}}
tbl[5] = tbl_80
tbl_192.Levels = tbl
tbl_146[10] = tbl_192
local tbl_185 = {
	Icon = "rbxassetid://127541657606404";
	RarityOffset = 1;
}
local tbl_184 = {}
local tbl_45 = {}
local tbl_234 = {}
;({})[1] = 545
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 50
tbl_234[1] = {15, 5000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_234[2] = {}
tbl_234[3] = {547, 1}
tbl_45.Recipe = tbl_234
tbl_45.Boosts = {}
tbl_184[1] = tbl_45
local tbl_64 = {}
local tbl_183 = {}
;({})[1] = 342
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_183[1] = {587, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_183[2] = {}
tbl_183[3] = {341, 1}
tbl_183[4] = {583, 1}
tbl_183[5] = {326, 1}
tbl_183[6] = {325, 1}
tbl_183[7] = {447, 1}
tbl_183[8] = {310, 1}
tbl_183[9] = {309, 1}
tbl_183[10] = {442, 1}
tbl_183[11] = {294, 1}
tbl_183[12] = {293, 1}
tbl_183[13] = {437, 1}
tbl_183[14] = {278, 1}
tbl_183[15] = {277, 1}
tbl_183[16] = {431, 1}
;({})[1] = 262
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_183[17] = {263, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_183[18] = {}
tbl_183[19] = {426, 1}
tbl_183[20] = {247, 1}
tbl_183[21] = {246, 1}
tbl_183[22] = {419, 1}
tbl_183[23] = {233, 1}
tbl_183[24] = {232, 1}
tbl_183[25] = {413, 1}
tbl_183[26] = {205, 1}
tbl_183[27] = {204, 1}
tbl_183[28] = {407, 1}
tbl_183[29] = {177, 1}
tbl_183[30] = {176, 1}
tbl_183[31] = {147, 1}
tbl_183[32] = {148, 1}
;({})[1] = 562
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_183[33] = {567, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_183[34] = {}
tbl_183[35] = {117, 1}
tbl_183[36] = {116, 1}
tbl_64.Recipe = tbl_183
tbl_64.Boosts = {}
tbl_64.Rarity = 6
tbl_184[2] = tbl_64
local tbl_181 = {}
local tbl_180 = {}
;({})[1] = 703
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_180[1] = {496, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_180[2] = {}
tbl_181.Recipe = tbl_180
tbl_181.Boosts = {}
tbl_181.Rarity = 7
tbl_184[3] = tbl_181
local tbl_19 = {}
local tbl_182 = {}
;({})[1] = 466
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_182[1] = {495, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_182[2] = {}
tbl_182[3] = {459, 1}
tbl_182[4] = {473, 1}
tbl_182[5] = {453, 1}
tbl_182[6] = {497, 1}
tbl_182[7] = {475, 1}
tbl_182[8] = {462, 1}
tbl_182[9] = {471, 1}
tbl_182[10] = {467, 1}
tbl_182[11] = {397, 1}
tbl_182[12] = {399, 1}
tbl_182[13] = {402, 1}
tbl_182[14] = {403, 1}
tbl_182[15] = {465, 1}
tbl_182[16] = {409, 1}
;({})[1] = 423
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_182[17] = {415, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_182[18] = {}
tbl_182[19] = {428, 1}
tbl_182[20] = {433, 1}
tbl_182[21] = {439, 1}
tbl_182[22] = {445, 1}
tbl_182[23] = {450, 1}
tbl_182[24] = {463, 1}
tbl_182[25] = {472, 1}
tbl_182[26] = {361, 1}
tbl_182[27] = {470, 1}
tbl_182[28] = {617, 1}
tbl_182[29] = {639, 1}
tbl_182[30] = {661, 1}
tbl_182[31] = {702, 1}
tbl_182[32] = {704, 1}
tbl_19.Recipe = tbl_182
tbl_19.Boosts = {}
tbl_19.Rarity = 8
tbl_184[4] = tbl_19
local tbl_97 = {}
local tbl_21 = {}
;({})[1] = 681
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_21[1] = {677, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_21[2] = {}
tbl_21[3] = {707, 1}
tbl_21[4] = {711, 1}
tbl_21[5] = {705, 1}
tbl_21[6] = {664, 1}
tbl_21[7] = {666, 1}
tbl_21[8] = {668, 1}
tbl_21[9] = {670, 1}
tbl_21[10] = {672, 1}
tbl_21[11] = {674, 1}
tbl_21[12] = {676, 1}
tbl_21[13] = {717, 1}
tbl_21[14] = {708, 1}
tbl_21[15] = {679, 1}
tbl_21[16] = {704, 1}
;({})[1] = 835
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_21[17] = {766, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_21[18] = {}
tbl_21[19] = {743, 1}
tbl_97.Recipe = tbl_21
tbl_97.Boosts = {}
tbl_97.Rarity = 9
tbl_184[5] = tbl_97
local tbl_179 = {}
local tbl_30 = {}
;({})[1] = 476
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 20000000
tbl_30[1] = {790, 20000000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_30[2] = {}
tbl_30[3] = {379, 20000000}
tbl_30[4] = {207, 20000000}
tbl_30[5] = {179, 20000000}
tbl_30[6] = {150, 20000000}
tbl_30[7] = {119, 20000000}
tbl_30[8] = {88, 20000000}
tbl_30[9] = {59, 20000000}
tbl_30[10] = {29, 20000000}
tbl_30[11] = {1, 20000000}
tbl_30[12] = {15, 20000000}
tbl_30[13] = {44, 20000000}
tbl_30[14] = {73, 20000000}
tbl_30[15] = {103, 20000000}
tbl_30[16] = {135, 20000000}
;({})[1] = 193
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 20000000
tbl_30[17] = {165, 20000000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_30[18] = {}
tbl_30[19] = {221, 20000000}
tbl_30[20] = {235, 20000000}
tbl_30[21] = {249, 20000000}
tbl_30[22] = {265, 20000000}
tbl_30[23] = {280, 20000000}
tbl_30[24] = {296, 20000000}
tbl_30[25] = {312, 20000000}
tbl_30[26] = {328, 20000000}
tbl_30[27] = {344, 20000000}
tbl_30[28] = {362, 20000000}
tbl_30[29] = {597, 20000000}
tbl_30[30] = {619, 20000000}
tbl_30[31] = {641, 20000000}
tbl_30[32] = {682, 20000000}
;({})[1] = 744
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 20000000
tbl_30[33] = {719, 20000000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_30[34] = {}
tbl_30[35] = {767, 20000000}
tbl_30[36] = {813, 20000000}
tbl_30[37] = {812, 4}
tbl_30[38] = {677, 4}
tbl_30[39] = {710, 4}
tbl_30[40] = {681, 4}
tbl_30[41] = {709, 4}
tbl_30[42] = {707, 4}
tbl_30[43] = {706, 4}
tbl_30[44] = {711, 4}
tbl_30[45] = {715, 4}
tbl_30[46] = {705, 4}
tbl_30[47] = {663, 4}
tbl_30[48] = {664, 4}
;({})[1] = 666
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 4
tbl_30[49] = {665, 4}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_30[50] = {}
tbl_30[51] = {667, 4}
tbl_30[52] = {668, 4}
tbl_30[53] = {669, 4}
tbl_30[54] = {670, 4}
tbl_30[55] = {671, 4}
tbl_30[56] = {672, 4}
tbl_30[57] = {673, 4}
tbl_30[58] = {674, 4}
tbl_30[59] = {675, 4}
tbl_30[60] = {676, 4}
tbl_30[61] = {714, 4}
tbl_30[62] = {717, 4}
tbl_30[63] = {680, 4}
tbl_30[64] = {708, 4}
;({})[1] = 679
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 4
tbl_30[65] = {712, 4}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_30[66] = {}
tbl_30[67] = {678, 4}
tbl_30[68] = {704, 4}
tbl_30[69] = {741, 4}
tbl_30[70] = {766, 4}
tbl_30[71] = {789, 4}
tbl_30[72] = {835, 4}
tbl_30[73] = {713, 2}
tbl_30[74] = {716, 2}
tbl_30[75] = {718, 2}
tbl_30[76] = {743, 2}
tbl_30[77] = {836, 1}
tbl_179.Recipe = tbl_30
tbl_179.Boosts = {}
tbl_179.Rarity = 10
tbl_184[6] = tbl_179
tbl_185.Levels = tbl_184
tbl_146[11] = tbl_185
local tbl_13 = {
	Icon = "rbxassetid://139265289548191";
	RarityOffset = 4;
}
local tbl_177 = {}
local tbl_29 = {}
local tbl_208 = {}
;({})[1] = 260
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 10
tbl_208[1] = {249, 75000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_208[2] = {}
tbl_208[3] = {430, 10}
tbl_208[4] = {262, 2}
tbl_208[5] = {263, 2}
tbl_208[6] = {431, 2}
tbl_208[7] = {577, 600}
tbl_29.Recipe = tbl_208
tbl_29.Boosts = {{"JackhammerChance", 0.0015}}
tbl_177[1] = tbl_29
local tbl_176 = {}
local tbl_248 = {}
;({})[1] = 235
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 200000
tbl_248[1] = {249, 200000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_248[2] = {}
tbl_248[3] = {256, 2500}
tbl_248[4] = {257, 50}
tbl_248[5] = {431, 7}
tbl_248[6] = {432, 1}
tbl_248[7] = {248, 1}
tbl_176.Recipe = tbl_248
tbl_176.Boosts = {{"JackhammerChance", 0.0025}}
tbl_177[2] = tbl_176
local tbl_78 = {}
local tbl_174 = {}
;({})[1] = 249
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 500000
tbl_174[1] = {235, 700000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_174[2] = {}
tbl_174[3] = {429, 1}
tbl_174[4] = {434, 1}
tbl_174[5] = {432, 5}
tbl_174[6] = {264, 4}
tbl_174[7] = {427, 3}
tbl_174[8] = {261, 120}
tbl_174[9] = {259, 1000}
tbl_78.Recipe = tbl_174
tbl_78.Boosts = {{"JackhammerChance", 0.004}}
tbl_177[3] = tbl_78
local tbl_161 = {}
local tbl_72 = {}
;({})[1] = 235
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 2000000
tbl_72[1] = {249, 2000000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_72[2] = {}
tbl_72[3] = {673, 1}
tbl_72[4] = {672, 1}
tbl_72[5] = {422, 5}
tbl_72[6] = {423, 5}
tbl_72[7] = {429, 5}
tbl_72[8] = {428, 5}
tbl_72[9] = {421, 25}
tbl_72[10] = {420, 30}
tbl_72[11] = {244, 1000}
tbl_72[12] = {425, 1000}
tbl_72[13] = {231, 1000}
tbl_161.Recipe = tbl_72
tbl_161.Boosts = {{"JackhammerChance", 0.006}}
tbl_177[4] = tbl_161
tbl_13.Levels = tbl_177
tbl_146[12] = tbl_13
local tbl_171 = {
	Icon = "rbxassetid://84572932316877";
	RarityOffset = 5;
}
local tbl_170 = {}
local tbl_69 = {}
local tbl_77 = {}
;({})[1] = 581
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 2000
tbl_77[1] = {312, 300000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_77[2] = {}
tbl_77[3] = {317, 2000}
tbl_77[4] = {323, 50}
tbl_77[5] = {324, 50}
tbl_77[6] = {582, 50}
tbl_77[7] = {584, 2}
tbl_77[8] = {583, 9}
tbl_69.Recipe = tbl_77
tbl_69.Boosts = {{"ExplosionChance", 0.001}}
tbl_170[1] = tbl_69
local tbl_67 = {}
local tbl_173 = {}
;({})[1] = 313
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 100000
tbl_173[1] = {312, 1200000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_173[2] = {}
tbl_173[3] = {314, 100000}
tbl_173[4] = {322, 1500}
tbl_173[5] = {327, 4}
tbl_173[6] = {584, 4}
tbl_173[7] = {463, 1}
tbl_173[8] = {456, 1}
tbl_67.Recipe = tbl_173
tbl_67.Boosts = {{"ExplosionChance", 0.0025}}
tbl_170[2] = tbl_67
local tbl_22 = {}
local tbl_169 = {}
;({})[1] = 463
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 2
tbl_169[1] = {312, 4000000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_169[2] = {}
tbl_169[3] = {456, 2}
tbl_169[4] = {584, 12}
tbl_169[5] = {676, 1}
tbl_169[6] = {450, 6}
tbl_169[7] = {449, 6}
tbl_169[8] = {448, 30}
tbl_169[9] = {311, 30}
tbl_169[10] = {447, 200}
tbl_169[11] = {307, 1000}
tbl_169[12] = {582, 800}
tbl_22.Recipe = tbl_169
tbl_22.Boosts = {{"ExplosionChance", 0.004}}
tbl_170[3] = tbl_22
tbl_171.Levels = tbl_170
tbl_146[13] = tbl_171
local tbl_168 = {
	Icon = "rbxassetid://112477020539886";
	RarityOffset = 2;
}
local tbl_167 = {}
local tbl_255 = {}
local tbl_82 = {}
;({})[1] = 267
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 800
tbl_82[1] = {265, 12000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_82[2] = {}
tbl_82[3] = {266, 800}
tbl_82[4] = {273, 12}
tbl_82[5] = {274, 10}
tbl_82[6] = {436, 2}
tbl_82[7] = {276, 2}
tbl_255.Recipe = tbl_82
tbl_255.Boosts = {{"MiningRange", 1}}
tbl_167[1] = tbl_255
local tbl_81 = {}
local tbl_165 = {}
;({})[1] = 272
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 180
tbl_165[1] = {265, 25000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_165[2] = {}
tbl_165[3] = {271, 180}
tbl_165[4] = {275, 5}
tbl_165[5] = {278, 1}
tbl_81.Recipe = tbl_165
tbl_81.Boosts = {{"MiningRange", 2}}
tbl_167[2] = tbl_81
local tbl_17 = {}
local tbl_38 = {}
;({})[1] = 438
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_38[1] = {265, 150000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_38[2] = {}
tbl_17.Recipe = tbl_38
tbl_17.Boosts = {{"MiningRange", 4}}
tbl_167[3] = tbl_17
local tbl_164 = {}
local tbl_163 = {}
;({})[1] = 279
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 2
tbl_163[1] = {265, 500000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_163[2] = {}
tbl_163[3] = {277, 10}
tbl_163[4] = {437, 10}
tbl_164.Recipe = tbl_163
tbl_164.Boosts = {{"MiningRange", 6}}
tbl_167[4] = tbl_164
local tbl_43 = {}
local tbl_162 = {}
;({})[1] = 439
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_162[1] = {265, 1000000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_162[2] = {}
tbl_162[3] = {440, 1}
tbl_162[4] = {279, 5}
tbl_162[5] = {438, 5}
tbl_162[6] = {437, 20}
tbl_162[7] = {278, 20}
tbl_162[8] = {277, 20}
tbl_162[9] = {436, 150}
tbl_162[10] = {276, 150}
tbl_162[11] = {275, 150}
tbl_162[12] = {435, 1500}
tbl_162[13] = {274, 1500}
tbl_162[14] = {273, 1500}
tbl_162[15] = {578, 7500}
tbl_162[16] = {272, 7500}
;({})[1] = 270
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 7500
tbl_162[17] = {271, 7500}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_162[18] = {}
tbl_162[19] = {267, 75000}
tbl_162[20] = {266, 75000}
tbl_162[21] = {268, 75000}
tbl_162[22] = {269, 75000}
tbl_43.Recipe = tbl_162
tbl_43.Boosts = {{"MiningRange", 8}}
tbl_167[5] = tbl_43
local tbl_101 = {}
local tbl_46 = {}
;({})[1] = 439
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 3
tbl_46[1] = {674, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_46[2] = {}
tbl_46[3] = {440, 3}
tbl_46[4] = {445, 1}
tbl_46[5] = {444, 1}
tbl_46[6] = {433, 1}
tbl_46[7] = {434, 1}
tbl_46[8] = {279, 28}
tbl_46[9] = {438, 20}
tbl_46[10] = {276, 1000}
tbl_46[11] = {274, 9000}
tbl_46[12] = {435, 9000}
tbl_101.Recipe = tbl_46
tbl_101.Boosts = {{"MiningRange", 11}}
tbl_167[6] = tbl_101
tbl_168.Levels = tbl_167
tbl_146[14] = tbl_168
local tbl_160 = {
	Icon = "rbxassetid://84826930725382";
}
local tbl_159 = {}
local tbl_158 = {}
local tbl_157 = {}
;({})[1] = 477
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1000
tbl_157[1] = {476, 12000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_157[2] = {}
tbl_157[3] = {478, 800}
tbl_157[4] = {479, 900}
tbl_157[5] = {488, 2}
tbl_157[6] = {487, 3}
tbl_157[7] = {486, 1}
tbl_158.Recipe = tbl_157
tbl_158.Boosts = {{"Luck", 0.05}}
tbl_158.Rarity = 3
tbl_159[1] = tbl_158
local tbl_59 = {}
local tbl_156 = {}
;({})[1] = 481
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 800
tbl_156[1] = {595, 15000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_156[2] = {}
tbl_156[3] = {480, 1500}
tbl_156[4] = {484, 100}
tbl_156[5] = {485, 150}
tbl_156[6] = {489, 5}
tbl_156[7] = {491, 5}
tbl_156[8] = {490, 6}
tbl_156[9] = {493, 1}
tbl_59.Recipe = tbl_156
tbl_59.Boosts = {{"Luck", 0.1}}
tbl_59.Rarity = 5
tbl_159[2] = tbl_59
local tbl_8 = {}
local tbl_244 = {}
;({})[1] = 596
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 6000
tbl_244[1] = {482, 9000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_244[2] = {}
tbl_244[3] = {494, 11}
tbl_244[4] = {493, 9}
tbl_244[5] = {492, 11}
tbl_244[6] = {483, 2000}
tbl_244[7] = {476, 1200000}
tbl_8.Recipe = tbl_244
tbl_8.Boosts = {{"Luck", 0.15}}
tbl_8.Rarity = 7
tbl_159[3] = tbl_8
local tbl_155 = {}
local tbl_154 = {}
;({})[1] = 677
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 6
tbl_154[1] = {713, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_154[2] = {}
tbl_154[3] = {496, 40}
tbl_154[4] = {495, 47}
tbl_154[5] = {492, 200}
tbl_154[6] = {493, 200}
tbl_154[7] = {494, 200}
tbl_154[8] = {476, 70000000}
tbl_154[9] = {595, 4000000}
tbl_154[10] = {486, 10000}
tbl_155.Recipe = tbl_154
tbl_155.Boosts = {{"Luck", 0.35}}
tbl_155.Rarity = 9
tbl_159[4] = tbl_155
tbl_160.Levels = tbl_159
tbl_146[15] = tbl_160
local tbl_153 = {
	Icon = "rbxassetid://136545733160941";
	Unlock = function(arg1) -- Line 3637
		local var2520
		if arg1.Accessories.Levels[18].Value >= 1 then
			var2520 = false
		else
			var2520 = true
		end
		return var2520
	end;
	UpdateIds = {"Accessories.Levels.18"};
}
local tbl_151 = {}
local tbl_90 = {}
local tbl_150 = {}
;({})[1] = 466
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_150[1] = {458, 2}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_150[2] = {}
tbl_150[3] = {393, 8}
tbl_150[4] = {502, 5}
tbl_150[5] = {379, 3000000}
tbl_150[6] = {387, 2000}
tbl_150[7] = {499, 1500}
tbl_90.Recipe = tbl_150
tbl_90.Boosts = {{"ExplosiveCooldownReduction", 0.25}}
tbl_90.Rarity = 7
tbl_151[1] = tbl_90
tbl_153.Levels = tbl_151
tbl_146[16] = tbl_153
local tbl_149 = {
	Icon = "rbxassetid://80236584334474";
	Unlock = function(arg1) -- Line 3661
		local var2535
		if arg1.Accessories.Levels[18].Value >= 1 then
			var2535 = false
		else
			var2535 = true
		end
		return var2535
	end;
	UpdateIds = {"Accessories.Levels.18"};
}
local tbl_118 = {}
local tbl_147 = {}
local tbl_76 = {}
;({})[1] = 469
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 2
tbl_76[1] = {458, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_76[2] = {}
tbl_76[3] = {523, 6}
tbl_76[4] = {379, 800000}
tbl_76[5] = {380, 40000}
tbl_76[6] = {381, 40000}
tbl_76[7] = {382, 33333}
tbl_76[8] = {383, 33333}
tbl_147.Recipe = tbl_76
tbl_147.Boosts = {{"ExplosiveRadius", 0.1}}
tbl_147.Rarity = 6
tbl_118[1] = tbl_147
local tbl_230 = {}
local tbl_145 = {}
;({})[1] = 162
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 40
tbl_145[1] = {163, 40}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_145[2] = {}
tbl_145[3] = {522, 50}
tbl_145[4] = {454, 2}
tbl_145[5] = {464, 1}
tbl_145[6] = {710, 1}
tbl_145[7] = {391, 50}
tbl_145[8] = {392, 60}
tbl_145[9] = {501, 70}
tbl_230.Recipe = tbl_145
tbl_230.Boosts = {{"ExplosiveRadius", 0.15}}
tbl_230.Rarity = 7
tbl_118[2] = tbl_230
tbl_149.Levels = tbl_118
tbl_146[17] = tbl_149
local tbl_144 = {
	Icon = "rbxassetid://117286949921587";
	Unlock = function(arg1) -- Line 3703
		local var2563 = false
		if 1 <= arg1.Accessories.Levels[16].Value then
			if 2 > arg1.Accessories.Levels[17].Value then
				var2563 = false
			else
				var2563 = true
			end
		end
		return var2563
	end;
	UpdateIds = {"Accessories.Levels.16", "Accessories.Levels.17"};
}
local tbl_7 = {}
local tbl_228 = {}
local tbl_142 = {}
;({})[1] = 709
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_142[1] = {710, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_142[2] = {}
tbl_142[3] = {707, 1}
tbl_142[4] = {706, 1}
tbl_228.Recipe = tbl_142
local tbl_141 = {}
;({})[1] = "ExplosiveRadius"
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 0.2
tbl_141[1] = {"ExplosiveCooldownReduction", 0.33}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_141[2] = {}
tbl_228.Boosts = tbl_141
tbl_228.Rarity = 8
tbl_7[1] = tbl_228
tbl_144.Levels = tbl_7
tbl_146[18] = tbl_144
local tbl_139 = {
	Icon = "rbxassetid://88311869844764";
}
local tbl_100 = {}
local tbl_125 = {}
local tbl_138 = {}
;({})[1] = 642
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 30000
tbl_138[1] = {641, 500000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_138[2] = {}
tbl_138[3] = {650, 300}
tbl_138[4] = {651, 300}
tbl_138[5] = {658, 5}
tbl_138[6] = {659, 2}
tbl_125.Recipe = tbl_138
tbl_125.Boosts = {{"PrestigeTokens", 0.25}}
tbl_125.Rarity = 6
tbl_100[1] = tbl_125
local tbl_135 = {}
local tbl_226 = {}
;({})[1] = 643
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 100000
tbl_226[1] = {641, 1500000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_226[2] = {}
tbl_226[3] = {644, 98765}
tbl_226[4] = {646, 10000}
tbl_226[5] = {657, 40}
tbl_226[6] = {656, 30}
tbl_226[7] = {660, 5}
tbl_226[8] = {659, 2}
tbl_226[9] = {662, 1}
tbl_135.Recipe = tbl_226
tbl_135.Boosts = {{"PrestigeTokens", 0.5}}
tbl_135.Rarity = 7
tbl_100[2] = tbl_135
local tbl_133 = {}
local tbl_127 = {}
;({})[1] = 645
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 700000
tbl_127[1] = {641, 8000000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_127[2] = {}
tbl_127[3] = {648, 60000}
tbl_127[4] = {647, 55000}
tbl_127[5] = {649, 70000}
tbl_127[6] = {652, 5000}
tbl_127[7] = {653, 750}
tbl_127[8] = {654, 700}
tbl_127[9] = {658, 200}
tbl_127[10] = {656, 150}
tbl_127[11] = {659, 20}
tbl_127[12] = {660, 35}
tbl_127[13] = {661, 6}
tbl_127[14] = {662, 5}
tbl_127[15] = {678, 2}
tbl_133.Recipe = tbl_127
tbl_133.Boosts = {{"PrestigeTokens", 1}}
tbl_133.Rarity = 8
tbl_100[3] = tbl_133
local tbl_132 = {}
local tbl_131 = {}
;({})[1] = 716
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_131[1] = {641, 65000000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_131[2] = {}
tbl_131[3] = {661, 30}
tbl_131[4] = {662, 30}
tbl_131[5] = {640, 20}
tbl_131[6] = {639, 25}
tbl_131[7] = {703, 45}
tbl_131[8] = {702, 20}
tbl_131[9] = {704, 1}
tbl_131[10] = {741, 1}
tbl_131[11] = {740, 5}
tbl_132.Recipe = tbl_131
tbl_132.Boosts = {{"PrestigeTokens", 2}}
tbl_132.Rarity = 9
tbl_100[4] = tbl_132
tbl_139.Levels = tbl_100
tbl_146[19] = tbl_139
local tbl_239 = {
	Icon = "rbxassetid://94123841507883";
}
local tbl_130 = {}
local tbl_128 = {}
local tbl_219 = {}
;({})[1] = 679
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_219[1] = {741, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_219[2] = {}
tbl_219[3] = {638, 30}
tbl_219[4] = {637, 30}
tbl_219[5] = {636, 200}
tbl_219[6] = {635, 250}
tbl_219[7] = {739, 10}
tbl_219[8] = {719, 6000000}
tbl_219[9] = {619, 2000000}
tbl_219[10] = {734, 300}
tbl_128.Recipe = tbl_219
tbl_128.Boosts = {}
tbl_128.Rarity = 8
tbl_130[1] = tbl_128
tbl_239.Levels = tbl_130
tbl_146[20] = tbl_239
local tbl_15 = {
	Icon = "rbxassetid://13253128349";
}
local tbl_50 = {}
local tbl_129 = {}
local tbl_74 = {}
;({})[1] = 825
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 175
tbl_74[1] = {813, 1500000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_74[2] = {}
tbl_74[3] = {827, 150}
tbl_74[4] = {826, 125}
tbl_74[5] = {831, 5}
tbl_74[6] = {832, 5}
tbl_74[7] = {833, 1}
tbl_74[8] = {818, 7000}
tbl_74[9] = {819, 5000}
tbl_74[10] = {820, 10000}
tbl_74[11] = {821, 8000}
tbl_129.Recipe = tbl_74
local tbl_253 = {}
;({})[1] = "LocalMagicPower"
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_253[1] = {"BackpackSpace", 0.2}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_253[2] = {}
tbl_129.Boosts = tbl_253
tbl_129.Rarity = 7
tbl_50[1] = tbl_129
local tbl_51 = {}
local tbl_39 = {}
;({})[1] = 815
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 350000
tbl_39[1] = {814, 400000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_39[2] = {}
tbl_39[3] = {816, 450000}
tbl_39[4] = {817, 425000}
tbl_39[5] = {822, 10000}
tbl_39[6] = {823, 8000}
tbl_39[7] = {824, 9000}
tbl_39[8] = {829, 200}
tbl_39[9] = {828, 150}
tbl_39[10] = {830, 250}
tbl_39[11] = {833, 6}
tbl_39[12] = {834, 6}
tbl_39[13] = {835, 2}
tbl_51.Recipe = tbl_39
local tbl_202 = {}
;({})[1] = "LocalMagicPower"
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_202[1] = {"BackpackSpace", 0.4}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_202[2] = {}
tbl_51.Boosts = tbl_202
tbl_51.Rarity = 8
tbl_50[2] = tbl_51
tbl_15.Levels = tbl_50
tbl_146[21] = tbl_15
local tbl_126 = {
	Icon = "rbxassetid://82371718868695";
	Unlock = function(arg1) -- Line 3871
		local var2675
		if arg1.Accessories.Levels[23].Value >= 1 then
			var2675 = false
		else
			var2675 = true
		end
		return var2675
	end;
	UpdateIds = {"Accessories.Levels.23"};
}
local tbl_242 = {}
local tbl_123 = {}
local tbl_85 = {}
;({})[1] = 766
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_85[1] = {789, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_85[2] = {}
tbl_85[3] = {788, 6}
tbl_85[4] = {787, 6}
tbl_85[5] = {765, 4}
tbl_85[6] = {764, 4}
tbl_85[7] = {763, 30}
tbl_85[8] = {786, 30}
tbl_85[9] = {785, 15}
tbl_85[10] = {762, 15}
tbl_85[11] = {744, 5000000}
tbl_85[12] = {767, 5000000}
tbl_85[13] = {784, 200}
tbl_85[14] = {761, 300}
tbl_85[15] = {755, 10000}
tbl_85[16] = {778, 8000}
;({})[1] = 746
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 456789
tbl_85[17] = {768, 500000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_85[18] = {}
tbl_123.Recipe = tbl_85
tbl_123.Boosts = {}
tbl_123.Rarity = 8
tbl_242[1] = tbl_123
tbl_126.Levels = tbl_242
tbl_146[22] = tbl_126
local tbl_114 = {
	Icon = "rbxassetid://82371718868695";
	Unlock = function(arg1) -- Line 3904
		local var2700 = false
		if 4 <= arg1.Accessories.Levels[2].Value then
			var2700 = false
			if 1 <= arg1.Accessories.Levels[8].Value then
				var2700 = false
				if 4 <= arg1.Accessories.Levels[9].Value then
					if 1 > arg1.Accessories.Levels[22].Value then
						var2700 = false
					else
						var2700 = true
					end
				end
			end
		end
		return var2700
	end;
	UpdateIds = {"Accessories.Levels.2", "Accessories.Levels.8", "Accessories.Levels.9", "Accessories.Levels.22"};
}
local tbl_119 = {}
local tbl_148 = {}
local tbl_41 = {}
;({})[1] = 711
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 5
tbl_41[1] = {743, 3}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_41[2] = {}
tbl_41[3] = {715, 5}
tbl_41[4] = {705, 5}
tbl_41[5] = {663, 5}
tbl_41[6] = {461, 50}
tbl_41[7] = {396, 50}
tbl_41[8] = {4, 5000000}
tbl_41[9] = {540, 5000000}
tbl_41[10] = {42, 4000}
tbl_41[11] = {41, 3000}
tbl_41[12] = {132, 4000}
tbl_41[13] = {133, 2000}
tbl_41[14] = {812, 5}
tbl_41[15] = {811, 30}
tbl_41[16] = {810, 40}
;({})[1] = 549
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 400
tbl_41[17] = {398, 50}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_41[18] = {}
tbl_41[19] = {675, 5}
tbl_41[20] = {717, 5}
tbl_41[21] = {714, 5}
tbl_41[22] = {296, 50000000}
tbl_41[23] = {451, 50}
tbl_41[24] = {460, 30}
tbl_148.Recipe = tbl_41
local tbl_98 = {}
;({})[1] = "Boost_LegendaryExplosion"
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
tbl_98[1] = {"RareExplosion", 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_98[2] = {}
tbl_148.Boosts = tbl_98
tbl_148.Rarity = 9
tbl_119[1] = tbl_148
tbl_114.Levels = tbl_119
tbl_146[23] = tbl_114
local tbl_60 = {
	Icon = "rbxassetid://119379897676977";
}
local tbl_79 = {}
local tbl_42 = {}
local tbl_116 = {}
;({})[1] = 281
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1500
tbl_116[1] = {280, 30000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_116[2] = {}
tbl_116[3] = {282, 2000}
tbl_116[4] = {283, 1000}
tbl_116[5] = {284, 1234}
tbl_116[6] = {285, 100}
tbl_116[7] = {286, 150}
tbl_116[8] = {287, 200}
tbl_116[9] = {288, 20}
tbl_116[10] = {291, 2}
tbl_116[11] = {292, 3}
tbl_116[12] = {441, 4}
tbl_116[13] = {442, 1}
tbl_42.Recipe = tbl_116
tbl_42.Boosts = {{"LocalMagicPower", 2}}
tbl_42.Rarity = 4
tbl_79[1] = tbl_42
local tbl_87 = {}
local tbl_62 = {}
;({})[1] = 289
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 75
tbl_62[1] = {280, 100000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_62[2] = {}
tbl_62[3] = {290, 50}
tbl_62[4] = {294, 2}
tbl_62[5] = {293, 2}
tbl_87.Recipe = tbl_62
tbl_87.Boosts = {{"LocalMagicPower", 2.5}}
tbl_87.Rarity = 5
tbl_79[2] = tbl_87
local tbl_115 = {}
local tbl_83 = {}
;({})[1] = 297
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 25000
tbl_83[1] = {296, 300000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_83[2] = {}
tbl_83[3] = {299, 30000}
tbl_83[4] = {304, 500}
tbl_83[5] = {305, 500}
tbl_83[6] = {443, 2}
tbl_83[7] = {295, 2}
tbl_115.Recipe = tbl_83
tbl_115.Boosts = {{"LocalMagicPower", 3}}
tbl_115.Rarity = 6
tbl_79[3] = tbl_115
local tbl_24 = {}
local tbl_18 = {}
;({})[1] = 588
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 5
tbl_18[1] = {343, 5}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_18[2] = {}
tbl_18[3] = {327, 1}
tbl_18[4] = {584, 1}
tbl_18[5] = {311, 1}
tbl_18[6] = {448, 1}
tbl_18[7] = {295, 1}
tbl_18[8] = {443, 1}
tbl_18[9] = {280, 500000}
tbl_18[10] = {296, 500000}
tbl_18[11] = {312, 500000}
tbl_18[12] = {328, 500000}
tbl_18[13] = {334, 8000}
tbl_18[14] = {335, 9000}
tbl_18[15] = {336, 1000}
tbl_18[16] = {341, 30}
;({})[1] = 587
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 15
tbl_18[17] = {342, 20}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_18[18] = {}
tbl_18[19] = {326, 10}
tbl_18[20] = {451, 1}
tbl_18[21] = {460, 1}
tbl_18[22] = {472, 1}
tbl_24.Recipe = tbl_18
tbl_24.Boosts = {{"LocalMagicPower", 3.5}}
tbl_24.Rarity = 7
tbl_79[4] = tbl_24
local tbl_99 = {}
local tbl_113 = {}
;({})[1] = 717
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1
local tbl_111 = {586, 1000}
tbl_113[1] = {680, 1}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_113[2] = {}
tbl_113[3] = {714, 1}
tbl_113[4] = {675, 1}
tbl_113[5] = {302, 50000}
tbl_113[6] = {301, 30000}
tbl_113[7] = {303, 60000}
tbl_113[8] = {306, 5000}
tbl_113[9] = {305, 3000}
tbl_113[10] = {320, 4000}
tbl_113[11] = {339, 500}
tbl_113[12] = tbl_111
tbl_113[13] = {340, 750}
tbl_113[14] = {355, 1000}
tbl_113[15] = {360, 30}
tbl_113[16] = {359, 30}
;({})[1] = 344
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
;({})[2] = 1000000
tbl_113[17] = {345, 500000}
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
tbl_113[18] = {}
tbl_113[19] = {328, 1000000}
tbl_113[20] = {330, 500000}
tbl_113[21] = {332, 500000}
tbl_99.Recipe = tbl_113
tbl_99.Boosts = {{"LocalMagicPower", 4}}
tbl_99.Rarity = 8
tbl_79[5] = tbl_99
tbl_60.Levels = tbl_79
tbl_146[24] = tbl_60
module_7_upvr.Accessories = tbl_146
local tbl_110 = {}
module_7_upvr.AccessoryBoostMap = tbl_110
local tbl_109 = {}
local tbl_178_upvr = {}
for _, v_7 in module_7_upvr.Layers do
	tbl_109[v_7[2]] = v_7[2]
	local tbl_108 = {}
	;({})[v_7[2]] = tbl_108
	table.insert(tbl_108, v_7[2])
	if v_7[3] ~= nil then
		for i_11, v_8 in v_7[3] do
			tbl_111 = 10 ^ (i_11 - 1) * #v_8
			local var2816 = tbl_111
			for _, v_9 in v_8 do
				({})[v_9] = {v_7[2], i_11, var2816}
				tbl_109[v_9] = v_7[2]
				tbl_178_upvr[v_9] = i_11
				table.insert(tbl_108, v_9)
				local var2818
			end
		end
	end
end
for i_13, v_10 in module_7_upvr.SecretOres do
	tbl_108 = i_13 + 8
	local var2819 = 10 ^ (tbl_108 - 1) * #v_10
	for _, v_11 in v_10 do
		var2818[v_11] = {0, tbl_108, var2819}
		tbl_178_upvr[v_11] = tbl_108
		local var2821
	end
end
module_7_upvr.OreInfo = var2821
module_7_upvr.LayerMap = tbl_109
module_7_upvr.RarityMap = tbl_178_upvr
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
module_7_upvr.BlocksInLayer = {}
for i_15, v_12 in module_7_upvr.Accessories do
	tbl_108 = {}
	for _, v_13 in v_12.Levels do
		v_11 = {}
		for _, v_14 in v_13.Boosts do
			v_11[v_14[1]] = v_14[2]
			tbl_108[v_14[1]] = true
		end
		v_13.BoostsMap = v_11
		table.sort(v_13.Recipe, function(arg1, arg2) -- Line 4107
			--[[ Upvalues[2]:
				[1]: tbl_178_upvr (readonly)
				[2]: module_7_upvr (readonly)
			]]
			local var2823 = tbl_178_upvr[arg1[1]] or 0
			local var2824 = tbl_178_upvr[arg2[1]]
			local var2825 = var2824 or 0
			if var2823 == var2825 then
				if module_7_upvr.Blocks[arg1[1]][2] >= module_7_upvr.Blocks[arg2[1]][2] then
					var2824 = false
				else
					var2824 = true
				end
				return var2824
			end
			if var2823 >= var2825 then
				var2824 = false
			else
				var2824 = true
			end
			return var2824
		end)
	end
	for i_18, _ in tbl_108 do
		v_11 = tbl_110[i_18]
		if not v_11 then
			v_11 = {}
			tbl_110[i_18] = v_11
		end
		table.insert(v_11, i_15)
	end
end
while module_7_upvr.Blocks[1] do
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
end
module_7_upvr.BlockCount = 1 + 1 - 1
module_7_upvr.UnlockTradingCost = 5000000000000
return module_7_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Short
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:46
-- Luau version 6, Types version 3
-- Time taken: 0.010633 seconds

local module = {}
local Translator_upvr = require(game.ReplicatedStorage.Modules.Translator)
local TranslatorSettings_upvw = Translator_upvr.GetModule().TranslatorSettings
function addComas(arg1) -- Line 6
	--[[ Upvalues[1]:
		[1]: TranslatorSettings_upvw (read and write)
	]]
	local Seperator = TranslatorSettings_upvw.Seperator
	local var5
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var5 = arg1:reverse():gsub("(%d%d%d)", "%1"..Seperator):reverse():sub(2)
		return var5
	end
	if #arg1 % 3 ~= 0 or not INLINED() then
		var5 = arg1:reverse():gsub("(%d%d%d)", "%1"..Seperator):reverse()
	end
	return var5
end
local tbl_upvr = {'M', 'B', 'T', "Qd", "Qn", "Sx", "Sp", "Oc", "No", "De", "UDe", "DDe", "TDe", "QdDe", "QnDe", "SxDe", "SpDe", "OcDe", "NoDe", "Vt", "UVt", "DVt", "TVt", "QdVt", "QnVt", "SxVt", "SpVt", "OcVt", "NoVt", "Tg", "UTg", "DTg", "TTg", "QdTg", "QnTg", "SxTg", "SpTg", "OcTg", "NoTg", "qg", "Uqg", "Dqg", "Tqg", "Qdqg", "Qnqg", "Sxqg", "Spqg", "Ocqg", "Noqg", "Qg", "UQg", "DQg", "TQg", "QdQg", "QnQg", "SxQg", "SpQg", "OcQg", "NoQg", "sg", "Usg", "Dsg", "Tsg", "Qdsg", "Qnsg", "Sxsg", "Spsg", "Ocsg", "Nosg", "Sg", "USg", "DSg", "TSg", "QdSg", "QnSg", "SxSg", "SpSg", "OcSg", "NoSg", "Og", "UOg", "DOg", "TOg", "QdOg", "QnOg", "SxOg", "SpOg", "OcOg", "NoOg", "Ng", "UNg", "DNg", "TNg", "QdNg", "QnNg", "SxNg", "SpNg", "OcNg", "NoNg", "Ce", "UCe"}
local any_GetLanguage_result1_2_upvw = Translator_upvr.GetLanguage()
function module.en(arg1, arg2, arg3) -- Line 24
	--[[ Upvalues[4]:
		[1]: Translator_upvr (readonly)
		[2]: any_GetLanguage_result1_2_upvw (read and write)
		[3]: TranslatorSettings_upvw (read and write)
		[4]: tbl_upvr (readonly)
	]]
	local any_GetLanguage_result1 = Translator_upvr.GetLanguage()
	local var9
	if any_GetLanguage_result1_2_upvw ~= any_GetLanguage_result1 then
		any_GetLanguage_result1_2_upvw = any_GetLanguage_result1
		TranslatorSettings_upvw = Translator_upvr.GetModule().TranslatorSettings
	end
	local var10 = false
	if var9 < 0 then
		var10 = true
		var9 = -var9
		local var11
	end
	if var9 == math.huge then
		if var10 then
			var11 = '-'
		else
			var11 = ""
		end
		return var11.."Infinity"
	end
	if var9 ~= var9 then
		return "NaN"
	end
	local var12
	local var13
	if var9 < 1000 then
		if arg2 == nil then
			var11 = var9
			local rounded_2 = math.round(var11)
			if rounded_2 == 0 then
				var11 = '0'
				return var11
			end
			if var10 then
				var13 = '-'
			else
				var13 = ""
			end
			var12 = rounded_2
			var11 = var13..var12
			return var11
		end
		var11 = 10
		local var15 = var11 ^ arg2
		var12 = var9 * var15
		var11 = math.round(var12) / var15
		if var11 == 0 then
			return '0'
		end
		if var10 then
			var12 = '-'
		else
			var12 = ""
		end
		return var12..var11
	end
	if var9 < 1000000 or arg3 and var9 < 10000000000000000 then
		if var10 then
			var11 = '-'
		else
			var11 = ""
		end
		var12 = tostring(math.round(var9))
		return var11..addComas(var12)
	end
	local floored_2 = math.floor(math.log10(var9))
	local var17 = math.round(var9 / 10 ^ (floored_2 - 3)) / 10 ^ (3 - floored_2 % 3)
	if 1000 <= var17 then
		var17 /= 1000
		floored_2 += 3
	end
	local var18 = tbl_upvr
	if var10 then
		var18 = '-'
	else
		var18 = ""
	end
	return var18..var17..' '..(var18[math.floor(floored_2 / 3) - 1] or "")
end
function module.en2(arg1) -- Line 69
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local var19 = false
	local var20
	if var20 < 0 then
		var19 = true
		var20 = -var20
		local var21
	end
	if var20 == math.huge then
		if var19 then
			var21 = '-'
		else
			var21 = ""
		end
		return var21.."Infinity"
	end
	if var20 ~= var20 then
		return "NaN"
	end
	local var22
	if var20 < 1000 then
		var21 = var20
		local rounded = math.round(var21)
		if rounded == 0 then
			var21 = '0'
			return var21
		end
		if var19 then
			var22 = '-'
		else
			var22 = ""
		end
		var21 = var22..rounded
		return var21
	end
	if var20 < 1000000 then
		if var19 then
			var21 = '-'
		else
			var21 = ""
		end
		var22 = addComas(tostring(math.round(var20)))
		return var21..var22
	end
	local floored = math.floor(math.log10(var20))
	local clamped = math.clamp(6 - #(tbl_upvr[math.floor(floored / 3) - 1] or ""), 0, 3)
	local var26 = math.round(var20 / 10 ^ (floored - clamped)) / 10 ^ (clamped - floored % 3)
	if 1000 <= var26 then
		var26 /= 1000
		floored += 3
	end
	local var27 = tbl_upvr
	if var19 then
		var27 = '-'
	else
		var27 = ""
	end
	return var27..var26..' '..(var27[math.floor(floored / 3) - 1] or "")
end
return module


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.BlockHandler
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:47
-- Luau version 6, Types version 3
-- Time taken: 0.001278 seconds

-- KONSTANTERROR: [0] 1. Error Block 25 start (CF ANALYSIS FAILED)
local GameDefinition = require(game.ReplicatedStorage.Modules.GameDefinition)
local tbl = {}
for _, v in GameDefinition.Layers do
	tbl[v[2]] = true
end
tbl[2046] = true
tbl[2047] = true
;({}).MergeAllowed = tbl
-- KONSTANTERROR: [0] 1. Error Block 25 end (CF ANALYSIS FAILED)
-- KONSTANTERROR: [48] 36. Error Block 6 start (CF ANALYSIS FAILED)
-- KONSTANTERROR: [48] 36. Error Block 6 end (CF ANALYSIS FAILED)
-- KONSTANTERROR: [43] 32. Error Block 4 start (CF ANALYSIS FAILED)
-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [48.11]
-- KONSTANTERROR: [43] 32. Error Block 4 end (CF ANALYSIS FAILED)


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.DateTimeExtended
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:48
-- Luau version 6, Types version 3
-- Time taken: 0.020208 seconds

local module_upvr = {}
local tbl_5_upvr = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
local tbl_6_upvr = {}
local tbl_4_upvr = {}
local tbl_3_upvr = {}
local var10 = 1
local var11 = 1
for i = 1, 365 do
	table.insert({}, {var10, var11})
	local var13 = tbl_4_upvr[var10]
	if var13 == nil then
		var13 = {}
		tbl_4_upvr[var10] = var13
	end
	var13[var11] = 86400 * i - 86400
	if tbl_5_upvr[var10] <= var11 then
	else
	end
end
local var14 = 1
local var15 = 1
tbl_5_upvr[2] = 29
for i_2 = 1, 366 do
	table.insert(tbl_6_upvr, {var14, var15})
	local var17 = tbl_3_upvr[var14]
	if var17 == nil then
		var17 = {}
		tbl_3_upvr[var14] = var17
	end
	var17[var15] = 86400 * i_2 - 86400
	if tbl_5_upvr[var14] <= var15 then
	else
	end
end
local function getyearinfo_upvr(arg1) -- Line 45, Named "getyearinfo"
	local floored = math.floor(arg1 / 86400)
	local floored_2 = math.floor((floored - 10957) / 146097)
	local floored_4 = math.floor((floored - floored_2 - 11323) / 36524)
	local var21 = floored + floored_4 - floored_2
	local var22 = 0 + floored_2 - floored_4 + math.floor((var21 + 365) / 1461)
	local var23
	if var21 % 1461 == 1095 then
		var23 += 1
	end
	if floored % 146097 == 10957 then
		var23 -= 1
	end
	return math.floor((floored - var22 - var23) / 365), var22
end
local module_2_upvr = {}
local tbl_2_upvr = {}
local function ConvertNumber_upvr(arg1) -- Line 61, Named "ConvertNumber"
	--[[ Upvalues[4]:
		[1]: getyearinfo_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
		[3]: tbl_2_upvr (readonly)
		[4]: module_2_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local getyearinfo_result1, getyearinfo_upvr_result2 = getyearinfo_upvr(arg1)
	local var28 = 1970 + getyearinfo_result1
	local floored_3 = math.floor((arg1 - getyearinfo_result1 * 31536000 - getyearinfo_upvr_result2 * 86400) / 86400)
	if var28 % 400 == 0 then
		floored_3 = tbl_6_upvr[floored_3 + 1 + 1]
	elseif var28 % 4 == 0 and var28 % 100 ~= 0 then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		floored_3 = tbl_6_upvr[floored_3 + 1]
	else
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		floored_3 = tbl_2_upvr[floored_3 + 1]
	end
	local module_3 = {}
	module_3.Tick = arg1
	module_3.UnixTimestamp = math.floor(arg1)
	module_3.UnixTimestampMillis = math.floor(arg1 * 1000)
	module_3.UnixTimestampMicros = math.round(arg1 * 1000000)
	local tbl_7 = {
		Year = var28;
	}
	if floored_3 then
	else
	end
	tbl_7.Month = 1
	if floored_3 then
	else
	end
	tbl_7.Day = 1
	tbl_7.Hour = math.floor(arg1 / 3600) % 24
	tbl_7.Minute = math.floor(arg1 / 60) % 60
	tbl_7.Second = math.floor(arg1) % 60
	tbl_7.Millisecond = math.floor(arg1 * 1000) % 1000
	tbl_7.Microsecond = math.round(arg1 * 1000000) % 1000
	module_3._dateobj = tbl_7
	return setmetatable(module_3, module_2_upvr)
end
local function ToIsoDate(arg1) -- Line 85
	local var32 = string.format("%.4d", arg1.Year)..'-'..string.format("%.2d", arg1.Month)..'-'..string.format("%.2d", arg1.Day)..'T'..string.format("%.2d", arg1.Hour)..':'..string.format("%.2d", arg1.Minute)..':'..string.format("%.2d", arg1.Second)
	local var33 = (arg1.Millisecond * 1000 + arg1.Microsecond) / 1000000
	if 0 < var33 then
		var32 = var32..string.sub(var33, 2)
	end
	return var32..'Z'
end
module_2_upvr.__index = module_2_upvr
function module_2_upvr.__tostring(arg1) -- Line 97
	--[[ Upvalues[1]:
		[1]: ToIsoDate (readonly)
	]]
	return ToIsoDate(arg1._dateobj)
end
function module_2_upvr.__add(arg1, arg2) -- Line 100
	--[[ Upvalues[1]:
		[1]: ConvertNumber_upvr (readonly)
	]]
	if type(arg2) == "number" then
		return ConvertNumber_upvr(arg1.Tick + arg2)
	end
	return ConvertNumber_upvr(arg2.Tick + arg1)
end
function module_2_upvr.__sub(arg1, arg2) -- Line 106
	--[[ Upvalues[1]:
		[1]: ConvertNumber_upvr (readonly)
	]]
	if type(arg2) == "number" then
		return ConvertNumber_upvr(arg1.Tick - arg2)
	end
	return ConvertNumber_upvr(arg2.Tick - arg1)
end
function module_2_upvr.__lt(arg1, arg2) -- Line 112
	local var38
	if arg1.UnixTimestampMicros >= arg2.UnixTimestampMicros then
		var38 = false
	else
		var38 = true
	end
	return var38
end
function module_2_upvr.__le(arg1, arg2) -- Line 115
	local var40
	if arg1.UnixTimestampMicros > arg2.UnixTimestampMicros then
		var40 = false
	else
		var40 = true
	end
	return var40
end
function module_2_upvr.__eq(arg1, arg2) -- Line 118
	local var42
	if arg1.UnixTimestampMicros ~= arg2.UnixTimestampMicros then
		var42 = false
	else
		var42 = true
	end
	return var42
end
function module_2_upvr.ToIsoDate(arg1) -- Line 122
	--[[ Upvalues[1]:
		[1]: ToIsoDate (readonly)
	]]
	return ToIsoDate(arg1._dateobj)
end
function module_2_upvr.ToUniversalTime(arg1) -- Line 123
	return arg1._dateobj
end
function module_2_upvr.ToLocalTime(arg1) -- Line 124
	--[[ Upvalues[1]:
		[1]: ConvertNumber_upvr (readonly)
	]]
	local os_date_result1 = os.date("%z", arg1.Tick)
	if not os_date_result1 then
		os_date_result1 = os.date("%z", 0)
	end
	return ConvertNumber_upvr(arg1.Tick + tonumber(string.sub(os_date_result1, 1, 3)) * 3600 + tonumber(string.sub(os_date_result1, 4)) * 60)._dateobj
end
function module_upvr.fromTick(arg1) -- Line 130
	--[[ Upvalues[1]:
		[1]: ConvertNumber_upvr (readonly)
	]]
	return ConvertNumber_upvr(math.round(arg1 * 1000000) / 1000000)
end
function module_upvr.fromUnixTimestamp(arg1) -- Line 133
	--[[ Upvalues[1]:
		[1]: ConvertNumber_upvr (readonly)
	]]
	return ConvertNumber_upvr(math.floor(arg1))
end
function module_upvr.fromUnixTimestampMillis(arg1) -- Line 136
	--[[ Upvalues[1]:
		[1]: ConvertNumber_upvr (readonly)
	]]
	return ConvertNumber_upvr(math.floor(arg1) / 1000)
end
function module_upvr.fromUnixTimestampMicros(arg1) -- Line 139
	--[[ Upvalues[1]:
		[1]: ConvertNumber_upvr (readonly)
	]]
	return ConvertNumber_upvr(math.floor(arg1) / 1000000)
end
function module_upvr.now() -- Line 142
	--[[ Upvalues[1]:
		[1]: ConvertNumber_upvr (readonly)
	]]
	return ConvertNumber_upvr(workspace:GetServerTimeNow())
end
function module_upvr.fromIsoDate(arg1) -- Line 145
	--[[ Upvalues[5]:
		[1]: module_upvr (readonly)
		[2]: tbl_5_upvr (readonly)
		[3]: tbl_3_upvr (readonly)
		[4]: tbl_4_upvr (readonly)
		[5]: module_2_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var50
	if type(arg1) ~= "string" then
		return module_upvr.now()
	end
	var50 = '-'
	local string_find_result1 = string.find(arg1, var50, 2)
	if not string_find_result1 then
		string_find_result1 = #arg1 + 1
	end
	var50 = tonumber(string.sub(arg1, 1, string_find_result1 - 1))
	local var52 = var50 or 1970
	var50 = tonumber(string.sub(arg1, string_find_result1 + 1, string_find_result1 + 2))
	if var50 == nil or var50 ~= var50 or var50 % 1 ~= 0 or var50 < 1 or 12 < var50 then
	end
	local tonumber_result1 = tonumber(string.sub(arg1, string_find_result1 + 4, string_find_result1 + 5))
	if tonumber_result1 == nil or tonumber_result1 ~= tonumber_result1 or tonumber_result1 % 1 ~= 0 or tonumber_result1 < 1 or tbl_5_upvr[1] < tonumber_result1 then
		local var54
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if 1 == 2 and 1 == 29 and (var52 % 4 ~= 0 or var52 % 100 == 0 and var52 % 400 ~= 0) then
	end
	local var55 = tonumber(string.sub(arg1, string_find_result1 + 7, string_find_result1 + 8)) or 0
	local var56 = tonumber(string.sub(arg1, string_find_result1 + 10, string_find_result1 + 11)) or 0
	local var57 = tonumber(string.sub(arg1, string_find_result1 + 13, string_find_result1 + 14)) or 0
	local var58 = 0
	if string_find_result1 + 15 < #arg1 then
		var58 = tonumber(string.sub(arg1, string_find_result1 + 15, #arg1 - 1))
	end
	local var59 = var52 - 1970
	if var52 % 400 == 0 or var52 % 4 == 0 and var52 % 100 ~= 0 then
		var54 = tbl_3_upvr
	else
		var54 = tbl_4_upvr
	end
	local var60 = var59 * 31536000 + (0 + math.floor((var59 + 1) / 4) - math.floor((var59 - 31) / 100) + math.floor((var59 - 31) / 400)) * 86400 + var54[3][1] + var55 * 3600 + var56 * 60 + var57 + var58
	local module = {
		Tick = var60;
		UnixTimestamp = math.floor(var60);
		UnixTimestampMillis = math.floor(var60 * 1000);
		UnixTimestampMicros = math.floor(var60 * 1000000);
	}
	local tbl = {
		Year = var52;
	}
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	tbl.Month = 3
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	tbl.Day = 1
	tbl.Hour = var55
	tbl.Minute = var56
	tbl.Second = var57
	tbl.Millisecond = math.floor(var58 * 1000)
	tbl.Microsecond = math.floor(var58 * 1000000) % 1000
	module._dateobj = tbl
	return setmetatable(module, module_2_upvr)
end
function module_upvr.fromUniversalTime(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) -- Line 195
	--[[ Upvalues[3]:
		[1]: ConvertNumber_upvr (readonly)
		[2]: tbl_3_upvr (readonly)
		[3]: tbl_4_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var64
	if type(arg4) ~= "number" or arg4 ~= arg4 then
	end
	if type(arg5) ~= "number" or arg5 ~= arg5 then
	end
	if type(arg6) ~= "number" or arg6 ~= arg6 then
	end
	if type(arg7) ~= "number" or arg7 ~= arg7 then
	end
	if type(arg8) ~= "number" or arg8 ~= arg8 then
	end
	local var65 = arg1 - 1970
	if arg1 % 400 == 0 or arg1 % 4 == 0 and arg1 % 100 ~= 0 then
		var64 = tbl_3_upvr
	else
		var64 = tbl_4_upvr
	end
	return ConvertNumber_upvr(var65 * 31536000 + (0 + math.floor((var65 + 1) / 4) - math.floor((var65 - 31) / 100) + math.floor((var65 - 31) / 400)) * 86400 + var64[arg2][arg3] + 0 * 3600 + 0 * 60 + 0 + 0 / 1000 + 0 / 1000000)
end
return module_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.QuestDefinition
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:49
-- Luau version 6, Types version 3
-- Time taken: 0.010610 seconds

return {{
	Predefined = {{
		Objectives = {{1, 1, 10}};
		Reward = {
			Cash = 10;
		};
	}, {
		Objectives = {{1, 1, 15}, {1, 2, 1}, {6, 2}};
		Reward = {
			Cash = 50;
		};
	}, {
		Objectives = {{1, 1, 20}, {1, 4, 1}, {7, 2}};
		Reward = {
			Cash = 75;
		};
	}, {
		Objectives = {{4, 5}, {6, 3}};
		Reward = {
			Cash = 100;
		};
	}, {
		Objectives = {{1, 15, 1}, {4, 3}, {7, 3}, {6, 5}};
		Reward = {
			Cash = 150;
		};
	}, {
		Objectives = {{3, 50}, {2, 2, 1}};
		Reward = {
			Cash = 250;
		};
	}, {
		Objectives = {{1, 15, 50}, {1, 16, 3}, {1, 17, 1}};
		Reward = {
			Cash = 300;
		};
	}, {
		Objectives = {{1, 44, 1}, {6, 7}};
		Reward = {
			Cash = 350;
		};
	}, {
		Objectives = {{1, 45, 3}};
		Reward = {
			Cash = 500;
		};
	}, {
		Objectives = {{1, 44, 15}, {6, 8}, {7, 5}};
		Reward = {
			Cash = 650;
			Emerald = 1;
		};
	}, {
		Objectives = {{1, 47, 5}, {2, 2, 2}, {8, 1}};
		Reward = {
			Cash = 900;
		};
	}, {
		Objectives = {{1, 44, 20}, {1, 45, 2}, {1, 46, 2}, {1, 47, 2}, {1, 48, 2}, {1, 49, 1}, {6, 9}};
		Reward = {
			Cash = 1100;
		};
	}, {
		Objectives = {{1, 1, 100}, {1, 44, 40}, {1, 7, 1}};
		Reward = {
			Cash = 1300;
		};
	}, {
		Objectives = {{1, 44, 60}, {5, -350}};
		Reward = {
			Cash = 1500;
		};
	}, {
		Objectives = {{1, 44, 50}, {1, 73, 10}, {5, -400}};
		Reward = {
			Cash = 3000;
			Emerald = 1;
		};
	}, {
		Objectives = {{1, 73, 20}, {1, 74, 1}, {6, 10}};
		Reward = {
			Cash = 5000;
		};
	}, {
		Objectives = {{1, 73, 30}, {1, 29, 10}};
		Reward = {
			Cash = 7000;
		};
	}, {
		Objectives = {{1, 73, 50}, {1, 74, 1}, {1, 75, 1}, {1, 76, 1}, {1, 77, 1}, {1, 30, 1}, {1, 31, 1}, {1, 32, 1}};
		Reward = {
			Cash = 11000;
			Emerald = 1;
		};
	}, {
		Objectives = {{2, 3, 1}};
		Reward = {
			Cash = 12000;
		};
	}, {
		Objectives = {{4, 50}, {5, -500}};
		Reward = {
			Cash = 15000;
		};
	}};
	RandomOptions = {
		Layers = {250, -350};
		MaxObjectives = 3;
		MaxRarity = 5;
		MainBlocks = function(arg1) -- Line 186
			local var125 = 20
			if math.random() <= 0.5 then
				var125 = 2
			else
				var125 = 1
			end
			return 40 + var125 * arg1 * var125
		end;
		OreBlocks = function(arg1) -- Line 189
			local var127 = 3
			if math.random() <= 0.3333333333333333 then
				var127 = 2
			else
				var127 = 1
			end
			return 8 + var127 * arg1 * var127
		end;
		Reward = function(arg1) -- Line 192
			local module = {}
			local var130 = 17000 + 2000 * arg1 ^ 1.25
			if arg1 % 5 == 0 then
				var130 *= 1.5
			end
			module.Cash = math.round(var130)
			if arg1 % 10 == 0 then
				module.Emerald = 1
			end
			return module
		end;
	};
}}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.SoundHandler
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:50
-- Luau version 6, Types version 3
-- Time taken: 0.003237 seconds

local module = {}
local tbl_upvr = {
	QuestFinished = "rbxassetid://5648290235";
	ObjectCollected = "rbxassetid://1169806635";
	Purchase = "rbxassetid://9125644905";
	ButtonClick = "rbxassetid://9118134129";
	ButtonClickNew = "rbxassetid://15675032796";
	Hover = "rbxassetid://3199281218";
	Unlocked = "rbxassetid://9125494272";
	DirtHit = "rbxassetid://13357995006";
	DirtBreak = "rbxassetid://13357996579";
	RockHit = "rbxassetid://13439345769";
	RockBreak = "rbxassetid://13439347177";
	GrassHit = "rbxassetid://13440900874";
	GrassBreak = "rbxassetid://13439352273";
	LavaHit = "rbxassetid://13742620782";
	LavaBreak = "rbxassetid://13742622111";
	AirHit = "rbxassetid://13809089719";
	AirBreak = "rbxassetid://13809091029";
	CrystalHit = "rbxassetid://13809104885";
	CrystalBreak = "rbxassetid://13809105716";
	Jackhammer = "rbxassetid://3417831369";
	Explosion = "rbxassetid://1060191237";
	OreSpawn5 = "rbxassetid://4612386526";
	OreSpawn6 = "rbxassetid://1843027392";
	OreSpawn7 = "rbxassetid://9039922314";
	OreSpawn8 = "rbxassetid://1843519441";
	OreSpawn9 = "rbxassetid://1843519441";
	OreSpawn10 = "rbxassetid://1843519441";
}
local Sounds_upvr = require(game.ReplicatedStorage.Modules.DataModule).GetData(game.Players.LocalPlayer).Settings.Sounds
local SoundService_upvr = game:GetService("SoundService")
function module.PlaySound(arg1, arg2) -- Line 39
	--[[ Upvalues[3]:
		[1]: Sounds_upvr (readonly)
		[2]: tbl_upvr (readonly)
		[3]: SoundService_upvr (readonly)
	]]
	if arg2 ~= true and Sounds_upvr.Value == false then
	else
		local var6 = tbl_upvr[arg1]
		if not var6 then
			if string.sub(arg1, 1, 13) ~= "rbxassetid://" then return end
			var6 = arg1
		end
		local Sound = Instance.new("Sound")
		if arg1 == "Hover" then
		end
		if string.sub(arg1, #arg1 - 2) == "Hit" or string.sub(arg1, #arg1 - 4) == "Break" then
			Sound.PlaybackSpeed *= 0.75 + math.random() * 0.75
		end
		Sound.Volume = 0.3 * (0.4 + math.random() * 0.15)
		Sound.SoundId = var6
		SoundService_upvr:PlayLocalSound(Sound)
		Sound:Destroy()
	end
end
return module


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Translator
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:50
-- Luau version 6, Types version 3
-- Time taken: 0.016775 seconds

local module_upvr = {}
local LocalPlayer = game.Players.LocalPlayer
local var7_upvw = "english"
local BindableEvent_upvr = Instance.new("BindableEvent")
module_upvr.LanguageUpdated = BindableEvent_upvr.Event
local tbl_upvr_3 = {}
local tbl_upvr = {}
for _, v in script:GetChildren() do
	local v_6 = require(v)
	tbl_upvr[v_6.TranslatorSettings.Locale] = v.Name
	tbl_upvr_3[v.Name] = v_6
end
local var15_upvr = tbl_upvr_3[var7_upvw]
function module_upvr.Get(arg1, ...) -- Line 18
	--[[ Upvalues[3]:
		[1]: tbl_upvr_3 (readonly)
		[2]: var7_upvw (read and write)
		[3]: var15_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var41 = tbl_upvr_3[var7_upvw]
	if var41 == nil then
		var41 = var15_upvr
	end
	if var41 ~= var15_upvr then
	else
	end
	local string_split_result1 = string.split(arg1, '.')
	for i_2, v_2 in string_split_result1 do
		local tonumber_result1 = tonumber(v_2)
		local var44
		if tonumber_result1 and tonumber_result1 == tonumber_result1 then
			var44 = var44[tonumber_result1]
			local var45 = var44
		else
			var45 = var45[v_2]
		end
		if var45 == nil then break end
	end
	if var45 == nil then
		if true == true then
			i_2 = arg1
			warn("Could not translate "..i_2)
			return arg1
		end
		for _, v_3 in string_split_result1 do
			if var15_upvr[v_3] == nil then
				warn("Could not translate "..arg1)
				return arg1
			end
		end
	end
	for i_4, v_4 in {...} do
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	end
	return string.gsub(var15_upvr[v_3], '{'..i_4..'}', string.gsub(v_4, "%%", "%%%%"))
end
function module_upvr.GetModule() -- Line 52
	--[[ Upvalues[3]:
		[1]: tbl_upvr_3 (readonly)
		[2]: var7_upvw (read and write)
		[3]: var15_upvr (readonly)
	]]
	local var48 = tbl_upvr_3[var7_upvw]
	if not var48 then
		var48 = var15_upvr
	end
	return var48
end
function module_upvr.GetLanguage() -- Line 56
	--[[ Upvalues[1]:
		[1]: var7_upvw (read and write)
	]]
	return var7_upvw
end
local function _(arg1) -- Line 60, Named "LocaleToLanguage"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	return tbl_upvr[string.split(arg1, '-')[1]] or "english"
end
function module_upvr.SetLanguage(arg1) -- Line 64
	--[[ Upvalues[2]:
		[1]: var7_upvw (read and write)
		[2]: BindableEvent_upvr (readonly)
	]]
	if arg1 ~= var7_upvw then
		var7_upvw = arg1
		BindableEvent_upvr:Fire()
	end
end
local function _(arg1, arg2, arg3) -- Line 71, Named "AddGradientToText"
	if not utf8.len(arg1) then
		return ""
	end
	for _, v_5 in utf8.codes(arg1) do
		local utf8_char_result1 = utf8.char(v_5)
		if utf8_char_result1 == ' ' then
			table.insert({}, utf8_char_result1)
		else
			local var60
			local var61 = (-1 + 1) / var60
			var60 = nil
			if typeof(arg2) == "Color3" and typeof(arg3) == "Color3" then
				var60 = arg2:Lerp(arg3, var61):ToHex()
			else
				local floored = math.floor(var61 * (#arg2 - 1))
				local var63 = arg2[floored + 2]
				if var63 then
					local var64 = 1 / (#arg2 - 1)
					var60 = arg2[floored + 1]:Lerp(var63, (var61 - var64 * floored) / var64):ToHex()
				else
					var60 = arg2[floored + 1]:ToHex()
				end
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			table.insert({}, "<font color=\"#"..var60.."\">"..utf8_char_result1.."</font>")
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return table.concat({})
end
local tbl_upvr_2 = {-- : First try: K:0: attempt to index nil with 't'

local function split_upvr(arg1) -- Line 109, Named "split"
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	local module_2 = {}
	local var76
	for i_6 = 1, #arg1 do
		local string_byte_result1 = string.byte(arg1, i_6)
		local string_byte_result1_4 = string.byte(arg1, i_6 + 1)
		local var79 = tbl_upvr_2[string_byte_result1]
		if var79 ~= nil and (var79 == false or string_byte_result1_4 == 32 or string_byte_result1_4 == nil) then
			if 1 <= i_6 - var76 then
				table.insert(module_2, string.sub(arg1, var76, i_6 - 1))
				if var79 then
					table.insert(module_2, string.char(string_byte_result1))
				end
			end
			var76 = i_6 + 1
		end
	end
	if var76 < #arg1 + 1 then
		i_6 = string.sub(arg1, var76, #arg1)
		table.insert(module_2, i_6)
	end
	return module_2
end
local function _(arg1, arg2) -- Line 132, Named "ColorString"
	--[[ Upvalues[1]:
		[1]: split_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var80
	if type(arg1) ~= "string" then
		return arg1
	end
	local split_result1 = split_upvr(arg1)
	var80 = 1
	if var80 >= #split_result1 + 1 then
		-- KONSTANTWARNING: GOTO [81] #66
	end
	local var82 = split_result1[var80]
	local var83 = split_result1[var80 + 1]
	if var83 then
		if arg2[var82..' '..var83] then
			local var84 = split_result1[var80 + 2]
			if var84 and (var84 == '.' or var84 == ',') then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				table.insert({}, arg2[var82..' '..var83]..var84)
				var80 += 3
			else
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
				table.insert({}, arg2[var82..' '..var83])
				var80 += 2
			end
		elseif var83 == '.' or var83 == ',' then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			table.insert({}, (arg2[var82] or var82)..var83)
			var80 += 2
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			table.insert({}, arg2[var82] or var82)
		end
		-- KONSTANTWARNING: GOTO [14] #12
	end
end
if LocalPlayer then
	local Language_upvr = require(game.ReplicatedStorage.Modules.DataModule).GetData(LocalPlayer).Settings.Language
	local any_GetTranslatorForPlayer_result1_upvr = game:GetService("LocalizationService"):GetTranslatorForPlayer(LocalPlayer)
	local Networking_upvr = require(game.ReplicatedStorage.Modules.Networking)
	any_GetTranslatorForPlayer_result1_upvr:GetPropertyChangedSignal("LocaleId"):Connect(function() -- Line 171
		--[[ Upvalues[3]:
			[1]: Networking_upvr (readonly)
			[2]: any_GetTranslatorForPlayer_result1_upvr (readonly)
			[3]: tbl_upvr (readonly)
		]]
		Networking_upvr.Fire("SetLanguage", tbl_upvr[string.split(any_GetTranslatorForPlayer_result1_upvr.LocaleId, '-')[1]] or "english")
	end)
	Language_upvr:GetPropertyChangedSignal("Value"):Connect(function() -- Line 174
		--[[ Upvalues[2]:
			[1]: module_upvr (readonly)
			[2]: Language_upvr (readonly)
		]]
		module_upvr.SetLanguage(Language_upvr.Value)
	end)
	local var90 = tbl_upvr[string.split(any_GetTranslatorForPlayer_result1_upvr.LocaleId, '-')[1]] or "english"
	Networking_upvr.Fire("SetLanguage", var90)
	module_upvr.SetLanguage(var90)
end
return module_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Translator.german
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:52
-- Luau version 6, Types version 3
-- Time taken: 0.048980 seconds

local longstring1 = "Dieses Accessoire erh\xF6ht deinen Rucksackplatz um {Boost_BackpackSpace} und verleiht {Boost_LocalMagicPower} mehr Magiekraft als \xFCbliche Accessoires dieser Seltenheit."
return {
	Main = {
		Cash = "Geld";
		BlockCount = "{1}/{2} Bl\xF6cke";
		BlockCountUnlimited = "{1} Bl\xF6cke";
		EnableJetpack = "Jetpack einschalten";
		DisableJetpack = "Jetpack ausschalten";
		ToSurface = "Zur Oberfl\xE4che";
		ToTeleporter = "Zum Teleporter";
		Backpack = "Rucksack";
		Index = "Index";
		Settings = "Einstellungen";
		Reload = "Neu Laden";
		ReloadChunks = "Chunks neu laden";
		Placing = "Platziere {1}";
		Unbreakable = "Unzerbrechlich";
		BackToMining = "Zur\xFCck zum Sch\xFCrfen";
		Search = "Suchen...";
		Place = "Platzieren";
		Lock = "Sperren";
		Unlock = "Entsperren";
		Unlocked = "Entsperrt";
		BackpackFull = "Rucksack voll";
		BackpackFullMessage = "Dein Rucksack ist voll. Du kannst nicht weiter sch\xFCrfen, bis du Bl\xF6cke verkaufst, platzierst oder deinen Rucksack aufr\xFCstest.";
		Sell = "Verkaufen";
		Upgrade = "Aufr\xFCsten";
		BlocksDiscovered = "{1}/{2} Bl\xF6cke entdeckt (+{3}% Geld)";
		IndexLayer = "{1} | {2} bis {3}";
		IndexLayerNoUp = "{1} | {2} und dar\xFCber";
		IndexLayerNoDown = "{1} | {2} und darunter";
		BaseValue = "Grundwert: <font color=\"#00FF00\">${1}</font>";
		CurrentValue = "Aktueller Wert: <font color=\"#00FF00\">${1}</font>";
		Durability = "Haltbarkeit";
		Rarity = "Seltenheit";
		ProbabilityToSpawn = "Wahrscheinlichkeit zu erscheinen: 1 in {1} Bl\xF6cken";
		IndexCredit = "Block von";
		Loading = "L\xE4dt";
		LoadFail = "Laden fehlgeschlagen";
		TotalMined = "Insgesamt abgebaut";
		Back = "Zur\xFCck";
		On = "An";
		Off = "Aus";
		TimePlayed = "Spielzeit";
		Blocks = "Bl\xF6cke";
		Explosives = "Sprengstoffe";
		Shop = "Shop";
		ComingSoon = "Kommt bald...";
		Buy = "Kaufen";
		Bought = "Gekauft";
		Max = "Max";
		Gift = "Geschenk";
		Gamepasses = "Gamepasses";
		Owned = "Besitzt";
		OwnedByRecipient = "Besitzt vom Empf\xE4nger";
		StopGift = "Geschenke stoppen";
		NoGifts = "Derzeit gibt es niemanden zum Beschenken auf diesem Server.";
		EnterUsername = "Benutzernamen hier eingeben";
		Emeralds = "Smaragde";
		MostPopular = "MEIST GEFRAGT";
		BestOffer = "BESTES ANGEBOT";
		TeleportRequest = "Teleportanfrage";
		TeleportRequestMessage = "Dein Freund {1} hat um Hilfe gebeten. Willst du zu ihm teleportiert werden?";
		No = "Nein";
		Yes = "Ja";
		Upgrades = "Aufr\xFCstungen";
		Pickaxes = "Spitzhacken";
		Backpacks = "Rucks\xE4cke";
		Close = "Schlie\xDFen";
		Equip = "Ausr\xFCsten";
		Equipped = "Ausger\xFCstet";
		BuyWithCash = "Kaufen (${1})";
		BuyWithEmerald = "Kaufen ({1} Smaragd)";
		Power = "Power";
		Storage = "Speicher";
		Prestige = "Prestige";
		Prestiges = "Prestiges: {1}";
		PrestigeCashBoost = "Geld-Bonus: {1} → {2}";
		PrestigeWithCash = "Prestige (${1})";
		UpgradeWithEmerald = "Aufr\xFCsten ({1} Smaragd)";
		LobbyTeleport = "Lobby-Teleport";
		LobbyAt = "Lobby bei Tiefe {1}";
		Teleport = "Teleportieren";
		UnlockFreeTeleports = "Kostenlose Teleports freischalten";
		PrestigeTokens = "Prestige-Token";
		Quests = "Quests";
		QuestDisplay = "{1}/{2} ({3}%)";
		Completed = "Abgeschlossen";
		GroupBonus = "Tritt Jeremy Studio's bei und like das Spiel f\xFCr 50% mehr Geld!";
		Tutorial = "Tutorial";
		TutorialText = "Willkommen! Es gibt viele Bl\xF6cke zu entdecken. Um mit dem Sch\xFCrfen zu beginnen, klicke oder halte einen Block gedr\xFCckt. Jeder Block gibt unterschiedlich viel Geld, aber du kannst nur eine begrenzte Anzahl tragen. Verschiedene Schichten enthalten unterschiedliche Erze ober- und unterhalb des Bodens.";
		Ok = "Ok";
		Luck = "Gl\xFCck";
		Jackhammer = "Presslufthammer";
		TooWeak = "Zu schwach";
		Explosion = "Explosion";
		Jump = "Sprung";
		Pickaxe = "Spitzhacke";
		Speed = "Geschwindigkeit";
		LikeTheGame = "LIKE DAS SPIEL";
		ForRewards = "F\xDCR BELOHNUNGEN!";
		Range = "Reichweite";
		Crafting = "Herstellung";
		MetaGain = "Erhalte mehr Meta pro ausgegebenem Robux. Aktueller Meta-Gewinn: {1} → {2} Meta pro Block";
		Meta = "Meta";
		MetaUnlock = "Freischalten f\xFCr {1}";
		Level = "Level";
		Levels = "Levels";
		EmeraldUpgrades = "Smaragd-Upgrades";
		AFKMessage = "Du wirst alle 17 Minuten automatisch neu verbunden, damit du nicht wegen Inaktivit\xE4t gekickt wirst.";
		FriendMultiMessage = "Lade deine Freunde ein, um deine Spitzhackenst\xE4rke zu erh\xF6hen!";
		NoFriendsHere = "Keine Freunde hier. F\xFCr jeden Freund im Server bekommst du 10% mehr Spitzhackenst\xE4rke!";
		FriendMulti = "Aktueller Freund-Multiplikator:\n+{1}% Spitzhackenst\xE4rke";
		Auto = "Automatisch";
		Pinned = "Gepinnt";
		Unequip = "Ablegen";
		Pin = "Anheften";
		Unpin = "L\xF6sen";
		MaxPins = "Maximale Pins";
		MagicPowerInfo = "Magische Kraft kommt von den aktuell ausger\xFCsteten Accessoires. Sie macht dich auf verschiedene Weisen st\xE4rker.";
		Craft = "Herstellen";
		CraftNotification = "Du kannst jetzt {1} herstellen!";
		PrestigeNotification = "Du kannst jetzt ein Prestige durchf\xFChren!";
		NoReset = "Kein Zur\xFCcksetzen";
		Sacrifice = "Opferung";
		SacrificeMessage = "Die Opferung setzt dieselben Dinge zur\xFCck wie Prestige, aber du kannst sie einmal pro Stunde ohne die Geldanforderung durchf\xFChren! Du erh\xE4ltst {1} Prestige-Token f\xFCr diese Opferung.";
		Wait = "Warten";
		ArchivedBlocks = "Archivierte Bl\xF6cke";
		CraftingRecommendation = "Es wird dringend empfohlen, {1} vor allem anderen herzustellen!";
		DisableFastFall = "Schnellfallen deaktivieren?";
		Claim = "Beanspruchen";
		Showcase = "Ausstellung";
		TotalValue = "Gesamtwert";
		YourPlacement = "Deine Platzierung";
		Top100 = "Top 100";
		Or = "ODER";
		MetaUnlockProgress = "{1}/{2} Ausgegeben";
		PrestigeMessageFree = "Mit Prestige kannst du dein Geld gegen Prestigemarken und einen Geldbonus eintauschen.";
		PrestigeMessageFreeTokens = "Mit Prestige kannst du dein Geld gegen {1} Prestigemarken und einen Geldbonus eintauschen.";
		PrestigeMessageFreeDaily = "Prestige setzt deine Spitzhacken, Rucks\xE4cke, dein Geld und Bl\xF6cke zur\xFCck, aber du erh\xE4ltst einen Geldbonus und {1} Prestigemarken. Wenn du jedoch {2} wartest, wird nur dein Geld zur\xFCckgesetzt.";
		BuyAll = "Alles Kaufen";
		Cooldown = "Abklingzeit";
		IndexSecretLayer = "Geheim | \xDCberall";
		BlockRewards = "Gefallen dir die Erze? Du kannst 750 Smaragde f\xFCr jedes Erz bis einschlie\xDFlich Mythisch oder 3.000 Smaragde pro hinzugef\xFCgtem \xC4therisch+-Erz verdienen. Reiche deine Erze im Discord-Server unter der Spielbeschreibung ein.";
		LeaderboardProgress = "Du bist unter den Top {1}";
		BlockTagged = "Block wurde von {1} abgebaut";
		Trading = "Handel";
		LagMessage = "Wenn du Lags hast, wird empfohlen, die Sichtweite im Einstellungsmen\xFC zu verringern.";
		TutorialText2 = "Willkommen! Halte eine beliebige Block gedr\xFCckt, um mit dem Abbauen zu beginnen. Seltenere Bl\xF6cke bringen mehr Geld. Es gibt viele verschiedene Schichten \xFCber und unter der Erde mit deutlich wertvolleren Bl\xF6cken. Ihre Lobbys haben einzigartige Upgrades.";
		TutorialText3 = "Willkommen! Halte eine beliebige Block gedr\xFCckt, um mit dem Abbauen zu beginnen. Seltenere Bl\xF6cke bringen mehr Geld. Es gibt viele verschiedene Schichten \xFCber und unter der Erde mit deutlich wertvolleren Bl\xF6cken. Ihre Lobbys haben einzigartige Upgrades. Spiele genug und du kannst 2.000 Bl\xF6cke pro Sekunde abbauen!";
		Undiscovered = "Unentdeckt";
		PrestigeMessage = "Prestige setzt deine Spitzhacken, Rucks\xE4cke, dein Geld und deine Bl\xF6cke zur\xFCck, aber du erh\xE4ltst einen Geld-Bonus und {1} Prestige-Token";
		PrestigeMessageBetter = "Prestige setzt nur Spitzhacken, Rucks\xE4cke, Geld und Bl\xF6cke zur\xFCck, aber du erh\xE4ltst einen Geld-Bonus und {1} Prestige-Token. <font color=\"#ff0000\">Es wird nichts anderes zur\xFCckgesetzt! Du wirst deutlich schneller Fortschritte machen, wenn du Prestige nutzt.</font>";
		PrestigeMessageEthereal = "Prestige setzt deine Spitzhacken, Rucks\xE4cke, dein Geld und deine Bl\xF6cke zur\xFCck <font color=\"#ff0000\">(Keine Ethereal+ Bl\xF6cke!)</font>, aber du erh\xE4ltst einen Geld-Bonus und {1} Prestige-Token";
		PrestigeMessageBetterEthereal = "Prestige setzt nur Spitzhacken, Rucks\xE4cke, Geld und Bl\xF6cke zur\xFCck <font color=\"#ff0000\">(Keine Ethereal+ Bl\xF6cke!)</font>, aber du erh\xE4ltst einen Geld-Bonus und {1} Prestige-Token. <font color=\"#ff0000\">Es wird nichts anderes zur\xFCckgesetzt! Du wirst deutlich schneller Fortschritte machen, wenn du Prestige nutzt.</font>";
	};
	Tips = {
		MiningAbilityInactive = "Tipp: Starke Bergbau-F\xE4higkeiten sind in der N\xE4he des Spawns inaktiv!";
		CraftingNote = "Accessoires, die f\xFCr dich zu schwierig herzustellen sind, werden verborgen. Werde st\xE4rker und besorge dir einen gr\xF6\xDFeren Rucksack, dann werden sie freigeschaltet.";
		TradingNote = "Getauschte Bl\xF6cke werden archiviert und k\xF6nnen nicht f\xFCr Geld verkauft werden, k\xF6nnen aber zum Craften verwendet werden!";
	};
	Upgrades = {
		BuyAll = "Alles freischalten";
		KeepBackpack = "Rucksacklevel beim Prestige behalten";
		MorePickaxePower = "Mehr Spitzhacken-Power";
		MoreCash = "Mehr Geld";
		JackhammerChance = "Chance des Presslufthammers";
		JackhammerRadius = "Radius des Presslufthammers";
		JackhammerSize = "Gr\xF6\xDFe des Presslufthammers";
		MiningSpeed = "Abbaugeschwindigkeit";
		MiningFrenzy = "Abbauwahn nach dem Finden eines epischen Blocks";
		ExplosionChance = "Explosionschance";
		ExplosionRadius = "Explosionsradius";
		TNTLuck = "TNT-Gl\xFCck";
		MiningRange = "Abbau-Reichweite";
		MiningRange2 = "Abbau-Reichweite 2";
		UnlockCrafting = "Herstellung freischalten";
		MoreAccessorySlots = "Mehr Zubeh\xF6rpl\xE4tze";
		MoreMeta1 = "Mehr Meta 1";
		MoreMeta2 = "Mehr Meta 2";
		MoreMetaBlocksMined = "Mehr Meta basierend auf abgebauten Bl\xF6cken";
		MoreLuck = "Mehr Gl\xFCck";
		MoreRange = "Mehr Reichweite";
		DuplicateBlocks = "Block-Duplizierungschance";
		WalkSpeed = "Mehr Laufgeschwindigkeit";
	};
	UnlockMessages = {
		Prestiges = "Schaltet sich bei {1} Prestiges frei";
	};
	Rarity = {"Gew\xF6hnlich", "Ungew\xF6hnlich", "Selten", "Episch", "Legend\xE4r", "Mythisch", "\xC4therisch", "Himmlisch", "Zenit", "G\xF6ttlich", "Null"};
	Settings = {
		Low = "Hohe Qualit\xE4t";
		LowDesc = "Alle Hauptbl\xF6cke einer Schicht werden in hoher Qualit\xE4t angezeigt, das kann Lag verursachen";
		RenderDistance = "Render-Distanz";
		RenderDistanceDesc = "\xC4ndere, wie viele Chunks du in jede Richtung siehst";
		Teleport = "Teleport";
		TeleportDesc = "Freunde, die du einl\xE4dst, werden gefragt, ob sie zu deiner aktuellen Position teleportiert werden wollen";
		Music = "Musik";
		MusicDesc = "Schaltet Musik an oder aus";
		FastFall = "Schnellfallen";
		FastFallDesc = "Du wirst nach unten teleportiert, wenn du eine Zeit lang f\xE4llst";
		x2Speed = "2x Geschwindigkeit";
		x2SpeedDesc = "Du gehst doppelt so schnell";
		x2Jump = "2x Sprung";
		x2JumpDesc = "Du springst doppelt so hoch";
		Reload = "Chunks neu laden";
		ReloadDesc = "L\xE4dt alle Bl\xF6cke neu, falls es Glitches gibt";
		FastFly = "Schnellfliegen";
		FastFlyDesc = "Du wirst beim Jetpack nach einer Zeit nach oben teleportiert";
		DarkLighting = "Dunkle Beleuchtung";
		DarkLightingDesc = "Schaltet die Dunkle Beleuchtung um";
		FriendMarkers = "Freundesmarkierungen";
		FriendMarkersDesc = "Schaltet die Sichtbarkeit deiner Freunde um";
		BreakingSprites = "Bruch-Sprites";
		BreakingSpritesDesc = "Schaltet die Sichtbarkeit der Bruch-Sprites beim Abbauen von Bl\xF6cken um";
		JumpJetpack = "Sprung-Jetpack";
		JumpJetpackDesc = "Du benutzt automatisch das Jetpack beim Springen";
		Sounds = "Sounds";
		SoundsDesc = "Schaltet die Wiedergabe von Sounds ein oder aus";
		ChatTags = "Chat-Tags";
		AutoRender = "Automatisches Rendern";
		AutoRenderDesc = "Verringert automatisch die Sichtweite, wenn Lag erkannt wird";
		BlockStepping = "Blocksteigen";
		BlockSteppingDesc = "Du steigst automatisch auf Bl\xF6cke";
	};
	ChatMessages = {
		BlockFound = "{1} hat gerade {2} gefunden";
		MultipleBlocksFound = "{1} hat gerade {2} {3} gefunden";
		OreFound = "{1} hat gerade {2} ({3}) in Schicht {4} gefunden (1 in {5} Bl\xF6cken)";
		OreFoundShort = "{1} hat gerade {2} gefunden (1 in {3} Bl\xF6cken)";
		MultipleOresFound = "{1} hat gerade {2} {3} ({4}) in Schicht {5} gefunden (1 in {6} Bl\xF6cken)";
		YouBlockFound = "Du hast gerade {1} gefunden";
		YouMultipleBlocksFound = "Du hast gerade {1} {2} gefunden";
		YouOreFound = "Du hast gerade {1} ({2}) in Schicht {3} gefunden (1 in {4} Bl\xF6cken)";
		YouOreFoundShort = "Du hast gerade {1} gefunden (1 in {2} Bl\xF6cken)";
		YouMultipleOresFound = "Du hast gerade {1} {2} ({3}) in Schicht {4} gefunden (1 in {5} Bl\xF6cken)";
		TempMute = "Du wurdest f\xFCr {1} vor\xFCbergehend stummgeschaltet! Stummschaltung endet in {2}";
		PermMute = "Du wurdest f\xFCr {1} dauerhaft stummgeschaltet!";
		TeleporterDestroyed = "Dein Teleporter wurde zerst\xF6rt, weil ein Block darauf platziert wurde";
		MiningFrenzy = "Abbauwahn aktiviert! Du baust jetzt {1} schneller und verursachst {2} mehr Schaden f\xFCr 1 Minute!";
		LikeGoalReached1 = "Like-Ziel erreicht. +25% Abbaugeschwindigkeit und +25% Schaden f\xFCr die n\xE4chsten {1} Minuten.";
		LikeGoalReached2 = "Like-Ziel erreicht. +25% Geld und +25% Schaden f\xFCr die n\xE4chsten {1} Minuten.";
		IntroMessage1 = "⛏️Jede Lobby hat ihr eigenes einzigartiges Feature!⛏️";
		IntroMessage2 = "💎Tritt der Gruppe bei & Like das Spiel f\xFCr 50% mehr Geld!💎";
		OreUncovered = "Ein {1}-Erz wurde gerade freigelegt!";
		EmeraldUncovered = "Ein Smaragd wurde gerade freigelegt!";
		Emerald = "{1} hat dir {2} Smaragde geschenkt";
		Gamepass = "{1} hat dir {2} geschenkt";
		EmeraldYou = "Du hast {1} {2} Smaragde geschenkt";
		GamepassYou = "Du hast {1} {2} geschenkt";
		EmeraldOther = "{1} hat {2} {3} Smaragde geschenkt";
		GamepassOther = "{1} hat {2} {3} geschenkt";
		BlockEmeraldsAwarded = "Du hast {1} Smaragde f\xFCr das Erstellen von Erzen erhalten!";
		UnprocessedBlock = "Du hast {1} erhalten, da der Server geschlossen wurde.";
		BigCave = "Eine gro\xDFe H\xF6hle ist in deiner N\xE4he erschienen!";
	};
	ChatTips = {"Wissenswertes: Es gibt insgesamt {1} Upgrades in diesem Spiel!", "Derzeit gibt es {1} einzigartige Bl\xF6cke im Spiel!", "Die meisten Erze im Spiel wurden von {1} und {2} erstellt", "Festgefahren? Versuche ein Prestige.", "Einer der Entwickler des Spiels besitzt die meisten Abzeichen auf ganz Roblox mit 135 Millionen Abzeichen und hat das maximale Limit erreicht.", "Die seltenste Block-Rarit\xE4t hat eine Erscheinungschance von 1 zu 2.000.000.000...", "Mining-Geschwindigkeit ist n\xFCtzlicher, als es auf den ersten Blick scheint...", "Schenken funktioniert server\xFCbergreifend, selbst wenn die Person, der du etwas schenken willst, offline ist. Sie muss das Spiel nur mindestens einmal gespielt haben.", "Autoklicker und Makros sind erlaubt, Exploits jedoch nicht.", "Nachdem du das Crafting freigeschaltet und das Machina-Artefakt hergestellt hast, kannst du das Spiel verlassen und automatisch f\xFCr dich grinden lassen.", "Es gibt eine Chance von 1 zu 10.000, diese Nachricht zu erhalten. Gl\xFCckwunsch!"};
	DiscordChatTips = {"Wenn dir die Erze im Spiel gefallen, kannst du eigene im Discord-Server des Spiels erstellen :)"};
	ServerResponses = {
		Error = "Ein Fehler ist aufgetreten, versuche es sp\xE4ter nochmal";
		AppealEmpty = "Beschwerde darf nicht leer sein";
		AppealInvalidCharacters = "Beschwerde enth\xE4lt ung\xFCltige Zeichen";
		AppealTooShort = "Beschwerde zu kurz";
		AppealTooLong = "Beschwerde zu lang";
		AppealTooFast = "Du sendest Beschwerden zu schnell, langsamer bitte";
		AppealFiltered = "Beschwerde wurde gefiltert";
		AppealSuccess = "Beschwerde erfolgreich gesendet, wir melden uns bald.";
		ResponseEmpty = "Antwort darf nicht leer sein";
		ResponseInvalidCharacters = "Antwort enth\xE4lt ung\xFCltige Zeichen";
		ResponseTooShort = "Antwort zu kurz";
		ResponseTooLong = "Antwort zu lang";
		ResponseDecision = "Du musst eine Entscheidung ausw\xE4hlen";
		ResponseTooFast = "Du sendest Antworten zu schnell, langsamer bitte";
		ResponseFiltered = "Antwort wurde gefiltert";
		NotBanned = "Dieser Nutzer ist nicht gebannt";
		AlreadyResponded = "Auf diese Beschwerde wurde bereits geantwortet";
		NoData = "Dieser Nutzer hat keine Daten";
		UnableRespond1 = "Kann auf diese Beschwerde nicht antworten, bitte kontaktiere einen h\xF6heren Rang";
		UnableRespond2 = "Kann auf diese Beschwerde nicht antworten, weil der Nutzer super permanent gebannt wurde";
		ResponseSuccess = "Antwort erfolgreich gesendet";
		LayerTooPowerful = "Die Schicht ist zu stark, der Sprengstoff kann nicht platziert werden";
		NoBlocksExploded = "Der Sprengstoff hat keine Bl\xF6cke zerst\xF6rt und wurde nicht aufgeladen";
		GiftSuccess = "Dein Geschenk f\xFCr {1} wurde erfolgreich gesendet";
		GiftError = "Dein Geschenk f\xFCr {1} konnte nicht gesendet werden, wird beim Wiedereintritt wiederholt";
		InvalidUser = "Ung\xFCltiger Nutzer";
		GiftYourself = "Du kannst dir selbst nichts schenken";
		MoveAway = "Entferne dich mindestens 75 Bl\xF6cke vom Spawn-Punkt.";
	};
	Admin = {
		Appeals = "Einspr\xFCche";
		NoPendingAppeals = "Momentan gibt es keine ausstehenden Einspr\xFCche.";
		Reload = "Neu laden";
		LoadingAppeals = "L\xE4dt Einspr\xFCche...";
		SendResponse = "Antwort senden";
		EnterResponse = "Geben sie ihre Antwort zu dem Einspruch hier ein";
		Deny = "Ablehnen";
		Accept = "Akzeptieren";
		TempBan = "F\xFCr {1} gebannt wegen \"{2}\"";
		PermBan = "Dauerhaft gebannt wegen \"{1}\"";
		SuperPermBan = "Super dauerhaft gebannt wegen \"{1}\"";
		Unban = "Von {1} entbannt";
	};
	Ban = {
		AccountBan = "Konto Bann";
		Temp = "Sie wurden tempor\xE4r f\xFCr {1} gebannt!";
		Perm = "Sie wurden permanent f\xFCr {1} gebannt!";
		TimeBanned = "Gebannt am: {1}";
		BanEnds = "Bann Endet: {1}";
		BanEndsTimer = "Bann endet in {1}";
		BanEndsNever = "Bann endet nie";
		BanEnded = "Bann Endete: {1}";
		AppealMessage = "Falls sie Einspruch legen m\xF6chten, kontaktieren sie uns im Formular hier unten.";
		AppealMessageRubenSim = "Wenn du Einspruch einlegen m\xF6chtest, kontaktiere Ruben Sim.";
		AppealSent = "Sie haben einen Einspruch gesendet, wir werden uns an sie schnellst m\xF6glich wenden";
		AppealDenied = "Ihr Einspruch wurde abgelehnt, \xFCberpr\xFCfen sie ihre Nachrichten f\xFCr details.";
		AppealAccepted = "Ihr Einspruch wurde akzeptiert, sie k\xF6nnen weiter spielen.";
		Appeal = "Einspruch legen";
		AppealOnce = "Sie k\xF6nnen nur einmal Einspruch legen";
		AppealTextBox = "Geben sie ihren Einspruch hier ein, geben sie so viele Informationen wie m\xF6glich";
		Send = "Senden";
		ViewMessages = "Nachrichten Anschauen";
		Messages = "Nachrichten";
		YouWrote = "Sie haben geschrieben";
		OtherWrote = "{1} hat geschrieben";
	};
	Trading = {
		WaitForPeople = "Warte auf Spieler zum Handeln...";
		WaitForTradeRequests = "Warte auf Handelsanfragen...";
		WantsToTrade = "{1} m\xF6chte mit dir handeln";
		Accept = "Annehmen";
		Unaccept = "Annahme zur\xFCckziehen";
		Deny = "Ablehnen";
		EnterAmount = "Menge eingeben";
		Confirmation = "Bist du sicher?";
		NoResults = "Keine Ergebnisse gefunden.";
		TradeDenied = "{1} hat den Handel abgelehnt!";
		Offering = "Bietet {1} an";
		Regulations = "Bestimmte Gegenst\xE4nde sind aufgrund lokaler Vorschriften deaktiviert.";
		NotAcceptedYet = "Noch nicht angenommen";
		WaitingForAccept = "Angenommen, warte auf deine Best\xE4tigung";
		ProcessingIn = "Handel wird in {1} Sekunden verarbeitet";
		NoItemsAvailable = "Keine verf\xFCgbaren Gegenst\xE4nde f\xFCr diesen Handel.";
		NoItemsOffered = "Keine Gegenst\xE4nde angeboten.";
		TradeCompleted = "Handel wurde abgeschlossen.";
		TradeFailed = "Beim Handel ist ein Fehler aufgetreten.";
		TradeLimit = "{1}/{2} Handelsvorg\xE4nge";
		TradeLimitReset = "Zur\xFCckgesetzt in {1}";
	};
	Accessories = {{{
		Name = "Duplici Talisman";
		Desc = "Der Duplici Talisman bietet eine zus\xE4tzliche Chance von {Boost_Dupe}, einen zus\xE4tzlichen Block beim Abbauen zu erhalten.";
	}, {
		Name = "Duplici Ring";
		Desc = "Der Duplici Ring bietet eine zus\xE4tzliche Chance von {Boost_Dupe}, einen zus\xE4tzlichen Block beim Abbauen zu erhalten.";
	}, {
		Name = "Duplici Relikt";
		Desc = "Das Duplici Relikt bietet eine zus\xE4tzliche Chance von {Boost_Dupe}, einen zus\xE4tzlichen Block beim Abbauen zu erhalten.";
	}, {
		Name = "Duplici Erbst\xFCck";
		Desc = "Das Duplici Erbst\xFCck bietet eine zus\xE4tzliche Chance von {Boost_Dupe}, einen zus\xE4tzlichen Block beim Abbauen zu erhalten.";
	}}, {{
		Name = "Ruber Ring";
		Desc = "Der Ruber Ring bietet eine zus\xE4tzliche Chance von {Boost_RareExplosion}, eine Explosion der St\xE4rke 5 auszul\xF6sen, wenn ein seltener Block abgebaut wird.";
	}, {
		Name = "Ruber Relikt";
		Desc = "Das Ruber Relikt bietet eine zus\xE4tzliche Chance von {Boost_RareExplosion}, eine Explosion der St\xE4rke 5 auszul\xF6sen, wenn ein seltener Block abgebaut wird.";
	}, {
		Name = "Ruber Erbst\xFCck";
		Desc = "Das Ruber Erbst\xFCck bietet eine zus\xE4tzliche Chance von {Boost_RareExplosion}, eine Explosion der St\xE4rke 5 auszul\xF6sen, wenn ein seltener Block abgebaut wird.";
	}, {
		Name = "Ruber Chronomicon";
		Desc = "Das Ruber Chronomicon bietet eine zus\xE4tzliche Chance von {Boost_RareExplosion}, eine Explosion der St\xE4rke 5 auszul\xF6sen, wenn ein seltener Block abgebaut wird.";
	}}, {{
		Name = "Sparschwein-Ring";
		Desc = "Der Sparschwein-Ring bietet einen zus\xE4tzlichen {Boost_Cash}-Bonus auf Bargeld.";
	}, {
		Name = "Sparschwein-Relikt";
		Desc = "Das Sparschwein-Relikt bietet einen zus\xE4tzlichen {Boost_Cash}-Bonus auf Bargeld.";
	}, {
		Name = "Sparschwein-Erbst\xFCck";
		Desc = "Das Sparschwein-Erbst\xFCck bietet einen zus\xE4tzlichen {Boost_Cash}-Bonus auf Bargeld.";
	}, {
		Name = "Sparschwein-Chronomicon";
		Desc = "Das Sparschwein-Chronomicon ist ein m\xE4chtiges Accessoire, das einen zus\xE4tzlichen {Boost_Cash}-Bonus auf Bargeld bietet, sowie einen zus\xE4tzlichen 5%-Bonus auf Bargeld obendrauf.";
	}, {
		Name = "Aufgestiegene Sparb\xFCchse";
		Desc = "Die Aufgestiegene Sparb\xFCchse ist ein sehr starkes Accessoire, das einen zus\xE4tzlichen Bonus von {Boost_Cash} auf Geld sowie weitere 10% obendrauf bietet.";
	}}, {{
		Name = "Talisman des Minenarbeiters";
		Desc = "Der Talisman des Minenarbeiters ist ein Basis-Accessoire, das einen Bonus von {Boost_Cash} auf Geld und {Boost_PickaxePower} auf Spitzhackenschaden bietet.";
	}, {
		Name = "Ring des Minenarbeiters";
		Desc = "Der Ring des Minenarbeiters bietet einen Bonus von {Boost_Cash} auf Geld und {Boost_PickaxePower} auf Spitzhackenschaden.";
	}, {
		Name = "Relikt des Minenarbeiters";
		Desc = "Das Relikt des Minenarbeiters bietet einen Bonus von {Boost_Cash} auf Geld und {Boost_PickaxePower} auf Spitzhackenschaden.";
	}, {
		Name = "Erbst\xFCck des Minenarbeiters";
		Desc = "Das Erbst\xFCck des Minenarbeiters bietet einen Bonus von {Boost_Cash} auf Geld und {Boost_PickaxePower} auf Spitzhackenschaden.";
	}, {
		Name = "Chronomikon des Minenarbeiters";
		Desc = "Das Chronomikon des Minenarbeiters bietet einen Bonus von {Boost_Cash} auf Geld und {Boost_PickaxePower} auf Spitzhackenschaden.";
	}, {
		Name = "Welt des Minenarbeiters";
		Desc = "Die Welt des Minenarbeiters bietet einen Bonus von {Boost_Cash} auf Geld und {Boost_PickaxePower} auf Spitzhackenschaden, sowie {Boost_PrestigeTokens} Prestigemarken und {Boost_MiningSpeed} Mining-Geschwindigkeit. Freitags und am Wochenende werden Geld und Schaden verdoppelt.";
	}}, {{
		Name = "Eile-Relikt";
		Desc = "Das Eile-Relikt ist ein Accessoire, das die Abbaugeschwindigkeit um {Boost_MiningSpeed} erh\xF6ht.";
	}, {
		Name = "Eile-Erbst\xFCck";
		Desc = "Das Eile-Erbst\xFCck ist ein Accessoire, das die Abbaugeschwindigkeit um {Boost_MiningSpeed} erh\xF6ht.";
	}, {
		Name = "Eile-Chronomikon";
		Desc = "Das Eile-Chronomikon ist ein m\xE4chtiges Accessoire, das die Abbaugeschwindigkeit um {Boost_MiningSpeed} erh\xF6ht.";
	}, {
		Name = "Eile Erhaben";
		Desc = "Eile Erhaben ist ein sehr m\xE4chtiges Accessoire, das die Abbaugeschwindigkeit um {Boost_MiningSpeed} erh\xF6ht.";
	}, {
		Name = "Ewige Eile";
		Desc = "Die Ewige Eile ist ein extrem m\xE4chtiges Accessoire, das die Abbaugeschwindigkeit um {Boost_MiningSpeed} erh\xF6ht.";
	}}, {{
		Name = "Artefakt der Geschwindigkeit";
		Desc = "Das Artefakt der Geschwindigkeit erh\xF6ht Ihre Gehgeschwindigkeit um {Boost_WalkSpeed} Bl\xF6cke pro Sekunde.";
	}}, {{
		Name = "Crepitus-Ring";
		Desc = "Der Crepitus-Ring ist ein Accessoire mit einer Chance von {Boost_ExtraExplosionRadiusChance} pro Aktivierung der Explosionsf\xE4higkeit, den Radius um +1 zu erh\xF6hen.";
	}, {
		Name = "Crepitus-Relikt";
		Desc = "Das Crepitus-Relikt ist ein Accessoire mit einer Chance von {Boost_ExtraExplosionRadiusChance} pro Aktivierung der Explosionsf\xE4higkeit, den Radius um +1 zu erh\xF6hen.";
	}, {
		Name = "Crepitus-Erbst\xFCck";
		Desc = "Das Crepitus-Erbst\xFCck ist ein Accessoire mit einer Chance von {Boost_ExtraExplosionRadiusChance} pro Aktivierung der Explosionsf\xE4higkeit, den Radius um +1 zu erh\xF6hen.";
	}, {
		Name = "Crepitus-Chronomikon";
		Desc = "Das Crepitus-Chronomikon ist ein Accessoire mit einer Chance von {Boost_ExtraExplosionRadiusChance} pro Aktivierung der Explosionsf\xE4higkeit, den Radius um +1 zu erh\xF6hen.";
	}, {
		Name = "Crepitus Max";
		Desc = "Der Crepitus Max ist ein Accessoire mit einer Chance von {Boost_ExtraExplosionRadiusChance} pro Aktivierung der Explosionsf\xE4higkeit, den Radius um +1 zu erh\xF6hen.";
	}}, {{
		Name = "Fragon-Artefakt";
		Desc = "Das Fragon-Artefakt erzeugt eine Explosion der St\xE4rke 25, wenn ein mythischer Block abgebaut wird.";
	}}, {{
		Name = "Bang-Ring";
		Desc = "Der Bang-Ring hat eine Chance von {Boost_LegendaryExplosion}, eine Explosion der St\xE4rke 17 auszul\xF6sen, wenn ein legend\xE4rer Block abgebaut wird.";
	}, {
		Name = "Bang-Relikt";
		Desc = "Das Bang-Relikt hat eine Chance von {Boost_LegendaryExplosion}, eine Explosion der St\xE4rke 17 auszul\xF6sen, wenn ein legend\xE4rer Block abgebaut wird.";
	}, {
		Name = "Bang-Erbst\xFCck";
		Desc = "Das Bang-Erbst\xFCck hat eine Chance von {Boost_LegendaryExplosion}, eine Explosion der St\xE4rke 17 auszul\xF6sen, wenn ein legend\xE4rer Block abgebaut wird.";
	}, {
		Name = "Bang-Chronomicon";
		Desc = "Das Bang-Chronomicon hat eine Chance von {Boost_LegendaryExplosion}, eine Explosion der St\xE4rke 20 auszul\xF6sen, wenn ein legend\xE4rer Block abgebaut wird.";
	}}, {{
		Name = "Radar-Talisman";
		Desc = "Das Radar-Accessoire zeigt Ihnen legend\xE4re+ Erze in einem Umkreis von {Boost_RadarRadius} Bl\xF6cken an.";
	}, {
		Name = "Radar-Ring";
		Desc = "Das Radar-Accessoire zeigt Ihnen legend\xE4re+ Erze in einem Umkreis von {Boost_RadarRadius} Bl\xF6cken an.";
	}, {
		Name = "Radar-Relikt";
		Desc = "Das Radar-Accessoire zeigt Ihnen legend\xE4re+ Erze in einem Umkreis von {Boost_RadarRadius} Bl\xF6cken an.";
	}, {
		Name = "Radar-Erbst\xFCck";
		Desc = "Das Radar-Accessoire zeigt Ihnen legend\xE4re+ Erze in einem Umkreis von {Boost_RadarRadius} Bl\xF6cken an.";
	}, {
		Name = "Radar-Chronomicon";
		Desc = "Das Radar-Accessoire zeigt Ihnen legend\xE4re+ Erze in einem Umkreis von {Boost_RadarRadius} Bl\xF6cken an.";
	}}, {{
		Name = "Machina-Artefakt";
		Desc = "Dieses Artefakt automatisiert dein Mining-Erlebnis, indem es deinen K\xF6rper nach deinem Willen steuert.";
	}, {
		Name = "Machina Zweiter Ordnung";
		Desc = "Verbessert das automatische Mining, um Legend\xE4re+ Erze abzubauen, und erh\xF6ht deine Laufgeschwindigkeit um 100 %.";
	}, {
		Name = "Machina Dritter Ordnung";
		Desc = "Verbessert das automatische Mining f\xFCr Seltene+ Erze, erh\xF6ht deine Laufgeschwindigkeit um 200 % und steigert die Effizienz des automatischen Minings auf 60 % statt 50 %.";
	}, {
		Name = "Machina H\xF6chster Ordnung";
		Desc = "Verbessert das automatische Mining zum Abbau von TNT, erh\xF6ht die Effizienz auf 100 % statt 60 %, steigert deine Laufgeschwindigkeit um 500 % und verkauft deinen Rucksack automatisch bis zu dreimal t\xE4glich, wenn er voll ist.";
	}, {
		Name = "Inkarnierte Machina";
		Desc = "Verbessert das automatische Mining, um alle Legend\xE4ren+ Erze unabh\xE4ngig von der Entfernung abzubauen, und das Abbauen von TNT gew\xE4hrt dir alle Bl\xF6cke, die es explodieren l\xE4sst.";
	}, {
		Name = "F\xFCr Jede Eventualit\xE4t";
		Desc = "Verbessert das automatische Mining, um alle Erze von Ungew\xF6hnlich bis \xC4therisch sofort abzubauen, sofern du schnell genug bist, und baut TNT aus doppelter Entfernung ab.";
	}}, {{
		Name = "Malleus Relikt";
		Desc = "Das Malleus Relikt f\xFCgt eine Chance von {Boost_JackhammerChance} f\xFCr den Jackhammer hinzu.";
	}, {
		Name = "Malleus Erbst\xFCck";
		Desc = "Das Malleus Erbst\xFCck f\xFCgt eine Chance von {Boost_JackhammerChance} f\xFCr den Jackhammer hinzu.";
	}, {
		Name = "Malleus Chronomicon";
		Desc = "Das Malleus Chronomicon f\xFCgt eine Chance von {Boost_JackhammerChance} f\xFCr den Jackhammer hinzu.";
	}, {
		Name = "Malleus Erh\xF6ht";
		Desc = "Malleus Erh\xF6ht f\xFCgt eine Chance von {Boost_JackhammerChance} f\xFCr den Jackhammer hinzu.";
	}}, {{
		Name = "Exitium Erbst\xFCck";
		Desc = "Exitium Erbst\xFCck f\xFCgt eine Chance von {Boost_ExplosionChance} zur Explosion hinzu.";
	}, {
		Name = "Exitium Chronomicon";
		Desc = "Exitium Chronomicon f\xFCgt eine Chance von {Boost_ExplosionChance} zur Explosion hinzu.";
	}, {
		Name = "Exitium Erh\xF6ht";
		Desc = "Exitium Erh\xF6ht f\xFCgt eine Chance von {Boost_ExplosionChance} zur Explosion hinzu.";
	}}, {{
		Name = "Fodienda-Talisman";
		Desc = "Der Fodienda-Talisman erh\xF6ht deine Abbaureichweite um {Boost_MiningRange} Bl\xF6cke.";
	}, {
		Name = "Fodienda-Ring";
		Desc = "Der Fodienda-Ring erh\xF6ht deine Abbaureichweite um {Boost_MiningRange} Bl\xF6cke.";
	}, {
		Name = "Fodienda-Relikt";
		Desc = "Das Fodienda-Relikt erh\xF6ht deine Abbaureichweite um {Boost_MiningRange} Bl\xF6cke.";
	}, {
		Name = "Fodienda-Erbst\xFCck";
		Desc = "Das Fodienda-Erbst\xFCck erh\xF6ht deine Abbaureichweite um {Boost_MiningRange} Bl\xF6cke.";
	}, {
		Name = "Fodienda-Chronomikon";
		Desc = "Das Fodienda-Chronomikon erh\xF6ht deine Abbaureichweite um {Boost_MiningRange} Bl\xF6cke.";
	}, {
		Name = "Erh\xF6hte Fodienda";
		Desc = "Die Erh\xF6hte Fodienda erh\xF6ht deine Mining-Reichweite um {Boost_MiningRange} Bl\xF6cke.";
	}}, {{
		Name = "Fortuna-Ring";
		Desc = "Der Fortuna-Ring erh\xF6ht dein Gl\xFCck um {Boost_Luck}.";
	}, {
		Name = "Fortuna-Relikt";
		Desc = "Das Fortuna-Relikt erh\xF6ht dein Gl\xFCck um {Boost_Luck}.";
	}, {
		Name = "Fortuna-Erbst\xFCck";
		Desc = "Das Fortuna-Erbst\xFCck erh\xF6ht dein Gl\xFCck um {Boost_Luck}.";
	}, {
		Name = "Mutter Fortuna";
		Desc = "Mutter Fortuna erh\xF6ht dein Gl\xFCck um {Boost_Luck}.";
	}}, {{
		Name = "Nukleare Automaten-Artefakt";
		Desc = "Verringert die Abklingzeit von Sprengstoffen um {Boost_ExplosiveCooldownReduction}, solange du online bist.";
	}}, {{
		Name = "Nukleares Potentia-Erbst\xFCck";
		Desc = "Erh\xF6ht die St\xE4rke von Sprengstoffen um {Boost_ExplosiveRadius}.";
	}, {
		Name = "Nukleares Potentia-Chronomikon";
		Desc = "Erh\xF6ht die St\xE4rke von Sprengstoffen um {Boost_ExplosiveRadius}.";
	}}, {{
		Name = "Nucleus Simul – Das Finale";
		Desc = "Erh\xF6ht die St\xE4rke von Sprengstoffen um {Boost_ExplosiveRadius} und reduziert ihre Abklingzeit um {Boost_ExplosiveCooldownReduction}, solange du online bist. Kombiniert das Nukleare Automaten-Artefakt und das Nukleare Potentia-Chronomikon.";
	}}, {{
		Name = "Auctoritas-Relikt";
		Desc = "Das Auctoritas-Relikt erh\xF6ht deine Prestige-Tokens um {Boost_PrestigeTokens}.";
	}, {
		Name = "Auctoritas-Erbst\xFCck";
		Desc = "Das Auctoritas-Erbst\xFCck erh\xF6ht deine Prestige-Tokens um {Boost_PrestigeTokens}.";
	}, {
		Name = "Auctoritas-Chronomikon";
		Desc = "Das Auctoritas-Chronomikon erh\xF6ht deine Prestige-Tokens um {Boost_PrestigeTokens}.";
	}, {
		Name = "Auctoritas Transzendiert";
		Desc = "Auctoritas Transzendiert erh\xF6ht deine Prestige-Tokens um {Boost_PrestigeTokens}.";
	}}, {{
		Name = "Erz-Vulnus-Artefakt";
		Desc = "Dieses Accessoire baut alle Erze neben dem abgebauten Block ab, sofern du sie schnell genug abbauen kannst.";
	}}, {{
		Name = "Sinum-Ring";
		Desc = longstring1;
	}, {
		Name = "Sinum-Relikt";
		Desc = longstring1;
	}}, {{
		Name = "Ruptis-Artefakt";
		Desc = "Mit dem Ruptis-Artefakt gew\xE4hren Explosionen durch \xC4therische+ Erze alle Bl\xF6cke, die sie zerst\xF6ren.";
	}}, {{
		Name = "Mobilitas Ultima";
		Desc = "Das Abbauen eines Seltenen Erzes verursacht eine Explosion der St\xE4rke 6, eines Legend\xE4ren Erzes St\xE4rke 20 und eines Mythischen Erzes St\xE4rke 33. Du erh\xE4ltst alle Bl\xF6cke, die durch \xC4therische+ Erze explodieren, und das Abbauen von Smaragden verursacht eine Explosion der St\xE4rke 17. Dieses Accessoire vereint Ruber Chronomicon, Fragon Artifact, Bang Chronomicon und Ruptis-Artefakt.";
	}}, {{
		Name = "Magicae-Talisman";
		Desc = "Dieses Accessoire verleiht {Boost_LocalMagicPower} mehr Magiekraft als \xFCbliche Accessoires dieser Seltenheit.";
	}, {
		Name = "Magicae-Ring";
		Desc = "Dieses Accessoire verleiht {Boost_LocalMagicPower} mehr Magiekraft als \xFCbliche Accessoires dieser Seltenheit.";
	}, {
		Name = "Magicae-Relikt";
		Desc = "Dieses Accessoire verleiht {Boost_LocalMagicPower} mehr Magiekraft als \xFCbliche Accessoires dieser Seltenheit.";
	}, {
		Name = "Magicae-Erbst\xFCck";
		Desc = "Dieses Accessoire verleiht {Boost_LocalMagicPower} mehr Magiekraft als \xFCbliche Accessoires dieser Seltenheit.";
	}, {
		Name = "Magicae-Chronomicon";
		Desc = "Dieses Accessoire verleiht {Boost_LocalMagicPower} mehr Magiekraft als \xFCbliche Accessoires dieser Seltenheit.";
	}}};
	Blocks = {"Erde", "Sand", "Schlamm", "Lehm", "L\xF6ss", "Torf", "Kreide", "Kompost", "Kies", "Entisole", "Aridsole", "Inzeptisole", "Gelisole", "Jermanit", "Gepackte Erde", "Wurzeln", "Pilze", "Champignons", "Kartoffeln", "R\xFCben", "Pastinaken", "Ingwer", "Kurkuma", "Gophers Tunnel", "Maulw\xFCrfe", "Mollisole", "Zerbrochene Keramik", "Zeitkapsel", "Gepackter Schlamm", "Kompakter Schlamm", "Wasserablagerungs-Schlamm", "Pflanzenschlamm", "Rad", "Schlammstadt", "Schmutziger Schlamm", "Skelett", "Schatz", "Au\xDFerirdischer Schlamm", "Nokia", "Atomm\xFCll", "\xD6lvorkommen", "Motor\xF6l", "Pr\xE4historischer Schlamm", "Dichte Erde", "Knoblauch", "Radieschen", "Yucca", "Jicama", "Ameisen", "Insekten", "Jerusalem-Krickets", "Tausendf\xFC\xDFer", "Termiten", "Zerbrochene Waffen", "Alte M\xFCnzen", "Pfeilspitzen", "Knochen", "Alte Artefakte", "Schlamm", "Grasiger Boden", "Pilzboden", "Umgepfl\xFCgter Boden", "Bewurzelter Boden", "Infizierter Boden", "Sonnenbeschienener Boden", "Baumwurzelboden", "M\xFCll-infizierter Boden", "Mega Erde", "Spinnen-Nest Boden", "Gummientenboden", "Papierboden", "Paketsboden", "Stein", "Feuerstein", "Kalkstein", "Dolomit", "Travertin", "Tuff", "Oolith", "Breccie", "Konglomerat", "Caliche", "Sandstein", "Siltstein", "Diatomit", "Salzstein", "Kristall", "Tiefes Gras", "Totes Gras", "Nasses Gras", "Fruchtbares Gras", "Fleckiges Gras", "Gefrorenes Gras", "Rissiges Gras", "Falsches Gras", "Bewurzeltes Gras", "Ges\xE4tes Gras", "Au\xDFerirdisches Gras", "Mondgras", "Wurmgras", "Ber\xFChrtes Gras", "Krater", "Gepackter Stein", "Marmor", "Novakulit", "Quarzit", "Skarn", "Gneis", "Amphibolit", "Hornfels", "Schiefer", "Glimmerschiefer", "Phyllit", "Seifenstein", "Anthrazit", "Mariposit", "Verdite", "Lapis Lazuli", "Gras", "Fescue", "Geldkraut", "Queckengras", "G\xE4nsefu\xDF", "Grasfleck", "Dallisgras", "Schachtelhalm", "Italienisches Wei\xDF", "Malve", "Hexengras", "Gundermann", "Junge Pflanze", "Schafgarbe", "L\xF6wenzahn", "Vierbl\xE4ttrige Kleebl\xE4tter", "Dichter Stein", "Diorit", "Andesit", "Rhyolith", "Granit", "Pegmatit", "Gabbro", "Diabas", "Basalt", "Plagioklas", "Diatzit", "Stealth-Kupfer", "Tuff", "Bastneasit", "Feueropal", "Himmel", "Wei\xDFe Wolke", "Hellgraue Wolke", "Dunkelgraue Wolke", "Flugzeug", "Drachen", "Vogel", "Privatjet", "Wetterballon", "Hubschrauber", "Luftschiff", "Milit\xE4rhubschrauber", "Gewitter", "Tornado", "Vulkan", "Obsidian", "Salaxum", "Baxerit", "Suprecerese", "Fahrbarer Salaxum", "Deconogaron", "Bauxit", "Scriolin", "Peragomit", "Muosic Obsidian", "Lascero Lamenta", "Regenbogen-Obsidian", "Xenotim", "Monazit", "Hoher Himmel", "Jet-Spuren", "Sonnenstrahlen", "D\xFCnne Wolken", "Drohne", "Mega-Wolke", "Neblige Atmosph\xE4re", "Fallender Weltraumschrott", "Sonnenfinsternis", "Rakete", "UFO", "Nordlicht", "Leuchtende Wolken", "Himmel", "Geschmolzener Obsidian", "Silia", "Emberium", "Flammenwesen", "Shimicala", "Graeconogaron", "Geris", "Pyrrhomomit", "Dotorit", "Centromodor", "Vaporeyester", "Blazestein", "Terracit", "Magmaium", "Weltraum", "Roter Stern", "Oranger Stern", "Die Sonne", "Meteorit", "Asteroid", "Mond", "Zwergplanet", "Satellit", "Planet", "Komet", "Planetenring", "Die ISS", "Oumuamua", "Lava", "Verst\xE4rkter Basalt", "Bimsstein", "Bims", "Feste Lava", "Divenestium", "Stellan", "Byrrzom", "Xapotot", "Gnixon", "Polonit", "Herz des Feuers", "Eingebettete Sonne", "H\xF6lle", "Radioaktiver Stein", "Uran", "Uranit", "Gamith", "Moptazik", "Paretium", "Limioaktiv", "Ratiteium", "Zoniumit", "Whihite", "Adsimit", "Prenium", "Legenium", "Limonion", "Toxischer Obsidian", "Zersto\xDFener Fels", "\xD6labfall", "Harter Kern", "Zerbrochene Knochen", "K\xFCnstlicher W\xFCrfel", "Rissiger Abfall", "Pr\xE4historischer Pflanzenrest", "Lava-Splitter", "Geschmolzene Tr\xFCmmer", "Roter Beryll", "Painit", "Altes Werkzeug", "Sonnenkristall", "Hyperkomprimierter Abfall", "Frostabfall", "Giftige Lava", "Thorium-Dioxid", "Silizium", "Turbulente Asche", "Pyroklast", "Strahlenbelasteter Dazit", "Topzit", "Kobalt", "Versteinerte Wavellit", "Tiefer Boden", "Deformierter Nephrit", "Legrandit", "Toximit", "Polonium", "Astatin", "Kochende Lava", "Aluminium", "Fulocit", "Telbar", "Quecksilber", "Phigarium", "Rizufid", "Jagdite", "Yulacit", "Vaxium", "Farlicin", "Derilium", "Birucit", "Sacreoxyn", "Wasecraesiel", "Der Leviathan-Kristall", "\xC4u\xDFerer Kern", "Riljud", "Carzyum", "Selorus", "Foxrophin", "Incindirum", "Ektoplasma", "Safran", "Subsinite", "Aluhargium", "Parchium", "Zanforn-88", "Tarrulum", "K4R-UL-1UM", "Jyrulphasion", "Element TON-618", "Mittlerer Kern", "Soultriek", "Rejewel", "Jokerium", "Unreiner Wasserstoff", "Darnit", "Aethernum", "Macabrium", "Aunolit", "Fernokajin", "Netherit", "Dicht gepacktes Nickel", "Seltsame Legierung", "Geschm\xFCckte Lamenta", "Kobalt-Thorium G", "Fingerit-Reste", "Innerer Kern", "Schimmerndes Eisenerz", "Oxygenanium", "Schimmerndes Silbererz", "Komprimierter Wasserstoff", "Lavanium", "Meltor", "Glimmerium", "Grainium", "Primorischer Fels", "\xDCberglimmernde Vulkanasche", "Magmorthum", "Normalium", "Legierungserz", "Das Zentrum", "Unm\xF6gliches Plasma", "Tiefenraum", "Dunkle Materie", "Schwarzes Loch", "Planetare Reste", "Galaxie", "Sternreste", "Arkanum", "Neutronenstern", "Galaktischer Opal", "Metelum", "Abtr\xFCnniges zivilisiertes Objekt", "Skrep", "Gr\xFCner Komet", "Litorp", "Mikrospobische Speck", "Schwarzer Zwerg", "Wei\xDFes Loch", "Quasi-Stern", "Mondstein", "Lunarium", "Mondkristalle", "Selene-Erz", "Lunarit", "Sternenstaubkristall", "Himmelskristall", "Lunaris-Erz", "Astralium", "Mondseele", "Lunaramethyst", "Lunarit-Essenz", "Lunarflammen-Erz", "Mondschattenkristall", "Lunarisium", "Solarmond-Essenz", "Todesstern", "Asteroideng\xFCrtel", "Basaltst\xFCck", "Celestium-Erz", "Nickelnugget", "Meteoroid", "Kobaltader", "Platinfragment", "Iridiumcluster", "Meteor-Perle", "Xenonkristall", "Leerenkristall", "Gravitonium", "Kosmischer Kern", "Sternrubin", "Singularit\xE4tsstein", "Landschaft", "Atmosph\xE4renkonzentrator", "Sande der Zeit", "Reines hyperkomprimiertes Neutronium", "Plasmakern", "Subraum-Tripmine", "Chronos", "Viele Nachthimmel", "Chromalit", "Thunderium", "Seraph", "Lavaspite", "Drachenglas", "Leerestein", "Zycrit", "Draconium", "Gefrostete Diamanten", "Flammender Hass", "Wijkuled", "Gustavon", "Geschmolzener Splitter", "Blazeglas", "H\xF6llenstrafe", "Astralfeuer", "Rohoccaim", "Pyrit", "Sonnenstein", "Brennende Erinnerung", "Rissiger geschmolzener Rubin", "Verzerrung", "Radium", "Oganesson", "Kryptonit", "Ewudojjed", "Handy", "Schaltkreis", "Actinium", "Plutonium", "Thorium", "Tscherenkov-Kristall", "Station\xE4r", "Uranhexafluorid", "Plasma", "Seelensand", "Zefendit", "Ignisaxum", "Arktischer Frost", "Gasf\xF6rmiges Eisen", "Dorniger Bl\xFCtenstein", "Feuerspinne", "Ulewuthaim", "Gefallener Stern", "Kyawthuit", "Uru", "Koiksxolaim", "Arras", "Anomalie", "Farb-Overdrive", "Kuppel", "Aetherium-Kristall", "Gesegnetes Erz", "Celestium", "Gefesselter Teufel", "Binar-Datakristall Berechnen", "Fl\xFCchtige Hoffnung Finale", "Galaxium", "Eternium", "Genesium", "Graustufen-Schwert und die Sterne", "Lavaxite-Prisma", "Plasmafeuer", "Waterium-Anker", "TURMOILED", "Toerium", "Thefaimnilnilnil", "Tesserakt-Kern", "Nocturnis", "Antike Energie", "Brennende Entit\xE4t", "Kometium", "Null", "Gideon", "Linienstein", "Trianglium", "Quadratit", "Kreisit", "Kiteanium", "Ovalium", "Trapezid", "Oktagonium", "Pentagrium", "Hexagrit", "Crosilit", "Loveilit", "Snowtanium", "Cindrillium", "Wedgilit", "Spherit", "Pi-Circumferencium", "Sternlicht", "Trishatterit", "Geometrilekenischer Kern", "N-Gon", "Eclipsera", "Iridanyt", "Starsearit", "Gravonyx", "Solenyt", "Eclipseron", "Schrottpyx", "Noctyrit", "Kosmaril", "Umbryx", "Astralyt", "\xC4therion", "Aeronyx", "Nimbryl", "Solarium-Erz", "Zephyrosit", "Tempestralith", "Stratonium", "Breezium", "Ventryx", "Voltazit", "Celestara", "Skynexium", "Verdanyt", "Florazit", "Elarion", "Sylvanyth", "Xylogranit", "Ambryth", "Druanit", "Terravin", "Gaialit", "Claythium", "Loamyx", "Sedryx", "Rubrath", "Shalorit", "Terralyt", "Myrstein", "Tynarit", "Geodyn", "Aurivin", "Terrakron", "Gravellium", "Ferronyx", "Crimora", "Amarion", "Compaxit", "Bronzium", "Slathem", "Rubrasyt", "Obryx-Opal", "Obdurium", "Argenyx", "Onythera", "Rubraxis", "Noctyra", "Umbrosit", "Plumbryn", "Malacit\xE4a", "Saphyros", "Drakonyx", "Lithyrium", "Zyntherium", "Topazryn", "Hemovyr", "Volkarion", "Tungryth", "Jadyx", "Garnyros", "Nihytrit", "Chasmite", "Volcrys", "Obrythit", "Pyrelith", "Ignarion", "Magmoryx", "Flarekristall", "Radionyx", "Uvyrit", "Venomyth", "Korrosyt", "Scaldyrium", "Korethium", "Magnyt", "Pyrothyst", "Infernox", "Ignirion", "Deephyros", "Solaryx", "Magmyra", "\xC4onenstahl", "Nyxium", "Nebryx", "Kosmyth", "Lunarisit", "Selestium", "Celesthyn", "Rektit", "Kalzynit", "Venusstein", "Sulvaris", "Bl\xFChquarz", "Venit", "Verbranntes Glas", "Erosin", "Bernadernaderz", "Fumaritperle", "Venerianisches Orixio", "Karmesinroter Heiligenschein", "Valenit", "Aschblumenstein", "Shythereon", "Vergoldete Vapora", "Seraphisches Glas", "Venalicht", "Aurischer Flammensplitter", "Eclipsera-Edelstein", "Solenvy", "Dornenheiliger Schein", "Astrale Ader", "Tartarium", "Merkurstein", "Ferrit", "Aschener Goethe", "Mercyrosit", "Verbrannter Basalt", "Eminescu", "Cindermark-Erz", "Volcaryn", "Abedin-Krater", "Flarestahl", "Radiolyt", "Ignilit-Ader", "Auralith", "Sonnenfeuerglas", "Caloris-Becken", "Koronathium", "Vulkanit Prime", "Rembrandt-Becken", "Heliarchit", "Tolstoj", "Reinhardt-Kern", "Stilbon", "Sonnenoberfl\xE4che", "Protuberanz", "Glutfunkenglas", "Sonnenasche", "Koronales Loch", "Photosph\xE4re", "Chromosph\xE4re", "Photonyx", "Thermitader", "Sonnenschleier-Quarz", "Ignissplitter", "Heliosstaub", "Solaris-Kernstein", "Glutfunkengem", "Auraflammen-Legierung", "Prometheon", "Strahlendes Solinium", "Aurora-Pyrit", "Krone der D\xE4mmerung", "H\xF6llenprisma", "Flare", "Ewige Sonnenflamme", "Beethovens Stille", "Dort hinten, Benjamin", "110011 1010010 1010010 110000 1010010 101110 110100 110000 110100", "Prismatischer Quasar", "Ummh\xFCllt von Leiden", "Jacobs Abstieg in die Ewigkeit", "ΒΞDRΩCK", "fαтє", "Das Schicksal marschiert, wie jeder Mann", "E̶͐́l̸̆̊ė̷͙p̷͒̍h̷͂͝ǎ̴̿n̶̛t’s Fu\xDF", "αи∂яσмє∂α", "Monokritischer Abgrund", "Blicke jenseits des   ̶C̶U̶R̶T̶A̶I̶N̶  Infernos", "你聽到了嗎？？？？？？？？？", "Der G\xF6tze der Geometrischen Mathematik", "Sonnenader", "Reine G\xF6ttlichkeit", "Alternierende Ebene", "TUDOL", "Sonnenkern", "Unterirdischer Wasserstoff", "Kernkorn", "Sonnenschlacke", "Quadium-Wasserstoff", "Tachokline", "Helionglas", "Plasmirum", "Irradit", "Photovit", "Helikorit", "Sternenknochen", "Inferniumlegierung", "Solatrix", "Luminforge-Kristall", "Coronaith", "Vermion", "Pyroseelen-Edelstein", "Stellarium", "Gemisis", "Sonnenherz", "Dimensionale Objekte", "Ultimatum", "Reine Sanctarit", "Hsixia", "TERRARVM", "Odyssee", "Im Himmel gefertigt", "Ballics Zorn", "Φοβος", "Apocrypha", "\xDCberrationales Zeichen", "Fasaria", "→ Aurora ⇋ Das ⇋ Finale ←", "《『R』『E』『V』『E』『L』『A』『T』『I』『O』『N』》", "Ex Machina Vorletzte", "『Ｉｎｄｅｘ』『Ｄｅｉ』『ｌａｔｅｎ』", "Marsstein", "Rostgestein", "Staubgebundenes Erz", "Roter Stein", "Gravellit", "Ferrinit", "Aschenplatte", "Terraklin", "Oxidulit", "Martisches Glas", "Purpurlegierung", "Roubion-Kern", "Volkarit", "Sangrelit", "Eisenschattenkristall", "Mars-Seelenstein", "Staubgeschmiedeter Titanit", "Roter Bebenrubin", "Areskern", "Zinnoberroter W\xFCrfel", "Boreales Wasser", "Deimos-Seraphit", "Phobos", "JeremyDevs", "『Ｏｎｃｅ』『Ｂｙ』『Ｈｕｍａｎ』", "Jupitergas", "Komprimierter Wasserstoff", "Jupitergestein", "Metallischer Wasserstoff", "Gefangener Sturm", "Drucknebel", "Ionisierter Wasserstoff", "Geladenes Ammoniak", "Auroraschweif", "Zyklondampf", "Methanische Woge", "Abgest\xFCrzte Sonde", "Jovianische Essenz", "Jupiterstation", "Sturmgebundenes Plasma", "Gro\xDFer Roter Dampf", "Gro\xDFe Auroren", "Europa", "Zeus’ Herrschaft", "Konvergenz", "Verzauberung", "Kosmische Satelliten", "Athanatos", "Saturngas", "Heliumdrift", "Kalte Ringe", "Goldener Dunst", "Ringgeboren", "Gefrorenes Ammoniak", "Kryo-Nebel", "\xC4u\xDFerer Ringfelsen", "Druckseide", "Ringsturm-Wolke", "Methanschleier", "Karma & Zeit", "Ringlicht-Essenz", "Kronos", "Stiller Sturm", "Saturnkrone", "Goldener Jetstrom", "Davids Erz", "Stern von Remphan", "Uralte Atmos", "Monochrome Dichte", "Polychrome Dr\xE4hte", "Titanos-Kern", "Vorrichtung", "Schrottpanzerung", "Eisenverkabelung", "Rostgebundene Legierung", "Zahnradstein", "Schaltkreis-Erz", "Stahlgitter", "Pulsleitung", "Mechasil", "Logikkristall", "Servokern", "Bin\xE4rlegierung", "Neuronale Matrix", "Chronozahnrad", "Synthetischer Seelenstein", "Planetentriebwerksfragment", "Omnicore-Legierung", "Machina-Herzstahl", "Deus Mechanica", "Singularit\xE4tsprozessor", "Axiom-Motor", "Ghostcode-Prisma", "Die Prim\xE4rdirektive", "Uranusgas", "Blasses Methan", "Gefrorener Dampf", "Wolkendrift", "Gletschernebel", "Eiswirbel", "Kryoschleier", "Blauer Dunst", "Geneigter Fluss", "Polarzittern", "Methan-Frostschleier", "Gefrorener Jetstrom", "Aurorastrom", "Schimmernder Frostwind", "Stiller Zyklon", "Titanische Brise", "\xC4therische Spirale", "Gefrorener Halo", "Himmlische K\xE4lte", "Ureisschloss", "\xC4theralit\xE4t", "\xC4thernebel", "Uranuskern", "『Dʏꜱꜰᴜɴᴄᴛɪᴏɴᴀʟ』『Aʙᴇʀʀᴀᴛɪᴏɴ』", -- : First try: K:0: attempt to index nil with 't'
;
	Explosives = {"Dynamit", "Bombe", "C4", "TNT", "Rakete", "Atombombe", "Zar-Bombe", "Neutronenbombe", "Antimateriebombe"};
	Leaderboards = {"Meistes Geld", "Meiste abgebauten Bl\xF6cke", "Meiste Spielzeit", "Meiste entdeckte Bl\xF6cke", "Meiste Prestige-Level", "Meiste Prestigepunkte", "Am meisten Robux ausgegeben"};
	Gamepasses = {
		x2Cash = "2x Geld";
		x2CashDesc = "Verdoppelt alle deine Geldeinnahmen";
		x2Emerald = "2x Smaragd";
		x2EmeraldDesc = "Verdoppelt die Smaragde, die du aus Smaragd-Erz erh\xE4ltst";
		SharperPickaxes = "Scharfere Spitzhacken";
		SharperPickaxesDesc = "Alle Spitzhacken sind 10% st\xE4rker";
		x2PickaxePower = "2x Spitzhacken-Power";
		x2PickaxePowerDesc = "Verdoppelt die St\xE4rke aller Spitzhacken";
		x2MiningSpeed = "2x Abbaugeschwindigkeit";
		x2MiningSpeedDesc = "Verdoppelt deine Abbaugeschwindigkeit";
		x2Storage = "2x Rucksackplatz";
		x2StorageDesc = "Verdoppelt den Rucksackplatz";
		InfiniteBackpack = "Unendlicher Rucksack";
		InfiniteBackpackDesc = "Dein Rucksack hat jetzt unendlichen Platz";
		Teleporter = "Teleporter";
		TeleporterDesc = "Gibt dir einen Teleporter, den du \xFCberall platzieren kannst, um jederzeit hin zu teleportieren. Lobby-Teleports sind kostenlos.";
		VIP = "VIP";
		VIPDesc = "Schaltet einen exklusiven VIP-Spitzhacke, Rucksack und Chat-Tag frei. Au\xDFerdem erh\xE4ltst du mehr Smaragde bei K\xE4ufen.";
		x2Speed = "2x Geschwindigkeit";
		x2SpeedDesc = "Du l\xE4ufst doppelt so schnell";
		x2Jump = "2x Sprungkraft";
		x2JumpDesc = "Du springst doppelt so hoch";
		Jetpack = "Jetpack";
		JetpackDesc = "Schaltet das Jetpack frei, damit du fliegen kannst";
		MoreRange = "Mehr Reichweite";
		MoreRangeDesc = "Erh\xF6ht die Abbaureichweite um +5 Bl\xF6cke";
	};
	Quests = {"Grabe {1} {2}", "Grabe {1} {2} Bl\xF6cke", "Grabe {1} Bl\xF6cke", "Baue {1} Erze ab", "Grabe bis zur Tiefe {1}", "R\xFCste Spitzhacke #{1} oder besser aus", "R\xFCste Rucksack #{1} oder besser aus", "Benutze {1} Sprengstoff"};
	TranslatorSettings = {
		Locale = "de";
		Seperator = ' ';
		Decimal = ',';
		TimeAbbreviations = {'s', 'm', 'h', 'd', 'y'};
		Translator = 876723688;
	};
}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Translator.russian
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:54
-- Luau version 6, Types version 3
-- Time taken: 0.053511 seconds

local longstring1 = "Аксессуар Радар указывает вам на ближайшие легендарные+ руды в пределах {Boost_RadarRadius} блоков."
local longstring2 = "Этот аксессуар увеличивает вместимость рюкзака на {Boost_BackpackSpace} и даёт {Boost_LocalMagicPower} дополнительной магической силы по сравнению с обычными аксессуарами этой редкости."
local longstring3 = "Этот аксессуар даёт {Boost_LocalMagicPower} дополнительной магической силы по сравнению с обычными аксессуарами этой редкости."
return {
	Main = {
		Cash = "Деньги";
		BlockCount = "{1}/{2} Блоков";
		BlockCountUnlimited = "{1} Блоков";
		EnableJetpack = "Включить Джетпак";
		DisableJetpack = "Выключить Джетпак";
		ToSurface = "На Поверхность";
		Backpack = "Рюкзак";
		Index = "Индекс";
		Settings = "Настройки";
		ReloadChunks = "Перезагрузить Чанки";
		Placing = "Ставлю {1}";
		Unbreakable = "Неуязвимый";
		BackToMining = "Обратно К Добыче";
		SearchBlocks = "Поиск Блоков...";
		Place = "Поставить";
		Lock = "Заблокировать";
		Unlock = "Разблокировать";
		BackpackFull = "Рюкзак Полный";
		BackpackFullMessage = "Вы полностью заполнили свой рюкзак и не можете добывать, пока не продадите, не разместите блоки или не улучшите свой рюкзак.";
		Sell = "Продать";
		Upgrade = "Прокачать";
		BlocksDiscovered = "{1}/{2} Блоков Найдено(+{3}% Денег)";
		IndexLayer = "{1} | {2} для {3}";
		IndexLayerNoUp = "{1} | {2} и больше";
		IndexLayerNoDown = "{1} | {2} и меньше";
		BaseValue = "Начальная Ценость: <font color=\"#00FF00\">${1}</font>";
		CurrentValue = "Текущая Ценость: <font color=\"#00FF00\">${1}</font>";
		Durability = "Прочность";
		Rarity = "Редкость";
		ProbabilityToSpawn = "Вероятность появления:1 на {1} Блоков";
		IndexCredit = "Блокировать от";
		Loading = "Загрузка";
		TotalMined = "Всего Скопано";
		Back = "Назад";
		On = "Включить";
		Off = "Выключить";
		TimePlayed = "Время Наиграно";
		Blocks = "Блоки";
		Shop = "Магазин";
		ComingSoon = "Скоро Будет...";
		Buy = "Купить";
		Bought = "Купил";
		Max = "Макс";
		Gift = "Подарок";
		Gamepasses = "Игровые пропуска";
		Owned = "В собственности";
		OwnedByRecipient = "Принадлежит получателю";
		StopGift = "Прекратить дарение";
		NoGifts = "В настоящее время на этом сервере нет никого, кого можно подарить.";
		EnterUsername = "Введите здесь имя пользователя";
		Emeralds = "Изумруды";
		MostPopular = "САМЫЙ ПОПУЛЯРНЫЙ";
		BestOffer = "ЛУЧШЕЕ ПРЕДЛОЖЕНИЕ";
		TeleportRequest = "Запрос на Телепортацию";
		TeleportRequestMessage = "Ваш друг {1} обратился за помощью, хотели бы вы, чтобы вас перевезли к ним?";
		No = "Нет";
		Yes = "Да";
		Upgrades = "Прокачки";
		Pickaxes = "Кирки";
		Backpacks = "Рюкзак";
		Close = "Закрыть";
		Equip = "Надеть";
		Equipped = "Надето";
		BuyWithCash = "Купить (${1})";
		Power = "Сила";
		Storage = "Место";
		Prestige = "Престиж";
		Prestiges = "Престижи: {1}";
		PrestigeCashBoost = "Увеличение наличности: {1} → {2}";
		PrestigeWithCash = "Престиж (${1})";
		UpgradeWithEmerald = "Улучшить ({1} Изумруд)";
		LobbyTeleport = "Телепорт в вестибюле";
		LobbyAt = "Лобби на глубине {1}";
		Teleport = "Телепорт";
		UnlockFreeTeleports = "Разблокировать бесплатные телепорты";
		PrestigeTokens = "Жетоны престижа";
		Quests = "Квесты";
		QuestDisplay = "{1}/{2} ({3}%)";
		Completed = "Завершено";
		GroupBonus = "Присоединяйтесь к Jeremy Studio и получите на 50% больше денег, поставив лайк игре!";
		Tutorial = "Учебник";
		TutorialText = "Добро пожаловать! Есть много блоков, которые нужно открыть, чтобы начать добычу, нажмите или удерживайте любой блок, который вы хотите добывать. Каждый блок дает разную сумму денег при продаже, но вы можете иметь только ограниченное количество блоков одновременно. Есть много разных слоев блоков, каждый из которых содержит разные руды над и под землей.";
		Ok = "Хорошо";
		Luck = "Удача";
		Jackhammer = "Отбойный молоток";
		TooWeak = "Слишком слабо";
		Explosion = "Взрыв";
		Jump = "Прыжок";
		Pickaxe = "Кирка";
		Speed = "Скорость";
		LikeTheGame = "ПОНРАВИЛАСЬ ИГРА — ЛАЙКНИ!";
		ForRewards = "ЗА НАГРАДЫ!";
		Range = "Дальность";
		Crafting = "Крафтинг";
		MetaGain = "Получай больше Меты за потраченные Robux. Текущий прирост: {1} → {2} Меты за блок";
		Meta = "Мета";
		MetaUnlock = "Разблокировать за {1}";
		Level = "Уровень";
		Levels = "Уровни";
		EmeraldUpgrades = "Изумрудные улучшения";
		AFKMessage = "Тебя будут автоматически переподключать каждые 17 минут, чтобы ты не был кикнут за AFK.";
		FriendMultiMessage = "Приглашай друзей, чтобы усилить силу кирки!";
		NoFriendsHere = "Здесь нет друзей. За каждого друга на сервере ты получаешь +10% силы кирки!";
		FriendMulti = "Текущий множитель от друзей:\n+{1}% силы кирки";
		Auto = "Авто";
		Pinned = "Закреплено";
		Unequip = "Снять";
		Pin = "Закрепить";
		Unpin = "Открепить";
		MaxPins = "Макс. закреплений";
		MagicPowerInfo = "Магическая сила даётся от аксессуаров, которые вы сейчас носите. Она делает вас сильнее различными способами.";
		Craft = "Создать";
		CraftNotification = "Вы можете создать {1} сейчас!";
		PrestigeNotification = "Теперь вы можете совершить Престиж!";
		NoReset = "Сброс невозможен";
		Sacrifice = "Жертвоприношение";
		SacrificeMessage = "Жертвоприношение сбрасывает то же самое, что и Престиж, но вы можете сделать это раз в час без выполнения денежного требования! Вы получите {1} Престиж-токенов за это Жертвоприношение.";
		Wait = "Ждать";
		ArchivedBlocks = "Архивированные блоки";
		CraftingRecommendation = "Настоятельно рекомендуется создать {1} раньше всего остального!";
		DisableFastFall = "Отключить быстрое падение?";
		Claim = "Забрать";
		Showcase = "Витрина";
		TotalValue = "Общая Стоимость";
		YourPlacement = "Ваше Место";
		Top100 = "Топ 100";
		Or = "ИЛИ";
		MetaUnlockProgress = "{1}/{2} Потрачено";
		PrestigeMessageFree = "С престижем вы можете обменять деньги на жетоны престижа и бонус к деньгам.";
		PrestigeMessageFreeTokens = "С престижем вы можете обменять деньги на {1} жетонов престижа и бонус к деньгам.";
		PrestigeMessageFreeDaily = "Престиж сбрасывает кирки, рюкзаки, деньги и блоки, но дает бонус к деньгам и {1} жетонов престижа, если только вы не подождёте {2}, тогда будут сброшены только деньги.";
		BuyAll = "Купить Всё";
		Cooldown = "Перезарядка";
		IndexSecretLayer = "Секретный | Везде";
		BlockRewards = "Нравятся руды? Вы можете заработать 750 изумрудов за каждую руду до мифической включительно или 3 000 изумрудов за каждую руду уровня Эфирный+ добавленную в игру. Отправляйте свои руды на сервер Discord, указанный в описании игры.";
		LeaderboardProgress = "Вы входите в Топ {1}";
		BlockTagged = "Блок добыт игроком {1}";
		Trading = "Торговля";
		LagMessage = "Если у вас возникают лаги, рекомендуется уменьшить дальность прорисовки в меню настроек.";
		TutorialText2 = "Добро пожаловать! Удерживайте любой блок, чтобы начать добычу. Более редкие блоки продаются за большее количество денег. Существует множество слоёв выше и ниже земли с гораздо более ценными блоками. Их лобби имеют уникальные улучшения.";
		TutorialText3 = "Добро пожаловать! Удерживайте любой блок, чтобы начать добычу. Более редкие блоки продаются за большее количество денег. Существует множество слоёв выше и ниже земли с гораздо более ценными блоками. Их лобби имеют уникальные улучшения. Играйте достаточно долго, и вы сможете добывать 2000 блоков в секунду!";
		Undiscovered = "Не обнаружено";
		PrestigeMessage = "Престиж сбросит ваши Кирки, Рюкзаки, Деньги и Блоки, но вы получите Денежный Бонус и {1} Престижных Жетонов";
		PrestigeMessageBetter = "Престиж сбрасывает только Кирки, Рюкзаки, Деньги и Блоки, но вы получите Денежный Бонус и {1} Престижных Жетонов. <font color=\"#ff0000\">Ничего другого сброшено не будет! Делая Престиж, вы будете прогрессировать намного быстрее.</font>";
		PrestigeMessageEthereal = "Престиж сбросит ваши Кирки, Рюкзаки, Деньги и Блоки <font color=\"#ff0000\">(Кроме Ethereal+ Блоков!)</font>, но вы получите Денежный Бонус и {1} Престижных Жетонов";
		PrestigeMessageBetterEthereal = "Престиж сбрасывает только Кирки, Рюкзаки, Деньги и Блоки <font color=\"#ff0000\">(Кроме Ethereal+ Блоков!)</font>, но вы получите Денежный Бонус и {1} Престижных Жетонов. <font color=\"#ff0000\">Ничего другого сброшено не будет! Делая Престиж, вы будете прогрессировать намного быстрее.</font>";
	};
	Tips = {
		MiningAbilityInactive = "Совет: Сильные способности к добыче не активны рядом со спавном!";
		CraftingNote = "Аксессуары, которые вам слишком трудно создать, скрыты. Станьте сильнее и получите больший рюкзак, и они откроются.";
		TradingNote = "Блоки, которыми вы торгуете, будут заархивированы и не смогут быть проданы за деньги, но могут использоваться для крафта!";
	};
	Upgrades = {
		BuyAll = "Разблокировать Купить все";
		KeepBackpack = "Уровень рюкзака для сохранения престижа";
		MorePickaxePower = "Больше мощности кирки";
		MoreCash = "Больше наличных";
		JackhammerChance = "Шанс отбойного молотка";
		JackhammerRadius = "Радиус отбойного молотка";
		JackhammerSize = "Размер отбойного молотка";
		MiningSpeed = "Скорость добычи";
		MiningFrenzy = "Азарт добычи после нахождения эпического блока";
		ExplosionChance = "Шанс взрыва";
		ExplosionRadius = "Радиус взрыва";
		TNTLuck = "Удача с динамитом";
		MiningRange = "Дальность добычи";
		MiningRange2 = "Дальность добычи 2";
		UnlockCrafting = "Разблокировать крафтинг";
		MoreAccessorySlots = "Больше слотов для аксессуаров";
		MoreMeta1 = "Больше Меты 1";
		MoreMeta2 = "Больше Меты 2";
		MoreMetaBlocksMined = "Больше Меты на основе добытых блоков";
		MoreLuck = "Больше Удачи";
		MoreRange = "Больше Дальности";
		DuplicateBlocks = "Шанс Дублирования Блоков";
		WalkSpeed = "Больше Скорости Ходьбы";
	};
	UnlockMessages = {
		Prestiges = "Открывается при {1} престижах";
	};
	Rarity = {"Обычный", "НеОбычный", "Редкий", "Эпический", "Легендарный", "Мифический", "эфирный", "Небесный", "Зенит", "Божественный", "ноль"};
	Settings = {
		Low = "Высокое качество";
		LowDesc = "Все основные блоки слоя будут отображаться в высоком качестве, это может вызвать сильное отставание";
		RenderDistance = "Расстояние рендера";
		RenderDistanceDesc = "Измените количество чанков, которые вы можете видеть в каждом направлении";
		Teleport = "Телепортация";
		TeleportDesc = "Друзьям, которых вы пригласите, будет предложено телепортироваться в ваше текущее местоположение";
		Music = "Музыка";
		MusicDesc = "Переключает, должна ли музыка воспроизводиться или нет";
		FastFall = "Быстрое падение";
		FastFallDesc = "Вы будете телепортированы на дно ямы при падении на определенное время";
		x2Speed = "2x Скорость";
		x2SpeedDesc = "Переключает, чтобы вы шли в два раза быстрее, чем обычно";
		x2Jump = "2x прыжок";
		x2JumpDesc = "Переключает, чтобы вы прыгали в два раза выше, чем обычно";
		Reload = "Перезагрузить фрагменты";
		ReloadDesc = "Вы можете перезагрузить все блоки в случае возникновения сбоев";
		FastFly = "Быстрый Полёт";
		FastFlyDesc = "Вы будете телепортированы в самую высокую точку при использовании реактивного ранца в течение определённого времени";
		DarkLighting = "Тёмное освещение";
		DarkLightingDesc = "Переключает тёмное освещение";
		FriendMarkers = "Метки друзей";
		FriendMarkersDesc = "Переключает видимость твоих друзей";
		BreakingSprites = "Спрайты разрушения";
		BreakingSpritesDesc = "Переключает видимость спрайтов разрушения во время добычи блоков";
		JumpJetpack = "Прыжковый Джетпак";
		JumpJetpackDesc = "Вы будете автоматически использовать джетпак при прыжке";
		Sounds = "Звуки";
		SoundsDesc = "Включает или отключает воспроизведение звуков";
		ChatTags = "Теги чата";
		AutoRender = "Авто-рендер";
		AutoRenderDesc = "Автоматически снижает дальность прорисовки при обнаружении лагов";
		BlockStepping = "Шаг по блокам";
		BlockSteppingDesc = "Вы автоматически поднимаетесь на блоки";
	};
	ChatMessages = {
		BlockFound = "{1} Нашёл {2}";
		MultipleBlocksFound = "{1} Нашёл {2} {3}";
		OreFound = "{1} Нашёл {2} ({3}) в Слое{4} (1 на {5} Блоков)";
		OreFoundShort = "{1} Нашёл {2} (1 на {3} Блоков)";
		MultipleOresFound = "{1} Нашёл {2} {3} ({4}) в Слое {5} (1 на {6} Блоков)";
		YouBlockFound = "Ты Нашёл {1}";
		YouMultipleBlocksFound = "Ты Нашёл{1} {2}";
		YouOreFound = "Ты Нашёл {1} ({2}) в Слое{3} (1 на {4} Блоков)";
		YouOreFoundShort = "Ты Нашёл {1} (1 на {2} Блоков)";
		YouMultipleOresFound = "Ты Нашёл {1} {2} ({3}) в Слое {4} (1 на {5} Блоков)";
		TeleporterDestroyed = "Ваш телепорт был уничтожен, потому что на него был помещен блок";
		MiningFrenzy = "Азарт добычи активирован! Теперь ты копаешь на {1} быстрее и наносишь на {2} больше урона в течение 1 минуты!";
		LikeGoalReached1 = "Цель по лайкам достигнута. +25% к скорости добычи и +25% к урону на следующие {1} минут(ы).";
		LikeGoalReached2 = "Цель по лайкам достигнута. +25% к деньгам и +25% к урону на следующие {1} минут(ы).";
		IntroMessage1 = "⛏️Каждый лобби имеет свою уникальную особенность!⛏️";
		IntroMessage2 = "💎Вступай в группу и поставь лайк игре, чтобы получать на 50% больше денег!💎";
		OreUncovered = "Руда {1} только что была обнаружена!";
		EmeraldUncovered = "Изумруд только что был обнаружен!";
		Emerald = "{1} подарил вам {2} изумрудов";
		Gamepass = "{1} подарил вам {2}";
		EmeraldYou = "Вы подарили {1} {2} изумрудов";
		GamepassYou = "Вы подарили {1} {2}";
		EmeraldOther = "{1} подарил {2} {3} изумрудов";
		GamepassOther = "{1} подарил {2} {3}";
		BlockEmeraldsAwarded = "Вы получили {1} изумрудов за создание руд!";
		UnprocessedBlock = "Вы получили {1}, так как сервер был закрыт.";
		BigCave = "Рядом с вами появилась большая пещера!";
	};
	ChatTips = {"Интересный факт: в этой игре всего {1} улучшений!", "В игре сейчас {1} уникальных блоков!", "Большинство руд в игре были созданы {1} и {2}", "Застряли? Попробуйте сделать Prestige.", "Один из разработчиков игры имеет больше всего значков во всём Roblox — 135 миллионов — и достиг максимального возможного лимита.", "Самая редкая редкость блока имеет шанс появления 1 к 2 000 000 000...", "Скорость добычи полезнее, чем кажется на первый взгляд...", "Подарки работают между серверами, даже если человек, которому вы дарите, находится офлайн. Он просто должен был сыграть в игру хотя бы один раз.", "Автокликеры и макросы разрешены, но использование эксплойтов — нет.", "После открытия крафта и создания Артефакта Machina вы можете выйти из игры, и она будет автоматически фармить за вас.", "Шанс получить это сообщение — 1 из 10 000. Поздравляем!"};
	DiscordChatTips = {"Если тебе нравятся руды в игре, можешь создать свои на Discord-сервере игры :)"};
	ServerResponses = {
		Error = "Произошла ошибка, повторите попытку позже";
		AppealEmpty = "Апелляция не может быть пустой";
		AppealInvalidCharacters = "Апелляция содержит недопустимые символы";
		AppealTooShort = "Апелляция слишком короткая";
		AppealTooLong = "Апелляция слишком долгая";
		AppealTooFast = "Вы отправляете апелляции слишком быстро, притормозите";
		AppealFiltered = "Апелляция была отфильтрована";
		AppealSuccess = "Апелляция успешно отправлена, мы свяжемся с вами в ближайшее время.";
		ResponseEmpty = "Ответ не может быть пустым";
		ResponseInvalidCharacters = "Ответ содержит недопустимые символы";
		ResponseTooShort = "Ответ слишком короткий";
		ResponseTooLong = "Ответ слишком длинный";
		ResponseDecision = "Вы должны выбрать решение";
		ResponseTooFast = "Вы отправляете ответы слишком быстро, замедляйтесь";
		ResponseFiltered = "Ответ был отфильтрован";
		NotBanned = "Этот пользователь не забанен";
		AlreadyResponded = "Ответ на эту аппеляцию уже отправлен";
		NoData = "У этого пользователя нет данных";
		UnableRespond1 = "Не имея возможности ответить на это обращение, пожалуйста, обратитесь за помощью к вышестоящему званию";
		UnableRespond2 = "Не могу ответить на это обращение, потому что этот пользователь был заблокирован супер вечно";
		ResponseSuccess = "Ответ успешно отправлен";
		LayerTooPowerful = "Слой слишком мощный, нельзя разместить взрывчатку";
		NoBlocksExploded = "Взрывчатка не взорвала блоки и не была заряжена";
		GiftSuccess = "Ваш подарок для {1} успешно отправлен";
		GiftError = "Ваш подарок для {1} не удался, он будет повторен, когда вы снова присоединитесь";
		InvalidUser = "Недействительный пользователь";
		GiftYourself = "Не могу подарить себе подарок";
		MoveAway = "Переместитесь как минимум на 75 блоков от места появления.";
	};
	Admin = {
		Appeals = "Апелляции";
		NoPendingAppeals = "В настоящее время нет ожидающих рассмотрения апелляций.";
		Reload = "Перезагузить";
		LoadingAppeals = "Загрузка апелляций...";
		SendResponse = "Отправить ответ";
		EnterResponse = "Введите свой ответ на аппеляцию здесь";
		Deny = "Отклонить";
		Accept = "Принять";
		TempBan = "Заблокирован на {1} за \"{2}\"";
		PermBan = "Заблокирован навсегда за \"{1}\"";
		SuperPermBan = "Заблокирован сверхнавсегда за \"{1}\"";
		Unban = "Разблокирован пользователем {1}";
	};
	Ban = {
		AccountBan = "Аккаунт забанен";
		Temp = "Вы были временно забанены на {1}!";
		Perm = "Вы были навсегда забанены за {1}!";
		TimeBanned = "Время бана: {1}";
		BanEnds = "Бан закончться: {1}";
		BanEndsTimer = "Бан закончться через {1}";
		BanEndsNever = "Бан никогда не закончиться";
		BanEnded = "Бан закончиться: {1}";
		AppealMessage = "Если вы хотите подать апелляцию, свяжитесь с нами через форму ниже.";
		AppealMessageRubenSim = "Если ты хочешь подать апелляцию, свяжись с Ruben Sim.";
		AppealSent = "Вы отправили апелляцию, мы свяжемся с вами как можно скорее.";
		AppealDenied = "Ваша апелляция была отклонена, проверьте сообщения для получения дополнительной информации.";
		AppealAccepted = "Ваша апелляция принята, и вы можете продолжать играть.";
		Appeal = "Аппеляция";
		AppealOnce = "Вы можете подать апелляцию только один раз";
		AppealTextBox = "Введите свое обращение здесь, предоставьте как можно больше подробностей";
		Send = "Отправить";
		ViewMessages = "Просмотр сообщений";
		Messages = "Сообщения";
		YouWrote = "Ты написал";
		OtherWrote = "{1} Написал";
	};
	Trading = {
		WaitForPeople = "Ожидание игроков для обмена...";
		WaitForTradeRequests = "Ожидание запросов на обмен...";
		WantsToTrade = "{1} хочет обменяться с вами";
		Accept = "Принять";
		Unaccept = "Отменить принятие";
		Deny = "Отклонить";
		EnterAmount = "Введите количество";
		Confirmation = "Вы уверены?";
		NoResults = "Результаты не найдены.";
		TradeDenied = "{1} отклонил обмен!";
		Offering = "Предлагается {1}";
		Regulations = "Некоторые предметы отключены из-за местных правил.";
		NotAcceptedYet = "Еще не принято";
		WaitingForAccept = "Принято, ожидается ваше подтверждение";
		ProcessingIn = "Обмен будет обработан через {1} секунд";
		NoItemsAvailable = "Нет доступных предметов для этого обмена.";
		NoItemsOffered = "Предметы не предложены.";
		TradeCompleted = "Обмен завершён.";
		TradeFailed = "Произошла ошибка во время обмена.";
		TradeLimit = "{1}/{2} Обменов";
		TradeLimitReset = "Сброс через {1}";
	};
	Accessories = {{{
		Name = "Талисман Дуплици";
		Desc = "Талисман Дуплици предоставляет дополнительный шанс {Boost_Dupe} получить дополнительный блок при добыче одного.";
	}, {
		Name = "Кольцо Дуплици";
		Desc = "Кольцо Дуплици предоставляет дополнительный шанс {Boost_Dupe} получить дополнительный блок при добыче одного.";
	}, {
		Name = "Реликвия Дуплици";
		Desc = "Реликвия Дуплици предоставляет дополнительный шанс {Boost_Dupe} получить дополнительный блок при добыче одного.";
	}, {
		Name = "Наследие Дуплици";
		Desc = "Наследие Дуплици предоставляет дополнительный шанс {Boost_Dupe} получить дополнительный блок при добыче одного.";
	}}, {{
		Name = "Кольцо Рубер";
		Desc = "Кольцо Рубер предоставляет дополнительный шанс {Boost_RareExplosion} вызвать взрыв силы 5 при добыче редкого блока.";
	}, {
		Name = "Реликвия Рубер";
		Desc = "Реликвия Рубер предоставляет дополнительный шанс {Boost_RareExplosion} вызвать взрыв силы 5 при добыче редкого блока.";
	}, {
		Name = "Наследие Рубер";
		Desc = "Наследие Рубер предоставляет дополнительный шанс {Boost_RareExplosion} вызвать взрыв силы 5 при добыче редкого блока.";
	}, {
		Name = "Хроником Рубер";
		Desc = "Хроником Рубер предоставляет дополнительный шанс {Boost_RareExplosion} вызвать взрыв силы 5 при добыче редкого блока.";
	}}, {{
		Name = "Кольцо Копилки";
		Desc = "Кольцо Копилки предоставляет дополнительный {Boost_Cash} к денежным средствам.";
	}, {
		Name = "Реликвия Копилки";
		Desc = "Реликвия Копилки предоставляет дополнительный {Boost_Cash} к денежным средствам.";
	}, {
		Name = "Наследие Копилки";
		Desc = "Наследие Копилки предоставляет дополнительный {Boost_Cash} к денежным средствам.";
	}, {
		Name = "Хроником Копилки";
		Desc = "Хроником Копилки — мощное украшение, которое предоставляет дополнительный {Boost_Cash} к денежным средствам. И ещё +5% к денежным средствам сверху.";
	}, {
		Name = "Возвышенная Копилка";
		Desc = "Возвышенная Копилка — очень мощный аксессуар, который даёт дополнительный бонус {Boost_Cash} к деньгам, а также ещё 10% сверху.";
	}}, {{
		Name = "Талисман Шахтёра";
		Desc = "Талисман Шахтёра — это базовый аксессуар, который даёт {Boost_Cash} к деньгам и {Boost_PickaxePower} к урону кирки.";
	}, {
		Name = "Кольцо Шахтёра";
		Desc = "Кольцо Шахтёра даёт {Boost_Cash} к деньгам и {Boost_PickaxePower} к урону кирки.";
	}, {
		Name = "Реликвия Шахтёра";
		Desc = "Реликвия Шахтёра даёт {Boost_Cash} к деньгам и {Boost_PickaxePower} к урону кирки.";
	}, {
		Name = "Наследие Шахтёра";
		Desc = "Наследие Шахтёра даёт {Boost_Cash} к деньгам и {Boost_PickaxePower} к урону кирки.";
	}, {
		Name = "Хрономикон Шахтёра";
		Desc = "Хрономикон Шахтёра даёт {Boost_Cash} к деньгам и {Boost_PickaxePower} к урону кирки.";
	}, {
		Name = "Мир Шахтёра";
		Desc = "Мир Шахтёра даёт {Boost_Cash} к деньгам и {Boost_PickaxePower} к урону кирки, а также {Boost_PrestigeTokens} токенов престижа и {Boost_MiningSpeed} скорости добычи. По пятницам и выходным деньги и урон удваиваются.";
	}}, {{
		Name = "Реликвия Спешки";
		Desc = "Реликвия Спешки — это аксессуар, увеличивающий скорость добычи на {Boost_MiningSpeed}.";
	}, {
		Name = "Наследие Спешки";
		Desc = "Наследие Спешки — это аксессуар, увеличивающий скорость добычи на {Boost_MiningSpeed}.";
	}, {
		Name = "Хрономикон Спешки";
		Desc = "Хрономикон Спешки — мощный аксессуар, увеличивающий скорость добычи на {Boost_MiningSpeed}.";
	}, {
		Name = "Вознесённая Спешка";
		Desc = "Вознесённая Спешка — очень мощный аксессуар, увеличивающий скорость добычи на {Boost_MiningSpeed}.";
	}, {
		Name = "Вечная Спешка";
		Desc = "Вечная Спешка — чрезвычайно мощный аксессуар, увеличивающий скорость добычи на {Boost_MiningSpeed}.";
	}}, {{
		Name = "Артефакт скорости";
		Desc = "Артефакт скорости увеличивает вашу скорость ходьбы на {Boost_WalkSpeed} блоков в секунду.";
	}}, {{
		Name = "Кольцо Крепитуса";
		Desc = "Кольцо Крепитуса — аксессуар, имеющий шанс {Boost_ExtraExplosionRadiusChance} при каждом срабатывании способности Взрыв добавить +1 к радиусу.";
	}, {
		Name = "Реликвия Крепитуса";
		Desc = "Реликвия Крепитуса — аксессуар, имеющий шанс {Boost_ExtraExplosionRadiusChance} при каждом срабатывании способности Взрыв добавить +1 к радиусу.";
	}, {
		Name = "Наследие Крепитуса";
		Desc = "Наследие Крепитуса — аксессуар, имеющий шанс {Boost_ExtraExplosionRadiusChance} при каждом срабатывании способности Взрыв добавить +1 к радиусу.";
	}, {
		Name = "Хрономикон Крепитуса";
		Desc = "Хрономикон Крепитуса — аксессуар, имеющий шанс {Boost_ExtraExplosionRadiusChance} при каждом срабатывании способности Взрыв добавить +1 к радиусу.";
	}, {
		Name = "Крепитус Макс";
		Desc = "Крепитус Макс — аксессуар, имеющий шанс {Boost_ExtraExplosionRadiusChance} при каждом срабатывании способности Взрыв добавить +1 к радиусу.";
	}}, {{
		Name = "Артефакт Фрагон";
		Desc = "Артефакт Фрагон создаёт взрыв мощностью 25 при добыче мифического блока.";
	}}, {{
		Name = "Кольцо Бэнг";
		Desc = "Кольцо Бэнг имеет {Boost_LegendaryExplosion} шанс создать взрыв силы 17 при добыче легендарного блока.";
	}, {
		Name = "Реликвия Бэнг";
		Desc = "Реликвия Бэнг имеет {Boost_LegendaryExplosion} шанс создать взрыв силы 17 при добыче легендарного блока.";
	}, {
		Name = "Наследие Бэнг";
		Desc = "Наследие Бэнг имеет {Boost_LegendaryExplosion} шанс создать взрыв силы 17 при добыче легендарного блока.";
	}, {
		Name = "Хроником Бэнг";
		Desc = "Хроником Бэнг имеет {Boost_LegendaryExplosion} шанс создать взрыв силы 20 при добыче легендарного блока.";
	}}, {{
		Name = "Талисман Радар";
		Desc = longstring1;
	}, {
		Name = "Кольцо Радар";
		Desc = longstring1;
	}, {
		Name = "Реликвия Радар";
		Desc = longstring1;
	}, {
		Name = "Наследие Радар";
		Desc = longstring1;
	}, {
		Name = "Хроником Радар";
		Desc = longstring1;
	}}, {{
		Name = "Артефакт Машины";
		Desc = "Этот артефакт автоматизирует процесс добычи, управляя вашим телом по вашей воле.";
	}, {
		Name = "Машина Второго Порядка";
		Desc = "Улучшает автоматическую добычу для легендарных+ руд и увеличивает скорость передвижения на 100%.";
	}, {
		Name = "Машина Третьего Порядка";
		Desc = "Улучшает автоматическую добычу для редких+ руд, увеличивает скорость передвижения на 200% и повышает эффективность автодобычи до 60% с предыдущих 50%.";
	}, {
		Name = "Машина Высшего Порядка";
		Desc = "Улучшает автоматическую добычу для добычи TNT, увеличивает её эффективность до 100% с 60%, повышает скорость передвижения на 500% и автоматически продаёт рюкзак при заполнении до трёх раз в день.";
	}, {
		Name = "Воплощённая Машина";
		Desc = "Улучшает автоматическую добычу для добычи всех легендарных+ руд независимо от расстояния, а добыча TNT даёт все блоки, которые оно взрывает.";
	}, {
		Name = "На Любой Случай";
		Desc = "Улучшает автоматическую добычу, позволяя мгновенно добывать все руды от необычных до эфирных, если вы можете добывать их достаточно быстро, и добывает TNT с удвоенной дистанции.";
	}}, {{
		Name = "Реликвия Маллеус";
		Desc = "Реликвия Маллеус добавляет шанс {Boost_JackhammerChance} для Jackhammer.";
	}, {
		Name = "Наследие Маллеус";
		Desc = "Наследие Маллеус добавляет шанс {Boost_JackhammerChance} для Jackhammer.";
	}, {
		Name = "Хроником Маллеус";
		Desc = "Хроником Маллеус добавляет шанс {Boost_JackhammerChance} для Jackhammer.";
	}, {
		Name = "Маллеус Возвышенный";
		Desc = "Маллеус Возвышенный добавляет шанс {Boost_JackhammerChance} для Jackhammer.";
	}}, {{
		Name = "Наследие Экситиум";
		Desc = "Наследие Экситиум добавляет шанс {Boost_ExplosionChance} к Взрыву.";
	}, {
		Name = "Хроником Экситиум";
		Desc = "Хроником Экситиум добавляет шанс {Boost_ExplosionChance} к Взрыву.";
	}, {
		Name = "Экситиум Возвышенный";
		Desc = "Экситиум Возвышенный добавляет шанс {Boost_ExplosionChance} к Взрыву.";
	}}, {{
		Name = "Талисман Фодиэнда";
		Desc = "Талисман Фодиэнда увеличивает ваш радиус добычи на {Boost_MiningRange} блоков.";
	}, {
		Name = "Кольцо Фодиэнда";
		Desc = "Кольцо Фодиэнда увеличивает ваш радиус добычи на {Boost_MiningRange} блоков.";
	}, {
		Name = "Реликвия Фодиэнда";
		Desc = "Реликвия Фодиэнда увеличивает ваш радиус добычи на {Boost_MiningRange} блоков.";
	}, {
		Name = "Наследие Фодиэнда";
		Desc = "Наследие Фодиэнда увеличивает ваш радиус добычи на {Boost_MiningRange} блоков.";
	}, {
		Name = "Хронамикон Фодиэнда";
		Desc = "Хронамикон Фодиэнда увеличивает ваш радиус добычи на {Boost_MiningRange} блоков.";
	}, {
		Name = "Возвышенная Фодиенда";
		Desc = "Возвышенная Фодиенда увеличивает вашу дальность добычи на {Boost_MiningRange} блоков.";
	}}, {{
		Name = "Кольцо Фортуны";
		Desc = "Кольцо Фортуны увеличивает вашу удачу на {Boost_Luck}.";
	}, {
		Name = "Реликвия Фортуны";
		Desc = "Реликвия Фортуны увеличивает вашу удачу на {Boost_Luck}.";
	}, {
		Name = "Наследие Фортуны";
		Desc = "Наследие Фортуны увеличивает вашу удачу на {Boost_Luck}.";
	}, {
		Name = "Мать Фортуна";
		Desc = "Мать Фортуна увеличивает вашу удачу на {Boost_Luck}.";
	}}, {{
		Name = "Артефакт Ядерного Автомата";
		Desc = "Снижает перезарядку взрывчатки на {Boost_ExplosiveCooldownReduction}, пока вы онлайн.";
	}}, {{
		Name = "Наследие Ядерной Мощи";
		Desc = "Увеличивает силу взрывчатки на {Boost_ExplosiveRadius}.";
	}, {
		Name = "Хрономикон Ядерной Мощи";
		Desc = "Увеличивает силу взрывчатки на {Boost_ExplosiveRadius}.";
	}}, {{
		Name = "Нуклеус Симул — Финал";
		Desc = "Увеличивает силу взрывчатки на {Boost_ExplosiveRadius} и снижает её перезарядку на {Boost_ExplosiveCooldownReduction}, пока вы онлайн. Объединяет Артефакт Ядерного Автомата и Хрономикон Ядерной Мощи.";
	}}, {{
		Name = "Реликвия Аукторитас";
		Desc = "Реликвия Аукторитас увеличивает ваши токены престижа на {Boost_PrestigeTokens}.";
	}, {
		Name = "Наследие Аукторитас";
		Desc = "Наследие Аукторитас увеличивает ваши токены престижа на {Boost_PrestigeTokens}.";
	}, {
		Name = "Хрономикон Аукторитас";
		Desc = "Хрономикон Аукторитас увеличивает ваши токены престижа на {Boost_PrestigeTokens}.";
	}, {
		Name = "Аукторитас Вознесённый";
		Desc = "Аукторитас Вознесённый увеличивает ваши токены престижа на {Boost_PrestigeTokens}.";
	}}, {{
		Name = "Артефакт Ранения Руды";
		Desc = "Этот аксессуар добывает всю руду рядом с добываемым блоком, если вы можете добывать её достаточно быстро.";
	}}, {{
		Name = "Кольцо Синум";
		Desc = longstring2;
	}, {
		Name = "Реликвия Синум";
		Desc = longstring2;
	}}, {{
		Name = "Артефакт Руптис";
		Desc = "С артефактом Руптис взрывы, вызванные Эфирными+ рудами, дают вам все разрушенные блоки.";
	}}, {{
		Name = "Mobilitas Ultima";
		Desc = "Добыча редкой руды вызывает взрыв силой 6, легендарной — силой 20, мифической — силой 33. Вы получаете все блоки, взорванные Эфирными+ рудами, а добыча изумрудов вызывает взрыв силой 17. Этот аксессуар объединяет Ruber Chronomicon, Fragon Artifact, Bang Chronomicon и Ruptis Artifact.";
	}}, {{
		Name = "Талисман Magicae";
		Desc = longstring3;
	}, {
		Name = "Кольцо Magicae";
		Desc = longstring3;
	}, {
		Name = "Реликвия Magicae";
		Desc = longstring3;
	}, {
		Name = "Наследие Magicae";
		Desc = longstring3;
	}, {
		Name = "Хрономикон Magicae";
		Desc = longstring3;
	}}};
	Blocks = {"Грязь", "Песок", "Ил", "Глина", "Суглинок", "Торф", "Мел", "Компост", "Гравий", "Энтисолы", "Аридизолы", "Инцептизолы", "Гелизолы", "Джерманит", "Уплотнённая земля", "Корни", "Гриб", "Грибы", "Картофель", "Свекла", "Пастернак", "Имбирь", "Куркума", "Туннель сусликов", "Кроты", "Моллизолы", "Разбитая керамика", "Капсула времени", "Уплотнённая грязь", "Компактная грязь", "Водонасыщенная грязь", "Растительная грязь", "Колесо", "Город грязи", "Грязная грязь", "Скелет", "Сокровище", "Инопланетная грязь", "Нокия", "Ядерные отходы", "Нефтяное месторождение", "Моторное масло", "Доисторическая грязь", "Плотная земля", "Чеснок", "Редис", "Юкка", "Джикама", "Муравьи", "Жуки", "Иерусалимские сверчки", "Многоножки", "Термиты", "Сломанное оружие", "Старые монеты", "Наконечники стрел", "Кости", "Древний артефакт", "Грязь", "Травянистая почва", "Грибная почва", "Вспаханная почва", "Почва с корнями растений", "Зараженная почва", "Впитывающая солнце почва", "Грязь с корнями деревьев", "Зараженная мусором почва", "Мега грязь", "Почва для гнездования пауков", "Почва для резиновых уток", "Бумажная почва", "Упаковочный грунт", "Камень", "Кремень", "Ракушечник", "Доломит", "Травертин", "Туф", "Оолит", "Брекка", "Конгломерат", "Каличе", "Песчаник", "Алевролит", "Диатомит", "Галит", "Кристалл", "Густая трава", "Мертвая трава", "Мокрая трава", "Плодородная трава", "Пятнистая трава", "Замерзшая трава", "Потрескавшаяся трава", "Искусственная трава", "Укорененная трава", "Засеянная трава", "Чужеродная трава", "Лунная трава", "Червивая трава", "Тронутая трава", "Кратер", "Уплотнённый камень", "Мрамор", "Новакулит", "Кварцит", "Скарн", "Гнейс", "Амфиболит", "Роголистник", "Сланец", "Аспидный Сланец", "Филлит", "Мыльный камень", "Антрацит", "Марипозит", "Вердит", "Лазурит", "Трава", "Овсяница", "Копытень", "Шарлатанская трава", "Гусиная трава", "Клочок травы", "Трава Даллиса", "Хвощ полевой", "Итальянский белый", "Мальва", "Ведьмина трава", "Спидвелл", "Молодое растение", "Тысячелистник", "Одуванчики", "Четырехлистный клевер", "Плотный камень", "Диорит", "Андезит", "Риолит", "Гранит", "Пегматит", "Габбро", "Диабаз", "Базальт", "Плагиоклаз", "Диацит", "Стелс-медь", "Туф", "Бастнеазит", "Огненный опал", "Небо", "Белое облако", "Светло-серое облако", "Темно-серое облако", "Самолет", "Воздушный змей", "Птица", "Частный самолет", "Метеозонд", "Вертолет", "Дирижабль", "Военный вертолет", "Гроза", "Торнадо", "Вулкан", "Обсидиан", "Салаксум", "Баксерит", "Супрецерез", "Автомобильный Салаксум", "Деконогарон", "Боксит", "Скриолин", "Перагомит", "Муосический обсидиан", "Ласкеро Ламента", "Радужный обсидиан", "Ксенотайм", "Монацит", "Высокое небо", "Реактивные инверсионные следы", "Солнечные лучи", "Тонкие облака", "Беспилотный летательный аппарат", "Мега облако", "Туманная атмосфера", "Падающий космический мусор", "Солнечное затмение", "Ракета", "НЛО", "Северное сияние", "Светящиеся облака", "Небесный свод", "Расплавленный обсидиан", "Силиа", "Перагомит", "Порождение пламени", "Шимикала", "Греконогарон", "Герис", "Пирромит", "Доторит", "Центромодор", "Вапориестер", "Камень Блейза", "Террацит", "Магмаиум", "Космос", "Красная звезда", "Оранжевая звезда", "Солнце", "Метеор", "Астероид", "Луна", "Карликовая планета", "Спутник", "Планета", "Комета", "Кольцо планеты", "МКС", "Оумуамуа", "Лава", "Армированный базальт", "Скория", "Пемза", "Твердая лава", "Дивенестиум", "Стеллан", "Биррзоме", "Ксапототе", "Гниксон", "Полонит", "Огненное сердце", "Встроенное солнце", "Ад", "Радиоактивный камень", "Уран", "Ураниумит", "Гамит", "Моптазик", "Паретиум", "Лимиоктив", "Ратениум", "Зонимит", "Уихит", "Адсимит", "Прениум", "Легениум", "Лимонион", "Токсичный обсидиан", "Дробленая порода", "Нефтяные отходы", "Затвердевшая сердцевина", "Треснувшие кости", "Искусственный куб", "Растрескавшиеся отходы", "Доисторический боталмант", "Осколки лавы", "Расплавленный мусор", "Красный берилл", "Пейнит", "Древний инструмент", "Солнечный кристалл", "Отходы под повышенным давлением", "Морозные отходы", "Токсичная лава", "Солнечная лава", "Тимлойн Лава", "Химлойн лава", "Черная лава", "Лава Томичности", "Лава человечности", "Лава Гаминийити", "Токсичная лава", "Голубая лава", "Мапикл Лава", "Лава смерти", "Токсичная лава", "Вулканическая лава", "Смертоносная лава", "Кипящая лава", "Алюминий", "Фулоцит", "Тельбар", "Меркурий", "Фигариум", "Ризуфид", "Джагдит", "Юлацит", "Ваксиум", "Фарлицин", "Дерилиум", "Бирюцит", "Сакреоксин", "Васекресиэль", "Кристалл Левиафана", "Внешнее ядро", "Рилджуд", "Карзюм", "Селорус", "Фокстрофин", "Инциндирум", "Эктоплазма", "Шафран", "Субсинит", "Алюмаргиум", "Парчиум", "Занфорн-88", "Таррулум", "К4Р-УЛ-1УМ", "Юрулфазион", "ЭЛЕМЕНТ ТОН-618", "Среднее ядро", "Соултрек", "Недоценности", "Джокериум", "Неочищенный водород", "Дарнит", "Эфир", "Макабриум", "Аунолит", "Фернокаджин", "Нетерит", "Плотно упакованный никель", "Странный сплав", "Украшенная драгоценными камнями ламента", "Кобальт-торий G", "Пальчиковые ренманты", "Внутреннее ядро", "Мерцающая железная руда", "Оксигенаниум", "Мерцающая серебряная руда", "Сжатый водород", "Лаваниум", "Мельтор", "Глиммериум", "Граиниум", "Приморская порода", "Переливающийся вулканический пепел", "Магмортум", "Нормалиум", "Легированная руда", "Центральный", "Невозможная плазма", "Глубокий космос", "Темная материя", "Черная дыра", "Остаток планеты", "Галактика", "Звездный остаток", "Аркан", "Нейтронная звезда", "Галактический опал", "Метелум", "Цивилизованный объект-изгой", "Скреп", "Зеленая комета", "Литорп", "Микроспобное пятнышко", "Черный карлик", "Белая дыра", "Квазизвезда", "Лунный камень", "Лунариум", "Лунные кристаллы", "Селена Руда", "Лунарит", "Кристалл звездной пыли", "Небесный кварц", "Руда Лунарис", "Астралиум", "Лунная душа", "Лунный аметист", "Лунная эссенция", "Руда лунного пламени", "Кристалл лунной тени", "Лунарисиум", "Сущность Солнечной Луны", "Звезда Смерти", "Пояс астероидов", "Обломок базальта", "Руда небесного тела", "Никелевый самородок", "Метеороид", "Кобальтовая жила", "Осколок платины", "Скопление иридия", "Метеоритный камень", "Кристалл ксенона", "Кристалл пустоты", "Гравитоний", "Космическое ядро", "Звёздный рубин", "Камень сингулярности", "Пейзаж", "Атмосферный Концентратор", "Пески Времени", "Чистый Гиперсжатый Нейтроний", "Плазменное Ядро", "Субпространственная Мина", "Хронос", "Многие Ночные Небеса", "Хромалит", "Тундерий", "Серафим", "Лаваспит", "Драконье Стекло", "Камень Пустоты", "Зикрит", "Драконий", "Заснеженные Алмазы", "Пылающая Ненависть", "Вийкулед", "Густавон", "Расплавленный Осколок", "Огненное Стекло", "Тюрьма Ада", "Астральный Огонь", "Рохоккаим", "Пирит", "Солнечный Камень", "Горящая Память", "Треснувший Расплавленный Рубин", "Искажение", "Радий", "Оганесон", "Криптонит", "Эвудождед", "Мобильный Телефон", "Схема", "Актиний", "Плутоний", "Торий", "Кристалл Черенкова", "Неподвижный", "Гексафторид Урана", "Плазма", "Песок Душ", "Зефендит", "Игнисаxум", "Арктический Мороз", "Газообразное Железо", "Шипованный Цветок-Камень", "Огненный Паук", "Улевутаим", "Падающая Звезда", "Кьяутуит", "Уру", "Коиксхолайм", "Аррас", "Аномалия", "Цветовой овердрайв", "Купол", "Кристалл Эфириума", "Благословенная руда", "Целестиум", "Закованный демон", "Вычислить бинарный датакрит", "Последняя мимолётная надежда", "Галаксиум", "Этерниум", "Генезиум", "Серый меч и звёзды", "Призма Лаваксита", "Плазменный огонь", "Якорь Ватериума", "В смятении", "Тоериум", "Thefaimnilnilnil", "Тессерактное ядро", "Ноктурнис", "Античная энергия", "Пылающее существо", "Кометиум", "Ноль", "Гидеон", "Линейный камень", "Трианглиум", "Скварит", "Цирклайт", "Кайтаниум", "Овалиум", "Трапезид", "Октагониум", "Пентагриум", "Гексагрит", "Кросилит", "Лавелит", "Сноутаниум", "Синдриллиум", "Веджилит", "Сферит", "Пи Циркумференциум", "Старлайт", "Тришаттерит", "Геометрическое ядро", "N-Гон", "Эклипсера", "Ириданит", "Старсирит", "Гравоникс", "Соленит", "Эклипсерон", "Скрапикс", "Ноктирит", "Космарил", "Умбрикс", "Астралит", "Эферион", "Аэроникс", "Нимбрил", "Руда Солариума", "Зефирозит", "Темпестралит", "Страторий", "Бризий", "Вентрикс", "Вольтацит", "Целестара", "Скайнексиум", "Верданит", "Флорацит", "Эларион", "Сильванит", "Ксилогранит", "Амбрит", "Друанит", "Терравин", "Гайалит", "Клейтиум", "Лоамикс", "Седрикс", "Рубрат", "Шалорит", "Терралит", "Мирстоун", "Тинарит", "Геодин", "Ауривин", "Терракрон", "Гравеллиум", "Ферроникс", "Кримора", "Амарион", "Компаксит", "Бронзиум", "Слатем", "Рубрасит", "Опал Обрикс", "Обдуриум", "Аргениум", "Онитера", "Рубраксис", "Ноктира", "Умбросит", "Пламбрин", "Малакитея", "Сафирос", "Драконикс", "Литириум", "Зинтэриум", "Топазирин", "Гемовир", "Волкарион", "Тангрит", "Джадикс", "Гарнирос", "Нихитрит", "Хазмит", "Волкрис", "Обритит", "Пирелит", "Игнарион", "Магморикс", "Кристалл Вспышки", "Радионикс", "Увирит", "Веномиф", "Коррозит", "Скалдириум", "Коретиум", "Магнит", "Пиротист", "Инфернокс", "Игнирион", "Дифирос", "Соларикс", "Магмира", "Эонсталь", "Никсиум", "Небрикс", "Космит", "Лунарисит", "Селестиум", "Целестин", "Ректит", "Кальцинит", "Венерианский камень", "Сульварис", "Цветущий кварц", "Венит", "Обожжённое стекло", "Эрозин", "Янтарная жила", "Жемчуг фумарита", "Венерианский ориксио", "Багровое сияние", "Валенит", "Пепельный цветок-камень", "Шитерён", "Позолоченная Вапора", "Серафическое стекло", "Венасвет", "Осколок аурического пламени", "Самоцвет Эклипсеры", "Соленви", "Терновое сияние", "Астральная жила", "Тартариум", "Камень Меркурия", "Феррит", "Пепельный Гёте", "Мерсирозит", "Обожжённый базальт", "Эминеску", "Руда Синдермарк", "Волкарин", "Кратер Абедин", "Пламенная сталь", "Радиолит", "Жила Игнилита", "Ауралит", "Стекло солнечного огня", "Бассейн Калорис", "Коронатиум", "Вулканит Прайм", "Бассейн Рембрандта", "Гелиархит", "Толстой", "Ядро Рейнхарта", "Стильбон", "Поверхность Солнца", "Протуберанец", "Стекло углей", "Солнечный пепел", "Корональная дыра", "Фотосфера", "Хромосфера", "Фотоникс", "Термитовая жила", "Солнечный кварц", "Осколок Игниса", "Пыль Гелиоса", "Сердечник Солариса", "Самоцвет пепельного света", "Сплав Ауропламени", "Прометеон", "Лучистый Солиниум", "Пирит Авроры", "Корона рассвета", "Адская призма", "Вспышка", "Вечное солнечное пламя", "Тишина Бетховена", "Вернись, Бенджамин", "110011 1010010 1010010 110000 1010010 101110 110100 110000 110100", "Призматический Квазар", "Окутанный страданиями", "Падение Джейкоба в Вечность", "ΒΞDRΩCK", "fαтє", "Судьба марширует, как любой человек", "E̶͐́l̸̆̊ė̷͙p̷͒̍h̷͂͝ǎ̴̿n̶̛t — Нога", "αи∂яσмє∂α", "Монокритовая Бездна", "Смотри за пределы   ̶C̶U̶R̶T̶A̶I̶N̶  Инферно", "你聽到了嗎？？？？？？？？？", "Твёрдый Бог Геометрической Математики", "Солнечная Жила", "Чистая Божественность", "Альтернативный План", "TUDOL", "Ядро Солнца", "Подповерхностный Водород", "Ядровой Грит", "Солнечный Шлак", "Квадиевый Водород", "Тахоклина", "Гелионовое Стекло", "Плазмирум", "Иррадит", "Фотовит", "Хеликорит", "Звёздная Кость", "Инферниковый Сплав", "Солатрикс", "Кристалл Люминфордж", "Коронаит", "Вермион", "Пиродушный Камень", "Стеллариум", "Гемисиз", "Солнечное Сердце", "Измерительные Объекты", "Ультиматум", "Чистый Санктарит", "Хсия", "TERRARVM", "Одиссея", "Создано на небесах", "Ярость Баллика", "Φοβος", "Апокрифы", "Сверхрациональная метка", "Фасария", "→ Аврора ⇋ Финал ⇋ ←", "《『R』『E』『V』『E』『L』『A』『T』『I』『O』『N』》", "Ex Machina Предпоследняя", "『Ｉｎｄｅｘ』『Ｄｅｉ』『ｌａｔｅｎ』", "Марсианский камень", "Ржавый камень", "Пылесвязанный рудник", "Красный камень", "Гравеллит", "Ферринит", "Пепельная плита", "Терраклин", "Оксидулит", "Марсианское стекло", "Багровый сплав", "Ядро Рубиона", "Волкарит", "Сангрелит", "Кристалл железной тени", "Марсианский камень души", "Пылекованный титанит", "Рубин красного разлома", "Ядро Ареса", "Алый куб", "Вода Бореалис", "Серафит Деймоса", "Фобос", "JeremyDevs", "『Ｏｎｃｅ』『Ｂｙ』『Ｈｕｍａｎ』", "Газ Юпитера", "Сжатый Водород", "Юпитерианская Порода", "Металлический Водород", "Пойманный Шторм", "Туман Давления", "Ионизированный Водород", "Заряженный Аммиак", "Авроральный Плюм", "Циклонный Пар", "Метановый Всплеск", "Разбитый Зонд", "Юпитерианская Эссенция", "Станция Юпитера", "Штормовая Плазма", "Пар Большого Красного Пятна", "Великие Авроры", "Европа", "Владычество Зевса", "Схождение", "Чародейство", "Космические Спутники", "Атанатос", "Газ Сатурна", "Гелиевый дрейф", "Холодные кольца", "Золотая дымка", "Рождённый кольцами", "Замёрзший аммиак", "Крио-туман", "Камень внешнего кольца", "Шёлк давления", "Кольцевая буря", "Метановая вуаль", "Карма и Время", "Сущность кольцевого света", "Кронос", "Безмолвный шторм", "Коронное облако Сатурна", "Золотой поток", "Руда Давида", "Звезда Ремфана", "Древняя атмос", "Монохромная плотность", "Полихромные провода", "Ядро Титаноса", "Механизм", "Металлоломная обшивка", "Железная проводка", "Ржавый сплав", "Шестерённый камень", "Схемная руда", "Стальная решётка", "Импульсный канал", "Мехасил", "Кристалл логики", "Серво-ядро", "Бинарный сплав", "Нейронная матрица", "Хронозубец", "Синтетический камень души", "Фрагмент планетарного двигателя", "Омникор-сплав", "Сердце стали Машины", "Deus Mechanica", "Процессор сингулярности", "Аксиомный двигатель", "Призма призрачного кода", "Главная директива", "Газ Урана", "Бледный метан", "Морозный пар", "Облачный дрейф", "Ледяной туман", "Ледяной вихрь", "Крио-покров", "Синяя дымка", "Наклонённый поток", "Полярная дрожь", "Метановая морозная вуаль", "Замёрзший струйный поток", "Авроральный поток", "Мерцающий морозный ветер", "Безмолвный циклон", "Титанический бриз", "Эфирная спираль", "Замёрзший ореол", "Небесный холод", "Первобытный ледяной замок", "Эфирность", "Эфирный туман", "Ядро Урана", "『Dʏꜱꜰᴜɴᴄᴛɪᴏɴᴀʟ』『Aʙᴇʀʀᴀᴛɪᴏɴ』", -- : First try: K:0: attempt to index nil with 't'
;
	Explosives = {"Динамит", "Бомба", "С4", "ТНТ", "Ракета", "Ядерная бомба", "Царь-бомба", "Нейтронная бомба", "Бомба из антивещества"};
	Leaderboards = {"Самые наличные", "Большинство добытых блоков", "Самое проигранное время", "Большинство обнаруженных блоков", "Большинство престижей", "Самое большое количество жетонов престижа", "Наибольшая часть потраченных Robux"};
	Gamepasses = {
		x2Cash = "2x наличные";
		x2CashDesc = "Удваивает весь ваш денежный доход";
		["x2Изумруд"] = "2x Изумруд";
		x2EmeraldDesc = "Удваивает изумруды, которые вы получаете из изумрудной руды";
		SharperPickaxes = "Острые кирки";
		SharperPickaxesDesc = "Все кирки будут на 10% мощнее";
		x2PickaxePower = "2x мощность кирки";
		x2PickaxePowerDesc = "Удваивает мощность всех кирок";
		x2MiningSpeed = "удвоенная скорость майнинга";
		x2MiningSpeedDesc = "Удваивает скорость майнинга";
		x2Storage = "Хранилище 2x";
		x2StorageDesc = "Удваивает место в вашем рюкзаке";
		InfiniteBackpack = "Бесконечный рюкзак";
		InfiniteBackpackDesc = "Хранилище вашего рюкзака станет бесконечным";
		["Телепорт"] = "Телепорт";
		TeleporterDesc = "Дает вам телепорт, который вы можете разместить в любом месте и телепортироваться к нему в любое время. Кроме того, делает все телепорты в лобби бесплатными";
		VIP = "VIP";
		VIPDesc = "Вы разблокируете VIP-эксклюзивную кирку, рюкзак и метку для чата. Кроме того, вы получите больше изумрудов за покупки";
		x2Speed = "2x Скорость";
		x2SpeedDesc = "Позволяет вам идти в 2 раза быстрее, чем обычно";
		x2Jump = "2x прыжок";
		x2JumpDesc = "Позволяет вам прыгать в 2 раза выше, чем обычно";
		["Реактивный ранец"] = "Реактивный ранец";
		JetpackDesc = "Открывает реактивный ранец, который позволяет вам летать";
		MoreRange = "Больше дальности";
		MoreRangeDesc = "Увеличивает радиус добычи на +5 блоков";
	};
	Quests = {"Мой {1} {2}", "Майн {1} {2} блоков", "Майн {1} блоков", "Добыть {1} руды", "Копать на глубину {1}", "Возьмите кирку #{1} или лучше", "Надеть рюкзак №{1} или выше", "Использовать {1} взрывчатку"};
	TranslatorSettings = {
		Locale = "ru";
		Seperator = ',';
		Decimal = '.';
		TimeAbbreviations = {'s', 'm', 'h', 'd', 'y'};
		Translator = 2638779880;
	};
}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Translator.french
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:55
-- Luau version 6, Types version 3
-- Time taken: 0.050601 seconds

local longstring1 = "Cet accessoire augmente l’espace du sac \xE0 dos de {Boost_BackpackSpace} et conf\xE8re {Boost_LocalMagicPower} puissance magique suppl\xE9mentaire par rapport aux accessoires habituels de cette raret\xE9."
local longstring2 = "Cet accessoire conf\xE8re {Boost_LocalMagicPower} puissance magique suppl\xE9mentaire par rapport aux accessoires habituels de cette raret\xE9."
return {
	Main = {
		Cash = "Argent";
		BlockCount = "{1}/{2} Blocs";
		BlockCountUnlimited = "{1} Blocs";
		EnableJetpack = "Activer jet pack";
		DisableJetpack = "D\xE9sactiver jet pack";
		ToSurface = "Au surface";
		Backpack = "Sac";
		Index = "Index";
		Settings = "Param\xE8tres";
		ReloadChunks = "Recharger morceaux";
		Placing = "Placement en cours {1}";
		Unbreakable = "Incassable";
		BackToMining = "Retour \xE0 l'exploitation mini\xE8re";
		SearchBlocks = "Rechercher blocs...";
		Place = "Placer";
		Lock = "Verrouiller";
		Unlock = "D\xE9verrouiller";
		BackpackFull = "Sac plein";
		BackpackFullMessage = "Tu as enti\xE8rement rempli ton sac et tu ne peux pas exploiter avant que tu vends, places des blocs ou am\xE9liore ton sac.";
		Sell = "Vendre";
		Upgrade = "Am\xE9liorer";
		BlocksDiscovered = "{1}/{2} Blocs d\xE9couverts (+{3}% Cash)";
		IndexLayer = "{1} | {2} to {3}";
		IndexLayerNoUp = "{1} | {2} et au-dessus";
		IndexLayerNoDown = "{1} | {2} et dessous";
		BaseValue = "Valeur de base: <font color=\"#00FF00\">${1}</font>";
		CurrentValue = "Valeur actuel: <font color=\"#00FF00\">${1}</font>";
		Durability = "Durabilit\xE9";
		Rarity = "Raret\xE9";
		ProbabilityToSpawn = "Probabilit\xE9 d'apparence: 1 en {1} blocs";
		IndexCredit = "Bloc par";
		Loading = "Chargement en cours";
		TotalMined = "Blocs min\xE9s";
		Back = "Arri\xE8re";
		On = "Activ\xE9";
		Off = "D\xE9sactiv\xE9";
		TimePlayed = "Temps jou\xE9";
		Blocks = "Blocs";
		Shop = "Magasin";
		ComingSoon = "\xC0 venir...";
		Buy = "Acheter";
		Bought = "Achet\xE9";
		Max = "Max";
		Gift = "Cadeau";
		Gamepasses = "Gamepasses";
		Owned = "D\xE9tenu";
		OwnedByRecipient = "Appartenant au destinataire";
		StopGift = "Arr\xEAter de faire des cadeaux";
		NoGifts = "Il n'y a actuellement personne \xE0 offrir sur ce serveur.";
		EnterUsername = "Entrez le nom d'utilisateur ici";
		Emeralds = "\xC9meraudes";
		MostPopular = "LE PLUS POPULAIRE";
		BestOffer = "MEILLEURE OFFRE";
		TeleportRequest = "Demande de t\xE9l\xE9portation";
		TeleportRequestMessage = "Ton ami {1} a demand\xE9 de l'aide, voudrais tu \xEAtre t\xE9l\xE9port\xE9 vers eux?";
		No = "Non";
		Yes = "Oui";
		Upgrades = "Am\xE9liorations";
		Pickaxes = "Pioches";
		Backpacks = "Sacs";
		Close = "Fermer";
		Equip = "\xC9quiper";
		Equipped = "\xC9quip\xE9";
		BuyWithCash = "Acheter (${1})";
		Power = "Puissance";
		Storage = "Stockage";
		Prestige = "Prestige";
		Prestiges = "Prestiges : {1}";
		PrestigeCashBoost = "Boost de tr\xE9sorerie : {1} → {2}";
		PrestigeWithCash = "Prestige (${1})";
		UpgradeWithEmerald = "Mettre \xE0 niveau ({1} Emerald)";
		LobbyTeleport = "T\xE9l\xE9portation du hall";
		LobbyAt = "Salon \xE0 profondeur {1}";
		Teleport = "T\xE9l\xE9portation";
		UnlockFreeTeleports = "D\xE9verrouiller les t\xE9l\xE9portations gratuites";
		PrestigeTokens = "PrestigeTokens";
		Quests = "Qu\xEAtes";
		QuestDisplay = "{1}/{2} ({3}%)";
		Completed = "Termin\xE9";
		GroupBonus = "Rejoignez Jeremy Studio et aimez le jeu pour 50 % d'argent en plus !";
		Tutoriel = "Tutoriel";
		TutorialText = "Bienvenue ! Il y a de nombreux blocs \xE0 d\xE9couvrir, pour commencer \xE0 miner, cliquez ou maintenez enfonc\xE9 sur n'importe quel bloc que vous souhaitez miner. Chaque bloc donne un montant d'argent diff\xE9rent lorsqu'il est vendu, mais vous ne pouvez transporter qu'une quantit\xE9 limit\xE9e de blocs \xE0 la fois. Il existe de nombreuses couches diff\xE9rentes de blocs qui contiennent tous des minerais diff\xE9rents au-dessus et au-dessous de la terre.";
		Ok = "D'accord";
		Luck = "Chance";
		Jackhammer = "Marteau-piqueur";
		TooWeak = "Trop faible";
		Explosion = "Explosion";
		Jump = "Saut";
		Pickaxe = "Pioche";
		Speed = "Vitesse";
		LikeTheGame = "AIME LE JEU";
		ForRewards = "POUR DES R\xC9COMPENSES !";
		Range = "Port\xE9e";
		Crafting = "Artisanat";
		MetaGain = "Obtenez plus de M\xE9ta par Robux d\xE9pens\xE9. Gain actuel : {1} → {2} M\xE9ta par bloc";
		Meta = "M\xE9ta";
		MetaUnlock = "D\xE9verrouiller pour {1}";
		Level = "Niveau";
		Levels = "Niveaux";
		EmeraldUpgrades = "Am\xE9liorations en \xE9meraude";
		AFKMessage = "Tu seras reconnect\xE9 automatiquement toutes les 17 minutes pour \xE9viter d'\xEAtre expuls\xE9 pour inactivit\xE9.";
		FriendMultiMessage = "Invite tes amis pour augmenter la puissance de ta pioche !";
		NoFriendsHere = "Aucun ami ici. Pour chaque ami sur le serveur, tu gagnes 10% de puissance de pioche en plus !";
		FriendMulti = "Multiplicateur actuel d'amis :\n+{1}% de puissance de pioche";
		Auto = "Automatique";
		Pinned = "\xC9pingl\xE9";
		Unequip = "D\xE9s\xE9quiper";
		Pin = "\xC9pingler";
		Unpin = "D\xE9tacher";
		MaxPins = "Nombre maximum d'\xE9pingles";
		MagicPowerInfo = "La puissance magique provient des accessoires que vous avez actuellement \xE9quip\xE9s. Elle vous rend plus fort de diff\xE9rentes mani\xE8res.";
		Craft = "Cr\xE9er";
		CraftNotification = "Vous pouvez cr\xE9er {1} maintenant !";
		PrestigeNotification = "Vous pouvez maintenant effectuer une Prestige !";
		NoReset = "Pas de r\xE9initialisation";
		Sacrifice = "Sacrifice";
		SacrificeMessage = "Le Sacrifice r\xE9initialise les m\xEAmes \xE9l\xE9ments que le Prestige, mais vous pouvez le faire sans atteindre l’exigence d’argent une fois par heure ! Vous recevrez {1} Jetons de Prestige pour ce Sacrifice.";
		Wait = "Attendre";
		ArchivedBlocks = "Blocs Archiv\xE9s";
		CraftingRecommendation = "Il est fortement recommand\xE9 de fabriquer {1} avant toute autre chose !";
		DisableFastFall = "D\xE9sactiver la chute rapide ?";
		Claim = "R\xE9clamer";
		Showcase = "Vitrine";
		TotalValue = "Valeur Totale";
		YourPlacement = "Votre Classement";
		Top100 = "Top 100";
		Or = "OU";
		MetaUnlockProgress = "{1}/{2} D\xE9pens\xE9";
		PrestigeMessageFree = "Avec le Prestige, vous pouvez \xE9changer votre argent contre des Jetons de Prestige et un Bonus d’Argent.";
		PrestigeMessageFreeTokens = "Avec le Prestige, vous pouvez \xE9changer votre argent contre {1} Jetons de Prestige et un Bonus d’Argent.";
		PrestigeMessageFreeDaily = "Le Prestige r\xE9initialise vos pioches, sacs, argent et blocs, mais vous donne un Bonus d’Argent et {1} Jetons de Prestige, sauf si vous attendez {2}, alors seule votre argent sera r\xE9initialis\xE9.";
		BuyAll = "Tout Acheter";
		Cooldown = "Temps de Recharge";
		IndexSecretLayer = "Secret | Partout";
		BlockRewards = "Vous aimez les minerais ? Vous pouvez gagner 750 \xC9meraudes pour chaque minerai jusqu’au niveau Mythique ou 3 000 \xC9meraudes pour chaque minerai \xC9th\xE9r\xE9+ ajout\xE9 au jeu. Soumettez vos minerais sur le serveur Discord indiqu\xE9 dans la description du jeu.";
		LeaderboardProgress = "Vous \xEAtes dans le Top {1}";
		BlockTagged = "Bloc min\xE9 par {1}";
		Trading = "\xC9change";
		LagMessage = "Si vous avez des ralentissements, il est recommand\xE9 de r\xE9duire la distance d’affichage dans le menu des param\xE8tres.";
		TutorialText2 = "Bienvenue ! Maintenez sur n’importe quel bloc pour commencer \xE0 miner. Les blocs plus rares se vendent plus cher. Il existe de nombreuses couches au-dessus et en dessous de la terre avec des blocs bien plus pr\xE9cieux. Leurs lobbies ont des am\xE9liorations uniques.";
		TutorialText3 = "Bienvenue ! Maintenez sur n’importe quel bloc pour commencer \xE0 miner. Les blocs plus rares se vendent plus cher. Il existe de nombreuses couches au-dessus et en dessous de la terre avec des blocs bien plus pr\xE9cieux. Leurs lobbies ont des am\xE9liorations uniques. Jouez suffisamment et vous pourrez miner 2 000 blocs par seconde !";
		Undiscovered = "Non d\xE9couvert";
		PrestigeMessage = "Le Prestige r\xE9initialisera vos Pioches, Sacs \xE0 dos, Argent et Blocs, mais vous recevrez un Bonus d’Argent et {1} Jetons de Prestige";
		PrestigeMessageBetter = "Le Prestige r\xE9initialise uniquement les Pioches, Sacs \xE0 dos, Argent et Blocs, mais vous recevrez un Bonus d’Argent et {1} Jetons de Prestige. <font color=\"#ff0000\">Rien d’autre ne sera r\xE9initialis\xE9 ! Vous progresserez beaucoup plus vite en faisant un Prestige.</font>";
		PrestigeMessageEthereal = "Le Prestige r\xE9initialisera vos Pioches, Sacs \xE0 dos, Argent et Blocs <font color=\"#ff0000\">(Sauf les Blocs Ethereal+ !)</font>, mais vous recevrez un Bonus d’Argent et {1} Jetons de Prestige";
		PrestigeMessageBetterEthereal = "Le Prestige r\xE9initialise uniquement les Pioches, Sacs \xE0 dos, Argent et Blocs <font color=\"#ff0000\">(Sauf les Blocs Ethereal+ !)</font>, mais vous recevrez un Bonus d’Argent et {1} Jetons de Prestige. <font color=\"#ff0000\">Rien d’autre ne sera r\xE9initialis\xE9 ! Vous progresserez beaucoup plus vite en faisant un Prestige.</font>";
	};
	Tips = {
		MiningAbilityInactive = "Astuce : Les capacit\xE9s de minage puissantes sont inactives pr\xE8s du spawn !";
		CraftingNote = "Les accessoires trop difficiles \xE0 fabriquer pour vous sont cach\xE9s. Devenez plus fort et obtenez un sac \xE0 dos plus grand pour les d\xE9bloquer.";
		TradingNote = "Les blocs \xE9chang\xE9s seront archiv\xE9s et ne pourront pas \xEAtre vendus contre de l’argent, mais pourront \xEAtre utilis\xE9s pour l’artisanat !";
	};
	Upgrades = {
		BuyAll = "D\xE9verrouiller tout acheter";
		KeepBackpack = "Niveau de sac \xE0 dos pour conserver les prestiges";
		MorePickaxePower = "Plus de puissance de pioche";
		MoreCash = "Plus d'argent";
		JackhammerChance = "Chance du Marteau-piqueur";
		JackhammerRadius = "Rayon du Marteau-piqueur";
		JackhammerSize = "Taille du Marteau-piqueur";
		MiningSpeed = "Vitesse de minage";
		MiningFrenzy = "Fr\xE9n\xE9sie de minage apr\xE8s avoir trouv\xE9 un bloc \xE9pique";
		ExplosionChance = "Chance d'explosion";
		ExplosionRadius = "Rayon d'explosion";
		TNTLuck = "Chance TNT";
		MiningRange = "Port\xE9e de minage";
		MiningRange2 = "Port\xE9e de minage 2";
		UnlockCrafting = "D\xE9verrouiller l’artisanat";
		MoreAccessorySlots = "Plus d’emplacements d’accessoires";
		MoreMeta1 = "Plus de M\xE9ta 1";
		MoreMeta2 = "Plus de M\xE9ta 2";
		MoreMetaBlocksMined = "Plus de M\xE9ta selon les blocs extraits";
		MoreLuck = "Plus de Chance";
		MoreRange = "Port\xE9e Sup\xE9rieure";
		DuplicateBlocks = "Chance de Duplication de Blocs";
		WalkSpeed = "Vitesse de Marche Sup\xE9rieure";
	};
	UnlockMessages = {
		Prestiges = "D\xE9bloqu\xE9 \xE0 {1} Prestiges";
	};
	Rarity = {"Commun", "Peu commun", "Rare", "\xC9pique", "L\xE9gendaire", "Mythique", "\xC9th\xE9r\xE9e", "C\xE9leste", "Z\xE9nith", "Divin", "N\xE9ant"};
	Settings = {
		Low = "Haute qualit\xE9";
		LowDesc = "Tous les blocs principaux d'un calque appara\xEEtront en haute qualit\xE9, cela peut entra\xEEner beaucoup de d\xE9calage";
		RenderDistance = "Distance de vision";
		RenderDistanceDesc = "Changer combiens de morceaux tu peux voir dans chaque direction";
		Teleport = "T\xE9l\xE9porter";
		TeleportDesc = "Les amis que tu invites seront invit\xE9s \xE0 \xEAtre t\xE9l\xE9port\xE9 \xE0 ta position actuelle";
		Music = "Musique";
		MusicDesc = "Bascule si la musique doit jouer ou non";
		FastFall = "Chute rapide";
		FastFallDesc = "Vous serez t\xE9l\xE9port\xE9 au fond d'un trou en tombant pendant un certain temps";
		x2Speed = "2x Vitesse";
		x2SpeedDesc = "D\xE9sactive le fait que vous marchez deux fois plus vite que d'habitude";
		x2Jump = "2x Sauter";
		x2JumpDesc = "D\xE9sactive le fait que vous sautez deux fois plus haut que d'habitude";
		Reload = "Recharger les morceaux";
		ReloadDesc = "Vous pouvez recharger tous les blocs en cas de p\xE9pins";
		FastFly = "Vol Rapide";
		FastFlyDesc = "Vous serez t\xE9l\xE9port\xE9 au point le plus haut lorsque vous utilisez le jetpack pendant un certain temps";
		DarkLighting = "\xC9clairage Sombre";
		DarkLightingDesc = "Active/D\xE9sactive l’\xE9clairage sombre";
		FriendMarkers = "Marqueurs d’amis";
		FriendMarkersDesc = "Active ou d\xE9sactive la visibilit\xE9 de tes amis";
		BreakingSprites = "Sprites de cassure";
		BreakingSpritesDesc = "Active ou d\xE9sactive la visibilit\xE9 des sprites de cassure pendant l’extraction des blocs";
		JumpJetpack = "Jetpack de Saut";
		JumpJetpackDesc = "Vous utiliserez automatiquement le jetpack en sautant";
		Sounds = "Sons";
		SoundsDesc = "Active ou d\xE9sactive la lecture des sons";
		ChatTags = "Balises de discussion";
		AutoRender = "Rendu automatique";
		AutoRenderDesc = "R\xE9duit automatiquement la distance d’affichage en cas de lag";
		BlockStepping = "Mont\xE9e automatique";
		BlockSteppingDesc = "Vous montez automatiquement sur les blocs";
	};
	ChatMessages = {
		BlockFound = "{1} vient de trouver {2}";
		MultipleBlocksFound = "{1} vient de trouver {2} {3}";
		OreFound = "{1} vient de trouver {2} ({3}) dans le niveau {4} (1 en {5} blocs)";
		OreFoundShort = "{1} vient de trouver {2} (1 en {3} blocs)";
		MultipleOresFound = "{1} vient de trouver {2} {3} ({4}) dans le niveau {5} (1 en {6} blocs)";
		YouBlockFound = "Tu viens de trouver {1}";
		YouMultipleBlocksFound = "Tu viens de trouver {1} {2}";
		YouOreFound = "Tu viens de trouver {1} ({2}) dans le niveau {3} (1 en {4} blocs)";
		YouOreFoundShort = "Tu viens de trouver {1} (1 en {2} blocs)";
		YouMultipleOresFound = "Tu viens de trouver {1} {2} ({3}) dans le niveau {4} (1 en {5} blocs)";
		TeleporterDestroyed = "Votre t\xE9l\xE9porteur a \xE9t\xE9 d\xE9truit car un bloc a \xE9t\xE9 plac\xE9 dessus";
		MiningFrenzy = "Fr\xE9n\xE9sie de minage activ\xE9e ! Vous minerez {1} plus vite et ferez {2} d\xE9g\xE2ts suppl\xE9mentaires pendant 1 minute !";
		LikeGoalReached1 = "Objectif de likes atteint. +25% de vitesse de minage et +25% de d\xE9g\xE2ts pendant les {1} prochaines minutes.";
		LikeGoalReached2 = "Objectif de likes atteint. +25% d'argent et +25% de d\xE9g\xE2ts pendant les {1} prochaines minutes.";
		OreUncovered = "Un minerai de {1} vient d’\xEAtre d\xE9couvert !";
		EmeraldUncovered = "Une \xE9meraude vient d’\xEAtre d\xE9couverte !";
		Emerald = "{1} vous a offert {2} \xC9meraudes";
		Gamepass = "{1} vous a offert {2}";
		EmeraldYou = "Vous avez offert {2} \xC9meraudes \xE0 {1}";
		GamepassYou = "Vous avez offert {2} \xE0 {1}";
		EmeraldOther = "{1} a offert {3} \xC9meraudes \xE0 {2}";
		GamepassOther = "{1} a offert {3} \xE0 {2}";
		BlockEmeraldsAwarded = "Vous avez re\xE7u {1} \xC9meraudes pour avoir cr\xE9\xE9 des minerais !";
		UnprocessedBlock = "Vous avez re\xE7u {1} car le serveur a \xE9t\xE9 ferm\xE9.";
		BigCave = "Une grande grotte est apparue pr\xE8s de vous !";
	};
	ChatTips = {"Fait amusant : il y a un total de {1} am\xE9liorations dans ce jeu !", "Il y a actuellement {1} blocs uniques dans le jeu !", "La plupart des minerais du jeu ont \xE9t\xE9 cr\xE9\xE9s par {1} et {2}", "Bloqu\xE9 ? Essayez de faire un Prestige.", "L’un des d\xE9veloppeurs du jeu poss\xE8de le plus grand nombre de badges sur Roblox avec 135 millions de badges et a atteint la limite maximale possible.", "La raret\xE9 de bloc la plus rare a une chance d’apparition de 1 sur 2 000 000 000...", "La vitesse de minage est plus utile qu’elle n’en a l’air au premier abord...", "Les cadeaux fonctionnent entre les serveurs, m\xEAme si la personne \xE0 qui vous offrez est hors ligne. Elle doit simplement avoir jou\xE9 au jeu au moins une fois.", "Les autoclickers et macros sont autoris\xE9s, mais pas l’exploitation.", "Apr\xE8s avoir d\xE9bloqu\xE9 l’artisanat et fabriqu\xE9 l’artefact Machina, vous pouvez quitter le jeu pour qu’il grind automatiquement pour vous.", "Il y a une chance de 1 sur 10 000 d’obtenir ce message. F\xE9licitations !"};
	DiscordChatTips = {"Si tu aimes les minerais du jeu, tu peux cr\xE9er les tiens sur le serveur Discord du jeu :)"};
	ServerResponses = {
		Error = "Une erreur s'est produit, r\xE9essayez plus tard";
		AppealEmpty = "L'appel ne peut pas \xEAtre vide";
		AppealInvalidCharacters = "L'appel contient des caract\xE8res invalides";
		AppealTooShort = "L'appel est trop court";
		AppealTooLong = "L'appel est trop long";
		AppealTooFast = "Vous \xEAtes entrain d'envoyer des appels trop rapidement, ralentissez";
		AppealFiltered = "L'appel a \xE9t\xE9 filtr\xE9";
		AppealSuccess = "L'appel a \xE9t\xE9 envoy\xE9 avec succ\xE8s, vous aurez un retour bient\xF4t.";
		ResponseEmpty = "La r\xE9ponse ne peut pas \xEAtre vide";
		ResponseInvalidCharacters = "La r\xE9ponse contient des caract\xE8res invalides";
		ResponseTooShort = "La r\xE9ponse est trop courte";
		ResponseTooLong = "La r\xE9ponse est trop longue";
		ResponseDecision = "Vous devez s\xE9l\xE9ctionner une d\xE9cision";
		ResponseTooFast = "Vous \xEAtes entrain d'envoyer trop de r\xE9ponses, ralentissez";
		ResponseFiltered = "La r\xE9ponse a \xE9t\xE9 filtr\xE9e";
		NotBanned = "Cet utilisateur n'est pas bannis";
		AlreadyResponded = "Une r\xE9ponse \xE0 cet appel a d\xE9j\xE0 \xE9t\xE9 envoy\xE9";
		NoData = "Cet utilisateur n'a pas de data";
		UnableRespond1 = "Incapable de r\xE9pondre \xE0 cet appel, merci de contacter un quelqu'un de plus haut rang pour de l'assistance";
		UnableRespond2 = "Incapable de r\xE9pondre \xE0 cet appel, car cet utilisateur a \xE9t\xE9 super bannis \xE0 vie";
		ResponseSuccess = "R\xE9ponse envoy\xE9e avec succ\xE8s";
		LayerTooPowerful = "La couche est trop puissante, l'explosif ne peut pas \xEAtre plac\xE9";
		NoBlocksExploded = "L'explosif n'a fait exploser aucun bloc et n'a pas \xE9t\xE9 charg\xE9";
		GiftSuccess = "Votre cadeau pour {1} a \xE9t\xE9 envoy\xE9 avec succ\xE8s";
		GiftError = "Votre cadeau pour {1} a \xE9chou\xE9, il sera r\xE9essay\xE9 lorsque vous vous rejoignez";
		InvalidUser = "Utilisateur invalide";
		GiftYourself = "Impossible de s'offrir";
		MoveAway = "\xC9loignez-vous d'au moins 75 blocs du point d'apparition.";
	};
	Admin = {
		Appeals = "Appels";
		NoPendingAppeals = "Actuellement il n'y a pas d'appels disponibles.";
		Reload = "Recharger";
		LoadingAppeals = "Chargement d'appels...";
		SendResponse = "Envoyer r\xE9ponse";
		EnterResponse = "Entrez votre r\xE9ponse \xE0 l'appel ici";
		Deny = "Refuser";
		Accept = "Accepter";
		TempBan = "Banni pendant {1} pour \"{2}\"";
		PermBan = "Banni d\xE9finitivement pour \"{1}\"";
		SuperPermBan = "Banni de fa\xE7on super permanente pour \"{1}\"";
		Unban = "D\xE9banni par {1}";
	};
	Ban = {
		AccountBan = "Bannissement de compte";
		Temp = "Vous avez \xE9t\xE9 bannis temporairement pour {1}!";
		Perm = "Vous avez \xE9t\xE9 bannis \xE0 vie pour {1}!";
		TimeBanned = "Temps interdit: {1}";
		BanEnds = "Ban termine: {1}";
		BanEndsTimer = "Ban termin\xE9 en {1}";
		BanEndsNever = "Ban ne termine jamais";
		BanEnded = "Ban termin\xE9: {1}";
		AppealMessage = "Si vous souhaitez faire un appel, contactez nous dans formulaire dessous.";
		AppealMessageRubenSim = "Si tu souhaites faire appel, contacte Ruben Sim.";
		AppealSent = "Si vous avez envoy\xE9 un appel, nous allons vous donnez un retour d\xE8s que possible.";
		AppealDenied = "Votre appel a \xE9t\xE9 refus\xE9, consultez les messages pour plus d'informations.";
		AppealAccepted = "Votre appel a \xE9t\xE9 accept\xE9, et vous pouvez continuer \xE0 jouer.";
		Appeal = "Appel";
		AppealOnce = "Vous ne pouvez faire qu'un appel";
		AppealTextBox = "Entrer votre appel ici, donnez le plus de d\xE9tailles que possible";
		Send = "Envoyer";
		ViewMessages = "Voir m\xE9ssages";
		Messages = "M\xE9ssages";
		YouWrote = "Vous avez \xE9crit";
		OtherWrote = "{1} avez \xE9crit";
	};
	Trading = {
		WaitForPeople = "En attente de joueurs pour \xE9changer...";
		WaitForTradeRequests = "En attente de demandes d’\xE9change...";
		WantsToTrade = "{1} souhaite \xE9changer avec vous";
		Accept = "Accepter";
		Unaccept = "Annuler l’acceptation";
		Deny = "Refuser";
		EnterAmount = "Entrer le montant";
		Confirmation = "\xCAtes-vous s\xFBr ?";
		NoResults = "Aucun r\xE9sultat trouv\xE9.";
		TradeDenied = "{1} a refus\xE9 l’\xE9change !";
		Offering = "Offre de {1}";
		Regulations = "Certains objets sont d\xE9sactiv\xE9s en raison de r\xE9glementations locales.";
		NotAcceptedYet = "Pas encore accept\xE9";
		WaitingForAccept = "Accept\xE9, en attente de votre validation";
		ProcessingIn = "\xC9change en cours dans {1} secondes";
		NoItemsAvailable = "Aucun objet disponible pour cet \xE9change.";
		NoItemsOffered = "Aucun objet propos\xE9.";
		TradeCompleted = "L’\xE9change est termin\xE9.";
		TradeFailed = "Une erreur est survenue pendant l’\xE9change.";
		TradeLimit = "{1}/{2} \xC9changes";
		TradeLimitReset = "R\xE9initialisation dans {1}";
	};
	Accessories = {{{
		Name = "Talisman Duplici";
		Desc = "Le Talisman Duplici offre une chance suppl\xE9mentaire de {Boost_Dupe} pour obtenir un bloc suppl\xE9mentaire lors du minage.";
	}, {
		Name = "Anneau Duplici";
		Desc = "L'Anneau Duplici offre une chance suppl\xE9mentaire de {Boost_Dupe} pour obtenir un bloc suppl\xE9mentaire lors du minage.";
	}, {
		Name = "Relique Duplici";
		Desc = "La Relique Duplici offre une chance suppl\xE9mentaire de {Boost_Dupe} pour obtenir un bloc suppl\xE9mentaire lors du minage.";
	}, {
		Name = "H\xE9ritage Duplici";
		Desc = "L'H\xE9ritage Duplici offre une chance suppl\xE9mentaire de {Boost_Dupe} pour obtenir un bloc suppl\xE9mentaire lors du minage.";
	}}, {{
		Name = "Anneau Ruber";
		Desc = "L'Anneau Ruber offre une chance suppl\xE9mentaire de {Boost_RareExplosion} de provoquer une explosion de puissance 5 lorsqu'un bloc rare est min\xE9.";
	}, {
		Name = "Relique Ruber";
		Desc = "La Relique Ruber offre une chance suppl\xE9mentaire de {Boost_RareExplosion} de provoquer une explosion de puissance 5 lorsqu'un bloc rare est min\xE9.";
	}, {
		Name = "H\xE9ritage Ruber";
		Desc = "L'H\xE9ritage Ruber offre une chance suppl\xE9mentaire de {Boost_RareExplosion} de provoquer une explosion de puissance 5 lorsqu'un bloc rare est min\xE9.";
	}, {
		Name = "Chronomicon Ruber";
		Desc = "Le Chronomicon Ruber offre une chance suppl\xE9mentaire de {Boost_RareExplosion} de provoquer une explosion de puissance 5 lorsqu'un bloc rare est min\xE9.";
	}}, {{
		Name = "Anneau Tirelire";
		Desc = "L'Anneau Tirelire offre un bonus suppl\xE9mentaire de {Boost_Cash} \xE0 la Caisse.";
	}, {
		Name = "Relique Tirelire";
		Desc = "La Relique Tirelire offre un bonus suppl\xE9mentaire de {Boost_Cash} \xE0 la Caisse.";
	}, {
		Name = "H\xE9ritage Tirelire";
		Desc = "L'H\xE9ritage Tirelire offre un bonus suppl\xE9mentaire de {Boost_Cash} \xE0 la Caisse.";
	}, {
		Name = "Chronomicon Tirelire";
		Desc = "Le Chronomicon Tirelire est un accessoire puissant qui offre un bonus suppl\xE9mentaire de {Boost_Cash} \xE0 la Caisse et un bonus additionnel de 5% \xE0 la Caisse.";
	}, {
		Name = "Tirelire Ascendante";
		Desc = "La Tirelire Ascendante est un accessoire tr\xE8s puissant qui offre un bonus suppl\xE9mentaire de {Boost_Cash} \xE0 l’argent, ainsi qu’un autre bonus de 10% par-dessus.";
	}}, {{
		Name = "Talisman du Mineur";
		Desc = "Le Talisman du Mineur est un accessoire de base qui offre un bonus de {Boost_Cash} \xE0 l’argent et de {Boost_PickaxePower} aux d\xE9g\xE2ts de la pioche.";
	}, {
		Name = "Anneau du Mineur";
		Desc = "L’Anneau du Mineur est un accessoire qui offre un bonus de {Boost_Cash} \xE0 l’argent et de {Boost_PickaxePower} aux d\xE9g\xE2ts de la pioche.";
	}, {
		Name = "Relique du Mineur";
		Desc = "La Relique du Mineur est un accessoire qui offre un bonus de {Boost_Cash} \xE0 l’argent et de {Boost_PickaxePower} aux d\xE9g\xE2ts de la pioche.";
	}, {
		Name = "H\xE9ritage du Mineur";
		Desc = "L’H\xE9ritage du Mineur est un accessoire qui offre un bonus de {Boost_Cash} \xE0 l’argent et de {Boost_PickaxePower} aux d\xE9g\xE2ts de la pioche.";
	}, {
		Name = "Chronomicon du Mineur";
		Desc = "Le Chronomicon du Mineur est un accessoire qui offre un bonus de {Boost_Cash} \xE0 l’argent et de {Boost_PickaxePower} aux d\xE9g\xE2ts de la pioche.";
	}, {
		Name = "Monde du Mineur";
		Desc = "Le Monde du Mineur est un accessoire qui offre un bonus de {Boost_Cash} \xE0 l’argent et de {Boost_PickaxePower} aux d\xE9g\xE2ts de la pioche, ainsi que {Boost_PrestigeTokens} Jetons de Prestige et {Boost_MiningSpeed} de vitesse de minage. Les vendredis et week-ends, l’argent et les d\xE9g\xE2ts sont doubl\xE9s.";
	}}, {{
		Name = "Relique de H\xE2te";
		Desc = "La Relique de H\xE2te est un accessoire qui augmente la vitesse de minage de {Boost_MiningSpeed}.";
	}, {
		Name = "H\xE9ritage de H\xE2te";
		Desc = "L’H\xE9ritage de H\xE2te est un accessoire qui augmente la vitesse de minage de {Boost_MiningSpeed}.";
	}, {
		Name = "Chronomicon de H\xE2te";
		Desc = "Le Chronomicon de H\xE2te est un puissant accessoire qui augmente la vitesse de minage de {Boost_MiningSpeed}.";
	}, {
		Name = "H\xE2te Ascend\xE9e";
		Desc = "La H\xE2te Ascend\xE9e est un accessoire tr\xE8s puissant qui augmente la vitesse de minage de {Boost_MiningSpeed}.";
	}, {
		Name = "H\xE2te \xC9ternelle";
		Desc = "La H\xE2te \xC9ternelle est un accessoire extr\xEAmement puissant qui augmente la vitesse de minage de {Boost_MiningSpeed}.";
	}}, {{
		Name = "Artefact de Vitesse";
		Desc = "L'Artefact de Vitesse augmente votre vitesse de marche de {Boost_WalkSpeed} blocs par seconde.";
	}}, {{
		Name = "Anneau de Crepitus";
		Desc = "L’Anneau de Crepitus est un accessoire qui a {Boost_ExtraExplosionRadiusChance} de chance par activation de la capacit\xE9 d’Explosion d’ajouter +1 au rayon.";
	}, {
		Name = "Relique de Crepitus";
		Desc = "La Relique de Crepitus est un accessoire qui a {Boost_ExtraExplosionRadiusChance} de chance par activation de la capacit\xE9 d’Explosion d’ajouter +1 au rayon.";
	}, {
		Name = "H\xE9ritage de Crepitus";
		Desc = "L’H\xE9ritage de Crepitus est un accessoire qui a {Boost_ExtraExplosionRadiusChance} de chance par activation de la capacit\xE9 d’Explosion d’ajouter +1 au rayon.";
	}, {
		Name = "Chronomicon de Crepitus";
		Desc = "Le Chronomicon de Crepitus est un accessoire qui a {Boost_ExtraExplosionRadiusChance} de chance par activation de la capacit\xE9 d’Explosion d’ajouter +1 au rayon.";
	}, {
		Name = "Crepitus Max";
		Desc = "Le Crepitus Max est un accessoire qui a {Boost_ExtraExplosionRadiusChance} de chance par activation de la capacit\xE9 d’Explosion d’ajouter +1 au rayon.";
	}}, {{
		Name = "Art\xE9fact Fragon";
		Desc = "L’Art\xE9fact Fragon cr\xE9e une explosion de puissance 25 lorsqu’un bloc mythique est min\xE9.";
	}}, {{
		Name = "Anneau Bang";
		Desc = "L'anneau Bang a une chance de {Boost_LegendaryExplosion} de cr\xE9er une explosion de puissance 17 lorsqu'un bloc l\xE9gendaire est min\xE9.";
	}, {
		Name = "Relique Bang";
		Desc = "La relique Bang a une chance de {Boost_LegendaryExplosion} de cr\xE9er une explosion de puissance 17 lorsqu'un bloc l\xE9gendaire est min\xE9.";
	}, {
		Name = "H\xE9ritage Bang";
		Desc = "L'h\xE9ritage Bang a une chance de {Boost_LegendaryExplosion} de cr\xE9er une explosion de puissance 17 lorsqu'un bloc l\xE9gendaire est min\xE9.";
	}, {
		Name = "Chronomicon Bang";
		Desc = "Le Chronomicon Bang a une chance de {Boost_LegendaryExplosion} de cr\xE9er une explosion de puissance 20 lorsqu'un bloc l\xE9gendaire est min\xE9.";
	}}, {{
		Name = "Talisman Radar";
		Desc = "Le talisman radar indique les minerais l\xE9gendaires+ proches dans un rayon de {Boost_RadarRadius} blocs.";
	}, {
		Name = "Anneau Radar";
		Desc = "L'anneau radar indique les minerais l\xE9gendaires+ proches dans un rayon de {Boost_RadarRadius} blocs.";
	}, {
		Name = "Relique Radar";
		Desc = "La relique radar indique les minerais l\xE9gendaires+ proches dans un rayon de {Boost_RadarRadius} blocs.";
	}, {
		Name = "H\xE9ritage Radar";
		Desc = "L'h\xE9ritage radar indique les minerais l\xE9gendaires+ proches dans un rayon de {Boost_RadarRadius} blocs.";
	}, {
		Name = "Chronomicon Radar";
		Desc = "Le Chronomicon radar indique les minerais l\xE9gendaires+ proches dans un rayon de {Boost_RadarRadius} blocs.";
	}}, {{
		Name = "Artefact Machina";
		Desc = "Cet artefact automatise votre exp\xE9rience de minage en prenant le contr\xF4le de votre corps selon votre volont\xE9.";
	}, {
		Name = "Machina du Second Ordre";
		Desc = "Am\xE9liore le minage automatique pour extraire des minerais L\xE9gendaires+ et augmente votre vitesse de d\xE9placement de 100 %.";
	}, {
		Name = "Machina du Troisi\xE8me Ordre";
		Desc = "Am\xE9liore le minage automatique pour extraire des minerais Rares+, augmente votre vitesse de d\xE9placement de 200 % et porte l'efficacit\xE9 du minage automatique \xE0 60 % au lieu de 50 %.";
	}, {
		Name = "Machina de l’Ordre Supr\xEAme";
		Desc = "Am\xE9liore le minage automatique pour extraire le TNT, augmente son efficacit\xE9 \xE0 100 % au lieu de 60 %, accro\xEEt votre vitesse de d\xE9placement de 500 % et vend automatiquement votre sac \xE0 dos lorsqu’il est plein jusqu’\xE0 trois fois par jour.";
	}, {
		Name = "Machina Incarn\xE9e";
		Desc = "Am\xE9liore le minage automatique pour extraire tous les minerais L\xE9gendaires+ quelle que soit la distance, et miner du TNT vous accorde tous les blocs qu’il fait exploser.";
	}, {
		Name = "Pr\xE9voir Chaque \xC9ventualit\xE9";
		Desc = "Am\xE9liore le minage automatique pour extraire instantan\xE9ment tous les minerais de Peu commun \xE0 \xC9th\xE9r\xE9 que vous pouvez miner assez rapidement, et permet de miner le TNT \xE0 double distance.";
	}}, {{
		Name = "Relique Malleus";
		Desc = "La Relique Malleus ajoute une chance de {Boost_JackhammerChance} au Jackhammer.";
	}, {
		Name = "H\xE9ritage Malleus";
		Desc = "L'H\xE9ritage Malleus ajoute une chance de {Boost_JackhammerChance} au Jackhammer.";
	}, {
		Name = "Chronomicon Malleus";
		Desc = "Le Chronomicon Malleus ajoute une chance de {Boost_JackhammerChance} au Jackhammer.";
	}, {
		Name = "Malleus Ascend\xE9";
		Desc = "Malleus Ascend\xE9 ajoute une chance de {Boost_JackhammerChance} au Jackhammer.";
	}}, {{
		Name = "H\xE9ritage Exitium";
		Desc = "L'H\xE9ritage Exitium ajoute une chance de {Boost_ExplosionChance} \xE0 l'Explosion.";
	}, {
		Name = "Chronomicon Exitium";
		Desc = "Le Chronomicon Exitium ajoute une chance de {Boost_ExplosionChance} \xE0 l'Explosion.";
	}, {
		Name = "Exitium Ascend\xE9";
		Desc = "Exitium Ascend\xE9 ajoute une chance de {Boost_ExplosionChance} \xE0 l'Explosion.";
	}}, {{
		Name = "Talisman Fodienda";
		Desc = "Le Talisman Fodienda augmente votre Port\xE9e de Minage de {Boost_MiningRange} blocs.";
	}, {
		Name = "Anneau Fodienda";
		Desc = "L’Anneau Fodienda augmente votre Port\xE9e de Minage de {Boost_MiningRange} blocs.";
	}, {
		Name = "Relique Fodienda";
		Desc = "La Relique Fodienda augmente votre Port\xE9e de Minage de {Boost_MiningRange} blocs.";
	}, {
		Name = "H\xE9ritage Fodienda";
		Desc = "L’H\xE9ritage Fodienda augmente votre Port\xE9e de Minage de {Boost_MiningRange} blocs.";
	}, {
		Name = "Chronomicon Fodienda";
		Desc = "Le Chronomicon Fodienda augmente votre Port\xE9e de Minage de {Boost_MiningRange} blocs.";
	}, {
		Name = "Fodienda Ascend\xE9e";
		Desc = "La Fodienda Ascend\xE9e augmente votre port\xE9e de minage de {Boost_MiningRange} blocs.";
	}}, {{
		Name = "Anneau de Fortuna";
		Desc = "L’Anneau de Fortuna augmente votre chance de {Boost_Luck}.";
	}, {
		Name = "Relique de Fortuna";
		Desc = "La Relique de Fortuna augmente votre chance de {Boost_Luck}.";
	}, {
		Name = "H\xE9ritage de Fortuna";
		Desc = "L’H\xE9ritage de Fortuna augmente votre chance de {Boost_Luck}.";
	}, {
		Name = "M\xE8re Fortuna";
		Desc = "M\xE8re Fortuna augmente votre chance de {Boost_Luck}.";
	}}, {{
		Name = "Artefact Automate Nucl\xE9aire";
		Desc = "R\xE9duit le temps de recharge des explosifs de {Boost_ExplosiveCooldownReduction} lorsque vous \xEAtes en ligne.";
	}}, {{
		Name = "H\xE9ritage de Puissance Nucl\xE9aire";
		Desc = "Augmente la puissance des explosifs de {Boost_ExplosiveRadius}.";
	}, {
		Name = "Chronomicon de Puissance Nucl\xE9aire";
		Desc = "Augmente la puissance des explosifs de {Boost_ExplosiveRadius}.";
	}}, {{
		Name = "Nucleus Simul – Le Final";
		Desc = "Augmente la puissance des explosifs de {Boost_ExplosiveRadius} et r\xE9duit leur temps de recharge de {Boost_ExplosiveCooldownReduction} lorsque vous \xEAtes en ligne. Combine l’Artefact Automate Nucl\xE9aire et le Chronomicon de Puissance Nucl\xE9aire.";
	}}, {{
		Name = "Relique d’Auctoritas";
		Desc = "La Relique d’Auctoritas augmente vos jetons de prestige de {Boost_PrestigeTokens}.";
	}, {
		Name = "H\xE9ritage d’Auctoritas";
		Desc = "L’H\xE9ritage d’Auctoritas augmente vos jetons de prestige de {Boost_PrestigeTokens}.";
	}, {
		Name = "Chronomicon d’Auctoritas";
		Desc = "Le Chronomicon d’Auctoritas augmente vos jetons de prestige de {Boost_PrestigeTokens}.";
	}, {
		Name = "Auctoritas Transcend\xE9";
		Desc = "Auctoritas Transcend\xE9 augmente vos jetons de prestige de {Boost_PrestigeTokens}.";
	}}, {{
		Name = "Artefact Vulnus du Minerai";
		Desc = "Cet accessoire extrait tous les minerais adjacents au bloc min\xE9 si vous pouvez les extraire assez rapidement.";
	}}, {{
		Name = "Anneau Sinum";
		Desc = longstring1;
	}, {
		Name = "Relique Sinum";
		Desc = longstring1;
	}}, {{
		Name = "Artefact Ruptis";
		Desc = "Avec l’artefact Ruptis, les explosions caus\xE9es par les minerais \xC9th\xE9r\xE9s+ vous accordent tous les blocs qu’elles d\xE9truisent.";
	}}, {{
		Name = "Mobilitas Ultima";
		Desc = "Miner un minerai Rare provoque une explosion de puissance 6, un minerai L\xE9gendaire une explosion de puissance 20 et un minerai Mythique une explosion de puissance 33. Vous obtenez tous les blocs explos\xE9s par les minerais \xC9th\xE9r\xE9s+ et miner des \xC9meraudes provoque une explosion de puissance 17. Cet accessoire combine le Ruber Chronomicon, le Fragon Artifact, le Bang Chronomicon et l’Artefact Ruptis.";
	}}, {{
		Name = "Talisman Magicae";
		Desc = longstring2;
	}, {
		Name = "Anneau Magicae";
		Desc = longstring2;
	}, {
		Name = "Relique Magicae";
		Desc = longstring2;
	}, {
		Name = "H\xE9ritage Magicae";
		Desc = longstring2;
	}, {
		Name = "Chronomicon Magicae";
		Desc = longstring2;
	}}};
	Blocks = {"Terre", "Sable", "Limon", "Argile", "Terreau", "Tourbe", "Craie", "Compost", "Gravier", "Entisols", "Aridisols", "Inceptisols", "Gelisols", "Jermanite", "Terre Compact\xE9e", "Racines", "Champignon", "Champignons", "Pommes de terre", "Betterave", "Panais", "Gingembre", "Curcuma", "Tunnel des gophers", "Taupes", "Mollisols", "Poterie cass\xE9e", "Capsule temporelle", "Boue Compact\xE9e", "Boue Compacte", "Boue D\xE9pos\xE9e par l'Eau", "Boue V\xE9g\xE9tale", "Roue", "Ville de Boue", "Boue Sale", "Squelette", "Tr\xE9sor", "Boue Extraterrestre", "Nokia", "D\xE9chets Nucl\xE9aires", "Gisement de P\xE9trole", "Huile Moteur", "Boue Pr\xE9historique", "Terre Dense", "Ail", "Radis", "Yucca", "Jicama", "Fourmis", "Insectes", "Grillons de J\xE9rusalem", "Millep\xE2tes", "Termites", "Armes cass\xE9es", "Pi\xE8ces anciennes", "Pointes de fl\xE8che", "Os", "Artefact antique", "Boue", "Sol herbeux", "Sol champignons", "Sol labour\xE9", "Sol \xE0 racines v\xE9g\xE9tales", "Sol infect\xE9", "Sol soleil-r\xE9ception", "Terre enracin\xE9e d'arbre", "Sol infect\xE9 par les d\xE9chets", "Terre m\xE9ga", "Sol nid d'araign\xE9e", "Terreau de canard en caoutchouc", "Sol en papier", "Forfait sol", "Pierre", "Silex", "Coquine", "Dolomite", "Travertine", "Tufa", "Oolite", "Brecca", "Conglom\xE9rat", "Caliche", "Gr\xE8s", "Siltite", "Diatomite", "Halite", "Cristal", "Herbe profonde", "Herbe morte", "Herbe mouill\xE9e", "Herbe fertile", "Herbe in\xE9gale", "Herbe gel\xE9e", "Herbe craquel\xE9e", "Herbe fausse", "Herbe enracin\xE9e", "Herbe ensemenc\xE9e", "Herbe extraterrestre", "Herbe lunaire", "Herbe \xE0 verre de terre", "Herbe touch\xE9e", "Crat\xE8re", "Pierre Compact\xE9e", "Marbre", "Novaculite", "Quartzite", "Skarn", "Gneiss", "Amphibolite", "Hornfels", "Ardoise", "Schiste", "Phyllite", "St\xE9atite", "Anthracite", "Mariposite", "Verdit", "Lapis Lazuli", "Herbe", "Fescue", "Moneywort", "Herbe de chiendent", "Herbe \xE0 oie", "Carr\xE9 d'herbe", "Herbe de Dallis", "Queue de cheval", "Blanc italien", "Mauve", "Herbe de sorci\xE8re", "Speedwell", "Plante jeune", "Achill\xE9e", "Pissenlits", "Tr\xE8fles \xE0 quatre feuilles", "Pierre Dense", "Diorite", "And\xE9site", "Rhyolite", "Granit", "Pegmatite", "Gabbro", "Diabase", "Basalte", "Plagioclase", "Diacite", "Cuivre furtif", "Tuf", "Bastna\xE9site", "Opale de feu", "Ciel", "Nuage blanc", "Nuage gris claire", "Nuage gris sombre", "Avion", "Cerf-volant", "Oiseau", "Jet priv\xE9", "Ballon m\xE9t\xE9o", "Helicopt\xE8re", "Dirigeable", "Helicopt\xE8re militaire", "Orage", "Tornade", "Volcan", "Obsidienne", "Salaxum", "Bax\xE9rite", "Supr\xE9cerese", "Salaxum v\xE9hiculaire", "D\xE9conogaron", "Bauxite", "Scrolin", "Peragomite", "Obsidienne muosique", "Lascero Lamenta", "Obsidienne arc-en-ciel", "X\xE9notime", "Monazite", "Haut ciel", "Tra\xEEn\xE9es de jet", "Rayons de soleil", "Nuages minces", "Drone", "Nuage m\xE9ga", "Ambiance brumeuse", "Chute de d\xE9chets spatiaux", "\xC9clipse solaire", "Fus\xE9e", "OVNI", "Aurores bor\xE9ales", "Nuages ​​lumineux", "Firmament", "Obsidienne fondue", "Silia", "P\xE9ragomite", "Flamespawn", "Shimicala", "Graeconogaron", "G\xE9ris", "Pyrrhomomite", "Dotorite", "Centromodor", "Vaporeyester", "Blazestone", "Terracite", "Magmaium", "Espace", "\xC9toile rouge", "\xC9toile orange", "Le soleil", "M\xE9t\xE9ore", "Ast\xE9ro\xEFde", "Lune", "Plan\xE8te naine", "Satellite", "Plan\xE8te", "Com\xE8te", "Anneau Plan\xE8te", "L'ISS", "Oumuamua", "Lave", "Basalte renforc\xE9", "Scoria", "Pumice", "Lave solide", "Divenestium", "Stellan", "Byrrzome", "Xapotote", "Gnixon", "Polonite", "Coeur du feu", "Soleil int\xE9gr\xE9", "Enfer", "Pierre Radioactive", "Uranium", "Uraniumite", "Gamite", "Moptazik", "Paretium", "Limioactif", "Ratiteium", "Zoniumite", "Whihite", "Adsimite", "Prenium", "Legenium", "Limonion", "Obsidienne toxique", "Pierre concass\xE9e", "D\xE9chets d'huile", "Noyau durci", "Os fissur\xE9s", "Cube artificiel", "D\xE9chets fissur\xE9s", "Reste de robot pr\xE9historique", "\xC9clats de lave", "D\xE9bris en fusion", "B\xE9ryl rouge", "Painite", "Outil ancien", "Cristal du soleil", "D\xE9chets sous pression", "D\xE9chets de givre", "Lave toxique", "Lave solaire", "Lave Timloin", "Lave Himloin", "Lave noire", "Lave tomicity", "Lave humanitaire", "Lave gaminyity", "Lave toxique", "Lave bluenity", "Lave mapicle", "Lave de mort", "Lave toxim", "Lave volcanique", "Lave mortuaire", "Lave bouillante", "Aluminum", "Fulocite", "Telbar", "Mercure", "Phigarium", "Rizufide", "Jagdite", "Yulacite", "Vaxium", "Farlicin", "Derilium", "Birucite", "Sacreoxyn", "Wasecraesiel", "Le Cristal L\xE9viathan", "Noyau externe", "Riljud", "Carzyum", "Selorus", "Foxrophine", "Incindirum", "Ectoplasme", "Saffron", "Subsinite", "Aluhargium", "Parchium", "Zanforn-88", "Tarrulum", "K4R-UL-1UM", "Jyrulphasion", "\xC9L\xC9MENT TON-618", "Noyau moyen", "Soultriek", "Rejewel", "Jokerium", "Hydrog\xE8ne impur", "Darnite", "Aethernum", "Macabrium", "Aunolite", "Fernokajin", "Netherite", "Nickel bien emball\xE9", "Alliage \xE9trange", "Lamenta orn\xE9e de bijoux", "Cobalt Thorium G", "R\xE9manents en doigt\xE9", "Noyau interne", "Minerai de fer scintillant", "Oxygenanium", "Minerai d'argent scintillant", "Hydrog\xE8ne comprim\xE9", "Lavenium", "Meltor", "Glimmerium", "Grainium", "Roche primordiale", "Cendres volcaniques scintillantes", "Magmorthum", "Normalium", "Minerai d'alliage", "Le central", "Plasma impossible", "Espace profonde", "Mati\xE8re noire", "Trou noir", "Reste de plan\xE8te", "Galaxie", "Reste d'\xE9toile", "Arcanum", "\xC9toile \xE0 neutrons", "Opale Galactique", "Metelum", "Objet civilis\xE9 voyou", "Skrep", "Com\xE8te verte", "Litorp", "Point microscopique", "Nain noir", "Trou blanc", "Quasi-star", "Pierre de Lune", "Lunarium", "Cristaux de Lune", "S\xE9l\xE9n\xE9 Minerai", "Lunarite", "Cristal de poussi\xE8re d'\xE9toiles", "Quartz C\xE9leste", "Minerai de Lunaris", "Astralium", "Lune \xC2me", "Am\xE9thyste Lunaire", "Essence Lunarite", "Minerai de flamme lunaire", "Cristal d'ombre lunaire", "Lunarisium", "Essence de Lune Solaire", "\xC9toile de la Mort", "Ceinture d'ast\xE9ro\xEFdes", "Morceau de basalte", "Minerai de c\xE9lestium", "P\xE9pite de nickel", "M\xE9t\xE9oro\xEFde", "Veine de cobalt", "Fragment de platine", "Amas d'iridium", "Gemme de m\xE9t\xE9ore", "Cristal de x\xE9non", "Cristal du vide", "Gravitonium", "Noyau cosmique", "Rubis \xE9toil\xE9", "Pierre de singularit\xE9", "Paysage", "Concentrateur Atmosph\xE9rique", "Sables du Temps", "Neutronium Pur Hypercompress\xE9", "Noyau de Plasma", "Mine Subspatiale", "Chronos", "Nombreux Ciels Nocturnes", "Chromalite", "Tonnerium", "S\xE9raphin", "Lavaspite", "Verre de Dragon", "Pierre du Vide", "Zycrite", "Draconium", "Diamants Givr\xE9s", "Haine Ardente", "Wijkuled", "Gustavon", "\xC9clat en Fusion", "Verre de Flamme", "Prison de l’Enfer", "Feu Astral", "Rohoccaim", "Pyrite", "Pierre de Soleil", "M\xE9moire Br\xFBlante", "Rubis Fendu en Fusion", "Distorsion", "Radium", "Oganesson", "Kryptonite", "Ewudojjed", "T\xE9l\xE9phone Portable", "Circuit", "Actinium", "Plutonium", "Thorium", "Cristal de Tcherenkov", "Stationnaire", "Hexafluorure d’Uranium", "Plasma", "Sable des \xC2mes", "Zefendite", "Ignisaxum", "Givre Arctique", "Fer Gazeux", "Pierre Fleurie \xC9pineuse", "Araign\xE9e de Feu", "Ulewuthaim", "\xC9toile Tomb\xE9e", "Kyawthuite", "Uru", "Koiksxolaim", "Arras", "Anomalie", "Surcharge de Couleur", "Coupole", "Cristal d'Aetherium", "Minerai B\xE9nit", "Celestium", "Diable encha\xEEn\xE9", "Calculer Datacrite Binaire", "Espoir Fugace Final", "Galaxium", "Eternium", "Genesium", "\xC9p\xE9e en niveaux de gris et les \xE9toiles", "Prisme de Lavaxite", "Feu de Plasma", "Ancrage Waterium", "TURMOIL\xC9", "Toerium", "Thefaimnilnilnil", "Noyau Tesseract", "Nocturnis", "\xC9nergie Antique", "Entit\xE9 Br\xFBlante", "Cometium", "Z\xE9ro", "Gideon", "Pierre Lin\xE9aire", "Trianglium", "Squarite", "Circlite", "Kiteanium", "Ovalium", "Trapezide", "Octagonium", "Pentagrium", "Hexagrite", "Crosilite", "Loveilite", "Snowtanium", "Cindrillium", "Wedgilite", "Spherite", "Pi Circumferencium", "Starlite", "Trishatterite", "Noyau G\xE9om\xE9trilekenique", "N-Gon", "\xC9clipsera", "Iridanyte", "Starsearite", "Gravonyx", "Solenyte", "\xC9clipseron", "Ferraillepyx", "Noctyrite", "Cosmaril", "Umbryx", "Astralyth", "Aetherion", "A\xE9ronyx", "Nimbryl", "Minerai de Solarium", "Zephyrosite", "Tempestralithe", "Stratonium", "Brisium", "Ventryx", "Voltacite", "C\xE9lestara", "Skynexium", "Verdanyte", "Floracite", "\xC9larion", "Sylvanyth", "Xylogranite", "Ambryth", "Druanite", "Terravine", "Gaialite", "Argilethium", "Loamyx", "Sedryx", "Rubrath", "Shalorite", "Terralithe", "Pierre de Myr", "Tynarite", "G\xE9odyne", "Aurivine", "Terracron", "Gravellium", "Ferronyx", "Crimora", "Amarion", "Compaxite", "Bronzium", "Slathem", "Rubrasyte", "Opale d’Obryx", "Obdurium", "Argenyx", "Onythera", "Rubraxis", "Noctyra", "Umbrosite", "Plumbryn", "Malacit\xE9a", "Saphyros", "Drakonyx", "Lithyrium", "Zyntherium", "Topazryn", "H\xE9movyr", "Volcarion", "Tungryth", "Jadyx", "Garnyros", "Nihytrite", "Chasmite", "Volcrys", "Obrythite", "Pyrelithe", "Ignarion", "Magmoryx", "Cristal de Flare", "Radionyx", "Uvyrite", "Venomyth", "Corrosyte", "Scaldyrium", "Cor\xE9thium", "Magnite", "Pyrothyste", "Infernox", "Ignirion", "Deephyros", "Solaryx", "Magmyra", "Acier des \xC9ons", "Nyxium", "N\xE9bryx", "Cosmyth", "Lunarisite", "S\xE9lestium", "C\xE9lesthyne", "Rectite", "Calcinite", "Pierre de V\xE9nus", "Sulvaris", "Quartz en fleurs", "V\xE9nite", "Verre br\xFBl\xE9", "\xC9rosine", "Minerai de veine d’ambre", "Perle de Fumarite", "Orixio V\xE9n\xE9rien", "Halo cramoisi", "Val\xE9nite", "Pierre-fleur cendr\xE9e", "Shythereon", "Vapora dor\xE9e", "Verre s\xE9raphique", "V\xE9nalight", "\xC9clat de flamme aurique", "Gemme d’Eclipsera", "Solenvy", "Halo \xE9pineux", "Veine astrale", "Tartarium", "Pierre de Mercure", "Ferrite", "Goethe cendr\xE9", "Mercyrosite", "Basalte br\xFBl\xE9", "Eminescu", "Minerai de Cindermark", "Volcaryn", "Crat\xE8re Abedin", "Acier flamboyant", "Radiolyte", "Veine d’Ignilite", "Auralithe", "Verre du feu solaire", "Bassin de Caloris", "Coronathium", "Vulcanite Prime", "Bassin de Rembrandt", "H\xE9liarchite", "Tolsto\xEF", "Noyau de Reinhardt", "Stilbon", "Surface solaire", "Protub\xE9rance", "Verre de braise", "Cendre solaire", "Trou coronal", "Photosph\xE8re", "Chromosph\xE8re", "Photonyx", "Veine de thermite", "Quartz du voile solaire", "\xC9clat d’Ignis", "Poussi\xE8re d’H\xE9lios", "Pierre du cœur Solaris", "Gemme de lumi\xE8re de braise", "Alliage Auriflamme", "Prom\xE9th\xE9on", "Solinium radieux", "Pyrite d’Aurore", "Couronne de l’Aube", "Prisme infernal", "\xC9ruption solaire", "Flamme solaire \xE9ternelle", "Le Silence de Beethoven", "Par l\xE0-bas, Benjamin", "110011 1010010 1010010 110000 1010010 101110 110100 110000 110100", "Quasar Prismatique", "Envelopp\xE9 de Souffrance", "La descente de Jacob dans l'\xC9ternit\xE9", "ΒΞDRΩCK", "fαтє", "Le destin marche, comme tout homme", "Le Pied de l’E̶͐́l̸̆̊ė̷͙p̷͒̍h̷͂͝ǎ̴̿n̶̛t", "αи∂яσмє∂α", "Abysses Monocrites", "Regarde au-del\xE0 du   ̶C̶U̶R̶T̶A̶I̶N̶  Infernal", "你聽到了嗎？？？？？？？？？", "Le Dieu Solide des Math\xE9matiques G\xE9om\xE9triques", "Veine de Flamb\xE9e Solaire", "Divinit\xE9 Pure", "Plan Alternatif", "TUDOL", "Noyau Solaire", "Hydrog\xE8ne Sous-surface", "Coregrit", "Scorie Solaire", "Hydrog\xE8ne de Quadium", "Tachocline", "Verre d’H\xE9lion", "Plasmirum", "Irradite", "Photovite", "H\xE9licorite", "Os Stellaire", "Alliage Infernite", "Solatrix", "Cristal Luminforge", "Coronaith", "Vermion", "Gemme \xC2me-Pyro", "Stellarium", "Gemisis", "Cœur Solaire", "Objets Dimensionnels", "Ultimatum", "Sanctarite Pure", "Hsixia", "TERRARVM", "Odyss\xE9e", "Fabriqu\xE9 au Paradis", "Col\xE8re de Ballic", "Φοβος", "Apocrypha", "Marque suprarationnelle", "Fasaria", "→ Aurore ⇋ Le ⇋ Final ←", "《『R』『E』『V』『E』『L』『A』『T』『I』『O』『N』》", "Ex Machina P\xE9nulti\xE8me", "『Ｉｎｄｅｘ』『Ｄｅｉ』『ｌａｔｅｎ』", "Pierre de Mars", "Roche Rouill\xE9e", "Minerai Li\xE9 \xE0 la Poussi\xE8re", "Pierre Rouge", "Gravellite", "Ferrinite", "Plaque de Cendre", "Terracline", "Oxidulite", "Verre Martien", "Alliage Cramoisi", "Noyau de Roubion", "Volcarite", "Sangr\xE9lite", "Cristal d’Ombre de Fer", "Pierre d’\xC2me Martienne", "Titanite Forg\xE9e par la Poussi\xE8re", "Rubis du S\xE9isme Rouge", "Cœur d’Ar\xE8s", "Cube Vermillon", "Eau Bor\xE9ale", "S\xE9raphite de D\xE9imos", "Phobos", "JeremyDevs", "『Ｏｎｃｅ』『Ｂｙ』『Ｈｕｍａｎ』", "Gaz de Jupiter", "Hydrog\xE8ne Sous Pression", "Roche de Jupiter", "Hydrog\xE8ne M\xE9tallique", "Temp\xEAte Pi\xE9g\xE9e", "Brouillard de Pression", "Hydrog\xE8ne Ionis\xE9", "Ammoniac Charg\xE9", "Panache d’Aurore", "Vapeur Cyclonique", "Surge M\xE9thanique", "Sonde \xC9cras\xE9e", "Essence Jovienne", "Station de Jupiter", "Plasma Temp\xE9tueux", "Vapeur de la Grande Tache Rouge", "Grandes Aurores", "Europe", "Dominion de Zeus", "Convergence", "Enchantement", "Satellites Cosmiques", "Athanatos", "Gaz de Saturne", "D\xE9rive d’H\xE9lium", "Anneaux Froids", "Brume Dor\xE9e", "N\xE9 des Anneaux", "Ammoniac Gel\xE9", "Brouillard Cryo", "Roche de l’Anneau Externe", "Soie de Pression", "Nuage de Temp\xEAte Annulaire", "Voile de M\xE9thane", "Karma et Temps", "Essence de Lumi\xE8re Annulaire", "Kronos", "Temp\xEAte Silencieuse", "Nuage Couronn\xE9 de Saturne", "Jet Dor\xE9", "Minerai de David", "\xC9toile de Remphan", "Atmos Ancien", "Densit\xE9 Monochromatique", "Fils Polychromes", "Cœur Titanos", "M\xE9canisme", "Plaquage de Ferraille", "C\xE2blage en Fer", "Alliage Rouill\xE9", "Pierre d’Engrenage", "Minerai Circuit", "Treillis d’Acier", "Conduit Puls\xE9", "M\xE9chasil", "Cristal Logique", "Cœur Servo", "Alliage Binaire", "Matrice Neuronale", "Engrenage Chrono", "Pierre d’\xC2me Synth\xE9tique", "Fragment de Moteur Plan\xE9taire", "Alliage Omnicœur", "Cœur d’Acier Machina", "Deus Mechanica", "Processeur de Singularit\xE9", "Moteur Axiomatique", "Prisme Ghostcode", "Directive Primordiale", "Gaz d’Uranus", "M\xE9thane P\xE2le", "Vapeur Givr\xE9e", "D\xE9rive Nuageuse", "Brume Glaciaire", "Tourbillon Gel\xE9", "Voile Cryo", "Brume Bleue", "Flux Inclin\xE9", "Frisson Polaire", "Voile de Givre M\xE9thanique", "Jet Gel\xE9", "Courant d’Aurore", "Vent de Givre Scintillant", "Cyclone Silencieux", "Brise Titanesque", "Spirale \xC9th\xE9r\xE9e", "Halo Gel\xE9", "Froid C\xE9leste", "Verrou Glaciaire Primordial", "\xC9th\xE9r\xE9alit\xE9", "Brume d’\xC9ther", "Noyau d’Uranus", "『Dʏꜱꜰᴜɴᴄᴛɪᴏɴᴀʟ』『Aʙᴇʀʀᴀᴛɪᴏɴ』", -- : First try: K:0: attempt to index nil with 't'
;
	Explosives = {"Dynamite", "Bombe", "C4", "TNT", "Missile", "Nuke", "Bombe tsar", "Bombe \xE0 neutrons", "Bombe antimati\xE8re"};
	Leaderboards = {"Le plus d'argent", "La plupart des blocs extraits", "Le plus de temps jou\xE9", "La plupart des blocs d\xE9couverts", "La plupart des prestiges", "La plupart des jetons de prestige", "Plus de Robux d\xE9pens\xE9s"};
	Gamepasses = {
		x2Cash = "2x Argent";
		x2CashDesc = "Double tous vos revenus en esp\xE8ces";
		x2Emerald = "2x Emeraude";
		x2EmeraldDesc = "Double les \xE9meraudes que vous obtenez d'un minerai d'\xE9meraude";
		SharperPickaxes = "Pioches plus aff\xFBt\xE9es";
		SharperPickaxesDesc = "Toutes les pioches seront 10 % plus puissantes";
		x2PickaxePower = "2x puissance de pioche";
		x2PickaxePowerDesc = "Double la puissance de toutes les pioches";
		x2MiningSpeed = "2x Vitesse de minage";
		x2MiningSpeedDesc = "Double votre vitesse de minage";
		x2Storage = "2x Stockage";
		x2StorageDesc = "Double le stockage de votre sac \xE0 dos";
		InfiniteBackpack = "Sac \xE0 dos infini";
		InfiniteBackpackDesc = "Votre stockage de sac \xE0 dos deviendra infini";
		Teleporter = "T\xE9l\xE9porteur";
		TeleporterDesc = "Vous donne un t\xE9l\xE9porteur que vous pouvez placer n'importe o\xF9 et vous t\xE9l\xE9porter \xE0 tout moment. Rend \xE9galement tous les t\xE9l\xE9ports du hall gratuits";
		VIP = "VIP";
		VIPDesc = "Vous d\xE9bloquerez une pioche, un sac \xE0 dos et une balise de chat exclusifs VIP. De plus, vous obtiendrez plus d'\xE9meraudes gr\xE2ce \xE0 vos achats";
		x2Vitesse = "2x Vitesse";
		x2SpeedDesc = "Vous permet de marcher 2x plus vite que d'habitude";
		x2Jump = "2x Sauter";
		x2JumpDesc = "Vous permet de sauter 2x plus haut que d'habitude";
		Jetpack = "Jetpack";
		JetpackDesc = "D\xE9verrouille le jetpack qui vous permet de voler";
		MoreRange = "Port\xE9e Suppl\xE9mentaire";
		MoreRangeDesc = "Augmente la port\xE9e de minage de +5 blocs";
	};
	Quests = {"Le mien {1} {2}", "Mine {1} {2} Blocs", "Mine {1} Blocs", "Mine {1} minerais", "Creusez \xE0 {1} Profondeur", "\xC9quiper la pioche #{1} ou mieux", "\xC9quipez le sac \xE0 dos #{1} ou mieux", "Utiliser {1} explosif"};
	TranslatorSettings = {
		Locale = "fr";
		Seperator = ',';
		Decimal = '.';
		TimeAbbreviations = {'s', 'm', 'h', 'd', 'y'};
		Translator = 122404304;
	};
}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Translator.arabic
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:57
-- Luau version 6, Types version 3
-- Time taken: 0.047044 seconds

local longstring1 = "يزيد هذا الإكسسوار من سعة الحقيبة بمقدار {Boost_BackpackSpace} ويمنح {Boost_LocalMagicPower} قوة سحرية إضافية مقارنة بالإكسسوارات المعتادة من نفس الندرة."
local longstring2 = "يمنح هذا الإكسسوار {Boost_LocalMagicPower} قوة سحرية إضافية مقارنة بالإكسسوارات المعتادة من نفس الندرة."
return {
	Main = {
		Cash = "النقود";
		BlockCount = "{1}/{2} كتل";
		BlockCountUnlimited = "{1} كتل";
		EnableJetpack = "تشغيل الحزمة الطائرة";
		DisableJetpack = "إقاف الحزمة الطائرة";
		ToSurface = "إلى السطح";
		Backpack = "حقيبة الظهر";
		Index = "الفهرس";
		Settings = "الإعدادات";
		ReloadChunks = "إعادة تحديث الكتل";
		Placing = "وضع {1}";
		Unbreakable = "غير قابل للكسر";
		BackToMining = "العودة إلى التعدين";
		SearchBlocks = "البحث عن الكتل...";
		Place = "وضع";
		Lock = "إقفال";
		Unlock = "إلغاء القفل";
		BackpackFull = "حقيبة الظهر ممتلئة";
		BackpackFullMessage = "لقد ملئت حقيبة ظهرك تمامًا ولا يمكن لحقيبتك التحمل، حتى تبيع أو تضع كتلًا أو تقوم بترقية الحقيبة.";
		Sell = " بيع";
		Upgrade = "تطوير";
		BlocksDiscovered = "{1}/{2} الكتل المكتشفة (+{3}% نقود)";
		IndexLayer = "{1} | {2} إلى {3}";
		IndexLayerNoUp = "{1} | {2} و ما فوق";
		IndexLayerNoDown = "{1} | {2} و تحت";
		BaseValue = "القيمة الأساسية: <font color=\"#00FF00\">${1}</font>";
		CurrentValue = "القيمة الحالية: <font color=\"#00FF00\">${1}</font>";
		Durability = "المتانة";
		Rarity = "الندر";
		ProbabilityToSpawn = "احتمالية النشر: 1 in {1} كتل";
		IndexCredit = "حاجز من";
		Loading = "تحميل";
		LoadFail = "فشل في التحميل";
		TotalMined = "إجمالي المحفور";
		Back = "للخلف";
		On = "تشغيل";
		Off = "إقاف التشغيل";
		TimePlayed = "وقت اللعب";
		Blocks = "الكتل";
		Shop = "المتجر";
		ComingSoon = "قادم قريبا...";
		Buy = "شراء";
		Bought = "اشترى";
		Max = "ماكس";
		Gift = "هدية";
		Gamepasses = "Gamepasses";
		Owned = "مملوكة";
		OwnedByRecipient = "يملكه المستلم";
		StopGift = "توقف عن الإهداء";
		NoGifts = "لا يوجد حاليًا أحد لتقديم الهدايا في هذا الخادم.";
		EnterUsername = "أدخل اسم المستخدم هنا";
		Emeralds = "الزمردات";
		MostPopular = "الأكثر شعبية";
		BestOffer = "أفضل عرض";
		TeleportRequest = "طلب النقل";
		TeleportRequestMessage = "لقد طلب صديقك {1} المساعدة ، هل تريد أن يتم نقلك إليه؟";
		No = "لا";
		Yes = "نعم";
		Upgrades = "التطويرات";
		Pickaxes = "الفؤوس";
		Backpacks = "حقائب الظهر";
		Close = "إقفال";
		Equip = "تجهيز";
		Equipped = "مجهز";
		BuyWithCash = "شراء (${1})";
		Power = "القوة";
		Storage = "المساحة";
		Prestige = "الهيبة";
		Prestiges = "الهيبة: {1}";
		PrestigeCashBoost = "الدفعة نقدية: {1} → {2}";
		PrestigeWithCash = "الهيبة (${1})";
		UpgradeWithEmerald = "ترقية ({1} Emerald)";
		LobbyTeleport = "منفذ الردهة الفوري";
		LobbyAt = "ردهة على العمق {1}";
		Teleport = "النقل الفوري";
		UnlockFreeTeleports = "فتح وسائل النقل الفضائي المجانية";
		PrestigeTokens = "الرموز المميزة الممتازة";
		Quests = "المهام";
		QuestDisplay = "{1} / {2} ({3}٪)";
		Completed = "مكتمل";
		GroupBonus = "انضم إلى استوديو جيريمي وأعجب باللعبة للحصول على أموال أكثر بنسبة 50٪!";
		Tutorial = "البرنامج التعليمي";
		TutorialText = "مرحبًا! هناك العديد من الكتل لاكتشافها ، لبدء التعدين ، انقر فوق أو احتفظ بأي كتلة تريد تعدينها. تعطي كل كتلة مبلغًا مختلفًا من النقد عند بيعها ، ولكن يمكنك فقط حمل كمية محدودة من كتل في وقت واحد. هناك العديد من طبقات الكتل المختلفة التي تحتوي جميعها على خامات مختلفة فوق وتحت الأوساخ. ";
		Ok = "حسنًا";
		Luck = "حظ";
		Jackhammer = "مطرقة هيدروليكية";
		TooWeak = "ضعيف جدًا";
		Explosion = "انفجار";
		Jump = "قفز";
		Pickaxe = "فأس التعدين";
		Speed = "السرعة";
		LikeTheGame = "اعجب باللعبة";
		ForRewards = "للحصول على المكافآت!";
		Range = "المدى";
		Crafting = "الصناعة";
		MetaGain = "احصل على المزيد من الميتا مقابل كل روبوكس يتم إنفاقه. معدل الميتا الحالي: {1} → {2} ميتا لكل كتلة";
		Meta = "ميتا";
		MetaUnlock = "افتح مقابل {1}";
		Level = "المستوى";
		Levels = "المستويات";
		EmeraldUpgrades = "ترقيات الزمرد";
		AFKMessage = "سيتم إعادة الاتصال بك تلقائيًا كل 17 دقيقة لتجنب طردك بسبب عدم النشاط.";
		FriendMultiMessage = "ادعُ أصدقاءك لزيادة قوة الفأس!";
		NoFriendsHere = "لا يوجد أصدقاء هنا، لكل صديق في الخادم ستحصل على زيادة بنسبة 10% في قوة الفأس!";
		FriendMulti = "مضاعف الأصدقاء الحالي:\n+{1}% قوة الفأس";
		Auto = "تلقائي";
		Pinned = "مثبت";
		Unequip = "إزالة";
		Pin = "تثبيت";
		Unpin = "إلغاء التثبيت";
		MaxPins = "أقصى عدد للتثبيت";
		MagicPowerInfo = "تُمنح القوة السحرية من الإكسسوارات التي لديك مُجهّزة حاليًا. تجعلُك أقوى بطرق مختلفة.";
		Craft = "صنع";
		CraftNotification = "يمكنك صنع {1} الآن!";
		PrestigeNotification = "يمكنك الآن القيام بالترقية!";
		NoReset = "لا إعادة تعيين";
		Sacrifice = "التضحية";
		SacrificeMessage = "التضحية تعيد ضبط نفس الأشياء التي يعيد ضبطها الشرف (Prestige)، ولكن يمكنك فعلها دون تحقيق شرط المال مرة واحدة كل ساعة! ستحصل على {1} من رموز الشرف في هذه التضحية.";
		Wait = "انتظار";
		ArchivedBlocks = "الكتل المؤرشفة";
		CraftingRecommendation = "يُنصح بشدة بصنع {1} قبل أي شيء آخر!";
		DisableFastFall = "تعطيل السقوط السريع؟";
		Claim = "استلام";
		Showcase = "العرض";
		TotalValue = "القيمة الإجمالية";
		YourPlacement = "ترتيبك";
		Top100 = "أفضل 100";
		Or = "أو";
		MetaUnlockProgress = "{1}/{2} مُنفق";
		PrestigeMessageFree = "مع البرستيج يمكنك استبدال نقودك برموز البرستيج وزيادة في الكاش.";
		PrestigeMessageFreeTokens = "مع البرستيج يمكنك استبدال نقودك بـ {1} من رموز البرستيج وزيادة في الكاش.";
		PrestigeMessageFreeDaily = "البرستيج سيعيد تعيين الفؤوس والحقائب والنقود والبلوكات، لكنك ستحصل على زيادة كاش و {1} من رموز البرستيج، إلا إذا انتظرت {2} فعندها سيعيد تعيين نقودك فقط.";
		BuyAll = "شراء الكل";
		Cooldown = "فترة الانتظار";
		IndexSecretLayer = "سري | في كل مكان";
		BlockRewards = "هل أعجبتك الخامات؟ يمكنك ربح 750 زمردًا مقابل كل خام حتى فئة الأسطوري، أو 3,000 زمرد لكل خام من فئة الإثيريال+ تتم إضافته إلى اللعبة. أرسل خاماتك في خادم الديسكورد الموجود في وصف اللعبة.";
		LeaderboardProgress = "أنت ضمن أفضل {1}";
		BlockTagged = "تم تعدين الكتلة بواسطة {1}";
		Trading = "التداول";
		LagMessage = "إذا كنت تعاني من التقطيع، يُنصح بتقليل مسافة العرض من قائمة الإعدادات.";
		TutorialText2 = "مرحبًا! اضغط مطولًا على أي كتلة لبدء التعدين. الكتل الأندر تُباع مقابل مال أكثر. توجد طبقات عديدة فوق وتحت التراب تحتوي على كتل أكثر قيمة بكثير. لكل ردهة ترقياتها الفريدة.";
		TutorialText3 = "مرحبًا! اضغط مطولًا على أي كتلة لبدء التعدين. الكتل الأندر تُباع مقابل مال أكثر. توجد طبقات عديدة فوق وتحت التراب تحتوي على كتل أكثر قيمة بكثير. لكل ردهة ترقياتها الفريدة. استمر في اللعب وستتمكن من تعدين 2000 كتلة في الثانية!";
		Undiscovered = "غير مكتشف";
		PrestigeMessage = "سيقوم البرستيج بإعادة تعيين المعاول وحقائب الظهر والنقود والكتل الخاصة بك، لكنك ستحصل على تعزيز للنقود و {1} من رموز البرستيج";
		PrestigeMessageBetter = "البرستيج يعيد تعيين المعاول وحقائب الظهر والنقود والكتل فقط، لكنك ستحصل على تعزيز للنقود و {1} من رموز البرستيج. <font color=\"#ff0000\">لن يتم إعادة تعيين أي شيء آخر! ستتقدم بشكل أسرع بكثير عند القيام بالبرستيج.</font>";
		PrestigeMessageEthereal = "سيقوم البرستيج بإعادة تعيين المعاول وحقائب الظهر والنقود والكتل <font color=\"#ff0000\">(باستثناء كتل Ethereal+!)</font>، لكنك ستحصل على تعزيز للنقود و {1} من رموز البرستيج";
		PrestigeMessageBetterEthereal = "البرستيج يعيد تعيين المعاول وحقائب الظهر والنقود والكتل فقط <font color=\"#ff0000\">(باستثناء كتل Ethereal+!)</font>، لكنك ستحصل على تعزيز للنقود و {1} من رموز البرستيج. <font color=\"#ff0000\">لن يتم إعادة تعيين أي شيء آخر! ستتقدم بشكل أسرع بكثير عند القيام بالبرستيج.</font>";
	};
	Tips = {
		MiningAbilityInactive = "نصيحة: قدرات التعدين القوية غير مفعلة بالقرب من منطقة الظهور!";
		CraftingNote = "الإكسسوارات التي يصعب عليك صنعها تكون مخفية. أصبح أقوى واحصل على حقيبة ظهر أكبر وسيتم فتحها.";
		TradingNote = "الكتل التي تقوم بتبادلها سيتم أرشفتها ولن يمكن بيعها مقابل النقود، لكنها ستظل قابلة للاستخدام في التصنيع!";
	};
	Upgrades = {
		BuyAll = "فتح شراء الكل";
		KeepBackpack = "مستوى حقيبة الظهر للحفاظ على الهيبة";
		MorePickaxePower = "المزيد من طاقة الفأس";
		MoreCash = "المزيد من النقود";
		JackhammerChance = "فرصة المطرقة الهيدروليكية";
		JackhammerRadius = "نصف قطر المطرقة الهيدروليكية";
		JackhammerSize = "حجم المطرقة الهيدروليكية";
		MiningSpeed = "سرعة التعدين";
		MiningFrenzy = "جنون التعدين بعد العثور على كتلة أسطورية";
		ExplosionChance = "فرصة الانفجار";
		ExplosionRadius = "نطاق الانفجار";
		TNTLuck = "حظ الـ TNT";
		MiningRange = "مدى التعدين";
		MiningRange2 = "مدى التعدين 2";
		UnlockCrafting = "افتح نظام الصناعة";
		MoreAccessorySlots = "فتحات إضافية للإكسسوارات";
		MoreMeta1 = "المزيد من الميتا 1";
		MoreMeta2 = "المزيد من الميتا 2";
		MoreMetaBlocksMined = "مزيد من الميتا بناءً على عدد الكتل المُستخرجة";
		MoreLuck = "حظ أكثر";
		MoreRange = "نطاق أكبر";
		DuplicateBlocks = "فرصة تكرار الكتل";
		WalkSpeed = "سرعة مشي أعلى";
	};
	UnlockMessages = {
		Prestiges = "يفتح عند {1} المراتب";
	};
	Rarity = {"شائع", "غير شائع", "نادر", "بطولي", "اسطوري", "خرافي", "أثيري", "سماوي", "الذروة", "إلهي", "لا شيء"};
	Settings = {
		Low = "جودة عالية";
		LowDesc = "ستظهر جميع الكتل الرئيسية للطبقة بجودة عالية ، وقد يتسبب ذلك في تأخير كبير";
		RenderDistance = "مسافة الكتل";
		RenderDistanceDesc = "قم بتغيير عدد الكتل التي يمكنك رؤيتها في كل إتجاه";
		Teleport = "النقل";
		TeleportDesc = "يمكن الأصدقاء الذين تدعوهم للعبة أن يتم نقلهم فوريًا إلى موقعك الحالي";
		Music = "موسيقى";
		MusicDesc = "للتبديل بين تشغيل الموسيقى أم ​​لا";
		FastFall = "سقوط سريع";
		FastFallDesc = "سيتم نقلك إلى أسفل الحفرة عند السقوط لفترة معينة من الوقت";
		x2Speed = "2x السرعة";
		x2SpeedDesc = "التبديل بين المشي مرتين بالسرعة المعتادة";
		x2Jump = "2x قفزة";
		x2JumpDesc = "التبديل بين القفز ضعف الارتفاع كالعادة";
		Reload = "إعادة تحميل القطع";
		ReloadDesc = "يمكنك إعادة تحميل كافة الكتل في حالة حدوث مواطن الخلل";
		FastFly = "طيران سريع";
		FastFlyDesc = "سيتم نقلك إلى أعلى نقطة عند استخدامك الحقيبة النفاثة لفترة معينة من الزمن";
		DarkLighting = "الإضاءة المظلمة";
		DarkLightingDesc = "تبديل الإضاءة المظلمة";
		FriendMarkers = "علامات الأصدقاء";
		FriendMarkersDesc = "تبديل ظهور أصدقائك";
		BreakingSprites = "تأثيرات الكسر";
		BreakingSpritesDesc = "تبديل ظهور تأثيرات الكسر أثناء تعدين الكتل";
		JumpJetpack = "قفز النفاثة";
		JumpJetpackDesc = "ستستخدم النفاثة تلقائيًا أثناء القفز";
		Sounds = "يبدو";
		SoundsDesc = "يُفعّل هذا الخيار تشغيل الأصوات أو إيقافها.";
		ChatTags = "علامات الدردشة";
		AutoRender = "العرض التلقائي";
		AutoRenderDesc = "يُخفض مسافة العرض تلقائيًا عند اكتشاف التقطيع";
		BlockStepping = "الصعود على الكتل";
		BlockSteppingDesc = "تصعد تلقائيًا فوق الكتل";
	};
	ChatMessages = {
		BlockFound = "{1} لقد حصل على {2}";
		MultipleBlocksFound = "{1} لقد حصل على {2} {3}";
		OreFound = "{1} لقد حصل على {2} ({3}) في الطبقة {4} (١ في {5} كتل)";
		OreFoundShort = "{1} لقد حصل على {2} (١ داخل {3} كتل)";
		MultipleOresFound = "{1} لقد حصل على {2} {3} ({4}) داخل الطبقة {5} (١ داخل {6} كتل)";
		YouBlockFound = "لقد حصلت {1}";
		YouMultipleBlocksFound = "لقد حصلت {1} {2}";
		YouOreFound = "لقد حصلت {1} ({2}) داخل الطبقة {3} (١ داخل {4} كتل)";
		YouOreFoundShort = "لقد حصلت {1} (١ داخل {2} كتل)";
		YouMultipleOresFound = "لقد حصلت {1} {2} ({3}) داخل الطبقة {4} (١ داخل {5} كتل)";
		TempMute = "لقد تم تجميد خاصية المحادثات بشكل مؤقت {1}! ينتهي في {2}";
		PermMute = "لقد تم تجميد خاصية المحادثات بشكل تام  {1}!";
		TeleporterDestroyed = "تم تدمير الناقل الآني بسبب وضع كتلة عليه";
		MiningFrenzy = "تم تفعيل جنون التعدين! ستقوم الآن بالتعدين أسرع بنسبة {1} وتسبب ضررًا أكثر بنسبة {2} لمدة دقيقة واحدة!";
		LikeGoalReached1 = "تم الوصول إلى هدف الإعجابات. +25٪ سرعة تعدين و+25٪ ضرر خلال الدقائق {1} القادمة.";
		LikeGoalReached2 = "تم الوصول إلى هدف الإعجابات. +25٪ نقود و+25٪ ضرر خلال الدقائق {1} القادمة.";
		IntroMessage1 = "⛏️كل ردهة لها ميزة فريدة خاصة بها!⛏️";
		IntroMessage2 = "💎انضم إلى المجموعة واضغط إعجاب باللعبة لتحصل على 50٪ أموال إضافية!💎";
		OreUncovered = "تم اكتشاف خام {1} للتو!";
		EmeraldUncovered = "تم اكتشاف زمرد للتو!";
		Emerald = "لقد أهدك {1} عدد {2} من الزمرد";
		Gamepass = "لقد أهدك {1} {2}";
		EmeraldYou = "لقد أهدَيتَ {1} عدد {2} من الزمرد";
		GamepassYou = "لقد أهدَيتَ {1} {2}";
		EmeraldOther = "لقد أهدى {1} {2} عدد {3} من الزمرد";
		GamepassOther = "لقد أهدى {1} {2} {3}";
		BlockEmeraldsAwarded = "لقد حصلت على {1} زمرد مقابل إنشاء الخامات!";
		UnprocessedBlock = "لقد استلمت {1} لأن الخادم تم إغلاقه.";
		BigCave = "تم ظهور كهف ضخم بالقرب منك!";
	};
	ChatTips = {"حقيقة ممتعة: يوجد ما مجموعه {1} ترقية في هذه اللعبة!", "يوجد حاليًا {1} كتلة فريدة في اللعبة!", "تم إنشاء معظم خامات اللعبة بواسطة {1} و {2}", "هل علقت؟ جرّب القيام بترقية Prestige.", "أحد مطوري اللعبة يمتلك أكبر عدد من الشارات في Roblox بإجمالي 135 مليون شارة، وقد وصل إلى الحد الأقصى لعدد الشارات التي يمكن لشخص امتلاكها.", "أندر فئة للكتل لديها فرصة ظهور 1 من 2,000,000,000...", "سرعة التعدين أكثر فائدة مما تبدو عليه في البداية...", "الإهداء يعمل عبر الخوادم، حتى لو كان الشخص الذي تحاول الإهداء له غير متصل. فقط يجب أن يكون قد لعب اللعبة مرة واحدة على الأقل في الماضي.", "أدوات النقر التلقائي والماكرو مسموح بها، لكن الاستغلال غير مسموح.", "بعد فتح التصنيع وصناعة أثر Machina، يمكنك مغادرة اللعبة ليتم الطحن تلقائيًا نيابةً عنك.", "هناك احتمال 1 من 10,000 للحصول على هذه الرسالة. تهانينا!"};
	DiscordChatTips = {"إذا أعجبتك خامات اللعبة، يمكنك إنشاء خاماتك الخاصة في خادم الديسكورد الخاص باللعبة :)"};
	ServerResponses = {
		Error = "حدث خطأ ، حاول مرة أخرى في وقت لاحق";
		AppealEmpty = "لا يمكن أن يكون النص فارغًا";
		AppealInvalidCharacters = "يحتوي الاستئناف على أحرف غير صالحة";
		AppealTooShort = "النص قصير جدًا";
		AppealTooLong = "النص طويل جدا";
		AppealTooFast = "إنك ترسل الاستئناف بسرعة كبيرة ، حاول وببطء";
		AppealFiltered = "تم تصفية النص";
		AppealSuccess = "تم إرسال الاستئناف بنجاح ، وسنعود إليك قريبًا.";
		ResponseEmpty = "لا يمكن أن يكون الرد فارغًا";
		ResponseInvalidCharacters = "تحتوي الاستجابة على أحرف غير صالحة";
		ResponseTooShort = "الرد قصير للغاية";
		ResponseTooLong = "الرد طويلة جدًا";
		ResponseDecision = "عليك أن تختار قرارا";
		ResponseTooFast = "أنت ترسل الردود بسرعة كبيرة ، ارسل ببطء";
		ResponseFiltered = "تمت تصفية الاستجابة";
		NotBanned = "هذا المستخدم غير محظور";
		AlreadyResponded = "لقد تم بالفعل إرسال رد على هذا الاستئناف";
		NoData = "هذا المستخدم ليس لديه بيانات";
		UnableRespond1 = "غير قادر على الرد على هذا الاستئناف ، يرجى التواصل بمرتبة أعلى للحصول على المساعدة";
		UnableRespond2 = "تعذر الرد على هذا الاستئناف ، لأن هذا المستخدم قد تم حظرهتعذر الرد على هذا الاستئناف ، لأن هذا المستخدم قد تم تصفيته";
		ResponseSuccess = "تم إرسال الرد بنجاح";
		LayerTooPowerful = "الطبقة قوية جدًا ، ولا يمكن وضع المتفجرات";
		NoBlocksExploded = "المتفجرة لم تنفجر أي كتل ولم يتم شحنها";
		GiftSuccess = "تم إرسال هديتك لـ {1} بنجاح";
		GiftError = "فشلت هديتك لـ {1} ، وستتم إعادة المحاولة عند الانضمام مرة أخرى";
		InvalidUser = "مستخدم غير صالح";
		GiftYourself = "لا يمكن إهداء نفسك";
		MoveAway = "تحرك مسافة 75 كتلة على الأقل بعيدًا عن نقطة البداية.";
	};
	Admin = {
		Appeals = "الاستئناف";
		NoPendingAppeals = "لا يوجد حاليا أي استئناف متبقي.";
		Reload = "إعادة تحميل";
		LoadingAppeals = "جارٍ تحميل طلبات الاستئناف ...";
		SendResponse = "إرسال رد";
		EnterResponse = "أدخل ردك على الاستئناف هنا";
		Deny = "رفض";
		Accept = "قبول";
		TempBan = "تم حظره لمدة {1} بسبب \"{2}\"";
		PermBan = "تم حظره بشكل دائم بسبب \"{1}\"";
		SuperPermBan = "تم حظره بشكل دائم للغاية بسبب \"{1}\"";
		Unban = "تم رفع الحظر بواسطة {1}";
	};
	Ban = {
		AccountBan = "حظر الحساب";
		Temp = "لقد تم حظرك مؤقتا بسبب {1}!";
		Perm = "لقد تم حظرك بشكل دائم بسبب {1}!";
		TimeBanned = "وقت الحظر في: {1}";
		BanEnds = "ينتهي الحظر في: {1}";
		BanEndsTimer = "ينتهي الحظر في {1}";
		BanEndsNever = "الحظر لا ينتهي أبدا";
		BanEnded = "انتهى الحظر: {1}";
		AppealMessage = "إذا كنت ترغب في الاستئناف ، فتواصل بنا في النموذج أدناه.";
		AppealMessageRubenSim = "إذا كنت ترغب في الاستئناف، تواصل مع Ruben Sim.";
		AppealSent = "لقد أرسلت استئنافًا ، وسنعاود التواصل بك في أقرب وقت ممكن.";
		AppealDenied = "تم رفض الاستئناف الخاص بك ، تحقق من الرسائل لمزيد من المعلومات.";
		AppealAccepted = "تم قبول الاستئناف الخاص بك ، ويمكنك مواصلة اللعب.";
		Appeal = "الاستئناف";
		AppealOnce = "يمكنك الاستئناف مرة واحدة فقط";
		AppealTextBox = "أدخل الاستئناف الخاص بك هنا ، وقدم أكبر قدر ممكن من التفاصيل";
		Send = "إرسال";
		ViewMessages = "إظهار الرسائل";
		Messages = "الرسائل";
		YouWrote = "لقد كتبت";
		OtherWrote = "{1} كتبت";
	};
	Trading = {
		WaitForPeople = "جارٍ انتظار لاعبين للتبادل...";
		WaitForTradeRequests = "جارٍ انتظار طلبات التبادل...";
		WantsToTrade = "{1} يريد التبادل معك";
		Accept = "قبول";
		Unaccept = "إلغاء القبول";
		Deny = "رفض";
		EnterAmount = "أدخل الكمية";
		Confirmation = "هل أنت متأكد؟";
		NoResults = "لم يتم العثور على نتائج.";
		TradeDenied = "{1} رفض التبادل!";
		Offering = "يقدّم {1}";
		Regulations = "تم تعطيل بعض العناصر بسبب القوانين المحلية.";
		NotAcceptedYet = "لم يتم القبول بعد";
		WaitingForAccept = "تم القبول، بانتظار قبولك";
		ProcessingIn = "سيتم تنفيذ التبادل خلال {1} ثانية";
		NoItemsAvailable = "لا توجد عناصر متاحة لهذا التبادل.";
		NoItemsOffered = "لم يتم تقديم أي عناصر.";
		TradeCompleted = "تم إكمال التبادل.";
		TradeFailed = "حدث خطأ أثناء التبادل.";
		TradeLimit = "{1}/{2} عمليات تبادل";
		TradeLimitReset = "يُعاد التعيين خلال {1}";
	};
	Accessories = {{{
		Name = "تسلس دوبليسي";
		Desc = "يوفر تسلس دوبليسي فرصة إضافية {Boost_Dupe} للحصول على كتلة إضافية عند تعدين واحدة.";
	}, {
		Name = "خاتم دوبليسي";
		Desc = "يوفر خاتم دوبليسي فرصة إضافية {Boost_Dupe} للحصول على كتلة إضافية عند تعدين واحدة.";
	}, {
		Name = "أثر دوبليسي";
		Desc = "يوفر أثر دوبليسي فرصة إضافية {Boost_Dupe} للحصول على كتلة إضافية عند تعدين واحدة.";
	}, {
		Name = "تراث دوبليسي";
		Desc = "يوفر تراث دوبليسي فرصة إضافية {Boost_Dupe} للحصول على كتلة إضافية عند تعدين واحدة.";
	}}, {{
		Name = "خاتم روبر";
		Desc = "يوفر خاتم روبر فرصة إضافية {Boost_RareExplosion} للتسبب في انفجار قوة 5 عند تعدين كتلة نادرة.";
	}, {
		Name = "أثر روبر";
		Desc = "يوفر أثر روبر فرصة إضافية {Boost_RareExplosion} للتسبب في انفجار قوة 5 عند تعدين كتلة نادرة.";
	}, {
		Name = "تراث روبر";
		Desc = "يوفر تراث روبر فرصة إضافية {Boost_RareExplosion} للتسبب في انفجار قوة 5 عند تعدين كتلة نادرة.";
	}, {
		Name = "كرونوميكون روبر";
		Desc = "يوفر كرونوميكون روبر فرصة إضافية {Boost_RareExplosion} للتسبب في انفجار قوة 5 عند تعدين كتلة نادرة.";
	}}, {{
		Name = "خاتم حصالة";
		Desc = "يوفر خاتم حصالة زيادة إضافية {Boost_Cash} للنقد.";
	}, {
		Name = "أثر حصالة";
		Desc = "يوفر أثر حصالة زيادة إضافية {Boost_Cash} للنقد.";
	}, {
		Name = "تراث حصالة";
		Desc = "يوفر تراث حصالة زيادة إضافية {Boost_Cash} للنقد.";
	}, {
		Name = "كرونوميكون حصالة";
		Desc = "يوفر كرونوميكون حصالة زيادة إضافية {Boost_Cash} للنقد، بالإضافة إلى زيادة إضافية بنسبة 5% للنقد.";
	}, {
		Name = "حصّالة متقدمة";
		Desc = "الحصّالة المتقدمة هي إكسسوار قوي جدًا يوفر زيادة إضافية قدرها {Boost_Cash} في المال، بالإضافة إلى زيادة أخرى بنسبة 10% فوق ذلك.";
	}}, {{
		Name = "تعويذة العامل";
		Desc = "تعويذة العامل هي إكسسوار أساسي يوفر زيادة قدرها {Boost_Cash} في المال و{Boost_PickaxePower} لضرر الفأس.";
	}, {
		Name = "خاتم العامل";
		Desc = "خاتم العامل هو إكسسوار يوفر زيادة قدرها {Boost_Cash} في المال و{Boost_PickaxePower} لضرر الفأس.";
	}, {
		Name = "أثر العامل";
		Desc = "أثر العامل هو إكسسوار يوفر زيادة قدرها {Boost_Cash} في المال و{Boost_PickaxePower} لضرر الفأس.";
	}, {
		Name = "ميراث العامل";
		Desc = "ميراث العامل هو إكسسوار يوفر زيادة قدرها {Boost_Cash} في المال و{Boost_PickaxePower} لضرر الفأس.";
	}, {
		Name = "كتاب الزمن للعامل";
		Desc = "كتاب الزمن للعامل هو إكسسوار يوفر زيادة قدرها {Boost_Cash} في المال و{Boost_PickaxePower} لضرر الفأس.";
	}, {
		Name = "عالم العامل";
		Desc = "عالم العامل هو إكسسوار يوفر زيادة قدرها {Boost_Cash} في المال و{Boost_PickaxePower} لضرر الفأس، بالإضافة إلى {Boost_PrestigeTokens} رموز الهيبة و{Boost_MiningSpeed} سرعة التعدين. في أيام الجمعة وعطلة نهاية الأسبوع يتضاعف المال وضرر الفأس.";
	}}, {{
		Name = "أثر السرعة";
		Desc = "أثر السرعة هو إكسسوار يمنح زيادة {Boost_MiningSpeed} لسرعة التعدين.";
	}, {
		Name = "إرث السرعة";
		Desc = "إرث السرعة هو إكسسوار يمنح زيادة {Boost_MiningSpeed} لسرعة التعدين.";
	}, {
		Name = "كرونوميكون السرعة";
		Desc = "كرونوميكون السرعة هو إكسسوار قوي يزيد سرعة التعدين بمقدار {Boost_MiningSpeed}.";
	}, {
		Name = "السرعة المتسامية";
		Desc = "السرعة المتسامية هي إكسسوار قوي جدًا يزيد سرعة التعدين بمقدار {Boost_MiningSpeed}.";
	}, {
		Name = "السرعة الأبدية";
		Desc = "السرعة الأبدية هي إكسسوار قوي للغاية يزيد سرعة التعدين بمقدار {Boost_MiningSpeed}.";
	}}, {{
		Name = "قطعة أثر السرعة";
		Desc = "يزيد قطعة أثر السرعة من سرعة المشي بمقدار {Boost_WalkSpeed} كتل في الثانية.";
	}}, {{
		Name = "خاتم كريبـيتوس";
		Desc = "خاتم كريبـيتوس هو إكسسوار يملك فرصة مقدارها {Boost_ExtraExplosionRadiusChance} في كل تفعيل لقدرة الانفجار لإضافة +1 إلى نصف القطر.";
	}, {
		Name = "أثر كريبـيتوس";
		Desc = "أثر كريبـيتوس هو إكسسوار يملك فرصة مقدارها {Boost_ExtraExplosionRadiusChance} في كل تفعيل لقدرة الانفجار لإضافة +1 إلى نصف القطر.";
	}, {
		Name = "ميراث كريبـيتوس";
		Desc = "ميراث كريبـيتوس هو إكسسوار يملك فرصة مقدارها {Boost_ExtraExplosionRadiusChance} في كل تفعيل لقدرة الانفجار لإضافة +1 إلى نصف القطر.";
	}, {
		Name = "كتاب الزمن لكريبـيتوس";
		Desc = "كتاب الزمن لكريبـيتوس هو إكسسوار يملك فرصة مقدارها {Boost_ExtraExplosionRadiusChance} في كل تفعيل لقدرة الانفجار لإضافة +1 إلى نصف القطر.";
	}, {
		Name = "كريبـيتوس ماكس";
		Desc = "كريبـيتوس ماكس هو إكسسوار يملك فرصة مقدارها {Boost_ExtraExplosionRadiusChance} في كل تفعيل لقدرة الانفجار لإضافة +1 إلى نصف القطر.";
	}}, {{
		Name = "قطعة فراغون الأثرية";
		Desc = "تقوم قطعة فراغون الأثرية بإحداث انفجار بقوة 25 عند استخراج كتلة أسطورية.";
	}}, {{
		Name = "خاتم بانغ";
		Desc = "يمنح خاتم بانغ فرصة {Boost_LegendaryExplosion} لإنشاء انفجار قوة 17 عند تعدين كتلة أسطورية.";
	}, {
		Name = "أثر بانغ";
		Desc = "يمنح أثر بانغ فرصة {Boost_LegendaryExplosion} لإنشاء انفجار قوة 17 عند تعدين كتلة أسطورية.";
	}, {
		Name = "تراث بانغ";
		Desc = "يمنح تراث بانغ فرصة {Boost_LegendaryExplosion} لإنشاء انفجار قوة 17 عند تعدين كتلة أسطورية.";
	}, {
		Name = "كرونوميكون بانغ";
		Desc = "يمنح كرونوميكون بانغ فرصة {Boost_LegendaryExplosion} لإنشاء انفجار قوة 20 عند تعدين كتلة أسطورية.";
	}}, {{
		Name = "تسلس الرادار";
		Desc = "يشير تسلس الرادار إلى المعادن الأسطورية+ القريبة ضمن {Boost_RadarRadius} كتل.";
	}, {
		Name = "خاتم الرادار";
		Desc = "يشير خاتم الرادار إلى المعادن الأسطورية+ القريبة ضمن {Boost_RadarRadius} كتل.";
	}, {
		Name = "أثر الرادار";
		Desc = "يشير أثر الرادار إلى المعادن الأسطورية+ القريبة ضمن {Boost_RadarRadius} كتل.";
	}, {
		Name = "تراث الرادار";
		Desc = "يشير تراث الرادار إلى المعادن الأسطورية+ القريبة ضمن {Boost_RadarRadius} كتل.";
	}, {
		Name = "كرونوميكون الرادار";
		Desc = "يشير كرونوميكون الرادار إلى المعادن الأسطورية+ القريبة ضمن {Boost_RadarRadius} كتل.";
	}}, {{
		Name = "أثر الماكينا";
		Desc = "يعمل هذا الأثر على أتمتة تجربة التعدين الخاصة بك من خلال التحكم بجسدك وفقًا لإرادتك.";
	}, {
		Name = "ماكينا من الرتبة الثانية";
		Desc = "يطور التعدين التلقائي ليشمل الخامات الأسطورية+ ويزيد سرعة المشي بنسبة 100٪.";
	}, {
		Name = "ماكينا من الرتبة الثالثة";
		Desc = "يطور التعدين التلقائي ليشمل الخامات النادرة+، ويزيد سرعة المشي بنسبة 200٪، ويرفع كفاءة التعدين التلقائي إلى 60٪ بدلًا من 50٪.";
	}, {
		Name = "ماكينا من أعلى رتبة";
		Desc = "يطور التعدين التلقائي ليشمل TNT، ويرفع كفاءته إلى 100٪ بدلًا من 60٪، ويزيد سرعة المشي بنسبة 500٪، ويبيع حقيبتك تلقائيًا عند امتلائها حتى ثلاث مرات يوميًا.";
	}, {
		Name = "تجسد الماكينا";
		Desc = "يطور التعدين التلقائي لتعدين جميع الخامات الأسطورية+ بغض النظر عن المسافة، كما أن تعدين TNT يمنحك جميع الكتل التي ينفجرها.";
	}, {
		Name = "لمراعاة كل الاحتمالات";
		Desc = "يطور التعدين التلقائي لتعدين جميع الخامات من غير الشائعة إلى الأثيرية فورًا طالما يمكنك تعدينها بسرعة كافية، ويقوم بتعدين TNT من ضعف المسافة.";
	}}, {{
		Name = "أثر ماليوس";
		Desc = "أثر ماليوس يضيف فرصة مقدارها {Boost_JackhammerChance} للجاكهامر.";
	}, {
		Name = "ميراث ماليوس";
		Desc = "ميراث ماليوس يضيف فرصة مقدارها {Boost_JackhammerChance} للجاكهامر.";
	}, {
		Name = "كرونوميكون ماليوس";
		Desc = "كرونوميكون ماليوس يضيف فرصة مقدارها {Boost_JackhammerChance} للجاكهامر.";
	}, {
		Name = "ماليوس المتسامي";
		Desc = "ماليوس المتسامي يضيف فرصة مقدارها {Boost_JackhammerChance} للجاكهامر.";
	}}, {{
		Name = "ميراث إكسيتيوم";
		Desc = "ميراث إكسيتيوم يضيف فرصة مقدارها {Boost_ExplosionChance} للانفجار.";
	}, {
		Name = "كرونوميكون إكسيتيوم";
		Desc = "كرونوميكون إكسيتيوم يضيف فرصة مقدارها {Boost_ExplosionChance} للانفجار.";
	}, {
		Name = "إكسيتيوم المتسامي";
		Desc = "إكسيتيوم المتسامي يضيف فرصة مقدارها {Boost_ExplosionChance} للانفجار.";
	}}, {{
		Name = "تعويذة فوديندا";
		Desc = "تزيد تعويذة فوديندا من نطاق التعدين بمقدار {Boost_MiningRange} بلوكات.";
	}, {
		Name = "خاتم فوديندا";
		Desc = "يزيد خاتم فوديندا من نطاق التعدين بمقدار {Boost_MiningRange} بلوكات.";
	}, {
		Name = "قطعة فوديندا الأثرية";
		Desc = "تزيد قطعة فوديندا الأثرية من نطاق التعدين بمقدار {Boost_MiningRange} بلوكات.";
	}, {
		Name = "تراث فوديندا";
		Desc = "يزيد تراث فوديندا من نطاق التعدين بمقدار {Boost_MiningRange} بلوكات.";
	}, {
		Name = "كرونوميكون فوديندا";
		Desc = "يزيد كرونوميكون فوديندا من نطاق التعدين بمقدار {Boost_MiningRange} بلوكات.";
	}, {
		Name = "فوديِندا المتصاعدة";
		Desc = "تزيد فوديِندا المتصاعدة من مدى التعدين الخاص بك بمقدار {Boost_MiningRange} كتلة.";
	}}, {{
		Name = "خاتم فورتونا";
		Desc = "يزيد خاتم فورتونا الحظ لديك بمقدار {Boost_Luck}.";
	}, {
		Name = "أثر فورتونا";
		Desc = "يزيد أثر فورتونا الحظ لديك بمقدار {Boost_Luck}.";
	}, {
		Name = "إرث فورتونا";
		Desc = "يزيد إرث فورتونا الحظ لديك بمقدار {Boost_Luck}.";
	}, {
		Name = "الأم فورتونا";
		Desc = "تزيد الأم فورتونا الحظ لديك بمقدار {Boost_Luck}.";
	}}, {{
		Name = "أثر نوى الأتمتة";
		Desc = "يقلل وقت التهدئة للمتفجرات بمقدار {Boost_ExplosiveCooldownReduction} أثناء اتصالك.";
	}}, {{
		Name = "إرث نوى القوة";
		Desc = "يزيد قوة المتفجرات بمقدار {Boost_ExplosiveRadius}.";
	}, {
		Name = "كرونوميكون نوى القوة";
		Desc = "يزيد قوة المتفجرات بمقدار {Boost_ExplosiveRadius}.";
	}}, {{
		Name = "نواة المحاكاة – النهائي";
		Desc = "يزيد قوة المتفجرات بمقدار {Boost_ExplosiveRadius} ويقلل وقت التهدئة للمتفجرات بمقدار {Boost_ExplosiveCooldownReduction} أثناء اتصالك. يقوم بدمج أثر نوى الأتمتة وكرونوميكون نوى القوة في هذا الإكسسوار.";
	}}, {{
		Name = "أثر السلطان";
		Desc = "يعزز أثر السلطان رموز الهيبة لديك بمقدار {Boost_PrestigeTokens}.";
	}, {
		Name = "إرث السلطان";
		Desc = "يعزز إرث السلطان رموز الهيبة لديك بمقدار {Boost_PrestigeTokens}.";
	}, {
		Name = "كرونوميكون السلطان";
		Desc = "يعزز كرونوميكون السلطان رموز الهيبة لديك بمقدار {Boost_PrestigeTokens}.";
	}, {
		Name = "السلطان المتسامي";
		Desc = "يعزز السلطان المتسامي رموز الهيبة لديك بمقدار {Boost_PrestigeTokens}.";
	}}, {{
		Name = "أثر جرح الخام";
		Desc = "يقوم هذا الإكسسوار بتعدين جميع الخامات المجاورة للكتلة التي يتم تعدينها إذا كنت قادراً على تعدينها بسرعة كافية.";
	}}, {{
		Name = "خاتم سينوم";
		Desc = longstring1;
	}, {
		Name = "أثر سينوم";
		Desc = longstring1;
	}}, {{
		Name = "أثر روبتيس";
		Desc = "باستخدام أثر روبتيس، تمنحك الانفجارات الناتجة عن الخامات الأثيرية+ جميع الكتل التي يتم تفجيرها.";
	}}, {{
		Name = "أولتيمـا موبيليتاس";
		Desc = "تعدين خام نادر يسبب انفجارًا بقوة 6، وتعدين خام أسطوري يسبب انفجارًا بقوة 20، وتعدين خام خرافي يسبب انفجارًا بقوة 33، وستحصل على جميع الكتل التي تفجرها الخامات الأثيرية+، كما أن تعدين الزمرد يسبب انفجارًا بقوة 17. يجمع هذا الإكسسوار بين Ruber Chronomicon وFragon Artifact وBang Chronomicon وRuptis Artifact.";
	}}, {{
		Name = "تعويذة ماجيكاي";
		Desc = longstring2;
	}, {
		Name = "خاتم ماجيكاي";
		Desc = longstring2;
	}, {
		Name = "أثر ماجيكاي";
		Desc = longstring2;
	}, {
		Name = "إرث ماجيكاي";
		Desc = longstring2;
	}, {
		Name = "كرونوميكون ماجيكاي";
		Desc = longstring2;
	}}};
	Blocks = {"التراب", "الرمل", "الوحل", "فخار", "الطين", "الخث", "الطباشير", "السماد", "الحصى", "التربه انتيسولس", "التربة القاحلة", "انسيبتو سولس", "الجيليسولس", "جيرمانتي", "تراب مضغوط", "الجذور", "الفطريات", "الفطر", "البطاطس", "البنجر", "الجزر الأبيض", "الزنجبيل", "الكركم", "نفق غوفر", "حيوانات الخلد", "الموليسول", "الفخار المكسور", "كبسولة زمنية", "طين مضغوط", "طين متماسك", "طين مائي", "طين نباتي", "عجلة", "مدينة الطين", "طين متسخ", "هيكل عظمي", "كنز", "طين فضائي", "نوكيا", "نفايات نووية", "مستودع نفط", "زيت محرك", "طين ما قبل التاريخ", "تراب كثيف", "الثوم", "الفجل", "اليوكا", "الجيكاما", "النمل", "الحشرات", "صراصير القدس", "الألفية", "النمل الأبيض", "اسلحه مكسوره", "قطع نقديه قديمه", "تلميحات اسهم", "عظام", "قطع أثرية قديمة", "طين", "التربه العشبيه", "التربه الفطرية", "التربه المحروثه", "تربة الجذور النباتية", "التربة المصابة", "التربة المستقبلة للشمس", "شجرة الجذور الترابية", "التربة المصابة بالقمامة", "تراب عملاق", "تربة العنكبوت", "تربة البط المطاطية", "التربة الورقية", "حزمة التربة", "حجر", "فلينت", "كوكينا", "الدولوميت", "الحجر الجيري", "توفا", "الأوليت الصخر كيلسي", "البريكا", "تكتل", "الكاليش", "الحجر الرملي", "نغمة الصمت", "الدياتومايت", "هالايت", "الكريستال", "العشب العميق", "العشب الميت", "العشب المبلل", "العشب الخصيب", "عشب باتشي", "العشب المتجمد", "العشب المتصدع", "العشب المزيف", "جذور العشب", "بذور العشب", "العشب الفضائي", "عشب القمر", "عشب الدوده", "لمس العشب", "كريتر", "حجر مضغوط", "رخام", "نوفاكوليت", "كوارتزيت", "سكارن", "النيس", "أمفيبوليت", "هورنفيلز", "سليت", "شيست", "فيليت", "حجر الصابون", "أنثراسايت", "ماريبوزيت", "فيرديت", "اللازورد", "عشب", "فيسكو", "موني وورت", "كواكجراس", "أوزة العشب", "رقعة من العشب", "داليسجراس", "ذيل الحصان", "الأبيض الإيطالي", "ملوخية", "ساحرة العشب", "سبيدويل", "صغير النبات", "يارو", "الهندباء", "البرسيم ذو الأربع أوراق", "حجر كثيف", "ديوريت", "أنديسايت", "الريوليت", "جرانيت", "البغماتيت", "جابرو", "دياباس", "حجر بركاني", "بلاجيوجلاز", "دياسيت", "النحاس الخفي", "حجر مسامي", "البستنيسيت", "أوبال النار", "سماء", "سحابة بيضاء", "سحابة رمادية خفيفة", "سحابة رمادية داكنة", "طائرة", "طائرة ورقية", "طائر", "نفاثة خاصة", "بالون الطقس", "هليكوبتر", "شخص ساذج", "مروحية عسكرية", "عاصفة رعدية", "إعصار", "بركان", "زجاج بركاني", "سالاكسوم", "باكسيريت", "سوبريسريز", "مركبة سالاكسوم", "ديكونوجارون", "البوكسيت", "سكريولين", "بيراجومايت", "موسيقى زجاج بركاني", "لاسيرو لامينتا", "الزجاج البركاني قوس قزح", "الوقت زينو", "المونازيت", "السماء العالية", "طائرة كونتريل", "أشعة الشمس", "غيوم رقيقة", "طائرة درون", "سحابه عملاقه", "جو ضبابي", "نفايات فضائيه متساقطه", "كسوف الشمس", "صاروخ", "جسم غامض", "الشفق القطبي", "متوهجة الغيوم", "قبة زرقاء", "الحجر الزجاجي البركاني المنصهر", "سيليا", "بيراجومايت", "تفرخ اللهب", "شيميكالا", "جريكونوجارون", "جيريس", "بيرهوموميت", "دوتوريت", "سينترومودور", "فابوريستر", "حجر النيران", "تيراسيت", "المغنيسيوم", "الفضاء", "نجمه حمراء", "نجمه برتقاليه", "الشمس", "نيزك", "الكويكب", "القمر", "كوكب قزم", "الأقمار الصناعية", "كوكب", "المذنب", "خاتم الكوكب", "محطة الفضاء الدولية", "أومواموا", "الحمم البركانيه", "عزز البازلت", "سكوريا", "حجر إسفنجي", "الحمم الصلبة", "ديفينستيوم", "ستيلان", "بيرزومي", "زا بوتوت", "جنيكسون", "بولونيت", "قلب النار", "جزءا لا يتجزأ من الشمس", "جحيم", "حجر مشع", "اليورانيوم", "اليورانيوم", "الجاميت", "ممسحة تازيق", "الباريتيوم", "نشاط محدود", "راتيتيوم", "زونيوميت", "أبيض هايت", "أدسمايت", "برينيوم", "ليجينيوم", "ليمونيون", "زجاج بركاني سام", "خصر مسحوق", "نفايات الزيت", "تصلب النواة", "عظام متشققة", "مكعب اصطناعي", "النفايات المتشققة", "بقايا روبوت ما قبل التاريخ", "شظايا الحمم", "الحطام المنصهر", "أحمر بيريل", "مؤلمنايت", "أداة قديمة", "كريستال الشمس", "نفايات مضغوطة", "نفايات الصقيع", "حمم سامه", "ثنائي أكسيد الثوريوم", "سيليكا", "الرماد المضطرب", "بيروكلاست", "داسيت مشعع", "توبزيتي", "كولبالت", "الموجة المتحجرة", "الأوساخ العميقة", "النفريت المشوه", "ليجرانديت", "سامنايت", "بولونيوم", "أستاتين", "الحمم المغليه", "الألومنيوم", "فولوسيت", "تي لبار", "الزئبق", "فاي جاريوم", "ريزوفيد", "جاغديت", "اليولاسيت", "فاكسيوم", "فارليسين", "هذيان", "بيروسيت", "ساكريوكسين", "سإكرازيل", "كريستال ليفياثان", "اللب الخارجي", "ريليجود", "كارزيوم", "سيلوروس", "فوكسروفين", "إنسي نديروم", "الجبلة الخارجية", "زعفران", "سوب ساينايت", "الأحرجيم", "البرشيوم", "زانفور -ثمان وثمانين", "تارو لوم", "كي فور- ار يو- ال- ون يو ام", "جيرولفاسيون", "عنصر تون-ست مئه و ثمان عشر", "النواة الوسطى", "سولتريك", "ريجويل", "جوكيريوم", "الهيدروجين الغير نقي", "دارنيت", "اثيرنوم", "المكابريوم", "أونوليت", "فرنوكاجين", "نيثريتي", "نيكل معبأ بإحكام", "سبيكة غريبة", "مرصع بالجواهر لامنتا", "كوبالت ثوريوم جي", "بقايا فينجريت", "النواة الداخلية", "خام الحديد اللامع", "الأكسجينيوم", "خام الفضة اللامع", "الهيدروجين المضغوط", "لافانيوم", "ميلتور", "جليمريوم", "حبيبات", "الصخور البدائية", "الرماد البركاني", "ماج مورثوم", "نوراليوم", "خام السبيكة", "السنترا", "بلازما مستحيلة", "الفضاء العميق", "المادة المظلمة", "الثقب الأسود", "بقايا كوكب", "المجرة", "ستار ريمنانت", "قوس الشق", "النجم النيوتروني", "أوبال المجرة", "ميتيلوم", "كائن متحضر مارق", "سكريب", "المذنب الأخضر", "ليتورب", "مايكرو سبوبيكسبك", "القزم الأسود", "الحفره البيضاء", "شبه نجمة", "حجر القمر", "لوناريوم", "بلورات القمر", "سيلينا أور", "القمرية", "كريستال ستاردست", "كوارتز سماوي", "خام القمر", "نجمي", "مون سول", "الجمشت القمري", "جوهر القمر", "خام لهب القمر", "كريستال ظل القمر", "لوناريسيوم", "جوهر سولارمون", "نجمة الموت", "حزام الكويكبات", "قطعة بازلت", "خام السيليستيوم", "كتلة نيكل", "نيزك", "عرق الكوبالت", "شظية بلاتين", "عنقود إيريديوم", "جوهرة نيزكية", "بلورة زينون", "بلورة فراغ", "جرافيتونيوم", "النواة الكونية", "ياقوت نجمي", "حجر التفرد", "منظر طبيعي", "مركز الغلاف الجوي", "رمال الزمن", "نترونيوم نقي مضغوط فائق", "نواة البلازما", "لغم فضاء فرعي", "كرونوس", "ليالٍ عديدة من السماء", "كرومالايت", "ثندريوم", "سيراف", "لافاسبايت", "زجاج التنين", "حجر الفراغ", "زايكرايت", "دراكونيوم", "ألماس متجمد", "كراهية ملتهبة", "ويجكوليد", "غوستافون", "شظية منصهرة", "زجاج اللهب", "سجن الجحيم", "نار نجمية", "روهوككايم", "البايرايت", "حجر الشمس", "ذاكرة محترقة", "ياقوت منصهر متشقق", "تشويه", "الراديوم", "أوجانيسون", "كريبتونيت", "إوودوجد", "هاتف محمول", "دائرة كهربائية", "الأكتينيوم", "البلوتونيوم", "الثوريوم", "كريستال تشيرينكوف", "ثابت", "هيكسافلوريد اليورانيوم", "بلازما", "رمل الأرواح", "زيفيندايت", "إغنيساكسوم", "صقيع قطبي", "حديد غازي", "حجر الزهرة الشوكية", "عنكبوت النار", "أليووثايم", "نجم ساقط", "كياوثويت", "أورو", "كويكسكولايم", "أراس", "شذوذ", "زيادة اللون", "قبة", "كريستال الإثيريوم", "خامة مباركة", "سيليستيم", "شيطان مقيد", "حساب بيانات ثنائية", "الأمل الزائل النهائي", "جلاكسيم", "إترنيوم", "جينيسيوم", "السيف الرمادي والنجوم", "منشور لافاكسايت", "نار البلازما", "مرسى الواتريوم", "مضطرب", "توريوم", "ذافيمنيلنيلنيل", "نواة التيسرّكت", "نوكترونيس", "طاقة أثرية", "كيان مشتعل", "كوميتيوم", "صفر", "جيديون", "حجر خطي", "تريانغليوم", "سكوارايت", "سيركلايت", "كايتانيوم", "أوفاليوم", "ترايبزايد", "أوكتاغونيوم", "بنتاجريوم", "هيكساغريت", "كروسيليت", "لوفيليت", "سنوثانيوم", "سيندريلليوم", "ودجيليت", "سفيريت", "باي سيركومفيرنسيوم", "ستارلايت", "تريشاترِيت", "نواة هندسية", "إن-جون", "إكليبسيرا", "إيريدانيت", "ستارسيرايت", "غرافونيكس", "سولينايت", "إكليبسيرون", "سكرابايكس", "نوكتيرايت", "كوسماريل", "أومبريكس", "أستراليث", "إيثرونيون", "أيرونيكس", "نيمبريل", "خام سولاريوم", "زيفيروسيت", "تمبستراليث", "ستراتونيوم", "بريزيوم", "فنتريكس", "فولتاسيت", "سيليستارا", "سكينكسيوم", "فيردانييت", "فلوراسيت", "إيلاريون", "سيلفانيث", "زيلوغرانيتي", "أمبريث", "دروانيت", "تيرافين", "غايا لايت", "كلايثيوم", "لوميكس", "سيدريكس", "روبراث", "شالورايت", "تيراليث", "حجر مير", "تيناريت", "جيوداين", "أوريفين", "تيركرون", "غرافليوم", "فيرونيكس", "كريمورا", "أمارون", "كومباكسايت", "برونزيوم", "سليثيم", "روبراسايت", "أوبال أوبريكس", "أوبدوريوم", "أرجينيكس", "أونيثيرا", "روبراكسيس", "نوكتيرا", "أومبروسيت", "بلومبرين", "مالاكيتيا", "سافيروس", "دراكونيكس", "ليثيريوم", "زينثيريوم", "توبازرين", "هيموفير", "فولكاريون", "تونغريث", "جادكس", "غارنييروس", "نيهيتريت", "شازمايت", "فولكريس", "أوبريثيت", "بايرليث", "إغناريون", "ماغموريكس", "بلورة اللهب", "راديونيكس", "أوفي رايت", "فينومييث", "كوروسايت", "سكالديوريوم", "كوريثيوم", "ماغنيت", "بيروثيست", "إنفيرنوكس", "إغنيريوم", "ديبفيروس", "سولاريكس", "ماغميرا", "فولاذ العصور", "نيكسيوم", "نيبريكس", "كوسميث", "لوناريسايت", "سيليستيوم", "سيليستين", "ريكتايت", "كالسينيت", "حجر فينوس", "سولفاريس", "كوارتز مزهر", "فينيت", "زجاج محترق", "إيروسين", "خام عرق الكهرمان", "لؤلؤة الفوماريت", "أوريكزيو الفينيري", "الهالة القرمزية", "فالينيت", "حجر الزهرة الرمادية", "شيثيريون", "فابورا المذهبة", "زجاج سيرافي", "فينالايت", "شظية اللهب الذهبية", "جوهرة إكليبسيرا", "سولينفي", "الهالة الشوكية", "عرق نجمي", "تارتاريوم", "حجر عطارد", "الفيرّيت", "غوته الرمادي", "ميرسيروسايت", "البازلت المحترق", "إمينسكو", "خام سيندرمارك", "فولكارين", "فوهة أبيدين", "فولاذ اللهب", "راديولايت", "وريد الإغنلايت", "أوراليت", "زجاج نار الشمس", "حوض كالوريس", "كوروناتهيوم", "الفولكنيت الأساسي", "حوض ريمبرانت", "هيليارخيت", "تولستوي", "نواة راينهارت", "ستيلبون", "سطح الشمس", "نتوء شمسي", "زجاج الجمرة", "رماد شمسي", "ثقب إكليلي", "الكرة الضوئية", "الطبقة اللونية", "فوتونيكس", "عِرق الثرمايت", "كوارتز حجاب الشمس", "شظية إغنيس", "غبار هيليوس", "حجر نواة سولاريس", "جوهرة ضوء الرماد", "سبيكة لهب ذهبي", "بروميثيون", "سولينيوم مشع", "بيريت الفجر", "تاج الفجر", "منشور جحيمي", "توهج شمسي", "لهيب شمسي أبدي", "صمت بيتهوفن", "هناك في الخلف يا بنيامين", "110011 1010010 1010010 110000 1010010 101110 110100 110000 110100", "الكوازر المنشوري", "مُحاط بالمعاناة", "سقوط يعقوب إلى الأبدية", "ΒΞDRΩCK", "fαтє", "المصير يسير كأي رجل", "قدم الـ E̶͐́l̸̆̊ė̷͙p̷͒̍h̷͂͝ǎ̴̿n̶̛t", "αи∂яσмє∂α", "هاوية المونوكرايت", "انظر إلى ما وراء   ̶C̶U̶R̶T̶A̶I̶N̶  الجحيم", "你聽到了嗎？？？？？？？？？", "إله الأجسام الصلبة للرياضيات الهندسية", "عرق الانفجار الشمسي", "الألوهية الخالصة", "المستوى البديل", "TUDOL", "نواة الشمس", "الهيدروجين تحت السطحي", "كورغريت", "خبث شمسي", "هيدروجين الكواديوم", "التاكوكلين", "زجاج هيليون", "بلازميروم", "إيراديت", "فوتوفايت", "هيليكوريت", "عظم نجمي", "سبيكة الإنفرنيك", "سولاتريكس", "كريستال اللومينفورج", "كورونايث", "فيرميون", "جوهرة الروح النارية", "ستيلاريوم", "جيميسيس", "قلب الشمس", "أجسام بُعدية", "الإنذار الأخير", "سانكتارايت خالص", "هسيسيا", "تيراروم", "الأوديسة", "صُنع في السماء", "غضب بالّيك", "Φοβος", "ابوكريفا", "العلامة فوق العقلانية", "فساريا", "→ أورورا ⇋ النهائي ⇋ ←", "《『R』『E』『V』『E』『L』『A』『T』『I』『O』『N』》", "الآلية قبل الأخيرة", "『Ｉｎｄｅｘ』『Ｄｅｉ』『ｌａｔｅｎ』", "حجر المريخ", "صخر الصدأ", "خام الغبار المقيّد", "الحجر الأحمر", "غرافيليت", "فيرينيت", "لوح الرماد", "تيراكلين", "أوكسيدولايت", "زجاج مارتي", "سبيكة قرمزية", "نواة روبيون", "فولكارايت", "سانغريلايت", "بلورة ظل الحديد", "حجر روح المريخ", "تيتانيت مشكّل بالغبار", "ياقوت الزلزال الأحمر", "نواة آريس", "مكعب قرمزي", "مياه بورِياليس", "سيرافيت ديموس", "فوبوس", "JeremyDevs", "『Ｏｎｃｅ』『Ｂｙ』『Ｈｕｍａｎ』", "غاز المشتري", "الهيدروجين المضغوط", "صخر المشتري", "الهيدروجين المعدني", "عاصفة محبوسة", "ضباب الضغط", "الهيدروجين المتأين", "الأمونيا المشحونة", "ريشة الشفق القطبي", "بخار الإعصار", "اندفاع الميثان", "مسبار محطّم", "جوهر المشتري", "محطة المشتري", "بلازما العاصفة", "بخار البقعة الحمراء العظيمة", "الشفق العظيم", "أوروبا", "سيادة زيوس", "التقارب", "السحر", "الأقمار الصناعية الكونية", "أثاناتوس", "غاز زحل", "انجراف الهيليوم", "الحلقات الباردة", "الضباب الذهبي", "مولود الحلقات", "الأمونيا المتجمدة", "الضباب الكريوجيني", "صخر الحلقة الخارجية", "حرير الضغط", "سحابة عاصفة الحلقات", "حجاب الميثان", "الكارما والزمن", "جوهر ضوء الحلقات", "كرونوس", "العاصفة الصامتة", "سحابة تاج زحل", "التيار الذهبي", "خام داوود", "نجم ريمفان", "الغلاف العتيق", "كثافة أحادية اللون", "أسلاك متعددة الألوان", "نواة التيتانوس", "الآلة المركبة", "طلاء الخردة", "أسلاك حديدية", "سبيكة الصدأ المقيّدة", "حجر التروس", "خام الدوائر", "شبكة فولاذية", "قناة النبض", "ميكاسيل", "بلورة المنطق", "نواة السيرفو", "السبيكة الثنائية", "المصفوفة العصبية", "ترس الزمن", "حجر الروح الصناعي", "شظية المحرك الكوكبي", "سبيكة أومنِكور", "قلب الماكينة الفولاذي", "الإله الميكانيكي", "معالج التفرد", "محرك البديهية", "منشور الشيفرة الشبحية", "التوجيه الأسمى", "غاز أورانوس", "الميثان الشاحب", "البخار المتجمد", "انجراف السحب", "الضباب الجليدي", "الدوامة الجليدية", "الحجاب الكريوجيني", "الضباب الأزرق", "التدفق المائل", "الارتجاف القطبي", "حجاب صقيع الميثان", "التيار النفاث المتجمد", "تيار الشفق", "رياح الصقيع المتلألئة", "الإعصار الصامت", "نسيم عملاق", "اللولب الأثيري", "الهالة المتجمدة", "البرودة السماوية", "قفل الجليد البدائي", "الأثيرية", "ضباب الأثير", "نواة أورانوس", "『Dʏꜱꜰᴜɴᴄᴛɪᴏɴᴀʟ』『Aʙᴇʀʀᴀᴛɪᴏɴ』", -- : First try: K:0: attempt to index nil with 't'
;
	Explosives = {"الديناميت", "قنبلة", "سي فور", "تي ان تي", "صاروخ", "نووي", "قنبلة القيصر", "قنبلة نيوترونية", "قنبلة المادة المضادة"};
	Leaderboards = {"معظم النقود", "معظم مجموع الكتل", "معظم وقت اللعب", "معظم الكتل التي تم إيجادها", "معظم الرموز", "معظم الرموز المميزة", "أكثر مبلغ تم إنفاقه من روبوكس"};
	Gamepasses = {
		x2Cash = "2x نقدًا";
		x2CashDesc = "مضاعفة كل دخلك النقدي";
		x2Emerald = "2x Emerald";
		x2EmeraldDesc = "يضاعف الزمرد الذي تحصل عليه من خام الزمرد";
		SharperPickaxes = "فؤوس حادة";
		SharperPickaxesDesc = "ستكون جميع الفؤوس أقوى بنسبة 10٪";
		x2PickaxePower = "2x Pickaxe Power";
		x2PickaxePowerDesc = "مضاعفة قوة كل الفؤوس";
		x2MiningSpeed = "2x سرعة التعدين";
		x2MiningSpeedDesc = "مضاعفة سرعة التعدين";
		x2Storage = "2x مساحة تخزين";
		x2StorageDesc = "مضاعفة سعة تخزين حقيبة الظهر";
		InfiniteBackpack = "حقيبة ظهر لا نهائية";
		InfiniteBackpackDesc = "ستصبح مساحة تخزين حقيبة الظهر الخاصة بك لا نهائية";
		Teleporter = "الناقل الآني";
		TeleporterDesc = "يمنحك جهاز نقل عن بعد يمكنك وضعه في أي مكان والانتقال إليه في أي وقت. بالإضافة إلى ذلك, تجعل جميع Lobby Teleports مجانية";
		VIP = "كبار الشخصيات";
		VIPDesc = "ستفتح فأس وحقيبة ظهر وبطاقة دردشة حصرية لكبار الشخصيات. بالإضافة إلى ذلك, ستحصل على المزيد من الزمردات من المشتريات";
		x2Speed = "2x السرعة";
		x2SpeedDesc = "يسمح لك بالسير مرتين أسرع من المعتاد";
		x2Jump = "2x قفزة";
		x2JumpDesc = "يسمح لك بالقفز 2x أعلى من المعتاد";
		Jetpack = "Jetpack";
		JetpackDesc = "يفتح Jetpack الذي يسمح لك بالتحليق";
		MoreRange = "نطاق أكبر";
		MoreRangeDesc = "يزيد مدى التعدين بمقدار +5 كتل";
	};
	["المهام"] = {"ملكي {1} {2}", "كتلتي {1} {2} كتلتي", "كتل {1} الخاصة بي", "خاصتي {1} الأوركيين", "حفر حتى عمق {1}", "تجهيز فأس # {1} أو أفضل", "تجهيز حقيبة الظهر # {1} أو أفضل", "استخدام {1} مادة متفجرة"};
	TranslatorSettings = {
		Locale = "ar";
		Numbers = {"٠", "١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"};
		ReverseNumbers = true;
		Seperator = ',';
		Decimal = '.';
		Suffixes = {"مليون", "مليار", "تريليون", "كوادريليون", "كوينتيليون", "سيكستيليون", "سبتيليون", "أوكتليون", "نونليون", "ديليون", "يوديشيليون", "دوديسيليون", "تريديشيلون", "كواتورديشيليون", "كوانديليشينيون", "كواينديشيليون", "سيكسيديشيلون", "سيبتينديشيليون", "اوكتيشيليون", "نوفيمذيشيليون", "فيرجينتيليون"};
		TimeAbbreviations = {'s', 'm', 'h', 'd', 'y'};
		Translator = 662979187;
	};
}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Translator.spanish
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:21:59
-- Luau version 6, Types version 3
-- Time taken: 0.079186 seconds

local longstring1 = "Este accesorio aumenta el espacio de la mochila en {Boost_BackpackSpace} y otorga {Boost_LocalMagicPower} m\xE1s Poder M\xE1gico que los accesorios habituales de esta rareza."
return {
	Main = {
		Cash = "Dinero";
		BlockCount = "{1}/{2} Bloques";
		BlockCountUnlimited = "{1} Bloques";
		EnableJetpack = "Activar Propulsor";
		DisableJetpack = "Desactivar Propulsor";
		ToSurface = "A La Superficie";
		Backpack = "Mochila";
		Index = "\xCDndices";
		Settings = "Configuraci\xF3n";
		ReloadChunks = "Recargar Trozos";
		Placing = "Colocando {1}";
		Unbreakable = "Irrompible";
		BackToMining = "Volver A La Miner\xEDa";
		SearchBlocks = "Buscar Bloques...";
		Place = "Colocar";
		Lock = "Trancar";
		Unlock = "Abrir";
		BackpackFull = "Mochila Llena";
		BackpackFullMessage = "Has llenado tu mochila por completo y no podr\xE1s minar hasta que vendas, coloques bloques o actualices tu mochila.";
		Sell = "Vender";
		Upgrade = "Actualizar";
		BlocksDiscovered = "{1}/{2} Bloques Descubierto (+{3}% Dinero)";
		IndexLayer = "{1} | {2} al {3}";
		IndexLayerNoUp = "{1} | {2} y m\xE1s";
		IndexLayerNoDown = "{1} | {2} y menos";
		BaseValue = "Valor Base: <font color=\"#00FF00\">${1}</font>";
		CurrentValue = "Valor Actual: <font color=\"#00FF00\">${1}</font>";
		Durability = "Durabilidad";
		Rarity = "Rareza";
		ProbabilityToSpawn = "Probabilidad de Engendrar: 1 en {1} Bloques";
		IndexCredit = "Bloquear por";
		Loading = "Cargando";
		TotalMined = "Total Minado";
		Back = "Atr\xE1s";
		On = "Encendido";
		Off = "Apagado";
		TimePlayed = "Tiempo Jugado";
		Blocks = "Bloques";
		Shop = "Tienda";
		ComingSoon = "Pr\xF3ximamente...";
		Buy = "Comprar";
		Bought = "Comprado";
		Max = "M\xE1xima";
		Gift = "Regalo";
		Gamepasses = "Pases de juego";
		Owned = "Propiedad";
		OwnedByRecipient = "Propiedad del destinatario";
		StopGift = "Dejar de regalar";
		NoGifts = "Actualmente no hay nadie para regalar en este servidor.";
		EnterUsername = "Ingrese el nombre de usuario aqu\xED";
		Emeralds = "Esmeraldas";
		MostPopular = "M\xC1S POPULAR";
		BestOffer = "MEJOR OFERTA";
		TeleportRequest = "Solicitud de Teletransporte";
		TeleportRequestMessage = "Tu amigo {1} ha pedido ayuda, \xBFte gustar\xEDa ser transportado a ellos?";
		No = "No";
		Yes = "Si";
		Upgrades = "Actualizaciones";
		Pickaxes = "Piquetas";
		Backpacks = "Mochilas";
		Close = "Cerrar";
		Equip = "Equipar";
		Equipped = "Equipado";
		BuyWithCash = "Comprar (${1})";
		Power = "Poder";
		Storage = "Almacenamiento";
		Prestige = "Prestigio";
		Prestiges = "Prestigios: {1}";
		PrestigeCashBoost = "Aumento de efectivo: {1} → {2}";
		PrestigeWithCash = "Prestigio (${1})";
		UpgradeWithEmerald = "Actualizar ({1} Esmeralda)";
		LobbyTeleport = "Teletransporte del vest\xEDbulo";
		LobbyAt = "Sala de espera en la profundidad {1}";
		Teleport = "Teletransportarse";
		UnlockFreeTeleports = "Desbloquear telepuertos gratuitos";
		PrestigeTokens = "Fichas de prestigio";
		Quests = "Misiones";
		QuestDisplay = "{1}/{2} ({3}%)";
		Completed = "Completado";
		GroupBonus = "\xA1\xDAnete a Jeremy Studio y dale me gusta al juego por un 50 % m\xE1s de dinero!";
		Tutorial = "Tutorial";
		TutorialText = "\xA1Bienvenido! Hay muchos bloques para descubrir, para comenzar a extraer, haga clic o mantenga presionado cualquier bloque que desee extraer. Cada bloque otorga una cantidad diferente de efectivo cuando se vende, pero solo puede llevar una cantidad limitada de bloques a la vez. Hay muchas capas diferentes de bloques que contienen diferentes minerales por encima y por debajo de la suciedad.";
		Ok = "Ok";
		Luck = "Suerte";
		Jackhammer = "Martillo neum\xE1tico";
		TooWeak = "Demasiado d\xE9bil";
		Explosion = "Explosi\xF3n";
		Jump = "Salto";
		Pickaxe = "Pico";
		Speed = "Velocidad";
		LikeTheGame = "DALE ME GUSTA AL JUEGO";
		ForRewards = "\xA1PARA RECOMPENSAS!";
		Range = "Alcance";
		Crafting = "Creaci\xF3n";
		MetaGain = "Obt\xE9n m\xE1s Meta por Robux gastado. Ganancia actual: {1} → {2} Meta por bloque";
		Meta = "Meta";
		MetaUnlock = "Desbloquear por {1}";
		Level = "Nivel";
		Levels = "Niveles";
		EmeraldUpgrades = "Mejoras de esmeralda";
		AFKMessage = "Se te volver\xE1 a conectar autom\xE1ticamente cada 17 minutos para evitar que te expulsen por inactividad.";
		FriendMultiMessage = "\xA1Invita a tus amigos para aumentar el poder de tu pico!";
		NoFriendsHere = "No hay amigos aqu\xED. Por cada amigo en el servidor obtienes un 10% m\xE1s de poder de pico.";
		FriendMulti = "Multiplicador actual de amigos:\n+{1}% poder de pico";
		Auto = "Autom\xE1tico";
		Pinned = "Fijado";
		Unequip = "Desequipar";
		Pin = "Fijar";
		Unpin = "Desfijar";
		MaxPins = "M\xE1ximo de fijaciones";
		MagicPowerInfo = "El poder m\xE1gico se obtiene de los accesorios que tienes equipados actualmente. Te hace m\xE1s fuerte de varias formas.";
		Craft = "Crear";
		CraftNotification = "\xA1Puedes crear {1} ahora!";
		PrestigeNotification = "\xA1Ahora puedes hacer un Prestige!";
		NoReset = "Sin reinicio";
		Sacrifice = "Sacrificio";
		SacrificeMessage = "El Sacrificio restablece lo mismo que el Prestigio, \xA1pero puedes hacerlo una vez por hora sin cumplir el requisito de dinero! Recibir\xE1s {1} Fichas de Prestigio por este Sacrificio.";
		Wait = "Esperar";
		ArchivedBlocks = "Bloques Archivados";
		CraftingRecommendation = "\xA1Se recomienda encarecidamente fabricar {1} antes que cualquier otra cosa!";
		DisableFastFall = "\xBFDesactivar ca\xEDda r\xE1pida?";
		Claim = "Reclamar";
		Showcase = "Exhibici\xF3n";
		TotalValue = "Valor Total";
		YourPlacement = "Tu Posici\xF3n";
		Top100 = "Top 100";
		Or = 'O';
		MetaUnlockProgress = "{1}/{2} Gastado";
		PrestigeMessageFree = "Con el Prestigio puedes intercambiar tu dinero por Fichas de Prestigio y un Impulso de Dinero.";
		PrestigeMessageFreeTokens = "Con el Prestigio puedes intercambiar tu dinero por {1} Fichas de Prestigio y un Impulso de Dinero.";
		PrestigeMessageFreeDaily = "El Prestigio reinicia tus picos, mochilas, dinero y bloques, pero te da un Impulso de Dinero y {1} Fichas de Prestigio, a menos que esperes {2}, entonces solo se reiniciar\xE1 tu dinero.";
		BuyAll = "Comprar Todo";
		Cooldown = "Enfriamiento";
		IndexSecretLayer = "Secreto | En todas partes";
		BlockRewards = "\xBFTe gustan los minerales? Puedes ganar 750 Esmeraldas por cada mineral hasta M\xEDtico o 3.000 Esmeraldas por cada mineral Et\xE9reo+ a\xF1adido al juego. Env\xEDa tus minerales en el servidor de Discord indicado en la descripci\xF3n del juego.";
		LeaderboardProgress = "Est\xE1s en el Top {1}";
		BlockTagged = "Bloque minado por {1}";
		Trading = "Intercambio";
		LagMessage = "Si tienes lag, se recomienda reducir la distancia de renderizado en el men\xFA de ajustes.";
		TutorialText2 = "\xA1Bienvenido! Mant\xE9n presionado cualquier bloque para comenzar a minar. Los bloques m\xE1s raros se venden por m\xE1s dinero. Hay muchas capas diferentes por encima y por debajo de la tierra con bloques mucho m\xE1s valiosos. Sus lobbies tienen mejoras \xFAnicas.";
		TutorialText3 = "\xA1Bienvenido! Mant\xE9n presionado cualquier bloque para comenzar a minar. Los bloques m\xE1s raros se venden por m\xE1s dinero. Hay muchas capas diferentes por encima y por debajo de la tierra con bloques mucho m\xE1s valiosos. Sus lobbies tienen mejoras \xFAnicas. \xA1Juega lo suficiente y podr\xE1s minar 2.000 bloques por segundo!";
		Undiscovered = "No descubierto";
		PrestigeMessage = "El Prestigio reiniciar\xE1 tus Picos, Mochilas, Dinero y Bloques, pero recibir\xE1s un Aumento de Dinero y {1} Fichas de Prestigio";
		PrestigeMessageBetter = "El Prestigio solo reinicia Picos, Mochilas, Dinero y Bloques, pero recibir\xE1s un Aumento de Dinero y {1} Fichas de Prestigio. <font color=\"#ff0000\">\xA1No reinicia nada m\xE1s! Progresar\xE1s mucho m\xE1s r\xE1pido al hacer Prestigio.</font>";
		PrestigeMessageEthereal = "El Prestigio reiniciar\xE1 tus Picos, Mochilas, Dinero y Bloques <font color=\"#ff0000\">(\xA1No Bloques Ethereal+!)</font>, pero recibir\xE1s un Aumento de Dinero y {1} Fichas de Prestigio";
		PrestigeMessageBetterEthereal = "El Prestigio solo reinicia Picos, Mochilas, Dinero y Bloques <font color=\"#ff0000\">(\xA1No Bloques Ethereal+!)</font>, pero recibir\xE1s un Aumento de Dinero y {1} Fichas de Prestigio. <font color=\"#ff0000\">\xA1No reinicia nada m\xE1s! Progresar\xE1s mucho m\xE1s r\xE1pido al hacer Prestigio.</font>";
	};
	Tips = {
		MiningAbilityInactive = "Consejo: \xA1Las habilidades de miner\xEDa fuertes est\xE1n inactivas cerca del punto de aparici\xF3n!";
		CraftingNote = "Los accesorios que son demasiado dif\xEDciles de fabricar para ti est\xE1n ocultos. Hazte m\xE1s fuerte y consigue una mochila m\xE1s grande y se desbloquear\xE1n.";
		TradingNote = "Los bloques que intercambies se archivar\xE1n y no podr\xE1n venderse por dinero, \xA1pero podr\xE1n usarse para fabricar!";
	};
	Upgrades = {
		BuyAll = "Desbloquear Comprar todo";
		KeepBackpack = "Nivel de mochila para mantener los Prestigios";
		MorePickaxePower = "M\xE1s potencia de pico";
		MoreCash = "M\xE1s Efectivo";
		JackhammerChance = "Probabilidad de martillo neum\xE1tico";
		JackhammerRadius = "Radio del martillo neum\xE1tico";
		JackhammerSize = "Tama\xF1o del martillo neum\xE1tico";
		MiningSpeed = "Velocidad de miner\xEDa";
		MiningFrenzy = "Frenes\xED de miner\xEDa despu\xE9s de encontrar un bloque \xE9pico";
		ExplosionChance = "Probabilidad de explosi\xF3n";
		ExplosionRadius = "Radio de explosi\xF3n";
		TNTLuck = "Suerte de TNT";
		MiningRange = "Alcance de miner\xEDa";
		MiningRange2 = "Alcance de miner\xEDa 2";
		UnlockCrafting = "Desbloquear creaci\xF3n";
		MoreAccessorySlots = "M\xE1s espacios para accesorios";
		MoreMeta1 = "M\xE1s Meta 1";
		MoreMeta2 = "M\xE1s Meta 2";
		MoreMetaBlocksMined = "M\xE1s Meta basada en los bloques minados";
		MoreLuck = "M\xE1s Suerte";
		MoreRange = "Mayor Alcance";
		DuplicateBlocks = "Probabilidad de Duplicar Bloques";
		WalkSpeed = "M\xE1s Velocidad al Caminar";
	};
	UnlockMessages = {
		Prestiges = "Se desbloquea en {1} Prestigios";
	};
	Rarity = {"Com\xFAn", "No Com\xFAn", "Raro", "\xC9pico", "Legendario", "M\xEDtico", "Et\xE9reo", "Celestial", "Cenit", "Divino", "Nula"};
	Settings = {
		Low = "Alta calidad";
		LowDesc = "Todos los bloques principales de una capa aparecer\xE1n en alta calidad, esto puede causar mucho retraso";
		RenderDistance = "Distancia De Renderizado";
		RenderDistanceDesc = "Cambie cu\xE1ntos trozos puedes ver en cada direcci\xF3n";
		Teleport = "Teletransportar";
		TeleportDesc = "A los amigos que invites se les pedir\xE1 que sean teletransportados a tu posici\xF3n actual";
		Music = "M\xFAsica";
		MusicDesc = "Alterna si la m\xFAsica debe reproducirse o no";
		FastFall = "Ca\xEDda R\xE1pida";
		FastFallDesc = "Ser\xE1s teletransportado al fondo de un agujero cuando caigas durante un tiempo determinado";
		x2Speed = "x2 Velocidad";
		x2SpeedDesc = "Alterna que caminas el doble de r\xE1pido que de costumbre";
		x2Jump = "2x Salto";
		x2JumpDesc = "Alterna que saltas el doble de lo habitual";
		Reload = "Recargar fragmentos";
		ReloadDesc = "Puedes recargar todos los Bloques en caso de que ocurran fallas";
		FastFly = "Vuelo R\xE1pido";
		FastFlyDesc = "Ser\xE1s teletransportado al punto m\xE1s alto al usar el jetpack durante un cierto tiempo";
		DarkLighting = "Iluminaci\xF3n Oscura";
		DarkLightingDesc = "Activa o desactiva la iluminaci\xF3n oscura";
		FriendMarkers = "Marcadores de amigos";
		FriendMarkersDesc = "Activa o desactiva la visibilidad de tus amigos";
		BreakingSprites = "Sprites de rotura";
		BreakingSpritesDesc = "Activa o desactiva la visibilidad de los sprites de rotura al minar bloques";
		JumpJetpack = "Jetpack de Salto";
		JumpJetpackDesc = "Usar\xE1s autom\xE1ticamente el jetpack mientras saltas";
		Sounds = "Sonidos";
		SoundsDesc = "Activa o desactiva la reproducci\xF3n de sonidos";
		ChatTags = "Etiquetas de chat";
		AutoRender = "Renderizado autom\xE1tico";
		AutoRenderDesc = "Reduce autom\xE1ticamente la distancia de renderizado si se detecta lag";
		BlockStepping = "Subida de bloques";
		BlockSteppingDesc = "Subes autom\xE1ticamente a los bloques";
	};
	ChatMessages = {
		BlockFound = "{1} acaba de encontrar {2}";
		MultipleBlocksFound = "{1} acaba de encontrar {2} {3}";
		OreFound = "{1} acaba de encontrar {2} ({3}) en la Capa de {4} (1 in {5} Bloques)";
		OreFoundShort = "{1} acaba de encontrar {2} (1 en {3} Bloques)";
		MultipleOresFound = "{1} acaba de encontrar {2} {3} ({4}) en la Capa de {5} (1 en {6} Bloques)";
		YouBlockFound = "Acabas de encontrar {1}";
		YouMultipleBlocksFound = "Acabas de encontrar {1} {2}";
		YouOreFound = "Acabas de encontrar {1} ({2}) en la Capa de {3} (1 en {4} Bloques)";
		YouOreFoundShort = "Acabas de encontrar {1} (1 en {2} Bloques)";
		YouMultipleOresFound = "Acabas de encontrar {1} {2} ({3}) en la Capa de {4} (1 en {5} Bloques)";
		TeleporterDestroyed = "Tu Teletransportador ha sido destruido porque se le ha colocado un bloque";
		MiningFrenzy = "\xA1Frenes\xED de miner\xEDa activado! Ahora minar\xE1s {1} m\xE1s r\xE1pido y causar\xE1s {2} m\xE1s da\xF1o durante 1 minuto.";
		LikeGoalReached1 = "Meta de me gusta alcanzada. +25% de velocidad de miner\xEDa y +25% de da\xF1o durante los pr\xF3ximos {1} minutos.";
		LikeGoalReached2 = "Meta de me gusta alcanzada. +25% de dinero y +25% de da\xF1o durante los pr\xF3ximos {1} minutos.";
		IntroMessage1 = "⛏️\xA1Cada lobby tiene su propia funci\xF3n \xFAnica!⛏️";
		IntroMessage2 = "💎\xA1\xDAnete al grupo y da like al juego para ganar un 50% m\xE1s de dinero!💎";
		OreUncovered = "\xA1Se acaba de descubrir un mineral de {1}!";
		EmeraldUncovered = "\xA1Se acaba de descubrir una esmeralda!";
		Emerald = "{1} te acaba de regalar {2} Esmeraldas";
		Gamepass = "{1} te acaba de regalar {2}";
		EmeraldYou = "Acabas de regalar {2} Esmeraldas a {1}";
		GamepassYou = "Acabas de regalar {2} a {1}";
		EmeraldOther = "{1} acaba de regalar {3} Esmeraldas a {2}";
		GamepassOther = "{1} acaba de regalar {3} a {2}";
		BlockEmeraldsAwarded = "\xA1Has recibido {1} Esmeraldas por crear minerales!";
		UnprocessedBlock = "Has recibido {1} porque el servidor se cerr\xF3.";
		BigCave = "\xA1Una gran cueva apareci\xF3 cerca de ti!";
	};
	ChatTips = {"Dato curioso: \xA1hay un total de {1} mejoras en este juego!", "\xA1Actualmente hay {1} bloques \xFAnicos en el juego!", "La mayor\xEDa de los minerales del juego fueron creados por {1} y {2}", "\xBFAtascado? Intenta hacer un Prestige.", "Uno de los desarrolladores del juego tiene la mayor cantidad de insignias en todo Roblox con 135 millones y ha alcanzado el l\xEDmite m\xE1ximo permitido.", "La rareza de bloque m\xE1s rara tiene una probabilidad de aparici\xF3n de 1 entre 2,000,000,000...", "La velocidad de miner\xEDa es m\xE1s \xFAtil de lo que parece a simple vista...", "Los regalos funcionan entre servidores, incluso si la persona a la que intentas regalar est\xE1 desconectada. Solo necesita haber jugado al menos una vez.", "Los autoclickers y macros est\xE1n permitidos, pero los exploits no.", "Despu\xE9s de desbloquear el crafteo y crear el Artefacto Machina, puedes salir del juego para que farmee autom\xE1ticamente por ti.", "Hay una probabilidad de 1 entre 10,000 de recibir este mensaje. \xA1Felicidades!"};
	DiscordChatTips = {"Si te gustan los minerales del juego, \xA1puedes crear los tuyos en el servidor de Discord del juego! :)"};
	ServerResponses = {
		Error = "Un error ocurrio, trate de nuevo mas tarde";
		AppealEmpty = "La apelaci\xF3n no puede estar vac\xEDa";
		AppealInvalidCharacters = "La apelaci\xF3n contiene caracteres no v\xE1lidos";
		AppealTooShort = "Apelaci\xF3n demasiado corta";
		AppealTooLong = "Apelaci\xF3n demasiado larga";
		AppealTooFast = "Est\xE1s enviando apelaciones demasiado r\xE1pido, ralentizar";
		AppealFiltered = "Se ha filtrado la apelaci\xF3n";
		AppealSuccess = "Apelaci\xF3n enviada con \xE9xito, nos pondremos en contacto con usted pronto.";
		ResponseEmpty = "La respuesta no puede estar vac\xEDa";
		ResponseInvalidCharacters = "La respuesta contiene caracteres no v\xE1lidos";
		ResponseTooShort = "Respuesta demasiado corta";
		ResponseTooLong = "Respuesta demasiado larga";
		ResponseDecision = "Tienes que seleccionar una decisi\xF3n";
		ResponseTooFast = "Est\xE1s enviando respuestas demasiado r\xE1pido, ralentiza";
		ResponseFiltered = "Se ha filtrado la respuesta";
		NotBanned = "Este usuario no est\xE1 baneado";
		AlreadyResponded = "Ya se ha enviado una respuesta a esta apelaci\xF3n";
		NoData = "Este usuario no tiene datos";
		UnableRespond1 = "Si no puede responder a esta apelaci\xF3n, comun\xEDquese con un rango superior para obtener ayuda.";
		UnableRespond2 = "No se puede responder a esta apelaci\xF3n, porque este usuario ha sido super perm baneado";
		ResponseSuccess = "Respuesta enviada correctamente";
		LayerTooPowerful = "La capa es demasiado poderosa, no se puede colocar el explosivo";
		NoBlocksExploded = "El explosivo no explot\xF3 ning\xFAn bloque y no ha sido cargado";
		GiftSuccess = "Tu regalo para {1} ha sido enviado con \xE9xito";
		GiftError = "Su regalo para {1} ha fallado, se volver\xE1 a intentar cuando vuelva a unirse";
		InvalidUser = "Usuario no v\xE1lido";
		GiftYourself = "No puedes regalarte a ti mismo";
		MoveAway = "Mu\xE9vete al menos 75 bloques lejos del punto de aparici\xF3n.";
	};
	Admin = {
		Appeals = "Apelaciones";
		NoPendingAppeals = "Actualmente no hay apelaciones pendientes.";
		Reload = "Recargar";
		LoadingAppeals = "Cargando Apelaciones...";
		SendResponse = "Env\xEDe respuesta";
		EnterResponse = "Ingrese su respuesta a la apelaci\xF3n aqu\xED";
		Deny = "Negar";
		Accept = "Aceptar";
		TempBan = "Prohibido por {1} por \"{2}\"";
		PermBan = "Prohibido permanentemente por \"{1}\"";
		SuperPermBan = "Prohibido s\xFAper permanentemente por \"{1}\"";
		Unban = "Desbaneado por {1}";
	};
	Ban = {
		AccountBan = "Cuenta Baneada";
		Temp = "Has sido baneado temporalmente por {1}!";
		Perm = "Has sido baneado permanentemente por {1}!";
		TimeBanned = "Tiempo Baneado: {1}";
		BanEnds = "Baneo Termina: {1}";
		BanEndsTimer = "Baneo Termina en {1}";
		BanEndsNever = "Baneo termina nunca";
		BanEnded = "Baneo Termino: {1}";
		AppealMessage = "Si desea apelar, cont\xE1ctenos en el siguiente formulario.";
		AppealMessageRubenSim = "Si deseas apelar, contacta con Ruben Sim.";
		AppealSent = "Ha enviado una apelaci\xF3n, nos pondremos en contacto con usted lo antes posible.";
		AppealDenied = "Su apelaci\xF3n ha sido denegada, consulte los mensajes para obtener m\xE1s informaci\xF3n.";
		AppealAccepted = "Tu apelaci\xF3n ha sido aceptada y puedes seguir jugando.";
		Appeal = "Apelaci\xF3n";
		AppealOnce = "Solo puedes apelar una vez";
		AppealTextBox = "Ingrese su apelaci\xF3n aqu\xED y proporcione tantos detalles como sea posible";
		Send = "Enviar";
		ViewMessages = "Ver Mensajes";
		Messages = "Mensajes";
		YouWrote = "Escribiste";
		OtherWrote = "{1} Escribi\xF3";
	};
	Trading = {
		WaitForPeople = "Esperando jugadores para comerciar...";
		WaitForTradeRequests = "Esperando solicitudes de intercambio...";
		WantsToTrade = "{1} quiere intercambiar contigo";
		Accept = "Aceptar";
		Unaccept = "Cancelar aceptaci\xF3n";
		Deny = "Rechazar";
		EnterAmount = "Ingresar cantidad";
		Confirmation = "\xBFEst\xE1s seguro?";
		NoResults = "No se encontraron resultados.";
		TradeDenied = "\xA1{1} rechaz\xF3 el intercambio!";
		Offering = "Ofreciendo {1}";
		Regulations = "Algunos objetos est\xE1n deshabilitados debido a regulaciones locales.";
		NotAcceptedYet = "A\xFAn no aceptado";
		WaitingForAccept = "Aceptado, esperando tu confirmaci\xF3n";
		ProcessingIn = "El intercambio se procesar\xE1 en {1} segundos";
		NoItemsAvailable = "No hay objetos disponibles para este intercambio.";
		NoItemsOffered = "No se ofrecieron objetos.";
		TradeCompleted = "El intercambio se ha completado.";
		TradeFailed = "Ocurri\xF3 un error durante el intercambio.";
		TradeLimit = "{1}/{2} Intercambios";
		TradeLimitReset = "Se reinicia en {1}";
	};
	Accessories = {{{
		Name = "Talism\xE1n Duplici";
		Desc = "El Talism\xE1n Duplici proporciona una {Boost_Dupe} probabilidad extra de obtener un bloque adicional al minar uno.";
	}, {
		Name = "Anillo Duplici";
		Desc = "El Anillo Duplici proporciona una {Boost_Dupe} probabilidad extra de obtener un bloque adicional al minar uno.";
	}, {
		Name = "Reliquia Duplici";
		Desc = "La Reliquia Duplici proporciona una {Boost_Dupe} probabilidad extra de obtener un bloque adicional al minar uno.";
	}, {
		Name = "Herencia Duplici";
		Desc = "La Herencia Duplici proporciona una {Boost_Dupe} probabilidad extra de obtener un bloque adicional al minar uno.";
	}}, {{
		Name = "Anillo Ruber";
		Desc = "El Anillo Ruber proporciona una {Boost_RareExplosion} probabilidad extra de causar una explosi\xF3n de poder 5 al minar un bloque raro.";
	}, {
		Name = "Reliquia Ruber";
		Desc = "La Reliquia Ruber proporciona una {Boost_RareExplosion} probabilidad extra de causar una explosi\xF3n de poder 5 al minar un bloque raro.";
	}, {
		Name = "Herencia Ruber";
		Desc = "La Herencia Ruber proporciona una {Boost_RareExplosion} probabilidad extra de causar una explosi\xF3n de poder 5 al minar un bloque raro.";
	}, {
		Name = "Cronomicon Ruber";
		Desc = "El Cronomicon Ruber proporciona una {Boost_RareExplosion} probabilidad extra de causar una explosi\xF3n de poder 5 al minar un bloque raro.";
	}}, {{
		Name = "Anillo Hucha";
		Desc = "El Anillo Hucha proporciona un impulso extra de {Boost_Cash} al efectivo.";
	}, {
		Name = "Reliquia Hucha";
		Desc = "La Reliquia Hucha proporciona un impulso extra de {Boost_Cash} al efectivo.";
	}, {
		Name = "Herencia Hucha";
		Desc = "La Herencia Hucha proporciona un impulso extra de {Boost_Cash} al efectivo.";
	}, {
		Name = "Cronomicon Hucha";
		Desc = "El Cronomicon Hucha es un accesorio poderoso que proporciona un impulso extra de {Boost_Cash} al efectivo. Y un 5% adicional de impulso al efectivo encima de eso.";
	}, {
		Name = "Alcanc\xEDa Ascendida";
		Desc = "La Alcanc\xEDa Ascendida es un accesorio muy poderoso que proporciona un aumento adicional de {Boost_Cash} al dinero, adem\xE1s de otro 10% adicional.";
	}}, {{
		Name = "Talism\xE1n del Minero";
		Desc = "El Talism\xE1n del Minero es un accesorio b\xE1sico que otorga un aumento de {Boost_Cash} al dinero y {Boost_PickaxePower} al da\xF1o del pico.";
	}, {
		Name = "Anillo del Minero";
		Desc = "El Anillo del Minero otorga un aumento de {Boost_Cash} al dinero y {Boost_PickaxePower} al da\xF1o del pico.";
	}, {
		Name = "Reliquia del Minero";
		Desc = "La Reliquia del Minero otorga un aumento de {Boost_Cash} al dinero y {Boost_PickaxePower} al da\xF1o del pico.";
	}, {
		Name = "Herencia del Minero";
		Desc = "La Herencia del Minero otorga un aumento de {Boost_Cash} al dinero y {Boost_PickaxePower} al da\xF1o del pico.";
	}, {
		Name = "Cronomic\xF3n del Minero";
		Desc = "El Cronomic\xF3n del Minero otorga un aumento de {Boost_Cash} al dinero y {Boost_PickaxePower} al da\xF1o del pico.";
	}, {
		Name = "Mundo del Minero";
		Desc = "El Mundo del Minero otorga un aumento de {Boost_Cash} al dinero y {Boost_PickaxePower} al da\xF1o del pico, adem\xE1s de {Boost_PrestigeTokens} fichas de prestigio y {Boost_MiningSpeed} velocidad de miner\xEDa. Los viernes y fines de semana, el dinero y el da\xF1o se duplican.";
	}}, {{
		Name = "Reliquia de Prisa";
		Desc = "La Reliquia de Prisa es un accesorio que otorga un aumento de {Boost_MiningSpeed} a la velocidad de minado.";
	}, {
		Name = "Herencia de Prisa";
		Desc = "La Herencia de Prisa es un accesorio que otorga un aumento de {Boost_MiningSpeed} a la velocidad de minado.";
	}, {
		Name = "Cronomic\xF3n de Prisa";
		Desc = "El Cronomic\xF3n de Prisa es un poderoso accesorio que aumenta la velocidad de minado en {Boost_MiningSpeed}.";
	}, {
		Name = "Prisa Ascendida";
		Desc = "La Prisa Ascendida es un accesorio muy poderoso que aumenta la velocidad de minado en {Boost_MiningSpeed}.";
	}, {
		Name = "Prisa Eterna";
		Desc = "La Prisa Eterna es un accesorio extremadamente poderoso que aumenta la velocidad de minado en {Boost_MiningSpeed}.";
	}}, {{
		Name = "Artefacto de Velocidad";
		Desc = "El Artefacto de Velocidad aumenta tu velocidad de caminata en {Boost_WalkSpeed} Bloques por Segundo.";
	}}, {{
		Name = "Anillo de Crepitus";
		Desc = "El Anillo de Crepitus es un accesorio que tiene una probabilidad de {Boost_ExtraExplosionRadiusChance} por activaci\xF3n de la Habilidad de Explosi\xF3n para a\xF1adir +1 al radio.";
	}, {
		Name = "Reliquia de Crepitus";
		Desc = "La Reliquia de Crepitus es un accesorio que tiene una probabilidad de {Boost_ExtraExplosionRadiusChance} por activaci\xF3n de la Habilidad de Explosi\xF3n para a\xF1adir +1 al radio.";
	}, {
		Name = "Reliquia Ancestral de Crepitus";
		Desc = "La Reliquia Ancestral de Crepitus es un accesorio que tiene una probabilidad de {Boost_ExtraExplosionRadiusChance} por activaci\xF3n de la Habilidad de Explosi\xF3n para a\xF1adir +1 al radio.";
	}, {
		Name = "Cronomic\xF3n de Crepitus";
		Desc = "El Cronomic\xF3n de Crepitus es un accesorio que tiene una probabilidad de {Boost_ExtraExplosionRadiusChance} por activaci\xF3n de la Habilidad de Explosi\xF3n para a\xF1adir +1 al radio.";
	}, {
		Name = "Crepitus Max";
		Desc = "El Crepitus Max es un accesorio que tiene una probabilidad de {Boost_ExtraExplosionRadiusChance} por activaci\xF3n de la Habilidad de Explosi\xF3n para a\xF1adir +1 al radio.";
	}}, {{
		Name = "Artefacto Fragon";
		Desc = "El Artefacto Fragon crea una explosi\xF3n de potencia 25 cuando se mina un bloque m\xEDtico.";
	}}, {{
		Name = "Anillo Bang";
		Desc = "El Anillo Bang tiene una {Boost_LegendaryExplosion} para crear una explosi\xF3n de poder 17 al minar un Bloque Legendario.";
	}, {
		Name = "Reliquia Bang";
		Desc = "La Reliquia Bang tiene una {Boost_LegendaryExplosion} para crear una explosi\xF3n de poder 17 al minar un Bloque Legendario.";
	}, {
		Name = "Herencia Bang";
		Desc = "La Herencia Bang tiene una {Boost_LegendaryExplosion} para crear una explosi\xF3n de poder 17 al minar un Bloque Legendario.";
	}, {
		Name = "Cronomicon Bang";
		Desc = "El Cronomicon Bang tiene una {Boost_LegendaryExplosion} para crear una explosi\xF3n de poder 20 al minar un Bloque Legendario.";
	}}, {{
		Name = "Talism\xE1n Radar";
		Desc = "El Accesorio Radar te se\xF1ala hacia los minerales cercanos de nivel legendario+ dentro de {Boost_RadarRadius} Bloques.";
	}, {
		Name = "Anillo Radar";
		Desc = "El Accesorio Radar te se\xF1ala hacia los minerales cercanos de nivel legendario+ dentro de {Boost_RadarRadius} Bloques.";
	}, {
		Name = "Reliquia Radar";
		Desc = "El Accesorio Radar te se\xF1ala hacia los minerales cercanos de nivel legendario+ dentro de {Boost_RadarRadius} Bloques.";
	}, {
		Name = "Herencia Radar";
		Desc = "El Accesorio Radar te se\xF1ala hacia los minerales cercanos de nivel legendario+ dentro de {Boost_RadarRadius} Bloques.";
	}, {
		Name = "Cronomicon Radar";
		Desc = "El Accesorio Radar te se\xF1ala hacia los minerales cercanos de nivel legendario+ dentro de {Boost_RadarRadius} Bloques.";
	}}, {{
		Name = "Artefacto Machina";
		Desc = "Este artefacto automatiza tu experiencia de miner\xEDa controlando tu cuerpo seg\xFAn tu voluntad.";
	}, {
		Name = "Machina de Segundo Orden";
		Desc = "Mejora la miner\xEDa autom\xE1tica para extraer minerales Legendarios+ y aumenta tu velocidad de movimiento en un 100%.";
	}, {
		Name = "Machina de Tercer Orden";
		Desc = "Mejora la miner\xEDa autom\xE1tica para minerales Raros+, aumenta tu velocidad de movimiento en un 200% y eleva la eficiencia de la miner\xEDa autom\xE1tica al 60% desde el 50%.";
	}, {
		Name = "Machina del Orden Supremo";
		Desc = "Mejora la miner\xEDa autom\xE1tica para extraer TNT, aumenta su eficiencia al 100% desde el 60%, incrementa tu velocidad de movimiento en un 500% y vende autom\xE1ticamente tu mochila cuando est\xE1 llena hasta tres veces al d\xEDa.";
	}, {
		Name = "Machina Encarnada";
		Desc = "Mejora la miner\xEDa autom\xE1tica para extraer todos los minerales Legendarios+ sin importar la distancia, y minar TNT otorga todos los bloques que explota.";
	}, {
		Name = "Para Toda Eventualidad";
		Desc = "Mejora la miner\xEDa autom\xE1tica para minar instant\xE1neamente todos los minerales desde Poco comunes hasta Et\xE9reos que puedas minar lo suficientemente r\xE1pido, y mina TNT desde el doble de distancia.";
	}}, {{
		Name = "Reliquia Malleus";
		Desc = "La Reliquia Malleus a\xF1ade una probabilidad de {Boost_JackhammerChance} al Jackhammer.";
	}, {
		Name = "Legado Malleus";
		Desc = "El Legado Malleus a\xF1ade una probabilidad de {Boost_JackhammerChance} al Jackhammer.";
	}, {
		Name = "Cronomicon Malleus";
		Desc = "El Cronomicon Malleus a\xF1ade una probabilidad de {Boost_JackhammerChance} al Jackhammer.";
	}, {
		Name = "Malleus Ascendido";
		Desc = "Malleus Ascendido a\xF1ade una probabilidad de {Boost_JackhammerChance} al Jackhammer.";
	}}, {{
		Name = "Legado Exitium";
		Desc = "El Legado Exitium a\xF1ade una probabilidad de {Boost_ExplosionChance} a la Explosi\xF3n.";
	}, {
		Name = "Cronomicon Exitium";
		Desc = "El Cronomicon Exitium a\xF1ade una probabilidad de {Boost_ExplosionChance} a la Explosi\xF3n.";
	}, {
		Name = "Exitium Ascendido";
		Desc = "Exitium Ascendido a\xF1ade una probabilidad de {Boost_ExplosionChance} a la Explosi\xF3n.";
	}}, {{
		Name = "Talism\xE1n Fodienda";
		Desc = "El Talism\xE1n Fodienda aumenta tu Rango de Minado en {Boost_MiningRange} bloques.";
	}, {
		Name = "Anillo Fodienda";
		Desc = "El Anillo Fodienda aumenta tu Rango de Minado en {Boost_MiningRange} bloques.";
	}, {
		Name = "Reliquia Fodienda";
		Desc = "La Reliquia Fodienda aumenta tu Rango de Minado en {Boost_MiningRange} bloques.";
	}, {
		Name = "Herencia Fodienda";
		Desc = "La Herencia Fodienda aumenta tu Rango de Minado en {Boost_MiningRange} bloques.";
	}, {
		Name = "Cronomic\xF3n Fodienda";
		Desc = "El Cronomic\xF3n Fodienda aumenta tu Rango de Minado en {Boost_MiningRange} bloques.";
	}, {
		Name = "Fodienda Ascendida";
		Desc = "La Fodienda Ascendida incrementa tu alcance de miner\xEDa en {Boost_MiningRange} bloques.";
	}}, {{
		Name = "Anillo de Fortuna";
		Desc = "El Anillo de Fortuna aumenta tu suerte en {Boost_Luck}.";
	}, {
		Name = "Reliquia de Fortuna";
		Desc = "La Reliquia de Fortuna aumenta tu suerte en {Boost_Luck}.";
	}, {
		Name = "Herencia de Fortuna";
		Desc = "La Herencia de Fortuna aumenta tu suerte en {Boost_Luck}.";
	}, {
		Name = "Madre Fortuna";
		Desc = "Madre Fortuna aumenta tu suerte en {Boost_Luck}.";
	}}, {{
		Name = "Artefacto Aut\xF3mata Nuclear";
		Desc = "Reduce el enfriamiento de los explosivos en {Boost_ExplosiveCooldownReduction} mientras est\xE1s en l\xEDnea.";
	}}, {{
		Name = "Herencia de Potencia Nuclear";
		Desc = "Aumenta el poder de los explosivos en {Boost_ExplosiveRadius}.";
	}, {
		Name = "Cronomic\xF3n de Potencia Nuclear";
		Desc = "Aumenta el poder de los explosivos en {Boost_ExplosiveRadius}.";
	}}, {{
		Name = "N\xFAcleo Simul – El Final";
		Desc = "Aumenta el poder de los explosivos en {Boost_ExplosiveRadius} y reduce su enfriamiento en {Boost_ExplosiveCooldownReduction} mientras est\xE1s en l\xEDnea. Combina el Artefacto Aut\xF3mata Nuclear y el Cronomic\xF3n de Potencia Nuclear.";
	}}, {{
		Name = "Reliquia de Auctoritas";
		Desc = "La Reliquia de Auctoritas aumenta tus fichas de prestigio en {Boost_PrestigeTokens}.";
	}, {
		Name = "Herencia de Auctoritas";
		Desc = "La Herencia de Auctoritas aumenta tus fichas de prestigio en {Boost_PrestigeTokens}.";
	}, {
		Name = "Cronomic\xF3n de Auctoritas";
		Desc = "El Cronomic\xF3n de Auctoritas aumenta tus fichas de prestigio en {Boost_PrestigeTokens}.";
	}, {
		Name = "Auctoritas Trascendido";
		Desc = "Auctoritas Trascendido aumenta tus fichas de prestigio en {Boost_PrestigeTokens}.";
	}}, {{
		Name = "Artefacto Vulnus del Mineral";
		Desc = "Este accesorio mina todos los minerales adyacentes al bloque minado si puedes minarlos lo suficientemente r\xE1pido.";
	}}, {{
		Name = "Anillo Sinum";
		Desc = longstring1;
	}, {
		Name = "Reliquia Sinum";
		Desc = longstring1;
	}}, {{
		Name = "Artefacto Ruptis";
		Desc = "Con el Artefacto Ruptis, las explosiones causadas por minerales Et\xE9reos+ te otorgan todos los bloques que destruyen.";
	}}, {{
		Name = "Mobilitas Ultima";
		Desc = "Minar un mineral Raro provoca una explosi\xF3n de poder 6, uno Legendario provoca una explosi\xF3n de poder 20 y uno M\xEDtico una explosi\xF3n de poder 33. Obtienes todos los bloques explotados por minerales Et\xE9reos+ y minar Esmeraldas provoca una explosi\xF3n de poder 17. Este accesorio combina el Ruber Chronomicon, el Fragon Artifact, el Bang Chronomicon y el Ruptis Artifact.";
	}}, {{
		Name = "Talism\xE1n Magicae";
		Desc = "Este accesorio otorga {Boost_LocalMagicPower} m\xE1s Poder M\xE1gico que los accesorios habituales de esta rareza.";
	}, {
		Name = "Anillo Magicae";
		Desc = "Este accesorio otorga {Boost_LocalMagicPower} m\xE1s Poder M\xE1gico que los accesorios habituales de esta rareza.";
	}, {
		Name = "Reliquia Magicae";
		Desc = "Este accesorio otorga {Boost_LocalMagicPower} m\xE1s Poder M\xE1gico que los accesorios habituales de esta rareza.";
	}, {
		Name = "Reliquia Ancestral Magicae";
		Desc = "Este accesorio otorga {Boost_LocalMagicPower} m\xE1s Poder M\xE1gico que los accesorios habituales de esta rareza.";
	}, {
		Name = "Chronomicon Magicae";
		Desc = "Este accesorio otorga {Boost_LocalMagicPower} m\xE1s Poder M\xE1gico que los accesorios habituales de esta rareza.";
	}}};
	Blocks = {"Tierra", "Arena", "Cieno", "Arcilla", "Marga", "Turba", "Tiza", "Compost", "Grava", "Entisoles", "Aridisoles", "Inceptisoles", "Gelisoles", "Jermanite", "Tierra Compacta", "Ra\xEDces", "Hongo", "Champi\xF1\xF3n", "Patatas", "Remolacha", "Chiriv\xEDas", "Jengibre", "C\xFArcuma", "T\xFAnel De La Ardilla Terrestre", "Rata Topo", "Mollisoles", "Cer\xE1mica Rota", "C\xE1psula del tiempo", "Barro Compacto", "Barro Compactado", "Barro Deposital de Agua", "Barro Vegetal", "Rueda", "Ciudad de Barro", "Barro Sucio", "Esqueleto", "Tesoro", "Barro Alien\xEDgena", "Nokia", "Residuos Nucleares", "Dep\xF3sito de Petr\xF3leo", "Aceite de Motor", "Barro Prehist\xF3rico", "Tierra Densa", "Ajo", "R\xE1bano", "Yuca", "J\xEDcama", "Hormigas", "Bichos", "Grillos De Jerusal\xE9n", "Milpi\xE9s", "Comej\xE9n", "Armas Rotas", "Monedas Antiguas", "Puntas De Flecha", "Huesos", "Artefacto Antiguo", "Barro", "Suelo Herb\xE1ceo", "Suelo Hongueado", "Suelo Labrado", "Suelo Enraizado En Plantas", "Suelo Infectado", "Suelo Receptor Del Sol", "Tierra Enraizada En \xC1rboles", "Basura Del Suelo Infectado", "Mega Tierra", "Suelo Anidado En Ara\xF1as", "Suelo De Pato De Goma", "Suelo De Papel", "Suelo Empaquetado", "Piedra", "Pedernal", "Coquina", "Dolomita", "Travertin", "Toba", "Oolita", "Brecca", "Conglomerado", "Caliche", "Arenisca", "Siltstone", "Diatomita", "Halita", "Cristal", "Hierba Profunda", "Hierba Muerta", "Hierba Mojada", "Hierba F\xE9rtil", "Hierba Irregular", "Hierba Congelada", "Hierba Agrietada", "Hierba Falsa", "Hierba Enraizada", "Hierba Sembrada", "Hierba Alien\xEDgena", "Hierba De La Luna", "Hierba Con Gusano", "Hierba Tocada", "Cr\xE1ter", "Piedra Compacta", "M\xE1rmol", "Novaculita", "Cuarcita", "Skarn", "Gneis", "Anfibolita", "Hornfels", "Pizarra", "Esquisto", "Phyllita", "Esteatita", "Antracita", "Mariposita", "Verdite", "Lapisl\xE1zuli", "Hierba", "Festuca", "Moneywort", "Hierba Quack", "Hierba De Ganso", "Parche De Hierba", "Hierba Dallis", "Cola De Caballo", "Blanco Italiano", "Malva", "Hierba Bruja", "Speedwell", "Planta Joven", "Milenrama", "Dientes De Le\xF3n", "Tr\xE9boles de cuatro hojas", "Piedra Densa", "Diorita", "Andesita", "Riolita", "Granito", "Pegmatita", "Gabro", "Diabase", "Basalto", "Plagioclasa", "Diacite", "Stealth Copper", "Toba", "Bastneasita", "\xD3palo De Fuego", "Cielo", "Nube Blanca", "Nube Gris Claro", "Nube Gris Oscuro", "Avi\xF3n", "Cometa", "P\xE1jaro", "Jet Privado", "Globo Meteorol\xF3gico", "Helic\xF3ptero", "Dirigible", "Helic\xF3ptero Militar", "Tormenta El\xE9ctrica", "Tornado", "Volc\xE1n", "Obsidiana", "Salaxum", "Baxerita", "Suprecerese", "Salaxum Vehicular", "Deconogaron", "Bauxita", "Scriolin", "Peragomita", "Obsidiana Mu\xF3sica", "Lascero Lamenta", "Obsidiana Arco Iris", "Xenotime", "Monacita", "Cielo Alto", "Estelas De Chorro", "Rayos Del Sol", "Nubes Delgada", "Drone", "Mega Nube", "Atm\xF3sfera Brumosa", "Falling Space Junk", "Eclipse Solar", "Cohete", "OVNI", "Aurora Boreal", "Nubes Resplandecientes", "Firmamento", "Obsidiana Fundida", "Silia", "Peragomita", "Flamespawn", "Shimical\xE1", "Graeconogaron", "Geris", "Pirromomita", "Dotorita", "Centroolor", "Vapor\xE9ster", "Blazestone", "Terracita", "Magmaium", "Espacio", "Estrella Roja", "Estrella Naranja", "El Sol", "Meteoro", "Asteroide", "Luna", "Planeta Enano", "Sat\xE9lite", "Planeta", "Cometa", "Anillo Del Planeta", "La ISS", "Oumuamua", "Lava", "Basalto Reforzado", "Escoria", "Piedra P\xF3mez", "Lava S\xF3lida", "Divenestium", "Stellan", "Byrrzome", "Xapotote", "Gnixon", "Polonita", "Coraz\xF3n de Fuego", "Sol Incrustado", "Infierno", "Piedra Radiactiva", "Uranio", "Uraniuuria", "Gamite", "Moptazik", "Parecio", "Limioactivo", "Ratiteium", "Zoniumita", "Whihite", "Adsimite", "Prenium", "Legenium", "Limonion", "Obsidiana T\xF3xica", "Roca Triturada", "Residuos de Petr\xF3leo", "N\xFAcleo Endurecido", "Huesos Agrietados", "Cubo Artificial", "Residuos Agrietados", "Prehistoric Bot Remnant", "Fragmentos de Lava", "Escombros Fundidos", "Berilo Rojo", "Painita", "Herramienta Antigua", "Cristal Solar", "Residuos Hiperpresurizados", "Residuos de Heladas", "Lava T\xF3xica", "Lava de Sol", "Lava de Timlo\xEDn", "Lava de Himlo\xEDn", "Lava Negra", "Tomicidad Lava", "Lava De La Humanidad", "Gaminyity Lava", "Toxicidad Lava", "Bluenity Lava", "Mapicle Lava", "Lava De La Muerte", "Toxim Lava", "Lava Volc\xE1nica", "Deathen Lava", "Lava Hirviendo", "Aluminio", "Fulocite", "Telbar", "Mercurio", "Phigarium", "Rizufide", "Jagdite", "Yulacita", "Vaxium", "Farlicin", "Derilium", "Birucita", "Sacreoxyn", "Wasecraesiel", "El Cristal de Leviat\xE1n", "N\xFAcleo Externo", "Riljud", "Carzyum", "Selorus", "Foxrophine", "Incindirum", "Ectoplasma", "Azafr\xE1n", "Subsinita", "Aluhargium", "Parchium", "Zanforn-88", "Tarrulum", "K4R-UL-1UM", "Jyrulphasion", "ELEMENTO TON-618", "N\xFAcleo Medio", "Soultriek", "Rejewel", "Jokerium", "Hidr\xF3geno Impuro", "Darnita", "Aethernum", "Macabrium", "Aunolita", "Fernokajin", "Netherita", "N\xEDquel Apretado", "Aleaci\xF3n Extra\xF1a", "Lamenta Enjoyada", "Torio de Cobalto G", "Fingerite Remnants", "N\xFAcleo Interno", "Mineral de Hierro Resplandeciente", "Oxygenanium", "Mineral de Plata Resplandeciente", "Hidr\xF3geno Comprimido", "Lavanium", "Meltor", "Glimmerium", "Graino", "Roca Primorial", "Ceniza Volc\xE1nica Resplandeciente", "Magmorthum", "Normalium", "Mineral de Aleaci\xF3n", "La Central", "Plasma Imposible", "Espacio Profundo", "Materia Oscura", "Agujero Negro", "Remanente del Planeta", "Galaxia", "Remanente de Estrellas", "Arcano", "Estrella de Neutrones", "\xD3palo Gal\xE1ctico", "Metelum", "Objeto Civilizado P\xEDcaro", "Skrep", "Cometa Verde", "Litorp", "Mota Microesf\xF3bica", "Enana Negra", "Agujero Blanco", "Cuasi-estrella", "Piedra Lunar", "Lunario", "Cristales de Luna", "Mineral de Selene", "Lunarita", "Cristal de polvo de estrellas", "Cuarzo Celeste", "Mineral Lunaris", "Astralium", "Alma Lunar", "Amatista lunar", "Esencia de lunarita", "Mena de llama lunar", "Cristal de Sombra Lunar", "Lunarisio", "Esencia de la Luna Solar", "Estrella de la Muerte", "Cintur\xF3n de Asteroides", "Trozo de Basalto", "Mineral de Celestium", "Pepita de N\xEDquel", "Meteoroide", "Veta de Cobalto", "Fragmento de Platino", "C\xFAmulo de Iridio", "Gema de Meteorito", "Cristal de Xen\xF3n", "Cristal del Vac\xEDo", "Gravitonio", "N\xFAcleo C\xF3smico", "Rub\xED Estelar", "Piedra de la Singularidad", "Paisaje", "Concentrador Atmosf\xE9rico", "Arenas del Tiempo", "Neutronio Puro Hipercomprimido", "N\xFAcleo de Plasma", "Mina Subespacial", "Cronos", "Muchos Cielos Nocturnos", "Cromalita", "Trueno", "Seraf\xEDn", "Lavaspita", "Vidrio de Drag\xF3n", "Piedra del Vac\xEDo", "Zycrita", "Draconio", "Diamantes Escarchados", "Odio Ardiente", "Wijkuled", "Gustavon", "Fragmento Fundido", "Vidrio Llameante", "Prisi\xF3n del Infierno", "Fuego Astral", "Rohoccaim", "Pirita", "Piedra del Sol", "Memoria Ardiente", "Rub\xED Fundido Roto", "Distorsi\xF3n", "Radio", "Oganes\xF3n", "Kryptonita", "Ewudojjed", "Tel\xE9fono M\xF3vil", "Circuito", "Actinio", "Plutonio", "Torio", "Cristal de Cherenkov", "Estacionario", "Hexafluoruro de Uranio", "Plasma", "Arena de Almas", "Zefendita", "Ignisaxum", "Escarcha \xC1rtica", "Hierro Gaseoso", "Piedra Florida Espinosa", "Ara\xF1a de Fuego", "Ulewuthaim", "Estrella Ca\xEDda", "Kyawthuita", "Uru", "Koiksxolaim", "Arras", "Anomal\xEDa", "Sobrecarga de Color", "C\xFApula", "Cristal de Aetherium", "Mineral Bendecido", "Celestium", "Diablo Encadenado", "Calcular Datacrite Binario", "Esperanza Fugaz Final", "Galaxium", "Eternium", "Genesium", "Espada en Escala de Grises y las Estrellas", "Prisma de Lavaxita", "Fuego de Plasma", "Anclaje Waterium", "TURMOILED", "Toerium", "Thefaimnilnilnil", "N\xFAcleo del Tesseract", "Nocturnis", "Energ\xEDa Antigua", "Entidad Ardiente", "Cometium", "Cero", "Gideon", "Piedra Lineal", "Trianglium", "Squarite", "Circlite", "Kiteanium", "Ovalium", "Trapezide", "Octagonium", "Pentagrium", "Hexagrite", "Crosilite", "Loveilite", "Snowtanium", "Cindrillium", "Wedgilite", "Spherite", "Pi Circumferencium", "Starlite", "Trishatterite", "N\xFAcleo Geometrilekenic", "N-Gon", "Eclipsera", "Iridanyta", "Starsearita", "Gravonyx", "Solenita", "Eclipseron", "Chatarrapyx", "Noctyrita", "Cosmaril", "Umbryx", "Astralita", "Aetherion", "Aeronyx", "Nimbryl", "Mineral de Solarium", "Zefirosita", "Tempestralita", "Estratonio", "Brisium", "Ventryx", "Voltacita", "Celestara", "Skynexium", "Verdanyta", "Floracita", "Elarion", "Sylvanyth", "Xilogranito", "Ambryth", "Druanita", "Terravina", "Gaialita", "Arcillitio", "Loamyx", "Sedryx", "Rubrath", "Shalorita", "Terralita", "Piedra de Myr", "Tinarita", "Geodyna", "Aurivina", "Terracron", "Gravellium", "Ferronyx", "Crimora", "Amarion", "Compaxita", "Bronzio", "Slathem", "Rubrasyta", "\xD3palo de Obryx", "Obdurio", "Argenyx", "Onythera", "Rubraxis", "Noctyra", "Umbrosita", "Plumbryn", "Malacitea", "Zafiros", "Draconyx", "Lityrio", "Zyntherio", "Topazryn", "Hemovyr", "Volcarion", "Tungryth", "Jadyx", "Garnyros", "Nihytrita", "Chasmita", "Volcrys", "Obrythita", "Pyrelita", "Ignarion", "Magmoryx", "Cristal de Flare", "Radionyx", "Uvyrita", "Venomyth", "Corrosyta", "Scaldyrium", "Corethium", "Magnita", "Pirotista", "Infernox", "Ignirion", "Deephyros", "Solaryx", "Magmyra", "Acero de los Eones", "Nixium", "Nebryx", "Cosmyth", "Lunarisita", "Selestium", "Celestina", "Rectita", "Calcynita", "Piedra de Venus", "Sulvaris", "Cuarzo floreciente", "Venita", "Vidrio quemado", "Erosina", "Mineral de veta de \xE1mbar", "Perla de Fumarita", "Orixio Veneriano", "Aureola carmes\xED", "Valenita", "Piedra de flor ceniza", "Shythereon", "Vapora dorada", "Vidrio ser\xE1fico", "Venaluz", "Fragmento de llama \xE1urica", "Gema de Eclipsera", "Solenvy", "Aureola espinada", "Veta astral", "Tartario", "Piedra de Mercurio", "Ferrita", "Goethe ceniciento", "Mercyrosita", "Basalto quemado", "Eminescu", "Mineral de Cindermark", "Volcaryn", "Cr\xE1ter Abedin", "Acero de llamas", "Radiolita", "Veta de Ignilita", "Auralita", "Vidrio de fuego solar", "Cuenca de Caloris", "Coronathio", "Vulcanita Prime", "Cuenca de Rembrandt", "Heliarchita", "Tolstoy", "N\xFAcleo Reinhardt", "Stilbon", "Superficie solar", "Protuberancia", "Vidrio de brasa", "Ceniza solar", "Agujero coronal", "Fotosfera", "Cromosfera", "Fotonyx", "Veta de termita", "Cuarzo del velo solar", "Fragmento de Ignis", "Polvo de Helios", "Piedra del n\xFAcleo Solaris", "Gema de luz ceniza", "Aleaci\xF3n Auriflama", "Promete\xF3n", "Solinio radiante", "Pirita de Aurora", "Corona del Alba", "Prisma infernal", "Llamarada", "Llama solar eterna", "El Silencio de Beethoven", "All\xE1 atr\xE1s, Benjam\xEDn", "110011 1010010 1010010 110000 1010010 101110 110100 110000 110100", "C\xFAasar Prism\xE1tico", "Envuelto en Sufrimiento", "El descenso de Jacob a la Eternidad", "ΒΞDRΩCK", "fαтє", "El destino marcha como cualquier hombre", "La Pata del E̶͐́l̸̆̊ė̷͙p̷͒̍h̷͂͝ǎ̴̿n̶̛t", "αи∂яσмє∂α", "Abismo Monocrita", "Mira m\xE1s all\xE1 de la   ̶C̶U̶R̶T̶A̶I̶N̶  del Infierno", "你聽到了嗎？？？？？？？？？", "El Dios S\xF3lido de las Matem\xE1ticas Geom\xE9tricas", "Vena de Estallido Solar", "Divinidad Pura", "Plano Alterno", "TUDOL", "N\xFAcleo Solar", "Hidr\xF3geno Subsuperficial", "Coregrit", "Escoria Solar", "Hidr\xF3geno de Quadium", "Tacoclina", "Vidrio de Helion", "Plasmirum", "Irradita", "Fotovita", "Helicorita", "Hueso Estelar", "Aleaci\xF3n Infernita", "Solatrix", "Cristal Luminforge", "Coronaith", "Vermion", "Gema de Alma \xCDgnea", "Estellarium", "Gemisis", "Coraz\xF3n Solar", "Objetos Dimensionales", "Ultim\xE1tum", "Sanctarita Pura", "Hsixia", "TERRARVM", "Odisea", "Hecho en el Cielo", "Ira de Ballic", "Φοβος", "Apocrypha", "Marca suprarracional", "Fasaria", "→ Aurora ⇋ El ⇋ Final ←", "《『R』『E』『V』『E』『L』『A』『T』『I』『O』『N』》", "Ex Machina Pen\xFAltimo", "『Ｉｎｄｅｘ』『Ｄｅｉ』『ｌａｔｅｎ』", "Piedra de Marte", "Roca Oxidada", "Mineral Ligado al Polvo", "Piedra Roja", "Gravellita", "Ferrinita", "Placa de Ceniza", "Terraclina", "Oxidulita", "Vidrio Marciano", "Aleaci\xF3n Carmes\xED", "N\xFAcleo de Roubion", "Volcarita", "Sangrelita", "Cristal de Sombra de Hierro", "Piedra del Alma Marciana", "Titanita Forjada en Polvo", "Rub\xED del Terremoto Rojo", "N\xFAcleo de Ares", "Cubo Bermell\xF3n", "Agua Boreal", "Serafita de Deimos", "Fobos", "JeremyDevs", "『Ｏｎｃｅ』『Ｂｙ』『Ｈｕｍａｎ』", "Gas de J\xFApiter", "Hidr\xF3geno Presurizado", "Roca de J\xFApiter", "Hidr\xF3geno Met\xE1lico", "Tormenta Atrapada", "Niebla de Presi\xF3n", "Hidr\xF3geno Ionizado", "Amon\xEDaco Cargado", "Pluma de Aurora", "Vapor Cicl\xF3nico", "Oleada Met\xE1nica", "Sonda Estrellada", "Esencia Joviana", "Estaci\xF3n de J\xFApiter", "Plasma de Tormenta", "Vapor de la Gran Mancha Roja", "Grandes Auroras", "Europa", "Dominio de Zeus", "Convergencia", "Encantamiento", "Sat\xE9lites C\xF3smicos", "Athanatos", "Gas de Saturno", "Deriva de Helio", "Anillos Fr\xEDos", "Bruma Dorada", "Nacido del Anillo", "Amon\xEDaco Congelado", "Niebla Criog\xE9nica", "Roca del Anillo Exterior", "Seda de Presi\xF3n", "Nube de Tormenta Anular", "Velo de Metano", "Karma y Tiempo", "Esencia de Luz Anular", "Kronos", "Tempestad Silenciosa", "Nube Coronada de Saturno", "Chorro Dorado", "Mineral de David", "Estrella de Remphan", "Atm\xF3s Antiguo", "Densidad Monocrom\xE1tica", "Cables Policromos", "N\xFAcleo Titanos", "Artilugio", "Blindaje de Chatarra", "Cableado de Hierro", "Aleaci\xF3n Oxidada", "Piedra de Engranaje", "Mineral de Circuito", "Red de Acero", "Conducto de Pulso", "Mechasil", "Cristal L\xF3gico", "N\xFAcleo Servo", "Aleaci\xF3n Binaria", "Matriz Neural", "Engranaje Crono", "Piedra del Alma Sint\xE9tica", "Fragmento de Motor Planetario", "Aleaci\xF3n Omnicore", "Coraz\xF3n de Acero Machina", "Deus Mechanica", "Procesador de Singularidad", "Motor Axiom\xE1tico", "Prisma Ghostcode", "La Directiva Primaria", "Gas de Urano", "Metano P\xE1lido", "Vapor Escarchado", "Deriva Nubosa", "Niebla Glacial", "Remolino Helado", "Velo Criog\xE9nico", "Bruma Azul", "Flujo Inclinado", "Escalofr\xEDo Polar", "Velo de Escarcha Met\xE1nica", "Chorro Congelado", "Corriente Aurora", "Viento de Escarcha Brillante", "Cicl\xF3n Silencioso", "Brisa Tit\xE1nica", "Espiral Et\xE9rea", "Halo Congelado", "Fr\xEDo Celestial", "Bloqueo Glacial Primordial", "Eteralidad", "Niebla de \xC9ter", "N\xFAcleo de Urano", "『Dʏꜱꜰᴜɴᴄᴛɪᴏɴᴀʟ』『Aʙᴇʀʀᴀᴛɪᴏɴ』", -- : First try: K:0: attempt to index nil with 't'
;
	Explosives = {"Dinamita", "Bomba", "C4", "TNT", "Misil", "arma nuclear", "Bomba Zar", "Bomba de neutrones", "Bomba de antimateria"};
	Leaderboards = {"M\xE1s efectivo", "La mayor\xEDa de los bloques minados", "M\xE1s tiempo jugado", "La mayor\xEDa de los bloques descubiertos", "La mayor\xEDa de los prestigios", "Fichas de mayor prestigio", "M\xE1s Robux gastados"};
	Gamepasses = {
		x2Cash = "2x Efectivo";
		x2CashDesc = "Duplica todos tus ingresos en efectivo";
		x2Emerald = "2x Esmeralda";
		x2EmeraldDesc = "Duplica las esmeraldas que obtienes de un mineral esmeralda";
		SharperPickaxes = "Pico m\xE1s afilado";
		SharperPickaxesDesc = "Todos los picos ser\xE1n un 10 % m\xE1s potentes";
		x2PickaxePower = "2x Poder de pico";
		x2PickaxePowerDesc = "Duplica el poder de todos los picos";
		x2MiningSpeed = "Velocidad de miner\xEDa x2";
		x2MiningSpeedDesc = "Duplica tu velocidad de miner\xEDa";
		x2Storage = "2x Almacenamiento";
		x2StorageDesc = "Duplica el almacenamiento de tu mochila";
		InfiniteBackpack = "Mochila infinita";
		InfiniteBackpackDesc = "Tu Mochila de Almacenamiento ser\xE1 Infinita";
		Teletransportador = "Teletransportador";
		TeleporterDesc = "Te da un teletransportador que puedes colocar en cualquier lugar y teletransportarte en cualquier momento. Adem\xE1s, hace que todos los teletransportes del Lobby sean gratuitos";
		VIP = "VIP";
		VIPDesc = "Desbloquear\xE1s un pico exclusivo VIP, una mochila y una etiqueta de chat. Adem\xE1s, obtendr\xE1s m\xE1s esmeraldas con las compras";
		x2Velocidad = "x2Velocidad";
		x2SpeedDesc = "Te permite caminar 2 veces m\xE1s r\xE1pido de lo habitual";
		x2Jump = "2x Salto";
		x2JumpDesc = "Te permite saltar 2 veces m\xE1s alto de lo habitual";
		Jetpack = "Jetpack";
		JetpackDesc = "Desbloquea el jetpack que te permite volar";
		MoreRange = "M\xE1s Alcance";
		MoreRangeDesc = "Aumenta el alcance de miner\xEDa en +5 bloques";
	};
	Quests = {"M\xEDo {1} {2}", "M\xEDa {1} {2} bloques", "M\xEDa {1} bloques", "Mina {1} minerales", "Excavar a {1} profundidad", "Equipar pico #{1} o mejor", "Equipar Mochila #{1} o mejor", "Usar {1} explosivo"};
	TranslatorSettings = {
		Locale = "es";
		Seperator = ',';
		Decimal = '.';
		TimeAbbreviations = {'s', 'm', 'h', 'd', 'y'};
		Translator = 2576598927;
	};
}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Translator.turkish
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:01
-- Luau version 6, Types version 3
-- Time taken: 0.048105 seconds

local longstring1 = "Bu aksesuar \xE7anta kapasiteni {Boost_BackpackSpace} artırır ve aynı nadirlikteki normal aksesuarlara kıyasla {Boost_LocalMagicPower} daha fazla B\xFCy\xFC G\xFCc\xFC verir."
return {
	Main = {
		Cash = "Para";
		BlockCount = "{1}/{2} Blok";
		BlockCountUnlimited = "{1} Blok";
		EnableJetpack = "Jetpack Etkinleştir";
		DisableJetpack = "Jetpack Devre Dışı Bırak";
		ToSurface = "Y\xFCzeye";
		Backpack = "\xC7anta";
		Index = "İndeks";
		Settings = "Ayarlar";
		ReloadChunks = "Par\xE7aları Yeniden Y\xFCkle";
		Placing = "{1} Yerleştir";
		Unbreakable = "Kırılmaz";
		BackToMining = "Madenciliğe Geri D\xF6n";
		SearchBlocks = "Blokları Ara...";
		Place = "Koy";
		Lock = "Kilit";
		Unlock = "Kilidi A\xE7";
		BackpackFull = "\xC7anta Dolu";
		BackpackFullMessage = "\xC7antanızı tamamen doldurdunuz ve sırt \xE7antanızı satana, blokları yerleştirme veya y\xFCkseltene kadar madencilik yapamazsınız.";
		Sell = "Sat";
		Upgrade = "Y\xFCkselt";
		BlocksDiscovered = "{1}/{2} Blok Bulundu (+%{3} Nakit)";
		IndexLayer = "{1} | {2} - {3}";
		IndexLayerNoUp = "{1} | {2} ve \xFCzeri";
		IndexLayerNoDown = "{1} | {2} ve aşağısı";
		BaseValue = "Temel Değer: <font color=\"#00FF00\">${1}</font>";
		CurrentValue = "Ge\xE7erli Değer: <font color=\"#00FF00\">${1}</font>";
		Durability = "Dayanıklık";
		Rarity = "Nadir";
		ProbabilityToSpawn = "Doğma Olasılığı: {1} Blokta 1";
		IndexCredit = "Engellemek g\xF6re";
		Loading = "Y\xFCkleniyor";
		TotalMined = "Total Mined";
		Back = "Geri";
		On = "A\xE7";
		Off = "Kapat";
		TimePlayed = "Oynama S\xFCresi";
		Blocks = "Bloklar";
		Shop = "D\xFCkkan";
		ComingSoon = "Yakında...";
		Buy = "Satın Al";
		Bought = "Satın alındı";
		Max = "Maks";
		Gift = "Hediye";
		Gamepasses = "Gamepasses";
		Owned = "Sahipli";
		OwnedByRecipient = "Alıcı Sahibi";
		StopGift = "Hediye Vermeyi Durdur";
		NoGifts = "Şu anda bu sunucuda hediye edilecek kimse yok.";
		EnterUsername = "Kullanıcı adını buraya girin";
		Emeralds = "Z\xFCmr\xFCt";
		MostPopular = "EN POP\xDCLER";
		BestOffer = "EN İYİ TEKLİF";
		TeleportRequest = "Işınlanma İsteği";
		TeleportRequestMessage = "Arkadaşınız {1} yardım istedi, ona ulaşmak ister misiniz?";
		No = "Hayır";
		Yes = "Evet";
		Upgrades = "Y\xFCkseltmeler";
		Pickaxes = "Kazmalar";
		Backpacks = "\xC7antalar";
		Close = "Kapat";
		Equip = "Donat";
		Equipped = "Donanımlı";
		BuyWithCash = "Satın Al (${1})";
		Power = "G\xFC\xE7";
		Storage = "Deop";
		Prestige = "Prestij";
		Prestiges = "Prestijler: {1}";
		PrestigeCashBoost = "Nakit Artışı: {1} → {2}";
		PrestigeWithCash = "Prestij (${1})";
		UpgradeWithEmerald = "Y\xFCkselt ({1} Z\xFCmr\xFCt)";
		LobbyTeleport = "Lobby Teleport";
		LobbyAt = "Lobi Derinliği {1}";
		Teleport = "Işınlanma";
		UnlockFreeTeleports = "\xDCcretsiz Işınlanmaların Kilidini A\xE7ın";
		PrestigeTokens = "Prestij Jetonları";
		Quests = "G\xF6revler";
		QuestDisplay = "{1}/{2} (%{3})";
		Completed = "Tamamlandı";
		GroupBonus = "%50 daha fazla para i\xE7in Jeremy Studio'ya katılın ve oyunu beğenin!";
		Tutoriel = "Tutorial";
		TutorialText = "Hoş geldiniz! Madenciliği başlatmak i\xE7in keşfedilecek bir\xE7ok blok var, madencilik yapmak istediğiniz herhangi bir bloğa tıklayın veya basılı tutun. Her blok satıldığında farklı miktarda nakit verir, ancak yalnızca sınırlı miktarda nakit taşıyabilirsiniz. Hepsi kirin \xFCst\xFCnde ve altında farklı cevherler i\xE7eren bir\xE7ok farklı blok katmanı vardır.";
		Ok = "Tamam";
		Luck = "Şans";
		Jackhammer = "Kazma Makinesi";
		TooWeak = "\xC7ok zayıf";
		Explosion = "Patlama";
		Jump = "Zıplama";
		Pickaxe = "Kazma";
		Speed = "Hız";
		LikeTheGame = "OYUNU BEĞEN";
		ForRewards = "\xD6D\xDCLLER İ\xC7İN!";
		Range = "Menzil";
		Crafting = "\xDCretim";
		MetaGain = "Harcanan Robux başına daha fazla Meta kazan. Mevcut Meta kazancı: {1} → {2} Meta/blok";
		Meta = "Meta";
		MetaUnlock = "{1} karşılığında a\xE7";
		Level = "Seviye";
		Levels = "Seviyeler";
		EmeraldUpgrades = "Z\xFCmr\xFCt Y\xFCkseltmeleri";
		AFKMessage = "AFK kaldığın i\xE7in atılmaman adına her 17 dakikada bir otomatik olarak yeniden bağlanacaksın.";
		FriendMultiMessage = "Kazma g\xFCc\xFCn\xFC artırmak i\xE7in arkadaşlarını davet et!";
		NoFriendsHere = "Burada hi\xE7 arkadaş yok. Sunucudaki her arkadaş i\xE7in %10 daha fazla kazma g\xFCc\xFC kazanırsın!";
		FriendMulti = "Mevcut Arkadaş \xC7arpanı:\n+{1}% Kazma G\xFCc\xFC";
		Auto = "Otomatik";
		Pinned = "Sabit";
		Unequip = "\xC7ıkart";
		Pin = "Sabit Yap";
		Unpin = "Sabitliği Kaldır";
		MaxPins = "Maksimum Sabitleme";
		MagicPowerInfo = "Sihirli g\xFC\xE7, şu anda taktığınız aksesuarlar tarafından verilir. \xC7eşitli şekillerde sizi g\xFC\xE7lendirir.";
		Craft = "\xDCret";
		CraftNotification = "Şimdi {1} \xFCretebilirsiniz!";
		PrestigeNotification = "Artık Prestij yapabilirsiniz!";
		NoReset = "Sıfırlama Yok";
		Sacrifice = "Fedakarlık";
		SacrificeMessage = "Fedakarlık, Prestij’in sıfırladığı şeylerin aynısını sıfırlar, ancak bunu para gereksinimini karşılamadan saatte bir kez yapabilirsiniz! Bu Fedakarlıkta {1} Prestij Tokeni alacaksınız.";
		Wait = "Bekle";
		ArchivedBlocks = "Arşivlenmiş Bloklar";
		CraftingRecommendation = "\xD6ncelikle {1} \xFCretmeniz şiddetle tavsiye edilir!";
		DisableFastFall = "Hızlı D\xFCş\xFCş devre dışı bırakılsın mı?";
		Claim = "Talep Et";
		Showcase = "Vitrin";
		TotalValue = "Toplam Değer";
		YourPlacement = "Sıralaman";
		Top100 = "İlk 100";
		Or = "VEYA";
		MetaUnlockProgress = "{1}/{2} Harcandı";
		PrestigeMessageFree = "Prestige ile paranı Prestige Jetonlarına ve Para Artışına d\xF6n\xFCşt\xFCrebilirsin.";
		PrestigeMessageFreeTokens = "Prestige ile paranı {1} Prestige Jetonuna ve Para Artışına d\xF6n\xFCşt\xFCrebilirsin.";
		PrestigeMessageFreeDaily = "Prestige kazmalarını, \xE7antalarını, paranı ve bloklarını sıfırlar ancak Para Artışı ve {1} Prestige Jetonu verir, eğer {2} beklersen yalnızca paran sıfırlanır.";
		BuyAll = "Hepsini Satın Al";
		Cooldown = "Bekleme S\xFCresi";
		IndexSecretLayer = "Gizli | Her Yerde";
		BlockRewards = "Cevherleri beğendin mi? Mitik seviyesine kadar olan her cevher i\xE7in 750 Z\xFCmr\xFCt veya oyuna eklenen her Ethereal+ cevher i\xE7in 3.000 Z\xFCmr\xFCt kazanabilirsin. Cevherlerini oyun a\xE7ıklamasında bulunan Discord sunucusunda paylaş.";
		LeaderboardProgress = "İlk {1} i\xE7indesin";
		BlockTagged = "Blok {1} tarafından kazıldı";
		Trading = "Ticaret";
		LagMessage = "Eğer kasma yaşıyorsan, ayarlar men\xFCs\xFCnden render mesafesini d\xFCş\xFCrmen \xF6nerilir.";
		TutorialText2 = "Hoş geldin! Madenciliğe başlamak i\xE7in herhangi bir bloğa basılı tut. Daha nadir bloklar daha fazla para eder. Toprağın \xFCst\xFCnde ve altında \xE7ok daha değerli bloklara sahip bir\xE7ok farklı katman bulunur. Lobilerinin kendine \xF6zg\xFC y\xFCkseltmeleri vardır.";
		TutorialText3 = "Hoş geldin! Madenciliğe başlamak i\xE7in herhangi bir bloğa basılı tut. Daha nadir bloklar daha fazla para eder. Toprağın \xFCst\xFCnde ve altında \xE7ok daha değerli bloklara sahip bir\xE7ok farklı katman bulunur. Lobilerinin kendine \xF6zg\xFC y\xFCkseltmeleri vardır. Yeterince oynarsan saniyede 2.000 blok kazabilirsin!";
		Undiscovered = "Keşfedilmedi";
		PrestigeMessage = "Prestij, Kazmalarını, Sırt \xC7antalarını, Paranı ve Bloklarını sıfırlar, ancak bir Para Artışı ve {1} Prestij Jetonu kazanırsın";
		PrestigeMessageBetter = "Prestij yalnızca Kazmaları, Sırt \xC7antalarını, Paranı ve Bloklarını sıfırlar, ancak bir Para Artışı ve {1} Prestij Jetonu kazanırsın. <font color=\"#ff0000\">Başka hi\xE7bir şeyi sıfırlamaz! Prestij yaparak \xE7ok daha hızlı ilerlersin.</font>";
		PrestigeMessageEthereal = "Prestij, Kazmalarını, Sırt \xC7antalarını, Paranı ve Bloklarını sıfırlar <font color=\"#ff0000\">(Ethereal+ Bloklar hari\xE7!)</font>, ancak bir Para Artışı ve {1} Prestij Jetonu kazanırsın";
		PrestigeMessageBetterEthereal = "Prestij yalnızca Kazmaları, Sırt \xC7antalarını, Paranı ve Bloklarını sıfırlar <font color=\"#ff0000\">(Ethereal+ Bloklar hari\xE7!)</font>, ancak bir Para Artışı ve {1} Prestij Jetonu kazanırsın. <font color=\"#ff0000\">Başka hi\xE7bir şeyi sıfırlamaz! Prestij yaparak \xE7ok daha hızlı ilerlersin.</font>";
	};
	Tips = {
		MiningAbilityInactive = "İpucu: G\xFC\xE7l\xFC madencilik yetenekleri doğma noktasına yakınken etkisizdir!";
		CraftingNote = "\xDCretmesi senin i\xE7in \xE7ok zor olan aksesuarlar gizlenir. Daha g\xFC\xE7l\xFC ol ve daha b\xFCy\xFCk bir sırt \xE7antası edin, b\xF6ylece kilitleri a\xE7ılır.";
	};
	Upgrades = {
		BuyAll = "T\xFCm\xFCn\xFC Satın Al kilidini a\xE7";
		KeepBackpack = "Prestijleri korumak i\xE7in Sırt \xC7antası Seviyesi";
		MorePickaxePower = "Daha Fazla Kazma G\xFCc\xFC";
		MoreCash = "Daha Fazla Nakit";
		JackhammerChance = "Kazma Makinesi Şansı";
		JackhammerRadius = "Kazma Makinesi Yarı\xE7apı";
		JackhammerSize = "Kazma Makinesi Boyutu";
		MiningSpeed = "Kazma Hızı";
		MiningFrenzy = "Efsanevi bir blok bulduktan sonra Kazma \xC7ılgınlığı";
		ExplosionChance = "Patlama Şansı";
		ExplosionRadius = "Patlama Yarı\xE7apı";
		TNTLuck = "TNT Şansı";
		MiningRange = "Kazma Menzili";
		MiningRange2 = "Kazma Menzili 2";
		UnlockCrafting = "\xDCretimi a\xE7";
		MoreAccessorySlots = "Daha fazla aksesuar yuvası";
		MoreMeta1 = "Daha Fazla Meta 1";
		MoreMeta2 = "Daha Fazla Meta 2";
		MoreMetaBlocksMined = "Kazanılan bloklara g\xF6re daha fazla Meta";
		MoreLuck = "Daha Fazla Şans";
		MoreRange = "Daha Fazla Menzil";
		DuplicateBlocks = "Blok Kopyalama Şansı";
		WalkSpeed = "Daha Fazla Y\xFCr\xFCme Hızı";
	};
	UnlockMessages = {
		Prestiges = "{1} Prestijde a\xE7ılır";
	};
	Rarity = {"Sıradan", "Sıradışı", "Nadir", "Epik", "Efsanevi", "Mitsi", "Ruhani", "G\xF6ksel", "Zirve", "İlahi", "Sıfır"};
	Settings = {
		Low = "Y\xFCksek Kalite";
		LowDesc = "Bir katmanın t\xFCm ana blokları y\xFCksek kalitede g\xF6r\xFCnecektir, bu \xE7ok fazla gecikmeye neden olabilir";
		RenderDistance = "İşleme Mesafesi";
		RenderDistanceDesc = "Her y\xF6nde ka\xE7 par\xE7a g\xF6rebileceğinizi değiştirin";
		Teleport = "Işınlanma";
		TeleportDesc = "Davet ettiğiniz arkadaşlarınız bulunduğunuz konuma ışınlanmaları istenecektir";
		Music = "M\xFCzik";
		MusicDesc = "M\xFCzik \xE7alıp \xE7almayacağını değiştirir";
		FastFall = "Hızlı D\xFCş\xFCş";
		FastFallDesc = "Belirli bir s\xFCre d\xFCşt\xFCğ\xFCn\xFCzde \xE7ukurun dibine ışınlanacaksınız";
		x2Speed = "2x Hız";
		x2SpeedDesc = "Her zamanki gibi iki kat hızlı y\xFCr\xFCmenizi sağlar";
		x2Jump = "2x Jump";
		x2JumpDesc = "Her zamanki gibi iki kat y\xFCkseğe zıplamanızı sağlar";
		Reload = "Par\xE7aları Yeniden Y\xFCkle";
		ReloadDesc = "Glitches oluşması durumunda t\xFCm Blokları yeniden y\xFCkleyebilirsiniz";
		FastFly = "Hızlı U\xE7uş";
		FastFlyDesc = "Jetpack’i belli bir s\xFCre kullandığında en y\xFCksek noktaya ışınlanacaksın";
		DarkLighting = "Karanlık Aydınlatma";
		DarkLightingDesc = "Karanlık aydınlatmayı a\xE7/kapat";
		FriendMarkers = "Arkadaş İşaretleri";
		FriendMarkersDesc = "Arkadaşlarının g\xF6r\xFCn\xFCrl\xFCğ\xFCn\xFC a\xE7/kapat";
		BreakingSprites = "Kırılma Sprite'ları";
		BreakingSpritesDesc = "Blokları kazarken kırılma sprite'larının g\xF6r\xFCn\xFCrl\xFCğ\xFCn\xFC a\xE7/kapat";
		JumpJetpack = "Zıplama Jetpack’i";
		JumpJetpackDesc = "Zıplarken otomatik olarak jetpack kullanacaksınız";
		Sounds = "Sesler";
		SoundsDesc = "Seslerin \xE7alınıp \xE7alınmayacağını a\xE7ıp kapatır";
		ChatTags = "Sohbet Etiketleri";
		AutoRender = "Otomatik Render";
		AutoRenderDesc = "Kasma algılandığında render mesafesini otomatik olarak d\xFCş\xFCr\xFCr";
		BlockStepping = "Blok Tırmanma";
		BlockSteppingDesc = "Bloklara otomatik olarak \xE7ıkarsın";
	};
	ChatMessages = {
		BlockFound = "{1} {2} bulundu";
		MultipleBlocksFound = "{1} {2} {3} bulundu";
		OreFound = "{1}, {4} Katmanında {2} ({3}) bulundu ({5} Blokta 1)";
		OreFoundShort = "{1} {2} bulundu ({3} Blokta 1)";
		MultipleOresFound = "{1}, {5} Katmanında ({6} Blokta 1) {2} {3} ({4}) bulundu";
		YouBlockFound = "Az \xF6nce {1}'i buldunuz";
		YouMultipleBlocksFound = "{1} {2}'yi buldunuz";
		YouOreFound = "{3} Katmanında {1} ({2}) buldunuz ({4} Blokta 1)";
		YouOreFoundShort = "Az \xF6nce {1} buldunuz ({2} Blokta 1)";
		YouMultipleOresFound = "{4} Katmanında {1} {2} ({3}) buldunuz ({5} Blokta 1)";
		TempMute = "{1} i\xE7in ge\xE7ici olarak sessize alındınız! Sessiz {2} i\xE7inde sona eriyor";
		PermMute = "{1} i\xE7in kalıcı olarak sessize alındınız!";
		TeleporterDestroyed = "Işınlayıcınız, \xFCzerine bir blok yerleştirildiği i\xE7in yok edildi";
		MiningFrenzy = "Kazma \xC7ılgınlığı aktif! Artık {1} daha hızlı kazacak ve 1 dakika boyunca {2} daha fazla hasar vereceksin!";
		LikeGoalReached1 = "Beğeni hedefi ulaşıldı. Sonraki {1} dakika boyunca +%25 kazma hızı ve +%25 hasar!";
		LikeGoalReached2 = "Beğeni hedefi ulaşıldı. Sonraki {1} dakika boyunca +%25 para ve +%25 hasar!";
		IntroMessage1 = "⛏️Her lobiye \xF6zel bir \xF6zellik var!⛏️";
		IntroMessage2 = "💎Gruba katıl ve oyunu beğen, %50 daha fazla para kazan!💎";
		OreUncovered = "{1} madeni az \xF6nce ortaya \xE7ıkarıldı!";
		EmeraldUncovered = "Bir z\xFCmr\xFCt az \xF6nce ortaya \xE7ıkarıldı!";
		Emerald = "{1} sana {2} Z\xFCmr\xFCt hediye etti";
		Gamepass = "{1} sana {2} hediye etti";
		EmeraldYou = "{1} adlı kişiye {2} Z\xFCmr\xFCt hediye ettin";
		GamepassYou = "{1} adlı kişiye {2} hediye ettin";
		EmeraldOther = "{1}, {2} adlı kişiye {3} Z\xFCmr\xFCt hediye etti";
		GamepassOther = "{1}, {2} adlı kişiye {3} hediye etti";
		BlockEmeraldsAwarded = "Cevher oluşturduğun i\xE7in {1} Z\xFCmr\xFCt kazandın!";
		UnprocessedBlock = "Sunucu kapandığı i\xE7in {1} aldın.";
		BigCave = "Yakınında b\xFCy\xFCk bir mağara oluştu!";
	};
	ChatTips = {"Eğlenceli Bilgi: Bu oyunda toplam {1} y\xFCkseltme bulunuyor!", "Oyunda şu anda {1} adet benzersiz blok var!", "Oyundaki cevherlerin \xE7oğu {1} ve {2} tarafından yapıldı", "Takıldın mı? Prestige yapmayı dene.", "Oyunun geliştiricilerinden biri Roblox’taki en fazla rozete sahiptir: 135 milyon rozet ve ulaşılabilecek maksimum sınıra ulaşmıştır.", "En nadir blok nadirliğinin ortaya \xE7ıkma ihtimali 2.000.000.000’da 1’dir...", "Kazma hızı, ilk bakışta g\xF6r\xFCnd\xFCğ\xFCnden \xE7ok daha faydalıdır...", "Hediye sistemi sunucular arasında \xE7alışır; hediye g\xF6ndermek istediğiniz kişi \xE7evrimdışı olsa bile. Sadece oyunu en az bir kez oynamış olması yeterlidir.", "Otomatik tıklayıcılar ve makrolar serbesttir, ancak hile kullanımı yasaktır.", "\xDCretimi a\xE7tıktan ve Machina Eserini yaptıktan sonra oyundan \xE7ıkabilirsiniz; oyun sizin yerinize otomatik olarak kasılır.", "Bu mesajı alma ihtimali 10.000’de 1’dir. Tebrikler!"};
	DiscordChatTips = {"Oyundaki madenleri seviyorsan, kendi madenlerini oyunun Discord sunucusunda yapabilirsin :)"};
	ServerResponses = {
		Error = "Bir Hata Oluştu, Daha Sonra Tekrar Deneyin";
		AppealEmpty = "İtiraz boş olamaz";
		AppealInvalidCharacters = "İtiraz ge\xE7ersiz karakterler i\xE7eriyor";
		AppealTooShort = "İtiraz \xE7ok kısa";
		AppealTooLong = "\xC7ok uzun s\xFCre itiraz";
		AppealTooFast = "İtirazları \xE7ok hızlı g\xF6nderiyorsunuz, yavaşlayın";
		AppealFilted = "İtiraz filtrelendi";
		AppealSuccess = "İtiraz başarıyla g\xF6nderildi, yakında size geri d\xF6neceğiz.";
		ResponseEmpty = "Yanıt boş olamaz";
		ResponseInvalidCharacters = "Yanıt ge\xE7ersiz karakterler i\xE7eriyor";
		ResponseTooShort = "Yanıt \xE7ok kısa";
		ResponseTooLong = "Yanıt \xE7ok uzun";
		ResponseDecision = "Bir karar se\xE7melisiniz";
		ResponseTooFast = "Yanıtları \xE7ok hızlı g\xF6nderiyorsunuz, yavaşlayın";
		ResponseFilted = "Yanıt filtrelendi";
		NotBanned = "Bu kullanıcı yasaklı değil";
		AlreadyResponded = "Bu itiraza zaten bir yanıt g\xF6nderildi";
		NoData = "Bu kullanıcının verisi yok";
		UnableRespond1 = "Bu itiraza yanıt veremiyoruz, l\xFCtfen yardım i\xE7in daha y\xFCksek bir r\xFCtbeyle iletişime ge\xE7in";
		UnableRespond2 = "Bu kullanıcı s\xFCper izinle yasaklandığı i\xE7in bu itiraza yanıt verilemiyor";
		ResponseSuccess = "Yanıt başarıyla g\xF6nderildi";
		LayerTooPowerful = "Katman \xE7ok g\xFC\xE7l\xFC, patlayıcı yerleştirilemez";
		NoBlocksExploded = "Patlayıcı hi\xE7bir bloğu patlatmadı ve y\xFCklenmedi";
		GiftSuccess = "{1} i\xE7in hediyeniz başarıyla g\xF6nderildi";
		GiftError = "{1} i\xE7in hediyeniz başarısız oldu, yeniden katıldığınızda yeniden denenecek";
		InvalidUser = "Ge\xE7ersiz Kullanıcı";
		GiftYourself = "Kendinizi hediye edemezsiniz";
		MoveAway = "Doğma noktasından en az 75 blok uzaklaş.";
	};
	Admin = {
		Appeals = "İtirazlar";
		NoPendingAppeals = "Şu anda bekleyen itiraz yok.";
		["Yeniden Y\xFCkle"] = "Yeniden Y\xFCkle";
		LoadingAppeals = "İtirazlar Y\xFCkleniyor...";
		SendResponse = "Yanıt G\xF6nder";
		EnterResponse = "İtiraz yanıtınızı buraya girin";
		Deny = "Reddet";
		Accept = "Kabul Et";
		TempBan = "{1} s\xFCreyle \"{2}\" nedeniyle yasaklandı";
		PermBan = "\"{1}\" nedeniyle kalıcı olarak yasaklandı";
		SuperPermBan = "\"{1}\" nedeniyle s\xFCper kalıcı olarak yasaklandı";
		Unban = "{1} tarafından yasağı kaldırıldı";
	};
	Ban = {
		AccountBan = "Hesap Yasağı";
		Temp = "Ge\xE7ici olarak {1} s\xFCreyle yasaklandınız!";
		Perm = "S\xFCrekli olarak {1} s\xFCreyle yasaklandınız!";
		TimeBanned = "S\xFCre Yasaklandı: {1}";
		BanEnds = "Yasak Sonu: {1}";
		BanEndsTimer = "Yasak {1} İ\xE7inde Bitiyor";
		BanEndsNever = "Yasak asla bitmez";
		BanEnded = "Yasak Sona Erdi: {1}";
		AppealMessage = "İtiraz etmek isterseniz aşağıdaki formdan bize ulaşın.";
		AppealMessageRubenSim = "İtiraz etmek istiyorsan, Ruben Sim ile iletişime ge\xE7.";
		AppealSent = "İtiraz g\xF6nderdiniz, en kısa s\xFCrede size geri d\xF6neceğiz.";
		AppealDenied = "İtirazınız reddedildi, daha fazla bilgi i\xE7in mesajları kontrol edin.";
		AppealAccepted = "İtirazınız kabul edildi, oynamaya devam edebilirsiniz.";
		Appeal = "İtiraz";
		AppealOnce = "Yalnızca bir kez itiraz edebilirsiniz";
		AppealTextBox = "İtirazınızı buraya girin, m\xFCmk\xFCn olduğunca fazla ayrıntı verin";
		Send = "G\xF6nder";
		ViewMessages = "Mesajları G\xF6r\xFCnt\xFCle";
		Messages = "Mesajlar";
		YouWrote = "Sen Yazdın";
		OtherWrote = "{1} Yazdı";
	};
	Trading = {
		WaitForPeople = "Takas yapacak oyuncular bekleniyor...";
		WaitForTradeRequests = "Takas istekleri bekleniyor...";
		WantsToTrade = "{1} seninle takas yapmak istiyor";
		Accept = "Kabul Et";
		Unaccept = "Kabul\xFC İptal Et";
		Deny = "Reddet";
		EnterAmount = "Miktar Gir";
		Confirmation = "Emin misin?";
		NoResults = "Sonu\xE7 bulunamadı.";
		TradeDenied = "{1} takası reddetti!";
		Offering = "{1} sunuluyor";
		Regulations = "Bazı \xF6ğeler yerel d\xFCzenlemeler nedeniyle devre dışı bırakılmıştır.";
		NotAcceptedYet = "Hen\xFCz kabul edilmedi";
		WaitingForAccept = "Kabul edildi, senin kabul etmen bekleniyor";
		ProcessingIn = "Takas {1} saniye i\xE7inde işlenecek";
		NoItemsAvailable = "Bu takas i\xE7in kullanılabilir \xF6ğe yok.";
		NoItemsOffered = "Hi\xE7bir \xF6ğe sunulmadı.";
		TradeCompleted = "Takas tamamlandı.";
		TradeFailed = "Takas sırasında bir hata oluştu.";
		TradeLimit = "{1}/{2} Takas";
		TradeLimitReset = "{1} i\xE7inde sıfırlanır";
	};
	Accessories = {{{
		Name = "\xC7oğullu Tılsım";
		Desc = "\xC7oğullu Tılsım, bir blok \xE7ıkarıldığında ekstra bir blok elde etme şansını {Boost_Dupe} artırır.";
	}, {
		Name = "\xC7oğullu Y\xFCz\xFCk";
		Desc = "\xC7oğullu Y\xFCz\xFCk, bir blok \xE7ıkarıldığında ekstra bir blok elde etme şansını {Boost_Dupe} artırır.";
	}, {
		Name = "\xC7oğullu Kalıntı";
		Desc = "\xC7oğullu Kalıntı, bir blok \xE7ıkarıldığında ekstra bir blok elde etme şansını {Boost_Dupe} artırır.";
	}, {
		Name = "\xC7oğullu Miras";
		Desc = "\xC7oğullu Miras, bir blok \xE7ıkarıldığında ekstra bir blok elde etme şansını {Boost_Dupe} artırır.";
	}}, {{
		Name = "Ruber Y\xFCz\xFCk";
		Desc = "Ruber Y\xFCz\xFCk, nadir bir blok \xE7ıkarıldığında g\xFC\xE7 5 patlaması oluşturma şansını {Boost_RareExplosion} artırır.";
	}, {
		Name = "Ruber Kalıntı";
		Desc = "Ruber Kalıntı, nadir bir blok \xE7ıkarıldığında g\xFC\xE7 5 patlaması oluşturma şansını {Boost_RareExplosion} artırır.";
	}, {
		Name = "Ruber Miras";
		Desc = "Ruber Miras, nadir bir blok \xE7ıkarıldığında g\xFC\xE7 5 patlaması oluşturma şansını {Boost_RareExplosion} artırır.";
	}, {
		Name = "Ruber Kronomikon";
		Desc = "Ruber Kronomikon, nadir bir blok \xE7ıkarıldığında g\xFC\xE7 5 patlaması oluşturma şansını {Boost_RareExplosion} artırır.";
	}}, {{
		Name = "Kumbara Y\xFCz\xFCğ\xFC";
		Desc = "Kumbara Y\xFCz\xFCğ\xFC, nakit miktarına ekstra {Boost_Cash} artış sağlar.";
	}, {
		Name = "Kumbara Kalıntı";
		Desc = "Kumbara Kalıntı, nakit miktarına ekstra {Boost_Cash} artış sağlar.";
	}, {
		Name = "Kumbara Miras";
		Desc = "Kumbara Miras, nakit miktarına ekstra {Boost_Cash} artış sağlar.";
	}, {
		Name = "Kumbara Kronomikon";
		Desc = "Kumbara Kronomikon, nakit miktarına ekstra {Boost_Cash} artış sağlar. Ayrıca ekstra %5 nakit artışı sağlar.";
	}, {
		Name = "Y\xFCcelmiş Kumbara";
		Desc = "Y\xFCcelmiş Kumbara, paraya fazladan {Boost_Cash} artış sağlayan ve bunun \xFCzerine ekstra %10 para artışı veren \xE7ok g\xFC\xE7l\xFC bir eşyadır.";
	}}, {{
		Name = "Madencinin Tılsımı";
		Desc = "Madencinin Tılsımı, paraya {Boost_Cash} ve kazma hasarına {Boost_PickaxePower} g\xFC\xE7 artışı sağlayan temel bir eşyadır.";
	}, {
		Name = "Madencinin Y\xFCz\xFCğ\xFC";
		Desc = "Madencinin Y\xFCz\xFCğ\xFC, paraya {Boost_Cash} ve kazma hasarına {Boost_PickaxePower} g\xFC\xE7 artışı sağlar.";
	}, {
		Name = "Madencinin Kalıntısı";
		Desc = "Madencinin Kalıntısı, paraya {Boost_Cash} ve kazma hasarına {Boost_PickaxePower} g\xFC\xE7 artışı sağlar.";
	}, {
		Name = "Madencinin Mirası";
		Desc = "Madencinin Mirası, paraya {Boost_Cash} ve kazma hasarına {Boost_PickaxePower} g\xFC\xE7 artışı sağlar.";
	}, {
		Name = "Madencinin Kronomikonu";
		Desc = "Madencinin Kronomikonu, paraya {Boost_Cash} ve kazma hasarına {Boost_PickaxePower} g\xFC\xE7 artışı sağlar.";
	}, {
		Name = "Madencinin D\xFCnyası";
		Desc = "Madencinin D\xFCnyası, paraya {Boost_Cash} ve kazma hasarına {Boost_PickaxePower} g\xFC\xE7 artışı sağlar. Ayrıca {Boost_PrestigeTokens} prestij jetonu ve {Boost_MiningSpeed} madencilik hızı verir. Cuma ve hafta sonları para ve hasar ikiye katlanır.";
	}}, {{
		Name = "Hız Kalıntısı";
		Desc = "Hız Kalıntısı, kazma hızına {Boost_MiningSpeed} artış sağlayan bir aksesuardır.";
	}, {
		Name = "Hız Mirası";
		Desc = "Hız Mirası, kazma hızına {Boost_MiningSpeed} artış sağlayan bir aksesuardır.";
	}, {
		Name = "Hız Kronomikonu";
		Desc = "Hız Kronomikonu, kazma hızını {Boost_MiningSpeed} artıran g\xFC\xE7l\xFC bir aksesuardır.";
	}, {
		Name = "Y\xFCce Hız";
		Desc = "Y\xFCce Hız, kazma hızını {Boost_MiningSpeed} artıran \xE7ok g\xFC\xE7l\xFC bir aksesuardır.";
	}, {
		Name = "Ebedi Hız";
		Desc = "Ebedi Hız, kazma hızını {Boost_MiningSpeed} artıran son derece g\xFC\xE7l\xFC bir aksesuardır.";
	}}, {{
		Name = "Hız Artefaktı";
		Desc = "Hız Artefaktı, y\xFCr\xFCme hızınızı {Boost_WalkSpeed} Blok/saniye artırır.";
	}}, {{
		Name = "Crepitus Y\xFCz\xFCğ\xFC";
		Desc = "Crepitus Y\xFCz\xFCğ\xFC, Patlama Yeteneği her tetiklendiğinde yarı\xE7apa +1 ekleme şansı {Boost_ExtraExplosionRadiusChance} olan bir eşyadır.";
	}, {
		Name = "Crepitus Kalıntısı";
		Desc = "Crepitus Kalıntısı, Patlama Yeteneği her tetiklendiğinde yarı\xE7apa +1 ekleme şansı {Boost_ExtraExplosionRadiusChance} olan bir eşyadır.";
	}, {
		Name = "Crepitus Mirası";
		Desc = "Crepitus Mirası, Patlama Yeteneği her tetiklendiğinde yarı\xE7apa +1 ekleme şansı {Boost_ExtraExplosionRadiusChance} olan bir eşyadır.";
	}, {
		Name = "Crepitus Kronomikonu";
		Desc = "Crepitus Kronomikonu, Patlama Yeteneği her tetiklendiğinde yarı\xE7apa +1 ekleme şansı {Boost_ExtraExplosionRadiusChance} olan bir eşyadır.";
	}, {
		Name = "Crepitus Max";
		Desc = "Crepitus Max, Patlama Yeteneği her tetiklendiğinde yarı\xE7apa +1 ekleme şansı {Boost_ExtraExplosionRadiusChance} olan bir eşyadır.";
	}}, {{
		Name = "Fragon Eseri";
		Desc = "Fragon Eseri, efsanevi bir blok kazıldığında 25 g\xFC\xE7l\xFCk bir patlama oluşturur.";
	}}, {{
		Name = "Bang Y\xFCz\xFCğ\xFC";
		Desc = "Bang Y\xFCz\xFCğ\xFC, Efsanevi bir Blok \xE7ıkarıldığında g\xFC\xE7 17 patlaması yaratma şansına {Boost_LegendaryExplosion} sahiptir.";
	}, {
		Name = "Bang Kalıntısı";
		Desc = "Bang Kalıntısı, Efsanevi bir Blok \xE7ıkarıldığında g\xFC\xE7 17 patlaması yaratma şansına {Boost_LegendaryExplosion} sahiptir.";
	}, {
		Name = "Bang Mirası";
		Desc = "Bang Mirası, Efsanevi bir Blok \xE7ıkarıldığında g\xFC\xE7 17 patlaması yaratma şansına {Boost_LegendaryExplosion} sahiptir.";
	}, {
		Name = "Bang Kronomikonu";
		Desc = "Bang Kronomikonu, Efsanevi bir Blok \xE7ıkarıldığında g\xFC\xE7 20 patlaması yaratma şansına {Boost_LegendaryExplosion} sahiptir.";
	}}, {{
		Name = "Radar Tılsımı";
		Desc = "Radar Aksesuarı, seni {Boost_RadarRadius} Blok i\xE7inde efsanevi+ cevherlerin yakınına y\xF6nlendirir.";
	}, {
		Name = "Radar Y\xFCz\xFCğ\xFC";
		Desc = "Radar Aksesuarı, seni {Boost_RadarRadius} Blok i\xE7inde efsanevi+ cevherlerin yakınına y\xF6nlendirir.";
	}, {
		Name = "Radar Kalıntısı";
		Desc = "Radar Aksesuarı, seni {Boost_RadarRadius} Blok i\xE7inde efsanevi+ cevherlerin yakınına y\xF6nlendirir.";
	}, {
		Name = "Radar Mirası";
		Desc = "Radar Aksesuarı, seni {Boost_RadarRadius} Blok i\xE7inde efsanevi+ cevherlerin yakınına y\xF6nlendirir.";
	}, {
		Name = "Radar Kronomikonu";
		Desc = "Radar Aksesuarı, seni {Boost_RadarRadius} Blok i\xE7inde efsanevi+ cevherlerin yakınına y\xF6nlendirir.";
	}}, {{
		Name = "Machina Eseri";
		Desc = "Bu eser, bedenini senin isteğin doğrultusunda kontrol ederek madencilik deneyimini otomatikleştirir.";
	}, {
		Name = "İkinci Derece Machina";
		Desc = "Otomatik madenciliği Efsanevi+ cevherleri kazacak şekilde geliştirir ve y\xFCr\xFCme hızını %100 artırır.";
	}, {
		Name = "\xDC\xE7\xFCnc\xFC Derece Machina";
		Desc = "Otomatik madenciliği Nadir+ cevherler i\xE7in geliştirir, y\xFCr\xFCme hızını %200 artırır ve otomatik madencilik verimliliğini %50’den %60’a \xE7ıkarır.";
	}, {
		Name = "En Y\xFCksek Derece Machina";
		Desc = "Otomatik madenciliği TNT kazacak şekilde geliştirir, verimliliğini %60’tan %100’e \xE7ıkarır, y\xFCr\xFCme hızını %500 artırır ve \xE7antan dolduğunda g\xFCnde \xFC\xE7 defaya kadar otomatik olarak satar.";
	}, {
		Name = "Machina'nın V\xFCcut Bulmuş Hali";
		Desc = "Otomatik madenciliği mesafeden bağımsız olarak t\xFCm Efsanevi+ cevherleri kazacak şekilde geliştirir ve TNT kazmak, patlattığı t\xFCm blokları verir.";
	}, {
		Name = "Her İhtimali Hesaba Katmak";
		Desc = "Yeterince hızlı kazabildiğin s\xFCrece, Nadir olmayanlardan Eterik cevherlere kadar t\xFCm cevherleri anında kazmayı sağlar ve TNT’yi iki katı mesafeden kazar.";
	}}, {{
		Name = "Malleus Kalıntısı";
		Desc = "Malleus Kalıntısı, Jackhammer i\xE7in {Boost_JackhammerChance} şansı ekler.";
	}, {
		Name = "Malleus Mirası";
		Desc = "Malleus Mirası, Jackhammer i\xE7in {Boost_JackhammerChance} şansı ekler.";
	}, {
		Name = "Malleus Kronomikon";
		Desc = "Malleus Kronomikon, Jackhammer i\xE7in {Boost_JackhammerChance} şansı ekler.";
	}, {
		Name = "Malleus Y\xFCkselmiş";
		Desc = "Malleus Y\xFCkselmiş, Jackhammer i\xE7in {Boost_JackhammerChance} şansı ekler.";
	}}, {{
		Name = "Exitium Mirası";
		Desc = "Exitium Mirası, Patlama i\xE7in {Boost_ExplosionChance} şansı ekler.";
	}, {
		Name = "Exitium Kronomikon";
		Desc = "Exitium Kronomikon, Patlama i\xE7in {Boost_ExplosionChance} şansı ekler.";
	}, {
		Name = "Exitium Y\xFCkselmiş";
		Desc = "Exitium Y\xFCkselmiş, Patlama i\xE7in {Boost_ExplosionChance} şansı ekler.";
	}}, {{
		Name = "Fodienda Tılsımı";
		Desc = "Fodienda Tılsımı, Madencilik Menzilinizi {Boost_MiningRange} blok artırır.";
	}, {
		Name = "Fodienda Y\xFCz\xFCğ\xFC";
		Desc = "Fodienda Y\xFCz\xFCğ\xFC, Madencilik Menzilinizi {Boost_MiningRange} blok artırır.";
	}, {
		Name = "Fodienda Kalıntısı";
		Desc = "Fodienda Kalıntısı, Madencilik Menzilinizi {Boost_MiningRange} blok artırır.";
	}, {
		Name = "Fodienda Mirası";
		Desc = "Fodienda Mirası, Madencilik Menzilinizi {Boost_MiningRange} blok artırır.";
	}, {
		Name = "Fodienda Kronomikonu";
		Desc = "Fodienda Kronomikonu, Madencilik Menzilinizi {Boost_MiningRange} blok artırır.";
	}, {
		Name = "Y\xFCkselmiş Fodienda";
		Desc = "Y\xFCkselmiş Fodienda, madencilik menzilini {Boost_MiningRange} blok artırır.";
	}}, {{
		Name = "Fortuna Y\xFCz\xFCğ\xFC";
		Desc = "Fortuna Y\xFCz\xFCğ\xFC şansını {Boost_Luck} artırır.";
	}, {
		Name = "Fortuna Kalıntısı";
		Desc = "Fortuna Kalıntısı şansını {Boost_Luck} artırır.";
	}, {
		Name = "Fortuna Mirası";
		Desc = "Fortuna Mirası şansını {Boost_Luck} artırır.";
	}, {
		Name = "Ana Fortuna";
		Desc = "Ana Fortuna şansını {Boost_Luck} artırır.";
	}}, {{
		Name = "N\xFCkleer Otomat Eseri";
		Desc = "\xC7evrim i\xE7iyken patlayıcıların bekleme s\xFCresini {Boost_ExplosiveCooldownReduction} azaltır.";
	}}, {{
		Name = "N\xFCkleer G\xFC\xE7 Mirası";
		Desc = "Patlayıcıların g\xFCc\xFCn\xFC {Boost_ExplosiveRadius} artırır.";
	}, {
		Name = "N\xFCkleer G\xFC\xE7 Kronomikonu";
		Desc = "Patlayıcıların g\xFCc\xFCn\xFC {Boost_ExplosiveRadius} artırır.";
	}}, {{
		Name = "N\xFCkleus Sim\xFCl – Final";
		Desc = "Patlayıcıların g\xFCc\xFCn\xFC {Boost_ExplosiveRadius} artırır ve \xE7evrim i\xE7iyken bekleme s\xFCresini {Boost_ExplosiveCooldownReduction} azaltır. N\xFCkleer Otomat Eseri ve N\xFCkleer G\xFC\xE7 Kronomikonunu birleştirir.";
	}}, {{
		Name = "Auctoritas Kalıntısı";
		Desc = "Auctoritas Kalıntısı prestij jetonlarını {Boost_PrestigeTokens} artırır.";
	}, {
		Name = "Auctoritas Mirası";
		Desc = "Auctoritas Mirası prestij jetonlarını {Boost_PrestigeTokens} artırır.";
	}, {
		Name = "Auctoritas Kronomikonu";
		Desc = "Auctoritas Kronomikonu prestij jetonlarını {Boost_PrestigeTokens} artırır.";
	}, {
		Name = "Auctoritas Aşkın";
		Desc = "Auctoritas Aşkın prestij jetonlarını {Boost_PrestigeTokens} artırır.";
	}}, {{
		Name = "Cevher Vulnus Eseri";
		Desc = "Bu aksesuar, yeterince hızlı kazabiliyorsan kazılan bloğun yanındaki t\xFCm cevherleri kazır.";
	}}, {{
		Name = "Sinum Y\xFCz\xFCğ\xFC";
		Desc = longstring1;
	}, {
		Name = "Sinum Relikası";
		Desc = longstring1;
	}}, {{
		Name = "Ruptis Eseri";
		Desc = "Ruptis Eseri ile, Eterik+ cevherlerin neden olduğu patlamalar patlattıkları t\xFCm blokları sana verir.";
	}}, {{
		Name = "Mobilitas Ultima";
		Desc = "Nadir bir cevher kazmak g\xFC\xE7 6, Efsanevi bir cevher kazmak g\xFC\xE7 20, Mitik bir cevher kazmak g\xFC\xE7 33 patlama oluşturur. Eterik+ cevherlerin patlattığı t\xFCm blokları alırsın ve Z\xFCmr\xFCt kazmak g\xFC\xE7 17 patlama oluşturur. Bu aksesuar Ruber Chronomicon, Fragon Artifact, Bang Chronomicon ve Ruptis Artifact eserlerini birleştirir.";
	}}, {{
		Name = "Magicae Tılsımı";
		Desc = "Bu aksesuar aynı nadirlikteki normal aksesuarlara kıyasla {Boost_LocalMagicPower} daha fazla B\xFCy\xFC G\xFCc\xFC verir.";
	}, {
		Name = "Magicae Y\xFCz\xFCğ\xFC";
		Desc = "Bu aksesuar aynı nadirlikteki normal aksesuarlara kıyasla {Boost_LocalMagicPower} daha fazla B\xFCy\xFC G\xFCc\xFC verir.";
	}, {
		Name = "Magicae Relikası";
		Desc = "Bu aksesuar aynı nadirlikteki normal aksesuarlara kıyasla {Boost_LocalMagicPower} daha fazla B\xFCy\xFC G\xFCc\xFC verir.";
	}, {
		Name = "Magicae Mirası";
		Desc = "Bu aksesuar aynı nadirlikteki normal aksesuarlara kıyasla {Boost_LocalMagicPower} daha fazla B\xFCy\xFC G\xFCc\xFC verir.";
	}, {
		Name = "Magicae Chronomicon";
		Desc = "Bu aksesuar aynı nadirlikteki normal aksesuarlara kıyasla {Boost_LocalMagicPower} daha fazla B\xFCy\xFC G\xFCc\xFC verir.";
	}}};
	Blocks = {"Kir", "Kum", "Al\xFCvyon", "Kil", "Tın", "Turba", "Tebeşir", "Kompost", "\xC7akıl", "Entisoller", "Aridisoller", "Inceptisoller", "Gelisoller", "Cermanite", "Sıkıştırılmış Toprak", "K\xF6kler", "Mantar", "Mantarlar", "Patates", "Pancar", "Yaban havucu", "Zencefil", "Zerde\xE7al", "Gophers T\xFCneli", "Benler", "Molisoller", "Kırık \xC7\xF6mlek", "Zaman Kaps\xFCl\xFC", "Sıkıştırılmış \xC7amur", "Kompakt \xC7amur", "Su ile Depolanmış \xC7amur", "Bitki \xC7amuru", "Tekerlek", "\xC7amur Kasabası", "Kirli \xC7amur", "İskelet", "Hazine", "Yabancı \xC7amur", "Nokia", "N\xFCkleer Atık", "Petrol Sahası", "Motor Yağı", "Prehistorik \xC7amur", "Yoğun Toprak", "Sarımsak", "Turp", "Yucca", "Cicama", "Karıncalar", "Hatalar", "Kud\xFCs Cırcır B\xF6cekleri", "Kırkayaklar", "Termitler", "Kırık Silahlar", "Eski Paralar", "Ok İpu\xE7ları", "Kemikler", "Antik Eser", "\xC7amur", "\xC7imli Toprak", "Mantar Toprağı", "S\xFCr\xFClm\xFCş Toprak", "Bitki K\xF6kl\xFC Toprak", "Enfekte Toprak", "G\xFCneş Alan Toprak", "Ağa\xE7 K\xF6kl\xFC Pislik", "\xC7\xF6p Enfekte Toprak", "B\xFCy\xFCk Kir", "\xD6r\xFCmcek Yuvalanmış Toprak", "Lastik \xD6rdek Toprağı", "Kağıt Kiri", "Paket Toprak", "Taş", "Flint", "Kokina", "Dolomit", "Traverten", "T\xFCf", "Oolit", "Breka", "Konglomera", "Kaliş", "Kumtaşı", "Silttaşı", "Diatomit", "Halit", "Kristal", "Derin \xC7im", "\xD6l\xFC \xC7im", "Islak \xC7im", "Verimli \xC7im", "Yamalı \xC7im", "Donmuş \xC7im", "\xC7atlak \xC7im", "Sahte \xC7im", "K\xF6kl\xFC \xC7im", "Tohumlu \xC7im", "Yabancı \xC7im", "Ay Otu", "Solucan Otu", "Dokunulan \xC7imen", "Krater", "Sıkıştırılmış Taş", "Mermer", "Novak\xFClit", "Kuvarsit", "Skarn", "Gnays", "Amfibolit", "Hornfels", "Arduvaz", "Şist", "Filit", "Sabuntaşı", "Antrasit", "Mariposit", "Verdite", "Lapis Lazuli", "\xC7im", "\xC7ıkar", "Paraotu", "Şarlatan \xC7imen", "Kaz Otu", "\xC7im Yaması", "Dallis Otu", "At Kuyruğu", "İtalyan Beyazı", "Ebeg\xFCmeci", "Cadı Otu", "Hızlı Kuyu", "Gen\xE7 Bitki", "Civanper\xE7emi", "Karahindiba", "D\xF6rt Yapraklı Yoncalar", "Yoğun Taş", "Diyorit", "Andezit", "Riyolit", "Granit", "Pegmatit", "Gabbro", "Diyabaz", "Bazalt", "Plajiyoklaz", "Diyasit", "Gizli Bakır", "T\xFCf", "Bastnasit", "Ateş Opalı", "G\xF6ky\xFCz\xFC", "Beyaz Bulut", "A\xE7ık Gri Bulut", "Koyu Gri Bulut", "U\xE7ak", "U\xE7urtma", "Kuş", "\xD6zel Jet", "Hava Balonu", "Helikopter", "Zıplak", "Askeri Helikopter", "Fırtına", "Kasırga", "Volkan", "Obsidyen", "Salaxum", "Baserit", "Y\xFCce", "Ara\xE7 Salaxum", "Deconogaron", "Boksit", "Scriolin", "Peragomit", "Muosik Obsidyen", "Lascero Lamenta", "G\xF6kkuşağı Obsidyeni", "Xenotime", "Monazit", "Y\xFCksek G\xF6ky\xFCz\xFC", "Jet Contrails", "G\xFCneş Işınları", "İnce Bulutlar", "U\xE7an g\xF6z", "Mega Bulut", "Sisli Atmosfer", "D\xFCşen Uzay \xC7\xF6p\xFC", "G\xFCneş Tutulması", "Roket", "UFO", "Aurora Borealis", "Parlayan Bulutlar", "Cennet", "Erimiş Obsidyen", "Silya", "Peragomit", "Alev Doğuşu", "Shimicala", "Graeconogaron", "Geris", "Piromit", "Dotorit", "Centromodor", "Buhar G\xF6zl\xFCğ\xFC", "Alev Taşı", "Terasit", "Magmayum", "Boşluk", "Kızıl Yıldız", "Turuncu Yıldız", "G\xFCneş", "Meteor", "Asteroid", "Ay", "C\xFCce Gezegen", "Uydu", "Gezegen", "Kuyruklu Yıldız", "Gezegen Y\xFCz\xFCğ\xFC", "Uluslararası Uzay İstasyonu", "Oumuamua", "Lav", "G\xFC\xE7lendirilmiş Bazalt", "Skorya", "Pomza", "Katı Lav", "Divenestium", "Yıldız", "Byrrzome", "Xapotote", "Gnixon", "Polonit", "Ateşten Kalp", "G\xF6m\xFCl\xFC G\xFCneş", "Cehennem", "Radyoaktif Taş", "Uranyum", "Uranyumit", "Gamitler", "Moptazik", "Paretiyum", "Limioaktif", "Ratiyum", "Zonyumit", "Beyaz", "Adsimit", "\xD6d\xFCl", "Legenium", "Limon", "Zehirli Obsidyen", "Ezilmiş Kaya", "Yağ Atık", "Sertleştirilmiş \xC7ekirdek", "\xC7atlak Kemikler", "Yapay K\xFCp", "\xC7atlak Atık", "Tarih \xD6ncesi Bot Kiralama", "Lav Par\xE7aları", "Erimiş Kalıntı", "Kırmızı Beril", "Acı", "Eski Alet", "G\xFCneş Kristali", "Aşırı Basın\xE7lı Atık", "Donma Atık", "Zehirli Lav", "G\xFCneş Lavı", "Timloin Lavı", "Etek Lavası", "Siyah Lav", "Tomicity Lav", "İnsanlık Lavı", "Gaminyity Lav", "Toksisite Lav", "Mavi Lav", "Ak\xE7aağa\xE7 Lavası", "\xD6l\xFCm Lavı", "Toksim Lav", "Volkanik Lav", "Lavayı \xD6ld\xFCr", "Kaynayan Lav", "Al\xFCminyum", "Fulocite", "Telbar", "Merk\xFCr", "Phigaryum", "Rizufide", "Yagdit", "Yulasit", "Vaks", "Farlicin", "Derilyum", "Birucite", "Sacreoxyn", "Eşekb\xF6ceği", "Leviathan Kristali", "Dış \xC7ekirdek", "Riljud", "Karzyum", "Selorus", "Foxrophine", "İndirim", "Ektoplazma", "Safran", "Subsinit", "Aluhargium", "Parchium", "Zanforn-88", "Tarla", "K4R-UL-1UM", "Jyrulphasion", "ELEMAN TON-618", "Orta \xC7ekirdek", "Soultriek", "Rejewel", "Şakalit", "Saf Olmayan Hidrojen", "Darnite", "Eternum", "Makabyum", "Aunolit", "Fernokajin", "Netherit", "Sıkıca Paketlenmiş Nikel", "Garip Alaşım", "M\xFCcevherli Ağıt", "Kobalt Toryum G", "Fingerite Remnants", "İ\xE7 \xC7ekirdek", "Parıldayan Demir Cevheri", "Oksijenanyum", "Parıldayan G\xFCm\xFCş Cevheri", "Sıkıştırılmış Hidrojen", "Lavanyum", "Ergitici", "Glimmerium", "Grainium", "İlk Kaya", "Aşırı Parıldayan Volkanik K\xFCl", "Magmorthum", "Normalyum", "Alaşım Cevheri", "Merkez", "İmkansız Plazma", "Derin Uzay", "Karanlık Madde", "Kara Delik", "Gezegen Kalıntısı", "Galaksi", "Yıldız Kalıntısı", "Gizem", "N\xF6tron Yıldızı", "Galaktik Opal", "Meteyum", "Sahte Uygar Nesne", "Skrep", "Yeşil Kuyruklu Yıldız", "Litorp", "Mikroskobik Benek", "Kara C\xFCce", "Beyaz Delik", "Yarı yıldız", "Ay Taşı", "Ay Akvaryumu", "Ay Kristalleri", "Selen Cevheri", "Aylı", "Yıldız Tozu Kristali", "G\xF6ksel Kuvars", "Ay Cevheri", "Astralyum", "Ay Ruhu", "Ay Ametist", "Ay \xD6z\xFC", "Ay Alevi Cevheri", "Ay G\xF6lgesi Kristali", "Ay Bah\xE7esi", "G\xFCneş Ay \xD6z\xFC", "\xD6l\xFCm Yıldızı", "Asteroid Kuşağı", "Bazalt Par\xE7ası", "Celestium Cevheri", "Nikel K\xFCl\xE7esi", "Meteoroid", "Kobalt Damarı", "Platin Par\xE7ası", "İridyum K\xFCmesi", "Meteor Taşı", "Ksenon Kristali", "Boşluk Kristali", "Gravitonyum", "Kozmik \xC7ekirdek", "Yıldız Yakutu", "Tekillik Taşı", "Manzara", "Atmosfer Yoğunlaştırıcı", "Zamanın Kumları", "Saf Aşırı Sıkıştırılmış N\xF6tronyum", "Plazma \xC7ekirdeği", "Altuzay Mayını", "Kronos", "Bir\xE7ok Gece G\xF6ğ\xFC", "Kromalit", "G\xF6k G\xFCr\xFClt\xFCs\xFC", "Seraf", "Lav Par\xE7ası", "Ejderha Camı", "Boşluk Taşı", "Zycrit", "Drakoniyum", "Buzlu Elmaslar", "Yanan Nefret", "Wijkuled", "Gustavon", "Eritilmiş Par\xE7a", "Alev Camı", "Cehennem Hapishanesi", "Astral Ateş", "Rohoccaim", "Pirit", "G\xFCneş Taşı", "Yanan Hafıza", "\xC7atlamış Eritilmiş Yakut", "Bozulma", "Radyum", "Oganeson", "Kriptonit", "Ewudojjed", "Cep Telefonu", "Devre", "Aktinyum", "Pl\xFCtonyum", "Toryum", "\xC7erenkov Kristali", "Sabit", "Uranil Heksa Flor\xFCr", "Plazma", "Ruh Kumu", "Zefendit", "Ignisaxum", "Arktik Don", "Gaz Halinde Demir", "Dikenli \xC7i\xE7ek Taşı", "Ateş \xD6r\xFCmceği", "Ulewuthaim", "D\xFCşen Yıldız", "Kyawthuit", "Uru", "Koiksxolaim", "Arras", "Anomali", "Renk Aşımı", "K\xFCpl", "Aetherium Kristali", "Kutsanmış Cevher", "Celestium", "Zincirli Şeytan", "İkili Datacrite Hesapla", "Ge\xE7ici Umut Final", "Galaxium", "Eternium", "Genesium", "Gri \xD6l\xE7ekli Kılı\xE7 ve Yıldızlar", "Lavaxite Prizması", "Plazma Ateşi", "Waterium Demirleme", "KARIŞIK", "Toerium", "Thefaimnilnilnil", "Tesseract \xC7ekirdeği", "Nocturnis", "Antik Enerji", "Yanan Varlık", "Cometium", "Sıfır", "Gideon", "\xC7izgi Taşı", "Trianglium", "Squarite", "Circlite", "Kiteanium", "Ovalium", "Trapezide", "Octagonium", "Pentagrium", "Hexagrite", "Crosilite", "Loveilite", "Snowtanium", "Cindrillium", "Wedgilite", "Spherite", "Pi Circumferencium", "Starlite", "Trishatterite", "Geometrilekenic \xC7ekirdek", "N-Gon", "Eclipsera", "İridanyt", "Starsearit", "Gravonyx", "Solenyt", "Eclipseron", "Hurda Pyx", "Noctyrit", "Kozmaril", "Umbryx", "Astralyt", "Aetherion", "Aeronyx", "Nimbryl", "Solarium Cevheri", "Zephyrosit", "Tempestralit", "Stratonium", "Breezium", "Ventryx", "Voltacit", "Celestara", "Skynexium", "Verdanyt", "Floracit", "Elarion", "Sylvanyth", "Xylogranit", "Ambryth", "Druanit", "Terravin", "Gaialit", "Claythium", "Loamyx", "Sedryx", "Rubrath", "Shalorit", "Terralit", "Myrtaşı", "Tynarit", "Geodin", "Aurivin", "Terrakron", "Gravellium", "Ferronyx", "Crimora", "Amarion", "Compaxit", "Bronzium", "Slathem", "Rubrasyt", "Obryx Opali", "Obdurium", "Argenyx", "Onythera", "Rubraxis", "Noctyra", "Umbrosit", "Plumbryn", "Malakitea", "Saphyros", "Drakonyx", "Lityryum", "Zyntherium", "Topazryn", "Hemovyr", "Volkarion", "Tungryth", "Jadyx", "Garnyros", "Nihytrit", "Chasmit", "Volkrys", "Obrythit", "Pyrelit", "İgnarion", "Magmoryx", "Alev Kristali", "Radionyx", "Uvyrit", "Venomyth", "Korrozit", "Scaldyrium", "Corethium", "Magnyt", "Pirotist", "İnfernox", "İgnirion", "Deephyros", "Solaryx", "Magmyra", "Eon \xC7eliği", "Nyxium", "Nebryx", "Kozmit", "Lunarisit", "Selestyum", "Celesthyn", "Rektit", "Kalsinit", "Ven\xFCs Taşı", "Sulvaris", "\xC7i\xE7ekli Kuvars", "Venit", "Yanmış Cam", "Erosin", "Kehribar Damar Cevheri", "Fumarit İncisi", "Venerian Orixio", "Kızıl Hale", "Valenit", "K\xFCl \xC7i\xE7eği Taşı", "Shythereon", "Altın Kaplama Vapora", "Serafik Cam", "Venışık", "Altın Alev Par\xE7ası", "Eclipsera Taşı", "Solenvy", "Dikenli Hale", "Astral Damar", "Tartaryum", "Merk\xFCr Taşı", "Ferrit", "K\xFCll\xFC Goethe", "Mercyrosit", "Yanmış Bazalt", "Eminescu", "Cindermark Cevheri", "Volcaryn", "Abedin Krateri", "Alev \xC7eliği", "Radyolit", "Ignilit Damarı", "Auralit", "G\xFCneş Ateşi Camı", "Caloris Havzası", "Koronathyum", "Vulkanit Prime", "Rembrandt Havzası", "Heliarchit", "Tolstoy", "Reinhardt \xC7ekirdeği", "Stilbon", "G\xFCneş Y\xFCzeyi", "G\xFCneş \xC7ıkıntısı", "K\xF6z Camı", "G\xFCneş K\xFCl\xFC", "Koronal Delik", "Fotosfer", "Kromosfer", "Fotonyx", "Termit Damarı", "G\xFCneş Pe\xE7esi Kuvarsı", "Ignis Par\xE7ası", "Helios Tozu", "Solaris \xC7ekirdek Taşı", "K\xFCl Işığı Taşı", "Altın Alev Alaşımı", "Prometheon", "Parlak Solinyum", "Şafak Pirit", "Şafak Tacı", "Cehennem Prizması", "Alev Patlaması", "Ebedi G\xFCneş Alevi", "Beethoven'ın Sessizliği", "Orada, Benjamin", "110011 1010010 1010010 110000 1010010 101110 110100 110000 110100", "Prizmatik Kuasar", "Acıyla \xD6rt\xFCl\xFC", "Jacob'un Ebediyete İnişi", "ΒΞDRΩCK", "fαтє", "Kader, herhangi bir insan gibi y\xFCr\xFCr", "E̶͐́l̸̆̊ė̷͙p̷͒̍h̷͂͝ǎ̴̿n̶̛t’in Ayağı", "αи∂яσмє∂α", "Monokrit U\xE7urumu", "Perdenin   ̶C̶U̶R̶T̶A̶I̶N̶  Ardındaki Alevlere Bak", "你聽到了嗎？？？？？？？？？", "Geometrik Matematiğin Katı Tanrısı", "G\xFCneş Patlaması Damarı", "Saf İlahiyet", "Alternatif D\xFCzlem", "TUDOL", "G\xFCneş \xC7ekirdeği", "Yeralti Hidrojeni", "\xC7ekirdekgrit", "G\xFCneş C\xFCrufu", "Quadium Hidrojeni", "Tako\xE7izgi", "Helion Camı", "Plasmirum", "İrradit", "Fotovit", "Helikorit", "Yıldız Kemiği", "İnfernik Alaşım", "Solatrix", "Luminforge Kristali", "Koronait", "Vermion", "Atenin Alevtaşı", "Stellarium", "Gemisis", "G\xFCneşy\xFCreği", "Boyutsal Nesneler", "Ultimatom", "Saf Sanctarit", "Hsixia", "TERRARVM", "Odysseia", "Cennette Yapıldı", "Ballic'in Gazabı", "Φοβος", "Apocrypha", "\xDCst-akılcı İşaret", "Fasaria", "→ Aurora ⇋ Nihai ⇋ ←", "《『R』『E』『V』『E』『L』『A』『T』『I』『O』『N』》", "Ex Machina sondan bir \xF6nceki", "『Ｉｎｄｅｘ』『Ｄｅｉ』『ｌａｔｅｎ』", "Mars Taşı", "Paslı Kaya", "Toza Bağlı Cevher", "Kızıltaş", "Gravellit", "Ferrinit", "K\xFCl Plakası", "Terraklin", "Oksidulit", "Mars Camı", "Kızıl Alaşım", "Roubion \xC7ekirdeği", "Volkarit", "Sangrelit", "Demir G\xF6lge Kristali", "Mars Ruh Taşı", "Toz D\xF6v\xFClm\xFCş Titanit", "Kızıl Deprem Yakutu", "Ares \xC7ekirdeği", "Kırmızı K\xFCp", "Borealis Suyu", "Deimos Serafiti", "Phobos", "JeremyDevs", "『Ｏｎｃｅ』『Ｂｙ』『Ｈｕｍａｎ』", "J\xFCpiter Gazı", "Basın\xE7lı Hidrojen", "J\xFCpiter Kayası", "Metalik Hidrojen", "Hapsolmuş Fırtına", "Basın\xE7 Sisi", "İyonize Hidrojen", "Y\xFCkl\xFC Amonyak", "Aurora T\xFCy\xFC", "Siklon Buharı", "Metanik Dalga", "\xC7\xF6km\xFCş Sonda", "J\xFCpiter \xD6z\xFC", "J\xFCpiter İstasyonu", "Fırtına Bağlı Plazma", "B\xFCy\xFCk Kırmızı Buhar", "B\xFCy\xFCk Auroralar", "Europa", "Zeus’un Hakimiyeti", "Yakınsama", "B\xFCy\xFC", "Kozmik Uydular", "Athanatos", "Sat\xFCrn Gazı", "Helyum S\xFCr\xFCklenmesi", "Soğuk Halkalar", "Altın Pus", "Halka Doğumlu", "Donmuş Amonyak", "Kriyo Sis", "Dış Halka Kayası", "Basın\xE7 İpeği", "Halka Fırtına Bulutu", "Metan Perdesi", "Karma ve Zaman", "Halka Işığı \xD6z\xFC", "Kronos", "Sessiz Fırtına", "Sat\xFCrn Ta\xE7 Bulutu", "Altın Jet Akımı", "Davud’un Cevheri", "Remphan Yıldızı", "Kadim Atmos", "Tek Renk Yoğunluk", "\xC7ok Renkli Kablolar", "Titanos \xC7ekirdeği", "D\xFCzenek", "Hurda Kaplama", "Demir Kablolama", "Pas Bağlı Alaşım", "Dişli Taşı", "Devre Cevheri", "\xC7elik Kafes", "Darbe Kanalı", "Mechasil", "Mantık Kristali", "Servo \xC7ekirdeği", "İkili Alaşım", "Sinirsel Matris", "Zaman Dişlisi", "Sentetik Ruh Taşı", "Gezegensel Motor Par\xE7ası", "Omnikor Alaşımı", "Machina Kalp \xC7eliği", "Deus Mechanica", "Tekillik İşlemcisi", "Aksiyom Motoru", "Hayalet Kod Prizması", "Ana Direktif", "Uran\xFCs Gazı", "Solgun Metan", "Buzlu Buhar", "Bulut S\xFCr\xFCklenmesi", "Buzul Sisi", "Buz Girdabı", "Kriyo \xD6rt\xFC", "Mavi Pus", "Eğik Akış", "Kutup Titremesi", "Metan Don Perdesi", "Donmuş Jet Akımı", "Aurora Akımı", "Parlak Don R\xFCzgarı", "Sessiz Siklon", "Titanik Esinti", "Eterik Sarmal", "Donmuş Hale", "G\xF6ksel Soğuk", "İlkel Buz Kilidi", "Eterlik", "Eter Sisi", "Uran\xFCs \xC7ekirdeği", "『Dʏꜱꜰᴜɴᴄᴛɪᴏɴᴀʟ』『Aʙᴇʀʀᴀᴛɪᴏɴ』", -- : First try: K:0: attempt to index nil with 't'
;
	Explosives = {"Dinamit", "Bomba", "C4", "TNT", "F\xFCze", "N\xFCkleer", "\xC7ar Bombası", "N\xF6tron Bombası", "Antimadde Bombası"};
	Leaderboards = {"En Fazla Nakit", "\xC7oğu Blok \xC7ıkarıldı", "En \xC7ok Oynanan Zaman", "Keşfedilen Blokların \xC7oğu", "En Prestijler", "En Prestij Jetonları", "En \xC7ok Robux Harcanan"};
	Gamepasses = {
		x2Cash = "2x Nakit";
		x2CashDesc = "T\xFCm Nakit gelirinizi ikiye katlar";
		x2Emerald = "2x Z\xFCmr\xFCt";
		x2EmeraldDesc = "Z\xFCmr\xFCt Cevherinden aldığınız Z\xFCmr\xFCtleri ikiye katlar";
		SharperPickaxes = "Daha Keskin Kazmalar";
		SharperPickaxesDesc = "T\xFCm Kazmalar %10 daha g\xFC\xE7l\xFC olacak";
		x2PickaxePower = "2x Kazma G\xFCc\xFC";
		x2PickaxePowerDesc = "T\xFCm Kazmaların G\xFCc\xFCn\xFC İki Katına \xC7ıkarır";
		x2MiningSpeed = "2x Madencilik Hızı";
		x2MiningSpeedDesc = "Madencilik Hızınızı İki Katına \xC7ıkarır";
		x2Storage = "2x Depolama";
		x2StorageDesc = "Sırt \xC7antası Depolama Alanınızı İki Katına \xC7ıkarır";
		InfiniteBackpack = "Sonsuz Sırt \xC7antası";
		InfiniteBackpackDesc = "Sırt \xC7antası Depolama Alanınız Sonsuz Olacak";
		["Işınlayıcı"] = "Işınlayıcı";
		TeleporterDesc = "Her yere yerleştirebileceğiniz ve istediğiniz zaman ışınlanabileceğiniz bir ışınlayıcı sağlar. Ek olarak t\xFCm Lobi Işınlanmalarını \xFCcretsiz yapar";
		VIP = "VIP";
		VIPDesc = "VIP'ye \xF6zel bir Kazma, Sırt \xC7antası ve Sohbet Etiketinin kilidini a\xE7acaksınız. Ek olarak satın alımlardan daha fazla Z\xFCmr\xFCt alacaksınız";
		x2Speed = "2x Hız";
		x2SpeedDesc = "Normalden 2 kat daha hızlı y\xFCr\xFCmenizi sağlar";
		x2Jump = "2x Jump";
		x2JumpDesc = "Normalden 2 kat daha y\xFCkseğe zıplamanızı sağlar";
		Jetpack = "Jetpack";
		JetpackDesc = "U\xE7manızı sağlayan jetpack'i a\xE7ar";
		MoreRange = "Daha Fazla Menzil";
		MoreRangeDesc = "Kazma menzilini +5 blok artırır";
	};
	Quests = {"Benim {1} {2}", "{1} {2} Blok \xC7ıkar", "{1} Blok \xC7ıkar", "{1} Cevher \xC7ıkar", "{1} Derinliğe Kazın", "Kazma #{1} veya daha iyisini kuşanın", "Sırt \xC7antası #{1} veya daha iyisini kuşanın", "{1} Patlayıcı Kullan"};
	TranslatorSettings = {
		Locale = "tr";
		Seperator = '.';
		Decimal = ',';
		TimeAbbreviations = {'s', 'd', "sa", 'g', 'y'};
		Translator = 616361048;
	};
}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Translator.english
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:03
-- Luau version 6, Types version 3
-- Time taken: 0.059216 seconds

local longstring1 = "This Accessory increases your Backpack Space by {Boost_BackpackSpace} and it gives {Boost_LocalMagicPower} more Magic Power than usual accessories of this rarity."
return {
	Main = {
		Cash = "Cash";
		BlockCount = "{1}/{2} Blocks";
		BlockCountUnlimited = "{1} Blocks";
		EnableJetpack = "Enable Jetpack";
		DisableJetpack = "Disable Jetpack";
		ToSurface = "To Surface";
		ToTeleporter = "To Teleporter";
		Backpack = "Backpack";
		Index = "Index";
		Settings = "Settings";
		Reload = "Reload";
		ReloadChunks = "Reload Chunks";
		Placing = "Placing {1}";
		Unbreakable = "Unbreakable";
		BackToMining = "Back To Mining";
		Search = "Search...";
		Place = "Place";
		Lock = "Lock";
		Unlock = "Unlock";
		Unlocked = "Unlocked";
		BackpackFull = "Backpack Full";
		BackpackFullMessage = "You have filled up your backpack completely and you can not mine until you sell, place blocks or upgrade your backpack.";
		Sell = "Sell";
		Upgrade = "Upgrade";
		BlocksDiscovered = "{1}/{2} Blocks Discovered (+{3}% Cash)";
		IndexLayer = "{1} | {2} to {3}";
		IndexLayerNoUp = "{1} | {2} and above";
		IndexLayerNoDown = "{1} | {2} and below";
		BaseValue = "Base Value: <font color=\"#00FF00\">${1}</font>";
		CurrentValue = "Current Value: <font color=\"#00FF00\">${1}</font>";
		Durability = "Durability";
		Rarity = "Rarity";
		ProbabilityToSpawn = "Probability to Spawn: 1 in {1} Blocks";
		IndexCredit = "Block by";
		Loading = "Loading";
		LoadFail = "Failed to Load";
		TotalMined = "Total Mined";
		Back = "Back";
		On = "On";
		Off = "Off";
		TimePlayed = "Time Played";
		Blocks = "Blocks";
		Explosives = "Explosives";
		Shop = "Shop";
		ComingSoon = "Coming Soon...";
		Buy = "Buy";
		Bought = "Bought";
		Max = "Max";
		Gift = "Gift";
		Gamepasses = "Gamepasses";
		Owned = "Owned";
		OwnedByRecipient = "Owned by Recipient";
		StopGift = "Stop Gifting";
		NoGifts = "There is currently no one to gift in this server.";
		EnterUsername = "Enter Username here";
		Emeralds = "Emeralds";
		MostPopular = "MOST POPULAR";
		BestOffer = "BEST OFFER";
		TeleportRequest = "Teleport Request";
		TeleportRequestMessage = "Your friend {1} has asked for help, would you like to be transported to them?";
		No = "No";
		Yes = "Yes";
		Upgrades = "Upgrades";
		Pickaxes = "Pickaxes";
		Backpacks = "Backpacks";
		Close = "Close";
		Equip = "Equip";
		Equipped = "Equipped";
		BuyWithCash = "Buy (${1})";
		BuyWithEmerald = "Buy ({1} Emerald)";
		Power = "Power";
		Storage = "Storage";
		Prestige = "Prestige";
		Prestiges = "Prestiges: {1}";
		PrestigeCashBoost = "Cash Boost: {1} → {2}";
		PrestigeWithCash = "Prestige (${1})";
		UpgradeWithEmerald = "Upgrade ({1} Emerald)";
		LobbyTeleport = "Lobby Teleport";
		LobbyAt = "Lobby at Depth {1}";
		Teleport = "Teleport";
		UnlockFreeTeleports = "Unlock Free Teleports";
		PrestigeTokens = "Prestige Tokens";
		Quests = "Quests";
		QuestDisplay = "{1}/{2} ({3}%)";
		Completed = "Completed";
		GroupBonus = "Join Jeremy Studio's and like the game for 50% more cash!";
		Tutorial = "Tutorial";
		TutorialText = "Welcome! There are many blocks to discover, to start mining click or hold on any block you want to mine. Each block gives a different amount of cash when sold, but you can only carry a limited quantity of blocks at once. There are many different layers of blocks which all contain different ores above and below dirt.";
		Ok = "Ok";
		Luck = "Luck";
		Jackhammer = "Jackhammer";
		TooWeak = "Too Weak";
		MiningSpeed = "Mining Speed";
		Explosion = "Explosion";
		Jump = "Jump";
		Pickaxe = "Pickaxe";
		Speed = "Speed";
		LikeTheGame = "LIKE THE GAME";
		ForRewards = "FOR REWARDS!";
		Range = "Range";
		Crafting = "Crafting";
		MetaGain = "Get more Meta per Robux Spent. Current Meta Gain: {1} → {2} Meta per Block";
		Meta = "Meta";
		MetaUnlock = "Unlock for {1}";
		Level = "Level";
		Levels = "Levels";
		EmeraldUpgrades = "Emerald Upgrades";
		AFKMessage = "You will automatically be rejoined each 17 minutes to ensure you won't get kicked for being AFK.";
		FriendMultiMessage = "Invite your friends to increase your Pickaxe Power!";
		NoFriendsHere = "No Friends here, for each friend in the server you get 10% more Pickaxe Power!";
		FriendMulti = "Current Friend Multiplier:\n+{1}% Pickaxe Power";
		Auto = "Auto";
		Pinned = "Pinned";
		Unequip = "Unequip";
		Pin = "Pin";
		Unpin = "Unpin";
		MaxPins = "Max Pins";
		MagicPowerInfo = "Magic Power is given from accessories that you currently have equipped. It makes you stronger in various ways.";
		Craft = "Craft";
		CraftNotification = "You can craft {1} now!";
		PrestigeNotification = "You can now do a Prestige!";
		NoReset = "No Reset";
		Sacrifice = "Sacrifice";
		SacrificeMessage = "Sacrifice resets the same stuff Prestige resets, but you can do it without meeting the money requirement once per hour! You will get {1} Prestige Tokens this Sacrifice.";
		Wait = "Wait";
		ArchivedBlocks = "Archived Blocks";
		CraftingRecommendation = "It is heavily recommended to craft the {1} before anything else!";
		DisableFastFall = "Disable Fast Fall?";
		Claim = "Claim";
		Showcase = "Showcase";
		TotalValue = "Total Value";
		YourPlacement = "Your Placement";
		Top100 = "Top 100";
		Or = "OR";
		MetaUnlockProgress = "{1}/{2} Spent";
		PrestigeMessageFree = "With Prestige you can exchange your Cash for Prestige Tokens and a Cash Boost.";
		PrestigeMessageFreeTokens = "With Prestige you can exchange your Cash for {1} Prestige Tokens and a Cash Boost.";
		PrestigeMessageFreeDaily = "Prestige will reset your Pickaxes, Backpacks, Cash and Blocks, but you will get a Cash Boost and {1} Prestige Tokens, unless you wait {2} then it will only reset your Cash.";
		BuyAll = "Buy All";
		Cooldown = "Cooldown";
		IndexSecretLayer = "Secret | Everywhere";
		BlockRewards = "Like the ores? You can earn 750 Emeralds for every Ore up to Mythic or 3,000 Emeralds per Ethereal+ Ore added to the game. Submit your Ores in the Discord Server under the game's description.";
		LeaderboardProgress = "You are in the Top {1}";
		BlockTagged = "Block is mined by {1}";
		Trading = "Trading";
		LagMessage = "If you are lagging, it is recommended to lower your render distance inside the settings menu.";
		TutorialText2 = "Welcome! Hold on any block to Start Mining. Rarer Blocks sell for more cash. There are many different layers above and below dirt with way more valuable blocks. Their Lobbies have unique upgrades.";
		TutorialText3 = "Welcome! Hold on any block to Start Mining. Rarer Blocks sell for more cash. There are many different layers above and below dirt with way more valuable blocks. Their Lobbies have unique upgrades. Grind the game enough and you will be able to mine 2,000 Blocks Per Second!";
		Undiscovered = "Undiscovered";
		PrestigeMessage = "Prestige will reset your Pickaxes, Backpacks, Cash and Blocks, but you will get a Cash Boost and {1} Prestige Tokens";
		PrestigeMessageBetter = "Prestige only resets Pickaxes, Backpacks, Cash and Blocks, but you will get a Cash Boost and {1} Prestige Tokens. <font color=\"#ff0000\">It will not reset anything else! You will progress a lot faster by doing a Prestige.</font>";
		PrestigeMessageEthereal = "Prestige will reset your Pickaxes, Backpacks, Cash and Blocks <font color=\"#ff0000\">(Not Ethereal+ Blocks!)</font>, but you will get a Cash Boost and {1} Prestige Tokens";
		PrestigeMessageBetterEthereal = "Prestige only resets Pickaxes, Backpacks, Cash and Blocks <font color=\"#ff0000\">(Not Ethereal+ Blocks!)</font>, but you will get a Cash Boost and {1} Prestige Tokens. <font color=\"#ff0000\">It will not reset anything else! You will progress a lot faster by doing a Prestige.</font>";
	};
	Tips = {
		MiningAbilityInactive = "Tip: Strong Mining Abilities are inactive near Spawn!";
		CraftingNote = "Accessories that are too hard for you to craft are hidden. Get stronger and get a bigger backpack and they will unlock.";
		TradingNote = "Blocks that you trade will become archived and will be unable to be sold for cash, but can be used for crafting!";
	};
	Upgrades = {
		BuyAll = "Unlock Buy All";
		KeepBackpack = "Backpack Level to keep on Prestiges";
		MorePickaxePower = "More Pickaxe Power";
		MoreCash = "More Cash";
		JackhammerChance = "Jackhammer Chance";
		JackhammerRadius = "Jackhammer Radius";
		JackhammerSize = "Jackhammer Size";
		MiningSpeed = "Mining Speed";
		MiningFrenzy = "Mining Frenzy after finding an Epic Block";
		ExplosionChance = "Explosion Chance";
		ExplosionRadius = "Explosion Radius";
		TNTLuck = "TNT Luck";
		MiningRange = "Mining Range";
		MiningRange2 = "Mining Range 2";
		UnlockCrafting = "Unlock Crafting";
		MoreAccessorySlots = "More Accessory Slots";
		MoreMeta1 = "More Meta 1";
		MoreMeta2 = "More Meta 2";
		MoreMetaBlocksMined = "More Meta based on Blocks Mined";
		MoreLuck = "More Luck";
		MoreRange = "More Range";
		DuplicateBlocks = "Duplicate Block Chance";
		WalkSpeed = "More Walk Speed";
	};
	UnlockMessages = {
		Prestiges = "Unlocks at {1} Prestiges";
	};
	Rarity = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Ethereal", "Celestial", "Zenith", "Divine", "Nil"};
	Settings = {
		Low = "High Quality";
		LowDesc = "All main blocks of a layer will appear in high quality, this may cause much lag";
		RenderDistance = "Render Distance";
		RenderDistanceDesc = "Change how many chunks you can see in each direction";
		Teleport = "Teleport";
		TeleportDesc = "Friends that you invite will be prompted to be teleported to your current position";
		Music = "Music";
		MusicDesc = "Toggles if music should play or not";
		FastFall = "Fast Fall";
		FastFallDesc = "You will be teleported to the bottom of a hole when falling for a certain amount of time";
		x2Speed = "2x Speed";
		x2SpeedDesc = "Toggles that you walk double as fast as usual";
		x2Jump = "2x Jump";
		x2JumpDesc = "Toggles that you jump double as high as usual";
		Reload = "Reload Chunks";
		ReloadDesc = "You can reload all Blocks incase Glitches occur";
		FastFly = "Fast Fly";
		FastFlyDesc = "You will be teleported to the highest point when using jetpack for a certain amount of time";
		DarkLighting = "Dark Lighting";
		DarkLightingDesc = "Toggles Dark Lighting";
		FriendMarkers = "Friend Markers";
		FriendMarkersDesc = "Toggles Visibility of your Friends";
		BreakingSprites = "Breaking Sprites";
		BreakingSpritesDesc = "Toggles Visibility of the Breaking Sprites while mining Blocks";
		JumpJetpack = "Jump Jetpack";
		JumpJetpackDesc = "You will automatically use the Jetpack while jumping";
		Sounds = "Sounds";
		SoundsDesc = "Toggles if sounds should play or not";
		ChatTags = "Chat Tags";
		AutoRender = "Auto Render";
		AutoRenderDesc = "Automatically lowers render distance if lag is detected";
		BlockStepping = "Block Stepping";
		BlockSteppingDesc = "You automatically step up blocks";
	};
	ChatMessages = {
		BlockFound = "{1} just found {2}";
		MultipleBlocksFound = "{1} just found {2} {3}";
		OreFound = "{1} just found {2} ({3}) in the Layer {4} (1 in {5} Blocks)";
		OreFoundShort = "{1} just found {2} (1 in {3} Blocks)";
		MultipleOresFound = "{1} just found {2} {3} ({4}) in the Layer {5} (1 in {6} Blocks)";
		YouBlockFound = "You just found {1}";
		YouMultipleBlocksFound = "You just found {1} {2}";
		YouOreFound = "You just found {1} ({2}) in the Layer {3} (1 in {4} Blocks)";
		YouOreFoundShort = "You just found {1} (1 in {2} Blocks)";
		YouMultipleOresFound = "You just found {1} {2} ({3}) in the Layer {4} (1 in {5} Blocks)";
		TempMute = "You have been temporarily muted for {1}! Mute ends in {2}";
		PermMute = "You have been permanently muted for {1}!";
		TeleporterDestroyed = "Your Teleporter has been destroyed because a block has been placed on it";
		MiningFrenzy = "Mining Frenzy Activated! You will now mine {1} faster and deal {2} more damage for 1 minute!";
		LikeGoalReached1 = "Like Goal Reached. +25% Mining Speed and +25% Damage for the next {1} minutes.";
		LikeGoalReached2 = "Like Goal Reached. +25% Cash and +25% Damage for the next {1} minutes.";
		IntroMessage1 = "⛏️Each Lobby has its own Unique Feature!⛏️";
		IntroMessage2 = "💎Join the Group & Like the Game for 50% more Cash!💎";
		OreUncovered = "A {1} Ore has just been uncovered!";
		EmeraldUncovered = "An Emerald has just been uncovered!";
		Emerald = "{1} just gifted you {2} Emeralds";
		Gamepass = "{1} just gifted you {2}";
		EmeraldYou = "You just gifted {1} {2} Emeralds";
		GamepassYou = "You just gifted {1} {2}";
		EmeraldOther = "{1} just gifted {2} {3} Emeralds";
		GamepassOther = "{1} just gifted {2} {3}";
		BlockEmeraldsAwarded = "You have been awarded {1} Emeralds for creating ores!";
		UnprocessedBlock = "You received {1} because the server closed.";
		BigCave = "A Big Cave spawned near you!";
	};
	ChatTips = {"Fun Fact: There's a total of {1} Upgrades in this game!", "There are currently {1} unique blocks in the game!", "Most of the game's ores were made by {1} and {2}", "Got stuck? Try doing a Prestige.", "One of the game's devs has the most badges in all of Roblox with 135 Million badges and has hit the limit of how many badges a person can have.", "The rarest block rarity has a 1 in 2,000,000,000 chance of appearing...", "Mining Speed is more useful than initially meets the eye...", "Gifting works across servers, even if the person you're trying to gift to is offline. They just have to have played the game at least once in the past for it to work.", "Autoclickers and Macros are allowed, but exploiting isn't.", "After Unlocking crafting and crafting the Machina Artifact, you can leave the game to automatically grind for you.", "There is a 1 in 10,000 chance of getting this message. Congratulations!"};
	DiscordChatTips = {"If you like the game's ores, you may make your own in the game's Discord Server :)"};
	ServerResponses = {
		Error = "An Error occurred, try again later";
		AppealEmpty = "Appeal cannot be empty";
		AppealInvalidCharacters = "Appeal contains invalid characters";
		AppealTooShort = "Appeal too short";
		AppealTooLong = "Appeal too long";
		AppealTooFast = "You are sending appeals too fast, slow down";
		AppealFiltered = "Appeal has been filtered";
		AppealSuccess = "Appeal successfully sent, we will get back to you soon.";
		ResponseEmpty = "Response cannot be empty";
		ResponseInvalidCharacters = "Response contains invalid characters";
		ResponseTooShort = "Response too short";
		ResponseTooLong = "Response too long";
		ResponseDecision = "You have to select a decision";
		ResponseTooFast = "You are sending responses too fast, slow down";
		ResponseFiltered = "Response has been filtered";
		NotBanned = "This user is not banned";
		AlreadyResponded = "A response to this appeal has already been sent";
		NoData = "This user has no data";
		UnableRespond1 = "Unable to respond to this appeal, please contact a higher rank for assistance";
		UnableRespond2 = "Unable to respond to this appeal, because this user has been super perm banned";
		ResponseSuccess = "Response successfully sent";
		LayerTooPowerful = "The Layer is too powerful, the explosive cannot be placed";
		NoBlocksExploded = "The Explosive did not explode any blocks and has not been charged";
		GiftSuccess = "Your gift for {1} has been successfully sent";
		GiftError = "Your gift for {1} has failed, it will be retried when you rejoin";
		InvalidUser = "Invalid User";
		GiftYourself = "Cannot gift yourself";
		MoveAway = "Move at least 75 Blocks away from spawn.";
	};
	Admin = {
		Appeals = "Appeals";
		NoPendingAppeals = "There are currently no pending appeals.";
		Reload = "Reload";
		LoadingAppeals = "Loading Appeals...";
		SendResponse = "Send Response";
		EnterResponse = "Enter your response to the appeal here";
		Deny = "Deny";
		Accept = "Accept";
		TempBan = "Banned for {1} for \"{2}\"";
		PermBan = "Banned permanently for \"{1}\"";
		SuperPermBan = "Banned super permanently for \"{1}\"";
		Unban = "Unbanned by {1}";
	};
	Ban = {
		AccountBan = "Account Ban";
		Temp = "You have been temporarily banned for {1}!";
		Perm = "You have been permanently banned for {1}!";
		TimeBanned = "Time Banned: {1}";
		BanEnds = "Ban Ends: {1}";
		BanEndsTimer = "Ban Ends in {1}";
		BanEndsNever = "Ban never ends";
		BanEnded = "Ban Ended: {1}";
		AppealMessage = "If you wish to appeal, contact us in the form below.";
		AppealMessageRubenSim = "If you wish to appeal, contact Ruben Sim.";
		AppealSent = "You have sent an appeal, we will get back to you as soon as possible.";
		AppealDenied = "Your appeal has been denied, check messages for more info.";
		AppealAccepted = "Your appeal has been accepted, and you can continue playing.";
		Appeal = "Appeal";
		AppealOnce = "You can only appeal once";
		AppealTextBox = "Enter your appeal here, provide as much detail as possible";
		Send = "Send";
		ViewMessages = "View Messages";
		Messages = "Messages";
		YouWrote = "You Wrote";
		OtherWrote = "{1} Wrote";
	};
	Trading = {
		WaitForPeople = "Waiting for people to trade with...";
		WaitForTradeRequests = "Waiting for Trade Requests...";
		WantsToTrade = "{1} wants to trade with you";
		Accept = "Accept";
		Unaccept = "Unaccept";
		Deny = "Deny";
		EnterAmount = "Enter Amount";
		Confirmation = "Are you sure?";
		NoResults = "No results found.";
		TradeDenied = "{1} denied the Trade!";
		Offering = "Offering {1}";
		Regulations = "Certain Items are disabled due to local regulations.";
		NotAcceptedYet = "Not Accepted yet";
		WaitingForAccept = "Accepted, waiting for you to accept";
		ProcessingIn = "Trade processing in {1} seconds";
		NoItemsAvailable = "No Items availabe for this Trade.";
		NoItemsOffered = "No Items offered.";
		TradeCompleted = "Trade has been completed.";
		TradeFailed = "An Error occurred during the Trade.";
		TradeLimit = "{1}/{2} Trades";
		TradeLimitReset = "Resets in {1}";
	};
	Accessories = {{{
		Name = "Duplici Talisman";
		Desc = "The Duplici Talisman provides an extra {Boost_Dupe} Chance to get an extra block from mining one.";
	}, {
		Name = "Duplici Ring";
		Desc = "The Duplici Ring provides an extra {Boost_Dupe} Chance to get an extra block from mining one.";
	}, {
		Name = "Duplici Relic";
		Desc = "The Duplici Relic provides an extra {Boost_Dupe} Chance to get an extra block from mining one.";
	}, {
		Name = "Duplici Heirloom";
		Desc = "The Duplici Heirloom provides an extra {Boost_Dupe} Chance to get an extra block from mining one.";
	}}, {{
		Name = "Ruber Ring";
		Desc = "The Ruber Ring provides an extra {Boost_RareExplosion} Chance to cause a power 5 explosion when a rare block is mined.";
	}, {
		Name = "Ruber Relic";
		Desc = "The Ruber Relic provides an extra {Boost_RareExplosion} Chance to cause a power 5 explosion when a rare block is mined.";
	}, {
		Name = "Ruber Heirloom";
		Desc = "The Ruber Heirloom provides an extra {Boost_RareExplosion} Chance to cause a power 5 explosion when a rare block is mined.";
	}, {
		Name = "Ruber Chronomicon";
		Desc = "The Ruber Chronomicon provides an extra {Boost_RareExplosion} Chance to cause a power 5 explosion when a rare block is mined.";
	}}, {{
		Name = "Piggy Bank Ring";
		Desc = "The Piggy Bank Ring provides an extra {Boost_Cash} Boost to Cash.";
	}, {
		Name = "Piggy Bank Relic";
		Desc = "The Piggy Bank Relic provides an extra {Boost_Cash} Boost to Cash.";
	}, {
		Name = "Piggy Bank Heirloom";
		Desc = "The Piggy Bank Heirloom provides an extra {Boost_Cash} Boost to Cash.";
	}, {
		Name = "Piggy Bank Chronomicon";
		Desc = "The Piggy Bank Chronomicon is a powerful accessory that provides an extra {Boost_Cash} Boost to Cash. And another 5% Boost to Cash on top of that.";
	}, {
		Name = "Piggy Bank Ascended";
		Desc = "Piggy Bank Ascended is a very powerful accessory that provides an extra {Boost_Cash} Boost to Cash. And another 10% Boost to Cash on top of that.";
	}}, {{
		Name = "Miner's Talisman";
		Desc = "Miner's Talisman is a basic accessory that provides a {Boost_Cash} Boost to Cash and a {Boost_PickaxePower} Boost to Pickaxe Damage.";
	}, {
		Name = "Miner's Ring";
		Desc = "Miner's Ring is an accessory that provides a {Boost_Cash} Boost to Cash and a {Boost_PickaxePower} Boost to Pickaxe Damage.";
	}, {
		Name = "Miner's Relic";
		Desc = "Miner's Relic is an accessory that provides a {Boost_Cash} Boost to Cash and a {Boost_PickaxePower} Boost to Pickaxe Damage.";
	}, {
		Name = "Miner's Heirloom";
		Desc = "Miner's Heirloom is an accessory that provides a {Boost_Cash} Boost to Cash and a {Boost_PickaxePower} Boost to Pickaxe Damage.";
	}, {
		Name = "Miner's Chronomicon";
		Desc = "Miner's Chronomicon is an accessory that provides a {Boost_Cash} Boost to Cash and a {Boost_PickaxePower} Boost to Pickaxe Damage.";
	}, {
		Name = "Miner's World";
		Desc = "Miner's World is an accessory that provides a {Boost_Cash} Boost to Cash and a {Boost_PickaxePower} Boost to Pickaxe Damage. Aswell as {Boost_PrestigeTokens} Prestige Tokens and {Boost_MiningSpeed} Mining Speed. On Fridays and Weekends it doubles Cash and Pickaxe Damage";
	}}, {{
		Name = "Haste Relic";
		Desc = "Haste Relic is an accessory that provides a {Boost_MiningSpeed} Boost to Mining Speed.";
	}, {
		Name = "Haste Heirloom";
		Desc = "Haste Heirloom is an accessory that provides a {Boost_MiningSpeed} Boost to Mining Speed.";
	}, {
		Name = "Haste Chronomicon";
		Desc = "The Haste Chronomicon is a powerful accessory that boosts Mining Speed by {Boost_MiningSpeed}.";
	}, {
		Name = "Haste Ascended";
		Desc = "The Haste Ascended is a very powerful accessory that boosts Mining Speed by {Boost_MiningSpeed}.";
	}, {
		Name = "Haste Eternal";
		Desc = "The Haste Eternal is an extremely powerful accessory that boosts Mining Speed by {Boost_MiningSpeed}.";
	}}, {{
		Name = "Artifact of Speed";
		Desc = "The Artifact of Speed increases your walk speed by {Boost_WalkSpeed} Blocks per Second.";
	}}, {{
		Name = "Crepitus Ring";
		Desc = "The Crepitus Ring is an accessory that has a {Boost_ExtraExplosionRadiusChance} Chance per activation of the Explosion Ability to add +1 to the Radius";
	}, {
		Name = "Crepitus Relic";
		Desc = "The Crepitus Relic is an accessory that has a {Boost_ExtraExplosionRadiusChance} Chance per activation of the Explosion Ability to add +1 to the Radius.";
	}, {
		Name = "Crepitus Heirloom";
		Desc = "The Crepitus Heirloom is an accessory that has a {Boost_ExtraExplosionRadiusChance} Chance per activation of the Explosion Ability to add +1 to the Radius.";
	}, {
		Name = "Crepitus Chronomicon";
		Desc = "The Crepitus Chronomicon is an accessory that has a {Boost_ExtraExplosionRadiusChance} Chance per activation of the Explosion Ability to add +1 to the Radius.";
	}, {
		Name = "Crepitus Max";
		Desc = "The Crepitus Max is an accessory that has a {Boost_ExtraExplosionRadiusChance} Chance per activation of the Explosion Ability to add +1 to the Radius.";
	}}, {{
		Name = "Fragon Artifact";
		Desc = "The Fragon Artifact creates a power 25 explosion when a Mythic Block is mined.";
	}}, {{
		Name = "Bang Ring";
		Desc = "The Bang Ring has a {Boost_LegendaryExplosion} to create a power 17 explosion when a Legendary Block is mined.";
	}, {
		Name = "Bang Relic";
		Desc = "The Bang Relic has a {Boost_LegendaryExplosion} to create a power 17 explosion when a Legendary Block is mined.";
	}, {
		Name = "Bang Heirloom";
		Desc = "The Bang Heirloom has a {Boost_LegendaryExplosion} to create a power 17 explosion when a Legendary Block is mined.";
	}, {
		Name = "Bang Chronomicon";
		Desc = "The Bang Chronomicon has a {Boost_LegendaryExplosion} to create a power 20 explosion when a Legendary Block is mined.";
	}}, {{
		Name = "Radar Talisman";
		Desc = "The Radar Accessory points you towards near Legendary+ ores within {Boost_RadarRadius} Blocks.";
	}, {
		Name = "Radar Ring";
		Desc = "The Radar Accessory points you towards near Legendary+ ores within {Boost_RadarRadius} Blocks.";
	}, {
		Name = "Radar Relic";
		Desc = "The Radar Accessory points you towards near Legendary+ ores within {Boost_RadarRadius} Blocks.";
	}, {
		Name = "Radar Heirloom";
		Desc = "The Radar Accessory points you towards near Legendary+ ores within {Boost_RadarRadius} Blocks";
	}, {
		Name = "Radar Chronomicon";
		Desc = "The Radar Accessory points you towards near Legendary+ ores within {Boost_RadarRadius} Blocks";
	}}, {{
		Name = "Machina Artifact";
		Desc = "This Artifact Automates your mining experience by controlling over your body at your will.";
	}, {
		Name = "Machina of the Second Order";
		Desc = "Upgrades the Auto Mining to mine Legendary+ Ores and increases your walk speed by 100%.";
	}, {
		Name = "Machina of the Third Order";
		Desc = "Upgrades the Auto Mining to mine Rare+ Ores, increases your walk speed by 200% and increases Auto Mine efficiency to 60% from the previous 50%.";
	}, {
		Name = "Machina of the Highest Order";
		Desc = "Upgrades the Auto Mining to mine TNT, increases its efficiency to 100% from the previous 60%, increases your walk speed by 500% and automatically sells your Backpack when it is full up to three times a day.";
	}, {
		Name = "Machina Incarnate";
		Desc = "Upgrades the Auto Mining to mine All Legendary+ Ores regardless of the distance and mining a TNT will give all blocks it explodes.";
	}, {
		Name = "To Account For Every Eventuality";
		Desc = "Upgrades the Auto Mining to instantly mine all Ores from Uncommon to Ethereal which you can mine fast enough and mines TNT from double the distance.";
	}}, {{
		Name = "Malleus Relic";
		Desc = "The Malleus Relic adds a {Boost_JackhammerChance} Chance to Jackhammer.";
	}, {
		Name = "Malleus Heirloom";
		Desc = "The Malleus Heirloom adds a {Boost_JackhammerChance} Chance to Jackhammer.";
	}, {
		Name = "Malleus Chronomicon";
		Desc = "Malleus Chronomicon adds a {Boost_JackhammerChance} Chance to Jackhammer.";
	}, {
		Name = "Malleus Ascended";
		Desc = "Malleus Ascended adds a {Boost_JackhammerChance} Chance to Jackhammer.";
	}}, {{
		Name = "Exitium Heirloom";
		Desc = "The Exitium Heirloom adds a {Boost_ExplosionChance} Chance to Explosion.";
	}, {
		Name = "Exitium Chronomicon";
		Desc = "The Exitium Chronomicon adds a {Boost_ExplosionChance} Chance to Explosion.";
	}, {
		Name = "Exitium Ascended";
		Desc = "The Exitium Ascended adds a {Boost_ExplosionChance} Chance to Explosion.";
	}}, {{
		Name = "Fodienda Talisman";
		Desc = "The Fodienda Talisman increases your Mining Range by {Boost_MiningRange} Blocks.";
	}, {
		Name = "Fodienda Ring";
		Desc = "The Fodienda Ring increases your Mining Range by {Boost_MiningRange} Blocks.";
	}, {
		Name = "Fodienda Relic";
		Desc = "The Fodienda Relic increases your Mining Range by {Boost_MiningRange} Blocks.";
	}, {
		Name = "Fodienda Heirloom";
		Desc = "The Fodienda Heirloom increases your Mining Range by {Boost_MiningRange} Blocks.";
	}, {
		Name = "Fodienda Chronomicon";
		Desc = "The Fodienda Chronomicon increases your Mining Range by {Boost_MiningRange} Blocks.";
	}, {
		Name = "Fodienda Ascended";
		Desc = "The Fodienda Ascended increases your Mining Range by {Boost_MiningRange} Blocks.";
	}}, {{
		Name = "Fortuna Ring";
		Desc = "The Fortuna Ring increases your Luck by {Boost_Luck}.";
	}, {
		Name = "Fortuna Relic";
		Desc = "The Fortuna Relic increases your Luck by {Boost_Luck}.";
	}, {
		Name = "Fortuna Heirloom";
		Desc = "The Fortuna Heirloom increases your Luck by {Boost_Luck}.";
	}, {
		Name = "Mother Fortuna";
		Desc = "The Mother Fortuna increases your Luck by {Boost_Luck}.";
	}}, {{
		Name = "Nuclei Automata Artifact";
		Desc = "Reduces cooldown of explosives by {Boost_ExplosiveCooldownReduction} while you are online.";
	}}, {{
		Name = "Nuclei Potentia Heirloom";
		Desc = "Increases Power of Explosives by {Boost_ExplosiveRadius}.";
	}, {
		Name = "Nuclei Potentia Chronomicon";
		Desc = "Increases Power of Explosives by {Boost_ExplosiveRadius}.";
	}}, {{
		Name = "Nucleu Simul The Final";
		Desc = "Increases Power of Explosives by {Boost_ExplosiveRadius} and reduces cooldown of explosives by {Boost_ExplosiveCooldownReduction} while you are online. This will combine your Nuclei Automata Artifact and Nuclei Potentia Chronomicon into this accessory.";
	}}, {{
		Name = "Auctoritas Relic";
		Desc = "The Auctoritas Relic boosts your Prestige Tokens by {Boost_PrestigeTokens}.";
	}, {
		Name = "Auctoritas Heirloom";
		Desc = "The Auctoritas Heirloom boosts your Prestige Tokens by {Boost_PrestigeTokens}.";
	}, {
		Name = "Auctoritas Chronomicon";
		Desc = "The Auctoritas Chronomicon boosts your Prestige Tokens by {Boost_PrestigeTokens}.";
	}, {
		Name = "Auctoritas Transcended";
		Desc = "The Auctoritas Transcended boosts your Prestige Tokens by {Boost_PrestigeTokens}.";
	}}, {{
		Name = "Ore Vulnus Artifact";
		Desc = "This Accessory mines all ores next to a block that is mined when you can mine the ores fast enough.";
	}}, {{
		Name = "Sinum Ring";
		Desc = longstring1;
	}, {
		Name = "Sinum Relic";
		Desc = longstring1;
	}}, {{
		Name = "Ruptis Artifact";
		Desc = "With the Ruptis Artifact explosions caused by Ethereal+ Ores award you the blocks it explodes.";
	}}, {{
		Name = "Mobilitas Ultima";
		Desc = "Mining a Rare Ore will cause a power 6 explosion, mining a Legendary Ore will cause a power 20 explosion, mining a Mythic Ore will cause a power 33 explosion, you will get all blocks exploded by Ethereal+ Ores and mining Emeralds will cause a power 17 explosion. This will combine your Ruber Chronomicon, Fragon Artifact, Bang Chronomicon and Ruptis Artifact into this accessory.";
	}}, {{
		Name = "Magicae Talisman";
		Desc = "This accessory gives {Boost_LocalMagicPower} more Magic Power than usual accessories of this rarity.";
	}, {
		Name = "Magicae Ring";
		Desc = "This accessory gives {Boost_LocalMagicPower} more Magic Power than usual accessories of this rarity.";
	}, {
		Name = "Magicae Relic";
		Desc = "This accessory gives {Boost_LocalMagicPower} more Magic Power than usual accessories of this rarity.";
	}, {
		Name = "Magicae Heirloom";
		Desc = "This accessory gives {Boost_LocalMagicPower} more Magic Power than usual accessories of this rarity.";
	}, {
		Name = "Magicae Chronomicon";
		Desc = "This accessory gives {Boost_LocalMagicPower} more Magic Power than usual accessories of this rarity.";
	}}};
	Blocks = {"Dirt", "Sand", "Silt", "Clay", "Loam", "Peat", "Chalk", "Compost", "Gravel", "Entisols", "Aridisols", "Inceptisols", "Gelisols", "Jermanite", "Packed Dirt", "Roots", "Fungus", "Mushrooms", "Potatoes", "Beets", "Parsnips", "Ginger", "Turmeric", "Gophers Tunnel", "Moles", "Mollisols", "Broken Pottery", "Time Capsule", "Packed Mud", "Compact Mud", "Water Deposited Mud", "Plant Mud", "Wheel", "Mud Town", "Dirty Mud", "Skeleton", "Treasure", "Alien Mud", "Nokia", "Nuclear Waste", "Oil Deposit", "Motor Oil", "Prehistoric Mud", "Dense Dirt", "Garlic", "Radish", "Yucca", "Jicama", "Ants", "Bugs", "Jerusalem Crickets", "Millipedes", "Termites", "Broken Weapons", "Old Coins", "Arrow Tips", "Bones", "Ancient Artifact", "Mud", "Grassy Mud", "Fungi Mud", "Tilled Mud", "Plant Rooted Mud", "Infected Mud", "Sun-receiving Mud", "Tree Rooted Dirt", "Trash Infected Mud", "Mega Dirt", "Spider Nested Mud", "Rubber Duck Mud", "Paper Mud", "Package Mud", "Stone", "Flint", "Coquina", "Dolomite", "Travertine", "Tufa", "Oolite", "Brecca", "Conglomerate", "Caliche", "Sandstone", "Siltstone", "Diatomite", "Halite", "Crystal", "Deep Grass", "Dead Grass", "Wet Grass", "Fertile Grass", "Patchy Grass", "Frozen Grass", "Cracked Grass", "Fake Grass", "Rooted Grass", "Seeded Grass", "Alien Grass", "Moon's Grass", "Worm Grass", "Touched Grass", "Crater", "Packed Stone", "Marble", "Novaculite", "Quartzite", "Skarn", "Gneiss", "Amphibolite", "Hornfels", "Slate", "Schist", "Phyllite", "Soapstone", "Anthracite", "Mariposite", "Verdite", "Lapis Lazuli", "Grass", "Fescue", "Moneywort", "Quack Grass", "Goose Grass", "Patch of Grass", "Dallis Grass", "Horsetail", "Italian White", "Mallow", "Witch Grass", "Speedwell", "Young Plant", "Yarrow", "Dandelions", "Four Leaf Clovers", "Dense Stone", "Diorite", "Andesite", "Rhyolite", "Granite", "Pegmatite", "Gabbro", "Diabase", "Basalt", "Plagioclase", "Diacite", "Stealth Copper", "Tuff", "Bastneasite", "Fire Opal", "Sky", "White Cloud", "Light Gray Cloud", "Dark Gray Cloud", "Airplane", "Kite", "Bird", "Private Jet", "Weather Balloon", "Helicopter", "Blimp", "Military Helicopter", "Thunderstorm", "Tornado", "Volcano", "Obsidian", "Salaxum", "Baxerite", "Suprecerese", "Vehicular Salaxum", "Deconogaron", "Bauxite", "Scriolin", "Peragomite", "Muosic Obsidian", "Lascero Lamenta", "Rainbow Obsidian", "Xenotime", "Monazite", "High Sky", "Jet Contrails", "Sun Rays", "Thin Clouds", "Drone", "Mega Cloud", "Foggy Atmosphere", "Falling Space Junk", "Solar Eclipse", "Rocket", "UFO", "Aurora Borealis", "Glowing Clouds", "Firmament", "Molten Obsidian", "Silia", "Emberium", "Flamespawn", "Shimicala", "Graeconogaron", "Geris", "Pyrrhomomite", "Dotorite", "Centromodor", "Vaporeyester", "Blazestone", "Terracite", "Magmaium", "Space", "Red Star", "Orange Star", "The Sun", "Meteor", "Asteroid", "Moon", "Dwarf Planet", "Satellite", "Planet", "Comet", "Planet Ring", "The ISS", "Oumuamua", "Lava", "Reinforced Basalt", "Scoria", "Pumice", "Solid Lava", "Divenestium", "Stellan", "Byrrzome", "Xapotote", "Gnixon", "Polonite", "Heart of Fire", "Embedded Sun", "Hell", "Radioactive Stone", "Uranium", "Uraniumite", "Gamite", "Moptazik", "Paretium", "Limioactive", "Ratiteium", "Zoniumite", "Whihite", "Adsimite", "Prenium", "Legenium", "Limonion", "Toxic Obsidian", "Crushed Rock", "Oil Waste", "Hardened Core", "Cracked Bones", "Artificial Cube", "Cracked Waste", "Prehistoric Bot Remnant", "Lava Shards", "Molten Debris", "Red Beryl", "Painite", "Ancient Tool", "Sun Crystal", "Hyperpressurized Waste", "Frost Waste", "Toxic Lava", "Thorium Dioxite", "Silica", "Turbulent Ash", "Pyroclast", "Irradiated Dacite", "Topzite", "Cobalt", "Petrified Wavellite", "Deep Dirt", "Deformed Nephrite", "Legrandite", "Toximite", "Polonium", "Astatine", "Boiling Lava", "Aluminum", "Fulocite", "Telbar", "Mercury", "Phigarium", "Rizufide", "Jagdite", "Yulacite", "Vaxium", "Farlicin", "Derilium", "Birucite", "Sacreoxyn", "Wasecraesiel", "The Leviathan Crystal", "Outer Core", "Riljud", "Carzyum", "Selorus", "Foxrophine", "Incindirum", "Ectoplasm", "Saffron", "Subsinite", "Aluhargium", "Parchium", "Zanforn-88", "Tarrulum", "K4R-UL-1UM", "Jyrulphasion", "ELEMENT TON-618", "Middle Core", "Soultriek", "Rejewel", "Jokerium", "Unpure Hydrogen", "Darnite", "Aethernum", "Macabrium", "Aunolite", "Fernokajin", "Netherite", "Tightly Packed Nickel", "Strange Alloy", "Jeweled Lamenta", "Cobalt Thorium G", "Fingerite Remnants", "Inner Core", "Glimmering Iron Ore", "Oxygenanium", "Glimmering Silver Ore", "Compressed Hydrogen", "Lavanium", "Meltor", "Glimmerium", "Grainium", "Primorial Rock", "Overglimmering Volcanic Ash", "Magmorthum", "Normalium", "Alloy Ore", "The Central", "Impossible Plasma", "Deep Space", "Dark Matter", "Black Hole", "Planet Remnant", "Galaxy", "Star Remnant", "Arcanum", "Neutron Star", "Galactic Opal", "Metelum", "Rogue Civilized Object", "Skrep", "Green Comet", "Litorp", "Microspobic Speck", "Black Dwarf", "White Hole", "Quasi-star", "Moon Stone", "Lunarium", "Moon Crystals", "Selene Ore", "Lunarite", "Stardust Crystal", "Celestial Quartz", "Lunaris Ore", "Astralium", "Moon Soul", "Lunar Amethyst", "Lunarite Essence", "Lunarflame Ore", "Moonshadow Crystal", "Lunarisium", "Solarmoon Essence", "Death Star", "Asteroid Belt", "Basalt Chunk", "Celestium Ore", "Nickel Nugget", "Meteoroid", "Cobalt Vein", "Platinum Fragment", "Iridium Cluster", "Meteor Gem", "Xenon Crystal", "Void Crystal", "Gravitonium", "Cosmic Core", "Star Ruby", "Singularity Stone", "Landscape", "Atmospheric Concentrator", "Sands Of Time", "Pure Hypercompressed Neutronium", "Plasma Core", "Subspace Tripmine", "Chronos", "Many Nights Skies", "Chromalite", "Thunderium", "Seraph", "Lavaspite", "Dragon Glass", "Voidstone", "Zycrite", "Draconium", "Frosted Diamonds", "Flaming Hate", "Wijkuled", "Gustavon", "Molten Shard", "Blaze Glass", "Hell's Prison", "Astral Fire", "Rohoccaim", "Pyrite", "Sunstone", "Burning Memory", "Cracked Molten Ruby", "Distortion", "Radium", "Oganesson", "Kryptonite", "Ewudojjed", "Mobile Phone", "Circuit", "Actinium", "Plutonium", "Thorium", "Cherenkov Crystal", "Stationary", "Uranium Hexafloride", "Plasma", "Soulsand", "Zefendite", "Ignisaxum", "Arctic Frost", "Gaseous Iron", "Thorned Bloomstone", "Fire Spider", "Ulewuthaim", "Fallen Star", "Kyawthuite", "Uru", "Koiksxolaim", "Arras", "Anomaly", "Color Overdrive", "Cupola", "Aetherium Crystal", "Blessed Ore", "Celestium", "Chained Devil", "Compute Binaric Datacrite", "Fleeting Hope Final", "Galaxium", "Eternium", "Genesium", "Greyscale Sword and the Stars", "Lavaxite Prism", "Plasma Fire", "Waterium Anchorage", "TURMOILED", "Toerium", "Thefaimnilnilnil", "Tesseract Core", "Nocturnis", "Antique Energy", "Burning Entity", "Cometium", "Zero", "Gideon", "Line Stone", "Trianglium", "Squarite", "Circlite", "Kiteanium", "Ovalium", "Trapezide", "Octagonium", "Pentagrium", "Hexagrite", "Crosilite", "Loveilite", "Snowtanium", "Cindrillium", "Wedgilite", "Spherite", "Pi Circumferencium", "Starlite", "Trishatterite", "Geometrilekenic Core", "N-Gon", "Eclipsera", "Iridanyte", "Starsearite", "Gravonyx", "Solenyte", "Eclipseron", "Scrapyx", "Noctyrite", "Cosmaril", "Umbryx", "Astralyth", "Aetherion", "Aeronyx", "Nimbryl", "Solarium Ore", "Zephyrosite", "Tempestralith", "Stratonium", "Breezium", "Ventryx", "Voltacite", "Celestara", "Skynexium", "Verdanyte", "Floracite", "Elarion", "Sylvanyth", "Xylogranite", "Ambryth", "Druanite", "Terravine", "Gaialite", "Claythium", "Loamyx", "Sedryx", "Rubrath", "Shalorite", "Terralyth", "Myrstone", "Tynarite", "Geodyne", "Aurivine", "Terracron", "Gravellium", "Ferronyx", "Crimora", "Amarion", "Compaxite", "Bronzium", "Slathem", "Rubrasyte", "Obryx Opal", "Obdurium", "Argenyx", "Onythera", "Rubraxis", "Noctyra", "Umbrosite", "Plumbryn", "Malacitea", "Saphyros", "Drakonyx", "Lithyrium", "Zyntherium", "Topazryn", "Hemovyr", "Volcarion", "Tungryth", "Jadyx", "Garnyros", "Nihytrite", "Chasmite", "Volcrys", "Obrythite", "Pyrelith", "Ignarion", "Magmoryx", "Flarecryst", "Radionyx", "Uvyrite", "Venomyth", "Corrosyte", "Scaldyrium", "Corethium", "Magnyte", "Pyrothyst", "Infernox", "Ignirion", "Deephyros", "Solaryx", "Magmyra", "Aeonsteel", "Nyxium", "Nebryx", "Cosmyth", "Lunarisite", "Selestium", "Celesthyne", "Rectite", "Calcynite", "Venus Stone", "Sulvaris", "Bloom Quartz", "Venite", "Scorched Glass", "Erosine", "Amber Vein Ore", "Fumarite Pearl", "Venerian Orixio", "Crimson Halo", "Valenite", "Ashen Bloomstone", "Shythereon", "Guilded Vapora", "Seraphic Glass", "Venalight", "Auric Flame Shard", "Eclipsera Gem", "Solenvy", "Thorned Halo", "Astral Vein", "Tartarium", "Mercury Stone", "Ferrite", "Ashenil Goethe", "Mercyrosite", "Scorched Basalt", "Eminescu", "Cindermark Ore", "Volcaryn", "Abedin Crater", "Flaresteel", "Radiolyte", "Ignilite Vein", "Auralith", "Sunfire Glass", "Caloris Basin", "Coronathium", "Vulcanite Prime", "Rembrandt Basin", "Heliarchite", "Tolstoj", "Reinhardt Core", "Stilbon", "Sun Surface", "Prominence", "Ember Glass", "Solar Ash", "Coronal Hole", "Photosphere", "Chromosphere", "Photonyx", "Thermite Vein", "Sunveil Quartz", "Ignis Shard", "Helios Dust", "Solaris Corestone", "Cinderlight Gem", "Aureflame Alloy", "Prometheon", "Radiant Solinium", "Aurora Pyrite", "Crown of Dawn", "Infernal Prism", "Flare", "Eternal Solflare", "Beethoven's Silence", "Back there Benjamin", "110011 1010010 1010010 110000 1010010 101110 110100 110000 110100", "Prismatic Quasar", "Umhullt von Leiden", "Jacob's descent into Eternity", "ΒΞDRΩCK", "fαтє", "Destiny marches, like any Man", "E̶͐́l̸̆̊ė̷͙p̷͒̍h̷͂͝ǎ̴̿n̶̛t's Foot", "αи∂яσмє∂α", "Monocrite Abyss", "Look beyond the   ̶C̶U̶R̶T̶A̶I̶N̶  Inferno", "你聽到了嗎？？？？？？？？？", "The Solids God of Geometric Mathematics", "Sunburst Vein", "Pure Divinity", "Alternate Plane", "TUDOL", "Sun Nucleus", "Subsurface Hydrogen", "Coregrit", "Solar Slag", "Quadium Hydrogen", "Tachocline", "Helion Glass", "Plasmirum", "Irradite", "Photovite", "Helicorite", "Starbone", "Infernic Alloy", "Solatrix", "Luminforge Crystal", "Coronaith", "Vermion", "Pyrosoul Gem", "Stellarium", "Gemisis", "Solheart", "Dimensional Objects", "Ultimatum", "Pure Sanctarite", "Hsixia", "TERRARVM", "Odyssey", "Made in Heaven", "Ballic Wrath", "Φοβος", "Apocrypha", "Suprarational Mark", "Fasaria", "→ Aurora ⇋ The ⇋ Final ←", "《『R』『E』『V』『E』『L』『A』『T』『I』『O』『N』》", "Ex Machina Penultimate", "『Ｉｎｄｅｘ』『Ｄｅｉ』『ｌａｔｅｎ』", "Mars Stone", "Rustrock", "Dustbound Ore", "Redstone", "Gravellite", "Ferrinite", "Cinderplate", "Terracline", "Oxidulite", "Martenglass", "Crimson Alloy", "Roubion Core", "Volcarite", "Sangrelite", "Ironshade Crystal", "Martian Soulstone", "Dustforged Titanite", "Redquake Ruby", "Arescore", "Vermillion Cube", "Borealis Water", "Deimos Seraphite", "Phobos", "JeremyDevs", "『Ｏｎｃｅ』『Ｂｙ』『Ｈｕｍａｎ』", "Jupiter Gas", "Presurized Hydrogen", "Jupiter Rock", "Metallic Hydrogen", "Trapped Storm", "Pressure Fog", "Ionized Hydrogen", "Charged Ammonia", "Aurora Plume", "Cyclone Vapor", "Methanic Surge", "Crashed Probe", "Jovian Essence", "Jupiter Station", "Stormbound Plasma", "Great Red Vapor", "Great Aurorae", "Europa", "Zeus' Dominion", "Convergence", "Enchantment", "Cosmic Satellites", "Athanatos", "Saturn Gas", "Helium Drift", "Cold Rings", "Golden Haze", "Ringborne", "Frozen Ammonia", "Cryo Fog", "Outermost Ring Rock", "Pressure Silk", "Bandstorm Cloud", "Methane Veil", "Karma & Time", "Ringlight Essence", "Kronos", "Silent Tempest", "Crown Cloud of Saturn", "Golden Jetstream", "David's Ore", "Star of Remphan", "Elder Atmos", "Monochromatic Density", "Polychroma Wires", "Titanos Core", "Contraption", "Scrap Plating", "Iron Wiring", "Rustbound Alloy", "Gearstone", "Circuit Ore", "Steel Lattice", "Pulse Conduit", "Mechasil", "Logic Crystal", "Servo Core", "Binary Alloy", "Neural Matrix", "Chrono Gear", "Synthetic Soulstone", "Planetary Engine Fragment", "Omnicore Alloy", "Machina Heartsteel", "Deus Mechanica", "Singularity Processor", "Axiom Engine", "Ghostcode Prism", "The Prime Directive", "Uranus Gas", "Pale Methane", "Frosted Vapor", "Cloud Drift", "Glacial Mist", "Icy Whorl", "Cryo Shroud", "Blue Haze", "Tilted Flow", "Polar Shiver", "Methane Frostveil", "Frozen Jetstream", "Aurora Stream", "Shimmering Frostwind", "Silent Cyclone", "Titanic Breeze", "Ethereal Spiral", "Frozen Halo", "Celestial Chill", "Primal Icelock", "Ethereality", "Aether Mist", "Uranus Core", "『Dʏꜱꜰᴜɴᴄᴛɪᴏɴᴀʟ』『Aʙᴇʀʀᴀᴛɪᴏɴ』", -- : First try: K:0: attempt to index nil with 't'
;
	Explosives = {"Dynamite", "Bomb", "C4", "TNT", "Missile", "Nuke", "Tsar Bomb", "Neutron Bomb", "Antimatter Bomb"};
	Leaderboards = {"Most Cash", "Most Blocks Mined", "Most Time Played", "Most Blocks Discovered", "Most Prestiges", "Most Prestige Tokens", "Most Robux Spent"};
	Gamepasses = {
		x2Cash = "2x Cash";
		x2CashDesc = "Doubles all your Cash income";
		x2Emerald = "2x Emerald";
		x2EmeraldDesc = "Doubles the Emeralds you get from an Emerald Ore";
		SharperPickaxes = "Sharper Pickaxes";
		SharperPickaxesDesc = "All Pickaxes will be 10% more powerful";
		x2PickaxePower = "2x Pickaxe Power";
		x2PickaxePowerDesc = "Doubles Power of all Pickaxes";
		x2MiningSpeed = "2x Mining Speed";
		x2MiningSpeedDesc = "Doubles your Mining Speed";
		x2Storage = "2x Storage";
		x2StorageDesc = "Doubles your Backpack Storage";
		InfiniteBackpack = "Infinite Backpack";
		InfiniteBackpackDesc = "Your Backpack Storage will become Infinite";
		Teleporter = "Teleporter";
		TeleporterDesc = "Gives you a teleporter which you can place anywhere and teleport to at any time. Additionally makes all Lobby Teleports free";
		VIP = "VIP";
		VIPDesc = "You will unlock a VIP exclusive Pickaxe, Backpack and Chat Tag. Additionally you get more Emeralds from purchases";
		x2Speed = "2x Speed";
		x2SpeedDesc = "Allows you to walk 2x faster than usual";
		x2Jump = "2x Jump";
		x2JumpDesc = "Allows you to jump 2x higher than usual";
		Jetpack = "Jetpack";
		JetpackDesc = "Unlocks jetpack which allows you to fly";
		MoreRange = "More Range";
		MoreRangeDesc = "Increases Mining Range by +5 Blocks";
	};
	Quests = {"Mine {1} {2}", "Mine {1} {2} Blocks", "Mine {1} Blocks", "Mine {1} Ores", "Dig to {1} Depth", "Equip Pickaxe #{1} or better", "Equip Backpack #{1} or better", "Use {1} Explosive"};
	TranslatorSettings = {
		Locale = "en";
		Seperator = ',';
		Decimal = '.';
		TimeAbbreviations = {'s', 'm', 'h', 'd', 'y'};
		Translator = 876723688;
	};
}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.NotificationSubSystem
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:04
-- Luau version 6, Types version 3
-- Time taken: 0.003497 seconds

local TweenService_upvr = game:GetService("TweenService")
local module_2 = {}
local tbl_upvr_2 = {}
tbl_upvr_2.__index = tbl_upvr_2
local tbl_upvr = {}
tbl_upvr.__index = tbl_upvr
function module_2.bind(arg1) -- Line 16
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	local module = {}
	module.UI = arg1
	module.Scaling = 10
	return setmetatable(module, tbl_upvr_2)
end
module_2.default = setmetatable({
	UI = game.Players.LocalPlayer.PlayerGui:WaitForChild("Game").Notifications;
	Scaling = 10;
}, tbl_upvr_2)
function tbl_upvr_2.create(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 25
	--[[ Upvalues[2]:
		[1]: TweenService_upvr (readonly)
		[2]: tbl_upvr (readonly)
	]]
	local TextLabel = Instance.new("TextLabel")
	TextLabel.BorderSizePixel = 0
	TextLabel.BackgroundTransparency = 1
	TextLabel.Text = arg2
	TextLabel.TextColor3 = arg3
	TextLabel.Font = arg4
	TextLabel.TextScaled = true
	TextLabel.ZIndex = 200
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Thickness = 4
	UIStroke.Color = Color3.fromRGB(15, 15, 15)
	UIStroke.Parent = TextLabel
	if arg6 then
		for _, v in ipairs(arg6) do
			v.Parent = TextLabel
		end
	end
	TextLabel.TextTransparency = 1
	TextLabel.Size = UDim2.new(1, 0, 1 / arg1.Scaling, 0)
	TweenService_upvr:Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		TextTransparency = 0;
	}):Play()
	local setmetatable_result1 = setmetatable({
		Text = TextLabel;
	}, tbl_upvr)
	if arg5 then
		setmetatable_result1:Stop(arg5)
	end
	TextLabel.Parent = arg1.UI
	return setmetatable_result1
end
function tbl_upvr.Stop(arg1, arg2) -- Line 64
	--[[ Upvalues[1]:
		[1]: TweenService_upvr (readonly)
	]]
	if arg2 then
		task.defer(function() -- Line 67
			--[[ Upvalues[2]:
				[1]: arg2 (readonly)
				[2]: arg1 (readonly)
			]]
			local wait = task.wait
			if not wait then
				wait = wait
			end
			wait(arg2)
			arg1:Stop()
		end)
	else
		local any_Create_result1 = TweenService_upvr:Create(arg1.Text, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			TextTransparency = 1;
		})
		any_Create_result1:Play()
		any_Create_result1.Completed:Wait()
		local any_Create_result1_2 = TweenService_upvr:Create(arg1.Text, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			Size = UDim2.new(1, 0, 0, 0);
		})
		any_Create_result1_2:Play()
		any_Create_result1_2.Completed:Wait()
		arg1.Text:Destroy()
	end
end
return module_2


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.PopupHandler
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:05
-- Luau version 6, Types version 3
-- Time taken: 0.002373 seconds

local Short_upvr = require(game.ReplicatedStorage.Modules.Short)
local default_upvr = require(game.ReplicatedStorage.Modules.NotificationSubSystem).default
function CreatePopup(arg1) -- Line 7
	--[[ Upvalues[2]:
		[1]: Short_upvr (readonly)
		[2]: default_upvr (readonly)
	]]
	local var3
	if type(var3) == "table" then
		var3 = string.format(arg1[1], Short_upvr.en(arg1[2]))
	else
		var3 = arg1
	end
	default_upvr:create(var3, Color3.fromRGB(255, 255, 255), Enum.Font.FredokaOne, 4)
end
return function(arg1) -- Line 18
	local var5
	if game:GetService("RunService"):IsClient() then
		var5 = game.Players.LocalPlayer
	end
	if var5 == nil then
	else
		coroutine.wrap(function() -- Line 24
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			CreatePopup(arg1)
		end)()
	end
end


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Networking
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:06
-- Luau version 6, Types version 3
-- Time taken: 0.011881 seconds

local module = {}
local RemoteEvent_upvr = game.ReplicatedStorage.RemoteEvent
local tbl_upvr = {}
function module.Invoke(arg1, ...) -- Line 6
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: RemoteEvent_upvr (readonly)
	]]
	local var5_upvw
	while tbl_upvr[var5_upvw] do
		var5_upvw = string.pack('I', math.min(math.random() * 4294967295, 4294967294))
	end
	tbl_upvr[var5_upvw] = true
	local module_2_upvw = {}
	local BindableEvent_upvr = Instance.new("BindableEvent")
	local var9_upvw
	var9_upvw = RemoteEvent_upvr.OnClientEvent:Connect(function(arg1_2, ...) -- Line 16
		--[[ Upvalues[4]:
			[1]: var5_upvw (read and write)
			[2]: var9_upvw (read and write)
			[3]: module_2_upvw (read and write)
			[4]: BindableEvent_upvr (readonly)
		]]
		if arg1_2 ~= var5_upvw then
		else
			var9_upvw:Disconnect()
			module_2_upvw = {...}
			BindableEvent_upvr:Fire()
		end
	end)
	RemoteEvent_upvr:FireServer(var5_upvw, arg1, ...)
	BindableEvent_upvr.Event:Wait()
	BindableEvent_upvr:Destroy()
	tbl_upvr[var5_upvw] = nil
	pcall(task.cancel, task.spawn(function() -- Line 23
		--[[ Upvalues[2]:
			[1]: var9_upvw (read and write)
			[2]: BindableEvent_upvr (readonly)
		]]
		task.wait(10)
		pcall(function() -- Line 25
			--[[ Upvalues[1]:
				[1]: var9_upvw (copied, read and write)
			]]
			var9_upvw:Disconnect()
		end)
		BindableEvent_upvr:Fire()
	end))
	return table.unpack(module_2_upvw)
end
function module.Fire(arg1, ...) -- Line 37
	--[[ Upvalues[1]:
		[1]: RemoteEvent_upvr (readonly)
	]]
	RemoteEvent_upvr:FireServer("\xFF\xFF\xFF\xFF", arg1, ...)
end
local tbl_upvr_2 = {}
function module.Received(arg1, arg2) -- Line 42
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	if type(arg1) ~= "string" or type(arg2) ~= "function" then
	else
		local var16 = tbl_upvr_2[arg1]
		if not var16 then
			var16 = {}
			tbl_upvr_2[arg1] = var16
		end
		table.insert(var16, arg2)
	end
end
local tbl_upvr_3 = {}
local function RunCallback_upvr(arg1, arg2) -- Line 54, Named "RunCallback"
	--[[ Upvalues[2]:
		[1]: tbl_upvr_2 (readonly)
		[2]: tbl_upvr_3 (readonly)
	]]
	local var26 = tbl_upvr_2[arg1]
	local var27
	if not var26 then
		return true
	end
	local var28 = tbl_upvr_3[arg1]
	if var28 then
		var27 = var28(var27)
	end
	if type(var27) ~= "table" then
	else
		for _, var23_upvr in var27 do
			for _, var25_upvr in var26 do
				task.spawn(function() -- Line 65
					--[[ Upvalues[2]:
						[1]: var25_upvr (readonly)
						[2]: var23_upvr (readonly)
					]]
					var25_upvr(table.unpack(var23_upvr))
				end)
			end
		end
	end
end
local tbl_upvr_5 = {}
local var31_upvw
local var32_upvw = false
local function _() -- Line 76, Named "CreateUnhandledChecker"
	--[[ Upvalues[4]:
		[1]: var31_upvw (read and write)
		[2]: tbl_upvr_5 (readonly)
		[3]: RunCallback_upvr (readonly)
		[4]: var32_upvw (read and write)
	]]
	if var31_upvw then
	else
		var31_upvw = game:GetService("RunService").RenderStepped:Connect(function() -- Line 78
			--[[ Upvalues[4]:
				[1]: tbl_upvr_5 (copied, readonly)
				[2]: RunCallback_upvr (copied, readonly)
				[3]: var32_upvw (copied, read and write)
				[4]: var31_upvw (copied, read and write)
			]]
			local var34
			while var34 <= #tbl_upvr_5 do
				local var35 = tbl_upvr_5[var34]
				if os.clock() < var35[3] + var35[4] + 1 then
					var34 += 1
				elseif RunCallback_upvr(var35[1], var35[2]) then
					if not var32_upvw then
						var35[3] = os.clock() + 1
					else
						var35[4] += 1
						if 10 <= var35[4] then
							table.remove(tbl_upvr_5, var34)
						else
							var34 += 1
						end
					end
				else
					table.remove(tbl_upvr_5, var34)
				end
			end
			if var34 == 1 then
				var31_upvw:Disconnect()
				var31_upvw = nil
			end
		end)
	end
end
local tbl_upvr_4 = {
	SetPosition = 1;
	ChunkChanged = 2;
}
RemoteEvent_upvr.OnClientEvent:Connect(function(arg1) -- Line 113
	--[[ Upvalues[5]:
		[1]: tbl_upvr_4 (readonly)
		[2]: RunCallback_upvr (readonly)
		[3]: tbl_upvr_5 (readonly)
		[4]: var31_upvw (read and write)
		[5]: var32_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if type(arg1) ~= "table" then
	else
		for i, v in arg1 do
			table.insert({}, {i, v})
			local var56
		end
		table.sort(var56, function(arg1_3, arg2) -- Line 121
			--[[ Upvalues[1]:
				[1]: tbl_upvr_4 (copied, readonly)
			]]
			local var58
			if (tbl_upvr_4[arg1_3[1]] or math.huge) >= (tbl_upvr_4[arg2[1]] or math.huge) then
				var58 = false
			else
				var58 = true
			end
			return var58
		end)
		for _, v_2 in var56 do
			if RunCallback_upvr(v_2[1], v_2[2]) then
				table.insert(tbl_upvr_5, {v_2[1], v_2[2], os.clock(), 0})
				if var31_upvw then
				else
					var31_upvw = game:GetService("RunService").RenderStepped:Connect(function() -- Line 78
						--[[ Upvalues[4]:
							[1]: tbl_upvr_5 (copied, readonly)
							[2]: RunCallback_upvr (copied, readonly)
							[3]: var32_upvw (copied, read and write)
							[4]: var31_upvw (copied, read and write)
						]]
						local var61
						while var61 <= #tbl_upvr_5 do
							local var62 = tbl_upvr_5[var61]
							if os.clock() < var62[3] + var62[4] + 1 then
								var61 += 1
							elseif RunCallback_upvr(var62[1], var62[2]) then
								if not var32_upvw then
									var62[3] = os.clock() + 1
								else
									var62[4] += 1
									if 10 <= var62[4] then
										table.remove(tbl_upvr_5, var61)
									else
										var61 += 1
									end
								end
							else
								table.remove(tbl_upvr_5, var61)
							end
						end
						if var61 == 1 then
							var31_upvw:Disconnect()
							var31_upvw = nil
						end
					end)
				end
			end
		end
	end
end)
local DataModule_upvr = require(game.ReplicatedStorage.Modules.DataModule)
task.spawn(function() -- Line 133
	--[[ Upvalues[2]:
		[1]: DataModule_upvr (readonly)
		[2]: var32_upvw (read and write)
	]]
	var32_upvw = true
end)
return module


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.SharedFunctions
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:07
-- Luau version 6, Types version 3
-- Time taken: 0.051575 seconds

local module_upvr = {}
local GameDefinition_upvr = require(game.ReplicatedStorage.Modules.GameDefinition)
local FormulaHandler_upvr = require(game.ReplicatedStorage.Modules.FormulaHandler)
local SecretOres_upvr = GameDefinition_upvr.SecretOres
local Ores_upvr = GameDefinition_upvr.Ores
local LowestDepth_upvr = GameDefinition_upvr.LowestDepth
local HighestDepth_upvr = GameDefinition_upvr.HighestDepth
local any_IsServer_result1_upvr_2 = game:GetService("RunService"):IsServer()
local var25_upvr = #SecretOres_upvr + 8
local BaseBlocks_upvr = GameDefinition_upvr.BaseBlocks
local var27_upvw
local DataModule_upvr = require(game.ReplicatedStorage.Modules.DataModule)
function module_upvr.GenerateBlock(arg1, arg2, arg3, arg4, arg5, arg6, arg7) -- Line 18
	--[[ Upvalues[10]:
		[1]: Ores_upvr (readonly)
		[2]: LowestDepth_upvr (readonly)
		[3]: HighestDepth_upvr (readonly)
		[4]: any_IsServer_result1_upvr_2 (readonly)
		[5]: module_upvr (readonly)
		[6]: var25_upvr (readonly)
		[7]: BaseBlocks_upvr (readonly)
		[8]: SecretOres_upvr (readonly)
		[9]: var27_upvw (read and write)
		[10]: DataModule_upvr (readonly)
	]]
	local any_NextNumber_result1 = Random.new(arg4):NextNumber()
	if any_NextNumber_result1 < arg6 then
		return 2044
	end
	local var93 = any_NextNumber_result1 - arg6
	if var93 < arg5 * 1.111 then
		local var94 = var93 / arg5
		local var95 = 1
		local const_number_3 = 0.111
		if const_number_3 > var94 then
			var95 += 1
			local var97 = const_number_3 - 0.1
			if var97 > var94 then
				var95 += 1
				if var97 - 0.010000000000000002 > var94 then
					var95 += 1
				end
			end
		end
		local var99 = Ores_upvr[math.clamp(arg2, LowestDepth_upvr, HighestDepth_upvr)]
		local var100 = var99[math.min(var95, #var99)]
		return var100[math.floor(var93 * 9007199254740992) % #var100 + 1]
	end
	if any_IsServer_result1_upvr_2 then
		local var101 = math.random() * (1 - arg5 * 1.111 - arg6)
		if var101 < arg7 then
			return 2045
		end
		local var102 = var101 - arg7
		local var103
		if var102 < arg5 * 0.0001111111111111111 then
			local _3 = module_upvr.GetLayer(arg2)[3]
			local var105 = var25_upvr - 1
			var103 = 1
			for i = 1, var105 do
				if math.floor(10 ^ var105 * 0.1111111111111111) / 10 ^ var105 <= var102 / arg5 then break end
				var103 += 1
			end
			if 5 <= var103 then
				local var107
				if var103 < 9 then
					if #_3 < var103 then
						i = BaseBlocks_upvr
						return i[math.clamp(arg2, LowestDepth_upvr, HighestDepth_upvr)]
					end
					var107 = _3[var103]
				else
					i = 0.05 / arg5
					if math.random() < i then
						i = SecretOres_upvr
						local var108 = i[var103 - 8]
						i = {}
						if not var27_upvw then
							var27_upvw = require(game.ServerScriptService.Utils.GameFunctions)
						end
						for _, v in var27_upvw.GetClosePlayers(arg1, arg2, arg3) do
							local any_GetData_result1 = DataModule_upvr.GetData(v, true)
							if any_GetData_result1 and not var27_upvw.IsSuspended(any_GetData_result1) then
								for _, v_2 in var108 do
									if 1 <= any_GetData_result1.TotalBlocks[v_2].Value then
										i[v_2] = true
									end
								end
							end
						end
						local tbl_2 = {}
						for i_4, v_3 in var108 do
							if not i[v_3] then
								table.insert(tbl_2, v_3)
							end
						end
						if 0 < #tbl_2 then
							var107 = tbl_2
						elseif 0 < #var108 then
							var107 = var108
						else
							v_3 = LowestDepth_upvr
							i_4 = arg2
							return BaseBlocks_upvr[math.clamp(i_4, v_3, HighestDepth_upvr)]
						end
					else
						i = BaseBlocks_upvr
						return i[math.clamp(arg2, LowestDepth_upvr, HighestDepth_upvr)]
					end
				end
				i = math.floor(var102 * 9007199254740992) % #var107 + 1
				return var107[i]
			end
		end
	end
	return BaseBlocks_upvr[math.clamp(arg2, LowestDepth_upvr, HighestDepth_upvr)]
end
local Layers_upvr = GameDefinition_upvr.Layers
local _1_upvr = Layers_upvr[2][1]
local _1_upvr_2 = Layers_upvr[1]
local var117_upvr = Layers_upvr[#Layers_upvr]
local tbl_4_upvr = {}
function module_upvr.GetLayer(arg1) -- Line 114
	--[[ Upvalues[5]:
		[1]: _1_upvr (readonly)
		[2]: _1_upvr_2 (readonly)
		[3]: var117_upvr (readonly)
		[4]: tbl_4_upvr (readonly)
		[5]: Layers_upvr (readonly)
	]]
	if _1_upvr < arg1 then
		return _1_upvr_2
	end
	if arg1 <= var117_upvr[1] then
		return var117_upvr
	end
	local var121 = tbl_4_upvr[arg1]
	if var121 then
		return Layers_upvr[var121]
	end
	for i_5, v_4 in Layers_upvr do
		if v_4[1] < arg1 then
			tbl_4_upvr[arg1] = i_5 - 1
			return Layers_upvr[i_5 - 1]
		end
	end
	return var117_upvr
end
function module_upvr.IsEmptyChunk(arg1, arg2) -- Line 131
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var122
	if typeof(arg1) ~= "buffer" then
		var122 = buffer.fromstring(var122)
	end
	local var123 = arg2 or 0
	if 32768 <= buffer.readu16(var122, var123) then
		local var124 = var123 + 4
	else
	end
	local buffer_readu8_result1_2 = buffer.readu8(var122, var124 + 2)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	local var126 = var124 + 2 + 1
	if 127 < buffer_readu8_result1_2 then
		local var127 = var126 + 1
	end
	local buffer_readu8_result1_5 = buffer.readu8(var122, var127)
	if 127 < buffer_readu8_result1_5 then
	end
	local var130 = false
	if buffer_readu8_result1_2 * 256 + buffer.readu8(var122, var126) - 32640 == 4095 then
		if buffer_readu8_result1_5 * 256 + buffer.readu8(var122, var127 + 1) - 32640 ~= 1 then
			var130 = false
		else
			var130 = true
		end
	end
	return var130
end
local any_IsClient_result1_upvr = game:GetService("RunService"):IsClient()
function module_upvr.DecodeChunk(arg1, arg2) -- Line 159
	--[[ Upvalues[1]:
		[1]: any_IsClient_result1_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var140
	if typeof(arg1) ~= "buffer" then
		var140 = buffer.fromstring(var140)
	end
	local var141 = arg2 or 0
	local buffer_readu16_result1_2 = buffer.readu16(var140, var141)
	local var143
	local var144 = var141 + 2
	if 32768 <= buffer_readu16_result1_2 then
		buffer_readu16_result1_2 -= 32768
		var143 = buffer.readu16(var140, var144)
		local var145 = var144 + 2
	end
	local tbl_5 = {}
	local const_number_2 = 0
	local var148
	while var145 < var145 + buffer_readu16_result1_2 do
		var148 = buffer.readu8(var140, var145)
		local var149 = var145 + 1
		if 127 < var148 then
			var148 = var148 * 256 + buffer.readu8(var140, var149) - 32640
			local var150 = var149 + 1
		end
		local buffer_readu8_result1_4 = buffer.readu8(var140, var150)
		local var152 = var150 + 1
		if 127 < buffer_readu8_result1_4 then
			local var153 = buffer_readu8_result1_4 * 256 + buffer.readu8(var140, var152) - 32640
			local var154 = var152 + 1
		end
		if any_IsClient_result1_upvr and var148 == 4095 and var153 == 1 then
			return {
				Empty = true;
			}, var154
		end
		if var153 ~= 0 then
			if var153 < 2056 then
				for i_6 = const_number_2, const_number_2 + var148 do
					tbl_5[i_6] = var153 - 1
				end
			else
				i_6 = const_number_2
				for i_7 = i_6, const_number_2 + var148 do
					local tbl = {}
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
					tbl[1] = (var153 - 1) % 2056 - 1
					tbl[2] = nil
					tbl[3] = (var153 - 1) // 2056
					tbl_5[i_7] = tbl
					local var157
				end
			end
		end
	end
	if var143 then
		var148 = var154 + var143
		while var154 < var148 do
			local buffer_readu8_result1_3 = buffer.readu8(var140, var154)
			local var159 = var154 + 1
			if 127 < buffer_readu8_result1_3 then
				local var160 = buffer_readu8_result1_3 * 256 + buffer.readu8(var140, var159) - 32640
				local var161 = var159 + 1
			end
			if type(var157[var160]) == "number" then
				var157[var160] = {var157[var160], buffer.readf64(var140, var161)}
			else
				var157[var160][2] = buffer.readf64(var140, var161)
			end
		end
	end
	return var157, var161 + 8
end
function module_upvr.GetBlockCount(arg1, arg2) -- Line 235
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var171
	if var171 == "table" then
		var171 = 0
		for _, v_5 in arg1 do
			if v_5 ~= 0 then
				var171 += 1
			end
		end
		return var171
	end
	if typeof(arg1) ~= "buffer" then
		local buffer_fromstring_result1 = buffer.fromstring(arg1)
	end
	local var173 = arg2 or 0
	local buffer_readu16_result1 = buffer.readu16(buffer_fromstring_result1, var173)
	local var175
	var173 += 2
	local var176 = var173
	if 32768 <= buffer_readu16_result1 then
		buffer_readu16_result1 -= 32768
		var175 = buffer.readu16(buffer_fromstring_result1, var176)
		var176 += 2
	end
	local var177
	while var176 < var176 + buffer_readu16_result1 do
		var177 = buffer.readu8(buffer_fromstring_result1, var176)
		var176 += 1
		local var178 = var176
		if 127 < var177 then
			var177 = var177 * 256 + buffer.readu8(buffer_fromstring_result1, var178) - 32640
			var178 += 1
		end
		local buffer_readu8_result1 = buffer.readu8(buffer_fromstring_result1, var178)
		local var180 = var178 + 1
		if 127 < buffer_readu8_result1 then
			buffer_readu8_result1 = buffer_readu8_result1 * 256 + buffer.readu8(buffer_fromstring_result1, var180) - 32640
		end
		if 1 < buffer_readu8_result1 then
		end
	end
	if var175 then
	end
	return (0) + (var177 + 1), var180 + 1 + var175
end
local Unbreakable_upvr = GameDefinition_upvr.Unbreakable
local function GetBlockHealth(arg1, arg2, arg3) -- Line 289
	--[[ Upvalues[3]:
		[1]: GameDefinition_upvr (readonly)
		[2]: Unbreakable_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 45 start (CF ANALYSIS FAILED)
	if type(arg1) == "number" then
		-- KONSTANTWARNING: GOTO [28] #25
	end
	-- KONSTANTERROR: [0] 1. Error Block 45 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [11] 10. Error Block 46 start (CF ANALYSIS FAILED)
	local _1_2 = arg1[1]
	if arg1[2] and not arg3 then
		return arg1[2]
	end
	local var183
	if arg1[3] and bit32.btest(arg1[3], 2) then
		var183 = true
	end
	local var184 = GameDefinition_upvr.Blocks[_1_2]
	local var185
	if var184 and not Unbreakable_upvr[_1_2] then
		var185 = var184[1]
		if GameDefinition_upvr.BlockCount < _1_2 then
			var185 *= GameDefinition_upvr.Blocks[module_upvr.GetLayer(arg2)[2]][1]
			-- KONSTANTWARNING: GOTO [57] #49
		end
	else
		var185 = 1
	end
	if var183 then
		local var186 = GameDefinition_upvr.RarityMap[_1_2] or 0
		if 11 <= var186 then
			var185 = 120
		elseif 10 <= var186 then
			var185 = 60
		elseif 9 <= var186 then
			var185 = 30
		elseif 8 <= var186 then
			var185 = 10
		else
			var185 = math.ceil(var185 / 4)
		end
	end
	do
		return math.round(var185)
	end
	-- KONSTANTERROR: [11] 10. Error Block 46 end (CF ANALYSIS FAILED)
end
module_upvr.GetBlockHealth = GetBlockHealth
GetBlockHealth = {}
local var187_upvr = GetBlockHealth
for _, v_6 in GameDefinition_upvr.Layers do
	local _1 = GameDefinition_upvr.Blocks[v_6[2]][1]
	var187_upvr[v_6[2]] = _1
	if v_6[3] then
		for _, v_7 in v_6[3] do
			for _, v_8 in v_7 do
				var187_upvr[v_8] = _1
			end
		end
	end
end
function module_upvr.CanMine(arg1, arg2, arg3) -- Line 346
	--[[ Upvalues[3]:
		[1]: FormulaHandler_upvr (readonly)
		[2]: var187_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var189 = arg1
	local var190
	if var190 == "table" then
		var189 = arg2[1]
	else
		var189 = arg2
	end
	var190 = var187_upvr[var189]
	if not var190 then
		if not arg3 then
			return true
		end
		var190 = module_upvr.GetBlockHealth(arg2, arg3, true)
	end
	if (var190) / (FormulaHandler_upvr.GetEquipableBoost(arg1, "Pickaxe") / FormulaHandler_upvr.GetInfo(var189, "MiningSpeed")) > 1800 then
	else
	end
	return true
end
for _, v_9 in workspace:WaitForChild("Lobby"):GetChildren() do
	if v_9:FindFirstChild("Hitbox") then
		table.insert({}, v_9)
	end
end
local LobbyInfo_upvr = GameDefinition_upvr.LobbyInfo
local tbl_3_upvr = {}
local any_IsServer_result1_upvr = game:GetService("RunService"):IsServer()
function module_upvr.GetTouched(arg1, arg2, arg3, arg4) -- Line 370
	--[[ Upvalues[3]:
		[1]: LobbyInfo_upvr (readonly)
		[2]: tbl_3_upvr (readonly)
		[3]: any_IsServer_result1_upvr (readonly)
	]]
	local Character = arg1.Character
	if not Character or not Character.Parent then
	else
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
		if not HumanoidRootPart then return end
		local var203 = math.floor((HumanoidRootPart.Position.Y / 6 - 2001 - arg3) / LobbyInfo_upvr.Step + 0.5) * LobbyInfo_upvr.Step
		if var203 < LobbyInfo_upvr.Lowest or LobbyInfo_upvr.Highest < var203 then return end
		local OverlapParams_new_result1 = OverlapParams.new()
		OverlapParams_new_result1.FilterType = Enum.RaycastFilterType.Include
		OverlapParams_new_result1.FilterDescendantsInstances = {HumanoidRootPart}
		for _, v_11 in tbl_3_upvr do
			local Lobby = v_11:GetAttribute("Lobby")
			if not Lobby or Lobby == var203 then
				local Hitbox = v_11.Hitbox
				local CFrame = Hitbox.CFrame
				if any_IsServer_result1_upvr then
					CFrame += Vector3.new(arg2 * 6, (var203 + arg3) * 6, arg4 * 6)
				end
				if 0 < #workspace:GetPartBoundsInBox(CFrame, Hitbox.Size, OverlapParams_new_result1) then
					return v_11.Name
				end
			end
		end
	end
end
function module_upvr.GetValue(arg1, arg2) -- Line 397
	local var214
	if var214 == 0 then return end
	var214 = arg1
	for _, v_10 in string.split(arg2, '.') do
		var214 = var214:FindFirstChild(v_10)
		if var214 == nil then return end
	end
	return var214
end
function module_upvr.IsBackpackFull(arg1) -- Line 408
	--[[ Upvalues[1]:
		[1]: FormulaHandler_upvr (readonly)
	]]
	if arg1.Gamepasses.InfiniteBackpack.Value == true then
		return false
	end
	if FormulaHandler_upvr.GetInfo(arg1, "Backpack") <= arg1.NumberValues.Blocks.Value + arg1.NumberValues.PendingBlocks.Value then
		if arg1.Accessories.Equipped[11].Value and 4 <= arg1.Accessories.Levels[11].Value and arg1.Settings.AutoMine.Value and (arg1.Others.BackpackSells.Value < 3 or 86400000 <= DateTime.now().UnixTimestampMillis - arg1.Others.LastBackpackSell.Value) then
			return false
		end
		return true
	end
	return false
end
function module_upvr.FromPosition(arg1, arg2, arg3) -- Line 429
	local var215 = arg1 + 2000
	local var216 = arg2 + 2000
	local var217 = arg3 + 2000
	return {
		CFrame = CFrame.new(((var215 % 10922 + 5461) % 10922 - 5461) * 6, ((var216 % 10922 + 5461) % 10922 - 5461) * 6, ((var217 % 10922 + 5461) % 10922 - 5461) * 6);
		World = {
			X = math.floor(var215 / 10922 + 0.5);
			Y = math.floor(var216 / 10922 + 0.5);
			Z = math.floor(var217 / 10922 + 0.5);
		};
	}
end
function module_upvr.ToPosition(arg1) -- Line 447
	if not arg1 then return end
	local Position = arg1.CFrame.Position
	local World = arg1.World
	return math.floor(Position.X / 6 + 0.5) - 2000 + World.X * 10922, math.floor(Position.Y / 6 + 0.5) - 2000 + World.Y * 10922, math.floor(Position.Z / 6 + 0.5) - 2000 + World.Z * 10922
end
function module_upvr.GetCFrame(arg1, arg2, arg3, arg4) -- Line 454
	return CFrame.new(((arg1) + (2000 - arg4.X * 10922)) * 6, ((arg2) + (2000 - arg4.Y * 10922)) * 6, ((arg3) + (2000 - arg4.Z * 10922)) * 6)
end
function module_upvr.GetVector3(arg1, arg2, arg3) -- Line 461
	if 16777216 < math.abs(arg1) or 16777216 < math.abs(arg2) or 16777216 < math.abs(arg3) then
		return string.pack("ddd", arg1, arg2, arg3)
	end
	return Vector3.new(arg1, arg2, arg3)
end
function module_upvr.FromVector3(arg1) -- Line 468
	if typeof(arg1) == "Vector3" then
		return arg1.X, arg1.Y, arg1.Z
	end
	return string.unpack("ddd", arg1)
end
function module_upvr.GetNearestLobby(arg1, arg2) -- Line 475
	--[[ Upvalues[1]:
		[1]: LobbyInfo_upvr (readonly)
	]]
	return math.clamp(math.clamp(math.round(arg2 / LobbyInfo_upvr.Step), math.ceil((arg1.NumberValues.LowestDepth.Value - 10) / LobbyInfo_upvr.Step), math.floor(arg1.NumberValues.HighestDepth.Value / LobbyInfo_upvr.Step)) * LobbyInfo_upvr.Step, LobbyInfo_upvr.Lowest, LobbyInfo_upvr.Highest)
end
return module_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.ABTesting
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:08
-- Luau version 6, Types version 3
-- Time taken: 0.005210 seconds

local module = {}
local var2_upvw = 0
local var3_upvw = 0
local function _() -- Line 7, Named "random"
	--[[ Upvalues[2]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
	]]
	var2_upvw = (var2_upvw % 65536 * 36969 + var2_upvw // 65536) % 4294967296
	var3_upvw = (var3_upvw % 65536 * 18273 + var3_upvw // 65536) % 4294967296
	return (var2_upvw * 65536 + var3_upvw % 65536) % 4294967296 / 4294967296
end
local var4_upvw
local tbl_upvw = {}
local any_IsServer_result1_upvr = game:GetService("RunService"):IsServer()
local const_number_upvw = 0
local var8_upvw
local function UpdateData_upvr() -- Line 19, Named "UpdateData"
	--[[ Upvalues[5]:
		[1]: const_number_upvw (read and write)
		[2]: var4_upvw (read and write)
		[3]: any_IsServer_result1_upvr (readonly)
		[4]: var8_upvw (read and write)
		[5]: tbl_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 5. Error Block 73 start (CF ANALYSIS FAILED)
	while not var4_upvw do
		task.wait()
	end
	do
		return
	end
	-- KONSTANTERROR: [6] 5. Error Block 73 end (CF ANALYSIS FAILED)
end
if any_IsServer_result1_upvr then
	var8_upvw = require(game.ServerScriptService.Utils.NetworkingServer)
	var8_upvw.OnInvoke("GetABTestData", function(arg1, arg2) -- Line 80
		--[[ Upvalues[2]:
			[1]: UpdateData_upvr (readonly)
			[2]: var4_upvw (read and write)
		]]
		UpdateData_upvr()
		return var4_upvw
	end)
else
	var8_upvw = require(game.ReplicatedStorage.Modules.Networking)
end
function module.GetResult(arg1, arg2) -- Line 88
	--[[ Upvalues[5]:
		[1]: UpdateData_upvr (readonly)
		[2]: tbl_upvw (read and write)
		[3]: var4_upvw (read and write)
		[4]: var2_upvw (read and write)
		[5]: var3_upvw (read and write)
	]]
	if typeof(arg1) ~= "Instance" then
		warn("Invalid ABTesting Data passed", debug.traceback())
		return 0
	end
	if type(arg2) ~= "string" then
		warn("Invalid ABTesting Name passed")
		return 0
	end
	if game:GetService("RunService"):IsStudio() or game.PlaceId == 114122965921005 then
		return 1
	end
	UpdateData_upvr()
	local var11 = tbl_upvw[arg2]
	if not var11 then
		return 0
	end
	local var12 = var4_upvw[var11]
	if var12.Conclusion then
		return var12.Conclusion
	end
	if type(var12.StartTime) ~= "number" then
		return 0
	end
	local pcall_result1, pcall_result2 = pcall(function() -- Line 106
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		return DateTime.fromIsoDate(arg1:GetAttribute("FirstJoin")).UnixTimestampMillis
	end)
	if not pcall_result2 or pcall_result2 < var12.StartTime then
		return 0
	end
	local UserId = arg1:GetAttribute("UserId")
	if 62 <= var11 then
		return math.floor(Random.new(UserId % 4294967296 + (var11 % 4194303 - 2097151) * 4294967296):NextNumber() * var12.Outcomes)
	end
	var2_upvw = (UserId * 254904 + 3949122718) % 4294967295 + 1
	var3_upvw = (UserId * 838902 + 441219856) % 4294967295 + 1
	for _ = 1, var11 % 32 do
		var2_upvw = (var2_upvw % 65536 * 36969 + var2_upvw // 65536) % 4294967296
		var3_upvw = (var3_upvw % 65536 * 18273 + var3_upvw // 65536) % 4294967296
	end
	var2_upvw = (var2_upvw % 65536 * 36969 + var2_upvw // 65536) % 4294967296
	var3_upvw = (var3_upvw % 65536 * 18273 + var3_upvw // 65536) % 4294967296
	return math.floor((var2_upvw * 65536 + var3_upvw % 65536) % 4294967296 / 4294967296 * var12.Outcomes)
end
return module


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.VFXHandler
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:09
-- Luau version 6, Types version 3
-- Time taken: 0.003461 seconds

return {
	Play = function(arg1, arg2, arg3) -- Line 3, Named "Play"
		local Character = arg1.Character
		if not Character or not Character.Parent then
		else
			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
			if not HumanoidRootPart then return end
			local SOME_2 = script:FindFirstChild(arg2)
			if not SOME_2 then return end
			local tbl_upvr = {}
			for i, v in SOME_2:GetChildren() do
				local SOME = Character:FindFirstChild(v.Name)
				if SOME then
					local clone_2 = v:Clone()
					table.insert(tbl_upvr, clone_2)
					clone_2.Parent = SOME
				end
			end
			local Bottom = SOME_2:FindFirstChild("Bottom")
			if Bottom then
				local clone = Bottom:Clone()
				i = Character:GetPivot()
				v = Character:GetExtentsSize() * Vector3.new(0, 0.5, 0)
				clone.CFrame = i - v
				clone.CanCollide = false
				clone.Anchored = false
				clone.Transparency = 1
				clone.Massless = true
				i = "WeldConstraint"
				local any = Instance.new(i)
				any.Part0 = clone
				any.Part1 = HumanoidRootPart
				any.Parent = clone
				clone.Parent = Character
				v = tbl_upvr
				i = table.insert
				i(v, clone)
			end
			for _, v_2 in tbl_upvr do
				for _, v_3 in v_2:GetDescendants() do
					if v_3:IsA("ParticleEmitter") then
						if arg3 then
							v_3.Lifetime = NumberRange.new(v_3.Lifetime.Min / arg3, v_3.Lifetime.Max / arg3)
						end
						v_3:Emit(v_3:GetAttribute("EmitCount"))
					end
				end
			end
			task.delay(5, function() -- Line 49
				--[[ Upvalues[1]:
					[1]: tbl_upvr (readonly)
				]]
				for _, v_4 in tbl_upvr do
					pcall(v_4.Destroy, v_4)
				end
			end)
		end
	end;
}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.ClientFunctions
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:11
-- Luau version 6, Types version 3
-- Time taken: 0.317782 seconds

local module_2_upvr = {}
local LocalPlayer_upvr = game.Players.LocalPlayer
local any_GetData_result1_upvr = require(game.ReplicatedStorage.Modules.DataModule).GetData(LocalPlayer_upvr)
local RenderDistance_upvr = any_GetData_result1_upvr.Settings.RenderDistance
local GameDefinition_upvr = require(game.ReplicatedStorage.Modules.GameDefinition)
local FormulaHandler_upvr = require(game.ReplicatedStorage.Modules.FormulaHandler)
local BlockCache_upvr = require(game.ReplicatedStorage.Modules.BlockCache)
local BlockHandler_upvr = require(game.ReplicatedStorage.Modules.BlockHandler)
local SharedFunctions_upvr = require(game.ReplicatedStorage.Modules.SharedFunctions)
local SoundHandler_upvr = require(game.ReplicatedStorage.Modules.SoundHandler)
local Short_upvr = require(game.ReplicatedStorage.Modules.Short)
local Translator_upvr = require(game.ReplicatedStorage.Modules.Translator)
local Networking_upvr = require(game.ReplicatedStorage.Modules.Networking)
local tbl_26_upvr = {}
module_2_upvr.Friends = tbl_26_upvr
module_2_upvr.Position = SharedFunctions_upvr.FromPosition(0, 0, 0)
module_2_upvr.PendingWorldChange = nil
module_2_upvr.PositionReceived = false
local GetVector3_upvr = SharedFunctions_upvr.GetVector3
local FromVector3_upvr = SharedFunctions_upvr.FromVector3
local Animation_upvr = Instance.new("Animation")
Animation_upvr.AnimationId = "rbxassetid://13136677573"
local var26_upvw = true
local var27_upvw
local function CharacterCallback(arg1) -- Line 39
	--[[ Upvalues[3]:
		[1]: var26_upvw (read and write)
		[2]: module_2_upvr (readonly)
		[3]: var27_upvw (read and write)
	]]
	if not arg1 then
	else
		local Humanoid_5 = arg1:WaitForChild("Humanoid")
		Humanoid_5:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
		Humanoid_5:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
		while true do
			local RootPart_upvw = Humanoid_5.RootPart
			if RootPart_upvw then break end
			task.wait()
		end
		RootPart_upvw.Anchored = var26_upvw
		RootPart_upvw:GetPropertyChangedSignal("CFrame"):Connect(function() -- Line 51
			--[[ Upvalues[2]:
				[1]: module_2_upvr (copied, readonly)
				[2]: RootPart_upvw (read and write)
			]]
			local PendingWorldChange = module_2_upvr.PendingWorldChange
			if not PendingWorldChange then
			else
				local CFrame = module_2_upvr.Position.CFrame
				local var33 = CFrame.Position - RootPart_upvw.CFrame.Position
				local vector3 = Vector3.new(math.floor((var33.X + 32766) / 65000), math.floor((var33.Y + 32766) / 65000), math.floor((var33.Z + 32766) / 65000))
				if 0 < vector3.Magnitude then
					if PendingWorldChange == vector3 then
						RootPart_upvw.CFrame = CFrame - PendingWorldChange * 65532
					end
					module_2_upvr.PendingWorldChange = nil
				end
			end
		end)
		var27_upvw = nil
	end
end
LocalPlayer_upvr.CharacterAdded:Connect(CharacterCallback)
CharacterCallback(LocalPlayer_upvr.Character)
function module_2_upvr.SetCharacterState(arg1) -- Line 73
	--[[ Upvalues[2]:
		[1]: var26_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
	]]
	var26_upvw = arg1
	local Character_11 = LocalPlayer_upvr.Character
	if Character_11 == nil then
	else
		local Humanoid_3 = Character_11:FindFirstChild("Humanoid")
		if Humanoid_3 == nil then return end
		local RootPart = Humanoid_3.RootPart
		if RootPart == nil then return end
		RootPart.Anchored = arg1
	end
end
function module_2_upvr.SetCharacterPosition(arg1) -- Line 84
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	local Character_6 = LocalPlayer_upvr.Character
	if Character_6 == nil then
	else
		local Humanoid_6 = Character_6:FindFirstChild("Humanoid")
		if Humanoid_6 == nil then return end
		local RootPart_4 = Humanoid_6.RootPart
		if RootPart_4 == nil then return end
		RootPart_4.Anchored = true
		RootPart_4.Velocity = Vector3.new(0, 0, 0)
		RootPart_4.CFrame = arg1
	end
end
local var43_upvw = false
local var44_upvw = 0
function module_2_upvr.SetAnimating(arg1) -- Line 97
	--[[ Upvalues[5]:
		[1]: var43_upvw (read and write)
		[2]: var44_upvw (read and write)
		[3]: var27_upvw (read and write)
		[4]: LocalPlayer_upvr (readonly)
		[5]: Animation_upvr (readonly)
	]]
	if var43_upvw == arg1 then
	else
		if not arg1 and os.clock() < var44_upvw then return end
		if arg1 then
			var44_upvw = os.clock() + 1
		end
		var43_upvw = arg1
		if var27_upvw then
			if arg1 == true then
				var27_upvw:Play()
			else
				var27_upvw:Stop()
			end
		end
		if arg1 == true then
			local Character_4 = LocalPlayer_upvr.Character
			if Character_4 == nil then return end
			local Humanoid = Character_4:WaitForChild("Humanoid", 60)
			if Humanoid == nil then return end
			local Animator = Humanoid:WaitForChild("Animator", 60)
			if Animator == nil then return end
			var27_upvw = Animator:LoadAnimation(Animation_upvr)
			var27_upvw:Play()
		end
	end
end
local Selected_upvr = any_GetData_result1_upvr.Others.Selected
local UpdateBlockGui_upvr = game.ReplicatedStorage.Events.UpdateBlockGui
local Game_upvr = LocalPlayer_upvr.PlayerGui:WaitForChild("Game")
local tbl_2_upvr = {}
local var52_upvw = false
local function UpdatePositions() -- Line 129
	--[[ Upvalues[2]:
		[1]: var52_upvw (read and write)
		[2]: Networking_upvr (readonly)
	]]
	if var52_upvw then
	else
		var52_upvw = true
		for i_41, v_38 in Networking_upvr.Invoke("GetPositions"), nil do
			local any_GetPlayerByUserId_result1 = game.Players:GetPlayerByUserId(tonumber(i_41))
			if any_GetPlayerByUserId_result1 then
				local Character_9 = any_GetPlayerByUserId_result1.Character
				if Character_9 then
					local Humanoid_4 = Character_9:FindFirstChild("Humanoid")
					if not Humanoid_4 then return end
					local RootPart_3 = Humanoid_4.RootPart
					if RootPart_3 then
						RootPart_3.CFrame = v_38
					end
				end
			end
		end
		var52_upvw = false
	end
end
game:GetService("TextChatService"):WaitForChild("BubbleChatConfiguration").AdorneeName = "BubbleChat"
local tbl_43_upvr = {}
local tbl_6_upvr = {}
local var67_upvw = 0
local var68_upvw
local function GlobalCharacterCallback_upvr(arg1, arg2) -- Line 158, Named "GlobalCharacterCallback"
	--[[ Upvalues[13]:
		[1]: Short_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: any_GetData_result1_upvr (readonly)
		[4]: FormulaHandler_upvr (readonly)
		[5]: Translator_upvr (readonly)
		[6]: tbl_2_upvr (readonly)
		[7]: module_2_upvr (readonly)
		[8]: UpdatePositions (readonly)
		[9]: tbl_43_upvr (readonly)
		[10]: tbl_6_upvr (readonly)
		[11]: var67_upvw (read and write)
		[12]: var68_upvw (read and write)
		[13]: Networking_upvr (readonly)
	]]
	if not arg2 then
	else
		while arg2.Parent do
			local Head_4_upvw = arg2:FindFirstChild("Head")
			if Head_4_upvw then break end
			task.wait()
		end
		if not Head_4_upvw then return end
		if not arg2:WaitForChild("Humanoid", 60) then return end
		local Public_upvr = arg1:WaitForChild("Public", 60)
		if not Public_upvr then return end
		local clone_4_upvr = script.Overhead:Clone()
		local tbl_31_upvr = {}
		local function UpdateCash() -- Line 177
			--[[ Upvalues[3]:
				[1]: clone_4_upvr (readonly)
				[2]: Short_upvr (copied, readonly)
				[3]: Public_upvr (readonly)
			]]
			clone_4_upvr.Cash.Count.Text = Short_upvr.en(Public_upvr["NumberValues.Cash"].Value)
		end
		local function UpdateBackpack_upvr() -- Line 195, Named "UpdateBackpack"
			--[[ Upvalues[7]:
				[1]: Public_upvr (readonly)
				[2]: LocalPlayer_upvr (copied, readonly)
				[3]: arg1 (readonly)
				[4]: any_GetData_result1_upvr (copied, readonly)
				[5]: FormulaHandler_upvr (copied, readonly)
				[6]: clone_4_upvr (readonly)
				[7]: Short_upvr (copied, readonly)
			]]
			local Value = Public_upvr["NumberValues.Blocks"].Value
			if LocalPlayer_upvr == arg1 then
				Value += any_GetData_result1_upvr.NumberValues.PendingBlocks.Value
			end
			if not Public_upvr["Gamepasses.InfiniteBackpack"].Value then
				for _, v_39 in Public_upvr:GetChildren() do
					local var89
					for _, v_40 in string.split(v_39.Name, '.') do
						if tonumber(v_40) then
							v_40 = tonumber(v_40)
						end
						if not var89[v_40] then
							var89[v_40] = {}
						end
						var89 = var89[v_40]
					end
					var89.Value = v_39.Value
				end
				clone_4_upvr.Backpack.Count.Text = Short_upvr.en(Value, 0, true)..'/'..Short_upvr.en(FormulaHandler_upvr.GetInfo({}, "Backpack"), 0, true)
			else
				clone_4_upvr.Backpack.Count.Text = Short_upvr.en(Value, 0, true)
			end
		end
		table.insert(tbl_31_upvr, Public_upvr["NumberValues.Cash"]:GetPropertyChangedSignal("Value"):Connect(UpdateCash))
		table.insert(tbl_31_upvr, Public_upvr["NumberValues.Mined"]:GetPropertyChangedSignal("Value"):Connect(function() -- Line 186, Named "UpdateBlocksMined"
			--[[ Upvalues[3]:
				[1]: clone_4_upvr (readonly)
				[2]: Short_upvr (copied, readonly)
				[3]: Public_upvr (readonly)
			]]
			clone_4_upvr.BlocksMined.Count.Text = Short_upvr.en(Public_upvr["NumberValues.Mined"].Value, 0, true)
		end))
		table.insert(tbl_31_upvr, Public_upvr["NumberValues.Blocks"]:GetPropertyChangedSignal("Value"):Connect(UpdateBackpack_upvr))
		if LocalPlayer_upvr == arg1 then
			table.insert(tbl_31_upvr, any_GetData_result1_upvr.NumberValues.PendingBlocks:GetPropertyChangedSignal("Value"):Connect(UpdateBackpack_upvr))
		end
		table.insert(tbl_31_upvr, Public_upvr["Equipables.Equipped.Backpack"]:GetPropertyChangedSignal("Value"):Connect(UpdateBackpack_upvr))
		table.insert(tbl_31_upvr, Public_upvr["Gamepasses.InfiniteBackpack"]:GetPropertyChangedSignal("Value"):Connect(UpdateBackpack_upvr))
		table.insert(tbl_31_upvr, Public_upvr["Gamepasses.x2Storage"]:GetPropertyChangedSignal("Value"):Connect(UpdateBackpack_upvr))
		local var91_upvw = 0
		local var92_upvw = 0
		local var93_upvw = 0
		table.insert(tbl_31_upvr, Translator_upvr.LanguageUpdated:Connect(function() -- Line 243
			--[[ Upvalues[7]:
				[1]: var91_upvw (read and write)
				[2]: var92_upvw (read and write)
				[3]: var93_upvw (read and write)
				[4]: clone_4_upvr (readonly)
				[5]: Short_upvr (copied, readonly)
				[6]: Public_upvr (readonly)
				[7]: UpdateBackpack_upvr (readonly)
			]]
			var91_upvw = 0
			var92_upvw = 0
			var93_upvw = 0
			clone_4_upvr.Cash.Count.Text = Short_upvr.en(Public_upvr["NumberValues.Cash"].Value)
			clone_4_upvr.BlocksMined.Count.Text = Short_upvr.en(Public_upvr["NumberValues.Mined"].Value, 0, true)
			UpdateBackpack_upvr()
		end))
		clone_4_upvr.Cash.Count.Text = Short_upvr.en(Public_upvr["NumberValues.Cash"].Value)
		clone_4_upvr.BlocksMined.Count.Text = Short_upvr.en(Public_upvr["NumberValues.Mined"].Value, 0, true)
		UpdateBackpack_upvr()
		tbl_2_upvr[Head_4_upvw] = clone_4_upvr
		clone_4_upvr.Parent = Head_4_upvw
		while arg2.Parent do
			local HumanoidRootPart_5_upvw = arg2:FindFirstChild("HumanoidRootPart")
			if HumanoidRootPart_5_upvw then break end
			task.wait()
		end
		if not HumanoidRootPart_5_upvw then return end
		if not arg2:FindFirstChild("BubbleChat") then
			local Part_upvw = Instance.new("Part")
			Part_upvw.Name = "BubbleChat"
			Part_upvw.Anchored = false
			Part_upvw.CanCollide = false
			Part_upvw.Transparency = 1
			Part_upvw.CFrame = HumanoidRootPart_5_upvw.CFrame
			Part_upvw.Size = HumanoidRootPart_5_upvw.Size
			Part_upvw.Massless = true
			Part_upvw.Parent = arg2
		end
		if not Part_upvw:FindFirstChild("WeldConstraint") then
			local WeldConstraint_upvw = Instance.new("WeldConstraint")
			WeldConstraint_upvw.Part0 = Part_upvw
			WeldConstraint_upvw.Part1 = HumanoidRootPart_5_upvw
			WeldConstraint_upvw.Parent = Part_upvw
			WeldConstraint_upvw.Enabled = true
		end
		Part_upvw.CFrame = HumanoidRootPart_5_upvw.CFrame
		local var97_upvw = true
		local function SetVisibility_upvr(arg1_2) -- Line 292, Named "SetVisibility"
			--[[ Upvalues[8]:
				[1]: module_2_upvr (copied, readonly)
				[2]: arg1 (readonly)
				[3]: arg2 (readonly)
				[4]: var97_upvw (read and write)
				[5]: WeldConstraint_upvw (read and write)
				[6]: Part_upvw (read and write)
				[7]: HumanoidRootPart_5_upvw (read and write)
				[8]: UpdatePositions (copied, readonly)
			]]
			local var98
			if module_2_upvr.Friends[arg1.UserId] and arg1_2 then
				var98 = true
			end
			if var98 and not arg2:FindFirstChild("Highlight") then
				local Highlight = Instance.new("Highlight")
				Highlight.FillTransparency = 1
				Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
				Highlight.Parent = arg2
			elseif not var98 and Highlight then
				Highlight:Destroy()
			end
			if arg1_2 == var97_upvw then
			else
				if arg1_2 then
					WeldConstraint_upvw.Enabled = true
					Part_upvw.Anchored = false
					Part_upvw.CFrame = HumanoidRootPart_5_upvw.CFrame
					arg2.Parent = workspace
				else
					WeldConstraint_upvw.Enabled = false
					Part_upvw.Anchored = true
					Part_upvw.CFrame = CFrame.new(math.random(10000000, 100000000), math.random(10000000, 100000000), math.random(10000000, 100000000))
					arg2.Parent = game.ReplicatedStorage
				end
				if arg1_2 then
					UpdatePositions()
				end
				var97_upvw = arg1_2
			end
		end
		tbl_6_upvr[arg1.UserId] = function() -- Line 324, Named "UpdateVisibility"
			--[[ Upvalues[4]:
				[1]: LocalPlayer_upvr (copied, readonly)
				[2]: arg1 (readonly)
				[3]: SetVisibility_upvr (readonly)
				[4]: tbl_43_upvr (copied, readonly)
			]]
			local var101
			if LocalPlayer_upvr == var101 then
			else
				if tbl_43_upvr[arg1.UserId] == nil then
					var101 = false
				else
					var101 = true
				end
				SetVisibility_upvr(var101)
			end
		end
		if LocalPlayer_upvr == arg1 then
			-- KONSTANTWARNING: GOTO [337] #256
		end
		if tbl_43_upvr[arg1.UserId] == nil then
		else
		end
		SetVisibility_upvr(true)
		local tbl_16_upvr = {}
		local var103_upvw
		local function _() -- Line 334, Named "KillScripts"
			--[[ Upvalues[1]:
				[1]: tbl_16_upvr (readonly)
			]]
			for _, v_41 in tbl_16_upvr do
				v_41:Destroy()
			end
		end
		local function HandleTool_upvr(arg1_3) -- Line 340, Named "HandleTool"
			--[[ Upvalues[5]:
				[1]: tbl_16_upvr (readonly)
				[2]: var103_upvw (read and write)
				[3]: var67_upvw (copied, read and write)
				[4]: var68_upvw (copied, read and write)
				[5]: Networking_upvr (copied, readonly)
			]]
			if not arg1_3:IsA("Tool") then
			else
				for i_57, v_50 in tbl_16_upvr do
					v_50:Destroy()
				end
				if var103_upvw then
					var103_upvw:Disconnect()
					var103_upvw = nil
				end
				var103_upvw = arg1_3:GetPropertyChangedSignal("Parent"):Connect(function() -- Line 349
					--[[ Upvalues[3]:
						[1]: arg1_3 (readonly)
						[2]: var103_upvw (copied, read and write)
						[3]: tbl_16_upvr (copied, readonly)
					]]
					if arg1_3.Parent then
					else
						var103_upvw:Disconnect()
						var103_upvw = nil
						for _, v_54 in tbl_16_upvr do
							v_54:Destroy()
						end
					end
				end)
				if var67_upvw <= os.clock() then
					var68_upvw = Networking_upvr.Invoke("GetFlag", "DisableOreScripts")
					var67_upvw = os.clock() + 60
				end
				if not var68_upvw then
					local var111 = tbl_16_upvr[arg1_3]
					if var111 then
						var111:Destroy()
					end
					v_50 = game.ReplicatedStorage
					i_57 = v_50.Modules
					local clone_11 = i_57.BlockCache.ScriptRunner:Clone()
					clone_11.Parent = arg1_3
					clone_11.Enabled = true
					tbl_16_upvr[arg1_3] = clone_11
				end
			end
		end
		table.insert(tbl_31_upvr, arg2.ChildAdded:Connect(function(arg1_4) -- Line 373
			--[[ Upvalues[1]:
				[1]: HandleTool_upvr (readonly)
			]]
			HandleTool_upvr(arg1_4)
		end))
		local Tool = arg2:FindFirstChild("Tool")
		if Tool then
			HandleTool_upvr(Tool)
		end
		table.insert(tbl_31_upvr, arg2:GetPropertyChangedSignal("Parent"):Connect(function() -- Line 382
			--[[ Upvalues[8]:
				[1]: arg2 (readonly)
				[2]: Head_4_upvw (read and write)
				[3]: tbl_2_upvr (copied, readonly)
				[4]: tbl_6_upvr (copied, readonly)
				[5]: arg1 (readonly)
				[6]: tbl_31_upvr (readonly)
				[7]: tbl_16_upvr (readonly)
				[8]: var103_upvw (read and write)
			]]
			if arg2.Parent then
			else
				if Head_4_upvw then
					tbl_2_upvr[Head_4_upvw] = nil
				end
				tbl_6_upvr[arg1.UserId] = nil
				for _, v_51 in tbl_31_upvr do
					v_51:Disconnect()
				end
				table.clear(tbl_31_upvr)
				for _, v_52 in tbl_16_upvr do
					v_52:Destroy()
				end
				if var103_upvw then
					var103_upvw:Disconnect()
					var103_upvw = nil
				end
			end
		end))
	end
end
local function UpdateClosePlayers_upvr() -- Line 401, Named "UpdateClosePlayers"
	--[[ Upvalues[3]:
		[1]: Networking_upvr (readonly)
		[2]: tbl_43_upvr (readonly)
		[3]: tbl_6_upvr (readonly)
	]]
	local any_Invoke_result1 = Networking_upvr.Invoke("GetClosePlayers")
	local var143
	if typeof(any_Invoke_result1) == "buffer" then
		var143 = buffer.tostring(any_Invoke_result1)
	end
	local tbl_39 = {}
	local var145 = 1
	while var145 ~= #var143 + 1 do
		tbl_39[string.unpack('d', var143, var145)] = true
	end
	for i, _ in tbl_39 do
		tbl_43_upvr[i] = true
		local var146 = tbl_6_upvr[i]
		if var146 then
			pcall(var146)
		end
	end
	for i_2, _ in tbl_43_upvr do
		if not tbl_39[i_2] then
			tbl_43_upvr[i_2] = nil
			local var147 = tbl_6_upvr[i_2]
			if var147 then
				pcall(var147)
			end
		end
	end
end
task.spawn(UpdateClosePlayers_upvr)
local function PlayerAdded(arg1) -- Line 431
	--[[ Upvalues[6]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: SharedFunctions_upvr (readonly)
		[3]: any_GetData_result1_upvr (readonly)
		[4]: Short_upvr (readonly)
		[5]: Translator_upvr (readonly)
		[6]: GlobalCharacterCallback_upvr (readonly)
	]]
	local var152_upvw
	while arg1.Parent do
		var152_upvw = arg1:FindFirstChild("Public")
		if var152_upvw then break end
		task.wait()
	end
	if not var152_upvw then
	else
		if arg1 == LocalPlayer_upvr then
			for _, v_42 in var152_upvw:GetChildren() do
				local any_GetValue_result1_upvr = SharedFunctions_upvr.GetValue(any_GetData_result1_upvr, v_42.Name)
				if any_GetValue_result1_upvr then
					local any_upvr = Instance.new(any_GetValue_result1_upvr.ClassName)
					any_upvr.Name = v_42.Name
					any_upvr.Parent = var152_upvw
					any_GetValue_result1_upvr:GetPropertyChangedSignal("Value"):Connect(function() -- Line 449
						--[[ Upvalues[2]:
							[1]: any_upvr (readonly)
							[2]: any_GetValue_result1_upvr (readonly)
						]]
						any_upvr.Value = any_GetValue_result1_upvr.Value
					end)
					any_upvr.Value = any_GetValue_result1_upvr.Value
					v_42:Destroy()
				end
			end
		end
		local Folder = Instance.new("Folder")
		Folder.Name = "leaderstats"
		Folder.Parent = arg1
		local NumberValue_upvr = Instance.new("NumberValue")
		NumberValue_upvr.Name = "Mined"
		NumberValue_upvr.Parent = Folder
		any_GetValue_result1_upvr = "Value"
		function any_GetValue_result1_upvr() -- Line 465, Named "UpdateMined"
			--[[ Upvalues[2]:
				[1]: NumberValue_upvr (readonly)
				[2]: var152_upvw (read and write)
			]]
			NumberValue_upvr.Value = var152_upvw["NumberValues.Mined"].Value
		end
		var152_upvw["NumberValues.Mined"]:GetPropertyChangedSignal(any_GetValue_result1_upvr):Connect(any_GetValue_result1_upvr)
		NumberValue_upvr.Value = var152_upvw["NumberValues.Mined"].Value
		local StringValue_upvr = Instance.new("StringValue")
		StringValue_upvr.Name = "Cash"
		StringValue_upvr.Parent = Folder
		local function UpdateCash() -- Line 475
			--[[ Upvalues[3]:
				[1]: StringValue_upvr (readonly)
				[2]: Short_upvr (copied, readonly)
				[3]: var152_upvw (read and write)
			]]
			StringValue_upvr.Value = Short_upvr.en2(var152_upvw["NumberValues.Cash"].Value)
		end
		any_GetValue_result1_upvr = var152_upvw["NumberValues.Cash"]:GetPropertyChangedSignal("Value"):Connect
		any_GetValue_result1_upvr(UpdateCash)
		any_upvr = Translator_upvr
		any_GetValue_result1_upvr = any_upvr.LanguageUpdated:Connect
		any_GetValue_result1_upvr(UpdateCash)
		any_upvr = Short_upvr
		any_GetValue_result1_upvr = any_upvr.en2
		any_upvr = var152_upvw["NumberValues.Cash"].Value
		any_GetValue_result1_upvr = any_GetValue_result1_upvr(any_upvr)
		StringValue_upvr.Value = any_GetValue_result1_upvr
		any_GetValue_result1_upvr = Instance.new
		any_upvr = "NumberValue"
		any_GetValue_result1_upvr = any_GetValue_result1_upvr(any_upvr)
		local var162_upvr = any_GetValue_result1_upvr
		any_upvr = "Depth"
		var162_upvr.Name = any_upvr
		var162_upvr.Parent = Folder
		function any_upvr() -- Line 486, Named "UpdateDepth"
			--[[ Upvalues[2]:
				[1]: var162_upvr (readonly)
				[2]: var152_upvw (read and write)
			]]
			var162_upvr.Value = var152_upvw["Others.Depth"].Value
		end
		var152_upvw["Others.Depth"]:GetPropertyChangedSignal("Value"):Connect(any_upvr)
		var162_upvr.Value = var152_upvw["Others.Depth"].Value
		arg1.CharacterAdded:Connect(function(arg1_5) -- Line 492
			--[[ Upvalues[2]:
				[1]: GlobalCharacterCallback_upvr (copied, readonly)
				[2]: arg1 (readonly)
			]]
			GlobalCharacterCallback_upvr(arg1, arg1_5)
		end)
		task.spawn(function() -- Line 495
			--[[ Upvalues[2]:
				[1]: GlobalCharacterCallback_upvr (copied, readonly)
				[2]: arg1 (readonly)
			]]
			GlobalCharacterCallback_upvr(arg1, arg1.Character)
		end)
	end
end
local var168_upvw
for _, v_3 in game.Players:GetPlayers() do
	task.spawn(PlayerAdded, v_3)
end
game.Players.PlayerAdded:Connect(PlayerAdded)
local default_upvr = require(game.ReplicatedStorage.Modules.NotificationSubSystem).default
function module_2_upvr.Popup(arg1, arg2, arg3, arg4) -- Line 509
	--[[ Upvalues[2]:
		[1]: module_2_upvr (readonly)
		[2]: default_upvr (readonly)
	]]
	if module_2_upvr.PopupsBlocked and not arg4 then return end
	local var171 = arg3
	if not var171 then
		var171 = 3
	elseif var171 < 0 then
		var171 = nil
	end
	local var172 = arg2
	if not var172 then
		var172 = Color3.fromRGB(255, 255, 255)
	end
	return default_upvr:create(arg1, var172, Enum.Font.FredokaOne, var171)
end
local tbl_7_upvr = {}
local tbl_11_upvr = {}
local tbl_19_upvr = {}
module_2_upvr.Chunks = tbl_7_upvr
module_2_upvr.LoadingChunks = tbl_11_upvr
module_2_upvr.ChunkSeeds = tbl_19_upvr
module_2_upvr.ClientPosition = nil
local tbl_32_upvr = {}
module_2_upvr.TaggedBlocks = tbl_32_upvr
Networking_upvr.Received("SetTagged", function(arg1, arg2, arg3, arg4) -- Line 531
	--[[ Upvalues[4]:
		[1]: tbl_32_upvr (readonly)
		[2]: GetVector3_upvr (readonly)
		[3]: Selected_upvr (readonly)
		[4]: UpdateBlockGui_upvr (readonly)
	]]
	tbl_32_upvr[GetVector3_upvr(arg1, arg2, arg3)] = {arg4[1], os.clock() + arg4[2]}
	if Selected_upvr.Value == arg1..','..arg2..','..arg3 then
		UpdateBlockGui_upvr:Fire()
	end
end)
local tbl_27_upvr = {}
module_2_upvr.PendingChanges = tbl_27_upvr
function module_2_upvr.GetBlock(arg1, arg2, arg3, arg4) -- Line 541
	--[[ Upvalues[2]:
		[1]: tbl_7_upvr (readonly)
		[2]: GetVector3_upvr (readonly)
	]]
	local var180 = tbl_7_upvr[GetVector3_upvr(math.floor(arg1 / 16), math.floor(arg2 / 16), math.floor(arg3 / 16))]
	if var180 == nil then return end
	if var180.Empty then
		if not arg4 then return end
		return {0}
	end
	if arg1 % 1 ~= 0 or arg2 % 1 ~= 0 or arg3 % 1 ~= 0 then
		warn("Decimal Cordinates: ", arg1, arg2, arg3, debug.traceback())
		return
	end
	local var182 = var180[arg1 % 16 + arg2 % 16 * 256 + arg3 % 16 * 16]
	if not var182 then return end
	if var182[1] == 0 and not arg4 then return end
	return var182
end
local tbl_12_upvr = {
	X = 1;
	Y = 256;
	Z = 16;
}
module_2_upvr.AxisInfo = tbl_12_upvr
local function CompareChunks_upvr(arg1, arg2) -- Line 567, Named "CompareChunks"
	-- KONSTANTERROR: [0] 1. Error Block 78 start (CF ANALYSIS FAILED)
	if arg1.Empty and arg2.Empty then
		return true
	end
	if arg2.Empty then
		return false
	end
	-- KONSTANTERROR: [0] 1. Error Block 78 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [122] 96. Error Block 35 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [122] 96. Error Block 35 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [17] 15. Error Block 7 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [122.7]
	-- KONSTANTERROR: [17] 15. Error Block 7 end (CF ANALYSIS FAILED)
end
function module_2_upvr.IsAlwaysActive(arg1, arg2, arg3) -- Line 629
	--[[ Upvalues[1]:
		[1]: RenderDistance_upvr (readonly)
	]]
	local var184
	if arg1 ^ 2 + arg2 ^ 2 + arg3 ^ 2 > RenderDistance_upvr.Value ^ 2 then
		var184 = false
	else
		var184 = true
	end
	return var184
end
local tbl_49_upvr = {}
local tbl_35_upvr = {}
module_2_upvr.OreBoxes = tbl_49_upvr
local tbl_upvr = {}
for i_4, v_4 in GameDefinition_upvr.OreInfo do
	if 2 <= v_4[2] then
		tbl_35_upvr[i_4] = true
	end
	if 5 <= v_4[2] then
		tbl_upvr[i_4] = GameDefinition_upvr.RarityColors[v_4[2]]
	end
end
tbl_35_upvr[2044] = true
tbl_35_upvr[2045] = true
tbl_upvr[2045] = Color3.fromRGB(0, 255, 0)
function module_2_upvr.AddOreBoxes(arg1, arg2, arg3) -- Line 651
	--[[ Upvalues[5]:
		[1]: GetVector3_upvr (readonly)
		[2]: tbl_7_upvr (readonly)
		[3]: tbl_49_upvr (readonly)
		[4]: tbl_35_upvr (readonly)
		[5]: tbl_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 35 start (CF ANALYSIS FAILED)
	local GetVector3_upvr_result1 = GetVector3_upvr(arg1, arg2, arg3)
	local var193 = tbl_7_upvr[GetVector3_upvr_result1]
	local var194
	if not var193 then return end
	var194 = tbl_49_upvr[GetVector3_upvr_result1]
	if not var194 then
		var194 = {}
		tbl_49_upvr[GetVector3_upvr_result1] = var194
	end
	for i_5, v_5 in var194 do
		if not var193[i_5] then
			if typeof(v_5) == "Instance" then
				v_5:Destroy()
			end
			var194[i_5] = nil
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 35 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [120] 98. Error Block 30 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [120] 98. Error Block 30 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [40] 36. Error Block 12 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	-- KONSTANTERROR: [40] 36. Error Block 12 end (CF ANALYSIS FAILED)
end
function module_2_upvr.RemoveOreBoxes(arg1, arg2, arg3) -- Line 705
	--[[ Upvalues[2]:
		[1]: GetVector3_upvr (readonly)
		[2]: tbl_49_upvr (readonly)
	]]
	local var23_result1 = GetVector3_upvr(arg1, arg2, arg3)
	local var198 = tbl_49_upvr[var23_result1]
	if not var198 then
	else
		tbl_49_upvr[var23_result1] = nil
		for _, v_43 in var198 do
			if typeof(v_43) == "Instance" then
				v_43:Destroy()
			end
		end
	end
end
local tbl_14_upvr = {}
local function UpdatePinnedBlocks_upvr() -- Line 718, Named "UpdatePinnedBlocks"
	--[[ Upvalues[9]:
		[1]: tbl_14_upvr (readonly)
		[2]: tbl_upvr (readonly)
		[3]: GameDefinition_upvr (readonly)
		[4]: any_GetData_result1_upvr (readonly)
		[5]: FormulaHandler_upvr (readonly)
		[6]: tbl_49_upvr (readonly)
		[7]: FromVector3_upvr (readonly)
		[8]: module_2_upvr (readonly)
		[9]: UpdatePinnedBlocks_upvr (readonly)
	]]
	local var220
	for _, v_6 in var220 do
		v_6:Disconnect()
	end
	var220 = table.clear
	var220(tbl_14_upvr)
	var220 = false
	for i_7, _ in tbl_upvr do
		local var221 = GameDefinition_upvr.RarityMap[i_7]
		if var221 and var221 < 5 then
			tbl_upvr[i_7] = nil
			var220 = true
		end
	end
	for _, v_8 in string.split(any_GetData_result1_upvr.Others.PinnedRecipes.Value, ',') do
		local tonumber_result1_2 = tonumber(v_8)
		if tonumber_result1_2 and GameDefinition_upvr.Accessories[tonumber_result1_2] then
			for _, v_9_upvr in FormulaHandler_upvr.GetRecipe(any_GetData_result1_upvr, tonumber_result1_2), nil do
				local var226_upvr = GameDefinition_upvr.RarityMap[v_9_upvr[1]]
				if var226_upvr and var226_upvr >= 3 and 5 > var226_upvr then
					local var227_upvr = any_GetData_result1_upvr.Blocks[v_9_upvr[1]]
					local ArchivedBlocks_upvw = any_GetData_result1_upvr.ArchivedBlocks
					local var229_upvr = ArchivedBlocks_upvw[v_9_upvr[1]]
					if var227_upvr.Value + var229_upvr.Value >= v_9_upvr[2] then
						ArchivedBlocks_upvw = false
					else
						ArchivedBlocks_upvw = true
					end
					if ArchivedBlocks_upvw then
						tbl_upvr[v_9_upvr[1]] = GameDefinition_upvr.RarityColors[var226_upvr]
						var220 = true
					end
					local function Update() -- Line 751
						--[[ Upvalues[10]:
							[1]: var227_upvr (readonly)
							[2]: var229_upvr (readonly)
							[3]: v_9_upvr (readonly)
							[4]: ArchivedBlocks_upvw (read and write)
							[5]: tbl_upvr (copied, readonly)
							[6]: GameDefinition_upvr (copied, readonly)
							[7]: var226_upvr (readonly)
							[8]: tbl_49_upvr (copied, readonly)
							[9]: FromVector3_upvr (copied, readonly)
							[10]: module_2_upvr (copied, readonly)
						]]
						local var234
						if var227_upvr.Value + var229_upvr.Value >= v_9_upvr[2] then
							var234 = false
						else
							var234 = true
						end
						if var234 == ArchivedBlocks_upvw then
						else
							if not var234 then
								tbl_upvr[v_9_upvr[1]] = nil
							else
								tbl_upvr[v_9_upvr[1]] = GameDefinition_upvr.RarityColors[var226_upvr]
							end
							ArchivedBlocks_upvw = var234
							for i_47, _ in tbl_49_upvr do
								local FromVector3_upvr_result1_4, FromVector3_upvr_result2, var24_result3 = FromVector3_upvr(i_47)
								module_2_upvr.RemoveOreBoxes(FromVector3_upvr_result1_4, FromVector3_upvr_result2, var24_result3)
								module_2_upvr.AddOreBoxes(FromVector3_upvr_result1_4, FromVector3_upvr_result2, var24_result3)
							end
						end
					end
					table.insert(tbl_14_upvr, var227_upvr:GetPropertyChangedSignal("Value"):Connect(Update))
					table.insert(tbl_14_upvr, var229_upvr:GetPropertyChangedSignal("Value"):Connect(Update))
				end
			end
			var226_upvr = any_GetData_result1_upvr
			table.insert(tbl_14_upvr, var226_upvr.Accessories.Levels[tonumber_result1_2]:GetPropertyChangedSignal("Value"):Connect(UpdatePinnedBlocks_upvr))
		end
	end
	if var220 then
		for i_10, _ in tbl_49_upvr do
			local FromVector3_upvr_result1_2, var24_result2, FromVector3_upvr_result3 = FromVector3_upvr(i_10)
			module_2_upvr.RemoveOreBoxes(FromVector3_upvr_result1_2, var24_result2, FromVector3_upvr_result3)
			module_2_upvr.AddOreBoxes(FromVector3_upvr_result1_2, var24_result2, FromVector3_upvr_result3)
		end
	end
end
any_GetData_result1_upvr.Others.PinnedRecipes:GetPropertyChangedSignal("Value"):Connect(UpdatePinnedBlocks_upvr)
UpdatePinnedBlocks_upvr()
function module_2_upvr.LoadChunk(arg1, arg2, arg3, arg4, arg5) -- Line 787
	--[[ Upvalues[9]:
		[1]: GetVector3_upvr (readonly)
		[2]: tbl_7_upvr (readonly)
		[3]: CompareChunks_upvr (readonly)
		[4]: tbl_27_upvr (readonly)
		[5]: module_2_upvr (readonly)
		[6]: BlockHandler_upvr (readonly)
		[7]: tbl_35_upvr (readonly)
		[8]: tbl_12_upvr (readonly)
		[9]: BlockCache_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var269 = arg3
	local GetVector3_upvr_result1_9 = GetVector3_upvr(arg1, arg2, var269)
	local var271
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [31] 29. Error Block 64 start (CF ANALYSIS FAILED)
	if var269 then return end
	module_2_upvr.UnloadChunk(arg1, arg2, arg3)
	-- KONSTANTERROR: [31] 29. Error Block 64 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [40] 37. Error Block 65 start (CF ANALYSIS FAILED)
	local tbl_8 = {
		Loading = true;
	}
	if arg5 then
		tbl_8.Unrendered = true
	end
	tbl_7_upvr[GetVector3_upvr_result1_9] = tbl_8
	if arg4.Empty then
		tbl_8.Empty = true
		tbl_8.Loading = nil
		return
	end
	for i_11, v_11 in arg4 do
		if v_11 == 0 then
			tbl_8[i_11] = {0}
		elseif type(v_11) == "number" then
			({})[i_11] = v_11
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			;({})[i_11] = v_11[1]
			local tbl_47 = {}
			var271 = v_11
			tbl_47[1] = table.unpack(var271, 2)
			;({})[i_11] = tbl_47
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	local any_MergeChunk_result1, any_MergeChunk_result2, any_MergeChunk_result3 = module_2_upvr.MergeChunk({})
	if os.clock() + 0.1 <= os.clock() then
		BlockHandler_upvr.BulkMove()
	end
	if not tbl_8.Unloading then
		if tbl_35_upvr[var271[1]] then
		end
		if arg5 then
			local var280 = tbl_12_upvr[var271[3]]
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			for i_12 = table.unpack(var271, 2), table.unpack(var271, 2) + var271[2] * var280 - var280, var280 do
				local tbl_23 = {}
				local var282
				if var271[2] ~= 1 then
					var282 = var271[3]
				else
					var282 = nil
				end
				tbl_23[1] = var271[1]
				tbl_23[2] = nil
				tbl_23[3] = var282
				tbl_8[i_12] = tbl_23
			end
			-- KONSTANTWARNING: GOTO [118] #95
		end
		-- KONSTANTWARNING: GOTO [170] #138
	end
	for i_13, v_12 in {} do
		local var283 = tbl_8[i_13]
		if var283 then
			local _1_11 = var283[1]
			if type(_1_11) == "number" then
				var283[1] = {_1_11, table.unpack(v_12)}
			else
				for var267, var268 in v_12 do
					var282 = var267 + 1
					_1_11[var282] = var268
					local _
				end
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	end
	if true then
		i_13 = arg3
		module_2_upvr.AddOreBoxes(arg1, arg2, i_13)
	end
	tbl_8.Loading = nil
	do
		return 0 + task.wait()
	end
	-- KONSTANTERROR: [40] 37. Error Block 65 end (CF ANALYSIS FAILED)
end
function module_2_upvr.GetServerPosition() -- Line 890
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local ServerPosition = module_2_upvr.ServerPosition
	if not ServerPosition then
		return 0, 0, 0, 0
	end
	return ServerPosition[1], ServerPosition[2], ServerPosition[3], ServerPosition[4]
end
function module_2_upvr.GetChunk(arg1, arg2, arg3) -- Line 896
	--[[ Upvalues[4]:
		[1]: GetVector3_upvr (readonly)
		[2]: module_2_upvr (readonly)
		[3]: tbl_7_upvr (readonly)
		[4]: tbl_11_upvr (readonly)
	]]
	local GetVector3_upvr_result1_4 = GetVector3_upvr(arg1, arg2, arg3)
	local any_GetServerPosition_result1_2, any_GetServerPosition_result2, any_GetServerPosition_result3_2, any_GetServerPosition_result4_2 = module_2_upvr.GetServerPosition()
	if any_GetServerPosition_result4_2 ^ 2 < (arg1 - any_GetServerPosition_result1_2) ^ 2 + (arg2 - any_GetServerPosition_result2) ^ 2 + (arg3 - any_GetServerPosition_result3_2) ^ 2 and not tbl_7_upvr[GetVector3_upvr_result1_4] then
		while module_2_upvr.IsDownloading do
			task.wait()
		end
	end
	while tbl_11_upvr[GetVector3_upvr_result1_4] do
		task.wait()
	end
	local var293 = tbl_7_upvr[GetVector3_upvr_result1_4]
	if var293 then
		while not (var293.Rendering or var293.Unrendering or not var293.Loading) do
			task.wait()
		end
	end
	return tbl_7_upvr[GetVector3_upvr_result1_4]
end
local function _(arg1) -- Line 920, Named "GetId"
	if type(arg1) == "number" then
		return arg1
	end
	return arg1[1]
end
local MergeAllowed_upvr_2 = BlockHandler_upvr.MergeAllowed
local function combine_upvr(arg1, arg2, arg3, arg4, arg5, arg6, arg7) -- Line 924, Named "combine"
	--[[ Upvalues[4]:
		[1]: MergeAllowed_upvr_2 (readonly)
		[2]: tbl_12_upvr (readonly)
		[3]: BlockHandler_upvr (readonly)
		[4]: BlockCache_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 129 start (CF ANALYSIS FAILED)
	local var295
	if not MergeAllowed_upvr_2[arg7] then
		return false
	end
	local var296 = tbl_12_upvr[arg2]
	local var297 = var296 * 16
	local var298 = math.floor(arg6 / var297) * var297
	local var299 = var298 + var297
	if var298 <= arg6 - var296 then
		var299 = arg1[arg6 - var296]
	else
		var299 = nil
	end
	if arg6 + var296 <= var299 - 1 then
	else
	end
	-- KONSTANTERROR: [0] 1. Error Block 129 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [31] 29. Error Block 130 start (CF ANALYSIS FAILED)
	local _1_13 = var299[1]
	if type(_1_13) == "number" then
		var295 = _1_13
	else
		var295 = _1_13[1]
	end
	-- KONSTANTERROR: [31] 29. Error Block 130 end (CF ANALYSIS FAILED)
end
local function combineall_upvr(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 1020, Named "combineall"
	--[[ Upvalues[1]:
		[1]: combine_upvr (readonly)
	]]
	if combine_upvr(arg1, 'X', arg2, arg3, arg4, arg5, arg6) then
		return true
	end
	if combine_upvr(arg1, 'Z', arg2, arg3, arg4, arg5, arg6) then
		return true
	end
	if combine_upvr(arg1, 'Y', arg2, arg3, arg4, arg5, arg6) then
		return true
	end
	return false
end
local tbl_3_upvr = {}
local function UpdateOrePointers_upvr() -- Line 1034, Named "UpdateOrePointers"
	--[[ Upvalues[10]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: any_GetData_result1_upvr (readonly)
		[3]: FormulaHandler_upvr (readonly)
		[4]: SharedFunctions_upvr (readonly)
		[5]: module_2_upvr (readonly)
		[6]: GetVector3_upvr (readonly)
		[7]: tbl_49_upvr (readonly)
		[8]: tbl_7_upvr (readonly)
		[9]: GameDefinition_upvr (readonly)
		[10]: tbl_3_upvr (readonly)
	]]
	local Character_14 = LocalPlayer_upvr.Character
	if not Character_14 then
	else
		local HumanoidRootPart_7 = Character_14:FindFirstChild("HumanoidRootPart")
		if not HumanoidRootPart_7 then return end
		if any_GetData_result1_upvr.Accessories.Equipped[10].Value then
			local any_GetAccessoryBoost_result1 = FormulaHandler_upvr.GetAccessoryBoost(any_GetData_result1_upvr, "RadarRadius")
			local any_ToPosition_result1_3, any_ToPosition_result2_3, any_ToPosition_result3_3 = SharedFunctions_upvr.ToPosition(module_2_upvr.Position)
			local var379 = (any_ToPosition_result1_3 - any_GetAccessoryBoost_result1) // 16
			local var380 = (any_ToPosition_result2_3 - any_GetAccessoryBoost_result1) // 16
			local var381 = (any_ToPosition_result3_3 - any_GetAccessoryBoost_result1) // 16
			for i_48 = 0, (any_ToPosition_result1_3 + any_GetAccessoryBoost_result1) // 16 - var379 do
				for i_49 = 0, (any_ToPosition_result2_3 + any_GetAccessoryBoost_result1) // 16 - var380 do
					for i_50 = 0, (any_ToPosition_result3_3 + any_GetAccessoryBoost_result1) // 16 - var381 do
						local var382 = var379 + i_48
						local var383 = var380 + i_49
						local var384 = var381 + i_50
						local GetVector3_upvr_result1_2 = GetVector3_upvr(var382, var383, var384)
						local var386 = tbl_49_upvr[GetVector3_upvr_result1_2]
						if var386 then
							local var387 = tbl_7_upvr[GetVector3_upvr_result1_2]
							if var387 then
								for i_51, _ in var386 do
									local var388 = var387[i_51]
									if var388 then
										local _1_3 = var388[1]
										if _1_3 ~= 0 then
											if type(_1_3) == "table" then
												if not _1_3[3] or not bit32.btest(_1_3[3], 2) then
													-- KONSTANTWARNING: GOTO [106] #93
												end
											else
												local var390 = GameDefinition_upvr.OreInfo[_1_3]
												if var390 then
													if var390[2] >= 5 then
														local var391 = var382 * 16 + i_51 % 16
														local var392 = var383 * 16 + i_51 // 256
														local var393 = var384 * 16 + i_51 // 16 % 16
														if (var391 - any_ToPosition_result1_3) ^ 2 + (var392 - any_ToPosition_result2_3) ^ 2 + (var393 - any_ToPosition_result3_3) ^ 2 <= any_GetAccessoryBoost_result1 ^ 2 then
															local var23_result1_2 = GetVector3_upvr(var391, var392, var393)
															;({})[var23_result1_2] = true
															if not tbl_3_upvr[var23_result1_2] then
																local Part_2 = Instance.new("Part")
																Part_2.Anchored = true
																Part_2.Size = Vector3.new(6, 6, 6)
																Part_2.Transparency = 1
																Part_2.CanCollide = false
																Part_2.CFrame = SharedFunctions_upvr.GetCFrame(var391, var392, var393, module_2_upvr.Position.World)
																Part_2.Parent = workspace.Objects
																local Attachment_3 = HumanoidRootPart_7:FindFirstChild("Attachment")
																if not Attachment_3 then
																	Attachment_3 = Instance.new("Attachment")
																	Attachment_3.Parent = HumanoidRootPart_7
																end
																local Attachment_2 = Instance.new("Attachment")
																Attachment_2.Parent = Part_2
																local clone_18 = script.Arrows:Clone()
																clone_18.Attachment0 = Attachment_3
																clone_18.Attachment1 = Attachment_2
																local var399 = GameDefinition_upvr.RarityColors[var390[2]]
																if not var399 then
																	var399 = Color3.fromRGB(255, 255, 255)
																end
																clone_18.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, var399), ColorSequenceKeypoint.new(1, var399)})
																clone_18.Parent = Part_2
																tbl_3_upvr[var23_result1_2] = {Part_2, clone_18, Character_14}
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
		for i_52, v_46 in tbl_3_upvr do
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if not ({})[i_52] or not v_46[3].Parent then
				tbl_3_upvr[i_52] = nil
				v_46[1]:Destroy()
				v_46[2]:Destroy()
			end
		end
	end
end
local RarityMap_upvr = GameDefinition_upvr.RarityMap
var168_upvw = 4
any_GetData_result1_upvr.Accessories.Levels[11]:GetPropertyChangedSignal("Value"):Connect(function() -- Line 1127, Named "UpdateMinUncoveredRarity"
	--[[ Upvalues[2]:
		[1]: any_GetData_result1_upvr (readonly)
		[2]: var168_upvw (read and write)
	]]
	if 3 <= any_GetData_result1_upvr.Accessories.Levels[11].Value then
		var168_upvw = 5
	else
		var168_upvw = 4
	end
end)
if 3 <= any_GetData_result1_upvr.Accessories.Levels[11].Value then
	var168_upvw = 5
else
	var168_upvw = 4
end
function module_2_upvr.IsClosest(arg1, arg2, arg3) -- Line 1137
	--[[ Upvalues[3]:
		[1]: SharedFunctions_upvr (readonly)
		[2]: module_2_upvr (readonly)
		[3]: LocalPlayer_upvr (readonly)
	]]
	local players, NONE_14, NONE_2 = game.Players:GetPlayers()
	local var421
	for _, v_13 in players, NONE_14, NONE_2 do
		local Character_12 = v_13.Character
		if Character_12 then
			if Character_12.Parent then
				local HumanoidRootPart_3 = Character_12:FindFirstChild("HumanoidRootPart")
				if HumanoidRootPart_3 then
					if vector.magnitude(HumanoidRootPart_3.Position - SharedFunctions_upvr.GetCFrame(arg1, arg2, arg3, module_2_upvr.Position.World).Position) < math.huge then
					end
				end
			end
		end
	end
	if LocalPlayer_upvr ~= nil then
		players = false
	else
		players = true
	end
	return players
end
function module_2_upvr.ContainsRareBlock(arg1) -- Line 1160
	--[[ Upvalues[1]:
		[1]: RarityMap_upvr (readonly)
	]]
	local var425
	local var426
	if typeof(arg1) == "buffer" then
		var425 = arg1
	else
		var425 = buffer.fromstring(arg1)
	end
	local buffer_readu16_result1 = buffer.readu16(var425, var426)
	var426 += 2
	if 32768 <= buffer_readu16_result1 then
		buffer_readu16_result1 -= 32768
		var426 += 2
	end
	while var426 < var426 + buffer_readu16_result1 do
		if 127 < buffer.readu8(var425, var426) then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		end
		local buffer_readu8_result1 = buffer.readu8(var425, var426 + 1 + 1)
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if 127 < buffer_readu8_result1 then
			buffer_readu8_result1 = buffer_readu8_result1 * 256 + buffer.readu8(var425, var426 + 1 + 1 + 1) - 32640
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		end
		local var430 = buffer_readu8_result1 - 1
		local var431 = var430 // 2056
		if not bit32.btest(var431, 2) then
			local var432 = var430 - var431 * 2056
			local var433 = RarityMap_upvr[var432]
			if var433 and 3 <= var433 or var432 == 2044 or var432 == 2045 then
				return true
			end
		end
	end
	return false
end
function module_2_upvr.UncoveredMessage(arg1, arg2, arg3, arg4) -- Line 1206
	--[[ Upvalues[7]:
		[1]: RarityMap_upvr (readonly)
		[2]: var168_upvw (read and write)
		[3]: module_2_upvr (readonly)
		[4]: SharedFunctions_upvr (readonly)
		[5]: SoundHandler_upvr (readonly)
		[6]: Translator_upvr (readonly)
		[7]: GameDefinition_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 31 start (CF ANALYSIS FAILED)
	if type(arg4) == "number" then
	else
	end
	-- KONSTANTERROR: [0] 1. Error Block 31 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [18] 15. Error Block 6 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [18] 15. Error Block 6 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [20] 17. Error Block 7 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [20] 17. Error Block 7 end (CF ANALYSIS FAILED)
end
local function PlaceBlock_upvr(arg1, arg2, arg3, arg4) -- Line 1234, Named "PlaceBlock"
	--[[ Upvalues[12]:
		[1]: module_2_upvr (readonly)
		[2]: RenderDistance_upvr (readonly)
		[3]: tbl_7_upvr (readonly)
		[4]: GetVector3_upvr (readonly)
		[5]: combineall_upvr (readonly)
		[6]: BlockCache_upvr (readonly)
		[7]: BlockHandler_upvr (readonly)
		[8]: tbl_35_upvr (readonly)
		[9]: tbl_49_upvr (readonly)
		[10]: tbl_upvr (readonly)
		[11]: GameDefinition_upvr (readonly)
		[12]: UpdateOrePointers_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local floored_3 = math.floor(arg1 / 16)
	local floored_9 = math.floor(arg2 / 16)
	local floored = math.floor(arg3 / 16)
	local var441
	if not module_2_upvr.GetChunk(floored_3, floored_9, floored) then
		local tbl_17 = {}
		var441 = (floored_3 - module_2_upvr.ClientPosition[1]) ^ 2 + (floored_9 - module_2_upvr.ClientPosition[2]) ^ 2
		var441 = math.max(RenderDistance_upvr.Value, 8) ^ 2
		if var441 < var441 + (floored - module_2_upvr.ClientPosition[3]) ^ 2 then
			var441 = true
			tbl_17.Unrendered = var441
		end
		var441 = tbl_7_upvr
		var441[GetVector3_upvr(floored_3, floored_9, floored)] = tbl_17
	end
	if tbl_17.Unloading then
	else
		if tbl_17.Empty then
			for i_53 = 0, 4095 do
				var441 = {}
				var441[1] = 0
				tbl_17[i_53] = var441
				local var444
			end
			var444.Empty = nil
		end
		var441 = arg2 % 16 * 256
		var441 = arg3 % 16
		local var445 = arg1 % 16 + var441 + var441 * 16
		local var446 = var444[var445]
		if var446 and var446[1] ~= 0 then return end
		if var444.Unrendered then
			local tbl_37 = {}
			var441 = arg4
			tbl_37[1] = var441
			var444[var445] = tbl_37
			return
		end
		var441 = type(arg4)
		if var441 == "number" then
			local _ = arg4
		else
		end
		var441 = 0
		if type(arg4) == "table" then
			var441 = arg4[3] or 0
		end
		module_2_upvr.UncoveredMessage(arg1, arg2, arg3, arg4)
		if not combineall_upvr(var444, arg1, arg2, arg3, var445, arg4[1]) then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			local any_GetBlock_result1_2 = BlockCache_upvr.GetBlock(arg4[1])
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			BlockHandler_upvr.MoveBlockNoQueue(any_GetBlock_result1_2, arg4[1], arg1, arg2, arg3)
			local tbl_41 = {}
			tbl_41[1] = arg4
			tbl_41[2] = any_GetBlock_result1_2
			var444[var445] = tbl_41
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		local var451
		if nil and not bit32.btest(var441, 2) then
			local var452 = nil
			if not var452 then
				var452 = {}
				tbl_49_upvr[GetVector3_upvr(floored_3, floored_9, floored)] = var452
			end
			local var453 = var452[var445]
			if typeof(var453) == "Instance" then
				var453:Destroy()
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			local var454 = tbl_upvr[arg4[1]]
			local var455
			if not var454 then
				var455 = true
				var452[var445] = var455
			else
				var455 = nil
				local var456 = var444[var445]
				if var456 then
					var455 = var456[2]
				end
				if var455 then
					local Highlight_2 = Instance.new("Highlight")
					Highlight_2.FillTransparency = 1
					Highlight_2.OutlineColor = var454
					Highlight_2.Adornee = var455
					Highlight_2.Parent = workspace.Objects
					var452[var445] = Highlight_2
				else
					var452[var445] = true
				end
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
		if not bit32.btest(var441, 2) and 5 <= (GameDefinition_upvr.RarityMap[arg4[1]] or 0) then
			UpdateOrePointers_upvr()
		end
	end
end
local function DestroyBlock_upvr(arg1, arg2, arg3) -- Line 1316, Named "DestroyBlock"
	--[[ Upvalues[11]:
		[1]: GetVector3_upvr (readonly)
		[2]: tbl_3_upvr (readonly)
		[3]: tbl_32_upvr (readonly)
		[4]: module_2_upvr (readonly)
		[5]: RenderDistance_upvr (readonly)
		[6]: tbl_7_upvr (readonly)
		[7]: tbl_49_upvr (readonly)
		[8]: BlockCache_upvr (readonly)
		[9]: tbl_12_upvr (readonly)
		[10]: combineall_upvr (readonly)
		[11]: BlockHandler_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 277 start (CF ANALYSIS FAILED)
	local GetVector3_upvr_result1_5 = GetVector3_upvr(arg1, arg2, arg3)
	local var516 = tbl_3_upvr[GetVector3_upvr_result1_5]
	local var517
	if var516 then
		var516[1]:Destroy()
		var516[2]:Destroy()
		tbl_3_upvr[GetVector3_upvr_result1_5] = nil
	end
	tbl_32_upvr[GetVector3_upvr_result1_5] = nil
	local floored_10 = math.floor(arg1 / 16)
	local floored_2 = math.floor(arg2 / 16)
	local floored_7 = math.floor(arg3 / 16)
	if not module_2_upvr.GetChunk(floored_10, floored_2, floored_7) then
		local tbl_48 = {}
		var517 = (floored_10 - module_2_upvr.ClientPosition[1]) ^ 2
		var517 = (floored_7 - module_2_upvr.ClientPosition[3]) ^ 2
		var517 = math.max(RenderDistance_upvr.Value, 8)
		if var517 ^ 2 < var517 + (floored_2 - module_2_upvr.ClientPosition[2]) ^ 2 + var517 then
			tbl_48.Unrendered = true
		end
		var517 = GetVector3_upvr(floored_10, floored_2, floored_7)
		tbl_7_upvr[var517] = tbl_48
	end
	if tbl_48.Unloading then return end
	var517 = arg2 % 16
	local var523 = arg1 % 16 + var517 * 256 + arg3 % 16 * 16
	var517 = floored_10
	local var524 = tbl_49_upvr[GetVector3_upvr(var517, floored_2, floored_7)]
	if var524 then
		local var525 = var524[var523]
		if var525 then
			var524[var523] = nil
			var517 = var525
			if typeof(var517) == "Instance" then
				var525:Destroy()
			end
		end
	end
	local var526 = tbl_48[var523]
	local tbl_21 = {}
	var517 = 0
	tbl_21[1] = var517
	tbl_48[var523] = tbl_21
	if not var526 then return end
	local _2_2 = var526[2]
	if not _2_2 then return end
	local _1_7 = var526[1]
	if type(_1_7) == "number" then
		var517 = _1_7
	else
		var517 = _1_7[1]
	end
	local _3_2 = var526[3]
	-- KONSTANTERROR: [0] 1. Error Block 277 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [144] 124. Error Block 22 start (CF ANALYSIS FAILED)
	BlockCache_upvr.Destroy(_2_2, var517)
	do
		return
	end
	-- KONSTANTERROR: [144] 124. Error Block 22 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [151] 130. Error Block 281 start (CF ANALYSIS FAILED)
	local var531 = tbl_12_upvr[_3_2]
	local var532 = var531 * 16
	local var533 = math.floor(var523 / var532) * var532
	local var534 = var533 + var532
	if var533 <= var523 - var531 then
		var534 = tbl_48[var523 - var531]
	else
		var534 = nil
	end
	if var523 + var531 <= var534 - 1 then
	else
	end
	-- KONSTANTERROR: [151] 130. Error Block 281 end (CF ANALYSIS FAILED)
end
module_2_upvr.AddBlock = PlaceBlock_upvr
module_2_upvr.DestroyBlock = DestroyBlock_upvr
function module_2_upvr.UpdateBlock(arg1, arg2, arg3, arg4) -- Line 1530
	--[[ Upvalues[5]:
		[1]: module_2_upvr (readonly)
		[2]: DestroyBlock_upvr (readonly)
		[3]: PlaceBlock_upvr (readonly)
		[4]: Selected_upvr (readonly)
		[5]: UpdateBlockGui_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local any_GetChunk_result1 = module_2_upvr.GetChunk(math.floor(arg1 / 16), math.floor(arg2 / 16), math.floor(arg3 / 16))
	local var536
	if not any_GetChunk_result1 or any_GetChunk_result1.Unloading then
	else
		var536 = arg1 % 16
		var536 = arg3 % 16 * 16
		local var537 = any_GetChunk_result1[var536 + arg2 % 16 * 256 + var536]
		if not var537 then return end
		local _1_10 = var537[1]
		if type(_1_10) == "number" then
			var536 = _1_10
		else
			var536 = _1_10[1]
		end
		if type(arg4) == "number" then
		else
		end
		if var536 ~= arg4[1] then
			var536 = DestroyBlock_upvr
			var536(arg1, arg2, arg3)
			var536 = PlaceBlock_upvr
			var536(arg1, arg2, arg3, arg4)
			return
		end
		var537[1] = arg4
		var536 = Selected_upvr.Value
		if var536 == arg1..','..arg2..','..arg3 then
			var536 = UpdateBlockGui_upvr:Fire
			var536()
		end
	end
end
local AnimatingBlocks_upvr = BlockCache_upvr.AnimatingBlocks
local var540_upvw = 0
function module_2_upvr.DestroyAnimation(arg1, arg2, arg3, arg4) -- Line 1556
	--[[ Upvalues[4]:
		[1]: var540_upvw (read and write)
		[2]: BlockCache_upvr (readonly)
		[3]: BlockHandler_upvr (readonly)
		[4]: AnimatingBlocks_upvr (readonly)
	]]
	if 50 <= var540_upvw then
	else
		var540_upvw += 1
		local any_GetBlock_result1 = BlockCache_upvr.GetBlock(arg4)
		BlockHandler_upvr.MoveBlockNoQueue(any_GetBlock_result1, arg4, arg1, arg2, arg3)
		local var542
		if any_GetBlock_result1.ClassName == "Model" then
			any_GetBlock_result1.PrimaryPart.CanQuery = false
			var542 = any_GetBlock_result1:GetScale()
		else
			any_GetBlock_result1.CanQuery = false
			var542 = any_GetBlock_result1.Size
		end
		local tbl_30 = {0}
		tbl_30[2] = arg4
		tbl_30[3] = var542
		AnimatingBlocks_upvr[any_GetBlock_result1] = tbl_30
	end
end
local var544_upvw = 0
local var545_upvw = 0
function module_2_upvr.TeleportAnimation(arg1, arg2, arg3) -- Line 1577
	--[[ Upvalues[4]:
		[1]: SharedFunctions_upvr (readonly)
		[2]: module_2_upvr (readonly)
		[3]: var544_upvw (read and write)
		[4]: var545_upvw (read and write)
	]]
	local any_ToPosition_result1_2, any_ToPosition_result2, any_ToPosition_result3_2 = SharedFunctions_upvr.ToPosition(module_2_upvr.Position)
	if (any_ToPosition_result1_2 - arg1) ^ 2 + (any_ToPosition_result2 - arg2) ^ 2 + (any_ToPosition_result3_2 - arg3) ^ 2 <= 2500 then
	else
		var544_upvw = 0
		var545_upvw = 1
		while var544_upvw < 1 and var545_upvw == 1 do
			task.wait()
		end
	end
end
local tbl_46_upvr = {}
local tbl_10_upvr = {}
local tbl_42_upvr = {}
local var553_upvw = 0
local TeleportTransition_upvr = Game_upvr.TeleportTransition
local var555_upvw = 0
local var556_upvw = 0
game:GetService("RunService").RenderStepped:Connect(function(arg1) -- Line 1592
	--[[ Upvalues[18]:
		[1]: AnimatingBlocks_upvr (readonly)
		[2]: var540_upvw (read and write)
		[3]: BlockCache_upvr (readonly)
		[4]: var553_upvw (read and write)
		[5]: tbl_46_upvr (readonly)
		[6]: UpdateClosePlayers_upvr (readonly)
		[7]: tbl_32_upvr (readonly)
		[8]: var545_upvw (read and write)
		[9]: var544_upvw (read and write)
		[10]: Game_upvr (readonly)
		[11]: TeleportTransition_upvr (readonly)
		[12]: var555_upvw (read and write)
		[13]: UpdateOrePointers_upvr (readonly)
		[14]: LocalPlayer_upvr (readonly)
		[15]: tbl_10_upvr (readonly)
		[16]: tbl_42_upvr (readonly)
		[17]: var556_upvw (read and write)
		[18]: tbl_2_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	for i_15, v_14 in AnimatingBlocks_upvr do
		local var682 = v_14[1] + arg1 / 0.1
		if 1 <= var682 then
			AnimatingBlocks_upvr[i_15] = nil
			var540_upvw -= 1
			if i_15.ClassName == "Model" then
				i_15:ScaleTo(v_14[3])
				i_15.PrimaryPart.CanQuery = true
			else
				i_15.Size = v_14[3]
				i_15.CanQuery = true
			end
			BlockCache_upvr.Destroy(i_15, v_14[2])
		else
			v_14[1] = var682
			if i_15.ClassName == "Model" then
				i_15:ScaleTo(v_14[3] * (1 - var682))
			else
				i_15.Size = v_14[3] * (1 - var682)
			end
		end
	end
	if var553_upvw <= os.clock() then
		var553_upvw = os.clock() + 1
		for i_16, v_15 in tbl_46_upvr do
			if not i_16.Parent then
				tbl_46_upvr[i_16] = nil
			else
				pcall(v_15)
			end
		end
		task.spawn(UpdateClosePlayers_upvr)
		for i_17, v_16 in tbl_32_upvr do
			if v_16[2] <= os.clock() then
				tbl_32_upvr[i_17] = nil
			end
		end
	end
	if var545_upvw ~= 0 then
		var544_upvw += arg1 / 0.25 * var545_upvw
		if 2.25 <= var544_upvw then
			var545_upvw = -1
			var544_upvw = 1
		end
		if var544_upvw <= 0 then
			var544_upvw = 0
			var545_upvw = 0
		end
		local var683 = math.max(Game_upvr.AbsoluteSize.X, Game_upvr.AbsoluteSize.Y) * 1.2
		TeleportTransition_upvr.Size = UDim2.new(0, var683 * var544_upvw, 0, var683 * var544_upvw)
	end
	if var555_upvw <= os.clock() then
		var555_upvw = os.clock() + 0.2
		UpdateOrePointers_upvr()
	end
	local Character = LocalPlayer_upvr.Character
	if Character then
		local Head_2 = Character:FindFirstChild("Head")
		if Head_2 then
			for i_18, v_17 in tbl_10_upvr do
				i_18:PivotTo(CFrame.new(Head_2.Position + Vector3.new(0, Head_2.Size.Y / 2 + 2, 0), v_17) * CFrame.fromEulerAnglesXYZ((-math.pi/2), 0, 0))
				local _
			end
			for i_19, v_18 in tbl_42_upvr do
				if v_18 <= os.clock() then
					tbl_42_upvr[i_19] = nil
				end
			end
		end
		if var556_upvw <= os.clock() then
			var556_upvw = os.clock() + 0.2
			local HumanoidRootPart_2 = Character:FindFirstChild("HumanoidRootPart")
			if HumanoidRootPart_2 then
				for i_20, v_19 in tbl_2_upvr do
					local clamped = math.clamp((vector.magnitude(i_20.Position - HumanoidRootPart_2.Position) - 150) / 50, 0, 1)
					v_19.BlocksMined.Icon.ImageTransparency = clamped
					v_19.BlocksMined.Count.TextTransparency = clamped
					v_19.Cash.Icon.ImageTransparency = clamped
					v_19.Cash.Count.TextTransparency = clamped
					local _
				end
			end
		end
	end
	for _, v_20 in game.Players:GetPlayers() do
		local Character_8 = v_20.Character
		if Character_8 and Character_8.Parent and Character_8:FindFirstChild("Tool") then
			local Handle_2 = Character_8:FindFirstChild("Tool"):FindFirstChild("Handle")
			if Handle_2 then
				local Block_2 = Handle_2:FindFirstChild("Block")
				if Block_2 and Block_2:IsA("Model") then
					Block_2:PivotTo(Handle_2.CFrame)
				end
			end
		end
	end
end)
local tbl_22_upvr = {}
task.spawn(function() -- Line 1701
	--[[ Upvalues[2]:
		[1]: tbl_22_upvr (readonly)
		[2]: tbl_27_upvr (readonly)
	]]
	while task.wait(1) do
		for i_22, v_21 in tbl_22_upvr do
			if v_21 + 10 <= os.clock() then
				tbl_22_upvr[i_22] = nil
			else
			end
		end
		for i_23, v_22 in tbl_27_upvr do
			for i_24, v_23 in v_22 do
				if v_23 <= os.clock() then
					v_22[i_24] = nil
				end
			end
			if not next(v_22) then
				tbl_27_upvr[i_23] = nil
			end
		end
	end
end)
function module_2_upvr.SetBlocked(arg1, arg2, arg3, arg4) -- Line 1725
	--[[ Upvalues[1]:
		[1]: tbl_22_upvr (readonly)
	]]
	local var704 = arg1..','..arg2..','..arg3..','
	if type(arg4) == "table" then
		var704 = var704..arg4[1]
	else
		var704 = var704..arg4
	end
	tbl_22_upvr[var704] = os.clock()
end
function module_2_upvr.IsBlocked(arg1, arg2, arg3, arg4, arg5) -- Line 1737
	--[[ Upvalues[1]:
		[1]: tbl_22_upvr (readonly)
	]]
	local var705 = arg1..','..arg2..','..arg3..','
	if type(arg4) == "table" then
		var705 = var705..arg4[1]
	else
		var705 = var705..arg4
	end
	if tbl_22_upvr[var705] then
		if not arg5 then
			tbl_22_upvr[var705] = nil
		end
		return true
	end
	return false
end
function module_2_upvr.GenerateBlock(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 1755
	--[[ Upvalues[6]:
		[1]: module_2_upvr (readonly)
		[2]: GetVector3_upvr (readonly)
		[3]: tbl_19_upvr (readonly)
		[4]: SharedFunctions_upvr (readonly)
		[5]: tbl_22_upvr (readonly)
		[6]: PlaceBlock_upvr (readonly)
	]]
	local var706
	if module_2_upvr.GetBlock(arg1, arg2, arg3, true) then
	else
		var706 = arg1 // 16
		local GetVector3_upvr_result1_7 = GetVector3_upvr(var706, arg2 // 16, arg3 // 16)
		var706 = tbl_19_upvr[GetVector3_upvr_result1_7]
		while not var706 do
			if module_2_upvr.GetBlock(arg1, arg2, arg3) or module_2_upvr.IsReloading then return end
			var706 = tbl_19_upvr[GetVector3_upvr_result1_7]
			task.wait()
		end
		if module_2_upvr.IsReloading then return end
		local any_GenerateBlock_result1 = SharedFunctions_upvr.GenerateBlock(arg1, arg2, arg3, arg1 % 16 + arg2 % 16 * 256 + arg3 % 16 * 16 + var706, arg4, arg5, arg6)
		local var709 = arg1..','..arg2..','..arg3..','
		if type(any_GenerateBlock_result1) == "table" then
			var709 = var709..any_GenerateBlock_result1[1]
		else
			var709 = var709..any_GenerateBlock_result1
		end
		tbl_22_upvr[var709] = os.clock()
		PlaceBlock_upvr(arg1, arg2, arg3, any_GenerateBlock_result1)
	end
end
function module_2_upvr.DestroyBlockWithGenerate(arg1, arg2, arg3) -- Line 1772
	--[[ Upvalues[5]:
		[1]: module_2_upvr (readonly)
		[2]: FormulaHandler_upvr (readonly)
		[3]: any_GetData_result1_upvr (readonly)
		[4]: tbl_22_upvr (readonly)
		[5]: DestroyBlock_upvr (readonly)
	]]
	local any_GetBlock_result1_3 = module_2_upvr.GetBlock(arg1, arg2, arg3)
	if not any_GetBlock_result1_3 then
	else
		local any_GetInfo_result1 = FormulaHandler_upvr.GetInfo(any_GetData_result1_upvr, "OreChance")
		local any_GetInfo_result1_2 = FormulaHandler_upvr.GetInfo(any_GetData_result1_upvr, "TNTChance")
		local any_GetInfo_result1_3 = FormulaHandler_upvr.GetInfo(any_GetData_result1_upvr, "EmeraldChance")
		module_2_upvr.GenerateBlock(arg1 - 1, arg2, arg3, any_GetInfo_result1, any_GetInfo_result1_2, any_GetInfo_result1_3)
		module_2_upvr.GenerateBlock(arg1 + 1, arg2, arg3, any_GetInfo_result1, any_GetInfo_result1_2, any_GetInfo_result1_3)
		module_2_upvr.GenerateBlock(arg1, arg2 - 1, arg3, any_GetInfo_result1, any_GetInfo_result1_2, any_GetInfo_result1_3)
		module_2_upvr.GenerateBlock(arg1, arg2 + 1, arg3, any_GetInfo_result1, any_GetInfo_result1_2, any_GetInfo_result1_3)
		module_2_upvr.GenerateBlock(arg1, arg2, arg3 - 1, any_GetInfo_result1, any_GetInfo_result1_2, any_GetInfo_result1_3)
		module_2_upvr.GenerateBlock(arg1, arg2, arg3 + 1, any_GetInfo_result1, any_GetInfo_result1_2, any_GetInfo_result1_3)
		if module_2_upvr.IsReloading then return end
		tbl_22_upvr[arg1..','..arg2..','..arg3..','..0] = os.clock()
		local var714 = DestroyBlock_upvr
		var714(arg1, arg2, arg3)
		if type(any_GetBlock_result1_3[1]) == "table" then
			var714 = any_GetBlock_result1_3[1][1]
		else
			var714 = any_GetBlock_result1_3[1]
		end
		module_2_upvr.DestroyAnimation(arg1, arg2, arg3, var714)
	end
end
function module_2_upvr.UnloadChunk(arg1, arg2, arg3) -- Line 1795
	--[[ Upvalues[4]:
		[1]: GetVector3_upvr (readonly)
		[2]: tbl_7_upvr (readonly)
		[3]: module_2_upvr (readonly)
		[4]: BlockCache_upvr (readonly)
	]]
	local GetVector3_upvr_result1_8 = GetVector3_upvr(arg1, arg2, arg3)
	local var728 = tbl_7_upvr[GetVector3_upvr_result1_8]
	if var728 == nil then
	else
		if var728.Unloading then return end
		var728.Unloading = true
		tbl_7_upvr[GetVector3_upvr_result1_8] = nil
		while true do
			if not var728.Loading then
				if not var728.Rendering then
					if not var728.Unrendering then break end
				end
			end
			task.wait()
		end
		module_2_upvr.RemoveOreBoxes(arg1, arg2, arg3)
		for i_54, v_47 in var728 do
			if type(i_54) == "number" then
				local _2 = v_47[2]
				local var730
				if _2 then
					local _1_2 = v_47[1]
					if type(_1_2) == "number" then
						var730 = _1_2
					else
						var730 = _1_2[1]
					end
					;({})[_2] = var730
				end
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		BlockCache_upvr.SetUnloading({})
	end
end
function module_2_upvr.UnrenderChunk(arg1) -- Line 1817
	--[[ Upvalues[1]:
		[1]: BlockCache_upvr (readonly)
	]]
	if not arg1 then
	else
		if arg1.Unrendered then return end
		if arg1.Unrendering then return end
		arg1.Unrendering = true
		while arg1.Rendering do
			task.wait()
		end
		arg1.Unrendered = true
		for i_55, v_48 in arg1 do
			if arg1.Unloading then break end
			if arg1.Rendering then break end
			if type(i_55) == "number" then
				local var742
				if v_48[2] then
					local _1_4 = v_48[1]
					if type(_1_4) == "number" then
						var742 = _1_4
					else
						var742 = _1_4[1]
					end
					;({})[v_48[2]] = var742
					v_48[2] = nil
				end
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		BlockCache_upvr.SetUnloading({})
		arg1.Unrendering = nil
	end
end
function module_2_upvr.RenderChunk(arg1, arg2, arg3, arg4) -- Line 1839
	--[[ Upvalues[5]:
		[1]: BlockHandler_upvr (readonly)
		[2]: tbl_35_upvr (readonly)
		[3]: BlockCache_upvr (readonly)
		[4]: tbl_12_upvr (readonly)
		[5]: module_2_upvr (readonly)
	]]
	-- KONSTANTERROR: Failed to generate AST for function `RenderChunk`:
assertion failed!
Traceback:
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K
K

end
local function merge_upvr(arg1) -- Line 1910, Named "merge"
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local module = {}
	local var749 = 0
	local var750
	for i_25 = 0, 15 do
		local var751 = arg1[i_25]
		if not var751 or var751 == -1 or var751 ~= var750 then
			if var750 then
				module[var749] = {var750, i_25 - var749}
			end
			local var753 = i_25
			var750 = var751
		end
	end
	if var750 then
		local tbl_45 = {}
		i_25 = 16 - var753
		tbl_45[1] = var750
		tbl_45[2] = i_25
		module[var753] = tbl_45
	end
	return module
end
local MergeAllowed_upvr = BlockHandler_upvr.MergeAllowed
function module_2_upvr.MergeChunk(arg1) -- Line 1929
	--[[ Upvalues[2]:
		[1]: merge_upvr (readonly)
		[2]: MergeAllowed_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 94 start (CF ANALYSIS FAILED)
	local tbl_4 = {}
	local tbl_33 = {}
	local tbl_5 = {}
	for i_26, v_24 in arg1 do
		local var778 = i_26 % 16
		local floored_5 = math.floor(i_26 / 256)
		local var780 = math.floor(i_26 / 16) % 16
		local var781 = tbl_4[floored_5 + var780 * 16]
		if var781 then
			var781[var778] = v_24
		else
			tbl_4[floored_5 + var780 * 16] = {
				[var778] = v_24;
			}
		end
		local var783 = tbl_33[var778 + var780 * 16]
		if var783 then
			var783[floored_5] = v_24
		else
			tbl_33[var778 + var780 * 16] = {
				[floored_5] = v_24;
			}
		end
		local var785 = tbl_5[var778 + floored_5 * 16]
		if var785 then
			var785[var780] = v_24
		else
			tbl_5[var778 + floored_5 * 16] = {
				[var780] = v_24;
			}
		end
	end
	for i_27, v_25 in tbl_4 do
		local merge_upvr_result1, merge_result2, merge_upvr_result3 = merge_upvr(v_25)
		for i_28, v_26 in merge_upvr_result1, merge_result2, merge_upvr_result3 do
			local var790 = i_27 % 16 * 256 + math.floor(i_27 / 16) * 16 + i_28
			if v_26[2] ~= 1 then
				if MergeAllowed_upvr[v_26[1]] then
					({})[var790] = {v_26[1], v_26[2], 'X'}
					for i_29 = var790, var790 + v_26[2] - 1 do
						({})[i_29] = true
						local _
					end
				end
			end
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 94 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [183] 161. Error Block 38 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [183] 161. Error Block 38 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [115] 99. Error Block 77 start (CF ANALYSIS FAILED)
	for _, _ in merge_upvr_result1, merge_result2, merge_upvr_result3 do
		if var790 then
		end
	end
	-- KONSTANTERROR: [115] 99. Error Block 77 end (CF ANALYSIS FAILED)
end
function module_2_upvr.UnloadAllChunks() -- Line 2015
	--[[ Upvalues[5]:
		[1]: tbl_7_upvr (readonly)
		[2]: FromVector3_upvr (readonly)
		[3]: module_2_upvr (readonly)
		[4]: tbl_22_upvr (readonly)
		[5]: tbl_27_upvr (readonly)
	]]
	for i_31, _ in tbl_7_upvr do
		local FromVector3_upvr_result1_3, var24_result2_4, FromVector3_upvr_result3_2 = FromVector3_upvr(i_31)
		module_2_upvr.UnloadChunk(FromVector3_upvr_result1_3, var24_result2_4, FromVector3_upvr_result3_2)
	end
	table.clear(tbl_22_upvr)
	table.clear(tbl_27_upvr)
end
function module_2_upvr.UpdateChunks() -- Line 2024
	--[[ Upvalues[6]:
		[1]: module_2_upvr (readonly)
		[2]: tbl_7_upvr (readonly)
		[3]: RenderDistance_upvr (readonly)
		[4]: FromVector3_upvr (readonly)
		[5]: tbl_27_upvr (readonly)
		[6]: BlockHandler_upvr (readonly)
	]]
	local any_GetServerPosition_result1, any_GetServerPosition_result2_2, any_GetServerPosition_result3, any_GetServerPosition_result4 = module_2_upvr.GetServerPosition()
	for i_32, v_29 in tbl_7_upvr do
		local ClientPosition_2 = module_2_upvr.ClientPosition
		local Value_4 = RenderDistance_upvr.Value
		local var24_result1_2, FromVector3_upvr_result2_2, FromVector3_upvr_result3_4 = FromVector3_upvr(i_32)
		local var813 = (var24_result1_2 - ClientPosition_2[1]) ^ 2 + (FromVector3_upvr_result2_2 - ClientPosition_2[2]) ^ 2 + (FromVector3_upvr_result3_4 - ClientPosition_2[3]) ^ 2
		if (math.max(Value_4, 8) + 1) ^ 2 < var813 and any_GetServerPosition_result4 ^ 2 < (var24_result1_2 - any_GetServerPosition_result1) ^ 2 + (FromVector3_upvr_result2_2 - any_GetServerPosition_result2_2) ^ 2 + (FromVector3_upvr_result3_4 - any_GetServerPosition_result3) ^ 2 then
			tbl_27_upvr[i_32] = nil
			local RemoveOreBoxes_3 = module_2_upvr.RemoveOreBoxes
			RemoveOreBoxes_3(var24_result1_2, FromVector3_upvr_result2_2, FromVector3_upvr_result3_4)
			if var24_result1_2 ^ 2 + FromVector3_upvr_result2_2 ^ 2 + FromVector3_upvr_result3_4 ^ 2 > RenderDistance_upvr.Value ^ 2 then
				RemoveOreBoxes_3 = false
			else
				RemoveOreBoxes_3 = true
			end
			if not RemoveOreBoxes_3 then
				module_2_upvr.UnloadChunk(var24_result1_2, FromVector3_upvr_result2_2, FromVector3_upvr_result3_4)
				-- KONSTANTWARNING: GOTO [130] #113
			end
		elseif (Value_4 + 1) ^ 2 < var813 then
			local RemoveOreBoxes_2 = module_2_upvr.RemoveOreBoxes
			RemoveOreBoxes_2(var24_result1_2, FromVector3_upvr_result2_2, FromVector3_upvr_result3_4)
			if var24_result1_2 ^ 2 + FromVector3_upvr_result2_2 ^ 2 + FromVector3_upvr_result3_4 ^ 2 > RenderDistance_upvr.Value ^ 2 then
				RemoveOreBoxes_2 = false
			else
				RemoveOreBoxes_2 = true
			end
			if not RemoveOreBoxes_2 then
				module_2_upvr.UnrenderChunk(v_29, var24_result1_2, FromVector3_upvr_result2_2, FromVector3_upvr_result3_4)
				-- KONSTANTWARNING: GOTO [130] #113
			end
		elseif os.clock() + 0.1 + (module_2_upvr.RenderChunk(v_29, var24_result1_2, FromVector3_upvr_result2_2, FromVector3_upvr_result3_4) or 0) <= os.clock() then
			BlockHandler_upvr.BulkMove()
		end
	end
	BlockHandler_upvr.BulkMove()
end
local function _(arg1) -- Line 2061, Named "InitVP"
	if arg1:FindFirstChild("Camera") == nil then
		local Camera = Instance.new("Camera")
		Camera.CFrame = CFrame.new(0, 0, 0)
		Camera.Parent = arg1
		arg1.CurrentCamera = Camera
	end
end
local Blocks_upvr = BlockCache_upvr.Blocks
local cframe_2_upvr = CFrame.new(0, 0.5, -8.5, 0.756834865, -0.0205980539, 0.65328145, 0.353553414, 0.853553355, -0.382683456, -0.549728036, 0.520598054, 0.65328145)
function module_2_upvr.BlockToViewport(arg1, arg2) -- Line 2070
	--[[ Upvalues[2]:
		[1]: Blocks_upvr (readonly)
		[2]: cframe_2_upvr (readonly)
	]]
	local Block_3 = arg1:FindFirstChild("Block")
	if Block_3 then
		Block_3:Destroy()
	end
	if arg1:FindFirstChild("Camera") == nil then
		local Camera_4 = Instance.new("Camera")
		Camera_4.CFrame = CFrame.new(0, 0, 0)
		Camera_4.Parent = arg1
		arg1.CurrentCamera = Camera_4
	end
	local clone = Blocks_upvr[arg2]:Clone()
	clone.Name = "Block"
	if clone:IsA("Model") then
		clone:PivotTo(cframe_2_upvr)
	else
		clone.CFrame = cframe_2_upvr
	end
	for _, v_30 in clone:GetDescendants() do
		if v_30:IsA("Highlight") or v_30:IsA("SelectionBox") then
			v_30:Destroy()
		end
	end
	clone.Parent = arg1
end
local Pickaxes_upvr_2 = game.ReplicatedStorage.Tools.Pickaxes
function module_2_upvr.PickaxeToViewport(arg1, arg2) -- Line 2091
	--[[ Upvalues[1]:
		[1]: Pickaxes_upvr_2 (readonly)
	]]
	if arg1:FindFirstChild("Camera") == nil then
		local Camera_3 = Instance.new("Camera")
		Camera_3.CFrame = CFrame.new(0, 0, 0)
		Camera_3.Parent = arg1
		arg1.CurrentCamera = Camera_3
	end
	local Object = arg1:FindFirstChild("Object")
	if Object then
		Object:Destroy()
	end
	local clone_6 = Pickaxes_upvr_2[math.min(arg2, #Pickaxes_upvr_2:GetChildren() - 1)].Main:Clone()
	if clone_6.ClassName == "Model" then
		local _, any_GetBoundingBox_result2 = clone_6:GetBoundingBox()
		clone_6:PivotTo(CFrame.new(0, 0, -math.max(any_GetBoundingBox_result2.Y, any_GetBoundingBox_result2.Z) * 1.25) * clone_6:GetPivot().Rotation * CFrame.fromEulerAnglesXYZ(0, (math.pi/2), 0))
	else
		clone_6.CFrame = CFrame.new(0, 0, -math.max(clone_6.Size.Y, clone_6.Size.Z) * 1.25) * clone_6.CFrame.Rotation * CFrame.fromEulerAnglesXYZ(0, (math.pi/2), 0)
	end
	clone_6.Name = "Object"
	clone_6.Parent = arg1
end
local Explosives_2_upvr = game.ReplicatedStorage.Tools.Explosives
function module_2_upvr.ExplosiveToViewport(arg1, arg2) -- Line 2111
	--[[ Upvalues[1]:
		[1]: Explosives_2_upvr (readonly)
	]]
	if arg1:FindFirstChild("Camera") == nil then
		local Camera_2 = Instance.new("Camera")
		Camera_2.CFrame = CFrame.new(0, 0, 0)
		Camera_2.Parent = arg1
		arg1.CurrentCamera = Camera_2
	end
	local Object_3 = arg1:FindFirstChild("Object")
	if Object_3 then
		Object_3:Destroy()
	end
	local clone_9 = Explosives_2_upvr[math.clamp(arg2, 1, #Explosives_2_upvr:GetChildren())].Main:Clone()
	if clone_9.ClassName == "Model" then
		local _, any_GetBoundingBox_result2_2 = clone_9:GetBoundingBox()
		clone_9:PivotTo(CFrame.new(0, 0, -math.max(any_GetBoundingBox_result2_2.Y, any_GetBoundingBox_result2_2.Z) * 1.25) * clone_9:GetPivot().Rotation * CFrame.fromEulerAnglesXYZ(0, (math.pi/2), 0))
	else
		clone_9.CFrame = CFrame.new(0, 0, -math.max(clone_9.Size.Y, clone_9.Size.Z) * 1.25) * clone_9.CFrame.Rotation * CFrame.fromEulerAnglesXYZ(0, (math.pi/2), 0)
	end
	clone_9.Name = "Object"
	clone_9.Parent = arg1
end
local tbl_9_upvr = {"VP", "TextLabel"}
local function ClearIcon_upvr(arg1, arg2) -- Line 2132, Named "ClearIcon"
	--[[ Upvalues[1]:
		[1]: tbl_9_upvr (readonly)
	]]
	for _, v_31 in tbl_9_upvr do
		if v_31 ~= arg2 then
			local SOME_7 = arg1:FindFirstChild(v_31)
			if SOME_7 then
				SOME_7:Destroy()
			end
		end
	end
end
local function _(arg1) -- Line 2140, Named "HasIconInstances"
	--[[ Upvalues[1]:
		[1]: tbl_9_upvr (readonly)
	]]
	for _, v_32 in tbl_9_upvr do
		if arg1:FindFirstChild(v_32) then
			return true
		end
	end
	return false
end
local function SetIcon_upvr(arg1, arg2) -- Line 2149, Named "SetIcon"
	--[[ Upvalues[4]:
		[1]: GameDefinition_upvr (readonly)
		[2]: SetIcon_upvr (readonly)
		[3]: ClearIcon_upvr (readonly)
		[4]: module_2_upvr (readonly)
	]]
	if type(arg2) ~= "string" then
		arg1.Image = ""
	else
		if string.sub(arg2, 1, 13) == "rbxassetid://" then
			arg1.Image = arg2
			arg1.ImageColor3 = Color3.fromRGB(255, 255, 255)
			return
		end
		local var849 = GameDefinition_upvr.Icons[arg2]
		if var849 then
			if type(var849) == "table" then
				arg1.Image = var849[1]
				arg1.ImageColor3 = var849[2]
			else
				arg1.Image = var849
				arg1.ImageColor3 = Color3.fromRGB(255, 255, 255)
			end
		end
		local string_split_result1_3 = string.split(arg2, '.')
		if string_split_result1_3[1] == "NumberValues" then
			SetIcon_upvr(arg1, string_split_result1_3[2])
			return
		end
		if string_split_result1_3[1] == "Blocks" then
			arg1.Image = ""
			ClearIcon_upvr(arg1, "VP")
			if not arg1:FindFirstChild("VP") then
				local ViewportFrame_2 = Instance.new("ViewportFrame")
				ViewportFrame_2.Name = "VP"
				ViewportFrame_2.Size = UDim2.new(1, 0, 1, 0)
				ViewportFrame_2.AnchorPoint = Vector2.new(0.5, 0.5)
				ViewportFrame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
				ViewportFrame_2.BackgroundTransparency = 1
				ViewportFrame_2.ZIndex = arg1.ZIndex + 1
				ViewportFrame_2.Parent = arg1
			end
			module_2_upvr.BlockToViewport(ViewportFrame_2, tonumber(string_split_result1_3[2]))
			return
		end
		if string_split_result1_3[1] == "Explosives" then
			arg1.Image = ""
			ClearIcon_upvr(arg1, "VP")
			if not arg1:FindFirstChild("VP") then
				local ViewportFrame = Instance.new("ViewportFrame")
				ViewportFrame.Name = "VP"
				ViewportFrame.Size = UDim2.new(1, 0, 1, 0)
				ViewportFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				ViewportFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
				ViewportFrame.BackgroundTransparency = 1
				ViewportFrame.ZIndex = arg1.ZIndex + 1
				ViewportFrame.Parent = arg1
			end
			module_2_upvr.ExplosiveToViewport(ViewportFrame, tonumber(string_split_result1_3[2]))
			return
		end
		arg1.Image = ""
	end
end
module_2_upvr.SetIcon = SetIcon_upvr
local module_3_upvr = {
	['/'] = "\xF7";
	x = "\xD7";
}
local function format_upvr(arg1, arg2) -- Line 2224, Named "format"
	--[[ Upvalues[2]:
		[1]: Short_upvr (readonly)
		[2]: module_3_upvr (readonly)
	]]
	if arg2[1] == 't' then
		if arg1 < 1e-09 / 10 ^ (arg2[2] or 0) then
			return "Instant"
		end
		if arg1 < 0.000001 then
			return Short_upvr.en(arg1 * 1000000000, arg2[2]).."ns"
		end
		if arg1 < 0.001 then
			return Short_upvr.en(arg1 * 1000000, arg2[2]).."\xB5s"
		end
		if arg1 < 1 then
			return Short_upvr.en(arg1 * 1000, arg2[2]).."ms"
		end
		if arg1 < math.huge then
			return Short_upvr.en(arg1, arg2[2])..'s'
		end
		return "Never"
	end
	local _1_12 = arg2[1]
	if _1_12 == '%' then
		return Short_upvr.en(arg1 * 100, arg2[2])..'%'
	end
	if _1_12 == "+%" then
		return '+'..Short_upvr.en(arg1 * 100, arg2[2])..'%'
	end
	return (module_3_upvr[_1_12] or _1_12)..Short_upvr.en(arg1, arg2[2])
end
module_2_upvr.FormatBoost = format_upvr
function module_2_upvr.ConnectUpgradeFrame(arg1) -- Line 2253
	--[[ Upvalues[8]:
		[1]: GameDefinition_upvr (readonly)
		[2]: module_2_upvr (readonly)
		[3]: FormulaHandler_upvr (readonly)
		[4]: any_GetData_result1_upvr (readonly)
		[5]: Translator_upvr (readonly)
		[6]: Short_upvr (readonly)
		[7]: SharedFunctions_upvr (readonly)
		[8]: format_upvr (readonly)
	]]
	local Name_upvr = arg1.Name
	local var857_upvr = GameDefinition_upvr.Formulas.Upgrades[Name_upvr]
	local Buy_upvr_2 = arg1.Buy
	module_2_upvr.SetIcon(arg1.Icon, var857_upvr.Icon)
	local any_GetUpgrade_result1_upvr = FormulaHandler_upvr.GetUpgrade(any_GetData_result1_upvr, Name_upvr)
	local var860_upvw
	local var861_upvw
	local var862_upvw
	local var863_upvw
	local var864_upvw
	local function CurrencyChanged() -- Line 2281
		--[[ Upvalues[6]:
			[1]: var862_upvw (read and write)
			[2]: var863_upvw (read and write)
			[3]: var860_upvw (read and write)
			[4]: var861_upvw (read and write)
			[5]: Buy_upvr_2 (readonly)
			[6]: var864_upvw (read and write)
		]]
		local var865
		if not var862_upvw then
		else
			if var863_upvw then return end
			local Value_5 = var860_upvw.Value
			if var861_upvw then
				Value_5 += var861_upvw.Value
			end
			if Value_5 >= var864_upvw then
				var865 = false
			else
				var865 = true
			end
			Buy_upvr_2:SetAttribute("Disabled", var865)
		end
	end
	local Name_upvr_2 = arg1:FindFirstChild("Name")
	local Cost_upvr_2 = arg1.Cost
	local Boost_upvr_2 = arg1.Boost
	local Icon2_upvr = arg1.Icon2
	local var871_upvw
	local var872_upvw
	local var873_upvw
	local MaxLevel_upvr = var857_upvr.MaxLevel
	local var875_upvw
	local var876_upvw
	local Display_upvr_2 = var857_upvr.Display
	local function UpgradeChanged() -- Line 2291
		--[[ Upvalues[30]:
			[1]: var857_upvr (readonly)
			[2]: var862_upvw (read and write)
			[3]: any_GetData_result1_upvr (copied, readonly)
			[4]: Name_upvr_2 (readonly)
			[5]: Cost_upvr_2 (readonly)
			[6]: Boost_upvr_2 (readonly)
			[7]: arg1 (readonly)
			[8]: Icon2_upvr (readonly)
			[9]: Buy_upvr_2 (readonly)
			[10]: Translator_upvr (copied, readonly)
			[11]: Short_upvr (copied, readonly)
			[12]: any_GetUpgrade_result1_upvr (readonly)
			[13]: var871_upvw (read and write)
			[14]: module_2_upvr (copied, readonly)
			[15]: var860_upvw (read and write)
			[16]: SharedFunctions_upvr (copied, readonly)
			[17]: var872_upvw (read and write)
			[18]: CurrencyChanged (readonly)
			[19]: var873_upvw (read and write)
			[20]: var861_upvw (read and write)
			[21]: MaxLevel_upvr (readonly)
			[22]: var863_upvw (read and write)
			[23]: var875_upvw (read and write)
			[24]: FormulaHandler_upvr (copied, readonly)
			[25]: Name_upvr (readonly)
			[26]: var864_upvw (read and write)
			[27]: var876_upvw (read and write)
			[28]: Display_upvr_2 (readonly)
			[29]: format_upvr (copied, readonly)
			[30]: GameDefinition_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var878
		if var878 then
			var878 = var857_upvr.Unlock(any_GetData_result1_upvr)
			var862_upvw = var878
		else
			var878 = true
			var862_upvw = var878
		end
		var878 = var862_upvw
		if not var878 then
			var878 = Name_upvr_2
			var878.Text = ""
			var878 = Cost_upvr_2
			var878.Text = ""
			var878 = Boost_upvr_2
			var878.Text = ""
			var878 = arg1.Icon
			var878.Visible = false
			var878 = Icon2_upvr
			var878.Visible = false
			var878 = Buy_upvr_2
			var878.Visible = false
			var878 = var857_upvr.UnlockMessage
			if var878 then
				arg1.Unlock.Text = Translator_upvr.Get("UnlockMessages."..var878[1], Short_upvr.en(var878[2]))
			else
				arg1.Unlock.Text = ""
			end
		end
		if typeof(var857_upvr.Currency) == "function" then
			var878 = var857_upvr.Currency(any_GetUpgrade_result1_upvr.Value, any_GetData_result1_upvr)
		else
			var878 = var857_upvr.Currency
		end
		if var878 ~= var871_upvw then
			var871_upvw = var878
			module_2_upvr.SetIcon(Icon2_upvr, var878)
			var860_upvw = SharedFunctions_upvr.GetValue(any_GetData_result1_upvr, var878)
			if var872_upvw then
				var872_upvw:Disconnect()
			end
			var872_upvw = var860_upvw:GetPropertyChangedSignal("Value"):Connect(CurrencyChanged)
			if var873_upvw then
				var873_upvw:Disconnect()
			end
			local string_split_result1 = string.split(var878, '.')
			if string_split_result1[1] == "Blocks" then
				var861_upvw = SharedFunctions_upvr.GetValue(any_GetData_result1_upvr, "ArchivedBlocks."..string_split_result1[2])
				var873_upvw = var861_upvw:GetPropertyChangedSignal("Value"):Connect(CurrencyChanged)
			else
				var861_upvw = nil
				var873_upvw = nil
			end
		end
		arg1.Icon.Visible = true
		Buy_upvr_2.Visible = true
		arg1.Unlock.Text = ""
		local var880
		if var880 then
			if MaxLevel_upvr > any_GetUpgrade_result1_upvr.Value then
				var880 = false
			else
				var880 = true
			end
			var863_upvw = var880
			var880 = MaxLevel_upvr
			if var880 ~= 1 then
				var880 = Name_upvr_2
				var880.Text = Translator_upvr.Get("Upgrades."..var857_upvr.Type).." ("..Short_upvr.en(any_GetUpgrade_result1_upvr.Value, 0, true)..'/'..Short_upvr.en(MaxLevel_upvr, 0, true)..')'
			else
				var880 = Name_upvr_2
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				var880.Text = Translator_upvr.Get("Upgrades."..var857_upvr.Type)
			end
		else
			var880 = Name_upvr_2
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			var880.Text = Translator_upvr.Get("Upgrades."..var857_upvr.Type).." ("..Short_upvr.en(any_GetUpgrade_result1_upvr.Value, 0, true)..')'
			var880 = false
			var863_upvw = var880
		end
		var875_upvw = FormulaHandler_upvr.GetBoost(any_GetData_result1_upvr, Name_upvr)
		local var881
		if var863_upvw then
			var864_upvw = nil
			var876_upvw = nil
			var881 = false
			Icon2_upvr.Visible = var881
			var881 = ""
			Cost_upvr_2.Text = var881
			local var882 = Translator_upvr
			var881 = var882.Get
			if MaxLevel_upvr == 1 then
				var882 = "Main.Bought"
			else
				var882 = "Main.Max"
			end
			var881 = var881(var882)
			Buy_upvr_2.Text = var881
			Buy_upvr_2:SetAttribute("Disabled", true)
			if Display_upvr_2 then
				var881 = format_upvr(var875_upvw, Display_upvr_2)
			else
				var881 = ""
			end
			Boost_upvr_2.Text = var881
			-- KONSTANTWARNING: GOTO [439] #357
		end
		local var883
		var864_upvw = FormulaHandler_upvr.GetCost(any_GetData_result1_upvr, Name_upvr)
		var876_upvw = FormulaHandler_upvr.GetBoost(any_GetData_result1_upvr, Name_upvr, 1)
		Icon2_upvr.Visible = true
		local string_split_result1_2 = string.split(var878, '.')
		if string_split_result1_2[1] == "Blocks" then
			local tonumber_result1 = tonumber(string_split_result1_2[2])
			local var886
			local var887 = GameDefinition_upvr.OreInfo[tonumber_result1]
			if var887 then
				var886 = GameDefinition_upvr.RarityColors[var887[2]]
			end
			if var886 then
				Cost_upvr_2.Text = Short_upvr.en(var864_upvw).." <font color=\"#"..var886:ToHex().."\">["..Translator_upvr.Get("Blocks."..tonumber_result1).."]</font>"
				Cost_upvr_2.RichText = true
			else
				Cost_upvr_2.Text = Short_upvr.en(var864_upvw).." ["..Translator_upvr.Get("Blocks."..tonumber_result1)..']'
				Cost_upvr_2.RichText = false
			end
		else
			Cost_upvr_2.Text = Short_upvr.en(var864_upvw)
		end
		Buy_upvr_2.Text = Translator_upvr.Get("Main.Buy")
		if Display_upvr_2 then
			Boost_upvr_2.Text = format_upvr(var875_upvw, Display_upvr_2).." → "..format_upvr(var876_upvw, Display_upvr_2)
		else
			Boost_upvr_2.Text = ""
		end
		if not var862_upvw then
		else
			if var863_upvw then return end
			local Value_2 = var860_upvw.Value
			if var861_upvw then
				Value_2 += var861_upvw.Value
			end
			if Value_2 >= var864_upvw then
			else
			end
			Buy_upvr_2:SetAttribute("Disabled", true)
		end
	end
	UpgradeChanged()
	any_GetUpgrade_result1_upvr:GetPropertyChangedSignal("Value"):Connect(UpgradeChanged)
	Translator_upvr.LanguageUpdated:Connect(UpgradeChanged)
	module_2_upvr.ConnectUpdateIds(var857_upvr.UpdateIds, UpgradeChanged)
end
local TweenService_upvr = game:GetService("TweenService")
local Model_upvr = Instance.new("Model")
Model_upvr.Name = "Shop"
Model_upvr:PivotTo(CFrame.new(2000, 2000, 2000))
Model_upvr.Parent = game.Workspace
local Tools_upvr = game.ReplicatedStorage.Tools
local function _(arg1, arg2) -- Line 2421, Named "SetRotation"
	if arg1.ClassName == "Model" then
		arg1:PivotTo(CFrame.new(arg1:GetPivot().Position) * CFrame.fromOrientation(math.rad(arg2.X), math.rad(arg2.Y), math.rad(arg2.Z)))
		return arg1
	end
	arg1.Orientation = arg2
	return arg1
end
local function _(arg1, arg2) -- Line 2430, Named "RotateBy"
	local cframe = CFrame.fromOrientation(math.rad(arg2.X), math.rad(arg2.Y), math.rad(arg2.Z))
	if arg1.ClassName == "Model" then
		arg1:PivotTo(arg1:GetPivot() * cframe)
		return arg1
	end
	arg1.CFrame *= cframe
	return arg1
end
local tbl_38_upvr = {}
local Backpacks_upvr = Tools_upvr.Backpacks
function tbl_38_upvr.Backpack(arg1) -- Line 2441
	--[[ Upvalues[2]:
		[1]: GameDefinition_upvr (readonly)
		[2]: Backpacks_upvr (readonly)
	]]
	if arg1 < 0 or GameDefinition_upvr.Formulas.Equipables.Backpack.MaxLevel + 1 < arg1 then return end
	local clone_16 = Backpacks_upvr[math.min(arg1, #Backpacks_upvr:GetChildren() - 1)].Handle:Clone()
	if clone_16.ClassName == "Model" then
		clone_16:PivotTo(clone_16:GetPivot() * CFrame.fromOrientation(0, (math.pi/2), 0))
	else
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		clone_16.CFrame *= CFrame.fromOrientation(0, (math.pi/2), 0)
	end
	return clone_16
end
local Pickaxes_upvr = Tools_upvr.Pickaxes
function tbl_38_upvr.Pickaxe(arg1) -- Line 2445
	--[[ Upvalues[1]:
		[1]: Pickaxes_upvr (readonly)
	]]
	local SOME = Pickaxes_upvr:FindFirstChild(math.min(arg1, #Pickaxes_upvr:GetChildren() - 1))
	if not SOME then return end
	local clone_17 = SOME.Main:Clone()
	if clone_17.ClassName == "Model" then
		clone_17:PivotTo(clone_17:GetPivot() * CFrame.fromOrientation(0, (math.pi/2), 0))
	else
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		clone_17.CFrame *= CFrame.fromOrientation(0, (math.pi/2), 0)
	end
	return clone_17
end
local Explosives_3_upvr = Tools_upvr.Explosives
function tbl_38_upvr.Explosives(arg1) -- Line 2450
	--[[ Upvalues[1]:
		[1]: Explosives_3_upvr (readonly)
	]]
	if arg1 < 1 or #Explosives_3_upvr:GetChildren() < arg1 then return end
	local clone_8 = Explosives_3_upvr[arg1].Main:Clone()
	if clone_8.ClassName == "Model" then
		clone_8:PivotTo(clone_8:GetPivot() * CFrame.fromOrientation(0, (math.pi/2), 0))
	else
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		clone_8.CFrame *= CFrame.fromOrientation(0, (math.pi/2), 0)
	end
	return clone_8
end
function tbl_38_upvr.Luck(arg1) -- Line 2454
	--[[ Upvalues[1]:
		[1]: Tools_upvr (readonly)
	]]
	local SOME_8 = Tools_upvr.Luck:FindFirstChild(arg1)
	if not SOME_8 then return end
	local clone_2 = SOME_8:Clone()
	if clone_2.ClassName == "Model" then
		clone_2:PivotTo(CFrame.new(clone_2:GetPivot().Position) * CFrame.fromOrientation((-math.pi/2), (-math.pi), 0))
	else
		clone_2.Orientation = Vector3.new(-90, -180, 0)
	end
	return clone_2
end
function tbl_38_upvr.Speed(arg1) -- Line 2459
	--[[ Upvalues[1]:
		[1]: Tools_upvr (readonly)
	]]
	local SOME_2 = Tools_upvr.Speed:FindFirstChild(arg1)
	if not SOME_2 then return end
	local clone_15 = SOME_2:Clone()
	if clone_15.ClassName == "Model" then
		clone_15:PivotTo(CFrame.new(clone_15:GetPivot().Position) * CFrame.fromOrientation((-math.pi/2), (-math.pi), 0))
	else
		clone_15.Orientation = Vector3.new(-90, -180, 0)
	end
	return clone_15
end
function tbl_38_upvr.Jump(arg1) -- Line 2464
	--[[ Upvalues[1]:
		[1]: Tools_upvr (readonly)
	]]
	local SOME_6 = Tools_upvr.Jump:FindFirstChild(arg1)
	if not SOME_6 then return end
	local clone_14 = SOME_6:Clone()
	if clone_14.ClassName == "Model" then
		clone_14:PivotTo(CFrame.new(clone_14:GetPivot().Position) * CFrame.fromOrientation((-math.pi/2), (-math.pi), 0))
	else
		clone_14.Orientation = Vector3.new(-90, -180, 0)
	end
	return clone_14
end
local Section_upvr = game.ReplicatedStorage.Section
function module_2_upvr.UpdateShop(arg1, arg2) -- Line 2471
	--[[ Upvalues[3]:
		[1]: Model_upvr (readonly)
		[2]: Section_upvr (readonly)
		[3]: tbl_38_upvr (readonly)
	]]
	if not arg2 then
	else
		for var915 = 1, 7 do
			if Model_upvr:FindFirstChild(var915) == nil then
				local clone_13 = Section_upvr:Clone()
				clone_13.Name = var915
				clone_13:PivotTo(CFrame.new(1990 + 10 * var915, 2000, 2000))
				clone_13.Parent = Model_upvr
			end
			local Object_2 = clone_13:FindFirstChild("Object")
			if Object_2 then
				Object_2:Destroy()
			end
			local any_any_result1 = tbl_38_upvr[arg2](arg1 + var915 - 4)
			if any_any_result1 ~= nil then
				any_any_result1.Name = "Object"
				if any_any_result1.ClassName == "Model" then
					any_any_result1:PivotTo(CFrame.new(1990 + 10 * var915, 1996, 2000) * any_any_result1:GetPivot().Rotation)
					for var916, var917 in any_any_result1:GetDescendants() do
						if var917:IsA("BasePart") then
							var917.Anchored = true
						end
					end
				else
					var916 = 1990
					var917 = 10 * var915
					var916 = 1996
					var917 = 2000
					var916 = any_any_result1.CFrame
					any_any_result1.CFrame = CFrame.new(var916 + var917, var916, var917) * var916.Rotation
					any_any_result1.Anchored = true
				end
				any_any_result1.Parent = clone_13
			end
		end
	end
end
function module_2_upvr.AnimateShop(arg1) -- Line 2502
	--[[ Upvalues[2]:
		[1]: Model_upvr (readonly)
		[2]: TweenService_upvr (readonly)
	]]
	local CFrameValue_upvr = Instance.new("CFrameValue")
	CFrameValue_upvr.Value = CFrame.new(2000, 2000, 2000)
	local any_Create_result1_3 = TweenService_upvr:Create(CFrameValue_upvr, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		Value = CFrame.new(2000 + arg1, 2000, 2000);
	})
	any_Create_result1_3:Play()
	any_Create_result1_3.Completed:Wait()
	CFrameValue_upvr:GetPropertyChangedSignal("Value"):Connect(function() -- Line 2506
		--[[ Upvalues[2]:
			[1]: Model_upvr (copied, readonly)
			[2]: CFrameValue_upvr (readonly)
		]]
		Model_upvr:PivotTo(CFrameValue_upvr.Value)
	end):Disconnect()
	CFrameValue_upvr:Destroy()
	Model_upvr:PivotTo(CFrame.new(2000, 2000, 2000))
end
local var929_upvw
local tbl_34_upvr = {}
local tbl_15_upvr = {
	Pickaxe = {
		Title = "Main.Pickaxe";
		Boost = function(arg1) -- Line 2528
			--[[ Upvalues[2]:
				[1]: Translator_upvr (readonly)
				[2]: Short_upvr (readonly)
			]]
			return Translator_upvr.Get("Main.Power")..": "..Short_upvr.en(arg1)
		end;
	};
	Backpack = {
		Title = "Main.Backpack";
		Boost = function(arg1) -- Line 2534
			--[[ Upvalues[2]:
				[1]: Translator_upvr (readonly)
				[2]: Short_upvr (readonly)
			]]
			return Translator_upvr.Get("Main.Storage")..": "..Short_upvr.en(arg1)
		end;
	};
	Explosives = {
		Title = function(arg1) -- Line 2539
			return "Explosives."..(arg1 + 1)
		end;
		Boost = function(arg1) -- Line 2542
			--[[ Upvalues[2]:
				[1]: Translator_upvr (readonly)
				[2]: Short_upvr (readonly)
			]]
			return Translator_upvr.Get("Main.Power")..": "..Short_upvr.en(arg1)
		end;
	};
	Luck = {
		Title = "Main.Luck";
		Boost = function(arg1) -- Line 2548
			--[[ Upvalues[2]:
				[1]: Short_upvr (readonly)
				[2]: Translator_upvr (readonly)
			]]
			return '+'..Short_upvr.en((arg1 - 1) * 100).."% "..Translator_upvr.Get("Main.Luck")
		end;
	};
	Speed = {
		Title = "Main.Speed";
		Boost = function(arg1) -- Line 2554
			--[[ Upvalues[2]:
				[1]: Translator_upvr (readonly)
				[2]: Short_upvr (readonly)
			]]
			return Translator_upvr.Get("Main.Speed")..": +"..Short_upvr.en(arg1 / 6, 2)..' '..Translator_upvr.Get("Main.Blocks").."/s"
		end;
	};
	Jump = {
		Title = "Main.Jump";
		Boost = function(arg1) -- Line 2560
			--[[ Upvalues[2]:
				[1]: Translator_upvr (readonly)
				[2]: Short_upvr (readonly)
			]]
			return Translator_upvr.Get("Main.Jump")..": +"..Short_upvr.en(arg1 / 6, 2)..' '..Translator_upvr.Get("Main.Blocks")
		end;
	};
}
local CurrentCamera_upvr = game.Workspace.CurrentCamera
local Upgrades_upvr = LocalPlayer_upvr.PlayerGui:WaitForChild("Upgrades")
local Networking_upvr_2 = require(game.ReplicatedStorage.Modules.Networking)
local GuiHandler_upvr = require(game.ReplicatedStorage.Modules.GuiHandler)
local Shop_upvr = Game_upvr.Frames.Shop
local function _(arg1) -- Line 2577, Named "OpenShop"
	--[[ Upvalues[3]:
		[1]: Shop_upvr (readonly)
		[2]: Upgrades_upvr (readonly)
		[3]: GuiHandler_upvr (readonly)
	]]
	Shop_upvr.Parent = Upgrades_upvr
	GuiHandler_upvr("Shop", 3)
	game.ReplicatedStorage.Events.SetShopSelected:Fire(arg1)
end
local function CloseUpgrades_upvr() -- Line 2583, Named "CloseUpgrades"
	--[[ Upvalues[8]:
		[1]: var929_upvw (read and write)
		[2]: tbl_34_upvr (readonly)
		[3]: Upgrades_upvr (readonly)
		[4]: Game_upvr (readonly)
		[5]: CurrentCamera_upvr (readonly)
		[6]: LocalPlayer_upvr (readonly)
		[7]: Shop_upvr (readonly)
		[8]: GuiHandler_upvr (readonly)
	]]
	local var954
	if var929_upvw == nil then
	else
		var954 = nil
		for _, v_49 in tbl_34_upvr, var954 do
			v_49:Disconnect()
		end
		var954 = tbl_34_upvr
		table.clear(var954)
		local var955 = var929_upvw
		var954 = nil
		var929_upvw = var954
		var954 = Upgrades_upvr
		var954.Enabled = false
		var954 = Game_upvr
		var954.Enabled = true
		var954 = CurrentCamera_upvr
		var954.CameraType = Enum.CameraType.Custom
		var954 = LocalPlayer_upvr.Character
		if var954 == nil then
			while var954 == nil do
				task.wait()
				var954 = LocalPlayer_upvr.Character
			end
		end
		CurrentCamera_upvr.CameraSubject = var954:WaitForChild("Humanoid", 60)
		game.Workspace.Shop:ClearAllChildren()
		Shop_upvr.Parent = Game_upvr.Frames
		if var955 == "Pickaxe" or var955 == "Backpack" or var955 == "Explosives" then
			GuiHandler_upvr("Upgrades", 3)
			return
		end
		GuiHandler_upvr("Shop", 2)
	end
end
local Equipped_upvr = any_GetData_result1_upvr.Equipables.Equipped
local Unlocked_upvr = any_GetData_result1_upvr.Equipables.Unlocked
local tbl_44_upvr = {}
local VIP_upvr = any_GetData_result1_upvr.Gamepasses.VIP
local HttpService_upvr = game:GetService("HttpService")
local ExplosiveUpgrades_upvr = any_GetData_result1_upvr.Others.ExplosiveUpgrades
local TimeConverter_upvr = require(game.ReplicatedStorage.Modules.TimeConverter)
local PickaxeUpgrades_upvr = any_GetData_result1_upvr.Others.PickaxeUpgrades
local UserInputService_upvr = game:GetService("UserInputService")
local Emeralds_upvr = any_GetData_result1_upvr.NumberValues.Emeralds
function module_2_upvr.OpenUpgrades(arg1) -- Line 2612
	--[[ Upvalues[27]:
		[1]: tbl_34_upvr (readonly)
		[2]: var929_upvw (read and write)
		[3]: Equipped_upvr (readonly)
		[4]: Unlocked_upvr (readonly)
		[5]: any_GetData_result1_upvr (readonly)
		[6]: GameDefinition_upvr (readonly)
		[7]: tbl_44_upvr (readonly)
		[8]: SharedFunctions_upvr (readonly)
		[9]: module_2_upvr (readonly)
		[10]: Upgrades_upvr (readonly)
		[11]: tbl_15_upvr (readonly)
		[12]: CurrentCamera_upvr (readonly)
		[13]: Translator_upvr (readonly)
		[14]: Short_upvr (readonly)
		[15]: FormulaHandler_upvr (readonly)
		[16]: VIP_upvr (readonly)
		[17]: HttpService_upvr (readonly)
		[18]: ExplosiveUpgrades_upvr (readonly)
		[19]: TimeConverter_upvr (readonly)
		[20]: PickaxeUpgrades_upvr (readonly)
		[21]: Shop_upvr (readonly)
		[22]: GuiHandler_upvr (readonly)
		[23]: Networking_upvr_2 (readonly)
		[24]: CloseUpgrades_upvr (readonly)
		[25]: UserInputService_upvr (readonly)
		[26]: Emeralds_upvr (readonly)
		[27]: Game_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local _
	for _, v_33 in tbl_34_upvr do
		v_33:Disconnect()
	end
	table.clear(tbl_34_upvr)
	var929_upvw = arg1
	local SOME_5_upvr = Equipped_upvr:FindFirstChild(arg1)
	local SOME_4_upvr = Unlocked_upvr:FindFirstChild(arg1)
	local __upvr = any_GetData_result1_upvr.Upgrades['1']['1']
	local var978_upvr = GameDefinition_upvr.Formulas.Equipables[arg1]
	if SOME_5_upvr ~= nil then
		if tbl_44_upvr[arg1] == nil then
		elseif SOME_5_upvr.Value + 1 < SOME_5_upvr.Value then
		end
		if var978_upvr.FirstBuyable then
			local maximum = math.max(SOME_5_upvr.Value - 1, 0)
		end
		tbl_44_upvr[arg1] = maximum
	elseif maximum == nil then
		tbl_44_upvr[arg1] = 0
	end
	local any_GetValue_result1_2_upvr = SharedFunctions_upvr.GetValue(any_GetData_result1_upvr, "NumberValues."..var978_upvr.Currency)
	module_2_upvr.SetIcon(Upgrades_upvr.Equip.Main.ImageLabel, var978_upvr.Currency)
	module_2_upvr.UpdateShop(0 + 1, arg1)
	CurrentCamera_upvr.CameraType = Enum.CameraType.Scriptable
	CurrentCamera_upvr.CFrame = CFrame.new(2030, 1997, 2010)
	local var982_upvr = tbl_15_upvr[arg1]
	local var983_upvw = 0
	local function Refresh_upvr() -- Line 2645, Named "Refresh"
		--[[ Upvalues[17]:
			[1]: var982_upvr (readonly)
			[2]: Upgrades_upvr (copied, readonly)
			[3]: Translator_upvr (copied, readonly)
			[4]: var983_upvw (read and write)
			[5]: Short_upvr (copied, readonly)
			[6]: FormulaHandler_upvr (copied, readonly)
			[7]: any_GetData_result1_upvr (copied, readonly)
			[8]: arg1 (readonly)
			[9]: var978_upvr (readonly)
			[10]: SOME_4_upvr (readonly)
			[11]: SOME_5_upvr (readonly)
			[12]: VIP_upvr (copied, readonly)
			[13]: __upvr (readonly)
			[14]: HttpService_upvr (copied, readonly)
			[15]: ExplosiveUpgrades_upvr (copied, readonly)
			[16]: TimeConverter_upvr (copied, readonly)
			[17]: PickaxeUpgrades_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		-- KONSTANTERROR: [0] 1. Error Block 129 start (CF ANALYSIS FAILED)
		local var984
		if typeof(var982_upvr.Title) == "function" then
			Upgrades_upvr.Item.Text = Translator_upvr.Get(var982_upvr.Title(var983_upvw))
		elseif var983_upvw == -1 then
			var984 = var982_upvr
			Upgrades_upvr.Item.Text = "VIP "..Translator_upvr.Get(var984.Title)
		else
			var984 = Translator_upvr.Get(var982_upvr.Title)
			var984 = Short_upvr
			var984 = var983_upvw + 1
			Upgrades_upvr.Item.Text = var984.." #"..var984.en(var984, 0, true)
		end
		Upgrades_upvr.Equip.Main.Text.Size = UDim2.new(0, 0, 1, -5)
		Upgrades_upvr.Equip.Main.Text.AutomaticSize = Enum.AutomaticSize.X
		if var978_upvr.FirstBuyable then
			local var985 = var983_upvw + 1
			if var983_upvw > 0 then
			else
			end
			Upgrades_upvr.Previous:SetAttribute("Disabled", true)
			-- KONSTANTWARNING: GOTO [134] #100
		end
		-- KONSTANTERROR: [0] 1. Error Block 129 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [121] 90. Error Block 139 start (CF ANALYSIS FAILED)
		if var983_upvw >= 0 then
		else
		end
		Upgrades_upvr.Previous:SetAttribute("Disabled", true)
		if arg1 ~= "Explosives" then
		end
		local var986 = var985 - SOME_4_upvr.Value
		local var987
		if var978_upvr.MaxLevel then
			var987 = true
			if 5 > var986 then
				if var978_upvr.MaxLevel > var985 then
					var987 = false
				else
					var987 = true
				end
			end
			Upgrades_upvr.Next:SetAttribute("Disabled", var987)
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if 5 > var986 then
			else
			end
			Upgrades_upvr.Next:SetAttribute("Disabled", true)
		end
		if SOME_5_upvr.Value == var985 then
			Upgrades_upvr.Equip.Text = Translator_upvr.Get("Main.Equipped")
			Upgrades_upvr.Equip.Main.ImageLabel.Visible = false
			Upgrades_upvr.Equip:SetAttribute("Disabled", true)
			Upgrades_upvr.BuyAll.Visible = false
		elseif var985 == -1 then
			if VIP_upvr.Value == false then
				Upgrades_upvr.Equip.Text = ""..Short_upvr.en(499)
				Upgrades_upvr.Equip.Main.ImageLabel.Visible = false
				Upgrades_upvr.Equip:SetAttribute("Color", "Green")
			else
				Upgrades_upvr.Equip.Text = Translator_upvr.Get("Main.Equip")
				Upgrades_upvr.Equip.Main.ImageLabel.Visible = false
				Upgrades_upvr.Equip:SetAttribute("Color", "Blue")
			end
			Upgrades_upvr.BuyAll.Visible = false
			Upgrades_upvr.Equip:SetAttribute("Disabled", false)
		else
			local var988
			if var985 <= SOME_4_upvr.Value then
				Upgrades_upvr.Equip.Text = Translator_upvr.Get("Main.Equip")
				Upgrades_upvr.Equip.Main.ImageLabel.Visible = false
				Upgrades_upvr.Equip:SetAttribute("Color", "Blue")
				Upgrades_upvr.Equip:SetAttribute("Disabled", false)
				Upgrades_upvr.BuyAll.Visible = false
			else
				if var978_upvr.Currency == "Emeralds" then
				end
				Upgrades_upvr.Equip.Text = Short_upvr.en(FormulaHandler_upvr.GetEquipableCostForMultiple(any_GetData_result1_upvr, arg1, var986) * 10)
				Upgrades_upvr.Equip.Main.ImageLabel.Visible = true
				Upgrades_upvr.Equip:SetAttribute("Color", "Green")
				Upgrades_upvr.Equip:SetAttribute("Disabled", false)
				if 1 <= __upvr.Value and not var978_upvr.FirstBuyable then
					local any_GetEquipableMax_result1 = FormulaHandler_upvr.GetEquipableMax(any_GetData_result1_upvr, arg1)
					if 2 <= any_GetEquipableMax_result1 then
						Upgrades_upvr.BuyAll.Text = Translator_upvr.Get("Main.BuyAll").." (x"..Short_upvr.en(any_GetEquipableMax_result1, 0, true)..')'
						Upgrades_upvr.BuyAll.Visible = true
					else
						Upgrades_upvr.BuyAll.Visible = false
					end
				else
					Upgrades_upvr.BuyAll.Visible = false
				end
			end
		end
		Upgrades_upvr.Info.Text = var982_upvr.Boost(FormulaHandler_upvr.GetEquipableBoost(any_GetData_result1_upvr, arg1, var983_upvw))
		-- KONSTANTERROR: [121] 90. Error Block 139 end (CF ANALYSIS FAILED)
	end
	local var990_upvw = false
	local function Equip_upvr() -- Line 2805, Named "Equip"
		--[[ Upvalues[11]:
			[1]: FormulaHandler_upvr (copied, readonly)
			[2]: any_GetData_result1_upvr (copied, readonly)
			[3]: arg1 (readonly)
			[4]: var983_upvw (read and write)
			[5]: SOME_4_upvr (readonly)
			[6]: any_GetValue_result1_2_upvr (readonly)
			[7]: var978_upvr (readonly)
			[8]: Shop_upvr (copied, readonly)
			[9]: Upgrades_upvr (copied, readonly)
			[10]: GuiHandler_upvr (copied, readonly)
			[11]: Networking_upvr_2 (copied, readonly)
		]]
		local var991
		if arg1 == "Explosives" then
			if var983_upvw + 1 > SOME_4_upvr.Value then
				var991 = false
			else
				var991 = true
			end
		elseif var983_upvw > SOME_4_upvr.Value then
			var991 = false
		else
			var991 = true
		end
		if not var991 then
			if any_GetValue_result1_2_upvr.Value < FormulaHandler_upvr.GetEquipableCostForMultiple(any_GetData_result1_upvr, arg1, var983_upvw - SOME_4_upvr.Value) then
				Shop_upvr.Parent = Upgrades_upvr
				GuiHandler_upvr("Shop", 3)
				game.ReplicatedStorage.Events.SetShopSelected:Fire(var978_upvr.Currency)
				return
			end
		end
		Networking_upvr_2.Fire("Equip", arg1, var983_upvw)
	end
	table.insert(tbl_34_upvr, Upgrades_upvr.Previous.MouseButton1Click:Connect(function() -- Line 2781, Named "Previous"
		--[[ Upvalues[7]:
			[1]: Upgrades_upvr (copied, readonly)
			[2]: var990_upvw (read and write)
			[3]: var983_upvw (read and write)
			[4]: tbl_44_upvr (copied, readonly)
			[5]: arg1 (readonly)
			[6]: module_2_upvr (copied, readonly)
			[7]: Refresh_upvr (readonly)
		]]
		if Upgrades_upvr.Previous:GetAttribute("Disabled") then
		else
			if var990_upvw then return end
			var990_upvw = true
			var983_upvw -= 1
			tbl_44_upvr[arg1] = var983_upvw
			module_2_upvr.AnimateShop(10)
			module_2_upvr.UpdateShop(var983_upvw + 1, arg1)
			Refresh_upvr()
			var990_upvw = false
		end
	end))
	table.insert(tbl_34_upvr, Upgrades_upvr.Next.MouseButton1Click:Connect(function() -- Line 2793, Named "Next"
		--[[ Upvalues[8]:
			[1]: Upgrades_upvr (copied, readonly)
			[2]: var990_upvw (read and write)
			[3]: var983_upvw (read and write)
			[4]: tbl_44_upvr (copied, readonly)
			[5]: arg1 (readonly)
			[6]: module_2_upvr (copied, readonly)
			[7]: var929_upvw (copied, read and write)
			[8]: Refresh_upvr (readonly)
		]]
		if Upgrades_upvr.Next:GetAttribute("Disabled") then
		else
			if var990_upvw then return end
			var990_upvw = true
			var983_upvw += 1
			tbl_44_upvr[arg1] = var983_upvw
			module_2_upvr.AnimateShop(-10)
			module_2_upvr.UpdateShop(var983_upvw + 1, var929_upvw)
			Refresh_upvr()
			var990_upvw = false
		end
	end))
	table.insert(tbl_34_upvr, Upgrades_upvr.Equip.MouseButton1Click:Connect(Equip_upvr))
	table.insert(tbl_34_upvr, Upgrades_upvr.BuyAll.MouseButton1Click:Connect(function() -- Line 2823, Named "BuyAll"
		--[[ Upvalues[3]:
			[1]: Upgrades_upvr (copied, readonly)
			[2]: Networking_upvr_2 (copied, readonly)
			[3]: arg1 (readonly)
		]]
		if not Upgrades_upvr.BuyAll.Visible then
		else
			Networking_upvr_2.Fire("BuyAll", arg1)
		end
	end))
	table.insert(tbl_34_upvr, game:GetService("UserInputService").InputBegan:Connect(function(arg1_6, arg2) -- Line 2833
		--[[ Upvalues[11]:
			[1]: Upgrades_upvr (copied, readonly)
			[2]: var990_upvw (read and write)
			[3]: var983_upvw (read and write)
			[4]: tbl_44_upvr (copied, readonly)
			[5]: arg1 (readonly)
			[6]: module_2_upvr (copied, readonly)
			[7]: Refresh_upvr (readonly)
			[8]: var929_upvw (copied, read and write)
			[9]: Equip_upvr (readonly)
			[10]: CloseUpgrades_upvr (copied, readonly)
			[11]: Networking_upvr_2 (copied, readonly)
		]]
		if arg2 then
		else
			if arg1_6.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
			if arg1_6.KeyCode == Enum.KeyCode.DPadLeft or arg1_6.KeyCode == Enum.KeyCode.ButtonL1 then
				if Upgrades_upvr.Previous:GetAttribute("Disabled") then
				else
					if var990_upvw then return end
					var990_upvw = true
					var983_upvw -= 1
					tbl_44_upvr[arg1] = var983_upvw
					module_2_upvr.AnimateShop(10)
					module_2_upvr.UpdateShop(var983_upvw + 1, arg1)
					Refresh_upvr()
					var990_upvw = false
				end
			end
			if arg1_6.KeyCode == Enum.KeyCode.DPadRight or arg1_6.KeyCode == Enum.KeyCode.ButtonR1 then
				if Upgrades_upvr.Next:GetAttribute("Disabled") then
				else
					if var990_upvw then return end
					var990_upvw = true
					var983_upvw += 1
					tbl_44_upvr[arg1] = var983_upvw
					module_2_upvr.AnimateShop(-10)
					module_2_upvr.UpdateShop(var983_upvw + 1, var929_upvw)
					Refresh_upvr()
					var990_upvw = false
				end
			end
			if arg1_6.KeyCode == Enum.KeyCode.ButtonY then
				Equip_upvr()
				return
			end
			if arg1_6.KeyCode == Enum.KeyCode.ButtonB then
				CloseUpgrades_upvr()
				return
			end
			if arg1_6.KeyCode == Enum.KeyCode.ButtonX then
				if not Upgrades_upvr.BuyAll.Visible then return end
				Networking_upvr_2.Fire("BuyAll", arg1)
			end
		end
	end))
	local function UpdateButtonVisibility() -- Line 2849
		--[[ Upvalues[2]:
			[1]: UserInputService_upvr (copied, readonly)
			[2]: Upgrades_upvr (copied, readonly)
		]]
		if not UserInputService_upvr.GamepadEnabled then
			Upgrades_upvr.Equip.Main.Button.Visible = false
			Upgrades_upvr.BuyAll.Main.Button.Image = ""
			Upgrades_upvr.Close.Main.Button.Image = ""
		else
			Upgrades_upvr.Equip.Main.Button.Visible = not Upgrades_upvr.Equip:GetAttribute("Disabled")
			Upgrades_upvr.Equip.Main.Button.Image = UserInputService_upvr:GetImageForKeyCode(Enum.KeyCode.ButtonY)
			Upgrades_upvr.BuyAll.Main.Button.Image = UserInputService_upvr:GetImageForKeyCode(Enum.KeyCode.ButtonX)
			Upgrades_upvr.Close.Main.Button.Image = UserInputService_upvr:GetImageForKeyCode(Enum.KeyCode.ButtonB)
		end
	end
	table.insert(tbl_34_upvr, UserInputService_upvr:GetPropertyChangedSignal("GamepadEnabled"):Connect(UpdateButtonVisibility))
	table.insert(tbl_34_upvr, Upgrades_upvr.Equip:GetAttributeChangedSignal("Disabled"):Connect(UpdateButtonVisibility))
	UpdateButtonVisibility()
	if arg1 == "Pickaxe" then
		table.insert(tbl_34_upvr, Upgrades_upvr.Upgrade.MouseButton1Click:Connect(function() -- Line 2866
			--[[ Upvalues[10]:
				[1]: HttpService_upvr (copied, readonly)
				[2]: PickaxeUpgrades_upvr (copied, readonly)
				[3]: var983_upvw (read and write)
				[4]: FormulaHandler_upvr (copied, readonly)
				[5]: any_GetData_result1_upvr (copied, readonly)
				[6]: Emeralds_upvr (copied, readonly)
				[7]: Shop_upvr (copied, readonly)
				[8]: Upgrades_upvr (copied, readonly)
				[9]: GuiHandler_upvr (copied, readonly)
				[10]: Networking_upvr_2 (copied, readonly)
			]]
			local pcall_result1_5, pcall_result2_3 = pcall(function() -- Line 2868
				--[[ Upvalues[2]:
					[1]: HttpService_upvr (copied, readonly)
					[2]: PickaxeUpgrades_upvr (copied, readonly)
				]]
				return HttpService_upvr:JSONDecode(PickaxeUpgrades_upvr.Value)
			end)
			local var1001
			if pcall_result1_5 and type(pcall_result2_3) == "table" then
				var1001 = pcall_result2_3[tostring(var983_upvw)]
				if type(var1001) ~= "number" then
					var1001 = 0
				end
			end
			if Emeralds_upvr.Value < FormulaHandler_upvr.GetInfo(any_GetData_result1_upvr, "PickaxeBoostCost", var983_upvw, var1001) then
				Shop_upvr.Parent = Upgrades_upvr
				GuiHandler_upvr("Shop", 3)
				game.ReplicatedStorage.Events.SetShopSelected:Fire("Emeralds")
			else
				Networking_upvr_2.Fire("UpgradePickaxe", var983_upvw)
			end
		end))
		table.insert(tbl_34_upvr, PickaxeUpgrades_upvr:GetPropertyChangedSignal("Value"):Connect(Refresh_upvr))
	end
	if arg1 == "Explosives" then
		table.insert(tbl_34_upvr, Upgrades_upvr.Upgrade.MouseButton1Click:Connect(function() -- Line 2889
			--[[ Upvalues[10]:
				[1]: HttpService_upvr (copied, readonly)
				[2]: ExplosiveUpgrades_upvr (copied, readonly)
				[3]: var983_upvw (read and write)
				[4]: FormulaHandler_upvr (copied, readonly)
				[5]: any_GetData_result1_upvr (copied, readonly)
				[6]: Emeralds_upvr (copied, readonly)
				[7]: Shop_upvr (copied, readonly)
				[8]: Upgrades_upvr (copied, readonly)
				[9]: GuiHandler_upvr (copied, readonly)
				[10]: Networking_upvr_2 (copied, readonly)
			]]
			local pcall_result1_3, pcall_result2_5 = pcall(function() -- Line 2891
				--[[ Upvalues[2]:
					[1]: HttpService_upvr (copied, readonly)
					[2]: ExplosiveUpgrades_upvr (copied, readonly)
				]]
				return HttpService_upvr:JSONDecode(ExplosiveUpgrades_upvr.Value)
			end)
			local var1006
			if pcall_result1_3 and type(pcall_result2_5) == "table" then
				var1006 = pcall_result2_5[tostring(var983_upvw)]
				if type(var1006) ~= "number" then
					var1006 = 0
				end
			end
			if Emeralds_upvr.Value < FormulaHandler_upvr.GetInfo(any_GetData_result1_upvr, "ExplosiveBoostCost", var983_upvw, var1006) then
				Shop_upvr.Parent = Upgrades_upvr
				GuiHandler_upvr("Shop", 3)
				game.ReplicatedStorage.Events.SetShopSelected:Fire("Emeralds")
			else
				Networking_upvr_2.Fire("UpgradeExplosive", var983_upvw)
			end
		end))
		table.insert(tbl_34_upvr, ExplosiveUpgrades_upvr:GetPropertyChangedSignal("Value"):Connect(Refresh_upvr))
	end
	if SOME_5_upvr then
		table.insert(tbl_34_upvr, SOME_5_upvr:GetPropertyChangedSignal("Value"):Connect(function() -- Line 2912
			--[[ Upvalues[8]:
				[1]: SOME_5_upvr (readonly)
				[2]: var978_upvr (readonly)
				[3]: var983_upvw (read and write)
				[4]: tbl_44_upvr (copied, readonly)
				[5]: arg1 (readonly)
				[6]: module_2_upvr (copied, readonly)
				[7]: var929_upvw (copied, read and write)
				[8]: Refresh_upvr (readonly)
			]]
			local Value_3 = SOME_5_upvr.Value
			if var978_upvr.FirstBuyable then
				Value_3 = math.max(Value_3 - 1, 0)
			end
			if var983_upvw ~= Value_3 then
				var983_upvw = Value_3
				tbl_44_upvr[arg1] = Value_3
				module_2_upvr.AnimateShop(-10)
				module_2_upvr.UpdateShop(var983_upvw + 1, var929_upvw)
			end
			Refresh_upvr()
		end))
	end
	if SOME_4_upvr then
		table.insert(tbl_34_upvr, SOME_4_upvr:GetPropertyChangedSignal("Value"):Connect(Refresh_upvr))
	end
	table.insert(tbl_34_upvr, any_GetValue_result1_2_upvr:GetPropertyChangedSignal("Value"):Connect(Refresh_upvr))
	table.insert(tbl_34_upvr, Emeralds_upvr:GetPropertyChangedSignal("Value"):Connect(Refresh_upvr))
	table.insert(tbl_34_upvr, __upvr:GetPropertyChangedSignal("Value"):Connect(Refresh_upvr))
	table.insert(tbl_34_upvr, VIP_upvr:GetPropertyChangedSignal("Value"):Connect(Refresh_upvr))
	table.insert(tbl_34_upvr, Translator_upvr.LanguageUpdated:Connect(Refresh_upvr))
	if var978_upvr then
		module_2_upvr.ConnectUpdateIds(var978_upvr.UpdateIds, Refresh_upvr, tbl_34_upvr)
	end
	Refresh_upvr()
	Game_upvr.Enabled = false
	Upgrades_upvr.Enabled = true
end
Upgrades_upvr.Close.MouseButton1Click:Connect(CloseUpgrades_upvr)
Upgrades_upvr.Cash.Buy.MouseButton1Click:Connect(function() -- Line 2951
	--[[ Upvalues[3]:
		[1]: Shop_upvr (readonly)
		[2]: Upgrades_upvr (readonly)
		[3]: GuiHandler_upvr (readonly)
	]]
	Shop_upvr.Parent = Upgrades_upvr
	GuiHandler_upvr("Shop", 3)
	game.ReplicatedStorage.Events.SetShopSelected:Fire("Cash")
end)
Upgrades_upvr.Emeralds.Buy.MouseButton1Click:Connect(function() -- Line 2955
	--[[ Upvalues[3]:
		[1]: Shop_upvr (readonly)
		[2]: Upgrades_upvr (readonly)
		[3]: GuiHandler_upvr (readonly)
	]]
	Shop_upvr.Parent = Upgrades_upvr
	GuiHandler_upvr("Shop", 3)
	game.ReplicatedStorage.Events.SetShopSelected:Fire("Emeralds")
end)
local tbl_28_upvr = {
	[""] = true;
	Max = true;
	Bought = true;
	Locked = true;
}
function module_2_upvr.ConnectIconToText_new(arg1, arg2, arg3) -- Line 2966
	--[[ Upvalues[3]:
		[1]: tbl_46_upvr (readonly)
		[2]: tbl_28_upvr (readonly)
		[3]: tbl_9_upvr (readonly)
	]]
	if tbl_46_upvr[arg1] then
	else
		local Scale_upvr = arg1.Position.Y.Scale
		if arg3 == 'L' then
			arg2.AnchorPoint = Vector2.new(0, 0.5)
		else
			arg2.AnchorPoint = Vector2.new(1, 0.5)
		end
		local var1014_upvw
		local function StateUpdated_upvr() -- Line 2980, Named "StateUpdated"
			--[[ Upvalues[5]:
				[1]: var1014_upvw (read and write)
				[2]: arg2 (readonly)
				[3]: arg1 (readonly)
				[4]: Scale_upvr (readonly)
				[5]: arg3 (readonly)
			]]
			if not var1014_upvw then
				arg2.Visible = false
				arg1.AnchorPoint = Vector2.new(0.5, arg1.AnchorPoint.Y)
				arg1.TextXAlignment = Enum.TextXAlignment.Center
				arg1.Position = UDim2.new(0.5, 0, Scale_upvr, 0)
			else
				if arg3 == 'L' then
					arg1.AnchorPoint = Vector2.new(1, arg1.AnchorPoint.Y)
					arg1.TextXAlignment = Enum.TextXAlignment.Right
				else
					arg1.AnchorPoint = Vector2.new(0, arg1.AnchorPoint.Y)
					arg1.TextXAlignment = Enum.TextXAlignment.Left
				end
				arg2.Visible = true
			end
		end
		local var1015_upvw = false
		local var1016_upvr = Scale_upvr - arg1.Size.Y.Scale * arg1.AnchorPoint.Y
		local function Update() -- Line 2998
			--[[ Upvalues[10]:
				[1]: var1015_upvw (read and write)
				[2]: var1016_upvr (readonly)
				[3]: arg1 (readonly)
				[4]: tbl_28_upvr (copied, readonly)
				[5]: arg2 (readonly)
				[6]: tbl_9_upvr (copied, readonly)
				[7]: var1014_upvw (read and write)
				[8]: StateUpdated_upvr (readonly)
				[9]: arg3 (readonly)
				[10]: Scale_upvr (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
			do
				return
			end
			-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [3] 4. Error Block 3 start (CF ANALYSIS FAILED)
			var1015_upvw = true
			-- KONSTANTERROR: [3] 4. Error Block 3 end (CF ANALYSIS FAILED)
		end
		tbl_46_upvr[arg1] = Update
		local tbl_24_upvr = {}
		table.insert(tbl_24_upvr, arg1:GetPropertyChangedSignal("AbsolutePosition"):Connect(Update))
		table.insert(tbl_24_upvr, arg1:GetPropertyChangedSignal("AbsoluteSize"):Connect(Update))
		table.insert(tbl_24_upvr, arg1:GetPropertyChangedSignal("TextBounds"):Connect(Update))
		table.insert(tbl_24_upvr, arg1:GetPropertyChangedSignal("Text"):Connect(Update))
		table.insert(tbl_24_upvr, arg2:GetPropertyChangedSignal("AbsoluteSize"):Connect(Update))
		table.insert(tbl_24_upvr, arg2:GetPropertyChangedSignal("Image"):Connect(Update))
		table.insert(tbl_24_upvr, arg2.ChildAdded:Connect(Update))
		table.insert(tbl_24_upvr, arg2.ChildRemoved:Connect(Update))
		table.insert(tbl_24_upvr, arg1:GetPropertyChangedSignal("Parent"):Connect(function() -- Line 3038
			--[[ Upvalues[3]:
				[1]: arg1 (readonly)
				[2]: tbl_24_upvr (readonly)
				[3]: tbl_46_upvr (copied, readonly)
			]]
			if arg1.Parent then
			else
				for _, v_53 in tbl_24_upvr do
					v_53:Disconnect()
				end
				table.clear(tbl_24_upvr)
				tbl_46_upvr[arg1] = nil
			end
		end))
		Update()
	end
end
module_2_upvr.ConnectIconToText_new(Upgrades_upvr.BuyAll.Main.Text, Upgrades_upvr.BuyAll.Main.Button, 'L')
module_2_upvr.ConnectIconToText_new(Upgrades_upvr.Close.Main.Text, Upgrades_upvr.Close.Main.Button, 'L')
function module_2_upvr.ConnectUpgrade3D(arg1, arg2) -- Line 3052
	--[[ Upvalues[10]:
		[1]: GameDefinition_upvr (readonly)
		[2]: FormulaHandler_upvr (readonly)
		[3]: any_GetData_result1_upvr (readonly)
		[4]: SharedFunctions_upvr (readonly)
		[5]: SetIcon_upvr (readonly)
		[6]: Translator_upvr (readonly)
		[7]: Short_upvr (readonly)
		[8]: format_upvr (readonly)
		[9]: module_2_upvr (readonly)
		[10]: GuiHandler_upvr (readonly)
	]]
	local var1022 = arg2
	repeat
	until not var1022 and var1022.ClassName == "SurfaceGui"
	local var1023_upvr = GameDefinition_upvr.Formulas.Upgrades[arg1]
	local Boost_upvr = arg2.Boost
	local NextBoost_upvr = arg2.NextBoost
	local Cost_upvr = arg2.Cost
	local Buy_upvr = arg2.Buy
	local Currency_upvr = arg2.Currency
	local any_GetUpgrade_result1_upvr_2 = FormulaHandler_upvr.GetUpgrade(any_GetData_result1_upvr, arg1)
	local any_GetValue_result1_3_upvr = SharedFunctions_upvr.GetValue(any_GetData_result1_upvr, var1023_upvr.Currency)
	SetIcon_upvr(Currency_upvr, var1023_upvr.Currency)
	local Icon = var1023_upvr.Icon
	local var1032_upvw
	local var1033_upvw
	local var1034_upvw
	local var1035_upvw
	local function CurrencyChanged_upvr() -- Line 3086, Named "CurrencyChanged"
		--[[ Upvalues[8]:
			[1]: var1034_upvw (read and write)
			[2]: var1032_upvw (read and write)
			[3]: var1035_upvw (read and write)
			[4]: Buy_upvr (readonly)
			[5]: any_GetValue_result1_3_upvr (readonly)
			[6]: var1033_upvw (read and write)
			[7]: Cost_upvr (readonly)
			[8]: var1023_upvr (readonly)
		]]
		if not var1034_upvw then
		else
			if var1032_upvw then
				if var1035_upvw == 0 then
				else
					var1035_upvw = 0
					Buy_upvr.Visible = false
				end
			end
			if var1035_upvw == 0 or var1035_upvw == nil then
				Buy_upvr.Visible = true
			end
			if var1033_upvw <= any_GetValue_result1_3_upvr.Value then
				if var1035_upvw ~= 1 then
					Cost_upvr.TextColor3 = Color3.fromRGB(255, 255, 255)
					Buy_upvr.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
					Buy_upvr.TextColor3 = Color3.fromRGB(255, 255, 255)
				end
				var1035_upvw = 1
				return
			end
			if var1035_upvw ~= 2 then
				if var1023_upvr.Currency ~= "NumberValues.Emeralds" then
					Cost_upvr.TextColor3 = Color3.fromRGB(255, 0, 0)
					Buy_upvr.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
					Buy_upvr.TextColor3 = Color3.fromRGB(255, 0, 0)
				else
					Cost_upvr.TextColor3 = Color3.fromRGB(255, 255, 255)
					Buy_upvr.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
					Buy_upvr.TextColor3 = Color3.fromRGB(255, 255, 255)
				end
			end
			var1035_upvw = 2
		end
	end
	local Title_upvr = arg2.Title
	local var1037_upvw
	local Level_upvr = arg2.Level
	local var1039_upvw
	local Display_upvr = var1023_upvr.Display
	local var1041_upvw
	local LayoutOrder_upvr = arg2.LayoutOrder
	local function UpgradeChanged() -- Line 3122
		--[[ Upvalues[24]:
			[1]: var1023_upvr (readonly)
			[2]: var1034_upvw (read and write)
			[3]: any_GetData_result1_upvr (copied, readonly)
			[4]: arg2 (readonly)
			[5]: Title_upvr (readonly)
			[6]: Translator_upvr (copied, readonly)
			[7]: var1037_upvw (read and write)
			[8]: var1032_upvw (read and write)
			[9]: any_GetUpgrade_result1_upvr_2 (readonly)
			[10]: Level_upvr (readonly)
			[11]: Short_upvr (copied, readonly)
			[12]: var1039_upvw (read and write)
			[13]: FormulaHandler_upvr (copied, readonly)
			[14]: arg1 (readonly)
			[15]: Boost_upvr (readonly)
			[16]: Display_upvr (readonly)
			[17]: format_upvr (copied, readonly)
			[18]: var1033_upvw (read and write)
			[19]: var1041_upvw (read and write)
			[20]: Currency_upvr (readonly)
			[21]: Cost_upvr (readonly)
			[22]: NextBoost_upvr (readonly)
			[23]: LayoutOrder_upvr (readonly)
			[24]: CurrencyChanged_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		-- KONSTANTERROR: [0] 1. Error Block 70 start (CF ANALYSIS FAILED)
		local var1043
		if var1043 then
			var1043 = var1023_upvr.Unlock(any_GetData_result1_upvr)
			var1034_upvw = var1043
		else
			var1043 = true
			var1034_upvw = var1043
		end
		var1043 = arg2
		var1043.Visible = var1034_upvw
		var1043 = var1034_upvw
		if not var1043 then return end
		var1043 = Title_upvr
		var1043.Text = Translator_upvr.Get("Upgrades."..var1023_upvr.Type)
		var1043 = type(var1023_upvr.MaxLevel)
		if var1043 == "function" then
			var1043 = var1023_upvr.MaxLevel(any_GetData_result1_upvr)
			var1037_upvw = var1043
		else
			var1043 = var1023_upvr.MaxLevel
			var1037_upvw = var1043
		end
		var1043 = var1037_upvw
		if var1043 then
			local Value_6 = any_GetUpgrade_result1_upvr_2.Value
			if var1037_upvw > Value_6 then
				var1043 = false
			else
				var1043 = true
			end
			var1032_upvw = var1043
			var1043 = var1037_upvw
			if var1043 ~= 1 then
				var1043 = Level_upvr
				Value_6 = Translator_upvr.Get("Main.Level")..' '..Short_upvr.en(any_GetUpgrade_result1_upvr_2.Value, 0, true)..'/'..Short_upvr.en(var1037_upvw, 0, true)
				var1043.Text = Value_6
			else
				var1043 = Level_upvr
				if var1032_upvw then
					Value_6 = Translator_upvr.Get("Main.Bought")
				else
					Value_6 = ""
				end
				var1043.Text = Value_6
			end
		else
			var1043 = Level_upvr
			Value_6 = Translator_upvr.Get("Main.Level")..' '..Short_upvr.en(any_GetUpgrade_result1_upvr_2.Value, 0, true)
			var1043.Text = Value_6
			var1043 = false
			var1032_upvw = var1043
		end
		var1043 = FormulaHandler_upvr.GetBoost
		local var1045 = any_GetData_result1_upvr
		var1043 = var1043(var1045, arg1)
		var1039_upvw = var1043
		var1043 = Boost_upvr
		if Display_upvr then
			var1045 = format_upvr(var1039_upvw, Display_upvr)
		else
			var1045 = ""
		end
		var1043.Text = var1045
		var1043 = var1032_upvw
		if var1043 then
			var1043 = nil
			var1033_upvw = var1043
			var1043 = nil
			var1041_upvw = var1043
			var1043 = Currency_upvr
			var1043.Visible = false
			var1043 = Cost_upvr
			var1043.Text = ""
			var1043 = NextBoost_upvr
			var1043.Text = ""
			var1043 = arg2
			var1043.LayoutOrder = LayoutOrder_upvr + 1000
			-- KONSTANTWARNING: GOTO [232] #191
		end
		-- KONSTANTERROR: [0] 1. Error Block 70 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [173] 143. Error Block 54 start (CF ANALYSIS FAILED)
		var1043 = FormulaHandler_upvr.GetCost(any_GetData_result1_upvr, arg1)
		var1033_upvw = var1043
		var1043 = FormulaHandler_upvr.GetBoost(any_GetData_result1_upvr, arg1, 1)
		var1041_upvw = var1043
		var1043 = Currency_upvr
		var1043.Visible = true
		var1043 = var1023_upvr.Currency
		if var1043 == "NumberValues.Emeralds" then
			var1043 = Cost_upvr
			var1043.Text = Short_upvr.en(var1033_upvw * 10)
			-- KONSTANTWARNING: GOTO [215] #176
		end
		-- KONSTANTERROR: [173] 143. Error Block 54 end (CF ANALYSIS FAILED)
	end
	if Icon then
		local clone_7 = script.BoostIcon:Clone()
		clone_7.Position = UDim2.new(0, 0, Boost_upvr.Position.Y.Scale, 0)
		clone_7.Size = UDim2.new(0.15, 0, 0.1, 0)
		clone_7.Parent = arg2
		SetIcon_upvr(clone_7, Icon, true)
		local clone_12 = script.BoostIcon:Clone()
		clone_12.Position = UDim2.new(0, 0, NextBoost_upvr.Position.Y.Scale, 0)
		clone_12.Size = UDim2.new(0.15, 0, 0.1, 0)
		clone_12.Parent = arg2
		SetIcon_upvr(clone_12, Icon, true)
		module_2_upvr.ConnectIconToText_new(Boost_upvr, clone_7, 'R')
		module_2_upvr.ConnectIconToText_new(NextBoost_upvr, clone_12, 'R')
	end
	if var1023_upvr.Currency == "NumberValues.Emeralds" then
		Buy_upvr.MouseButton1Click:Connect(function() -- Line 3191
			--[[ Upvalues[4]:
				[1]: var1032_upvw (read and write)
				[2]: var1033_upvw (read and write)
				[3]: any_GetValue_result1_3_upvr (readonly)
				[4]: GuiHandler_upvr (copied, readonly)
			]]
			if var1032_upvw then
			elseif any_GetValue_result1_3_upvr.Value < var1033_upvw then
				GuiHandler_upvr("Shop", 3)
				game.ReplicatedStorage.Events.SetShopSelected:Fire("Emeralds")
			end
		end)
	end
	any_GetUpgrade_result1_upvr_2:GetPropertyChangedSignal("Value"):Connect(UpgradeChanged)
	any_GetValue_result1_3_upvr:GetPropertyChangedSignal("Value"):Connect(CurrencyChanged_upvr)
	Translator_upvr.LanguageUpdated:Connect(UpgradeChanged)
	module_2_upvr.ConnectUpdateIds(var1023_upvr.UpdateIds, UpgradeChanged)
	UpgradeChanged()
end
local StarterGui = game:GetService("StarterGui")
StarterGui:GetCore("PlayerFriendedEvent").Event:Connect(function(arg1) -- Line 3209
	--[[ Upvalues[1]:
		[1]: tbl_26_upvr (readonly)
	]]
	tbl_26_upvr[arg1.UserId] = true
end)
StarterGui:GetCore("PlayerUnfriendedEvent").Event:Connect(function(arg1) -- Line 3213
	--[[ Upvalues[1]:
		[1]: tbl_26_upvr (readonly)
	]]
	tbl_26_upvr[arg1.UserId] = nil
end)
game.Players.PlayerAdded:Connect(function(arg1) -- Line 3217
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: tbl_26_upvr (readonly)
	]]
	local pcall_result1_2, pcall_result2_4 = pcall(function() -- Line 3218
		--[[ Upvalues[2]:
			[1]: LocalPlayer_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		return LocalPlayer_upvr:IsFriendsWith(arg1)
	end)
	if pcall_result1_2 and pcall_result2_4 then
		tbl_26_upvr[arg1.UserId] = true
	end
end)
game.Players.PlayerRemoving:Connect(function(arg1) -- Line 3226
	--[[ Upvalues[1]:
		[1]: tbl_26_upvr (readonly)
	]]
	tbl_26_upvr[arg1.UserId] = nil
end)
local function UpdateFriends_upvr() -- Line 3230, Named "UpdateFriends"
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: tbl_26_upvr (readonly)
	]]
	for _, v_34_upvr in game.Players:GetPlayers() do
		if v_34_upvr ~= LocalPlayer_upvr then
			task.spawn(function() -- Line 3233
				--[[ Upvalues[3]:
					[1]: LocalPlayer_upvr (copied, readonly)
					[2]: v_34_upvr (readonly)
					[3]: tbl_26_upvr (copied, readonly)
				]]
				local pcall_result1_4, pcall_result2_6 = pcall(function() -- Line 3234
					--[[ Upvalues[2]:
						[1]: LocalPlayer_upvr (copied, readonly)
						[2]: v_34_upvr (copied, readonly)
					]]
					return LocalPlayer_upvr:IsFriendsWith(v_34_upvr.UserId)
				end)
				if not pcall_result1_4 then
				else
					if pcall_result2_6 then
						tbl_26_upvr[v_34_upvr.UserId] = true
						return
					end
					tbl_26_upvr[v_34_upvr.UserId] = nil
				end
			end)
		end
	end
end
task.spawn(function() -- Line 3247
	--[[ Upvalues[1]:
		[1]: UpdateFriends_upvr (readonly)
	]]
	while task.wait(60) do
		UpdateFriends_upvr()
	end
end)
UpdateFriends_upvr()
local function _(arg1, arg2) -- Line 3257, Named "random"
	return arg1 + math.random() * (arg2 - arg1)
end
local Hitbox_upvr = workspace:WaitForChild("Lobby").Sell.Hitbox
function module_2_upvr.SpawnSellMessage(arg1) -- Line 3261
	--[[ Upvalues[3]:
		[1]: Hitbox_upvr (readonly)
		[2]: Short_upvr (readonly)
		[3]: TweenService_upvr (readonly)
	]]
	local Position = Hitbox_upvr.Position
	local Size = Hitbox_upvr.Size
	local var1070 = Position.X - Size.Y / 2
	local var1071 = var1070 + math.random() * (Position.X + Size.Y / 2 - var1070)
	local var1072 = Position.Y - Size.X / 2 + 1
	local var1073 = Position.Z - Size.Z / 2
	local var1074 = var1073 + math.random() * (Position.Z + Size.Z / 2 - var1073)
	local clone_3_upvr = script.Counter:Clone()
	clone_3_upvr.Position = Vector3.new(var1071, var1072, var1074)
	clone_3_upvr.BillboardGui.Count1.Text = '+'..Short_upvr.en(arg1)
	clone_3_upvr.Parent = workspace.Objects
	local any_Create_result1_2 = TweenService_upvr:Create(clone_3_upvr, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Position = Vector3.new(var1071, var1072 + 4, var1074);
	})
	any_Create_result1_2:Play()
	any_Create_result1_2.Completed:Once(function() -- Line 3275
		--[[ Upvalues[1]:
			[1]: clone_3_upvr (readonly)
		]]
		clone_3_upvr:Destroy()
	end)
end
local VFXHandler_upvr = require(game.ReplicatedStorage.Modules.VFXHandler)
Networking_upvr_2.Received("SellCompleted", function(arg1) -- Line 3280
	--[[ Upvalues[4]:
		[1]: module_2_upvr (readonly)
		[2]: VFXHandler_upvr (readonly)
		[3]: LocalPlayer_upvr (readonly)
		[4]: SoundHandler_upvr (readonly)
	]]
	module_2_upvr.SpawnSellMessage(arg1)
	VFXHandler_upvr.Play(LocalPlayer_upvr, "Sell", 0.5)
	SoundHandler_upvr.PlaySound("rbxassetid://4612375233")
end)
local BindableEvent = Instance.new("BindableEvent")
module_2_upvr.FrameChangedEvent = BindableEvent
module_2_upvr.FrameChanged = BindableEvent.Event
local function GetBeamPosition_upvr(arg1, arg2, arg3, arg4) -- Line 3290, Named "GetBeamPosition"
	--[[ Upvalues[2]:
		[1]: module_2_upvr (readonly)
		[2]: SharedFunctions_upvr (readonly)
	]]
	local tbl_25 = {}
	local var1087
	if not module_2_upvr.GetBlock(arg1 + 1, arg2, arg3) then
		var1087 = tbl_25
		table.insert(var1087, Vector3.new(3, 0, 0))
	end
	var1087 = module_2_upvr
	var1087 = arg1 - 1
	if not var1087.GetBlock(var1087, arg2, arg3) then
		var1087 = tbl_25
		table.insert(var1087, Vector3.new(-3, 0, 0))
	end
	var1087 = module_2_upvr
	var1087 = arg1
	if not var1087.GetBlock(var1087, arg2 + 1, arg3) then
		var1087 = tbl_25
		table.insert(var1087, Vector3.new(0, 3, 0))
	end
	var1087 = module_2_upvr
	var1087 = arg1
	if not var1087.GetBlock(var1087, arg2 - 1, arg3) then
		var1087 = tbl_25
		table.insert(var1087, Vector3.new(0, -3, 0))
	end
	var1087 = module_2_upvr
	var1087 = arg1
	if not var1087.GetBlock(var1087, arg2, arg3 + 1) then
		var1087 = tbl_25
		table.insert(var1087, Vector3.new(0, 0, 3))
	end
	var1087 = module_2_upvr
	var1087 = arg1
	if not var1087.GetBlock(var1087, arg2, arg3 - 1) then
		var1087 = tbl_25
		table.insert(var1087, Vector3.new(0, 0, -3))
	end
	var1087 = nil
	for _, v_35 in tbl_25 do
		local var1088 = SharedFunctions_upvr.GetCFrame(arg1, arg2, arg3, module_2_upvr.Position.World).Position + v_35
		if math.huge > (arg4 - var1088).Magnitude then
			var1087 = var1088
		end
	end
	return var1087
end
local var1090_upvw = 0
function module_2_upvr.CreateBlockLaser(arg1, arg2, arg3) -- Line 3332
	--[[ Upvalues[7]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: GetBeamPosition_upvr (readonly)
		[3]: var1090_upvw (read and write)
		[4]: SharedFunctions_upvr (readonly)
		[5]: tbl_42_upvr (readonly)
		[6]: tbl_10_upvr (readonly)
		[7]: TweenService_upvr (readonly)
	]]
	local Character_10 = LocalPlayer_upvr.Character
	if not Character_10 or not Character_10.Parent then
	else
		local Head_3 = Character_10:FindFirstChild("Head")
		if not Head_3 then return end
		local var1093 = Head_3.Position + Vector3.new(0, Head_3.Size.Y / 2 + 2, 0)
		local GetBeamPosition_result1 = GetBeamPosition_upvr(arg1, arg2, arg3, var1093)
		if not GetBeamPosition_result1 then return end
		if 20 <= var1090_upvw then return end
		local any_GetVector3_result1 = SharedFunctions_upvr.GetVector3(arg1, arg2, arg3)
		local var1096 = tbl_42_upvr[any_GetVector3_result1]
		if var1096 and os.clock() < var1096 then return end
		tbl_42_upvr[any_GetVector3_result1] = os.clock() + 0.2
		var1090_upvw += 1
		local clone_5 = script.Laser:Clone()
		clone_5:PivotTo(CFrame.new(var1093, GetBeamPosition_result1) * CFrame.fromEulerAnglesXYZ((-math.pi/2), 0, 0))
		local Attachment_6 = Instance.new("Attachment")
		Attachment_6.Parent = clone_5.Base
		local Part = Instance.new("Part")
		Part.Position = var1093
		Part.Size = Vector3.new(1, 1, 1)
		Part.Transparency = 1
		Part.CanCollide = false
		Part.Anchored = true
		local Attachment = Instance.new("Attachment")
		Attachment.Parent = Part
		local Beam = Instance.new("Beam")
		local Color3_fromRGB_result1 = Color3.fromRGB(255, 0, 0)
		Beam.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3_fromRGB_result1), ColorSequenceKeypoint.new(1, Color3_fromRGB_result1)})
		Beam.Attachment0 = Attachment_6
		Beam.Attachment1 = Attachment
		Beam.Width0 = 0.2
		Beam.Width1 = 0.2
		Beam.FaceCamera = true
		Beam.Parent = Part
		clone_5.Parent = workspace.Objects
		Part.Parent = workspace.Objects
		tbl_10_upvr[clone_5] = GetBeamPosition_result1
		local any_Create_result1 = TweenService_upvr:Create(Part, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			CFrame = CFrame.new(GetBeamPosition_result1);
		})
		any_Create_result1:Play()
		any_Create_result1.Completed:Wait()
		task.wait(0.2)
		tbl_10_upvr[clone_5] = nil
		clone_5:Destroy()
		Part:Destroy()
		var1090_upvw -= 1
	end
end
function module_2_upvr.UpdatePositions() -- Line 3394
	--[[ Upvalues[8]:
		[1]: tbl_3_upvr (readonly)
		[2]: FromVector3_upvr (readonly)
		[3]: SharedFunctions_upvr (readonly)
		[4]: module_2_upvr (readonly)
		[5]: tbl_7_upvr (readonly)
		[6]: RenderDistance_upvr (readonly)
		[7]: BlockHandler_upvr (readonly)
		[8]: tbl_12_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 44 start (CF ANALYSIS FAILED)
	for i_39, v_36 in tbl_3_upvr do
		local var24_result1, var24_result2_3, var24_result3_2 = FromVector3_upvr(i_39)
		v_36[1].CFrame = SharedFunctions_upvr.GetCFrame(var24_result1, var24_result2_3, var24_result3_2, module_2_upvr.Position.World)
	end
	local ClientPosition = module_2_upvr.ClientPosition
	local tbl_29 = {}
	for i_40, v_37 in tbl_7_upvr do
		local FromVector3_upvr_result1, var24_result2_2, FromVector3_upvr_result3_3 = FromVector3_upvr(i_40)
		local var1122
		if FromVector3_upvr_result1 ^ 2 + var24_result2_2 ^ 2 + FromVector3_upvr_result3_3 ^ 2 > RenderDistance_upvr.Value ^ 2 then
			var1122 = false
		else
			var1122 = true
		end
		if var1122 then
			var1122 = module_2_upvr.UnloadChunk
			var1122(FromVector3_upvr_result1, var24_result2_2, FromVector3_upvr_result3_3)
		else
			var1122 = table.insert
			var1122(tbl_29, {FromVector3_upvr_result1 - ClientPosition[1], var24_result2_2 - ClientPosition[2], FromVector3_upvr_result3_3 - ClientPosition[3], v_37})
		end
	end
	table.sort(tbl_29, function(arg1, arg2) -- Line 3414
		local var1125
		if arg1[1] ^ 2 + arg1[2] ^ 2 + arg1[3] ^ 2 >= arg2[1] ^ 2 + arg2[2] ^ 2 + arg2[3] ^ 2 then
			var1125 = false
		else
			var1125 = true
		end
		return var1125
	end)
	-- KONSTANTERROR: [0] 1. Error Block 44 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [213] 180. Error Block 36 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [213] 180. Error Block 36 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [88] 72. Error Block 13 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	-- KONSTANTERROR: [88] 72. Error Block 13 end (CF ANALYSIS FAILED)
end
local tbl_20_upvr = {}
local MarketplaceService_upvr = game:GetService("MarketplaceService")
function module_2_upvr.GetProductInfo(arg1, arg2) -- Line 3456
	--[[ Upvalues[2]:
		[1]: tbl_20_upvr (readonly)
		[2]: MarketplaceService_upvr (readonly)
	]]
	local var1128 = arg1..'_'..tostring(arg2)
	local var1129 = tbl_20_upvr[var1128]
	if var1129 then
		return var1129
	end
	while true do
		local pcall_result1, pcall_result2 = pcall(function() -- Line 3462
			--[[ Upvalues[3]:
				[1]: MarketplaceService_upvr (copied, readonly)
				[2]: arg1 (readonly)
				[3]: arg2 (readonly)
			]]
			return MarketplaceService_upvr:GetProductInfo(arg1, arg2)
		end)
		if pcall_result1 and next(pcall_result2) then
			tbl_20_upvr[var1128] = pcall_result2
			return pcall_result2
		end
		task.wait(1)
	end
end
function module_2_upvr.ConnectUpdateIds(arg1, arg2, arg3) -- Line 3473
	--[[ Upvalues[2]:
		[1]: SharedFunctions_upvr (readonly)
		[2]: any_GetData_result1_upvr (readonly)
	]]
	if not arg1 then
	else
		for _, var1134 in arg1 do
			local any_GetValue_result1 = SharedFunctions_upvr.GetValue(any_GetData_result1_upvr, var1134)
			if not any_GetValue_result1 then
				warn("Invalid Value: "..var1134, debug.traceback())
			else
				if arg3 then
					table.insert(arg3, any_GetValue_result1:GetPropertyChangedSignal("Value"):Connect(arg2))
				end
			end
		end
	end
end
return module_2_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:12
-- Luau version 6, Types version 3
-- Time taken: 0.079538 seconds

local script_upvr = script
local Reference = require(script_upvr.Reference)
local any_getObject_result1 = Reference.getObject()
local var4
if var4 then
	var4 = any_getObject_result1.Value
end
if var4 and var4 ~= script_upvr then
	return require(var4)
end
if not any_getObject_result1 then
	Reference.addToReplicatedStorage()
end
local GoodSignal_upvr = require(script_upvr.Packages.GoodSignal)
local Utility_upvr = require(script_upvr.Utility)
local Themes_upvr = require(script_upvr.Features.Themes)
local module_3_upvr = {}
module_3_upvr.__index = module_3_upvr
local tbl_4_upvr = {}
local any_new_result1_2_upvr = GoodSignal_upvr.new()
local Elements_upvr = script_upvr.Elements
local tbl_11_upvr = {
	mobile = Enum.PreferredInput.Touch;
	desktop = Enum.PreferredInput.KeyboardAndMouse;
	console = Enum.PreferredInput.Gamepad;
}
module_3_upvr.baseDisplayOrderChanged = GoodSignal_upvr.new()
module_3_upvr.baseDisplayOrder = 10
module_3_upvr.baseTheme = require(script_upvr.Features.Themes.Default)
module_3_upvr.isOldTopbar = false
module_3_upvr.iconsDictionary = tbl_4_upvr
module_3_upvr.insetHeightChanged = GoodSignal_upvr.new()
module_3_upvr.container = require(Elements_upvr.Container)(module_3_upvr)
module_3_upvr.topbarEnabled = true
module_3_upvr.iconAdded = GoodSignal_upvr.new()
module_3_upvr.iconRemoved = GoodSignal_upvr.new()
module_3_upvr.iconChanged = GoodSignal_upvr.new()
function module_3_upvr.getIcons() -- Line 110
	--[[ Upvalues[1]:
		[1]: module_3_upvr (readonly)
	]]
	return module_3_upvr.iconsDictionary
end
function module_3_upvr.getIconByUID(arg1) -- Line 114
	--[[ Upvalues[1]:
		[1]: module_3_upvr (readonly)
	]]
	local var13 = module_3_upvr.iconsDictionary[arg1]
	if var13 then
		return var13
	end
	return nil
end
function module_3_upvr.getIcon(arg1) -- Line 122
	--[[ Upvalues[2]:
		[1]: module_3_upvr (readonly)
		[2]: tbl_4_upvr (readonly)
	]]
	local any_getIconByUID_result1 = module_3_upvr.getIconByUID(arg1)
	if any_getIconByUID_result1 then
		return any_getIconByUID_result1
	end
	for _, v in pairs(tbl_4_upvr) do
		if v.name == arg1 then
			return v
		end
	end
	return nil
end
function module_3_upvr.setTopbarEnabled(arg1, arg2) -- Line 135
	--[[ Upvalues[1]:
		[1]: module_3_upvr (readonly)
	]]
	local var24
	if typeof(arg1) ~= "boolean" then
		var24 = module_3_upvr.topbarEnabled
	end
	if not arg2 then
		module_3_upvr.topbarEnabled = var24
	end
	for _, v_2 in pairs(module_3_upvr.container) do
		v_2.Enabled = var24
	end
end
function module_3_upvr.modifyBaseTheme(arg1) -- Line 147
	--[[ Upvalues[3]:
		[1]: Themes_upvr (readonly)
		[2]: module_3_upvr (readonly)
		[3]: tbl_4_upvr (readonly)
	]]
	for _, v_3 in pairs(Themes_upvr.getModifications(arg1)) do
		for _, v_4 in pairs(module_3_upvr.baseTheme) do
			Themes_upvr.merge(v_4, v_3)
		end
	end
	for _, v_5 in pairs(tbl_4_upvr) do
		v_5:setTheme(module_3_upvr.baseTheme)
	end
end
function module_3_upvr.setDisplayOrder(arg1) -- Line 159
	--[[ Upvalues[1]:
		[1]: module_3_upvr (readonly)
	]]
	module_3_upvr.baseDisplayOrder = arg1
	module_3_upvr.baseDisplayOrderChanged:Fire(arg1)
end
task.defer(require(script_upvr.Features.Gamepad).start, module_3_upvr)
task.defer(require(script_upvr.Features.Overflow).start, module_3_upvr)
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
task.defer(function() -- Line 169
	--[[ Upvalues[3]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: module_3_upvr (readonly)
		[3]: script_upvr (readonly)
	]]
	local PlayerGui = LocalPlayer_upvr:WaitForChild("PlayerGui")
	for _, v_6 in pairs(module_3_upvr.container) do
		v_6.Parent = PlayerGui
	end
	require(script_upvr.Attribute)
end)
local Janitor_upvr = require(script_upvr.Packages.Janitor)
local var54_upvw = 0
local UserInputService_upvr = game:GetService("UserInputService")
local StarterGui_upvr = game:GetService("StarterGui")
function module_3_upvr.new() -- Line 180
	--[[ Upvalues[12]:
		[1]: module_3_upvr (readonly)
		[2]: Janitor_upvr (readonly)
		[3]: Utility_upvr (readonly)
		[4]: tbl_4_upvr (readonly)
		[5]: GoodSignal_upvr (readonly)
		[6]: script_upvr (readonly)
		[7]: Elements_upvr (readonly)
		[8]: var54_upvw (read and write)
		[9]: UserInputService_upvr (readonly)
		[10]: tbl_11_upvr (readonly)
		[11]: any_new_result1_2_upvr (readonly)
		[12]: StarterGui_upvr (readonly)
	]]
	local module_2_upvr = {}
	setmetatable(module_2_upvr, module_3_upvr)
	local any_new_result1 = Janitor_upvr.new()
	module_2_upvr.janitor = any_new_result1
	module_2_upvr.themesJanitor = any_new_result1:add(Janitor_upvr.new())
	module_2_upvr.singleClickJanitor = any_new_result1:add(Janitor_upvr.new())
	module_2_upvr.captionJanitor = any_new_result1:add(Janitor_upvr.new())
	module_2_upvr.joinJanitor = any_new_result1:add(Janitor_upvr.new())
	module_2_upvr.menuJanitor = any_new_result1:add(Janitor_upvr.new())
	module_2_upvr.dropdownJanitor = any_new_result1:add(Janitor_upvr.new())
	local any_generateUID_result1_upvr = Utility_upvr.generateUID()
	tbl_4_upvr[any_generateUID_result1_upvr] = module_2_upvr
	any_new_result1:add(function() -- Line 197
		--[[ Upvalues[2]:
			[1]: tbl_4_upvr (copied, readonly)
			[2]: any_generateUID_result1_upvr (readonly)
		]]
		tbl_4_upvr[any_generateUID_result1_upvr] = nil
	end)
	module_2_upvr.selected = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.deselected = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.toggled = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.viewingStarted = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.viewingEnded = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.stateChanged = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.notified = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.noticeStarted = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.noticeChanged = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.endNotices = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.toggleKeyAdded = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.fakeToggleKeyChanged = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.alignmentChanged = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.updateSize = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.resizingComplete = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.joinedParent = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.menuSet = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.dropdownSet = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.updateMenu = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.startMenuUpdate = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.childThemeModified = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.indicatorSet = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.dropdownChildAdded = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.menuChildAdded = any_new_result1:add(GoodSignal_upvr.new())
	module_2_upvr.iconModule = script_upvr
	module_2_upvr.UID = any_generateUID_result1_upvr
	module_2_upvr.isEnabled = true
	module_2_upvr.enabled = module_2_upvr.isEnabled
	module_2_upvr.isSelected = false
	module_2_upvr.isViewing = false
	module_2_upvr.joinedFrame = false
	module_2_upvr.parentIconUID = false
	module_2_upvr.deselectWhenOtherIconSelected = true
	module_2_upvr.totalNotices = 0
	module_2_upvr.activeState = "Deselected"
	module_2_upvr.alignment = ""
	module_2_upvr.originalAlignment = ""
	module_2_upvr.appliedTheme = {}
	module_2_upvr.appearance = {}
	module_2_upvr.cachedInstances = {}
	module_2_upvr.cachedNamesToInstances = {}
	module_2_upvr.cachedCollectives = {}
	module_2_upvr.bindedToggleKeys = {}
	module_2_upvr.customBehaviours = {}
	module_2_upvr.toggleItems = {}
	module_2_upvr.bindedEvents = {}
	module_2_upvr.notices = {}
	module_2_upvr.menuIcons = {}
	module_2_upvr.dropdownIcons = {}
	module_2_upvr.childIconsDict = {}
	module_2_upvr.creationTime = os.clock()
	module_2_upvr.widget = any_new_result1:add(require(Elements_upvr.Widget)(module_2_upvr, module_3_upvr))
	module_2_upvr:setAlignment()
	var54_upvw += 1
	local var65 = var54_upvw * 0.01 + 1
	module_2_upvr:setOrder(var65, "deselected")
	module_2_upvr:setOrder(var65, "selected")
	module_2_upvr:setTheme(module_3_upvr.baseTheme)
	local any_getInstance_result1_3 = module_2_upvr:getInstance("ClickRegion")
	local var67_upvw = false
	local var68_upvw = 0
	local function _() -- Line 277, Named "handleToggle"
		--[[ Upvalues[2]:
			[1]: module_2_upvr (readonly)
			[2]: var68_upvw (read and write)
		]]
		if module_2_upvr.locked then
		else
			local tick_result1_4 = tick()
			if tick_result1_4 - var68_upvw < 0.1 then return end
			var68_upvw = tick_result1_4
			if module_2_upvr.isSelected then
				module_2_upvr:deselect("User", module_2_upvr)
				return
			end
			module_2_upvr:select("User", module_2_upvr)
		end
	end
	any_getInstance_result1_3.MouseButton1Click:Connect(function() -- Line 296
		--[[ Upvalues[3]:
			[1]: var67_upvw (read and write)
			[2]: module_2_upvr (readonly)
			[3]: var68_upvw (read and write)
		]]
		var67_upvw = true
		if module_2_upvr.locked then
		else
			local tick_result1_2 = tick()
			if tick_result1_2 - var68_upvw < 0.1 then return end
			var68_upvw = tick_result1_2
			if module_2_upvr.isSelected then
				module_2_upvr:deselect("User", module_2_upvr)
				return
			end
			module_2_upvr:select("User", module_2_upvr)
		end
	end)
	any_getInstance_result1_3.TouchTap:Connect(function() -- Line 301
		--[[ Upvalues[3]:
			[1]: var67_upvw (read and write)
			[2]: module_2_upvr (readonly)
			[3]: var68_upvw (read and write)
		]]
		if not var67_upvw then
			if module_2_upvr.locked then return end
			local tick_result1 = tick()
			if tick_result1 - var68_upvw < 0.1 then return end
			var68_upvw = tick_result1
			if module_2_upvr.isSelected then
				module_2_upvr:deselect("User", module_2_upvr)
				return
			end
			module_2_upvr:select("User", module_2_upvr)
		end
	end)
	any_new_result1:add(UserInputService_upvr.InputBegan:Connect(function(arg1, arg2) -- Line 314
		--[[ Upvalues[2]:
			[1]: module_2_upvr (readonly)
			[2]: var68_upvw (read and write)
		]]
		if module_2_upvr.locked then
		elseif module_2_upvr.bindedToggleKeys[arg1.KeyCode] and not arg2 then
			if module_2_upvr.locked then return end
			local tick_result1_3 = tick()
			if tick_result1_3 - var68_upvw < 0.1 then return end
			var68_upvw = tick_result1_3
			if module_2_upvr.isSelected then
				module_2_upvr:deselect("User", module_2_upvr)
				return
			end
			module_2_upvr:select("User", module_2_upvr)
		end
	end))
	local function viewingEnded() -- Line 336
		--[[ Upvalues[1]:
			[1]: module_2_upvr (readonly)
		]]
		if module_2_upvr.locked then
		else
			module_2_upvr.isViewing = false
			module_2_upvr.viewingEnded:Fire(true)
			module_2_upvr:setState(nil, "User", module_2_upvr)
		end
	end
	module_2_upvr.joinedParent:Connect(function() -- Line 344
		--[[ Upvalues[1]:
			[1]: module_2_upvr (readonly)
		]]
		if module_2_upvr.isViewing then
			if module_2_upvr.locked then return end
			module_2_upvr.isViewing = false
			module_2_upvr.viewingEnded:Fire(true)
			module_2_upvr:setState(nil, "User", module_2_upvr)
		end
	end)
	any_getInstance_result1_3.MouseEnter:Connect(function() -- Line 349
		--[[ Upvalues[3]:
			[1]: UserInputService_upvr (copied, readonly)
			[2]: tbl_11_upvr (copied, readonly)
			[3]: module_2_upvr (readonly)
		]]
		local var78
		if UserInputService_upvr.PreferredInput == tbl_11_upvr.desktop then
			var78 = false
		else
			var78 = true
		end
		if module_2_upvr.locked then
		else
			module_2_upvr.isViewing = true
			module_2_upvr.viewingStarted:Fire(true)
			if not var78 then
				module_2_upvr:setState("Viewing", "User", module_2_upvr)
			end
		end
	end)
	local var79_upvw = 0
	any_new_result1:add(UserInputService_upvr.TouchEnded:Connect(viewingEnded))
	any_getInstance_result1_3.MouseLeave:Connect(viewingEnded)
	any_getInstance_result1_3.SelectionGained:Connect(function(arg1) -- Line 326, Named "viewingStarted"
		--[[ Upvalues[1]:
			[1]: module_2_upvr (readonly)
		]]
		if module_2_upvr.locked then
		else
			module_2_upvr.isViewing = true
			module_2_upvr.viewingStarted:Fire(true)
			if not arg1 then
				module_2_upvr:setState("Viewing", "User", module_2_upvr)
			end
		end
	end)
	any_getInstance_result1_3.SelectionLost:Connect(viewingEnded)
	any_getInstance_result1_3.MouseButton1Down:Connect(function() -- Line 358
		--[[ Upvalues[4]:
			[1]: module_2_upvr (readonly)
			[2]: UserInputService_upvr (copied, readonly)
			[3]: tbl_11_upvr (copied, readonly)
			[4]: var79_upvw (read and write)
		]]
		if not module_2_upvr.locked and UserInputService_upvr.PreferredInput == tbl_11_upvr.mobile then
			var79_upvw += 1
			task.delay(0.2, function() -- Line 362
				--[[ Upvalues[3]:
					[1]: var79_upvw (readonly)
					[2]: var79_upvw (copied, read and write)
					[3]: module_2_upvr (copied, readonly)
				]]
				if var79_upvw == var79_upvw then
					if module_2_upvr.locked then return end
					module_2_upvr.isViewing = true
					module_2_upvr.viewingStarted:Fire(true)
					module_2_upvr:setState("Viewing", "User", module_2_upvr)
				end
			end)
		end
	end)
	any_getInstance_result1_3.MouseButton1Up:Connect(function() -- Line 369
		--[[ Upvalues[1]:
			[1]: var79_upvw (read and write)
		]]
		var79_upvw += 1
	end)
	local any_getInstance_result1_4_upvr = module_2_upvr:getInstance("IconOverlay")
	module_2_upvr.viewingStarted:Connect(function() -- Line 375
		--[[ Upvalues[2]:
			[1]: any_getInstance_result1_4_upvr (readonly)
			[2]: module_2_upvr (readonly)
		]]
		any_getInstance_result1_4_upvr.Visible = not module_2_upvr.overlayDisabled
	end)
	module_2_upvr.viewingEnded:Connect(function() -- Line 378
		--[[ Upvalues[1]:
			[1]: any_getInstance_result1_4_upvr (readonly)
		]]
		any_getInstance_result1_4_upvr.Visible = false
	end)
	any_new_result1:add(any_new_result1_2_upvr:Connect(function(arg1) -- Line 383
		--[[ Upvalues[1]:
			[1]: module_2_upvr (readonly)
		]]
		if arg1 ~= module_2_upvr and module_2_upvr.deselectWhenOtherIconSelected and arg1.deselectWhenOtherIconSelected then
			module_2_upvr:deselect("AutoDeselect", arg1)
		end
	end))
	local var90
	for _, v_7 in pairs(string.split(debug.info(2, 's'), '.')) do
		local SOME = game:FindFirstChild(v_7)
		if not SOME then break end
		if SOME:IsA("ScreenGui") then
			var90 = SOME
		end
	end
	if SOME and var90 and var90.ResetOnSpawn == true then
		module_2_upvr.originsScreenGui = var90
		Utility_upvr.localPlayerRespawned(function() -- Line 409
			--[[ Upvalues[1]:
				[1]: module_2_upvr (readonly)
			]]
			module_2_upvr:destroy()
		end)
	end
	module_2_upvr.toggled:Connect(function(arg1) -- Line 415
		--[[ Upvalues[2]:
			[1]: module_2_upvr (readonly)
			[2]: module_3_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		module_2_upvr.noticeChanged:Fire(module_2_upvr.totalNotices)
		for i_8, _ in pairs(module_2_upvr.childIconsDict) do
			local any_getIconByUID_result1_3 = module_3_upvr.getIconByUID(i_8)
			any_getIconByUID_result1_3.noticeChanged:Fire(any_getIconByUID_result1_3.totalNotices)
			if not arg1 and any_getIconByUID_result1_3.isSelected then
				for _, _ in pairs(any_getIconByUID_result1_3.childIconsDict) do
					any_getIconByUID_result1_3:deselect("HideParentFeature", module_2_upvr)
				end
			end
		end
	end)
	module_2_upvr.selected:Connect(function() -- Line 438
		--[[ Upvalues[2]:
			[1]: module_2_upvr (readonly)
			[2]: StarterGui_upvr (copied, readonly)
		]]
		local var118
		if 0 >= #module_2_upvr.dropdownIcons then
			var118 = false
		else
			var118 = true
		end
		if var118 then
			if StarterGui_upvr:GetCore("ChatActive") and module_2_upvr.alignment ~= "Right" then
				module_2_upvr.chatWasPreviouslyActive = true
				StarterGui_upvr:SetCore("ChatActive", false)
			end
			if StarterGui_upvr:GetCoreGuiEnabled("PlayerList") and module_2_upvr.alignment ~= "Left" then
				module_2_upvr.playerlistWasPreviouslyActive = true
				StarterGui_upvr:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
			end
		end
	end)
	module_2_upvr.deselected:Connect(function() -- Line 451
		--[[ Upvalues[2]:
			[1]: module_2_upvr (readonly)
			[2]: StarterGui_upvr (copied, readonly)
		]]
		if module_2_upvr.chatWasPreviouslyActive then
			module_2_upvr.chatWasPreviouslyActive = nil
			StarterGui_upvr:SetCore("ChatActive", true)
		end
		if module_2_upvr.playerlistWasPreviouslyActive then
			module_2_upvr.playerlistWasPreviouslyActive = nil
			StarterGui_upvr:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
		end
	end)
	task.delay(0.1, function() -- Line 465
		--[[ Upvalues[1]:
			[1]: module_2_upvr (readonly)
		]]
		if module_2_upvr.activeState == "Deselected" then
			module_2_upvr.stateChanged:Fire("Deselected")
			module_2_upvr:refresh()
		end
	end)
	module_3_upvr.iconAdded:Fire(module_2_upvr)
	return module_2_upvr
end
function module_3_upvr.setName(arg1, arg2) -- Line 481
	arg1.widget.Name = arg2
	arg1.name = arg2
	return arg1
end
function module_3_upvr.setState(arg1, arg2, arg3, arg4) -- Line 487
	--[[ Upvalues[2]:
		[1]: Utility_upvr (readonly)
		[2]: any_new_result1_2_upvr (readonly)
	]]
	if not arg2 then
		if arg1.isSelected then
		else
		end
	end
	local any_formatStateName_result1 = Utility_upvr.formatStateName("Deselected")
	if arg1.activeState == any_formatStateName_result1 then
	else
		arg1.activeState = any_formatStateName_result1
		if any_formatStateName_result1 == "Deselected" then
			arg1.isSelected = false
			if arg1.isSelected then
				arg1.toggled:Fire(false, arg3, arg4)
				arg1.deselected:Fire(arg3, arg4)
			end
			arg1:_setToggleItemsVisible(false, arg3, arg4)
		elseif any_formatStateName_result1 == "Selected" then
			arg1.isSelected = true
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if not arg1.isSelected then
				arg1.toggled:Fire(true, arg3, arg4)
				arg1.selected:Fire(arg3, arg4)
				any_new_result1_2_upvr:Fire(arg1, arg3, arg4)
			end
			arg1:_setToggleItemsVisible(true, arg3, arg4)
		end
		arg1.stateChanged:Fire(any_formatStateName_result1, arg3, arg4)
	end
end
function module_3_upvr.getInstance(arg1, arg2) -- Line 520
	--[[ Upvalues[1]:
		[1]: Themes_upvr (readonly)
	]]
	local var122 = arg1.cachedNamesToInstances[arg2]
	if var122 then
		return var122
	end
	local function cacheInstance_upvr(arg1_2, arg2_2) -- Line 528, Named "cacheInstance"
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		local var123
		if not arg1.cachedInstances[arg2_2] then
			local Collective = arg2_2:GetAttribute("Collective")
			var123 = Collective
			if var123 then
				var123 = arg1.cachedCollectives[Collective]
			end
			if var123 then
				table.insert(var123, arg2_2)
			end
			arg1.cachedNamesToInstances[arg1_2] = arg2_2
			arg1.cachedInstances[arg2_2] = true
			arg2_2.Destroying:Once(function() -- Line 538
				--[[ Upvalues[3]:
					[1]: arg1 (copied, readonly)
					[2]: arg1_2 (readonly)
					[3]: arg2_2 (readonly)
				]]
				arg1.cachedNamesToInstances[arg1_2] = nil
				arg1.cachedInstances[arg2_2] = nil
			end)
		end
	end
	local widget = arg1.widget
	cacheInstance_upvr("Widget", widget)
	if arg2 == "Widget" then
		return widget
	end
	local var127_upvw
	local function scanChildren_upvr(arg1_3) -- Line 551, Named "scanChildren"
		--[[ Upvalues[6]:
			[1]: arg1 (readonly)
			[2]: Themes_upvr (copied, readonly)
			[3]: scanChildren_upvr (readonly)
			[4]: cacheInstance_upvr (readonly)
			[5]: arg2 (readonly)
			[6]: var127_upvw (read and write)
		]]
		for _, v_10 in pairs(arg1_3:GetChildren()) do
			local WidgetUID = v_10:GetAttribute("WidgetUID")
			if not WidgetUID or WidgetUID == arg1.UID then
				local any_getRealInstance_result1 = Themes_upvr.getRealInstance(v_10)
				if any_getRealInstance_result1 then
					v_10 = any_getRealInstance_result1
				end
				scanChildren_upvr(v_10)
				if v_10:IsA("GuiBase") or v_10:IsA("UIBase") or v_10:IsA("ValueBase") then
					local Name = v_10.Name
					cacheInstance_upvr(Name, v_10)
					if Name == arg2 then
						var127_upvw = v_10
					end
				end
			end
		end
	end
	scanChildren_upvr(widget)
	return var127_upvw
end
function module_3_upvr.getCollective(arg1, arg2) -- Line 580
	local var138 = arg1.cachedCollectives[arg2]
	if var138 then
		return var138
	end
	local module = {}
	for i_11, _ in pairs(arg1.cachedInstances) do
		if i_11:GetAttribute("Collective") == arg2 then
			table.insert(module, i_11)
		end
	end
	arg1.cachedCollectives[arg2] = module
	return module
end
function module_3_upvr.getInstanceOrCollective(arg1, arg2) -- Line 601
	local any_getInstance_result1 = arg1:getInstance(arg2)
	local var144
	if any_getInstance_result1 then
		table.insert(var144, any_getInstance_result1)
	end
	if #var144 == 0 then
		var144 = arg1:getCollective(arg2)
	end
	return var144
end
function module_3_upvr.getStateGroup(arg1, arg2) -- Line 615
	local var145 = arg2
	if not var145 then
		var145 = arg1.activeState
	end
	local var146 = arg1.appearance[var145]
	if not var146 then
		var146 = {}
		arg1.appearance[var145] = var146
	end
	return var146
end
function module_3_upvr.refreshAppearance(arg1, arg2, arg3) -- Line 625
	--[[ Upvalues[1]:
		[1]: Themes_upvr (readonly)
	]]
	Themes_upvr.refresh(arg1, arg2, arg3)
	return arg1
end
function module_3_upvr.refresh(arg1) -- Line 630
	arg1:refreshAppearance(arg1.widget)
	arg1.updateSize:Fire()
	return arg1
end
function module_3_upvr.updateParent(arg1) -- Line 636
	--[[ Upvalues[1]:
		[1]: module_3_upvr (readonly)
	]]
	local any_getIconByUID_result1_2 = module_3_upvr.getIconByUID(arg1.parentIconUID)
	if any_getIconByUID_result1_2 then
		any_getIconByUID_result1_2.updateSize:Fire()
	end
end
function module_3_upvr.setBehaviour(arg1, arg2, arg3, arg4, arg5) -- Line 643
	arg1.customBehaviours[arg2..'-'..arg3] = arg4
	if arg5 then
		for _, v_12 in pairs(arg1:getInstanceOrCollective(arg2)) do
			arg1:refreshAppearance(v_12, arg3)
		end
	end
end
function module_3_upvr.modifyTheme(arg1, arg2, arg3) -- Line 656
	--[[ Upvalues[1]:
		[1]: Themes_upvr (readonly)
	]]
	return arg1, Themes_upvr.modify(arg1, arg2, arg3)
end
function module_3_upvr.modifyChildTheme(arg1, arg2, arg3) -- Line 661
	--[[ Upvalues[1]:
		[1]: module_3_upvr (readonly)
	]]
	arg1.childModifications = arg2
	arg1.childModificationsUID = arg3
	for i_13, _ in pairs(arg1.childIconsDict) do
		module_3_upvr.getIconByUID(i_13):modifyTheme(arg2, arg3)
	end
	arg1.childThemeModified:Fire()
	return arg1
end
function module_3_upvr.removeModification(arg1, arg2) -- Line 674
	--[[ Upvalues[1]:
		[1]: Themes_upvr (readonly)
	]]
	Themes_upvr.remove(arg1, arg2)
	return arg1
end
function module_3_upvr.removeModificationWith(arg1, arg2, arg3, arg4) -- Line 679
	--[[ Upvalues[1]:
		[1]: Themes_upvr (readonly)
	]]
	Themes_upvr.removeWith(arg1, arg2, arg3, arg4)
	return arg1
end
function module_3_upvr.setTheme(arg1, arg2) -- Line 684
	--[[ Upvalues[1]:
		[1]: Themes_upvr (readonly)
	]]
	Themes_upvr.set(arg1, arg2)
	return arg1
end
function module_3_upvr.setEnabled(arg1, arg2) -- Line 689
	arg1.isEnabled = arg2
	arg1.enabled = arg1.isEnabled
	arg1.widget.Visible = arg2
	arg1:updateParent()
	return arg1
end
function module_3_upvr.select(arg1, arg2, arg3) -- Line 697
	arg1:setState("Selected", arg2, arg3)
	return arg1
end
function module_3_upvr.deselect(arg1, arg2, arg3) -- Line 702
	arg1:setState("Deselected", arg2, arg3)
	return arg1
end
function module_3_upvr.notify(arg1, arg2, arg3) -- Line 707
	--[[ Upvalues[2]:
		[1]: Elements_upvr (readonly)
		[2]: module_3_upvr (readonly)
	]]
	if not arg1.notice then
		arg1.notice = require(Elements_upvr.Notice)(arg1, module_3_upvr)
	end
	arg1.noticeStarted:Fire(arg2, arg3)
	return arg1
end
function module_3_upvr.clearNotices(arg1) -- Line 721
	arg1.endNotices:Fire()
	return arg1
end
function module_3_upvr.disableOverlay(arg1, arg2) -- Line 726
	arg1.overlayDisabled = arg2
	return arg1
end
module_3_upvr.disableStateOverlay = module_3_upvr.disableOverlay
local ContentProvider_upvr = game:GetService("ContentProvider")
function module_3_upvr.setImage(arg1, arg2, arg3) -- Line 732
	--[[ Upvalues[1]:
		[1]: ContentProvider_upvr (readonly)
	]]
	local tbl_5 = {"IconImage", "Image"}
	tbl_5[3] = arg2
	tbl_5[4] = arg3
	arg1:modifyTheme(tbl_5)
	task.spawn(function() -- Line 736
		--[[ Upvalues[2]:
			[1]: arg2 (readonly)
			[2]: ContentProvider_upvr (copied, readonly)
		]]
		local var161
		if tonumber(arg2) then
			var161 = `rbxassetid://{arg2}`
		else
			var161 = arg2
		end
		if ContentProvider_upvr:GetAssetFetchStatus(var161) ~= Enum.AssetFetchStatus.Success then
			pcall(ContentProvider_upvr.PreloadAsync, ContentProvider_upvr, {var161})
		end
	end)
	return arg1
end
function module_3_upvr.setLabel(arg1, arg2, arg3) -- Line 748
	local tbl_13 = {"IconLabel", "Text"}
	tbl_13[3] = arg2
	tbl_13[4] = arg3
	arg1:modifyTheme(tbl_13)
	return arg1
end
function module_3_upvr.setOrder(arg1, arg2, arg3) -- Line 753
	local var164 = arg2 * 100
	local tbl_6 = {"IconSpot", "LayoutOrder", var164}
	tbl_6[4] = arg3
	arg1:modifyTheme(tbl_6)
	local tbl_8 = {"Widget", "LayoutOrder", var164}
	tbl_8[4] = arg3
	arg1:modifyTheme(tbl_8)
	return arg1
end
function module_3_upvr.setCornerRadius(arg1, arg2, arg3) -- Line 762
	local tbl_2 = {"IconCorners", "CornerRadius"}
	tbl_2[3] = arg2
	tbl_2[4] = arg3
	arg1:modifyTheme(tbl_2)
	return arg1
end
function module_3_upvr.align(arg1, arg2, arg3) -- Line 767
	--[[ Upvalues[1]:
		[1]: module_3_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local any_lower_result1 = tostring(arg2):lower()
	if any_lower_result1 == "mid" or any_lower_result1 == "centre" then
	end
	if "center" ~= "left" then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
		if "center" ~= "center" and "center" ~= "right" then
		end
	end
	if "left" ~= "center" or not module_3_upvr.container.TopbarCentered then
		local TopbarStandard_2 = module_3_upvr.container.TopbarStandard
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
	local var174 = string.upper(string.sub("left", 1, 1))..string.sub("left", 2)
	if not arg3 then
		arg1.originalAlignment = var174
	end
	local var175 = TopbarStandard_2.Holders[var174]
	arg1.screenGui = TopbarStandard_2
	arg1.alignmentHolder = var175
	if not arg1.isDestroyed then
		arg1.widget.Parent = arg1.joinedFrame or var175
	end
	arg1.alignment = var174
	arg1.alignmentChanged:Fire(var174)
	module_3_upvr.iconChanged:Fire(arg1)
	return arg1
end
module_3_upvr.setAlignment = module_3_upvr.align
function module_3_upvr.setLeft(arg1) -- Line 796
	arg1:setAlignment("Left")
	return arg1
end
function module_3_upvr.setMid(arg1) -- Line 801
	arg1:setAlignment("Center")
	return arg1
end
function module_3_upvr.setRight(arg1) -- Line 806
	arg1:setAlignment("Right")
	return arg1
end
function module_3_upvr.setWidth(arg1, arg2, arg3) -- Line 811
	local tbl_7 = {"Widget", "DesiredWidth"}
	tbl_7[3] = arg2
	tbl_7[4] = arg3
	arg1:modifyTheme(tbl_7)
	return arg1
end
function module_3_upvr.setImageScale(arg1, arg2, arg3) -- Line 819
	local tbl_3 = {"IconImageScale", "Value"}
	tbl_3[3] = arg2
	tbl_3[4] = arg3
	arg1:modifyTheme(tbl_3)
	return arg1
end
function module_3_upvr.setImageRatio(arg1, arg2, arg3) -- Line 824
	local tbl_9 = {"IconImageRatio", "AspectRatio"}
	tbl_9[3] = arg2
	tbl_9[4] = arg3
	arg1:modifyTheme(tbl_9)
	return arg1
end
function module_3_upvr.setTextSize(arg1, arg2, arg3) -- Line 829
	local tbl = {"IconLabel", "TextSize"}
	tbl[3] = arg2
	tbl[4] = arg3
	arg1:modifyTheme(tbl)
	return arg1
end
function module_3_upvr.setTextFont(arg1, arg2, arg3, arg4, arg5) -- Line 834
	-- KONSTANTERROR: [0] 1. Error Block 22 start (CF ANALYSIS FAILED)
	local var180
	if not var180 then
		var180 = Enum.FontWeight.Regular
	end
	var180 = arg4
	if not var180 then
		var180 = Enum.FontStyle.Normal
	end
	var180 = nil
	local typeof_result1 = typeof(arg2)
	if typeof_result1 == "number" then
		var180 = Font.fromId(arg2, var180, var180)
		-- KONSTANTWARNING: GOTO [48] #39
	end
	-- KONSTANTERROR: [0] 1. Error Block 22 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [26] 22. Error Block 23 start (CF ANALYSIS FAILED)
	if typeof_result1 == "EnumItem" then
		var180 = Font.fromEnum(arg2)
	elseif typeof_result1 == "string" and not arg2:match("rbxasset") then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
		var180 = Font.fromName(arg2, var180, var180)
	end
	if not var180 then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
		var180 = Font.new(arg2, var180, var180)
	end
	local tbl_12 = {"IconLabel", "FontFace", var180}
	tbl_12[4] = arg5
	arg1:modifyTheme(tbl_12)
	do
		return arg1
	end
	-- KONSTANTERROR: [26] 22. Error Block 23 end (CF ANALYSIS FAILED)
end
function module_3_upvr.setTextColor(arg1, arg2, arg3) -- Line 855
	if arg2 == nil or arg2 == "" or type(arg2) ~= "userdata" or typeof(arg2) ~= "Color3" then
		if arg2 ~= nil and arg2 ~= "" then
			warn("setTextColor item must be a Color3 value! Changed the color to white.")
		end
	end
	local tbl_10 = {"IconLabel", "TextColor3", Color3.fromRGB(255, 255, 255)}
	tbl_10[4] = arg3
	arg1:modifyTheme(tbl_10)
	return arg1
end
function module_3_upvr.bindToggleItem(arg1, arg2) -- Line 867
	if not arg2:IsA("GuiObject") and not arg2:IsA("LayerCollector") then
		error("Toggle item must be a GuiObject or LayerCollector!")
	end
	arg1.toggleItems[arg2] = true
	arg1:_updateSelectionInstances()
	return arg1
end
function module_3_upvr.unbindToggleItem(arg1, arg2) -- Line 876
	arg1.toggleItems[arg2] = nil
	arg1:_updateSelectionInstances()
	return arg1
end
function module_3_upvr._updateSelectionInstances(arg1) -- Line 882
	for i_14, _ in pairs(arg1.toggleItems) do
		for _, v_15 in pairs(i_14:GetDescendants()) do
			if v_15:IsA("TextButton") or v_15:IsA("ImageButton") then
				if v_15.Active then
					table.insert({}, v_15)
				end
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		arg1.toggleItems[i_14] = {}
	end
end
function module_3_upvr._setToggleItemsVisible(arg1, arg2, arg3, arg4) -- Line 896
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local _
	for i_16, _ in pairs(arg1.toggleItems) do
		if not arg4 or arg4 == arg1 or arg4.toggleItems[i_16] == nil then
			if i_16:IsA("LayerCollector") then
			end
			i_16.Enabled = arg2
		end
	end
end
function module_3_upvr.bindEvent(arg1, arg2, arg3) -- Line 908
	local var209 = arg1[arg2]
	local var210
	if var210 then
		var210 = false
		if typeof(var209) == "table" then
			var210 = var209.Connect
		end
	end
	assert(var210, "argument[1] must be a valid topbarplus icon event name!")
	if typeof(arg3) ~= "function" then
		var210 = false
	else
		var210 = true
	end
	assert(var210, "argument[2] must be a function!")
	var210 = var209:Connect(function(...) -- Line 912
		--[[ Upvalues[2]:
			[1]: arg3 (readonly)
			[2]: arg1 (readonly)
		]]
		arg3(arg1, ...)
	end)
	arg1.bindedEvents[arg2] = var210
	return arg1
end
function module_3_upvr.unbindEvent(arg1, arg2) -- Line 918
	local var212 = arg1.bindedEvents[arg2]
	if var212 then
		var212:Disconnect()
		arg1.bindedEvents[arg2] = nil
	end
	return arg1
end
function module_3_upvr.bindToggleKey(arg1, arg2) -- Line 927
	local var213
	if typeof(arg2) ~= "EnumItem" then
		var213 = false
	else
		var213 = true
	end
	assert(var213, "argument[1] must be a KeyCode EnumItem!")
	var213 = true
	arg1.bindedToggleKeys[arg2] = var213
	arg1.toggleKeyAdded:Fire(arg2)
	arg1:setCaption("_hotkey_")
	return arg1
end
function module_3_upvr.unbindToggleKey(arg1, arg2) -- Line 935
	local var214
	if typeof(arg2) ~= "EnumItem" then
		var214 = false
	else
		var214 = true
	end
	assert(var214, "argument[1] must be a KeyCode EnumItem!")
	var214 = nil
	arg1.bindedToggleKeys[arg2] = var214
	return arg1
end
function module_3_upvr.call(arg1, arg2, ...) -- Line 941
	local packed_upvr = table.pack(...)
	task.spawn(function() -- Line 943
		--[[ Upvalues[3]:
			[1]: arg2 (readonly)
			[2]: arg1 (readonly)
			[3]: packed_upvr (readonly)
		]]
		arg2(arg1, table.unpack(packed_upvr))
	end)
	return arg1
end
function module_3_upvr.addToJanitor(arg1, arg2, arg3, arg4) -- Line 949
	arg1.janitor:add(arg2, arg3, arg4)
	return arg1
end
function module_3_upvr.lock(arg1) -- Line 954
	arg1:getInstance("ClickRegion").Visible = false
	arg1.locked = true
	return arg1
end
function module_3_upvr.unlock(arg1) -- Line 962
	arg1:getInstance("ClickRegion").Visible = true
	arg1.locked = false
	return arg1
end
function module_3_upvr.debounce(arg1, arg2) -- Line 969
	arg1:lock()
	task.wait(arg2)
	arg1:unlock()
	return arg1
end
function module_3_upvr.autoDeselect(arg1, arg2) -- Line 976
	if arg2 == nil then
	end
	arg1.deselectWhenOtherIconSelected = true
	return arg1
end
function module_3_upvr.oneClick(arg1, arg2) -- Line 986
	local singleClickJanitor = arg1.singleClickJanitor
	singleClickJanitor:clean()
	if arg2 or arg2 == nil then
		singleClickJanitor:add(arg1.selected:Connect(function() -- Line 992
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:deselect("OneClick", arg1)
		end))
	end
	arg1.oneClickEnabled = true
	return arg1
end
function module_3_upvr.setCaption(arg1, arg2) -- Line 1000
	--[[ Upvalues[1]:
		[1]: Elements_upvr (readonly)
	]]
	if arg2 == "_hotkey_" and arg1.captionText then
		return arg1
	end
	arg1.captionJanitor:clean()
	if not arg2 or arg2 == "" then
		arg1.caption = nil
		arg1.captionText = nil
		return arg1
	end
	local any_add_result1 = arg1.captionJanitor:add(require(Elements_upvr.Caption)(arg1))
	any_add_result1:SetAttribute("CaptionText", arg2)
	arg1.caption = any_add_result1
	arg1.captionText = arg2
	return arg1
end
function module_3_upvr.setCaptionHint(arg1, arg2) -- Line 1018
	local var220
	if typeof(arg2) ~= "EnumItem" then
		var220 = false
	else
		var220 = true
	end
	assert(var220, "argument[1] must be a KeyCode EnumItem!")
	arg1.fakeToggleKey = arg2
	arg1.fakeToggleKeyChanged:Fire(arg2)
	arg1:setCaption("_hotkey_")
	return arg1
end
function module_3_upvr.leave(arg1) -- Line 1026
	arg1.joinJanitor:clean()
	return arg1
end
function module_3_upvr.joinMenu(arg1, arg2) -- Line 1032
	--[[ Upvalues[1]:
		[1]: Utility_upvr (readonly)
	]]
	Utility_upvr.joinFeature(arg1, arg2, arg2.menuIcons, arg2:getInstance("Menu"))
	arg2.menuChildAdded:Fire(arg1)
	return arg1
end
function module_3_upvr.setMenu(arg1, arg2) -- Line 1038
	arg1.menuSet:Fire(arg2)
	return arg1
end
function module_3_upvr.setFixedMenu(arg1, arg2) -- Line 1043
	arg1:freezeMenu(arg2)
	arg1:setMenu(arg2)
end
module_3_upvr.setFrozenMenu = module_3_upvr.setFixedMenu
function module_3_upvr.freezeMenu(arg1) -- Line 1049
	arg1:select("FrozenMenu", arg1)
	arg1:bindEvent("deselected", function(arg1_4) -- Line 1053
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1_4:select("FrozenMenu", arg1)
	end)
	arg1:modifyTheme({"IconSpot", "Visible", false})
end
function module_3_upvr.joinDropdown(arg1, arg2) -- Line 1059
	--[[ Upvalues[1]:
		[1]: Utility_upvr (readonly)
	]]
	arg2:getDropdown()
	Utility_upvr.joinFeature(arg1, arg2, arg2.dropdownIcons, arg2:getInstance("DropdownScroller"))
	arg2.dropdownChildAdded:Fire(arg1)
	return arg1
end
function module_3_upvr.getDropdown(arg1) -- Line 1066
	--[[ Upvalues[1]:
		[1]: Elements_upvr (readonly)
	]]
	if not arg1.dropdown then
		local var223 = require(Elements_upvr.Dropdown)(arg1)
		arg1.dropdown = var223
		arg1:clipOutside(var223)
	end
	return var223
end
function module_3_upvr.setDropdown(arg1, arg2) -- Line 1076
	arg1:getDropdown()
	arg1.dropdownSet:Fire(arg2)
	return arg1
end
function module_3_upvr.clipOutside(arg1, arg2) -- Line 1082
	--[[ Upvalues[1]:
		[1]: Utility_upvr (readonly)
	]]
	arg1:refreshAppearance(arg2)
	return arg1, Utility_upvr.clipOutside(arg1, arg2)
end
function module_3_upvr.setIndicator(arg1, arg2) -- Line 1093
	--[[ Upvalues[2]:
		[1]: Elements_upvr (readonly)
		[2]: module_3_upvr (readonly)
	]]
	if not arg1.indicator then
		arg1.indicator = arg1.janitor:add(require(Elements_upvr.Indicator)(arg1, module_3_upvr))
	end
	arg1.indicatorSet:Fire(arg2)
end
function module_3_upvr.convertLabelToNumberSpinner(arg1, arg2, arg3) -- Line 1105
	task.defer(function() -- Line 1106
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
			[3]: arg3 (readonly)
		]]
		local any_getInstance_result1_2_upvr = arg1:getInstance("IconLabel")
		any_getInstance_result1_2_upvr.Transparency = 1
		arg2.Parent = any_getInstance_result1_2_upvr.Parent
		arg2.Size = UDim2.fromScale(1, 1)
		arg2.AnchorPoint = Vector2.new(0.5, 0.5)
		arg2.Position = UDim2.new(0.5, 0, 0.5, 0)
		arg2.TextXAlignment = Enum.TextXAlignment.Center
		arg2.ClipsDescendants = false
		for _, v_17_upvr in ipairs({"FontFace", "BorderSizePixel", "BorderColor3", "Rotation", "TextStrokeTransparency", "TextStrokeColor3", "TextStrokeTransparency", "TextColor3"}) do
			arg2[v_17_upvr] = any_getInstance_result1_2_upvr[v_17_upvr]
			arg1:addToJanitor(any_getInstance_result1_2_upvr:GetPropertyChangedSignal(v_17_upvr):Connect(function() -- Line 1129
				--[[ Upvalues[3]:
					[1]: arg2 (copied, readonly)
					[2]: v_17_upvr (readonly)
					[3]: any_getInstance_result1_2_upvr (readonly)
				]]
				arg2[v_17_upvr] = any_getInstance_result1_2_upvr[v_17_upvr]
			end))
		end
		local function getSpinnerSizeAndDigitCount_upvr() -- Line 1136, Named "getSpinnerSizeAndDigitCount"
			--[[ Upvalues[1]:
				[1]: arg2 (copied, readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local var246
			for _, v_18 in arg2.Frame:GetChildren() do
				local string_lower_result1 = string.lower(v_18.Name)
				if string_lower_result1 == "digit" then
					var246 += v_18.AbsoluteSize.X
				elseif string_lower_result1 == "prefix" or string_lower_result1 == "suffix" or string_lower_result1 == "comma" then
					if v_18.Text ~= "" then
						var246 += v_18.AbsoluteSize.X
					end
				end
			end
			return var246, 0 + 1 + 1
		end
		local function _() -- Line 1154, Named "getLabelParentContainerXSize"
			--[[ Upvalues[2]:
				[1]: any_getInstance_result1_2_upvr (readonly)
				[2]: arg2 (copied, readonly)
			]]
			local Parent = any_getInstance_result1_2_upvr.Parent
			local var249 = Parent
			if var249 then
				var249 = Parent.Parent
			end
			if var249 == nil then
				return 0
			end
			if var249.IconImage.Visible == true then
				return arg2.Frame.AbsoluteSize.X + any_getInstance_result1_2_upvr.Parent.Parent.IconImage.AbsoluteSize.X
			end
			return var249.AbsoluteSize.X
		end
		local function _() -- Line 1166, Named "getNumberSpinnerXSize"
			--[[ Upvalues[1]:
				[1]: arg2 (copied, readonly)
			]]
			return arg2.Frame.AbsoluteSize.X
		end
		local function adjustSize_upvr() -- Line 1170, Named "adjustSize"
			--[[ Upvalues[4]:
				[1]: getSpinnerSizeAndDigitCount_upvr (readonly)
				[2]: arg1 (copied, readonly)
				[3]: arg2 (copied, readonly)
				[4]: any_getInstance_result1_2_upvr (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 38 start (CF ANALYSIS FAILED)
			local _, getSpinnerSizeAndDigitCount_upvr_result2 = getSpinnerSizeAndDigitCount_upvr()
			if getSpinnerSizeAndDigitCount_upvr_result2 < 18 then
				arg1:setLabel(arg2.Value)
			end
			-- KONSTANTERROR: [0] 1. Error Block 38 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [43] 30. Error Block 44 start (CF ANALYSIS FAILED)
			local var252 = arg2
			var252.TextSize += 1
			local getSpinnerSizeAndDigitCount_upvr_result1, _ = getSpinnerSizeAndDigitCount_upvr()
			-- KONSTANTERROR: [43] 30. Error Block 44 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [19] 14. Error Block 4 start (CF ANALYSIS FAILED)
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [60.198139]
			-- KONSTANTERROR: [19] 14. Error Block 4 end (CF ANALYSIS FAILED)
		end
		arg1:addToJanitor(arg2.Frame.ChildAdded:Connect(adjustSize_upvr))
		arg1:addToJanitor(arg2.Frame.ChildRemoved:Connect(adjustSize_upvr))
		arg1:addToJanitor(arg1.iconAdded:Connect(function() -- Line 1208
			--[[ Upvalues[1]:
				[1]: adjustSize_upvr (readonly)
			]]
			task.wait(1)
			adjustSize_upvr()
		end))
		arg1:updateParent()
		arg2.Name = "LabelSpinner"
		arg2.Prefix = '$'
		arg2.Commas = true
		arg2.Decimals = 0
		arg2.Duration = 0.25
		arg2.Value = 10
		task.wait(0.2)
		if typeof(arg3) == "function" then
			arg3()
		end
	end)
	return arg1
end
function module_3_upvr.destroy(arg1) -- Line 1235
	--[[ Upvalues[1]:
		[1]: module_3_upvr (readonly)
	]]
	if arg1.isDestroyed then
	else
		arg1:clearNotices()
		if arg1.parentIconUID then
			arg1:leave()
		end
		arg1.isDestroyed = true
		arg1.janitor:clean()
		module_3_upvr.iconRemoved:Fire(arg1)
	end
end
module_3_upvr.Destroy = module_3_upvr.destroy
return module_3_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Types
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:13
-- Luau version 6, Types version 3
-- Time taken: 0.000227 seconds

return {}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.VERSION
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:14
-- Luau version 6, Types version 3
-- Time taken: 0.002221 seconds

local module_upvr = {
	appVersion = "v3.4.0";
	latestVersion = nil;
}
function module_upvr.getLatestVersion() -- Line 14
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 15 start (CF ANALYSIS FAILED)
	local latestVersion = module_upvr.latestVersion
	if latestVersion then
		return latestVersion
	end
	-- KONSTANTERROR: [0] 1. Error Block 15 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 13. Error Block 18 start (CF ANALYSIS FAILED)
	task.wait(1)
	-- KONSTANTERROR: [15] 13. Error Block 18 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 6. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [19.2]
	-- KONSTANTERROR: [6] 6. Error Block 4 end (CF ANALYSIS FAILED)
end
function module_upvr.getAppVersion() -- Line 39
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.appVersion
end
function module_upvr.isUpToDate() -- Line 43
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local any_getLatestVersion_result1 = module_upvr.getLatestVersion()
	local var4 = false
	if any_getLatestVersion_result1 ~= nil then
		if any_getLatestVersion_result1 ~= module_upvr.getAppVersion() then
			var4 = false
		else
			var4 = true
		end
	end
	return var4
end
return module_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Reference
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:15
-- Luau version 6, Types version 3
-- Time taken: 0.001408 seconds

local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local module_upvr = {
	objectName = "TopbarPlusReference";
}
function module_upvr.addToReplicatedStorage() -- Line 10
	--[[ Upvalues[2]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	if ReplicatedStorage_upvr:FindFirstChild(module_upvr.objectName) then
		return false
	end
	local ObjectValue = Instance.new("ObjectValue")
	ObjectValue.Name = module_upvr.objectName
	ObjectValue.Value = script.Parent
	ObjectValue.Parent = ReplicatedStorage_upvr
	return ObjectValue
end
function module_upvr.getObject() -- Line 22
	--[[ Upvalues[2]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	local SOME = ReplicatedStorage_upvr:FindFirstChild(module_upvr.objectName)
	if SOME then
		return SOME
	end
	return false
end
return module_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Attribute
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:16
-- Luau version 6, Types version 3
-- Time taken: 0.001088 seconds

task.defer(function() -- Line 21
	local VERSION = require(script.Parent.VERSION)
	if not VERSION.isUpToDate() then
		warn(`A new version of TopbarPlus ({VERSION.getLatestVersion()}) is available: https://devforum.roblox.com/t/topbarplus/1017485`)
	end
end)
return {}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Utility
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:17
-- Luau version 6, Types version 3
-- Time taken: 0.041945 seconds

local module_upvr = {
	createStagger = function(arg1, arg2, arg3) -- Line 13, Named "createStagger"
		local var2_upvw
		if not var2_upvw or var2_upvw == 0 then
			var2_upvw = 0.01
		end
		local var3_upvw = false
		local var4_upvw = false
		local function staggeredCallback_upvr(...) -- Line 29, Named "staggeredCallback"
			--[[ Upvalues[6]:
				[1]: var3_upvw (read and write)
				[2]: var4_upvw (read and write)
				[3]: arg3 (readonly)
				[4]: var2_upvw (read and write)
				[5]: arg2 (readonly)
				[6]: staggeredCallback_upvr (readonly)
			]]
			if var3_upvw then
				var4_upvw = true
			else
				local packed_upvr = table.pack(...)
				var3_upvw = true
				var4_upvw = false
				task.spawn(function() -- Line 37
					--[[ Upvalues[4]:
						[1]: arg3 (copied, readonly)
						[2]: var2_upvw (copied, read and write)
						[3]: arg2 (copied, readonly)
						[4]: packed_upvr (readonly)
					]]
					if arg3 then
						task.wait(var2_upvw)
					end
					arg2(table.unpack(packed_upvr))
				end)
				task.delay(var2_upvw, function() -- Line 43
					--[[ Upvalues[4]:
						[1]: var3_upvw (copied, read and write)
						[2]: var4_upvw (copied, read and write)
						[3]: staggeredCallback_upvr (copied, readonly)
						[4]: packed_upvr (readonly)
					]]
					var3_upvw = false
					if var4_upvw then
						staggeredCallback_upvr(table.unpack(packed_upvr))
					end
				end)
			end
		end
		return staggeredCallback_upvr
	end;
	round = function(arg1) -- Line 55, Named "round"
		return math.floor(arg1 + 0.5)
	end;
	reverseTable = function(arg1) -- Line 60, Named "reverseTable"
		for i = 1, math.floor(#arg1 / 2) do
			local var9 = #arg1 - i + 1
			arg1[i] = arg1[var9]
			arg1[var9] = arg1[i]
		end
	end;
}
function module_upvr.copyTable(arg1) -- Line 67
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var14
	if type(arg1) ~= "table" then
		var14 = false
	else
		var14 = true
	end
	assert(var14, "First argument must be a table")
	var14 = #arg1
	var14 = pairs(arg1)
	for i_2, v in pairs(arg1) do
		if type(v) == "table" then
			table.create(var14)[i_2] = module_upvr.copyTable(v)
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			table.create(var14)[i_2] = v
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return table.create(var14)
end
local tbl_upvr = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '<', '>', '?', '@', '{', '}', '[', ']', '!', '(', ')', '=', '+', '~', '#'}
function module_upvr.generateUID(arg1) -- Line 82
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local var21 = ""
	local var22 = tbl_upvr
	local len = #var22
	for _ = 1, arg1 or 8 do
		var21 = var21..var22[math.random(1, len)]
	end
	return var21
end
local tbl_upvr_2 = {}
function module_upvr.setVisible(arg1, arg2, arg3) -- Line 95
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 17 start (CF ANALYSIS FAILED)
	local var25
	if not var25 then
		var25 = {}
		tbl_upvr_2[arg1] = var25
		arg1.Destroying:Once(function() -- Line 104
			--[[ Upvalues[2]:
				[1]: tbl_upvr_2 (copied, readonly)
				[2]: arg1 (readonly)
			]]
			tbl_upvr_2[arg1] = nil
		end)
	end
	if not arg2 then
		var25[arg3] = true
	else
		var25[arg3] = nil
	end
	-- KONSTANTERROR: [0] 1. Error Block 17 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [28] 25. Error Block 9 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [28] 25. Error Block 9 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [32] 28. Error Block 13 start (CF ANALYSIS FAILED)
	arg1.Visible = false
	-- KONSTANTERROR: [32] 28. Error Block 13 end (CF ANALYSIS FAILED)
end
function module_upvr.formatStateName(arg1) -- Line 123
	return string.upper(string.sub(arg1, 1, 1))..string.lower(string.sub(arg1, 2))
end
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
function module_upvr.localPlayerRespawned(arg1) -- Line 127
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	LocalPlayer_upvr.CharacterRemoving:Connect(arg1)
end
function module_upvr.getClippedContainer(arg1) -- Line 137
	if not arg1:FindFirstChild("ClippedContainer") then
		local Folder = Instance.new("Folder")
		Folder.Name = "ClippedContainer"
		Folder.Parent = arg1
	end
	return Folder
end
local Janitor_upvr = require(script.Parent.Packages.Janitor)
local GuiService_upvr = game:GetService("GuiService")
function module_upvr.clipOutside(arg1, arg2) -- Line 151
	--[[ Upvalues[3]:
		[1]: Janitor_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: GuiService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 25 start (CF ANALYSIS FAILED)
	local any_add_result1_upvr = arg1.janitor:add(Janitor_upvr.new())
	arg2.Destroying:Once(function() -- Line 153
		--[[ Upvalues[1]:
			[1]: any_add_result1_upvr (readonly)
		]]
		any_add_result1_upvr:Destroy()
	end)
	arg1.janitor:add(arg2)
	local Parent_upvr = arg2.Parent
	local any_add_result1_upvr_2 = any_add_result1_upvr:add(Instance.new("Frame"))
	any_add_result1_upvr_2:SetAttribute("IsAClippedClone", true)
	any_add_result1_upvr_2.Name = arg2.Name
	any_add_result1_upvr_2.AnchorPoint = arg2.AnchorPoint
	any_add_result1_upvr_2.Size = arg2.Size
	any_add_result1_upvr_2.Position = arg2.Position
	any_add_result1_upvr_2.BackgroundTransparency = 1
	any_add_result1_upvr_2.LayoutOrder = arg2.LayoutOrder
	any_add_result1_upvr_2.Parent = Parent_upvr
	local ObjectValue = Instance.new("ObjectValue")
	ObjectValue.Name = "OriginalInstance"
	ObjectValue.Value = arg2
	ObjectValue.Parent = any_add_result1_upvr_2
	local clone = ObjectValue:Clone()
	arg2:SetAttribute("HasAClippedClone", true)
	clone.Name = "ClippedClone"
	clone.Value = any_add_result1_upvr_2
	clone.Parent = arg2
	local var41_upvw
	local iconModule_upvr = require(arg1.iconModule)
	local container_upvr = iconModule_upvr.container
	local function updateScreenGui() -- Line 183
		--[[ Upvalues[5]:
			[1]: Parent_upvr (readonly)
			[2]: var41_upvw (read and write)
			[3]: container_upvr (readonly)
			[4]: arg2 (readonly)
			[5]: module_upvr (copied, readonly)
		]]
		local class_ScreenGui = Parent_upvr:FindFirstAncestorWhichIsA("ScreenGui")
		local var45
		if string.match(class_ScreenGui.Name, "Clipped") then
			var45 = class_ScreenGui
		else
			var45 = container_upvr[class_ScreenGui.Name.."Clipped"]
		end
		var41_upvw = var45
		var45 = arg2
		var45.AnchorPoint = Vector2.new(0, 0)
		var45 = arg2
		var45.Parent = module_upvr.getClippedContainer(var41_upvw)
	end
	any_add_result1_upvr:add(arg1.alignmentChanged:Connect(updateScreenGui))
	updateScreenGui()
	local var49
	for _, v_2 in pairs(arg2:GetChildren()) do
		if v_2:IsA("UIAspectRatioConstraint") then
			v_2:Clone().Parent = any_add_result1_upvr_2
		end
	end
	local widget_upvr = arg1.widget
	local var51_upvw = false
	local IgnoreVisibilityUpdater_upvr = arg2:GetAttribute("IgnoreVisibilityUpdater")
	any_add_result1_upvr:add(widget_upvr:GetPropertyChangedSignal("Visible"):Connect(function() -- Line 205, Named "updateVisibility"
		--[[ Upvalues[5]:
			[1]: IgnoreVisibilityUpdater_upvr (readonly)
			[2]: widget_upvr (readonly)
			[3]: var51_upvw (read and write)
			[4]: module_upvr (copied, readonly)
			[5]: arg2 (readonly)
		]]
		if IgnoreVisibilityUpdater_upvr then
		else
			local Visible_2 = widget_upvr.Visible
			if var51_upvw then
				Visible_2 = false
			end
			module_upvr.setVisible(arg2, Visible_2, "ClipHandler")
		end
	end))
	local var54_upvw
	local function checkIfOutsideParentXBounds_upvr() -- Line 218, Named "checkIfOutsideParentXBounds"
		--[[ Upvalues[10]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
			[3]: iconModule_upvr (readonly)
			[4]: var51_upvw (read and write)
			[5]: IgnoreVisibilityUpdater_upvr (readonly)
			[6]: widget_upvr (readonly)
			[7]: module_upvr (copied, readonly)
			[8]: var54_upvw (read and write)
			[9]: checkIfOutsideParentXBounds_upvr (readonly)
			[10]: any_add_result1_upvr (readonly)
		]]
		task.defer(function() -- Line 220
			--[[ Upvalues[10]:
				[1]: arg1 (copied, readonly)
				[2]: arg2 (copied, readonly)
				[3]: iconModule_upvr (copied, readonly)
				[4]: var51_upvw (copied, read and write)
				[5]: IgnoreVisibilityUpdater_upvr (copied, readonly)
				[6]: widget_upvr (copied, readonly)
				[7]: module_upvr (copied, readonly)
				[8]: var54_upvw (copied, read and write)
				[9]: checkIfOutsideParentXBounds_upvr (copied, readonly)
				[10]: any_add_result1_upvr (copied, readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local UID_5 = arg1.UID
			local var78
			if arg2:GetAttribute("ClipToJoinedParent") then
				for _ = 1, 10 do
					local any_getIconByUID_result1_4 = iconModule_upvr.getIconByUID(UID_5)
					if not any_getIconByUID_result1_4 then break end
					local joinedFrame_3 = any_getIconByUID_result1_4.joinedFrame
					if not joinedFrame_3 then break end
					local var81 = joinedFrame_3
					local function INLINED_2() -- Internal function, doesn't exist in bytecode
						var78 = var81.Name
						return var78 == "DropdownScroller"
					end
					if not var81 or INLINED_2() then break end
				end
			end
			if not var81 then
				var51_upvw = false
				if IgnoreVisibilityUpdater_upvr then
				else
					local Visible_3 = widget_upvr.Visible
					if var51_upvw then
						Visible_3 = false
					end
					module_upvr.setVisible(arg2, Visible_3, "ClipHandler")
				end
			end
			local AbsolutePosition_4 = var81.AbsolutePosition
			local AbsoluteSize_2 = var81.AbsoluteSize
			local var85 = arg2.AbsolutePosition + arg2.AbsoluteSize / 2
			if var85.X >= AbsolutePosition_4.X then
				var78 = false
			else
				var78 = true
			end
			if AbsolutePosition_4.X + AbsoluteSize_2.X >= var85.X then
				-- KONSTANTWARNING: GOTO [84] #65
			end
			if var85.Y >= AbsolutePosition_4.Y then
				-- KONSTANTWARNING: GOTO [92] #70
			end
			if AbsolutePosition_4.Y + AbsoluteSize_2.Y >= var85.Y then
			else
			end
			if not var78 then
				if not true then
					if not true then
						local var86 = true
					end
				end
			end
			if var86 ~= var51_upvw then
				var51_upvw = var86
				if IgnoreVisibilityUpdater_upvr then
				else
					local Visible_4 = widget_upvr.Visible
					if var51_upvw then
						Visible_4 = false
					end
					module_upvr.setVisible(arg2, Visible_4, "ClipHandler")
				end
			end
			if var81:IsA("ScrollingFrame") and var54_upvw ~= var81 then
				var54_upvw = var81
				any_add_result1_upvr:add(var81:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() -- Line 265
					--[[ Upvalues[1]:
						[1]: checkIfOutsideParentXBounds_upvr (copied, readonly)
					]]
					checkIfOutsideParentXBounds_upvr()
				end), "Disconnect", "TrackUtilityScroller-"..UID_5)
			end
		end)
	end
	local CurrentCamera_upvr = workspace.CurrentCamera
	local var90_upvr = arg2:GetAttribute("AdditionalOffsetX") or 0
	local function trackProperty(arg1_2) -- Line 275
		--[[ Upvalues[15]:
			[1]: any_add_result1_upvr_2 (readonly)
			[2]: CurrentCamera_upvr (readonly)
			[3]: arg2 (readonly)
			[4]: GuiService_upvr (copied, readonly)
			[5]: var41_upvw (read and write)
			[6]: iconModule_upvr (readonly)
			[7]: var90_upvr (readonly)
			[8]: arg1 (readonly)
			[9]: var51_upvw (read and write)
			[10]: IgnoreVisibilityUpdater_upvr (readonly)
			[11]: widget_upvr (readonly)
			[12]: module_upvr (copied, readonly)
			[13]: var54_upvw (read and write)
			[14]: checkIfOutsideParentXBounds_upvr (readonly)
			[15]: any_add_result1_upvr (readonly)
		]]
		local var91_upvr = "Absolute"..arg1_2
		local function updateProperty() -- Line 277
			--[[ Upvalues[17]:
				[1]: any_add_result1_upvr_2 (copied, readonly)
				[2]: var91_upvr (readonly)
				[3]: arg1_2 (readonly)
				[4]: CurrentCamera_upvr (copied, readonly)
				[5]: arg2 (copied, readonly)
				[6]: GuiService_upvr (copied, readonly)
				[7]: var41_upvw (copied, read and write)
				[8]: iconModule_upvr (copied, readonly)
				[9]: var90_upvr (copied, readonly)
				[10]: arg1 (copied, readonly)
				[11]: var51_upvw (copied, read and write)
				[12]: IgnoreVisibilityUpdater_upvr (copied, readonly)
				[13]: widget_upvr (copied, readonly)
				[14]: module_upvr (copied, readonly)
				[15]: var54_upvw (copied, read and write)
				[16]: checkIfOutsideParentXBounds_upvr (copied, readonly)
				[17]: any_add_result1_upvr (copied, readonly)
			]]
			local var92 = any_add_result1_upvr_2[var91_upvr]
			local udim2 = UDim2.fromOffset(var92.X, var92.Y)
			if arg1_2 == "Position" then
				local var94 = CurrentCamera_upvr.ViewportSize.X - arg2.AbsoluteSize.X - 4
				local Offset = udim2.X.Offset
				if Offset < 4 then
					Offset = 4
				elseif var94 < Offset then
					Offset = var94
				end
				udim2 = UDim2.fromOffset(Offset, udim2.Y.Offset)
				local AbsolutePosition_5 = var41_upvw.AbsolutePosition
				if iconModule_upvr.isOldTopbar then
					AbsolutePosition_5 = AbsolutePosition_5.X
				else
					AbsolutePosition_5 = workspace.CurrentCamera.ViewportSize.X - var41_upvw.AbsoluteSize.X - 0
				end
				udim2 += UDim2.fromOffset(-(AbsolutePosition_5 - var90_upvr), GuiService_upvr.TopbarInset.Height)
				task.defer(function() -- Line 220
					--[[ Upvalues[10]:
						[1]: arg1 (copied, readonly)
						[2]: arg2 (copied, readonly)
						[3]: iconModule_upvr (copied, readonly)
						[4]: var51_upvw (copied, read and write)
						[5]: IgnoreVisibilityUpdater_upvr (copied, readonly)
						[6]: widget_upvr (copied, readonly)
						[7]: module_upvr (copied, readonly)
						[8]: var54_upvw (copied, read and write)
						[9]: checkIfOutsideParentXBounds_upvr (copied, readonly)
						[10]: any_add_result1_upvr (copied, readonly)
					]]
					-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
					local UID_3 = arg1.UID
					local var103
					if arg2:GetAttribute("ClipToJoinedParent") then
						for _ = 1, 10 do
							local any_getIconByUID_result1_5 = iconModule_upvr.getIconByUID(UID_3)
							if not any_getIconByUID_result1_5 then break end
							local joinedFrame_4 = any_getIconByUID_result1_5.joinedFrame
							if not joinedFrame_4 then break end
							local var106 = joinedFrame_4
							local function INLINED_3() -- Internal function, doesn't exist in bytecode
								var103 = var106.Name
								return var103 == "DropdownScroller"
							end
							if not var106 or INLINED_3() then break end
						end
					end
					if not var106 then
						var51_upvw = false
						if IgnoreVisibilityUpdater_upvr then
						else
							local Visible_8 = widget_upvr.Visible
							if var51_upvw then
								Visible_8 = false
							end
							module_upvr.setVisible(arg2, Visible_8, "ClipHandler")
						end
					end
					local AbsolutePosition_3 = var106.AbsolutePosition
					local AbsoluteSize_5 = var106.AbsoluteSize
					local var110 = arg2.AbsolutePosition + arg2.AbsoluteSize / 2
					if var110.X >= AbsolutePosition_3.X then
						var103 = false
					else
						var103 = true
					end
					if AbsolutePosition_3.X + AbsoluteSize_5.X >= var110.X then
						-- KONSTANTWARNING: GOTO [84] #65
					end
					if var110.Y >= AbsolutePosition_3.Y then
						-- KONSTANTWARNING: GOTO [92] #70
					end
					if AbsolutePosition_3.Y + AbsoluteSize_5.Y >= var110.Y then
					else
					end
					if not var103 then
						if not true then
							if not true then
								local var111 = true
							end
						end
					end
					if var111 ~= var51_upvw then
						var51_upvw = var111
						if IgnoreVisibilityUpdater_upvr then
						else
							local Visible_7 = widget_upvr.Visible
							if var51_upvw then
								Visible_7 = false
							end
							module_upvr.setVisible(arg2, Visible_7, "ClipHandler")
						end
					end
					if var106:IsA("ScrollingFrame") and var54_upvw ~= var106 then
						var54_upvw = var106
						any_add_result1_upvr:add(var106:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() -- Line 265
							--[[ Upvalues[1]:
								[1]: checkIfOutsideParentXBounds_upvr (copied, readonly)
							]]
							checkIfOutsideParentXBounds_upvr()
						end), "Disconnect", "TrackUtilityScroller-"..UID_3)
					end
				end)
			end
			arg2[arg1_2] = udim2
		end
		local any_createStagger_result1_upvr = module_upvr.createStagger(0.01, updateProperty)
		any_add_result1_upvr:add(any_add_result1_upvr_2:GetPropertyChangedSignal(var91_upvr):Connect(any_createStagger_result1_upvr))
		any_add_result1_upvr:add(any_add_result1_upvr_2:GetAttributeChangedSignal("ForceUpdate"):Connect(function() -- Line 317
			--[[ Upvalues[1]:
				[1]: any_createStagger_result1_upvr (readonly)
			]]
			any_createStagger_result1_upvr()
		end))
		any_add_result1_upvr:add(any_add_result1_upvr_2:GetPropertyChangedSignal(var91_upvr):Connect(module_upvr.createStagger(0.5, updateProperty, true)))
		if arg1_2 == "Position" then
			any_add_result1_upvr:add(var41_upvw:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line 336
				--[[ Upvalues[1]:
					[1]: any_createStagger_result1_upvr (readonly)
				]]
				any_createStagger_result1_upvr()
			end))
		end
	end
	var49 = task.delay
	var49(0.1, checkIfOutsideParentXBounds_upvr)
	var49 = task.defer
	var49(function() -- Line 220
		--[[ Upvalues[10]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
			[3]: iconModule_upvr (readonly)
			[4]: var51_upvw (read and write)
			[5]: IgnoreVisibilityUpdater_upvr (readonly)
			[6]: widget_upvr (readonly)
			[7]: module_upvr (copied, readonly)
			[8]: var54_upvw (read and write)
			[9]: checkIfOutsideParentXBounds_upvr (readonly)
			[10]: any_add_result1_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local UID_4 = arg1.UID
		local var123
		if arg2:GetAttribute("ClipToJoinedParent") then
			for _ = 1, 10 do
				local any_getIconByUID_result1_3 = iconModule_upvr.getIconByUID(UID_4)
				if not any_getIconByUID_result1_3 then break end
				local joinedFrame_2 = any_getIconByUID_result1_3.joinedFrame
				if not joinedFrame_2 then break end
				local var126 = joinedFrame_2
				local function INLINED_4() -- Internal function, doesn't exist in bytecode
					var123 = var126.Name
					return var123 == "DropdownScroller"
				end
				if not var126 or INLINED_4() then break end
			end
		end
		if not var126 then
			var51_upvw = false
			if IgnoreVisibilityUpdater_upvr then
			else
				local Visible = widget_upvr.Visible
				if var51_upvw then
					Visible = false
				end
				module_upvr.setVisible(arg2, Visible, "ClipHandler")
			end
		end
		local AbsolutePosition_2 = var126.AbsolutePosition
		local AbsoluteSize_4 = var126.AbsoluteSize
		local var130 = arg2.AbsolutePosition + arg2.AbsoluteSize / 2
		if var130.X >= AbsolutePosition_2.X then
			var123 = false
		else
			var123 = true
		end
		if AbsolutePosition_2.X + AbsoluteSize_4.X >= var130.X then
			-- KONSTANTWARNING: GOTO [84] #65
		end
		if var130.Y >= AbsolutePosition_2.Y then
			-- KONSTANTWARNING: GOTO [92] #70
		end
		if AbsolutePosition_2.Y + AbsoluteSize_4.Y >= var130.Y then
		else
		end
		if not var123 then
			if not true then
				if not true then
					local var131 = true
				end
			end
		end
		if var131 ~= var51_upvw then
			var51_upvw = var131
			if IgnoreVisibilityUpdater_upvr then
			else
				local Visible_6 = widget_upvr.Visible
				if var51_upvw then
					Visible_6 = false
				end
				module_upvr.setVisible(arg2, Visible_6, "ClipHandler")
			end
		end
		if var126:IsA("ScrollingFrame") and var54_upvw ~= var126 then
			var54_upvw = var126
			any_add_result1_upvr:add(var126:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() -- Line 265
				--[[ Upvalues[1]:
					[1]: checkIfOutsideParentXBounds_upvr (copied, readonly)
				]]
				checkIfOutsideParentXBounds_upvr()
			end), "Disconnect", "TrackUtilityScroller-"..UID_4)
		end
	end)
	if IgnoreVisibilityUpdater_upvr then
		-- KONSTANTWARNING: GOTO [224] #169
	end
	-- KONSTANTERROR: [0] 1. Error Block 25 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [213] 160. Error Block 21 start (CF ANALYSIS FAILED)
	var49 = widget_upvr.Visible
	if var51_upvw then
		var49 = false
	end
	module_upvr.setVisible(arg2, var49, "ClipHandler")
	var49 = trackProperty
	var49("Position")
	var49 = any_add_result1_upvr:add
	var49(arg2:GetPropertyChangedSignal("Visible"):Connect(function() -- Line 348
	end))
	var49 = arg2:GetAttribute("TrackCloneSize")
	if var49 then
		trackProperty("Size")
	else
		any_add_result1_upvr:add(arg2:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line 358
			--[[ Upvalues[2]:
				[1]: arg2 (readonly)
				[2]: any_add_result1_upvr_2 (readonly)
			]]
			local AbsoluteSize_3 = arg2.AbsoluteSize
			any_add_result1_upvr_2.Size = UDim2.fromOffset(AbsoluteSize_3.X, AbsoluteSize_3.Y)
		end))
	end
	do
		return any_add_result1_upvr_2
	end
	-- KONSTANTERROR: [213] 160. Error Block 21 end (CF ANALYSIS FAILED)
end
function module_upvr.joinFeature(arg1, arg2, arg3, arg4) -- Line 367
	local joinJanitor = arg1.joinJanitor
	joinJanitor:clean()
	if not arg4 then
		arg1:leave()
	else
		arg1.parentIconUID = arg2.UID
		arg1.joinedFrame = arg4
		joinJanitor:add(arg2.alignmentChanged:Connect(function() -- Line 378, Named "updateAlignent"
			--[[ Upvalues[2]:
				[1]: arg2 (readonly)
				[2]: arg1 (readonly)
			]]
			local alignment = arg2.alignment
			if alignment == "Center" then
				alignment = "Left"
			end
			arg1:setAlignment(alignment, true)
		end))
		local alignment_2 = arg2.alignment
		if alignment_2 == "Center" then
			alignment_2 = "Left"
		end
		arg1:setAlignment(alignment_2, true)
		arg1:modifyTheme({"IconButton", "BackgroundTransparency", 1}, "JoinModification")
		arg1:modifyTheme({"ClickRegion", "Active", false}, "JoinModification")
		if arg2.childModifications then
			task.defer(function() -- Line 393
				--[[ Upvalues[2]:
					[1]: arg1 (readonly)
					[2]: arg2 (readonly)
				]]
				arg1:modifyTheme(arg2.childModifications, arg2.childModificationsUID)
			end)
		end
		local any_getInstance_result1_upvr = arg1:getInstance("ClickRegion")
		local function makeSelectable() -- Line 399
			--[[ Upvalues[2]:
				[1]: any_getInstance_result1_upvr (readonly)
				[2]: arg2 (readonly)
			]]
			any_getInstance_result1_upvr.Selectable = arg2.isSelected
		end
		joinJanitor:add(arg2.toggled:Connect(makeSelectable))
		task.defer(makeSelectable)
		joinJanitor:add(function() -- Line 404
			--[[ Upvalues[1]:
				[1]: any_getInstance_result1_upvr (readonly)
			]]
			any_getInstance_result1_upvr.Selectable = true
		end)
		local UID_2_upvr = arg1.UID
		table.insert(arg3, UID_2_upvr)
		arg2:autoDeselect(false)
		arg2.childIconsDict[UID_2_upvr] = true
		if not arg2.isEnabled then
			arg2:setEnabled(true)
		end
		arg1.joinedParent:Fire(arg2)
		joinJanitor:add(function() -- Line 422
			--[[ Upvalues[4]:
				[1]: arg1 (readonly)
				[2]: arg3 (readonly)
				[3]: UID_2_upvr (readonly)
				[4]: arg2 (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 23 start (CF ANALYSIS FAILED)
			if not arg1.joinedFrame then return end
			local pairs_result1_2, pairs_result2_3, pairs_result3_2 = pairs(arg3)
			-- KONSTANTERROR: [0] 1. Error Block 23 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [19] 16. Error Block 6 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [19] 16. Error Block 6 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [10] 9. Error Block 29 start (CF ANALYSIS FAILED)
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [19.5]
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [19.6]
			if nil == nil then
				local any_getIconByUID_result1_2 = require(arg1.iconModule).getIconByUID(arg1.parentIconUID)
				if not any_getIconByUID_result1_2 then return end
				arg1:setAlignment(arg1.originalAlignment)
				arg1.parentIconUID = false
				arg1.joinedFrame = false
				arg1:removeModification("JoinModification")
				local childIconsDict = any_getIconByUID_result1_2.childIconsDict
				childIconsDict[UID_2_upvr] = nil
				local _, _, _ = pairs(childIconsDict)
				-- KONSTANTWARNING: GOTO [66] #51
			end
			-- KONSTANTERROR: [10] 9. Error Block 29 end (CF ANALYSIS FAILED)
		end)
	end
end
return module_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Elements.Caption
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:18
-- Luau version 6, Types version 3
-- Time taken: 0.013534 seconds

local Color3_fromRGB_result1_upvr = Color3.fromRGB(39, 41, 48)
return function(arg1) -- Line 3
	--[[ Upvalues[1]:
		[1]: Color3_fromRGB_result1_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local any_getInstance_result1_upvr = arg1:getInstance("ClickRegion")
	local CanvasGroup_upvr = Instance.new("CanvasGroup")
	CanvasGroup_upvr.Name = "Caption"
	CanvasGroup_upvr.AnchorPoint = Vector2.new(0.5, 0)
	CanvasGroup_upvr.BackgroundTransparency = 1
	CanvasGroup_upvr.BorderSizePixel = 0
	CanvasGroup_upvr.GroupTransparency = 1
	CanvasGroup_upvr.Position = UDim2.fromOffset(0, 0)
	CanvasGroup_upvr.Visible = true
	CanvasGroup_upvr.ZIndex = 30
	CanvasGroup_upvr.Parent = any_getInstance_result1_upvr
	local Frame_upvr = Instance.new("Frame")
	Frame_upvr.Name = "Box"
	Frame_upvr.AutomaticSize = Enum.AutomaticSize.XY
	Frame_upvr.BackgroundColor3 = Color3_fromRGB_result1_upvr
	Frame_upvr.Position = UDim2.fromOffset(4, 7)
	Frame_upvr.ZIndex = 12
	Frame_upvr.Parent = CanvasGroup_upvr
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Name = "Header"
	TextLabel.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	TextLabel.Text = "Caption"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 15
	TextLabel.TextTruncate = Enum.TextTruncate.None
	TextLabel.TextWrapped = false
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.AutomaticSize = Enum.AutomaticSize.X
	TextLabel.BackgroundTransparency = 1
	TextLabel.LayoutOrder = 1
	TextLabel.Size = UDim2.fromOffset(0, 16)
	TextLabel.ZIndex = 18
	TextLabel.Parent = Frame_upvr
	local UIListLayout_2 = Instance.new("UIListLayout")
	UIListLayout_2.Name = "Layout"
	UIListLayout_2.Padding = UDim.new(0, 8)
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_2.Parent = Frame_upvr
	local UICorner = Instance.new("UICorner")
	UICorner.Name = "CaptionCorner"
	UICorner.Parent = Frame_upvr
	local UIPadding = Instance.new("UIPadding")
	UIPadding.Name = "Padding"
	UIPadding.PaddingBottom = UDim.new(0, 12)
	UIPadding.PaddingLeft = UDim.new(0, 12)
	UIPadding.PaddingRight = UDim.new(0, 12)
	UIPadding.PaddingTop = UDim.new(0, 12)
	UIPadding.Parent = Frame_upvr
	local Frame_upvr_2 = Instance.new("Frame")
	Frame_upvr_2.Name = "Hotkeys"
	Frame_upvr_2.AutomaticSize = Enum.AutomaticSize.Y
	Frame_upvr_2.BackgroundTransparency = 1
	Frame_upvr_2.LayoutOrder = 3
	Frame_upvr_2.Size = UDim2.fromScale(1, 0)
	Frame_upvr_2.Visible = false
	Frame_upvr_2.Parent = Frame_upvr
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Name = "Layout1"
	UIListLayout.Padding = UDim.new(0, 6)
	UIListLayout.FillDirection = Enum.FillDirection.Vertical
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.HorizontalFlex = Enum.UIFlexAlignment.None
	UIListLayout.ItemLineAlignment = Enum.ItemLineAlignment.Automatic
	UIListLayout.VerticalFlex = Enum.UIFlexAlignment.None
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Parent = Frame_upvr_2
	local ImageLabel = Instance.new("ImageLabel")
	ImageLabel.Name = "Key1"
	ImageLabel.Image = "rbxasset://textures/ui/Controls/key_single.png"
	ImageLabel.ImageTransparency = 0.7
	ImageLabel.ScaleType = Enum.ScaleType.Slice
	ImageLabel.SliceCenter = Rect.new(5, 5, 23, 24)
	ImageLabel.AutomaticSize = Enum.AutomaticSize.X
	ImageLabel.BackgroundTransparency = 1
	ImageLabel.LayoutOrder = 1
	ImageLabel.Size = UDim2.fromOffset(0, 30)
	ImageLabel.ZIndex = 15
	ImageLabel.Parent = Frame_upvr_2
	local UIPadding_2 = Instance.new("UIPadding")
	UIPadding_2.Name = "Inset"
	UIPadding_2.PaddingLeft = UDim.new(0, 8)
	UIPadding_2.PaddingRight = UDim.new(0, 8)
	UIPadding_2.Parent = ImageLabel
	local TextLabel_2_upvr = Instance.new("TextLabel")
	TextLabel_2_upvr.AutoLocalize = false
	TextLabel_2_upvr.Name = "LabelContent"
	TextLabel_2_upvr.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	TextLabel_2_upvr.Text = ""
	TextLabel_2_upvr.TextColor3 = Color3.fromRGB(189, 190, 190)
	TextLabel_2_upvr.TextSize = 15
	TextLabel_2_upvr.AutomaticSize = Enum.AutomaticSize.X
	TextLabel_2_upvr.BackgroundTransparency = 1
	TextLabel_2_upvr.Position = UDim2.fromOffset(0, -1)
	TextLabel_2_upvr.Size = UDim2.fromScale(1, 1)
	TextLabel_2_upvr.ZIndex = 16
	TextLabel_2_upvr.Parent = ImageLabel
	local ImageLabel_2_upvr = Instance.new("ImageLabel")
	ImageLabel_2_upvr.Name = "Caret"
	ImageLabel_2_upvr.Image = "rbxassetid://101906294438076"
	ImageLabel_2_upvr.ImageColor3 = Color3_fromRGB_result1_upvr
	ImageLabel_2_upvr.AnchorPoint = Vector2.new(0, 0.5)
	ImageLabel_2_upvr.BackgroundTransparency = 1
	ImageLabel_2_upvr.Position = UDim2.new(0, 0, 0, 4)
	ImageLabel_2_upvr.Size = UDim2.fromOffset(16, 8)
	ImageLabel_2_upvr.ZIndex = 12
	ImageLabel_2_upvr.Parent = CanvasGroup_upvr
	local ImageLabel_upvr = Instance.new("ImageLabel")
	ImageLabel_upvr.Visible = true
	ImageLabel_upvr.Name = "DropShadow"
	ImageLabel_upvr.Image = "rbxassetid://124920646932671"
	ImageLabel_upvr.ImageColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel_upvr.ImageTransparency = 0.45
	ImageLabel_upvr.ScaleType = Enum.ScaleType.Slice
	ImageLabel_upvr.SliceCenter = Rect.new(12, 12, 13, 13)
	ImageLabel_upvr.BackgroundTransparency = 1
	ImageLabel_upvr.Position = UDim2.fromOffset(0, 5)
	ImageLabel_upvr.Size = UDim2.new(1, 0, 0, 48)
	ImageLabel_upvr.Parent = CanvasGroup_upvr
	Frame_upvr:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line 145
		--[[ Upvalues[2]:
			[1]: ImageLabel_upvr (readonly)
			[2]: Frame_upvr (readonly)
		]]
		ImageLabel_upvr.Size = UDim2.new(1, 0, 0, Frame_upvr.AbsoluteSize.Y + 8)
	end)
	local captionJanitor = arg1.captionJanitor
	local _, any_clipOutside_result2_upvr = arg1:clipOutside(CanvasGroup_upvr)
	any_clipOutside_result2_upvr.AutomaticSize = Enum.AutomaticSize.None
	captionJanitor:add(CanvasGroup_upvr:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line 155, Named "matchSize"
		--[[ Upvalues[2]:
			[1]: CanvasGroup_upvr (readonly)
			[2]: any_clipOutside_result2_upvr (readonly)
		]]
		local AbsoluteSize_3 = CanvasGroup_upvr.AbsoluteSize
		any_clipOutside_result2_upvr.Size = UDim2.fromOffset(AbsoluteSize_3.X, AbsoluteSize_3.Y)
	end))
	local AbsoluteSize = CanvasGroup_upvr.AbsoluteSize
	any_clipOutside_result2_upvr.Size = UDim2.fromOffset(AbsoluteSize.X, AbsoluteSize.Y)
	local var23_upvw = false
	local UserInputService_upvr = game:GetService("UserInputService")
	local Header_upvr = CanvasGroup_upvr.Box.Header
	local function updateHotkey(arg1_2) -- Line 168
		--[[ Upvalues[6]:
			[1]: UserInputService_upvr (readonly)
			[2]: CanvasGroup_upvr (readonly)
			[3]: arg1 (readonly)
			[4]: Header_upvr (readonly)
			[5]: TextLabel_2_upvr (readonly)
			[6]: Frame_upvr_2 (readonly)
		]]
		local KeyboardEnabled = UserInputService_upvr.KeyboardEnabled
		local var27 = CanvasGroup_upvr:GetAttribute("CaptionText") or ""
		local var28
		if var27 ~= "_hotkey_" then
			var28 = false
		else
			var28 = true
		end
		if not KeyboardEnabled and var28 then
			arg1:setCaption()
		else
			Header_upvr.Text = var27
			Header_upvr.Visible = not var28
			if arg1_2 then
				TextLabel_2_upvr.Text = arg1_2.Name
				Frame_upvr_2.Visible = true
			end
			if not KeyboardEnabled then
				Frame_upvr_2.Visible = false
			end
		end
	end
	CanvasGroup_upvr:GetAttributeChangedSignal("CaptionText"):Connect(updateHotkey)
	local Quad = Enum.EasingStyle.Quad
	local function _(arg1_3) -- Line 194, Named "getCaptionPosition"
		--[[ Upvalues[1]:
			[1]: var23_upvw (read and write)
		]]
		if arg1_3 ~= nil then
		else
		end
		if var23_upvw then
		else
		end
		return UDim2.new(0.5, 0, 1, 2)
	end
	local TweenInfo_new_result1_upvr_2 = TweenInfo.new(0.2, Quad, Enum.EasingDirection.In)
	local TweenInfo_new_result1_upvr = TweenInfo.new(0.2, Quad, Enum.EasingDirection.Out)
	local TweenService_upvr = game:GetService("TweenService")
	local RunService_upvr = game:GetService("RunService")
	local function updatePosition_upvr(arg1_4) -- Line 201, Named "updatePosition"
		--[[ Upvalues[9]:
			[1]: var23_upvw (read and write)
			[2]: ImageLabel_2_upvr (readonly)
			[3]: CanvasGroup_upvr (readonly)
			[4]: any_getInstance_result1_upvr (readonly)
			[5]: any_clipOutside_result2_upvr (readonly)
			[6]: TweenInfo_new_result1_upvr_2 (readonly)
			[7]: TweenInfo_new_result1_upvr (readonly)
			[8]: TweenService_upvr (readonly)
			[9]: RunService_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		-- KONSTANTERROR: [0] 1. Error Block 43 start (CF ANALYSIS FAILED)
		local var34
		if not var34 then
		else
			if arg1_4 ~= nil then
				var34 = arg1_4
			else
				var34 = var23_upvw
			end
			if not var34 ~= nil then
				-- KONSTANTWARNING: GOTO [14] #13
			end
			-- KONSTANTERROR: [0] 1. Error Block 43 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [13] 12. Error Block 47 start (CF ANALYSIS FAILED)
			if var23_upvw then
			else
			end
			if var34 ~= nil then
				-- KONSTANTWARNING: GOTO [31] #28
			end
			if var23_upvw then
			else
			end
			if var34 then
				ImageLabel_2_upvr.Position = UDim2.fromOffset(0, ImageLabel_2_upvr.Position.Y.Offset)
				CanvasGroup_upvr.AutomaticSize = Enum.AutomaticSize.XY
				CanvasGroup_upvr.Size = UDim2.fromOffset(32, 53)
			else
				local AbsoluteSize_2 = CanvasGroup_upvr.AbsoluteSize
				CanvasGroup_upvr.AutomaticSize = Enum.AutomaticSize.Y
				CanvasGroup_upvr.Size = UDim2.fromOffset(AbsoluteSize_2.X, AbsoluteSize_2.Y)
			end
			local var37_upvw
			local function updateCaret() -- Line 230
				--[[ Upvalues[4]:
					[1]: any_getInstance_result1_upvr (copied, readonly)
					[2]: CanvasGroup_upvr (copied, readonly)
					[3]: ImageLabel_2_upvr (copied, readonly)
					[4]: var37_upvw (read and write)
				]]
				local var38 = any_getInstance_result1_upvr.AbsolutePosition.X - CanvasGroup_upvr.AbsolutePosition.X + any_getInstance_result1_upvr.AbsoluteSize.X / 2 - ImageLabel_2_upvr.AbsoluteSize.X / 2
				local Offset = ImageLabel_2_upvr.Position.Y.Offset
				if var37_upvw ~= var38 then
					var37_upvw = var38
					ImageLabel_2_upvr.Position = UDim2.fromOffset(0, Offset)
					task.wait()
				end
				ImageLabel_2_upvr.Position = UDim2.fromOffset(var38, Offset)
			end
			any_clipOutside_result2_upvr.Position = UDim2.new(0.5, 0, 1, 2)
			updateCaret()
			if not var34 or not TweenInfo_new_result1_upvr_2 then
			end
			local any_Create_result1 = TweenService_upvr:Create(any_clipOutside_result2_upvr, TweenInfo_new_result1_upvr, {
				Position = UDim2.new(0.5, 0, 1, 2);
			})
			any_Create_result1:Play()
			local any_Connect_result1_upvr = RunService_upvr.Heartbeat:Connect(updateCaret)
			any_Create_result1.Completed:Once(function() -- Line 253
				--[[ Upvalues[1]:
					[1]: any_Connect_result1_upvr (readonly)
				]]
				any_Connect_result1_upvr:Disconnect()
			end)
			-- KONSTANTERROR: [13] 12. Error Block 47 end (CF ANALYSIS FAILED)
		end
	end
	captionJanitor:add(any_getInstance_result1_upvr:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line 258
		--[[ Upvalues[1]:
			[1]: updatePosition_upvr (readonly)
		]]
		updatePosition_upvr()
	end))
	updatePosition_upvr(false)
	captionJanitor:add(arg1.toggleKeyAdded:Connect(updateHotkey))
	local pairs_result1, pairs_result2, pairs_result3 = pairs(arg1.bindedToggleKeys)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [676] 464. Error Block 13 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [676] 464. Error Block 13 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [641] 439. Error Block 37 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [676.36]
	if nil ~= "_hotkey_" then
	else
	end
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [676.35]
	-- KONSTANTERROR: [641] 439. Error Block 37 end (CF ANALYSIS FAILED)
end


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Elements.Container
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:19
-- Luau version 6, Types version 3
-- Time taken: 0.013429 seconds

local var2_upvw = false
local var3_upvw = 0
return function(arg1) -- Line 3
	--[[ Upvalues[2]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
	]]
	local GuiService_upvr = game:GetService("GuiService")
	local module = {}
	local any_new_result1_upvr = require(script.Parent.Parent.Packages.GoodSignal).new()
	local any_GetGuiInset_result1_upvw = GuiService_upvr:GetGuiInset()
	local var8_upvw = 0
	local var9_upvw = 0
	local var10_upvw = 0
	local var11_upvw = false
	local var12_upvw = false
	local UserInputService_upvr = game:GetService("UserInputService")
	local var14_upvw = 0
	local Players_upvr = game:GetService("Players")
	local function checkInset_upvr(arg1_2) -- Line 20, Named "checkInset"
		--[[ Upvalues[15]:
			[1]: GuiService_upvr (readonly)
			[2]: var11_upvw (read and write)
			[3]: var12_upvw (read and write)
			[4]: UserInputService_upvr (readonly)
			[5]: arg1 (readonly)
			[6]: var14_upvw (read and write)
			[7]: checkInset_upvr (readonly)
			[8]: Players_upvr (readonly)
			[9]: var2_upvw (copied, read and write)
			[10]: any_GetGuiInset_result1_upvw (read and write)
			[11]: var8_upvw (read and write)
			[12]: var9_upvw (read and write)
			[13]: var10_upvw (read and write)
			[14]: any_new_result1_upvr (readonly)
			[15]: var3_upvw (copied, read and write)
		]]
		local TopbarInset = GuiService_upvr.TopbarInset
		local Height = TopbarInset.Height
		if Height > 36 then
			TopbarInset = false
		else
			TopbarInset = true
		end
		var11_upvw = GuiService_upvr:IsTenFootInterface()
		var12_upvw = UserInputService_upvr.VREnabled
		arg1.isOldTopbar = TopbarInset
		var14_upvw += 1
		if Height == 0 and arg1_2 == nil then
			task.defer(function() -- Line 33
				--[[ Upvalues[1]:
					[1]: checkInset_upvr (copied, readonly)
				]]
				task.wait(8)
				checkInset_upvr("ForceConvertToOld")
			end)
		elseif var14_upvw == 1 then
			task.delay(5, function() -- Line 38
				--[[ Upvalues[3]:
					[1]: Players_upvr (copied, readonly)
					[2]: var14_upvw (copied, read and write)
					[3]: checkInset_upvr (copied, readonly)
				]]
				Players_upvr.LocalPlayer:WaitForChild("PlayerGui")
				if var14_upvw == 1 then
					checkInset_upvr()
				end
			end)
		end
		local function INLINED() -- Internal function, doesn't exist in bytecode
			local var20
			return var20
		end
		local function INLINED_2() -- Internal function, doesn't exist in bytecode
			var20 = var2_upvw
			return var20 == false
		end
		if arg1.isOldTopbar and not var11_upvw and not INLINED() and INLINED_2() and (Height ~= 0 or arg1_2 == "ForceConvertToOld") then
			var20 = true
			var2_upvw = var20
			var20 = task.defer
			var20(function() -- Line 50
				--[[ Upvalues[2]:
					[1]: arg1 (copied, readonly)
					[2]: GuiService_upvr (copied, readonly)
				]]
				arg1.modifyBaseTheme(require(script.Parent.Parent.Features.Themes.Classic))
				GuiService_upvr:GetPropertyChangedSignal("MenuIsOpen"):Connect(function() -- Line 57, Named "decideToHideTopbar"
					--[[ Upvalues[2]:
						[1]: GuiService_upvr (copied, readonly)
						[2]: arg1 (copied, readonly)
					]]
					if GuiService_upvr.MenuIsOpen then
						arg1.setTopbarEnabled(false, true)
					else
						arg1.setTopbarEnabled()
					end
				end)
				if GuiService_upvr.MenuIsOpen then
					arg1.setTopbarEnabled(false, true)
				else
					arg1.setTopbarEnabled()
				end
			end)
		end
		var20 = GuiService_upvr:GetGuiInset()
		any_GetGuiInset_result1_upvw = var20
		if TopbarInset then
			var20 = 12
		else
			var20 = any_GetGuiInset_result1_upvw.Y - 50
		end
		var8_upvw = var20
		if TopbarInset then
		else
		end
		var9_upvw = 0
		var10_upvw = -2
		if var11_upvw then
			var8_upvw = 10
			var9_upvw = 0
		end
		if GuiService_upvr.TopbarInset.Height == 0 and not var2_upvw then
			var9_upvw += 13
			var10_upvw = 50
		end
		any_new_result1_upvr:Fire(any_GetGuiInset_result1_upvw)
		if any_GetGuiInset_result1_upvw.Y ~= var3_upvw then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			var3_upvw = any_GetGuiInset_result1_upvw.Y
			local Y_upvr = any_GetGuiInset_result1_upvw.Y
			task.defer(function() -- Line 88
				--[[ Upvalues[2]:
					[1]: arg1 (copied, readonly)
					[2]: Y_upvr (readonly)
				]]
				arg1.insetHeightChanged:Fire(Y_upvr)
			end)
		end
	end
	GuiService_upvr:GetPropertyChangedSignal("TopbarInset"):Connect(checkInset_upvr)
	checkInset_upvr("FirstTime")
	local ScreenGui_upvr = Instance.new("ScreenGui")
	any_new_result1_upvr:Connect(function() -- Line 98
		--[[ Upvalues[2]:
			[1]: ScreenGui_upvr (readonly)
			[2]: var8_upvw (read and write)
		]]
		ScreenGui_upvr:SetAttribute("StartInset", var8_upvw)
	end)
	ScreenGui_upvr.Name = "TopbarStandard"
	ScreenGui_upvr.Enabled = true
	ScreenGui_upvr.DisplayOrder = arg1.baseDisplayOrder
	ScreenGui_upvr.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui_upvr.IgnoreGuiInset = true
	ScreenGui_upvr.ResetOnSpawn = false
	ScreenGui_upvr.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets
	module[ScreenGui_upvr.Name] = ScreenGui_upvr
	arg1.baseDisplayOrderChanged:Connect(function() -- Line 109
		--[[ Upvalues[2]:
			[1]: ScreenGui_upvr (readonly)
			[2]: arg1 (readonly)
		]]
		ScreenGui_upvr.DisplayOrder = arg1.baseDisplayOrder
	end)
	local Frame_upvr = Instance.new("Frame")
	Frame_upvr.Name = "Holders"
	Frame_upvr.BackgroundTransparency = 1
	any_new_result1_upvr:Connect(function() -- Line 116
		--[[ Upvalues[5]:
			[1]: var12_upvw (read and write)
			[2]: var11_upvw (read and write)
			[3]: var10_upvw (read and write)
			[4]: Frame_upvr (readonly)
			[5]: var9_upvw (read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var29
		if var12_upvw then
			var29 = 36
		else
			var29 = 56
		end
		if var11_upvw then
			local udim2 = UDim2.new(1, 0, 0, var29)
		else
		end
		Frame_upvr.Position = UDim2.new(0, 0, 0, var9_upvw)
		Frame_upvr.Size = UDim2.new(1, 0, 1, var10_upvw)
	end)
	Frame_upvr.Visible = true
	Frame_upvr.ZIndex = 1
	Frame_upvr.Parent = ScreenGui_upvr
	local clone_upvr_5 = ScreenGui_upvr:Clone()
	local Holders_upvr = clone_upvr_5.Holders
	clone_upvr_5.Name = "TopbarCentered"
	clone_upvr_5.DisplayOrder = arg1.baseDisplayOrder
	clone_upvr_5.ScreenInsets = Enum.ScreenInsets.None
	arg1.baseDisplayOrderChanged:Connect(function() -- Line 134
		--[[ Upvalues[2]:
			[1]: clone_upvr_5 (readonly)
			[2]: arg1 (readonly)
		]]
		clone_upvr_5.DisplayOrder = arg1.baseDisplayOrder
	end)
	module[clone_upvr_5.Name] = clone_upvr_5
	any_new_result1_upvr:Connect(function() -- Line 128, Named "updateCenteredHoldersHeight"
		--[[ Upvalues[3]:
			[1]: Holders_upvr (readonly)
			[2]: GuiService_upvr (readonly)
			[3]: var10_upvw (read and write)
		]]
		Holders_upvr.Size = UDim2.new(1, 0, 0, GuiService_upvr.TopbarInset.Height + var10_upvw)
	end)
	Holders_upvr.Size = UDim2.new(1, 0, 0, GuiService_upvr.TopbarInset.Height + var10_upvw)
	local clone_upvr_2 = ScreenGui_upvr:Clone()
	clone_upvr_2.Name ..= "Clipped"
	clone_upvr_2.DisplayOrder = arg1.baseDisplayOrder + 1
	arg1.baseDisplayOrderChanged:Connect(function() -- Line 145
		--[[ Upvalues[2]:
			[1]: clone_upvr_2 (readonly)
			[2]: arg1 (readonly)
		]]
		clone_upvr_2.DisplayOrder = arg1.baseDisplayOrder + 1
	end)
	module[clone_upvr_2.Name] = clone_upvr_2
	local clone_upvr_4 = clone_upvr_5:Clone()
	clone_upvr_4.Name ..= "Clipped"
	clone_upvr_4.DisplayOrder = arg1.baseDisplayOrder + 1
	arg1.baseDisplayOrderChanged:Connect(function() -- Line 153
		--[[ Upvalues[2]:
			[1]: clone_upvr_4 (readonly)
			[2]: arg1 (readonly)
		]]
		clone_upvr_4.DisplayOrder = arg1.baseDisplayOrder + 1
	end)
	module[clone_upvr_4.Name] = clone_upvr_4
	local ScrollingFrame_upvr = Instance.new("ScrollingFrame")
	ScrollingFrame_upvr:SetAttribute("IsAHolder", true)
	ScrollingFrame_upvr.Name = "Left"
	any_new_result1_upvr:Connect(function() -- Line 162
		--[[ Upvalues[2]:
			[1]: ScrollingFrame_upvr (readonly)
			[2]: var8_upvw (read and write)
		]]
		ScrollingFrame_upvr.Position = UDim2.fromOffset(var8_upvw, 0)
	end)
	ScrollingFrame_upvr.Size = UDim2.new(1, -24, 1, 0)
	ScrollingFrame_upvr.BackgroundTransparency = 1
	ScrollingFrame_upvr.Visible = true
	ScrollingFrame_upvr.ZIndex = 1
	ScrollingFrame_upvr.Active = false
	ScrollingFrame_upvr.ClipsDescendants = true
	ScrollingFrame_upvr.HorizontalScrollBarInset = Enum.ScrollBarInset.None
	ScrollingFrame_upvr.CanvasSize = UDim2.new(0, 0, 1, -1)
	ScrollingFrame_upvr.AutomaticCanvasSize = Enum.AutomaticSize.X
	ScrollingFrame_upvr.ScrollingDirection = Enum.ScrollingDirection.X
	ScrollingFrame_upvr.ScrollBarThickness = 0
	ScrollingFrame_upvr.BorderSizePixel = 0
	ScrollingFrame_upvr.Selectable = false
	ScrollingFrame_upvr.ScrollingEnabled = false
	ScrollingFrame_upvr.ElasticBehavior = Enum.ElasticBehavior.Never
	ScrollingFrame_upvr.Parent = Frame_upvr
	local UIListLayout_upvr = Instance.new("UIListLayout")
	any_new_result1_upvr:Connect(function() -- Line 183
		--[[ Upvalues[2]:
			[1]: UIListLayout_upvr (readonly)
			[2]: var8_upvw (read and write)
		]]
		UIListLayout_upvr.Padding = UDim.new(0, var8_upvw)
	end)
	UIListLayout_upvr.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout_upvr.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_upvr.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout_upvr.HorizontalAlignment = Enum.HorizontalAlignment.Left
	UIListLayout_upvr.Parent = ScrollingFrame_upvr
	local clone_upvr = ScrollingFrame_upvr:Clone()
	any_new_result1_upvr:Connect(function() -- Line 193
		--[[ Upvalues[2]:
			[1]: clone_upvr (readonly)
			[2]: var8_upvw (read and write)
		]]
		clone_upvr.UIListLayout.Padding = UDim.new(0, var8_upvw)
	end)
	clone_upvr.ScrollingEnabled = false
	clone_upvr.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	clone_upvr.Name = "Center"
	clone_upvr.Parent = Holders_upvr
	local clone_upvr_3 = ScrollingFrame_upvr:Clone()
	any_new_result1_upvr:Connect(function() -- Line 202
		--[[ Upvalues[2]:
			[1]: clone_upvr_3 (readonly)
			[2]: var8_upvw (read and write)
		]]
		clone_upvr_3.UIListLayout.Padding = UDim.new(0, var8_upvw)
	end)
	clone_upvr_3.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	clone_upvr_3.Name = "Right"
	clone_upvr_3.AnchorPoint = Vector2.new(1, 0)
	clone_upvr_3.Position = UDim2.new(1, -12, 0, 0)
	clone_upvr_3.Parent = Frame_upvr
	any_new_result1_upvr:Fire(any_GetGuiInset_result1_upvw)
	return module
end


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Elements.Indicator
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:20
-- Luau version 6, Types version 3
-- Time taken: 0.004335 seconds

return function(arg1, arg2) -- Line 1
	local widget_upvr = arg1.widget
	local Frame_upvr_2 = Instance.new("Frame")
	Frame_upvr_2.Name = "Indicator"
	Frame_upvr_2.LayoutOrder = 9999999
	Frame_upvr_2.ZIndex = 6
	Frame_upvr_2.Size = UDim2.new(0, 42, 0, 42)
	Frame_upvr_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr_2.BackgroundTransparency = 1
	Frame_upvr_2.Position = UDim2.new(1, 0, 0.5, 0)
	Frame_upvr_2.BorderSizePixel = 0
	Frame_upvr_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr_2.Parent = arg1:getInstance("Contents")
	local Frame_upvr = Instance.new("Frame")
	Frame_upvr.Name = "IndicatorButton"
	Frame_upvr.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame_upvr.BorderSizePixel = 0
	Frame_upvr.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr.Parent = Frame_upvr_2
	local GuiService_upvr = game:GetService("GuiService")
	local GamepadService_upvr = game:GetService("GamepadService")
	local any_getInstance_result1_upvr = arg1:getInstance("ClickRegion")
	local function selectionChanged() -- Line 28
		--[[ Upvalues[3]:
			[1]: GuiService_upvr (readonly)
			[2]: any_getInstance_result1_upvr (readonly)
			[3]: Frame_upvr (readonly)
		]]
		if GuiService_upvr.SelectedObject == any_getInstance_result1_upvr then
			Frame_upvr.BackgroundTransparency = 1
			Frame_upvr.Position = UDim2.new(0.5, -2, 0.5, 0)
			Frame_upvr.Size = UDim2.fromScale(1.2, 1.2)
		else
			Frame_upvr.BackgroundTransparency = 0.75
			Frame_upvr.Position = UDim2.new(0.5, 2, 0.5, 0)
			Frame_upvr.Size = UDim2.fromScale(1, 1)
		end
	end
	arg1.janitor:add(GuiService_upvr:GetPropertyChangedSignal("SelectedObject"):Connect(selectionChanged))
	selectionChanged()
	local ImageLabel_upvr = Instance.new("ImageLabel")
	ImageLabel_upvr.LayoutOrder = 2
	ImageLabel_upvr.ZIndex = 15
	ImageLabel_upvr.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel_upvr.Size = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel_upvr.BackgroundTransparency = 1
	ImageLabel_upvr.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel_upvr.Image = "rbxasset://textures/ui/Controls/XboxController/DPadUp@2x.png"
	ImageLabel_upvr.Parent = Frame_upvr
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = Frame_upvr
	local function setIndicatorVisible_upvr(arg1_2) -- Line 58, Named "setIndicatorVisible"
		--[[ Upvalues[3]:
			[1]: Frame_upvr_2 (readonly)
			[2]: GamepadService_upvr (readonly)
			[3]: arg1 (readonly)
		]]
		if arg1_2 == nil then
		end
		if GamepadService_upvr.GamepadCursorEnabled then
			local var10 = false
		end
		if var10 then
			arg1:modifyTheme({"PaddingRight", "Size", UDim2.new(0, 0, 1, 0)}, "IndicatorPadding")
		elseif Frame_upvr_2.Visible then
			arg1:removeModification("IndicatorPadding")
		end
		arg1:modifyTheme({"Indicator", "Visible", var10})
		arg1.updateSize:Fire()
	end
	arg1.janitor:add(GamepadService_upvr:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(setIndicatorVisible_upvr))
	local UserInputService_upvr = game:GetService("UserInputService")
	arg1.indicatorSet:Connect(function(arg1_3) -- Line 74
		--[[ Upvalues[3]:
			[1]: ImageLabel_upvr (readonly)
			[2]: UserInputService_upvr (readonly)
			[3]: setIndicatorVisible_upvr (readonly)
		]]
		local var15 = false
		if arg1_3 then
			ImageLabel_upvr.Image = UserInputService_upvr:GetImageForKeyCode(arg1_3)
			var15 = true
		end
		setIndicatorVisible_upvr(var15)
	end)
	widget_upvr:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line 83, Named "updateSize"
		--[[ Upvalues[2]:
			[1]: widget_upvr (readonly)
			[2]: Frame_upvr_2 (readonly)
		]]
		local var16 = widget_upvr.AbsoluteSize.Y * 0.96
		Frame_upvr_2.Size = UDim2.new(0, var16, 0, var16)
	end)
	local var17 = widget_upvr.AbsoluteSize.Y * 0.96
	Frame_upvr_2.Size = UDim2.new(0, var17, 0, var17)
	return Frame_upvr_2
end


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Elements.Menu
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:21
-- Luau version 6, Types version 3
-- Time taken: 0.024123 seconds

return function(arg1) -- Line 1
	local ScrollingFrame_upvr = Instance.new("ScrollingFrame")
	ScrollingFrame_upvr.Name = "Menu"
	ScrollingFrame_upvr.BackgroundTransparency = 1
	ScrollingFrame_upvr.Visible = true
	ScrollingFrame_upvr.ZIndex = 1
	ScrollingFrame_upvr.Size = UDim2.fromScale(1, 1)
	ScrollingFrame_upvr.ClipsDescendants = true
	ScrollingFrame_upvr.TopImage = ""
	ScrollingFrame_upvr.BottomImage = ""
	ScrollingFrame_upvr.HorizontalScrollBarInset = Enum.ScrollBarInset.Always
	ScrollingFrame_upvr.CanvasSize = UDim2.new(0, 0, 1, -1)
	ScrollingFrame_upvr.ScrollingEnabled = true
	ScrollingFrame_upvr.ScrollingDirection = Enum.ScrollingDirection.X
	ScrollingFrame_upvr.ZIndex = 20
	ScrollingFrame_upvr.ScrollBarThickness = 3
	ScrollingFrame_upvr.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame_upvr.ScrollBarImageTransparency = 0.8
	ScrollingFrame_upvr.BorderSizePixel = 0
	ScrollingFrame_upvr.Selectable = false
	local iconModule_upvr = require(arg1.iconModule)
	local clone_upvr = iconModule_upvr.container.TopbarStandard:FindFirstChild("UIListLayout", true):Clone()
	clone_upvr.Name = "MenuUIListLayout"
	clone_upvr.VerticalAlignment = Enum.VerticalAlignment.Center
	clone_upvr.Parent = ScrollingFrame_upvr
	local Frame = Instance.new("Frame")
	Frame.Name = "MenuGap"
	Frame.BackgroundTransparency = 1
	Frame.Visible = false
	Frame.AnchorPoint = Vector2.new(0, 0.5)
	Frame.ZIndex = 5
	Frame.Parent = ScrollingFrame_upvr
	local var6_upvw = false
	local Themes_upvr = require(script.Parent.Parent.Features.Themes)
	arg1.menuChildAdded:Connect(function() -- Line 39, Named "totalChildrenChanged"
		--[[ Upvalues[5]:
			[1]: arg1 (readonly)
			[2]: var6_upvw (read and write)
			[3]: ScrollingFrame_upvr (readonly)
			[4]: Themes_upvr (readonly)
			[5]: clone_upvr (readonly)
		]]
		local menuJanitor_upvr = arg1.menuJanitor
		if var6_upvw then
			if #arg1.menuIcons <= 0 then
				menuJanitor_upvr:clean()
				var6_upvw = false
			end
		else
			var6_upvw = true
			menuJanitor_upvr:add(arg1.toggled:Connect(function() -- Line 53
				--[[ Upvalues[1]:
					[1]: arg1 (copied, readonly)
				]]
				if 0 < #arg1.menuIcons then
					arg1.updateSize:Fire()
				end
			end))
			local _, any_modifyTheme_result2_upvr = arg1:modifyTheme({{"Menu", "Active", true}})
			task.defer(function() -- Line 63
				--[[ Upvalues[3]:
					[1]: menuJanitor_upvr (readonly)
					[2]: arg1 (copied, readonly)
					[3]: any_modifyTheme_result2_upvr (readonly)
				]]
				menuJanitor_upvr:add(function() -- Line 64
					--[[ Upvalues[2]:
						[1]: arg1 (copied, readonly)
						[2]: any_modifyTheme_result2_upvr (copied, readonly)
					]]
					arg1:removeModification(any_modifyTheme_result2_upvr)
				end)
			end)
			local X_upvw = ScrollingFrame_upvr.AbsoluteCanvasSize.X
			local function rightAlignCanvas() -- Line 73
				--[[ Upvalues[3]:
					[1]: arg1 (copied, readonly)
					[2]: ScrollingFrame_upvr (copied, readonly)
					[3]: X_upvw (read and write)
				]]
				if arg1.alignment == "Right" then
					local X = ScrollingFrame_upvr.AbsoluteCanvasSize.X
					X_upvw = X
					ScrollingFrame_upvr.CanvasPosition = Vector2.new((ScrollingFrame_upvr.CanvasPosition.X) - (X_upvw - X), 0)
				end
			end
			menuJanitor_upvr:add(arg1.selected:Connect(rightAlignCanvas))
			menuJanitor_upvr:add(ScrollingFrame_upvr:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(rightAlignCanvas))
			local any_getStateGroup_result1 = arg1:getStateGroup()
			if Themes_upvr.getThemeValue(any_getStateGroup_result1, "IconImage", "Image", "Deselected") == Themes_upvr.getThemeValue(any_getStateGroup_result1, "IconImage", "Image", "Selected") then
				arg1:removeModificationWith("IconLabel", "Text", "Viewing")
				arg1:removeModificationWith("IconLabel", "Image", "Viewing")
				arg1:modifyTheme({{"IconLabel", "FontFace", Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Light, Enum.FontStyle.Normal), "Selected"}, {"IconLabel", "Text", 'X', "Selected"}, {"IconLabel", "TextSize", 20, "Selected"}, {"IconLabel", "TextStrokeTransparency", 0.8, "Selected"}, {"IconImage", "Image", "", "Selected"}})
			end
			local any_getInstance_result1_upvr = arg1:getInstance("MenuGap")
			menuJanitor_upvr:add(arg1.alignmentChanged:Connect(function() -- Line 104, Named "updateAlignent"
				--[[ Upvalues[2]:
					[1]: arg1 (copied, readonly)
					[2]: any_getInstance_result1_upvr (readonly)
				]]
				local var26 = -99999
				local var27 = -99998
				if arg1.alignment == "Right" then
					var26 = 99999
					var27 = 99998
				end
				arg1:modifyTheme({"IconSpot", "LayoutOrder", var26})
				any_getInstance_result1_upvr.LayoutOrder = var27
			end))
			local var29 = -99999
			local var30 = -99998
			if arg1.alignment == "Right" then
				var29 = 99999
				var30 = 99998
			end
			arg1:modifyTheme({"IconSpot", "LayoutOrder", var29})
			any_getInstance_result1_upvr.LayoutOrder = var30
			ScrollingFrame_upvr:GetAttributeChangedSignal("MenuCanvasWidth"):Connect(function() -- Line 120
				--[[ Upvalues[1]:
					[1]: ScrollingFrame_upvr (copied, readonly)
				]]
				local Y = ScrollingFrame_upvr.CanvasSize.Y
				ScrollingFrame_upvr.CanvasSize = UDim2.new(0, ScrollingFrame_upvr:GetAttribute("MenuCanvasWidth"), Y.Scale, Y.Offset)
			end)
			menuJanitor_upvr:add(arg1.updateMenu:Connect(function() -- Line 125
				--[[ Upvalues[2]:
					[1]: ScrollingFrame_upvr (copied, readonly)
					[2]: clone_upvr (copied, readonly)
				]]
				local MaxIcons = ScrollingFrame_upvr:GetAttribute("MaxIcons")
				local var42
				if not MaxIcons then
				else
					local tbl = {}
					var42 = pairs(ScrollingFrame_upvr:GetChildren())
					local pairs_result1_3, pairs_result2_2, pairs_result3_2 = pairs(ScrollingFrame_upvr:GetChildren())
					for _, v_3 in pairs_result1_3, pairs_result2_2, pairs_result3_2 do
						if v_3:GetAttribute("WidgetUID") and v_3.Visible then
							table.insert(tbl, {v_3, v_3.AbsolutePosition.X})
						end
					end
					pairs_result1_3 = table.sort
					pairs_result1_3(tbl, function(arg1_2, arg2) -- Line 137
						local var49
						if arg1_2[2] >= arg2[2] then
							var49 = false
						else
							var49 = true
						end
						return var49
					end)
					pairs_result1_3 = 0
					for i_4 = 1, MaxIcons do
						if not tbl[i_4] then break end
						-- KONSTANTERROR: Expression was reused, decompilation is incorrect
						pairs_result1_3 += tbl[i_4][1].AbsoluteSize.X + clone_upvr.Padding.Offset
					end
					ScrollingFrame_upvr:SetAttribute("MenuWidth", pairs_result1_3)
				end
			end))
			local function startMenuUpdate() -- Line 152
				--[[ Upvalues[1]:
					[1]: arg1 (copied, readonly)
				]]
				task.delay(0.1, function() -- Line 153
					--[[ Upvalues[1]:
						[1]: arg1 (copied, readonly)
					]]
					arg1.startMenuUpdate:Fire()
				end)
			end
			menuJanitor_upvr:add(ScrollingFrame_upvr.ChildAdded:Connect(startMenuUpdate))
			menuJanitor_upvr:add(ScrollingFrame_upvr.ChildRemoved:Connect(startMenuUpdate))
			menuJanitor_upvr:add(ScrollingFrame_upvr:GetAttributeChangedSignal("MaxIcons"):Connect(startMenuUpdate))
			menuJanitor_upvr:add(ScrollingFrame_upvr:GetAttributeChangedSignal("MaxWidth"):Connect(startMenuUpdate))
			task.delay(0.1, function() -- Line 153
				--[[ Upvalues[1]:
					[1]: arg1 (copied, readonly)
				]]
				arg1.startMenuUpdate:Fire()
			end)
		end
	end)
	arg1.menuSet:Connect(function(arg1_3) -- Line 165
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: iconModule_upvr (readonly)
		]]
		for _, v in pairs(arg1.menuIcons) do
			iconModule_upvr.getIconByUID(v):destroy()
		end
		if type(arg1_3) == "table" then
			for _, v_2 in pairs(arg1_3) do
				v_2:joinMenu(arg1)
			end
		end
	end)
	return ScrollingFrame_upvr
end


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Elements.Notice
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:22
-- Luau version 6, Types version 3
-- Time taken: 0.005465 seconds

return function(arg1, arg2) -- Line 1
	local Frame_upvr = Instance.new("Frame")
	Frame_upvr.Name = "Notice"
	Frame_upvr.ZIndex = 25
	Frame_upvr.AutomaticSize = Enum.AutomaticSize.X
	Frame_upvr.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr.BorderSizePixel = 0
	Frame_upvr.BackgroundTransparency = 0.1
	Frame_upvr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_upvr.Visible = false
	Frame_upvr.Parent = arg1.widget
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = Frame_upvr
	Instance.new("UIStroke").Parent = Frame_upvr
	local TextLabel_upvr = Instance.new("TextLabel")
	TextLabel_upvr.Name = "NoticeLabel"
	TextLabel_upvr.ZIndex = 26
	TextLabel_upvr.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel_upvr.AutomaticSize = Enum.AutomaticSize.X
	TextLabel_upvr.Size = UDim2.new(1, 0, 1, 0)
	TextLabel_upvr.BackgroundTransparency = 1
	TextLabel_upvr.Position = UDim2.new(0.5, 0, 0.515, 0)
	TextLabel_upvr.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_upvr.FontSize = Enum.FontSize.Size14
	TextLabel_upvr.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_upvr.Text = '1'
	TextLabel_upvr.TextWrapped = true
	TextLabel_upvr.TextWrap = true
	TextLabel_upvr.Font = Enum.Font.Arial
	TextLabel_upvr.Parent = Frame_upvr
	local Parent = script.Parent.Parent
	local Packages = Parent.Packages
	local Utility_upvr = require(Parent.Utility)
	arg1.noticeChanged:Connect(function(arg1_2) -- Line 43
		--[[ Upvalues[5]:
			[1]: TextLabel_upvr (readonly)
			[2]: arg2 (readonly)
			[3]: arg1 (readonly)
			[4]: Utility_upvr (readonly)
			[5]: Frame_upvr (readonly)
		]]
		if not arg1_2 then
		else
			if 99 >= arg1_2 then
				local _ = false
				-- KONSTANTWARNING: Skipped task `defvar` above
			else
			end
			if true then
			else
			end
			TextLabel_upvr.Text = arg1_2
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if true then
				TextLabel_upvr.TextSize = 11
			end
			if arg1_2 < 1 then
			end
			local any_getIconByUID_result1 = arg2.getIconByUID(arg1.parentIconUID)
			local var11 = true
			if 0 >= #arg1.dropdownIcons then
				if 0 >= #arg1.menuIcons then
					var11 = false
				else
					var11 = true
				end
			end
			local var12
			if arg1.isSelected and var11 then
				var12 = false
			elseif any_getIconByUID_result1 and not any_getIconByUID_result1.isSelected then
				var12 = false
			end
			Utility_upvr.setVisible(Frame_upvr, var12, "NoticeHandler")
		end
	end)
	local Janitor_upvr = require(Packages.Janitor)
	local GoodSignal_upvr = require(Packages.GoodSignal)
	arg1.noticeStarted:Connect(function(arg1_3, arg2_2) -- Line 71
		--[[ Upvalues[5]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
			[3]: Janitor_upvr (readonly)
			[4]: GoodSignal_upvr (readonly)
			[5]: Utility_upvr (readonly)
		]]
		if not arg1_3 then
			local deselected = arg1.deselected
		end
		local any_getIconByUID_result1_2 = arg2.getIconByUID(arg1.parentIconUID)
		if any_getIconByUID_result1_2 then
			any_getIconByUID_result1_2:notify(deselected)
		end
		local any_add_result1_upvr = arg1.janitor:add(Janitor_upvr.new())
		local any_add_result1_upvr_2 = any_add_result1_upvr:add(GoodSignal_upvr.new())
		any_add_result1_upvr:add(arg1.endNotices:Connect(function() -- Line 83
			--[[ Upvalues[1]:
				[1]: any_add_result1_upvr_2 (readonly)
			]]
			any_add_result1_upvr_2:Fire()
		end))
		any_add_result1_upvr:add(deselected:Connect(function() -- Line 86
			--[[ Upvalues[1]:
				[1]: any_add_result1_upvr_2 (readonly)
			]]
			any_add_result1_upvr_2:Fire()
		end))
		local var22 = arg2_2
		if not var22 then
			var22 = Utility_upvr.generateUID()
		end
		local var23_upvw = var22
		arg1.notices[var23_upvw] = {
			completeSignal = any_add_result1_upvr_2;
			clearNoticeEvent = deselected;
		}
		local function _() -- Line 94, Named "updateNotice"
			--[[ Upvalues[1]:
				[1]: arg1 (copied, readonly)
			]]
			arg1.noticeChanged:Fire(arg1.totalNotices)
		end
		arg1.notified:Fire(var23_upvw)
		local var25 = arg1
		var25.totalNotices += 1
		arg1.noticeChanged:Fire(arg1.totalNotices)
		any_add_result1_upvr_2:Once(function() -- Line 100
			--[[ Upvalues[3]:
				[1]: any_add_result1_upvr (readonly)
				[2]: arg1 (copied, readonly)
				[3]: var23_upvw (read and write)
			]]
			any_add_result1_upvr:destroy()
			local var27 = arg1
			var27.totalNotices -= 1
			arg1.notices[var23_upvw] = nil
			arg1.noticeChanged:Fire(arg1.totalNotices)
		end)
	end)
	Frame_upvr:SetAttribute("ClipToJoinedParent", true)
	arg1:clipOutside(Frame_upvr)
	return Frame_upvr
end


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Elements.Selection
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:23
-- Luau version 6, Types version 3
-- Time taken: 0.002950 seconds

return function(arg1) -- Line 1
	local Frame = Instance.new("Frame")
	Frame.Name = "SelectionContainer"
	Frame.Visible = false
	local Frame_upvr = Instance.new("Frame")
	Frame_upvr.Name = "Selection"
	Frame_upvr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_upvr.BackgroundTransparency = 1
	Frame_upvr.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr.BorderSizePixel = 0
	Frame_upvr.Parent = Frame
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Name = "UIStroke"
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Color = Color3.fromRGB(255, 255, 255)
	UIStroke.Thickness = 3
	UIStroke.Parent = Frame_upvr
	local UIGradient_upvr = Instance.new("UIGradient")
	UIGradient_upvr.Name = "SelectionGradient"
	UIGradient_upvr.Parent = UIStroke
	local UICorner = Instance.new("UICorner")
	UICorner:SetAttribute("Collective", "IconCorners")
	UICorner.Name = "UICorner"
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = Frame_upvr
	local var7_upvw = 1
	Frame_upvr:GetAttributeChangedSignal("RotationSpeed"):Connect(function() -- Line 37
		--[[ Upvalues[2]:
			[1]: var7_upvw (read and write)
			[2]: Frame_upvr (readonly)
		]]
		var7_upvw = Frame_upvr:GetAttribute("RotationSpeed")
	end)
	local GuiService_upvr = game:GetService("GuiService")
	game:GetService("RunService").Heartbeat:Connect(function() -- Line 40
		--[[ Upvalues[3]:
			[1]: GuiService_upvr (readonly)
			[2]: UIGradient_upvr (readonly)
			[3]: var7_upvw (read and write)
		]]
		if not GuiService_upvr.SelectedObject then
		else
			UIGradient_upvr.Rotation = os.clock() * var7_upvw * 100 % 360
		end
	end)
	return Frame
end


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Elements.Widget
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:24
-- Luau version 6, Types version 3
-- Time taken: 0.040109 seconds

return function(arg1, arg2) -- Line 6
	local Frame_upvr_8 = Instance.new("Frame")
	Frame_upvr_8:SetAttribute("WidgetUID", arg1.UID)
	Frame_upvr_8.Name = "Widget"
	Frame_upvr_8.BackgroundTransparency = 1
	Frame_upvr_8.Visible = true
	Frame_upvr_8.ZIndex = 20
	Frame_upvr_8.Active = false
	Frame_upvr_8.ClipsDescendants = true
	local Frame_upvr_4 = Instance.new("Frame")
	Frame_upvr_4.Name = "IconButton"
	Frame_upvr_4.Visible = true
	Frame_upvr_4.ZIndex = 2
	Frame_upvr_4.BorderSizePixel = 0
	Frame_upvr_4.Parent = Frame_upvr_8
	Frame_upvr_4.ClipsDescendants = true
	Frame_upvr_4.Active = false
	arg1.deselected:Connect(function() -- Line 25
		--[[ Upvalues[2]:
			[1]: Frame_upvr_4 (readonly)
			[2]: arg1 (readonly)
		]]
		Frame_upvr_4.ClipsDescendants = true
		task.delay(0.2, function() -- Line 27
			--[[ Upvalues[2]:
				[1]: arg1 (copied, readonly)
				[2]: Frame_upvr_4 (copied, readonly)
			]]
			if arg1.isSelected then
				Frame_upvr_4.ClipsDescendants = false
			end
		end)
	end)
	local GuiService_upvr = game:GetService("GuiService")
	arg1:setBehaviour("IconButton", "BackgroundTransparency", function(arg1_2) -- Line 36
		--[[ Upvalues[1]:
			[1]: GuiService_upvr (readonly)
		]]
		if arg1_2 == 1 then
			return arg1_2
		end
		return arg1_2 * GuiService_upvr.PreferredTransparency
	end)
	arg1.janitor:add(GuiService_upvr:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() -- Line 44
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: Frame_upvr_4 (readonly)
		]]
		arg1:refreshAppearance(Frame_upvr_4, "BackgroundTransparency")
	end))
	local UICorner = Instance.new("UICorner")
	UICorner:SetAttribute("Collective", "IconCorners")
	UICorner.Name = "UICorner"
	UICorner.Parent = Frame_upvr_4
	local var10_upvr = require(script.Parent.Menu)(arg1)
	local MenuUIListLayout_upvr = var10_upvr.MenuUIListLayout
	local MenuGap_upvr = var10_upvr.MenuGap
	var10_upvr.Parent = Frame_upvr_4
	local Frame_upvr_5 = Instance.new("Frame")
	Frame_upvr_5.Name = "IconSpot"
	Frame_upvr_5.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
	Frame_upvr_5.BackgroundTransparency = 0.9
	Frame_upvr_5.Visible = true
	Frame_upvr_5.AnchorPoint = Vector2.new(0, 0.5)
	Frame_upvr_5.ZIndex = 5
	Frame_upvr_5.Parent = var10_upvr
	UICorner:Clone().Parent = Frame_upvr_5
	local clone_2 = Frame_upvr_5:Clone()
	clone_2.UICorner.Name = "OverlayUICorner"
	clone_2.Name = "IconOverlay"
	clone_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	clone_2.ZIndex = Frame_upvr_5.ZIndex + 1
	clone_2.Size = UDim2.new(1, 0, 1, 0)
	clone_2.Position = UDim2.new(0, 0, 0, 0)
	clone_2.AnchorPoint = Vector2.new(0, 0)
	clone_2.Visible = false
	clone_2.Parent = Frame_upvr_5
	local TextButton_upvr = Instance.new("TextButton")
	TextButton_upvr:SetAttribute("CorrespondingIconUID", arg1.UID)
	TextButton_upvr.Name = "ClickRegion"
	TextButton_upvr.BackgroundTransparency = 1
	TextButton_upvr.Visible = true
	TextButton_upvr.Text = ""
	TextButton_upvr.ZIndex = 20
	TextButton_upvr.Selectable = true
	TextButton_upvr.SelectionGroup = true
	TextButton_upvr.Parent = Frame_upvr_5
	require(script.Parent.Parent.Features.Gamepad).registerButton(TextButton_upvr)
	UICorner:Clone().Parent = TextButton_upvr
	local Frame_upvr_6 = Instance.new("Frame")
	Frame_upvr_6.Name = "Contents"
	Frame_upvr_6.BackgroundTransparency = 1
	Frame_upvr_6.Size = UDim2.fromScale(1, 1)
	Frame_upvr_6.Parent = Frame_upvr_5
	local UIListLayout_upvr = Instance.new("UIListLayout")
	UIListLayout_upvr.Name = "ContentsList"
	UIListLayout_upvr.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout_upvr.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout_upvr.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_upvr.VerticalFlex = Enum.UIFlexAlignment.SpaceEvenly
	UIListLayout_upvr.Padding = UDim.new(0, 3)
	UIListLayout_upvr.Parent = Frame_upvr_6
	local Frame_upvr_2 = Instance.new("Frame")
	Frame_upvr_2.Name = "PaddingLeft"
	Frame_upvr_2.LayoutOrder = 1
	Frame_upvr_2.ZIndex = 5
	Frame_upvr_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr_2.BackgroundTransparency = 1
	Frame_upvr_2.BorderSizePixel = 0
	Frame_upvr_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_upvr_2.Parent = Frame_upvr_6
	local Frame_upvr_7 = Instance.new("Frame")
	Frame_upvr_7.Name = "PaddingCenter"
	Frame_upvr_7.LayoutOrder = 3
	Frame_upvr_7.ZIndex = 5
	Frame_upvr_7.Size = UDim2.new(0, 0, 1, 0)
	Frame_upvr_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr_7.BackgroundTransparency = 1
	Frame_upvr_7.BorderSizePixel = 0
	Frame_upvr_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_upvr_7.Parent = Frame_upvr_6
	local Frame_upvr = Instance.new("Frame")
	Frame_upvr.Name = "PaddingRight"
	Frame_upvr.LayoutOrder = 5
	Frame_upvr.ZIndex = 5
	Frame_upvr.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_upvr.BackgroundTransparency = 1
	Frame_upvr.BorderSizePixel = 0
	Frame_upvr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_upvr.Parent = Frame_upvr_6
	local Frame_upvr_3 = Instance.new("Frame")
	Frame_upvr_3.Name = "IconLabelContainer"
	Frame_upvr_3.LayoutOrder = 4
	Frame_upvr_3.ZIndex = 3
	Frame_upvr_3.AnchorPoint = Vector2.new(0, 0.5)
	Frame_upvr_3.Size = UDim2.new(0, 0, 0.5, 0)
	Frame_upvr_3.BackgroundTransparency = 1
	Frame_upvr_3.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame_upvr_3.Parent = Frame_upvr_6
	local TextLabel_upvr = Instance.new("TextLabel")
	local var23_upvr = workspace.CurrentCamera.ViewportSize.X + 200
	TextLabel_upvr.Name = "IconLabel"
	TextLabel_upvr.LayoutOrder = 4
	TextLabel_upvr.ZIndex = 15
	TextLabel_upvr.AnchorPoint = Vector2.new(0, 0)
	TextLabel_upvr.Size = UDim2.new(0, var23_upvr, 1, 0)
	TextLabel_upvr.ClipsDescendants = false
	TextLabel_upvr.BackgroundTransparency = 1
	TextLabel_upvr.Position = UDim2.fromScale(0, 0)
	TextLabel_upvr.RichText = true
	TextLabel_upvr.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_upvr.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel_upvr.Text = ""
	TextLabel_upvr.TextWrapped = true
	TextLabel_upvr.TextWrap = true
	TextLabel_upvr.TextScaled = false
	TextLabel_upvr.Active = false
	TextLabel_upvr.AutoLocalize = true
	TextLabel_upvr.Parent = Frame_upvr_3
	local ImageLabel_upvr = Instance.new("ImageLabel")
	ImageLabel_upvr.Name = "IconImage"
	ImageLabel_upvr.LayoutOrder = 2
	ImageLabel_upvr.ZIndex = 15
	ImageLabel_upvr.AnchorPoint = Vector2.new(0, 0.5)
	ImageLabel_upvr.Size = UDim2.new(0, 0, 0.5, 0)
	ImageLabel_upvr.BackgroundTransparency = 1
	ImageLabel_upvr.Position = UDim2.new(0, 11, 0.5, 0)
	ImageLabel_upvr.ScaleType = Enum.ScaleType.Stretch
	ImageLabel_upvr.Active = false
	ImageLabel_upvr.Parent = Frame_upvr_6
	local clone = UICorner:Clone()
	clone:SetAttribute("Collective", nil)
	clone.CornerRadius = UDim.new(0, 0)
	clone.Name = "IconImageCorner"
	clone.Parent = ImageLabel_upvr
	local TweenService_upvr = game:GetService("TweenService")
	local var27_upvw = 0
	local any_createStagger_result1_upvr = require(script.Parent.Parent.Utility).createStagger(0.01, function(arg1_3) -- Line 195, Named "handleLabelAndImageChangesUnstaggered"
		--[[ Upvalues[20]:
			[1]: arg1 (readonly)
			[2]: TextLabel_upvr (readonly)
			[3]: ImageLabel_upvr (readonly)
			[4]: Frame_upvr_3 (readonly)
			[5]: Frame_upvr_2 (readonly)
			[6]: Frame_upvr_7 (readonly)
			[7]: Frame_upvr (readonly)
			[8]: Frame_upvr_4 (readonly)
			[9]: UIListLayout_upvr (readonly)
			[10]: Frame_upvr_6 (readonly)
			[11]: Frame_upvr_8 (readonly)
			[12]: var23_upvr (readonly)
			[13]: var10_upvr (readonly)
			[14]: Frame_upvr_5 (readonly)
			[15]: MenuUIListLayout_upvr (readonly)
			[16]: MenuGap_upvr (readonly)
			[17]: TweenService_upvr (readonly)
			[18]: TextButton_upvr (readonly)
			[19]: var27_upvw (read and write)
			[20]: arg2 (readonly)
		]]
		task.defer(function() -- Line 202
			--[[ Upvalues[20]:
				[1]: arg1 (copied, readonly)
				[2]: TextLabel_upvr (copied, readonly)
				[3]: ImageLabel_upvr (copied, readonly)
				[4]: Frame_upvr_3 (copied, readonly)
				[5]: Frame_upvr_2 (copied, readonly)
				[6]: Frame_upvr_7 (copied, readonly)
				[7]: Frame_upvr (copied, readonly)
				[8]: Frame_upvr_4 (copied, readonly)
				[9]: UIListLayout_upvr (copied, readonly)
				[10]: Frame_upvr_6 (copied, readonly)
				[11]: Frame_upvr_8 (copied, readonly)
				[12]: var23_upvr (copied, readonly)
				[13]: var10_upvr (copied, readonly)
				[14]: Frame_upvr_5 (copied, readonly)
				[15]: MenuUIListLayout_upvr (copied, readonly)
				[16]: MenuGap_upvr (copied, readonly)
				[17]: TweenService_upvr (copied, readonly)
				[18]: TextButton_upvr (copied, readonly)
				[19]: var27_upvw (copied, read and write)
				[20]: arg2 (copied, readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local indicator = arg1.indicator
			local var50 = indicator
			if var50 then
				var50 = indicator.Visible
			end
			local var51 = var50
			if not var51 then
				if TextLabel_upvr.Text == "" then
					var51 = false
				else
					var51 = true
				end
			end
			local var52 = false
			if ImageLabel_upvr.Image ~= "" then
				if ImageLabel_upvr.Image == nil then
					var52 = false
				else
					var52 = true
				end
			end
			local var53
			if var52 and not var51 then
				Frame_upvr_3.Visible = false
				ImageLabel_upvr.Visible = true
				Frame_upvr_2.Visible = false
				Frame_upvr_7.Visible = false
				Frame_upvr.Visible = false
			elseif not var52 and var51 then
				Frame_upvr_3.Visible = true
				ImageLabel_upvr.Visible = false
				Frame_upvr_2.Visible = true
				Frame_upvr_7.Visible = false
				Frame_upvr.Visible = true
			elseif var52 and var51 then
				Frame_upvr_3.Visible = true
				ImageLabel_upvr.Visible = true
				Frame_upvr_2.Visible = true
				Frame_upvr_7.Visible = not var50
				Frame_upvr.Visible = not var50
			end
			Frame_upvr_4.Size = UDim2.fromScale(1, 1)
			local function _(arg1_4) -- Line 232, Named "getItemWidth"
				local TargetWidth = arg1_4:GetAttribute("TargetWidth")
				if not TargetWidth then
					TargetWidth = arg1_4.AbsoluteSize.X
				end
				return TargetWidth
			end
			var53 = UIListLayout_upvr.Padding
			local Offset = var53.Offset
			var53 = Offset
			Frame_upvr_3.Size = UDim2.new(0, TextLabel_upvr.TextBounds.X, TextLabel_upvr.Size.Y.Scale, 0)
			for _, v in pairs(Frame_upvr_6:GetChildren()) do
				if v:IsA("GuiObject") and v.Visible == true then
					if not v:GetAttribute("TargetWidth") then
					end
					var53 += v.AbsoluteSize.X + Offset
				end
			end
			local MinimumWidth = Frame_upvr_8:GetAttribute("MinimumWidth")
			local MinimumHeight = Frame_upvr_8:GetAttribute("MinimumHeight")
			local BorderSize_2 = Frame_upvr_8:GetAttribute("BorderSize")
			if 0 >= #arg1.menuIcons then
			else
			end
			if true then
				local isSelected = arg1.isSelected
				local var63
			end
			if isSelected then
				for i_2, v_2 in pairs(var10_upvr:GetChildren()) do
					if v_2 ~= Frame_upvr_5 and v_2:IsA("GuiObject") and v_2.Visible then
						local TargetWidth_2 = v_2:GetAttribute("TargetWidth")
						if not TargetWidth_2 then
							TargetWidth_2 = v_2.AbsoluteSize.X
						end
						var63 += TargetWidth_2 + MenuUIListLayout_upvr.Padding.Offset
					end
				end
				if not Frame_upvr_5.Visible then
					i_2 = Frame_upvr_5
					v_2 = i_2:GetAttribute("TargetWidth")
					if not v_2 then
						v_2 = i_2.AbsoluteSize.X
					end
					v_2 = MenuUIListLayout_upvr.Padding.Offset
					i_2 = v_2 * 2
				end
				var63 -= BorderSize_2 * 0.5
			end
			if isSelected then
			end
			MenuGap_upvr.Visible = Frame_upvr_5.Visible
			local DesiredWidth = Frame_upvr_8:GetAttribute("DesiredWidth")
			if DesiredWidth and ((math.clamp(var53, MinimumWidth, var23_upvr)) - (v_2 + i_2 + BorderSize_2)) + (var63 - BorderSize_2 * 0.75) < DesiredWidth then
				local var69 = DesiredWidth
			end
			arg1.updateMenu:Fire()
			local var70 = math.max(var69 - var63, MinimumWidth) - BorderSize_2 * 2
			local MenuWidth = var10_upvr:GetAttribute("MenuWidth")
			local var72 = MenuWidth
			if var72 then
				var72 = MenuWidth + var70 + MenuUIListLayout_upvr.Padding.Offset + 10
			end
			if var72 then
				local MaxWidth = var10_upvr:GetAttribute("MaxWidth")
				if MaxWidth then
					var72 = math.max(MaxWidth, MinimumWidth)
				end
				var10_upvr:SetAttribute("MenuCanvasWidth", var69)
				if var72 < var69 then
					local var74 = var72
				end
			end
			local Quint = Enum.EasingStyle.Quint
			local Out = Enum.EasingDirection.Out
			local var77 = Frame_upvr_5
			local TargetWidth_4 = var77:GetAttribute("TargetWidth")
			if not TargetWidth_4 then
				TargetWidth_4 = var77.AbsoluteSize.X
			end
			local var79 = Frame_upvr_8
			local TargetWidth_3 = var79:GetAttribute("TargetWidth")
			if not TargetWidth_3 then
				TargetWidth_3 = var79.AbsoluteSize.X
			end
			local TweenInfo_new_result1 = TweenInfo.new(math.max(var70, TargetWidth_4, Frame_upvr_5.AbsoluteSize.X) / 750, Quint, Out)
			local TweenInfo_new_result1_2 = TweenInfo.new(math.max(var74, TargetWidth_3, Frame_upvr_8.AbsoluteSize.X) / 750, Quint, Out)
			TweenService_upvr:Create(Frame_upvr_5, TweenInfo_new_result1, {
				Position = UDim2.new(0, BorderSize_2, 0.5, 0);
				Size = UDim2.new(0, var70, 1, -BorderSize_2 * 2);
			}):Play()
			TweenService_upvr:Create(TextButton_upvr, TweenInfo_new_result1, {
				Size = UDim2.new(0, var70, 1, 0);
			}):Play()
			local var85 = var74
			local udim2 = UDim2.fromOffset(var85, MinimumHeight)
			if Frame_upvr_8.Size.Y.Offset == MinimumHeight then
				var85 = false
			else
				var85 = true
			end
			if var85 then
				Frame_upvr_8.Size = udim2
			end
			Frame_upvr_8:SetAttribute("TargetWidth", udim2.X.Offset)
			TweenService_upvr:Create(Frame_upvr_8, TweenInfo_new_result1_2, {
				Size = udim2;
			}):Play()
			var27_upvw += 1
			for i_3 = 1, TweenInfo_new_result1_2.Time * 100 do
				task.delay(i_3 / 100, function() -- Line 314
					--[[ Upvalues[2]:
						[1]: arg2 (copied, readonly)
						[2]: arg1 (copied, readonly)
					]]
					arg2.iconChanged:Fire(arg1)
				end)
			end
			task.delay(TweenInfo_new_result1_2.Time - 0.2, function() -- Line 318
				--[[ Upvalues[2]:
					[1]: var27_upvw (copied, read and write)
					[2]: arg1 (copied, readonly)
				]]
				var27_upvw -= 1
				task.defer(function() -- Line 320
					--[[ Upvalues[2]:
						[1]: var27_upvw (copied, read and write)
						[2]: arg1 (copied, readonly)
					]]
					if var27_upvw == 0 then
						arg1.resizingComplete:Fire()
					end
				end)
			end)
			arg1:updateParent()
		end)
	end)
	arg1:setBehaviour("IconLabel", "Text", any_createStagger_result1_upvr)
	local var93_upvw = true
	arg1:setBehaviour("IconLabel", "FontFace", function(arg1_5) -- Line 333
		--[[ Upvalues[3]:
			[1]: TextLabel_upvr (readonly)
			[2]: any_createStagger_result1_upvr (readonly)
			[3]: var93_upvw (read and write)
		]]
		if TextLabel_upvr.FontFace == arg1_5 then
		else
			task.spawn(function() -- Line 338
				--[[ Upvalues[2]:
					[1]: any_createStagger_result1_upvr (copied, readonly)
					[2]: var93_upvw (copied, read and write)
				]]
				any_createStagger_result1_upvr()
				if var93_upvw then
					var93_upvw = false
					for _ = 1, 10 do
						task.wait(1)
						any_createStagger_result1_upvr()
					end
				end
			end)
		end
	end)
	local function updateBorderSize() -- Line 360
		--[[ Upvalues[7]:
			[1]: Frame_upvr_8 (readonly)
			[2]: arg1 (readonly)
			[3]: Frame_upvr_5 (readonly)
			[4]: var10_upvr (readonly)
			[5]: MenuGap_upvr (readonly)
			[6]: MenuUIListLayout_upvr (readonly)
			[7]: any_createStagger_result1_upvr (readonly)
		]]
		task.defer(function() -- Line 361
			--[[ Upvalues[7]:
				[1]: Frame_upvr_8 (copied, readonly)
				[2]: arg1 (copied, readonly)
				[3]: Frame_upvr_5 (copied, readonly)
				[4]: var10_upvr (copied, readonly)
				[5]: MenuGap_upvr (copied, readonly)
				[6]: MenuUIListLayout_upvr (copied, readonly)
				[7]: any_createStagger_result1_upvr (copied, readonly)
			]]
			local BorderSize_3 = Frame_upvr_8:GetAttribute("BorderSize")
			local var98 = arg1
			if Frame_upvr_5.Visible == false then
				var98 = 0
			else
				local function INLINED() -- Internal function, doesn't exist in bytecode
					var98 = -BorderSize_3
					return var98
				end
				if var98.alignment ~= "Right" or not INLINED() then
					var98 = BorderSize_3
				end
			end
			var10_upvr.Position = UDim2.new(0, var98, 0, 0)
			MenuGap_upvr.Size = UDim2.fromOffset(BorderSize_3, 0)
			MenuUIListLayout_upvr.Padding = UDim.new(0, 0)
			any_createStagger_result1_upvr()
		end)
	end
	arg1:setBehaviour("Widget", "BorderSize", updateBorderSize)
	arg1:setBehaviour("IconSpot", "Visible", updateBorderSize)
	arg1.startMenuUpdate:Connect(any_createStagger_result1_upvr)
	arg1.updateSize:Connect(any_createStagger_result1_upvr)
	arg1:setBehaviour("ContentsList", "HorizontalAlignment", any_createStagger_result1_upvr)
	arg1:setBehaviour("Widget", "Visible", any_createStagger_result1_upvr)
	arg1:setBehaviour("Widget", "DesiredWidth", any_createStagger_result1_upvr)
	arg1:setBehaviour("Widget", "MinimumWidth", any_createStagger_result1_upvr)
	arg1:setBehaviour("Widget", "MinimumHeight", any_createStagger_result1_upvr)
	arg1:setBehaviour("Indicator", "Visible", any_createStagger_result1_upvr)
	arg1:setBehaviour("IconImageRatio", "AspectRatio", any_createStagger_result1_upvr)
	arg1:setBehaviour("IconImage", "Image", function(arg1_6) -- Line 382
		--[[ Upvalues[2]:
			[1]: ImageLabel_upvr (readonly)
			[2]: any_createStagger_result1_upvr (readonly)
		]]
		local var100
		local function INLINED_2() -- Internal function, doesn't exist in bytecode
			var100 = "http://www.roblox.com/asset/?id="..arg1_6
			return var100
		end
		if not tonumber(arg1_6) or not INLINED_2() then
			var100 = arg1_6
			if not var100 then
				var100 = ""
			end
		end
		if ImageLabel_upvr.Image ~= var100 then
			any_createStagger_result1_upvr()
		end
		return var100
	end)
	arg1.alignmentChanged:Connect(function(arg1_7) -- Line 389
		--[[ Upvalues[7]:
			[1]: MenuUIListLayout_upvr (readonly)
			[2]: Frame_upvr_8 (readonly)
			[3]: arg1 (readonly)
			[4]: Frame_upvr_5 (readonly)
			[5]: var10_upvr (readonly)
			[6]: MenuGap_upvr (readonly)
			[7]: any_createStagger_result1_upvr (readonly)
		]]
		if arg1_7 == "Center" then
		end
		MenuUIListLayout_upvr.HorizontalAlignment = Enum.HorizontalAlignment.Left
		task.defer(function() -- Line 361
			--[[ Upvalues[7]:
				[1]: Frame_upvr_8 (copied, readonly)
				[2]: arg1 (copied, readonly)
				[3]: Frame_upvr_5 (copied, readonly)
				[4]: var10_upvr (copied, readonly)
				[5]: MenuGap_upvr (copied, readonly)
				[6]: MenuUIListLayout_upvr (copied, readonly)
				[7]: any_createStagger_result1_upvr (copied, readonly)
			]]
			local BorderSize = Frame_upvr_8:GetAttribute("BorderSize")
			local var104 = arg1
			if Frame_upvr_5.Visible == false then
				var104 = 0
			else
				local function INLINED_3() -- Internal function, doesn't exist in bytecode
					var104 = -BorderSize
					return var104
				end
				if var104.alignment ~= "Right" or not INLINED_3() then
					var104 = BorderSize
				end
			end
			var10_upvr.Position = UDim2.new(0, var104, 0, 0)
			MenuGap_upvr.Size = UDim2.fromOffset(BorderSize, 0)
			MenuUIListLayout_upvr.Padding = UDim.new(0, 0)
			any_createStagger_result1_upvr()
		end)
	end)
	local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
	local LocaleId_upvw = LocalPlayer_upvr.LocaleId
	arg1.janitor:add(LocalPlayer_upvr:GetPropertyChangedSignal("LocaleId"):Connect(function() -- Line 401
		--[[ Upvalues[3]:
			[1]: LocalPlayer_upvr (readonly)
			[2]: LocaleId_upvw (read and write)
			[3]: arg1 (readonly)
		]]
		task.delay(0.2, function() -- Line 402
			--[[ Upvalues[3]:
				[1]: LocalPlayer_upvr (copied, readonly)
				[2]: LocaleId_upvw (copied, read and write)
				[3]: arg1 (copied, readonly)
			]]
			local LocaleId = LocalPlayer_upvr.LocaleId
			if LocaleId ~= LocaleId_upvw then
				LocaleId_upvw = LocaleId
				arg1:refresh()
				task.wait(0.5)
				arg1:refresh()
			end
		end)
	end))
	local NumberValue_upvr = Instance.new("NumberValue")
	NumberValue_upvr.Name = "IconImageScale"
	NumberValue_upvr.Parent = ImageLabel_upvr
	NumberValue_upvr:GetPropertyChangedSignal("Value"):Connect(function() -- Line 416
		--[[ Upvalues[2]:
			[1]: ImageLabel_upvr (readonly)
			[2]: NumberValue_upvr (readonly)
		]]
		ImageLabel_upvr.Size = UDim2.new(NumberValue_upvr.Value, 0, NumberValue_upvr.Value, 0)
	end)
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.Name = "IconImageRatio"
	UIAspectRatioConstraint.AspectType = Enum.AspectType.FitWithinMaxSize
	UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
	UIAspectRatioConstraint.Parent = ImageLabel_upvr
	local UIGradient = Instance.new("UIGradient")
	UIGradient.Name = "IconGradient"
	UIGradient.Enabled = true
	UIGradient.Parent = Frame_upvr_4
	local UIGradient_2 = Instance.new("UIGradient")
	UIGradient_2.Name = "IconSpotGradient"
	UIGradient_2.Enabled = true
	UIGradient_2.Parent = Frame_upvr_5
	return Frame_upvr_8
end


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Elements.Dropdown
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:25
-- Luau version 6, Types version 3
-- Time taken: 0.026919 seconds

local Themes_upvr = require(script.Parent.Parent.Features.Themes)
local TweenService_upvr = game:GetService("TweenService")
local RunService_upvr = game:GetService("RunService")
return function(arg1) -- Line 5
	--[[ Upvalues[3]:
		[1]: Themes_upvr (readonly)
		[2]: TweenService_upvr (readonly)
		[3]: RunService_upvr (readonly)
	]]
	local Frame_upvr = Instance.new("Frame")
	Frame_upvr.Name = "Dropdown"
	Frame_upvr.AutomaticSize = Enum.AutomaticSize.X
	Frame_upvr.BackgroundTransparency = 1
	Frame_upvr.BorderSizePixel = 0
	Frame_upvr.AnchorPoint = Vector2.new(0.5, 0)
	Frame_upvr.Position = UDim2.new(0.5, 0, 1, 10)
	Frame_upvr.ZIndex = -2
	Frame_upvr.ClipsDescendants = true
	Frame_upvr.Parent = arg1.widget
	local GuiService_upvr = game:GetService("GuiService")
	arg1:setBehaviour("Dropdown", "BackgroundTransparency", function(arg1_2) -- Line 20
		--[[ Upvalues[1]:
			[1]: GuiService_upvr (readonly)
		]]
		if arg1_2 == 1 then
			return arg1_2
		end
		return arg1_2 * GuiService_upvr.PreferredTransparency
	end)
	arg1.janitor:add(GuiService_upvr:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() -- Line 28
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: Frame_upvr (readonly)
		]]
		arg1:refreshAppearance(Frame_upvr, "BackgroundTransparency")
	end))
	local UICorner = Instance.new("UICorner")
	UICorner.Name = "DropdownCorner"
	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = Frame_upvr
	local ScrollingFrame_upvr = Instance.new("ScrollingFrame")
	ScrollingFrame_upvr.Name = "DropdownScroller"
	ScrollingFrame_upvr.AutomaticSize = Enum.AutomaticSize.X
	ScrollingFrame_upvr.BackgroundTransparency = 1
	ScrollingFrame_upvr.BorderSizePixel = 0
	ScrollingFrame_upvr.AnchorPoint = Vector2.new(0, 0)
	ScrollingFrame_upvr.Position = UDim2.new(0, 0, 0, 0)
	ScrollingFrame_upvr.ZIndex = -1
	ScrollingFrame_upvr.ClipsDescendants = true
	ScrollingFrame_upvr.Visible = true
	ScrollingFrame_upvr.VerticalScrollBarInset = Enum.ScrollBarInset.None
	ScrollingFrame_upvr.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
	ScrollingFrame_upvr.Active = false
	ScrollingFrame_upvr.ScrollingEnabled = true
	ScrollingFrame_upvr.AutomaticCanvasSize = Enum.AutomaticSize.Y
	ScrollingFrame_upvr.ScrollBarThickness = 5
	ScrollingFrame_upvr.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame_upvr.ScrollBarImageTransparency = 0.8
	ScrollingFrame_upvr.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollingFrame_upvr.Selectable = false
	ScrollingFrame_upvr.Active = true
	ScrollingFrame_upvr.Parent = Frame_upvr
	local NumberValue_upvr = Instance.new("NumberValue")
	NumberValue_upvr.Name = "DropdownSpeed"
	NumberValue_upvr.Value = 0.07
	NumberValue_upvr.Parent = Frame_upvr
	local UIPadding_upvr = Instance.new("UIPadding")
	UIPadding_upvr.Name = "DropdownPadding"
	UIPadding_upvr.PaddingTop = UDim.new(0, 0)
	UIPadding_upvr.PaddingBottom = UDim.new(0, 0)
	UIPadding_upvr.Parent = ScrollingFrame_upvr
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Name = "DropdownList"
	UIListLayout.FillDirection = Enum.FillDirection.Vertical
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly
	UIListLayout.Parent = ScrollingFrame_upvr
	local dropdownJanitor = arg1.dropdownJanitor
	local iconModule_upvr = require(arg1.iconModule)
	arg1.dropdownChildAdded:Connect(function(arg1_3) -- Line 81
		local _, any_modifyTheme_result2_upvr = arg1_3:modifyTheme({{"Widget", "BorderSize", 0}, {"IconCorners", "CornerRadius", UDim.new(0, 10)}, {"Widget", "MinimumWidth", 190}, {"Widget", "MinimumHeight", 58}, {"IconLabel", "TextSize", 20}, {"IconOverlay", "Size", UDim2.new(1, 0, 1, 0)}, {"PaddingLeft", "Size", UDim2.fromOffset(25, 0)}, {"Notice", "Position", UDim2.new(1, -24, 0, 5)}, {"ContentsList", "HorizontalAlignment", Enum.HorizontalAlignment.Left}, {"Selection", "Size", UDim2.new(1, -0, 1, -0)}, {"Selection", "Position", UDim2.new(0, 0, 0, 0)}})
		task.defer(function() -- Line 95
			--[[ Upvalues[2]:
				[1]: arg1_3 (readonly)
				[2]: any_modifyTheme_result2_upvr (readonly)
			]]
			arg1_3.joinJanitor:add(function() -- Line 96
				--[[ Upvalues[2]:
					[1]: arg1_3 (copied, readonly)
					[2]: any_modifyTheme_result2_upvr (copied, readonly)
				]]
				arg1_3:removeModification(any_modifyTheme_result2_upvr)
			end)
		end)
	end)
	arg1.dropdownSet:Connect(function(arg1_4) -- Line 101
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: iconModule_upvr (readonly)
		]]
		for _, v in pairs(arg1.dropdownIcons) do
			iconModule_upvr.getIconByUID(v):destroy()
		end
		if type(arg1_4) == "table" then
			for _, v_2 in pairs(arg1_4) do
				v_2:joinDropdown(arg1)
			end
		end
	end)
	local function updateMaxIcons_upvr() -- Line 113, Named "updateMaxIcons"
		--[[ Upvalues[3]:
			[1]: Frame_upvr (readonly)
			[2]: ScrollingFrame_upvr (readonly)
			[3]: UIPadding_upvr (readonly)
		]]
		local MaxIcons = Frame_upvr:GetAttribute("MaxIcons")
		local var53
		if not MaxIcons then
			return 0
		end
		local tbl = {}
		var53 = pairs(ScrollingFrame_upvr:GetChildren())
		local pairs_result1_4, pairs_result2_5, pairs_result3_3 = pairs(ScrollingFrame_upvr:GetChildren())
		for _, v_3 in pairs_result1_4, pairs_result2_5, pairs_result3_3 do
			if v_3:IsA("GuiObject") and v_3.Visible then
				table.insert(tbl, v_3)
			end
		end
		pairs_result1_4 = table.sort
		pairs_result1_4(tbl, function(arg1_5, arg2) -- Line 124
			local var59
			if arg1_5.AbsolutePosition.Y >= arg2.AbsolutePosition.Y then
				var59 = false
			else
				var59 = true
			end
			return var59
		end)
		pairs_result1_4 = 0
		local ceiled_2 = math.ceil(MaxIcons)
		for i_4 = 1, ceiled_2 do
			local var61 = tbl[i_4]
			local var62
			if not var61 then break end
			var62 = var61.AbsoluteSize.Y
			local var63 = false
			if i_4 == ceiled_2 then
				if ceiled_2 == MaxIcons then
					var63 = false
				else
					var63 = true
				end
			end
			if var63 then
				var62 *= MaxIcons - ceiled_2 + 1
			end
			pairs_result1_4 += var62
		end
		pairs_result1_4 += UIPadding_upvr.PaddingTop.Offset + UIPadding_upvr.PaddingBottom.Offset
		return pairs_result1_4
	end
	local var64_upvw
	local var65_upvw
	local var66_upvw
	local var67_upvw
	local function _() -- Line 145, Named "getTweenInfo"
		--[[ Upvalues[5]:
			[1]: Themes_upvr (copied, readonly)
			[2]: Frame_upvr (readonly)
			[3]: var66_upvw (read and write)
			[4]: var67_upvw (read and write)
			[5]: NumberValue_upvr (readonly)
		]]
		local var68 = Themes_upvr.getInstanceValue(Frame_upvr, "MaxIcons") or 1
		if var66_upvw and var66_upvw == var68 and var67_upvw then
			return var67_upvw
		end
		local TweenInfo_new_result1_3 = TweenInfo.new(NumberValue_upvr.Value * var68, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
		var67_upvw = TweenInfo_new_result1_3
		var66_upvw = var68
		return TweenInfo_new_result1_3
	end
	local function updateVisibility() -- Line 159
		--[[ Upvalues[10]:
			[1]: Themes_upvr (copied, readonly)
			[2]: Frame_upvr (readonly)
			[3]: var66_upvw (read and write)
			[4]: var67_upvw (read and write)
			[5]: NumberValue_upvr (readonly)
			[6]: var64_upvw (read and write)
			[7]: var65_upvw (read and write)
			[8]: arg1 (readonly)
			[9]: updateMaxIcons_upvr (readonly)
			[10]: TweenService_upvr (copied, readonly)
		]]
		local var70 = Themes_upvr.getInstanceValue(Frame_upvr, "MaxIcons") or 1
		local var71
		if var66_upvw and var66_upvw == var70 and var67_upvw then
			var71 = var67_upvw
		else
			local TweenInfo_new_result1_2 = TweenInfo.new(NumberValue_upvr.Value * var70, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
			var67_upvw = TweenInfo_new_result1_2
			var66_upvw = var70
			var71 = TweenInfo_new_result1_2
		end
		if var64_upvw then
			var64_upvw:Cancel()
			var64_upvw = nil
		end
		if var65_upvw then
			var65_upvw:Cancel()
			var65_upvw = nil
		end
		if arg1.isSelected then
			Frame_upvr.Visible = true
			Frame_upvr.BackgroundTransparency = 0
			Frame_upvr.Size = UDim2.new(0, Frame_upvr.Size.X.Offset, 0, 0)
			var64_upvw = TweenService_upvr:Create(Frame_upvr, var71, {
				Size = UDim2.new(0, Frame_upvr.Size.X.Offset, 0, updateMaxIcons_upvr());
			})
			var64_upvw:Play()
			var64_upvw.Completed:Connect(function() -- Line 180
				--[[ Upvalues[1]:
					[1]: var64_upvw (copied, read and write)
				]]
				var64_upvw = nil
			end)
		else
			var65_upvw = TweenService_upvr:Create(Frame_upvr, TweenInfo.new(0), {
				Size = UDim2.new(0, Frame_upvr.Size.X.Offset, 0, 0);
			})
			var65_upvw:Play()
			var65_upvw.Completed:Connect(function() -- Line 187
				--[[ Upvalues[1]:
					[1]: var65_upvw (copied, read and write)
				]]
				var65_upvw = nil
			end)
		end
	end
	dropdownJanitor:add(arg1.toggled:Connect(updateVisibility))
	updateVisibility()
	local function updateChildSize_upvr() -- Line 197, Named "updateChildSize"
		--[[ Upvalues[11]:
			[1]: Themes_upvr (copied, readonly)
			[2]: Frame_upvr (readonly)
			[3]: var66_upvw (read and write)
			[4]: var67_upvw (read and write)
			[5]: NumberValue_upvr (readonly)
			[6]: arg1 (readonly)
			[7]: var64_upvw (read and write)
			[8]: var65_upvw (read and write)
			[9]: RunService_upvr (copied, readonly)
			[10]: updateMaxIcons_upvr (readonly)
			[11]: TweenService_upvr (copied, readonly)
		]]
		local var77 = Themes_upvr.getInstanceValue(Frame_upvr, "MaxIcons") or 1
		local var78
		if var66_upvw and var66_upvw == var77 and var67_upvw then
			var78 = var67_upvw
		else
			local TweenInfo_new_result1 = TweenInfo.new(NumberValue_upvr.Value * var77, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
			var67_upvw = TweenInfo_new_result1
			var66_upvw = var77
			var78 = TweenInfo_new_result1
		end
		if not arg1.isSelected then
		else
			if var64_upvw then
				var64_upvw:Cancel()
				var64_upvw = nil
			end
			if var65_upvw then
				var65_upvw:Cancel()
				var65_upvw = nil
			end
			RunService_upvr.Heartbeat:Wait()
			var64_upvw = TweenService_upvr:Create(Frame_upvr, var78, {
				Size = UDim2.new(0, Frame_upvr.Size.X.Offset, 0, updateMaxIcons_upvr());
			})
			var64_upvw:Play()
			var64_upvw.Completed:Connect(function() -- Line 215
				--[[ Upvalues[1]:
					[1]: var64_upvw (copied, read and write)
				]]
				var64_upvw = nil
			end)
		end
	end
	dropdownJanitor:add(arg1.toggled:Connect(updateVisibility))
	local var82_upvw = 0
	local var83_upvw = false
	local function updateMaxIconsListener_upvr() -- Line 228, Named "updateMaxIconsListener"
		--[[ Upvalues[8]:
			[1]: var82_upvw (read and write)
			[2]: var83_upvw (read and write)
			[3]: updateMaxIconsListener_upvr (readonly)
			[4]: Frame_upvr (readonly)
			[5]: ScrollingFrame_upvr (readonly)
			[6]: iconModule_upvr (readonly)
			[7]: arg1 (readonly)
			[8]: UIPadding_upvr (readonly)
		]]
		var82_upvw += 1
		local var90
		if var83_upvw then
		else
			var83_upvw = true
			task.defer(function() -- Line 233
				--[[ Upvalues[4]:
					[1]: var83_upvw (copied, read and write)
					[2]: var82_upvw (copied, read and write)
					[3]: var82_upvw (readonly)
					[4]: updateMaxIconsListener_upvr (copied, readonly)
				]]
				var83_upvw = false
				if var82_upvw ~= var82_upvw then
					updateMaxIconsListener_upvr()
				end
			end)
			var90 = "MaxIcons"
			local attribute = Frame_upvr:GetAttribute(var90)
			if not attribute then return end
			local tbl_2 = {}
			var90 = pairs(ScrollingFrame_upvr:GetChildren())
			local pairs_result1, pairs_result2, pairs_result3_2 = pairs(ScrollingFrame_upvr:GetChildren())
			for _, v_5 in pairs_result1, pairs_result2, pairs_result3_2 do
				if v_5:IsA("GuiObject") and v_5.Visible then
					table.insert(tbl_2, {v_5, v_5.AbsolutePosition.Y})
				end
			end
			pairs_result1 = table.sort
			pairs_result1(tbl_2, function(arg1_6, arg2) -- Line 248
				local var99
				if arg1_6[2] >= arg2[2] then
					var99 = false
				else
					var99 = true
				end
				return var99
			end)
			pairs_result1 = 0
			local ceiled = math.ceil(attribute)
			for i_7 = 1, ceiled do
				local var101 = tbl_2[i_7]
				local var102
				if not var101 then break end
				local _1 = var101[1]
				var102 = _1.AbsoluteSize.Y
				local var104 = false
				if i_7 == ceiled then
					if ceiled == attribute then
						var104 = false
					else
						var104 = true
					end
				end
				if var104 then
					var102 *= attribute - ceiled + 1
				end
				pairs_result1 += var102
				local var105
				if not var104 then
					local WidgetUID = _1:GetAttribute("WidgetUID")
					var105 = WidgetUID
					if var105 then
						var105 = iconModule_upvr.getIconByUID(WidgetUID)
					end
					if var105 then
						local var107
						if not false then
							var107 = arg1:getInstance("ClickRegion")
						end
						var105:getInstance("ClickRegion").NextSelectionUp = var107
					end
				end
			end
			pairs_result1 += UIPadding_upvr.PaddingTop.Offset + UIPadding_upvr.PaddingBottom.Offset
			ScrollingFrame_upvr.Size = UDim2.fromOffset(0, pairs_result1)
		end
	end
	dropdownJanitor:add(ScrollingFrame_upvr:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateMaxIconsListener_upvr))
	dropdownJanitor:add(ScrollingFrame_upvr.ChildAdded:Connect(updateMaxIconsListener_upvr))
	dropdownJanitor:add(ScrollingFrame_upvr.ChildRemoved:Connect(updateChildSize_upvr))
	dropdownJanitor:add(ScrollingFrame_upvr.ChildRemoved:Connect(updateMaxIconsListener_upvr))
	dropdownJanitor:add(Frame_upvr:GetAttributeChangedSignal("MaxIcons"):Connect(updateMaxIconsListener_upvr))
	dropdownJanitor:add(Frame_upvr:GetAttributeChangedSignal("MaxIcons"):Connect(updateChildSize_upvr))
	dropdownJanitor:add(arg1.childThemeModified:Connect(updateMaxIconsListener_upvr))
	updateMaxIconsListener_upvr()
	local function _(arg1_7) -- Line 293, Named "connectVisibilityListeners"
		--[[ Upvalues[1]:
			[1]: updateChildSize_upvr (readonly)
		]]
		if arg1_7:IsA("GuiObject") then
			arg1_7:GetPropertyChangedSignal("Visible"):Connect(updateChildSize_upvr)
			arg1_7:GetPropertyChangedSignal("Size"):Connect(updateChildSize_upvr)
		end
	end
	for _, v_4 in pairs(ScrollingFrame_upvr:GetChildren()) do
		if v_4:IsA("GuiObject") then
			v_4:GetPropertyChangedSignal("Visible"):Connect(updateChildSize_upvr)
			v_4:GetPropertyChangedSignal("Size"):Connect(updateChildSize_upvr)
		end
	end
	ScrollingFrame_upvr.ChildAdded:Connect(function(arg1_8) -- Line 305
		--[[ Upvalues[2]:
			[1]: RunService_upvr (copied, readonly)
			[2]: updateChildSize_upvr (readonly)
		]]
		RunService_upvr.Heartbeat:Wait()
		if arg1_8:IsA("GuiObject") then
			arg1_8:GetPropertyChangedSignal("Visible"):Connect(updateChildSize_upvr)
			arg1_8:GetPropertyChangedSignal("Size"):Connect(updateChildSize_upvr)
		end
		updateChildSize_upvr()
	end)
	Frame_upvr.Visible = false
	return Frame_upvr
end


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Features.Gamepad
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:26
-- Luau version 6, Types version 3
-- Time taken: 0.012896 seconds

local GamepadService_upvr = game:GetService("GamepadService")
local UserInputService_upvr = game:GetService("UserInputService")
local GuiService_upvr = game:GetService("GuiService")
local module_upvr = {}
local var5_upvw
local DPadUp_upvr = Enum.KeyCode.DPadUp
local Gamepad_upvr = Enum.PreferredInput.Gamepad
function module_upvr.start(arg1) -- Line 26
	--[[ Upvalues[7]:
		[1]: var5_upvw (read and write)
		[2]: DPadUp_upvr (readonly)
		[3]: GuiService_upvr (readonly)
		[4]: UserInputService_upvr (readonly)
		[5]: Gamepad_upvr (readonly)
		[6]: module_upvr (readonly)
		[7]: GamepadService_upvr (readonly)
	]]
	var5_upvw = arg1
	local var8
	if var5_upvw.highlightKey ~= nil then
		var8 = var5_upvw.highlightKey
	else
		var8 = DPadUp_upvr
	end
	var5_upvw.highlightKey = var8
	var8 = false
	var5_upvw.highlightIcon = var8
	var8 = 1
	task.delay(var8, function() -- Line 35
		--[[ Upvalues[7]:
			[1]: var5_upvw (copied, read and write)
			[2]: GuiService_upvr (copied, readonly)
			[3]: DPadUp_upvr (copied, readonly)
			[4]: UserInputService_upvr (copied, readonly)
			[5]: Gamepad_upvr (copied, readonly)
			[6]: module_upvr (copied, readonly)
			[7]: GamepadService_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		-- KONSTANTERROR: [0] 1. Error Block 22 start (CF ANALYSIS FAILED)
		local iconsDictionary_upvr = var5_upvw.iconsDictionary
		local function _() -- Line 38, Named "getIconFromSelectedObject"
			--[[ Upvalues[2]:
				[1]: GuiService_upvr (copied, readonly)
				[2]: iconsDictionary_upvr (readonly)
			]]
			local var12 = GuiService_upvr.SelectedObject
			if var12 then
				var12 = GuiService_upvr.SelectedObject:GetAttribute("CorrespondingIconUID")
			end
			local var13 = var12
			if var13 then
				var13 = iconsDictionary_upvr[var12]
			end
			return var13
		end
		local var14_upvw
		if DPadUp_upvr == var5_upvw.highlightKey then
			var14_upvw = false
		else
			var14_upvw = true
		end
		if DPadUp_upvr == var5_upvw.highlightKey then
			-- KONSTANTWARNING: GOTO [23] #19
		end
		-- KONSTANTERROR: [0] 1. Error Block 22 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [22] 18. Error Block 24 start (CF ANALYSIS FAILED)
		local var15_upvw = true
		local Selection_upvr = require(script.Parent.Parent.Elements.Selection)
		local var17_upvw
		local function updateSelectedObject_upvr() -- Line 50, Named "updateSelectedObject"
			--[[ Upvalues[10]:
				[1]: GuiService_upvr (copied, readonly)
				[2]: iconsDictionary_upvr (readonly)
				[3]: UserInputService_upvr (copied, readonly)
				[4]: Gamepad_upvr (copied, readonly)
				[5]: Selection_upvr (readonly)
				[6]: var5_upvw (copied, read and write)
				[7]: var17_upvw (read and write)
				[8]: var15_upvw (read and write)
				[9]: var14_upvw (read and write)
				[10]: module_upvr (copied, readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local var19 = GuiService_upvr.SelectedObject
			if var19 then
				var19 = GuiService_upvr.SelectedObject:GetAttribute("CorrespondingIconUID")
			end
			local var20 = var19
			if var20 then
				var20 = iconsDictionary_upvr[var19]
			end
			local var21 = var20
			if UserInputService_upvr.PreferredInput ~= Gamepad_upvr then
				local _ = false
				-- KONSTANTWARNING: Skipped task `defvar` above
			else
			end
			if var21 then
				if true then
					if not var21.selection then
						local any_add_result1 = var21.janitor:add(Selection_upvr(var5_upvw))
						any_add_result1:SetAttribute("IgnoreVisibilityUpdater", true)
						any_add_result1.Parent = var21.widget
						var21.selection = any_add_result1
						var21:refreshAppearance(any_add_result1)
					end
					var21:getInstance("ClickRegion").SelectionImageObject = any_add_result1.Selection
				end
				if var17_upvw and var17_upvw ~= var21 then
					var17_upvw:setIndicator()
					local var24
				end
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if true and not var15_upvw and not var21.parentIconUID then
					var24 = Enum.KeyCode.ButtonB
				else
					var24 = nil
				end
				var17_upvw = var21
				var5_upvw.lastHighlightedIcon = var21
				var21:setIndicator(var24)
				do
					return
				end
				local var25
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if true and not var14_upvw then
				var25 = var5_upvw.highlightKey
			else
				var25 = nil
			end
			if not var17_upvw then
				var17_upvw = module_upvr.getIconToHighlight()
			end
			if var25 == var5_upvw.highlightKey then
				var14_upvw = true
			end
			if var17_upvw then
				var17_upvw:setIndicator(var25)
			end
		end
		GuiService_upvr:GetPropertyChangedSignal("SelectedObject"):Connect(updateSelectedObject_upvr)
		UserInputService_upvr:GetPropertyChangedSignal("PreferredInput"):Connect(function() -- Line 93, Named "preferredInputChanged"
			--[[ Upvalues[5]:
				[1]: UserInputService_upvr (copied, readonly)
				[2]: Gamepad_upvr (copied, readonly)
				[3]: var14_upvw (read and write)
				[4]: var15_upvw (read and write)
				[5]: updateSelectedObject_upvr (readonly)
			]]
			local var26 = UserInputService_upvr
			if var26.PreferredInput ~= Gamepad_upvr then
				var26 = false
			else
				var26 = true
			end
			if not var26 then
				var14_upvw = false
				var15_upvw = false
			end
			updateSelectedObject_upvr()
		end)
		if UserInputService_upvr.PreferredInput ~= Gamepad_upvr then
		else
		end
		if not true then
			var14_upvw = false
			var15_upvw = false
		end
		updateSelectedObject_upvr()
		UserInputService_upvr.InputBegan:Connect(function(arg1_2, arg2) -- Line 109
			--[[ Upvalues[5]:
				[1]: GuiService_upvr (copied, readonly)
				[2]: iconsDictionary_upvr (readonly)
				[3]: var5_upvw (copied, read and write)
				[4]: module_upvr (copied, readonly)
				[5]: GamepadService_upvr (copied, readonly)
			]]
			local var28
			if arg1_2.UserInputType == Enum.UserInputType.MouseButton1 then
				var28 = GuiService_upvr
				var28 = var28.SelectedObject
				if var28 then
					var28 = var28.SelectedObject:GetAttribute("CorrespondingIconUID")
				end
				local var30 = var28
				if var30 then
					var30 = iconsDictionary_upvr[var28]
				end
				if var30 then
					GuiService_upvr.SelectedObject = nil
				end
			else
				if arg1_2.KeyCode ~= var5_upvw.highlightKey then return end
				local any_getIconToHighlight_result1 = module_upvr.getIconToHighlight()
				if any_getIconToHighlight_result1 then
					if GamepadService_upvr.GamepadCursorEnabled then
						task.wait(0.2)
						GamepadService_upvr:DisableGamepadCursor()
					end
					GuiService_upvr.SelectedObject = any_getIconToHighlight_result1:getInstance("ClickRegion")
				end
			end
		end)
		-- KONSTANTERROR: [22] 18. Error Block 24 end (CF ANALYSIS FAILED)
	end)
end
function module_upvr.getIconToHighlight() -- Line 136
	--[[ Upvalues[1]:
		[1]: var5_upvw (read and write)
	]]
	local var38
	if not var38 then
		var38 = var5_upvw.lastHighlightedIcon
	end
	if not var38 then
		local var39
		for _, v in pairs(var5_upvw.iconsDictionary) do
			if not v.parentIconUID and (not var39 or v.widget.AbsolutePosition.X < var39) then
				var38 = v
			end
		end
	end
	return var38
end
function module_upvr.registerButton(arg1) -- Line 158
	--[[ Upvalues[3]:
		[1]: UserInputService_upvr (readonly)
		[2]: GamepadService_upvr (readonly)
		[3]: GuiService_upvr (readonly)
	]]
	local var43_upvw = false
	arg1.InputBegan:Connect(function(arg1_3) -- Line 164
		--[[ Upvalues[1]:
			[1]: var43_upvw (read and write)
		]]
		var43_upvw = true
		task.wait()
		task.wait()
		var43_upvw = false
	end)
	local any_Connect_result1_upvr = UserInputService_upvr.InputBegan:Connect(function(arg1_4) -- Line 173
		--[[ Upvalues[4]:
			[1]: var43_upvw (read and write)
			[2]: GamepadService_upvr (copied, readonly)
			[3]: GuiService_upvr (copied, readonly)
			[4]: arg1 (readonly)
		]]
		task.wait()
		local var49
		if var49 == Enum.KeyCode.ButtonA then
			var49 = var43_upvw
			if var49 then
				var49 = task.wait
				var49(0.2)
				var49 = GamepadService_upvr:DisableGamepadCursor
				var49()
				var49 = GuiService_upvr
				var49.SelectedObject = arg1
				return
			end
		end
		if GuiService_upvr.SelectedObject ~= arg1 then
			var49 = false
		else
			var49 = true
		end
		local Name = arg1_4.KeyCode.Name
		if table.find({"ButtonB", "ButtonSelect"}, Name) and var49 and (Name ~= "ButtonSelect" or GamepadService_upvr.GamepadCursorEnabled) then
			GuiService_upvr.SelectedObject = nil
		end
	end)
	arg1.Destroying:Once(function() -- Line 194
		--[[ Upvalues[1]:
			[1]: any_Connect_result1_upvr (readonly)
		]]
		any_Connect_result1_upvr:Disconnect()
	end)
end
return module_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Features.Overflow
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:27
-- Luau version 6, Types version 3
-- Time taken: 0.045760 seconds

local module_upvr = {}
local tbl_upvr_2 = {}
local tbl_upvr_3 = {}
local var4_upvw
local tbl_upvr_4 = {}
local Utility_upvr = require(script.Parent.Parent.Utility)
local var7_upvw = false
local var8_upvw
local CurrentCamera_upvr = workspace.CurrentCamera
function module_upvr.start(arg1) -- Line 25
	--[[ Upvalues[7]:
		[1]: var8_upvw (read and write)
		[2]: var4_upvw (read and write)
		[3]: tbl_upvr_2 (readonly)
		[4]: Utility_upvr (readonly)
		[5]: module_upvr (readonly)
		[6]: var7_upvw (read and write)
		[7]: CurrentCamera_upvr (readonly)
	]]
	var8_upvw = arg1
	var4_upvw = var8_upvw.iconsDictionary
	local var21
	for _, v in pairs(var8_upvw.container) do
		if var21 == nil and v.ScreenInsets == Enum.ScreenInsets.TopbarSafeInsets then
			var21 = v
		end
		for _, v_2 in pairs(v.Holders:GetChildren()) do
			if v_2:GetAttribute("IsAHolder") then
				tbl_upvr_2[v_2.Name] = v_2
			end
		end
	end
	local var25_upvw = false
	local any_createStagger_result1_upvr = Utility_upvr.createStagger(0.1, function(arg1_2) -- Line 43
		--[[ Upvalues[2]:
			[1]: var25_upvw (read and write)
			[2]: module_upvr (copied, readonly)
		]]
		if not var25_upvw then
		else
			if not arg1_2 then
				module_upvr.updateAvailableIcons("Center")
			end
			module_upvr.updateBoundary("Left")
			module_upvr.updateBoundary("Right")
		end
	end)
	task.delay(0.5, function() -- Line 53
		--[[ Upvalues[2]:
			[1]: var25_upvw (read and write)
			[2]: any_createStagger_result1_upvr (readonly)
		]]
		var25_upvw = true
		any_createStagger_result1_upvr()
	end)
	task.delay(2, function() -- Line 57
		--[[ Upvalues[2]:
			[1]: var7_upvw (copied, read and write)
			[2]: any_createStagger_result1_upvr (readonly)
		]]
		var7_upvw = true
		any_createStagger_result1_upvr()
	end)
	var8_upvw.iconAdded:Connect(any_createStagger_result1_upvr)
	var8_upvw.iconRemoved:Connect(any_createStagger_result1_upvr)
	var8_upvw.iconChanged:Connect(any_createStagger_result1_upvr)
	CurrentCamera_upvr:GetPropertyChangedSignal("ViewportSize"):Connect(function() -- Line 67
		--[[ Upvalues[1]:
			[1]: any_createStagger_result1_upvr (readonly)
		]]
		any_createStagger_result1_upvr(true)
	end)
	var21:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line 70
		--[[ Upvalues[1]:
			[1]: any_createStagger_result1_upvr (readonly)
		]]
		any_createStagger_result1_upvr(true)
	end)
end
function module_upvr.getWidth(arg1, arg2) -- Line 75
	local widget = arg1.widget
	local TargetWidth = widget:GetAttribute("TargetWidth")
	if not TargetWidth then
		TargetWidth = widget.AbsoluteSize.X
	end
	return TargetWidth
end
function module_upvr.getAvailableIcons(arg1) -- Line 80
	--[[ Upvalues[2]:
		[1]: tbl_upvr_3 (readonly)
		[2]: module_upvr (readonly)
	]]
	local var34 = tbl_upvr_3[arg1]
	if not var34 then
		var34 = module_upvr.updateAvailableIcons(arg1)
	end
	return var34
end
function module_upvr.updateAvailableIcons(arg1) -- Line 88
	--[[ Upvalues[3]:
		[1]: var4_upvw (read and write)
		[2]: tbl_upvr_4 (readonly)
		[3]: tbl_upvr_3 (readonly)
	]]
	local module_2 = {}
	local var43
	for _, v_3 in pairs(var4_upvw) do
		local var45
		if not var45 then
			var45 = tbl_upvr_4[v_3.parentIconUID]
		end
		if var45 and v_3.alignment == arg1 and not tbl_upvr_4[v_3.UID] and v_3.isEnabled then
			table.insert(module_2, v_3)
			var43 += 1
		end
	end
	if var43 <= 0 then
		return {}
	end
	table.sort(module_2, function(arg1_3, arg2) -- Line 110
		local LayoutOrder_2 = arg1_3.widget.LayoutOrder
		local LayoutOrder = arg2.widget.LayoutOrder
		local parentIconUID = arg1_3.parentIconUID
		local parentIconUID_2 = arg2.parentIconUID
		local var51
		if parentIconUID == parentIconUID_2 then
			if LayoutOrder_2 < LayoutOrder then
				var51 = true
				return var51
			end
			if LayoutOrder < LayoutOrder_2 then
				var51 = false
				return var51
			end
			if arg1_3.widget.AbsolutePosition.X >= arg2.widget.AbsolutePosition.X then
				var51 = false
			else
				var51 = true
			end
			return var51
		end
		if parentIconUID_2 then
			var51 = false
			return var51
		end
		if parentIconUID then
			var51 = true
			return var51
		end
		return nil
	end)
	tbl_upvr_3[arg1] = module_2
	return module_2
end
function module_upvr.getRealXPositions(arg1, arg2) -- Line 137
	--[[ Upvalues[3]:
		[1]: tbl_upvr_2 (readonly)
		[2]: Utility_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	if arg1 ~= "Left" then
		local _ = false
		-- KONSTANTWARNING: Skipped task `defvar` above
	else
	end
	local var55 = tbl_upvr_2[arg1]
	local Offset_3 = var55.UIListLayout.Padding.Offset
	if not true or not var55.AbsolutePosition.X then
	end
	local module = {}
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if true then
		Utility_upvr.reverseTable(arg2)
	end
	for i_4 = #arg2, 1, -1 do
		local var59 = arg2[i_4]
		local any_getWidth_result1 = module_upvr.getWidth(var59)
		local var61
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if not true then
			var61 -= any_getWidth_result1
		end
		module[var59.UID] = var61
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if true then
			var61 += any_getWidth_result1
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if not true or not Offset_3 then
		end
		var61 += -Offset_3
	end
	return module
end
local tbl_upvr = {}
local var63_upvw = false
function module_upvr.updateBoundary(arg1) -- Line 166
	--[[ Upvalues[8]:
		[1]: tbl_upvr_2 (readonly)
		[2]: module_upvr (readonly)
		[3]: tbl_upvr (readonly)
		[4]: var8_upvw (read and write)
		[5]: tbl_upvr_4 (readonly)
		[6]: var63_upvw (read and write)
		[7]: var7_upvw (read and write)
		[8]: Utility_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var140 = tbl_upvr_2[arg1]
	local UIListLayout = var140.UIListLayout
	local X_12 = var140.AbsolutePosition.X
	local X_2 = var140.AbsoluteSize.X
	local Offset_2_upvr = UIListLayout.Padding.Offset
	local Offset = UIListLayout.Padding.Offset
	local any_updateAvailableIcons_result1_2_upvr = module_upvr.updateAvailableIcons(arg1)
	local var147 = 0
	local var148 = 0
	for i_5, v_4 in pairs(any_updateAvailableIcons_result1_2_upvr) do
		var147 += module_upvr.getWidth(v_4) + Offset
		var148 += 1
	end
	if var148 <= 0 then
		do
			return
		end
		local var152_upvr
	end
	if arg1 ~= "Center" then
	else
	end
	if arg1 ~= "Left" then
		var152_upvr = false
	else
		var152_upvr = true
	end
	local var153_upvr = not var152_upvr
	v_4 = tbl_upvr
	i_5 = v_4[arg1]
	if not i_5 and not true then
		v_4 = #any_updateAvailableIcons_result1_2_upvr
		if 0 < v_4 then
			if var152_upvr then
				v_4 = -9999999
			else
				v_4 = 9999999
			end
			i_5 = var8_upvw.new()
			i_5:setImage(6069276526, "Deselected")
			i_5:setName("Overflow"..arg1)
			i_5:setOrder(v_4)
			i_5:setAlignment(arg1)
			i_5:autoDeselect(false)
			i_5.isAnOverflow = true
			i_5:select("OverflowStart", i_5)
			i_5:setEnabled(false)
			tbl_upvr[arg1] = i_5
			tbl_upvr_4[i_5.UID] = true
			if not var8_upvw.closeableOverflowMenus then
				i_5:getInstance("IconSpot").Visible = false
			end
		end
	end
	if arg1 == "Left" then
		v_4 = "Right"
	else
		v_4 = "Left"
	end
	local any_updateAvailableIcons_result1 = module_upvr.updateAvailableIcons(v_4)
	if not var152_upvr or not any_updateAvailableIcons_result1[1] or var153_upvr then
		local var155 = any_updateAvailableIcons_result1[#any_updateAvailableIcons_result1]
	end
	local var156 = tbl_upvr[v_4]
	if not var152_upvr or not (X_12 + X_2) then
		local var157
	end
	if var155 then
		local var158 = module_upvr.getRealXPositions(v_4, any_updateAvailableIcons_result1)[var155.UID]
		var157 = module_upvr
		var157 = var155
		local function INLINED_9() -- Internal function, doesn't exist in bytecode
			var157 = var158 - Offset_2_upvr
			return var157
		end
		if not var152_upvr or not INLINED_9() then
			var157 = var158 + var157.getWidth(var157) + Offset_2_upvr
		end
		local var159 = var157
	end
	local var160_upvw = 0
	local function checkToShiftCentralIcon_upvr() -- Line 233, Named "checkToShiftCentralIcon"
		--[[ Upvalues[10]:
			[1]: module_upvr (copied, readonly)
			[2]: var152_upvr (readonly)
			[3]: var63_upvw (copied, read and write)
			[4]: arg1 (readonly)
			[5]: any_updateAvailableIcons_result1_2_upvr (readonly)
			[6]: var153_upvr (readonly)
			[7]: Offset_2_upvr (readonly)
			[8]: var7_upvw (copied, read and write)
			[9]: var160_upvw (read and write)
			[10]: checkToShiftCentralIcon_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var161 = "Center"
		local any_getAvailableIcons_result1 = module_upvr.getAvailableIcons(var161)
		if var152_upvr then
			var161 = 1
		else
			var161 = #any_getAvailableIcons_result1
		end
		local var163 = any_getAvailableIcons_result1[var161]
		local function _() -- Line 237, Named "secondaryCheck"
			--[[ Upvalues[3]:
				[1]: var63_upvw (copied, read and write)
				[2]: module_upvr (copied, readonly)
				[3]: arg1 (copied, readonly)
			]]
			if not var63_upvw then
				var63_upvw = true
				task.delay(3, module_upvr.updateBoundary, arg1)
			end
		end
		if var163 then
			local var164
			if not var164 then
				local function INLINED_10() -- Internal function, doesn't exist in bytecode
					var164 = any_updateAvailableIcons_result1_2_upvr[#any_updateAvailableIcons_result1_2_upvr]
					return var164
				end
				local function INLINED_11() -- Internal function, doesn't exist in bytecode
					var164 = var153_upvr
					return var164
				end
				if not var152_upvr or not INLINED_10() or INLINED_11() then
					var164 = any_updateAvailableIcons_result1_2_upvr[1]
				end
				local X_3 = var163.widget.AbsolutePosition.X
				local X_5 = var164.widget.AbsolutePosition.X
				if not var152_upvr or not (X_3 - Offset_2_upvr) then
				end
				if not var152_upvr or not (X_5 + module_upvr.getWidth(var164)) then
					local var167 = X_5
				end
				if var152_upvr then
					if X_3 + module_upvr.getWidth(var163) + Offset_2_upvr < var167 then
						if not var7_upvw then
							if not var63_upvw then
								var63_upvw = true
								task.delay(3, module_upvr.updateBoundary, arg1)
							end
							return
						end
						var163:align("Left")
						var163.hasRelocatedInOverflow = true
						-- KONSTANTWARNING: GOTO [124] #104
					end
				elseif var153_upvr then
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					if var167 < X_3 + module_upvr.getWidth(var163) + Offset_2_upvr then
						if not var7_upvw or var167 < 0 then
							if not var63_upvw then
								var63_upvw = true
								task.delay(3, module_upvr.updateBoundary, arg1)
							end
							return
						end
						var163:align("Right")
						var163.hasRelocatedInOverflow = true
					end
				end
				if true then
					var160_upvw += 1
					if var160_upvw <= 4 then
						module_upvr.updateAvailableIcons("Center")
						checkToShiftCentralIcon_upvr()
					end
				end
			end
		end
	end
	checkToShiftCentralIcon_upvr()
	if i_5 then
		var157 = i_5:getInstance("Menu")
		local var168
		local var169
		if var157 and var156 then
			local X_4 = var156.widget.AbsolutePosition.X
			if not var152_upvr or not (X_4 - Offset_2_upvr) then
			end
			var169 = var157.AbsoluteCanvasSize
			var169 = var156:getInstance("Menu").AbsoluteCanvasSize.X
			if var169 > var169.X then
			else
			end
			var169 = X_2 / 2
			local var171 = X_12 + var169
			local function INLINED_12() -- Internal function, doesn't exist in bytecode
				var169 = var171 - Offset_2_upvr / 2
				return var169
			end
			if not var152_upvr or not INLINED_12() then
				var169 = var171 + Offset_2_upvr / 2
			end
			local var172 = var169
			if true then
				var172 = X_4 + module_upvr.getWidth(var156) + Offset_2_upvr
			end
			if not var152_upvr or not (var172 - X_12) then
			end
			var168 = X_12 + X_2 - var172
		end
		if var157 then
		end
		var168 = Utility_upvr.round(var168)
		if var157 and var157:GetAttribute("MaxWidth") ~= var168 then
			var157:SetAttribute("MaxWidth", var168)
		end
	end
	for i_6 = #any_updateAvailableIcons_result1_2_upvr, 1, -1 do
		local var173 = any_updateAvailableIcons_result1_2_upvr[i_6]
		local var174 = module_upvr.getRealXPositions(arg1, any_updateAvailableIcons_result1_2_upvr)[var173.UID]
		if var152_upvr and var159 <= var174 + module_upvr.getWidth(var173) or var153_upvr and var174 <= var159 then
			local var175 = true
		end
	end
	for i_7 = #any_updateAvailableIcons_result1_2_upvr, 1, -1 do
		local var176 = any_updateAvailableIcons_result1_2_upvr[i_7]
		if not tbl_upvr_4[var176.UID] then
			if var175 and not var176.parentIconUID then
				var176:joinMenu(i_5)
			elseif not var175 and var176.parentIconUID then
				var176:leave()
			end
		end
	end
	if i_5.isEnabled ~= var175 then
		i_7 = var175
		i_5:setEnabled(i_7)
	end
	if i_5.isEnabled and not i_5.overflowAlreadyOpened then
		i_5.overflowAlreadyOpened = true
		i_5:select()
	end
end
return module_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Features.Themes
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:28
-- Luau version 6, Types version 3
-- Time taken: 0.028279 seconds

local module_upvr = {}
local Utility_upvr = require(script.Parent.Parent.Utility)
function module_upvr.getThemeValue(arg1, arg2, arg3, arg4) -- Line 16
	if arg1 then
		for _, v in pairs(arg1) do
			local unpack_result1, unpack_result2, unpack_result3_2 = unpack(v)
			if arg2 == unpack_result1 and arg3 == unpack_result2 then
				return unpack_result3_2
			end
		end
	end
	return nil
end
function module_upvr.getInstanceValue(arg1, arg2) -- Line 28
	local pcall_result1, pcall_result2 = pcall(function() -- Line 29
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		return arg1[arg2]
	end)
	if not pcall_result1 then
		pcall_result2 = arg1:GetAttribute(arg2)
	end
	return pcall_result2
end
function module_upvr.getRealInstance(arg1) -- Line 38
	if not arg1:GetAttribute("IsAClippedClone") then return end
	local OriginalInstance = arg1:FindFirstChild("OriginalInstance")
	if not OriginalInstance then return end
	return OriginalInstance.Value
end
function module_upvr.getClippedClone(arg1) -- Line 49
	if not arg1:GetAttribute("HasAClippedClone") then return end
	local ClippedClone = arg1:FindFirstChild("ClippedClone")
	if not ClippedClone then return end
	return ClippedClone.Value
end
function module_upvr.refresh(arg1, arg2, arg3) -- Line 60
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if arg3 then
		local any_getThemeValue_result1 = module_upvr.getThemeValue(arg1:getStateGroup(), arg2.Name, arg3)
		if not any_getThemeValue_result1 then
			any_getThemeValue_result1 = module_upvr.getInstanceValue(arg2, arg3)
		end
		module_upvr.apply(arg1, arg2, arg3, any_getThemeValue_result1, true)
	else
		local any_getStateGroup_result1 = arg1:getStateGroup()
		if not any_getStateGroup_result1 then return end
		local tbl = {}
		tbl[arg2.Name] = arg2
		for _, v_10 in pairs(arg2:GetDescendants()) do
			local Collective = v_10:GetAttribute("Collective")
			if Collective then
				tbl[Collective] = v_10
			end
			tbl[v_10.Name] = v_10
		end
		for _, v_11 in pairs(any_getStateGroup_result1) do
			local unpack_result1_2, unpack_result2_2, unpack_result3_3 = unpack(v_11)
			local var37 = tbl[unpack_result1_2]
			if var37 then
				module_upvr.apply(arg1, var37.Name, unpack_result2_2, unpack_result3_3, true)
			end
		end
	end
end
function module_upvr.apply(arg1, arg2, arg3, arg4, arg5) -- Line 93
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var84
	if var84 then
	else
		var84 = nil
		local var85 = arg2
		if typeof(arg2) == "Instance" then
			local tbl_4 = {}
			tbl_4[1] = arg2
			var84 = tbl_4
			var85 = arg2.Name
		else
			var84 = arg1:getInstanceOrCollective(arg2)
		end
		local var87 = arg1.customBehaviours[var85..'-'..arg3]
		for _, v_12 in pairs(var84) do
			local any_getClippedClone_result1_2 = module_upvr.getClippedClone(v_12)
			if any_getClippedClone_result1_2 then
				table.insert(var84, any_getClippedClone_result1_2)
			end
		end
		for _, v_13_upvr in pairs(var84) do
			if arg3 == "Position" and module_upvr.getClippedClone(v_13_upvr) then
				local var95
			elseif arg3 ~= "Size" or not module_upvr.getRealInstance(v_13_upvr) or arg5 or var95 ~= module_upvr.getInstanceValue(v_13_upvr, arg3) then
				if var87 then
					local var87_result1 = var87(var95, v_13_upvr, arg3)
					if var87_result1 ~= nil then
						var95 = var87_result1
						local var97_upvw = var95
					end
				end
				if not pcall(function() -- Line 139
					--[[ Upvalues[3]:
						[1]: v_13_upvr (readonly)
						[2]: arg3 (readonly)
						[3]: var97_upvw (read and write)
					]]
					v_13_upvr[arg3] = var97_upvw
				end) then
					v_13_upvr:SetAttribute(arg3, var97_upvw)
				end
			end
		end
	end
end
function module_upvr.getModifications(arg1) -- Line 153
	local var99
	if typeof(arg1[1]) ~= "table" then
		var99 = {var99}
	end
	return var99
end
function module_upvr.merge(arg1, arg2, arg3) -- Line 162
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local unpacked_value_1_3, unpacked_value_2, unpacked_value_3, unpacked_value_4_2 = table.unpack(arg2)
	local unpacked_value_1, unpacked_value_2_2, _, unpacked_value_4 = table.unpack(arg1)
	if unpacked_value_1_3 == unpacked_value_1 and unpacked_value_2 == unpacked_value_2_2 and module_upvr.statesMatch(unpacked_value_4_2, unpacked_value_4) then
		arg1[3] = unpacked_value_3
		if arg3 then
			arg3(arg1)
		end
		return true
	end
	return false
end
function module_upvr.modify(arg1, arg2, arg3) -- Line 175
	--[[ Upvalues[2]:
		[1]: Utility_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	task.spawn(function() -- Line 183
		--[[ Upvalues[5]:
			[1]: arg3 (read and write)
			[2]: Utility_upvr (copied, readonly)
			[3]: arg2 (read and write)
			[4]: module_upvr (copied, readonly)
			[5]: arg1 (readonly)
		]]
		local var114 = arg3
		if not var114 then
			var114 = Utility_upvr.generateUID()
		end
		arg3 = var114
		arg2 = module_upvr.getModifications(arg2)
		for _, v_2_upvr in pairs(arg2) do
			local unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr, unpacked_value_4_3 = table.unpack(v_2_upvr)
			if unpacked_value_4_3 == nil then
				module_upvr.modify(arg1, {unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr, "Selected"}, arg3)
				module_upvr.modify(arg1, {unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr, "Viewing"}, arg3)
			end
			local any_formatStateName_result1_upvr = Utility_upvr.formatStateName(unpacked_value_4_3 or "Deselected")
			local function _() -- Line 195, Named "nowSetIt"
				--[[ Upvalues[6]:
					[1]: any_formatStateName_result1_upvr (readonly)
					[2]: arg1 (copied, readonly)
					[3]: module_upvr (copied, readonly)
					[4]: unpacked_value_1_2_upvr (readonly)
					[5]: unpacked_value_2_3_upvr (readonly)
					[6]: unpacked_value_3_upvr (readonly)
				]]
				if any_formatStateName_result1_upvr == arg1.activeState then
					module_upvr.apply(arg1, unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr)
				end
			end
			local any_getStateGroup_result1_2_upvr = arg1:getStateGroup(any_formatStateName_result1_upvr)
			;(function() -- Line 200, Named "updateRecord"
				--[[ Upvalues[9]:
					[1]: any_getStateGroup_result1_2_upvr (readonly)
					[2]: module_upvr (copied, readonly)
					[3]: v_2_upvr (readonly)
					[4]: arg3 (copied, read and write)
					[5]: any_formatStateName_result1_upvr (readonly)
					[6]: arg1 (copied, readonly)
					[7]: unpacked_value_1_2_upvr (readonly)
					[8]: unpacked_value_2_3_upvr (readonly)
					[9]: unpacked_value_3_upvr (readonly)
				]]
				for _, v_3 in pairs(any_getStateGroup_result1_2_upvr) do
					if module_upvr.merge(v_3, v_2_upvr, function(arg1_2) -- Line 202
						--[[ Upvalues[7]:
							[1]: arg3 (copied, read and write)
							[2]: any_formatStateName_result1_upvr (copied, readonly)
							[3]: arg1 (copied, readonly)
							[4]: module_upvr (copied, readonly)
							[5]: unpacked_value_1_2_upvr (copied, readonly)
							[6]: unpacked_value_2_3_upvr (copied, readonly)
							[7]: unpacked_value_3_upvr (copied, readonly)
						]]
						arg1_2[5] = arg3
						if any_formatStateName_result1_upvr == arg1.activeState then
							module_upvr.apply(arg1, unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr)
						end
					end) then return end
				end
				local tbl_5 = {unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr, any_formatStateName_result1_upvr}
				tbl_5[5] = arg3
				table.insert(any_getStateGroup_result1_2_upvr, tbl_5)
				if any_formatStateName_result1_upvr == arg1.activeState then
					module_upvr.apply(arg1, unpacked_value_1_2_upvr, unpacked_value_2_3_upvr, unpacked_value_3_upvr)
				end
			end)()
		end
	end)
	return arg3
end
function module_upvr.remove(arg1, arg2) -- Line 220
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	for _, v_4 in pairs(arg1.appearance) do
		for i_5 = #v_4, 1, -1 do
			if v_4[i_5][5] == arg2 then
				table.remove(v_4, i_5)
			end
		end
	end
	module_upvr.rebuild(arg1)
end
function module_upvr.removeWith(arg1, arg2, arg3, arg4) -- Line 233
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	for i_6, v_5 in pairs(arg1.appearance) do
		if arg4 == i_6 or not arg4 then
			for i_7 = #v_5, 1, -1 do
				local var145 = v_5[i_7]
				if var145[1] == arg2 and var145[2] == arg3 then
					table.remove(v_5, i_7)
				end
			end
		end
	end
	module_upvr.rebuild(arg1)
end
function module_upvr.change(arg1) -- Line 249
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	for _, v_6 in pairs(arg1:getStateGroup()) do
		local unpack_result1_3, unpack_result2_3, unpack_result3 = unpack(v_6)
		module_upvr.apply(arg1, unpack_result1_3, unpack_result2_3, unpack_result3)
	end
end
function module_upvr.set(arg1, arg2) -- Line 259
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local themesJanitor = arg1.themesJanitor
	themesJanitor:clean()
	themesJanitor:add(arg1.stateChanged:Connect(function() -- Line 265
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		module_upvr.change(arg1)
	end))
	local var156
	if typeof(arg2) == "Instance" and var156:IsA("ModuleScript") then
		var156 = require(var156)
	end
	arg1.appliedTheme = var156
	module_upvr.rebuild(arg1)
end
function module_upvr.statesMatch(arg1, arg2) -- Line 275
	local var159 = arg1
	if var159 then
		var159 = string.lower(arg1)
	end
	local var160 = arg2
	if var160 then
		var160 = string.lower(arg2)
	end
	local var161 = true
	if var159 ~= var160 then
		var161 = not arg1
		if not var161 then
			var161 = not arg2
		end
	end
	return var161
end
local Default_upvr = require(script.Default)
function module_upvr.rebuild(arg1) -- Line 282
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: Utility_upvr (readonly)
		[3]: Default_upvr (readonly)
	]]
	local tbl_6_upvr = {"Deselected", "Selected", "Viewing"}
	local appliedTheme_upvr = arg1.appliedTheme
	;(function() -- Line 289, Named "generateTheme"
		--[[ Upvalues[6]:
			[1]: tbl_6_upvr (readonly)
			[2]: module_upvr (copied, readonly)
			[3]: Utility_upvr (copied, readonly)
			[4]: Default_upvr (copied, readonly)
			[5]: appliedTheme_upvr (readonly)
			[6]: arg1 (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		for _, v_7 in pairs(tbl_6_upvr) do
			local tbl_2_upvr = {}
			local function updateDetails(arg1_3, arg2) -- Line 295
				--[[ Upvalues[3]:
					[1]: module_upvr (copied, readonly)
					[2]: Utility_upvr (copied, readonly)
					[3]: tbl_2_upvr (readonly)
				]]
				if not arg1_3 then
				else
					for _, v_14 in pairs(arg1_3) do
						if module_upvr.statesMatch(arg2, v_14[4]) then
							local any_copyTable_result1 = Utility_upvr.copyTable(v_14)
							any_copyTable_result1[5] = v_14[5]
							tbl_2_upvr[v_14[1]..'-'..v_14[2]] = any_copyTable_result1
						end
					end
				end
			end
			if v_7 == "Selected" then
				updateDetails(Default_upvr, "Deselected")
			end
			updateDetails(Default_upvr, "Empty")
			updateDetails(Default_upvr, v_7)
			if appliedTheme_upvr ~= Default_upvr then
				if v_7 == "Selected" then
					updateDetails(appliedTheme_upvr, "Deselected")
				end
				updateDetails(Default_upvr, "Empty")
				updateDetails(appliedTheme_upvr, v_7)
			end
			local var199 = arg1.appearance[v_7]
			if var199 then
				for _, v_8 in pairs(var199) do
					local _5 = v_8[5]
					if _5 ~= nil then
						table.insert({}, {v_8[1], v_8[2], v_8[3], v_7, _5})
					end
				end
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			updateDetails({}, v_7)
			for _, v_9 in pairs(tbl_2_upvr) do
				table.insert({}, v_9)
				local var209
			end
			arg1.appearance[v_7] = var209
		end
		module_upvr.change(arg1)
	end)()
end
return module_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Features.Themes.Classic
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:28
-- Luau version 6, Types version 3
-- Time taken: 0.001946 seconds

return {{"Selection", "Size", UDim2.new(1, -6, 1, -5)}, {"Selection", "Position", UDim2.new(0, 3, 0, 3)}, {"Widget", "MinimumWidth", 32, "Deselected"}, {"Widget", "MinimumHeight", 32, "Deselected"}, {"Widget", "BorderSize", 0, "Deselected"}, {"IconCorners", "CornerRadius", UDim.new(0, 9), "Deselected"}, {"IconButton", "BackgroundTransparency", 0.5, "Deselected"}, {"IconLabel", "TextSize", 14, "Deselected"}, {"Dropdown", "BackgroundTransparency", 0.5, "Deselected"}, {"Notice", "Position", UDim2.new(1, -12, 0, -3), "Deselected"}, {"Notice", "Size", UDim2.new(0, 15, 0, 15), "Deselected"}, {"NoticeLabel", "TextSize", 11, "Deselected"}, {"IconSpot", "BackgroundColor3", Color3.fromRGB(0, 0, 0), "Selected"}, {"IconSpot", "BackgroundTransparency", 0.702, "Selected"}, {"IconSpotGradient", "Enabled", false, "Selected"}, {"IconOverlay", "BackgroundTransparency", 0.97, "Selected"}}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Features.Themes.Default
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:29
-- Luau version 6, Types version 3
-- Time taken: 0.004910 seconds

return {{"IconCorners", "CornerRadius", UDim.new(1, 0)}, {"Selection", "RotationSpeed", 1}, {"Selection", "Size", UDim2.new(1, 0, 1, 1)}, {"Selection", "Position", UDim2.new(0, 0, 0, 0)}, {"SelectionGradient", "Color", ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(86, 86, 86))})}, {"IconImage", "Image", "", "Deselected"}, {"IconLabel", "Text", "", "Deselected"}, {"IconLabel", "Position", UDim2.fromOffset(0, 0), "Deselected"}, {"Widget", "DesiredWidth", 44, "Deselected"}, {"Widget", "MinimumWidth", 44, "Deselected"}, {"Widget", "MinimumHeight", 44, "Deselected"}, {"Widget", "BorderSize", 4, "Deselected"}, {"IconButton", "BackgroundColor3", Color3.fromRGB(18, 18, 21), "Deselected"}, {"IconButton", "BackgroundTransparency", 0.08, "Deselected"}, {"IconImageScale", "Value", 0.5, "Deselected"}, {"IconImageCorner", "CornerRadius", UDim.new(0, 0), "Deselected"}, {"IconImage", "ImageColor3", Color3.fromRGB(255, 255, 255), "Deselected"}, {"IconImage", "ImageTransparency", 0, "Deselected"}, {"IconImageRatio", "AspectRatio", 1, "Deselected"}, {"IconLabel", "FontFace", Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), "Deselected"}, {"IconLabel", "TextSize", 16, "Deselected"}, {"IconSpot", "BackgroundTransparency", 1, "Deselected"}, {"IconOverlay", "BackgroundTransparency", 0.85, "Deselected"}, {"IconSpotGradient", "Enabled", false, "Deselected"}, {"IconGradient", "Enabled", false, "Deselected"}, {"ClickRegion", "Active", true, "Deselected"}, {"Menu", "Active", false, "Deselected"}, {"ContentsList", "HorizontalAlignment", Enum.HorizontalAlignment.Center, "Deselected"}, {"Dropdown", "BackgroundColor3", Color3.fromRGB(18, 18, 21), "Deselected"}, {"Dropdown", "BackgroundTransparency", 0.08, "Deselected"}, {"Dropdown", "MaxIcons", 4.5, "Deselected"}, {"Menu", "MaxIcons", 4, "Deselected"}, {"Notice", "Position", UDim2.new(1, -12, 0, -1), "Deselected"}, {"Notice", "Size", UDim2.new(0, 20, 0, 20), "Deselected"}, {"NoticeLabel", "TextSize", 13, "Deselected"}, {"PaddingLeft", "Size", UDim2.new(0, 9, 1, 0), "Deselected"}, {"PaddingRight", "Size", UDim2.new(0, 11, 1, 0), "Deselected"}, {"IconSpot", "BackgroundTransparency", 0.7, "Selected"}, {"IconSpot", "BackgroundColor3", Color3.fromRGB(255, 255, 255), "Selected"}, {"IconSpotGradient", "Enabled", true, "Selected"}, {"IconSpotGradient", "Rotation", 45, "Selected"}, {"IconSpotGradient", "Color", ColorSequence.new(Color3.fromRGB(96, 98, 100), Color3.fromRGB(77, 78, 80)), "Selected"}}


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Packages.GoodSignal
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:30
-- Luau version 6, Types version 3
-- Time taken: 0.007742 seconds

local var1_upvw
local function acquireRunnerThreadAndCallEventHandler_upvr(arg1, ...) -- Line 34, Named "acquireRunnerThreadAndCallEventHandler"
	--[[ Upvalues[1]:
		[1]: var1_upvw (read and write)
	]]
	var1_upvw = nil
	arg1(...)
	var1_upvw = var1_upvw
end
local function runEventHandlerInFreeThread_upvr() -- Line 45, Named "runEventHandlerInFreeThread"
	--[[ Upvalues[1]:
		[1]: acquireRunnerThreadAndCallEventHandler_upvr (readonly)
	]]
	while true do
		acquireRunnerThreadAndCallEventHandler_upvr(coroutine.yield())
	end
end
local tbl_upvr = {}
tbl_upvr.__index = tbl_upvr
local function new(arg1, arg2) -- Line 60
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local module = {
		_connected = true;
	}
	module._signal = arg1
	module._fn = arg2
	module._next = false
	return setmetatable(module, tbl_upvr)
end
tbl_upvr.new = new
function tbl_upvr.Disconnect(arg1) -- Line 69
	arg1._connected = false
	local var4
	if var4 == arg1 then
		var4 = arg1._signal
		var4._handlerListHead = arg1._next
	else
		var4 = arg1._signal._handlerListHead
		while var4 and var4._next ~= arg1 do
			var4 = var4._next
		end
		if var4 then
			var4._next = arg1._next
		end
	end
end
tbl_upvr.Destroy = tbl_upvr.Disconnect
local tbl = {}
local function __index(arg1, arg2) -- Line 92
	error("Attempt to get Connection::%s (not a valid member)":format(tostring(arg2)), 2)
end
tbl.__index = __index
local function __newindex(arg1, arg2, arg3) -- Line 95
	error("Attempt to set Connection::%s (not a valid member)":format(tostring(arg2)), 2)
end
tbl.__newindex = __newindex
setmetatable(tbl_upvr, tbl)
local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
function module_2_upvr.new() -- Line 104
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	return setmetatable({
		_handlerListHead = false;
	}, module_2_upvr)
end
function module_2_upvr.Connect(arg1, arg2) -- Line 110
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local any_new_result1 = tbl_upvr.new(arg1, arg2)
	if arg1._handlerListHead then
		any_new_result1._next = arg1._handlerListHead
		arg1._handlerListHead = any_new_result1
		return any_new_result1
	end
	arg1._handlerListHead = any_new_result1
	return any_new_result1
end
function module_2_upvr.DisconnectAll(arg1) -- Line 123
	arg1._handlerListHead = false
end
module_2_upvr.Destroy = module_2_upvr.DisconnectAll
function module_2_upvr.Fire(arg1, ...) -- Line 132
	--[[ Upvalues[2]:
		[1]: var1_upvw (read and write)
		[2]: runEventHandlerInFreeThread_upvr (readonly)
	]]
	local _handlerListHead = arg1._handlerListHead
	while _handlerListHead do
		if _handlerListHead._connected then
			if not var1_upvw then
				var1_upvw = coroutine.create(runEventHandlerInFreeThread_upvr)
				coroutine.resume(var1_upvw)
			end
			task.spawn(var1_upvw, _handlerListHead._fn, ...)
		end
	end
end
function module_2_upvr.Wait(arg1) -- Line 149
	local var11_upvw
	local current_thread_upvr = coroutine.running()
	var11_upvw = arg1:Connect(function(...) -- Line 152
		--[[ Upvalues[2]:
			[1]: var11_upvw (read and write)
			[2]: current_thread_upvr (readonly)
		]]
		var11_upvw:Disconnect()
		task.spawn(current_thread_upvr, ...)
	end)
	return coroutine.yield()
end
function module_2_upvr.Once(arg1, arg2) -- Line 161
	local var14_upvw
	var14_upvw = arg1:Connect(function(...) -- Line 163
		--[[ Upvalues[2]:
			[1]: var14_upvw (read and write)
			[2]: arg2 (readonly)
		]]
		if var14_upvw._connected then
			var14_upvw:Disconnect()
		end
		arg2(...)
	end)
	return var14_upvw
end
setmetatable(module_2_upvr, {
	__index = function(arg1, arg2) -- Line 174, Named "__index"
		error("Attempt to get Signal::%s (not a valid member)":format(tostring(arg2)), 2)
	end;
	__newindex = function(arg1, arg2, arg3) -- Line 177, Named "__newindex"
		error("Attempt to set Signal::%s (not a valid member)":format(tostring(arg2)), 2)
	end;
})
return module_2_upvr


--------------------------------------------------
-- PATH: ReplicatedStorage.Modules.Icon.Packages.Janitor
-- CLASS: ModuleScript
--------------------------------------------------
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-14 17:22:31
-- Luau version 6, Types version 3
-- Time taken: 0.017663 seconds

local function _() -- Line 26, Named "getPromiseReference"
	return false
end
local newproxy_result1_upvr = newproxy(true)
getmetatable(newproxy_result1_upvr).__tostring = function() -- Line 31
	return "IndicesReference"
end
local newproxy_result1_3_upvr = newproxy(true)
getmetatable(newproxy_result1_3_upvr).__tostring = function() -- Line 36
	return "LinkToInstanceIndex"
end
local module_upvr = {
	IGNORE_MEMORY_DEBUG = true;
	ClassName = "Janitor";
	__index = {
		CurrentlyCleaning = true;
		[newproxy_result1_upvr] = nil;
	};
}
local tbl_2_upvr = {
	["function"] = true;
	Promise = "cancel";
	RBXScriptConnection = "Disconnect";
}
function module_upvr.new() -- Line 58
	--[[ Upvalues[2]:
		[1]: newproxy_result1_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	return setmetatable({
		CurrentlyCleaning = false;
		[newproxy_result1_upvr] = nil;
	}, module_upvr)
end
function module_upvr.Is(arg1) -- Line 65
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var13 = false
	if type(arg1) == "table" then
		if getmetatable(arg1) ~= module_upvr then
			var13 = false
		else
			var13 = true
		end
	end
	return var13
end
module_upvr.is = module_upvr.Is
module_upvr.__index.Add = function(arg1, arg2, arg3, arg4) -- Line 71, Named "Add"
	--[[ Upvalues[2]:
		[1]: newproxy_result1_upvr (readonly)
		[2]: tbl_2_upvr (readonly)
	]]
	if arg4 then
		arg1:Remove(arg4)
		local var19 = arg1[newproxy_result1_upvr]
		if not var19 then
			var19 = {}
			arg1[newproxy_result1_upvr] = var19
		end
		var19[arg4] = arg2
	end
	local var20
	if var20 == "table" and string.match(tostring(arg2), "Promise") then
		var20 = "Promise"
	end
	local var21 = arg3
	if not var21 then
		var21 = tbl_2_upvr[var20]
		if not var21 then
			var21 = "Destroy"
		end
	end
	local var22 = var21
	if type(arg2) ~= "function" then
		if not arg2[var22] then
			warn(string.format("Object %s doesn't have method %s, are you sure you want to add it? Traceback: %s", tostring(arg2), tostring(var22), debug.traceback(nil, 2)))
		end
	end
	arg1[arg2] = {var22, debug.traceback("")}
	return arg2
end
module_upvr.__index.Give = module_upvr.__index.Add
module_upvr.__index.AddPromise = function(arg1, arg2) -- Line 103, Named "AddPromise"
	local var24 = false
	if var24 then
		if not var24.is(arg2) then
			error(string.format("Invalid argument #1 to 'Janitor:AddPromise' (Promise expected, got %s (%s))", typeof(arg2), tostring(arg2)))
		end
		if arg2:getStatus() == var24.Status.Started then
			local newproxy_result1 = newproxy(false)
			local any_Add_result1_2 = arg1:Add(var24.new(function(arg1_2, arg2_2, arg3) -- Line 111
				--[[ Upvalues[1]:
					[1]: arg2 (readonly)
				]]
				if arg3(function() -- Line 112
					--[[ Upvalues[1]:
						[1]: arg2 (copied, readonly)
					]]
					arg2:cancel()
				end) then
				else
					arg1_2(arg2)
				end
			end), "cancel", newproxy_result1)
			any_Add_result1_2:finallyCall(arg1.Remove, arg1, newproxy_result1)
			return any_Add_result1_2
		end
		return arg2
	end
	return arg2
end
module_upvr.__index.GivePromise = module_upvr.__index.AddPromise
module_upvr.__index.AddObject = function(arg1, arg2) -- Line 133, Named "AddObject"
	local newproxy_result1_2 = newproxy(false)
	local var30 = false
	if var30 and var30.is(arg2) then
		if arg2:getStatus() == var30.Status.Started then
			local any_Add_result1 = arg1:Add(var30.resolve(arg2), "cancel", newproxy_result1_2)
			any_Add_result1:finallyCall(arg1.Remove, arg1, newproxy_result1_2)
			return any_Add_result1, newproxy_result1_2
		end
		return arg2
	end
	return arg1:Add(arg2, false, newproxy_result1_2), newproxy_result1_2
end
module_upvr.__index.GiveObject = module_upvr.__index.AddObject
module_upvr.__index.Remove = function(arg1, arg2) -- Line 151, Named "Remove"
	--[[ Upvalues[1]:
		[1]: newproxy_result1_upvr (readonly)
	]]
	local var37 = arg1[newproxy_result1_upvr]
	if var37 then
		local var38 = var37[arg2]
		local var39
		if var38 then
			local var40 = arg1[var38]
			var39 = var40
			if var39 then
				var39 = var40[1]
			end
			if var39 then
				if var39 == true then
					var38()
				else
					local var41 = var38[var39]
					if var41 then
						var41(var38)
					end
				end
				arg1[var38] = nil
			end
			var37[arg2] = nil
		end
	end
	return arg1
end
module_upvr.__index.Get = function(arg1, arg2) -- Line 180, Named "Get"
	--[[ Upvalues[1]:
		[1]: newproxy_result1_upvr (readonly)
	]]
	local var42 = arg1[newproxy_result1_upvr]
	if var42 then
		return var42[arg2]
	end
	return nil
end
module_upvr.__index.Cleanup = function(arg1) -- Line 188, Named "Cleanup"
	--[[ Upvalues[1]:
		[1]: newproxy_result1_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [105] 86. Error Block 37 start (CF ANALYSIS FAILED)
	local var45 = arg1[newproxy_result1_upvr]
	if var45 then
		for i in next, var45 do
			var45[i] = nil
			local _
		end
		arg1[newproxy_result1_upvr] = {}
	end
	arg1.CurrentlyCleaning = false
	-- KONSTANTERROR: [105] 86. Error Block 37 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [124] 101. Error Block 28 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [124] 101. Error Block 28 end (CF ANALYSIS FAILED)
end
module_upvr.__index.Clean = module_upvr.__index.Cleanup
module_upvr.__index.Destroy = function(arg1) -- Line 244, Named "Destroy"
	arg1:Cleanup()
end
module_upvr.__call = module_upvr.__index.Cleanup
local tbl_upvr = {
	Connected = true;
}
tbl_upvr.__index = tbl_upvr
function tbl_upvr.Disconnect(arg1) -- Line 254
	if arg1.Connected then
		arg1.Connected = false
		arg1.Connection:Disconnect()
	end
end
function tbl_upvr.__tostring(arg1) -- Line 261
	return "Disconnect<"..tostring(arg1.Connected)..'>'
end
local Heartbeat_upvr = game:GetService("RunService").Heartbeat
module_upvr.__index.LinkToInstance = function(arg1, arg2, arg3) -- Line 265, Named "LinkToInstance"
	--[[ Upvalues[3]:
		[1]: newproxy_result1_3_upvr (readonly)
		[2]: tbl_upvr (readonly)
		[3]: Heartbeat_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var49_upvw
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var49_upvw = false
		return newproxy(var49_upvw)
	end
	if not arg3 or not INLINED() then
	end
	if arg2.Parent ~= nil then
		var49_upvw = false
	else
		var49_upvw = true
	end
	local setmetatable_result1_upvr = setmetatable({}, tbl_upvr)
	local var51_upvw
	var51_upvw = arg2.AncestryChanged:Connect(function(arg1_3, arg2_3) -- Line 271, Named "ChangedFunction"
		--[[ Upvalues[5]:
			[1]: setmetatable_result1_upvr (readonly)
			[2]: var49_upvw (read and write)
			[3]: Heartbeat_upvr (copied, readonly)
			[4]: var51_upvw (read and write)
			[5]: arg1 (readonly)
		]]
		local Connected = setmetatable_result1_upvr.Connected
		if Connected then
			if arg2_3 ~= nil then
				Connected = false
			else
				Connected = true
			end
			var49_upvw = Connected
			Connected = var49_upvw
			if Connected then
				Connected = coroutine.wrap
				Connected = Connected(function() -- Line 277
					--[[ Upvalues[5]:
						[1]: Heartbeat_upvr (copied, readonly)
						[2]: setmetatable_result1_upvr (copied, readonly)
						[3]: var51_upvw (copied, read and write)
						[4]: arg1 (copied, readonly)
						[5]: var49_upvw (copied, read and write)
					]]
					Heartbeat_upvr:Wait()
					if not setmetatable_result1_upvr.Connected then
					else
						if not var51_upvw.Connected then
							arg1:Cleanup()
							return
						end
						while var49_upvw and var51_upvw.Connected and setmetatable_result1_upvr.Connected do
							Heartbeat_upvr:Wait()
						end
						if setmetatable_result1_upvr.Connected and var49_upvw then
							arg1:Cleanup()
						end
					end
				end)
				Connected()
			end
		end
	end)
	local var54_upvw = var51_upvw
	setmetatable_result1_upvr.Connection = var54_upvw
	if var49_upvw and setmetatable_result1_upvr.Connected then
		if arg2.Parent ~= nil then
			var49_upvw = false
		else
			var49_upvw = true
		end
		if var49_upvw then
			coroutine.wrap(function() -- Line 277
				--[[ Upvalues[5]:
					[1]: Heartbeat_upvr (copied, readonly)
					[2]: setmetatable_result1_upvr (readonly)
					[3]: var54_upvw (read and write)
					[4]: arg1 (readonly)
					[5]: var49_upvw (read and write)
				]]
				Heartbeat_upvr:Wait()
				if not setmetatable_result1_upvr.Connected then
				else
					if not var54_upvw.Connected then
						arg1:Cleanup()
						return
					end
					while var49_upvw and var54_upvw.Connected and setmetatable_result1_upvr.Connected do
						Heartbeat_upvr:Wait()
					end
					if setmetatable_result1_upvr.Connected and var49_upvw then
						arg1:Cleanup()
					end
				end
			end)()
		end
	end
	return arg1:Add(setmetatable_result1_upvr, "Disconnect", newproxy_result1_3_upvr)
end
module_upvr.__index.LinkToInstances = function(arg1, ...) -- Line 308, Named "LinkToInstances"
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local any_new_result1 = module_upvr.new()
	for _, v in ipairs({...}) do
		any_new_result1:Add(arg1:LinkToInstance(v, true), "Disconnect")
	end
	return any_new_result1
end
for i_3, v_2 in next, module_upvr.__index do
	module_upvr.__index[string.sub(string.lower(i_3), 1, 1)..string.sub(i_3, 2)] = v_2
end
return module_upvr


