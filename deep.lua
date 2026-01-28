-- Rayfield UI 初期化
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "闇の剣 「影刃」 生成システム",
    LoadingTitle = "影刃システム起動中...",
    LoadingSubtitle = "闇の気配を召喚しています",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "影刃システム",
        FileName = "設定"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvite",
        RememberJoins = true
    },
    KeySystem = false,
})

-- メインページの作成
local MainTab = Window:CreateTab("メイン", 4483362458)
local MainSection = MainTab:CreateSection("影刃 召喚インターフェース")

-- 剣生成関数
local function createShadowBlade()
    -- プレイヤーの取得
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- 古い剣を削除
    for _, tool in ipairs(character:GetChildren()) do
        if tool:IsA("Tool") and tool.Name == "影刃" then
            tool:Destroy()
        end
    end
    
    -- 剣の基本Tool作成
    local sword = Instance.new("Tool")
    sword.Name = "影刃"
    sword.Parent = character
    sword.ToolTip = "闇と冷気を纏う威圧的な剣"
    sword.CanBeDropped = false
    
    -- 剣のメッシュ作成
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(0.8, 5.5, 0.8)
    handle.Material = Enum.Material.Neon
    handle.BrickColor = BrickColor.new("Really black")
    handle.Reflectance = 0.8
    handle.Transparency = 0.1
    handle.Parent = sword
    
    -- 刀身のメッシュ
    local bladeMesh = Instance.new("SpecialMesh")
    bladeMesh.MeshType = Enum.MeshType.FileMesh
    bladeMesh.MeshId = "rbxassetid://5608315931" -- 刀型メッシュ
    bladeMesh.Scale = Vector3.new(1.2, 1.5, 0.05)
    bladeMesh.VertexColor = Vector3.new(0.1, 0.2, 0.3)
    bladeMesh.Parent = handle
    
    -- 鍔（ガード）の装飾
    local guard = Instance.new("Part")
    guard.Name = "Guard"
    guard.Size = Vector3.new(2, 0.3, 2)
    guard.Position = handle.Position + Vector3.new(0, 0.5, 0)
    guard.Material = Enum.Material.Neon
    guard.BrickColor = BrickColor.new("Dark indigo")
    guard.Transparency = 0.2
    guard.Anchored = false
    guard.CanCollide = false
    guard.Parent = handle
    
    local weld = Instance.new("Weld")
    weld.Part0 = handle
    weld.Part1 = guard
    weld.C0 = CFrame.new(0, 0.5, 0)
    weld.Parent = guard
    
    -- 柄（グリップ）の装飾
    local grip = Instance.new("Part")
    grip.Name = "Grip"
    grip.Size = Vector3.new(0.9, 3, 0.9)
    grip.Material = Enum.Material.Fabric
    grip.BrickColor = BrickColor.new("Really black")
    grip.Parent = handle
    
    local gripWeld = Instance.new("Weld")
    gripWeld.Part0 = handle
    gripWeld.Part1 = grip
    gripWeld.C0 = CFrame.new(0, -1.5, 0)
    gripWeld.Parent = grip
    
    -- ポメル（柄頭）
    local pommel = Instance.new("Part")
    pommel.Name = "Pommel"
    pommel.Shape = Enum.PartType.Ball
    pommel.Size = Vector3.new(1, 1, 1)
    pommel.Material = Enum.Material.Neon
    pommel.BrickColor = BrickColor.new("Really black")
    pommel.Reflectance = 0.5
    pommel.Parent = handle
    
    local pommelWeld = Instance.new("Weld")
    pommelWeld.Part0 = handle
    pommelWeld.Part1 = pommel
    pommelWeld.C0 = CFrame.new(0, -2.8, 0)
    pommelWeld.Parent = pommel
    
    -- 特殊エフェクト
    local pointLight = Instance.new("PointLight")
    pointLight.Name = "ShadowAura"
    pointLight.Color = Color3.fromRGB(20, 60, 150)
    pointLight.Brightness = 0.5
    pointLight.Range = 10
    pointLight.Shadows = true
    pointLight.Parent = handle
    
    local particleEmitter = Instance.new("ParticleEmitter")
    particleEmitter.Name = "DarkMist"
    particleEmitter.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 20, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    })
    particleEmitter.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(1, 1.5)
    })
    particleEmitter.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.7),
        NumberSequenceKeypoint.new(1, 1)
    })
    particleEmitter.Lifetime = NumberRange.new(1, 2)
    particleEmitter.Rate = 10
    particleEmitter.Speed = NumberRange.new(0.5, 2)
    particleEmitter.Parent = handle
    
    -- 剣の質感を調整
    local surfaceAppearance = Instance.new("SurfaceAppearance")
    surfaceAppearance.Name = "MirrorFinish"
    surfaceAppearance.ColorMap = "rbxassetid://0"
    surfaceAppearance.MetalnessMap = "rbxassetid://0"
    surfaceAppearance.NormalMap = "rbxassetid://0"
    surfaceAppearance.RoughnessMap = "rbxassetid://0"
    surfaceAppearance.Parent = handle
    
    -- アニメーション用スクリプト
    local swingScript = Instance.new("Script")
    swingScript.Name = "SwingAnimation"
    swingScript.Source = [[
        local tool = script.Parent
        local handle = tool:WaitForChild("Handle")
        
        tool.Activated:Connect(function()
            -- 剣を振るアニメーション
            for i = 1, 10 do
                tool.Grip = CFrame.Angles(0, 0, math.rad(i * 5))
                wait(0.01)
            end
            for i = 10, 1, -1 do
                tool.Grip = CFrame.Angles(0, 0, math.rad(i * 5))
                wait(0.01)
            end
        end)
        
        -- 装備時エフェクト強化
        tool.Equipped:Connect(function()
            local light = handle:FindFirstChild("ShadowAura")
            if light then
                light.Brightness = 1.0
            end
        end)
        
        tool.Unequipped:Connect(function()
            local light = handle:FindFirstChild("ShadowAura")
            if light then
                light.Brightness = 0.5
            end
        end)
    ]]
    swingScript.Parent = sword
    
    -- 音響効果
    local unsheatheSound = Instance.new("Sound")
    unsheatheSound.Name = "Unsheathe"
    unsheatheSound.SoundId = "rbxassetid://9125368304" -- 金属音
    unsheatheSound.Volume = 0.7
    unsheatheSound.Parent = handle
    
    local swingSound = Instance.new("Sound")
    swingSound.Name = "Swing"
    swingSound.SoundId = "rbxassetid://9116393111" -- 風切り音
    swingSound.Volume = 0.5
    swingSound.Parent = handle
    
    -- 装備時音再生
    sword.Equipped:Connect(function()
        unsheatheSound:Play()
    end)
    
    sword.Activated:Connect(function()
        swingSound:Play()
    end)
    
    -- プレイヤーのインベントリに追加
    sword.Parent = player.Backpack
    
    Rayfield:Notify({
        Title = "影刃 召喚完了",
        Content = "闇の剣「影刃」が生成されました。バックパックを確認してください。",
        Duration = 6.5,
        Image = 4483362458,
        Actions = {
            Ignore = {
                Name = "了解"
            }
        }
    })
end

-- UIボタンの作成
MainSection:CreateButton({
    Name = "影刃を召喚する",
    Callback = function()
        createShadowBlade()
    end
})

-- 剣の説明セクション
local DescriptionSection = MainTab:CreateSection("剣の詳細仕様")
DescriptionSection:CreateLabel("基本色: 鏡面ブラック、滑らかで冷たい金属感")
DescriptionSection:CreateLabel("形状: 刀寄り、標準的な反り、シャープで直線的")
DescriptionSection:CreateLabel("刃: 先端極鋭、波紋刃文、背にも波紋刻印")
DescriptionSection:CreateLabel("鍔: 大きめ装飾的、ドラゴン・獣モチーフ")
DescriptionSection:CreateLabel("柄: 黒革巻き、龍や獣の彫刻、波紋模様反映")
DescriptionSection:CreateLabel("ポメル: シンプル丸型")
DescriptionSection:CreateLabel("重量: 標準的（片手扱いやすい）")
DescriptionSection:CreateLabel("特殊効果: 微かに闇の気配漂う")
DescriptionSection:CreateLabel("世界観: ダークファンタジー＋近未来・SF寄り")
DescriptionSection:CreateLabel("テーマ: 闇と冷気、威圧感・圧倒的な存在感")

-- クレジットセクション
local CreditsSection = MainTab:CreateSection("システム情報")
CreditsSection:CreateLabel("影刃生成システム v1.0")
CreditsSection:CreateLabel("設計: 闇の鍛冶屋")
CreditsSection:CreateLabel("特殊効果: 影魔法研究院")
CreditsSection:CreateLabel("UI統合: Rayfield Interface")

Rayfield:Notify({
    Title = "影刃システム 起動完了",
    Content = "システムは正常に起動しました。",
    Duration = 3,
    Image = 4483362458,
})
