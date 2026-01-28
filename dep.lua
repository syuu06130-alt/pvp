--[[
    『影刃』生成システム - Kageba Forge
    テーマ: ダークファンタジー × 近未来SF
    仕様: 鏡面ブラック + 青みがかった反射、波紋模様、ドラゴンモチーフ
]]

-- Rayfield UI ロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- プレイヤーサービス取得
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- メインウィンドウ作成
local Window = Rayfield:CreateWindow({
    Name = "影刃 生成システム",
    LoadingTitle = "闇の刃を鍛造中...",
    LoadingSubtitle = "Kageba Forge v2.0",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "KagebaConfig",
        FileName = "ShadowBlade"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
})

-- メインタブ作成
local MainTab = Window:CreateTab("武器管理", 4483362458)
local WeaponSection = MainTab:CreateSection("影刃の召喚")

-- 剣生成関数
local function CreateKagebaBlade()
    -- 既存の剣をチェック
    local existingTool = backpack:FindFirstChild("影刃")
    if existingTool then
        existingTool:Destroy()
        Rayfield:Notify({
            Title = "警告",
            Content = "既存の影刃を破棄しました",
            Duration = 3,
            Image = 4483362458,
        })
    end

    -- キャラクターがロードされるまで待機
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    -- ツール作成
    local tool = Instance.new("Tool")
    tool.Name = "影刃"
    tool.ToolTip = "闇と冷気を纏う、圧倒的な存在感の刀"
    tool.CanBeDropped = false
    
    -- ハンドル作成（握り部分）
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(0.5, 0.2, 0.5)
    handle.Transparency = 1
    handle.CanCollide = false
    handle.Anchored = false
    handle.Parent = tool
    
    -- グリップ設定（刀の持ち方）
    tool.GripPos = Vector3.new(0, 0, 0)
    tool.GripForward = Vector3.new(0, 0, 1)
    tool.GripRight = Vector3.new(1, 0, 0)
    tool.GripUp = Vector3.new(0, 1, 0)
    
    -- 剣のメインメッシュ作成
    local swordMesh = Instance.new("SpecialMesh")
    swordMesh.MeshId = "rbxassetid://1070946" -- 刀の基本メッシュ
    swordMesh.TextureId = "" -- テクスチャなしで色を制御
    swordMesh.Scale = Vector3.new(0.8, 1.2, 0.8)
    swordMesh.Offset = Vector3.new(0, -0.3, 0)
    swordMesh.Parent = handle
    
    -- 質感設定：鏡面ブラック + 青み
    handle.Material = Enum.Material.Neon
    handle.Color = Color3.fromRGB(5, 10, 25)
    handle.Reflectance = 0.6 -- 鏡面反射
    handle.Transparency = 0.05
    
    -- 刃の部分をより細かく設定
    local bladeDeco = Instance.new("Part")
    bladeDeco.Name = "BladeDeco"
    bladeDeco.Size = Vector3.new(0.2, 3.5, 0.05)
    bladeDeco.Transparency = 0.1
    bladeDeco.CanCollide = false
    bladeDeco.Material = Enum.Material.Neon
    bladeDeco.Color = Color3.fromRGB(0, 0, 10)
    bladeDeco.Reflectance = 0.7
    
    local bladeMesh2 = Instance.new("SpecialMesh")
    bladeMesh2.MeshType = Enum.MeshType.Wedge
    bladeMesh2.Scale = Vector3.new(1, 7, 0.2)
    bladeMesh2.Parent = bladeDeco
    
    -- 波紋模様（刃文）
    local hamonPattern = Instance.new("Part")
    hamonPattern.Name = "HamonPattern"
    hamonPattern.Size = Vector3.new(0.21, 3.4, 0.02)
    hamonPattern.Transparency = 0.7
    hamonPattern.CanCollide = false
    hamonPattern.Material = Enum.Material.Neon
    hamonPattern.Color = Color3.fromRGB(20, 40, 100)
    
    local hamonMesh = Instance.new("SpecialMesh")
    hamonMesh.MeshType = Enum.MeshType.Cylinder
    hamonMesh.Scale = Vector3.new(1, 6.8, 0.1)
    hamonMesh.Parent = hamonPattern
    
    -- 鍔（ドラゴンモチーフ）
    local guard = Instance.new("Part")
    guard.Name = "Guard"
    guard.Size = Vector3.new(1, 0.15, 1)
    guard.Transparency = 0.2
    guard.CanCollide = false
    guard.Material = Enum.Material.Neon
    guard.Color = Color3.fromRGB(15, 20, 40)
    guard.Reflectance = 0.4
    
    local guardMesh = Instance.new("SpecialMesh")
    guardMesh.MeshType = Enum.MeshType.FileMesh
    guardMesh.MeshId = "rbxassetid://1071366" -- ドラゴン風装飾
    guardMesh.Scale = Vector3.new(0.25, 0.03, 0.25)
    guardMesh.Parent = guard
    
    -- 柄（黒革巻き + 龍彫刻）
    local grip = Instance.new("Part")
    grip.Name = "Grip"
    grip.Size = Vector3.new(0.4, 1, 0.4)
    grip.Transparency = 0.3
    grip.CanCollide = false
    grip.Material = Enum.Material.Neon
    grip.Color = Color3.fromRGB(20, 20, 30)
    
    local gripMesh = Instance.new("SpecialMesh")
    gripMesh.MeshType = Enum.MeshType.Cylinder
    gripMesh.Scale = Vector3.new(1, 2, 1)
    gripMesh.Parent = grip
    
    -- 柄の装飾（龍彫刻）
    local gripDeco = Instance.new("Part")
    gripDeco.Name = "GripDecoration"
    gripDeco.Size = Vector3.new(0.42, 0.95, 0.42)
    gripDeco.Transparency = 0.8
    gripDeco.CanCollide = false
    gripDeco.Material = Enum.Material.Neon
    gripDeco.Color = Color3.fromRGB(30, 50, 80)
    
    local decoMesh = Instance.new("SpecialMesh")
    decoMesh.MeshType = Enum.MeshType.FileMesh
    decoMesh.MeshId = "rbxassetid://1071115"
    decoMesh.Scale = Vector3.new(0.15, 0.3, 0.15)
    decoMesh.Parent = gripDeco
    
    -- ポメル（丸型）
    local pommel = Instance.new("Part")
    pommel.Name = "Pommel"
    pommel.Shape = Enum.PartType.Ball
    pommel.Size = Vector3.new(0.4, 0.4, 0.4)
    pommel.Transparency = 0.1
    pommel.CanCollide = false
    pommel.Material = Enum.Material.Neon
    pommel.Color = Color3.fromRGB(10, 15, 30)
    pommel.Reflectance = 0.3
    
    -- パーツをツールの子にする
    bladeDeco.Parent = tool
    hamonPattern.Parent = tool
    guard.Parent = tool
    grip.Parent = tool
    gripDeco.Parent = tool
    pommel.Parent = tool
    
    -- パーツをウェルドで接続
    local function weldParts(part0, part1, cframe)
        local weld = Instance.new("Weld")
        weld.Part0 = part0
        weld.Part1 = part1
        weld.C0 = cframe
        weld.Parent = part1
        return weld
    end
    
    -- 接続設定
    weldParts(handle, bladeDeco, CFrame.new(0, 1.5, 0) * CFrame.Angles(0, 0, 0))
    weldParts(handle, hamonPattern, CFrame.new(0, 1.5, 0.03) * CFrame.Angles(0, 0, 0))
    weldParts(handle, guard, CFrame.new(0, 0.2, 0) * CFrame.Angles(0, 0, 0))
    weldParts(handle, grip, CFrame.new(0, -0.4, 0) * CFrame.Angles(0, 0, math.pi/2))
    weldParts(handle, gripDeco, CFrame.new(0, -0.4, 0) * CFrame.Angles(0, 0, 0))
    weldParts(handle, pommel, CFrame.new(0, -0.9, 0) * CFrame.Angles(0, 0, 0))
    
    -- ==== 特殊効果 ====
    
    -- 闇の気配（黒いオーラ）
    local darkAura = Instance.new("ParticleEmitter")
    darkAura.Name = "DarkAura"
    darkAura.Texture = "rbxassetid://243662263"
    darkAura.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 35))
    })
    darkAura.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.1),
        NumberSequenceKeypoint.new(1, 0.8)
    })
    darkAura.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.6),
        NumberSequenceKeypoint.new(0.5, 0.4),
        NumberSequenceKeypoint.new(1, 1)
    })
    darkAura.Lifetime = NumberRange.new(0.5, 1.2)
    darkAura.Rate = 15
    darkAura.Speed = NumberRange.new(0.2, 0.6)
    darkAura.Parent = bladeDeco
    
    -- 冷気エフェクト（青い粒子）
    local coldAura = Instance.new("ParticleEmitter")
    coldAura.Name = "ColdAura"
    coldAura.Texture = "rbxassetid://243483364"
    coldAura.Color = ColorSequence.new(Color3.fromRGB(80, 120, 200))
    coldAura.Size = NumberSequence.new(0.05, 0.2)
    coldAura.Transparency = NumberSequence.new(0.3, 0.8)
    coldAura.Lifetime = NumberRange.new(0.3, 0.8)
    coldAura.Rate = 12
    coldAura.Speed = NumberRange.new(0.1, 0.4)
    coldAura.LightEmission = 0.3
    coldAura.Parent = bladeDeco
    
    -- 青みがかった発光
    local bladeGlow = Instance.new("PointLight")
    bladeGlow.Name = "BladeGlow"
    bladeGlow.Color = Color3.fromRGB(40, 80, 180)
    bladeGlow.Range = 7
    bladeGlow.Brightness = 1.0
    bladeGlow.Shadows = true
    bladeGlow.Parent = bladeDeco
    
    -- 波紋の発光（SF的要素）
    local hamonGlow = Instance.new("PointLight")
    hamonGlow.Name = "HamonGlow"
    hamonGlow.Color = Color3.fromRGB(0, 100, 255)
    hamonGlow.Range = 5
    hamonGlow.Brightness = 0.8
    hamonGlow.Parent = hamonPattern
    
    -- ==== サウンドエフェクト ====
    local equipSound = Instance.new("Sound")
    equipSound.Name = "EquipSound"
    equipSound.SoundId = "rbxassetid://9125326378"
    equipSound.Volume = 0.5
    equipSound.Parent = handle
    
    local unsheatheSound = Instance.new("Sound")
    unsheatheSound.Name = "UnsheatheSound"
    unsheatheSound.SoundId = "rbxassetid://696495832"
    unsheatheSound.Volume = 0.6
    unsheatheSound.Parent = handle
    
    local slashSound = Instance.new("Sound")
    slashSound.Name = "SlashSound"
    slashSound.SoundId = "rbxassetid://9119642507"
    slashSound.Volume = 0.7
    slashSound.Parent = handle
    
    local humSound = Instance.new("Sound")
    humSound.Name = "HumSound"
    humSound.SoundId = "rbxassetid://9125144088"
    humSound.Looped = true
    humSound.Volume = 0.2
    humSound.Parent = handle
    
    -- ==== ツール機能 ====
    
    -- 装備時
    tool.Equipped:Connect(function()
        equipSound:Play()
        unsheatheSound:Play()
        humSound:Play()
        
        -- エフェクト強化
        darkAura.Rate = 25
        coldAura.Rate = 18
        bladeGlow.Brightness = 1.5
        hamonGlow.Brightness = 1.2
    end)
    
    -- 非装備時
    tool.Unequipped:Connect(function()
        humSound:Stop()
        
        -- エフェクト弱化
        darkAura.Rate = 15
        coldAura.Rate = 12
        bladeGlow.Brightness = 1.0
        hamonGlow.Brightness = 0.8
    end)
    
    -- 使用時（斬撃）
    tool.Activated:Connect(function()
        slashSound:Play()
        
        -- 斬撃時の閃光
        bladeGlow.Brightness = 3.0
        bladeGlow.Color = Color3.fromRGB(100, 150, 255)
        hamonGlow.Brightness = 2.0
        
        -- 斬撃エフェクト
        local slashEffect = Instance.new("ParticleEmitter")
        slashEffect.Texture = "rbxassetid://241809795"
        slashEffect.Color = ColorSequence.new(Color3.fromRGB(50, 120, 255))
        slashEffect.Size = NumberSequence.new(0.1, 0.3)
        slashEffect.Transparency = NumberSequence.new(0, 1)
        slashEffect.Lifetime = NumberRange.new(0.1, 0.3)
        slashEffect.Rate = 50
        slashEffect.Speed = NumberRange.new(5, 10)
        slashEffect.Parent = bladeDeco
        
        -- アニメーション再生
        if humanoid then
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://5918726674"
            local animTrack = humanoid:LoadAnimation(animation)
            animTrack:Play(0.1, 1, 1)
        end
        
        -- エフェクト解除
        wait(0.15)
        slashEffect:Destroy()
        
        -- 光を元に戻す
        bladeGlow.Brightness = 1.5
        bladeGlow.Color = Color3.fromRGB(40, 80, 180)
        hamonGlow.Brightness = 1.2
    end)
    
    -- ツールをバックパックに追加
    tool.Parent = backpack
    
    -- 通知
    Rayfield:Notify({
        Title = "影刃 召喚完了",
        Content = "闇の刃があなたのバックパックに追加されました",
        Duration = 5,
        Image = 4483362458,
        Actions = {
            Ignore = {
                Name = "了解",
                Callback = function()
                end
            },
        },
    })
    
    return tool
end

-- ==== UI 要素 ====

-- 生成ボタン
local GenerateButton = MainTab:CreateButton({
    Name = "影刃を召喚する",
    Callback = function()
        CreateKagebaBlade()
    end,
})

-- 武器情報セクション
local InfoSection = MainTab:CreateSection("武器詳細")

MainTab:CreateLabel("【影刃 - Kageba】")
MainTab:CreateLabel("基本色: 鏡面ブラック + 青み")
MainTab:CreateLabel("刃文: 波紋模様 (青い発光)")
MainTab:CreateLabel("鍔: ドラゴンモチーフ装飾")
MainTab:CreateLabel("柄: 黒革巻き + 龍彫刻")
MainTab:CreateLabel("特殊効果: 闇のオーラ + 冷気")

MainTab:CreateParagraph({
    Title = "説明",
    Content = "ダークファンタジーと近未来SFが融合した世界観の剣。鏡面ブラックの刃は青みがかった反射を持ち、波紋模様が施されている。微かに闇の気配を漂わせ、圧倒的な存在感を放つ。"
})

-- システム通知
Rayfield:Notify({
    Title = "システム起動完了",
    Content = "影刃生成システムが準備できました",
    Duration = 5,
    Image = 4483362458,
})

print("影刃生成システム - 起動完了")
print("バージョン: 2.1")
print("仕様: ダークファンタジー × 近未来SF")
