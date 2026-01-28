-- Rayfield UI 統合
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "影刃生成UI",
    LoadingTitle = "ダークファンタジー＋SF風",
    LoadingSubtitle = "剣を召喚するボタン付き",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "影刃_UI",
        FileName = "Config"
    },
    KeySystem = false
})

-- ボタンで剣生成
Window:CreateButton({
    Name = "影刃を召喚",
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")

        -- 剣本体生成
        local sword = Instance.new("Tool")
        sword.Name = "影刃"
        sword.RequiresHandle = true
        sword.CanBeDropped = true
        sword.GripForward = Vector3.new(0,0,-1)
        sword.GripPos = Vector3.new(0,-1,0)
        sword.GripRight = Vector3.new(1,0,0)
        sword.GripUp = Vector3.new(0,1,0)

        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(0.2,4,0.3)
        handle.Color = Color3.fromRGB(20,20,40) -- 黒＋少し青み
        handle.Material = Enum.Material.Metal
        handle.Reflectance = 0.3
        handle.Parent = sword

        -- 鍔装飾
        local guard = Instance.new("Part")
        guard.Name = "Guard"
        guard.Size = Vector3.new(0.8,0.3,0.5)
        guard.Color = Color3.fromRGB(40,40,60)
        guard.Material = Enum.Material.Metal
        guard.Reflectance = 0.25
        guard.Position = handle.Position + Vector3.new(0,2,0)
        guard.Parent = sword

        -- ハンドル装飾
        local gripDecor = Instance.new("CylinderMesh")
        gripDecor.Scale = Vector3.new(1,1,1)
        gripDecor.Parent = handle

        -- 龍モチーフや波紋は装飾的にMeshで表現
        local deco = Instance.new("SpecialMesh")
        deco.MeshType = Enum.MeshType.FileMesh
        deco.MeshId = "rbxassetid://11223344" -- 仮龍モチーフID
        deco.TextureId = "rbxassetid://55667788" -- 仮テクスチャID
        deco.Scale = Vector3.new(0.5,4,0.5)
        deco.Parent = handle

        -- オーラ・特殊効果
        local aura = Instance.new("PointLight")
        aura.Color = Color3.fromRGB(50,50,70)
        aura.Range = 6
        aura.Brightness = 1
        aura.Parent = handle

        -- 剣をプレイヤーに装備
        sword.Parent = player.Backpack
    end
})
