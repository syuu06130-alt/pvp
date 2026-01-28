-- Rayfield UI統合スクリプト
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "ダークファンタジー剣生成",
    LoadingTitle = "影刃生成ツール",
    LoadingSubtitle = "闇と冷気の剣",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "影刃Config"
    },
    Discord = {
       Enabled = false
    }
})

-- ボタンを作成
local Tab = Window:CreateTab("影刃", 4483362458)

Tab:CreateButton({
    Name = "影刃を出現させる",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        -- 剣の生成
        local sword = Instance.new("Tool")
        sword.Name = "影刃"
        sword.RequiresHandle = true
        sword.CanBeDropped = true

        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(0.3,5,0.7) -- 刀寄りの細長い形
        handle.Material = Enum.Material.Metal
        handle.Color = Color3.fromRGB(10,10,30) -- 黒+青み
        handle.Reflectance = 0.3 -- 光の反射
        handle.Parent = sword

        local mesh = Instance.new("SpecialMesh")
        mesh.MeshType = Enum.MeshType.FileMesh
        -- ここでは簡易的にBlade寄せの楕円形
        mesh.MeshId = "http://www.roblox.com/asset/?id=1234567890" -- 任意でカスタムメッシュに置き換え可能
        mesh.Scale = Vector3.new(0.2,5,0.7)
        mesh.Parent = handle

        -- 刃文・装飾の雰囲気（波紋）
        local decal = Instance.new("Decal")
        decal.Texture = "http://www.roblox.com/asset/?id=9876543210" -- 波紋テクスチャを用意
        decal.Face = Enum.NormalId.Top
        decal.Parent = handle

        -- 鍔（Guard）表現
        local guard = Instance.new("Part")
        guard.Name = "Guard"
        guard.Size = Vector3.new(1,0.3,1)
        guard.Material = Enum.Material.Metal
        guard.Color = Color3.fromRGB(20,20,40)
        guard.Reflectance = 0.4
        guard.Anchored = false
        guard.CanCollide = false
        guard.Position = handle.Position + Vector3.new(0,2.4,0)
        guard.Parent = sword

        -- 柄（グリップ）
        local grip = Instance.new("Part")
        grip.Name = "Grip"
        grip.Size = Vector3.new(0.3,1.5,0.3)
        grip.Material = Enum.Material.SmoothPlastic
        grip.Color = Color3.fromRGB(15,15,15)
        grip.Parent = sword

        -- ToolのHandle設定
        sword.Handle = handle

        -- 剣をプレイヤーに追加
        sword.Parent = player.Backpack

        -- 特殊オーラ演出
        local aura = Instance.new("ParticleEmitter")
        aura.Texture = "http://www.roblox.com/asset/?id=1122334455" -- 闇の気配を表現するパーティクル
        aura.Rate = 3
        aura.Lifetime = NumberRange.new(0.5,1.5)
        aura.Speed = NumberRange.new(0)
        aura.LightEmission = 0.5
        aura.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5), NumberSequenceKeypoint.new(1,0)})
        aura.Parent = handle

        -- 装備したら少し光る演出
        handle.Touched:Connect(function(hit)
            if hit.Parent:FindFirstChild("Humanoid") then
                handle.Color = Color3.fromRGB(20,20,50)
                wait(0.2)
                handle.Color = Color3.fromRGB(10,10,30)
            end
        end)
    end
})
