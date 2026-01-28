--[[
    影刃 (Kageba) - ダークファンタジー × 近未来SF 武器生成システム
    仕様:
    - 鏡面ブラック + 青みがかった反射
    - 刀型、波紋模様、ドラゴンモチーフ
    - 闇の気配と冷気のオーラ
    - Toolとして完全に機能
]]

-- Rayfield UI 初期化
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- サービス取得
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- メインウィンドウ
local Window = Rayfield:CreateWindow({
    Name = "影刃生成システム",
    LoadingTitle = "闇の刃を鍛造中...",
    LoadingSubtitle = "by Kageba Forge",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ShadowBladeConfig",
        FileName = "Settings"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
})

-- メインタブ
local MainTab = Window:CreateTab("武器管理", 4483362458)

-- 武器生成関数
local function CreateShadowBlade()
    -- 既存の剣を確認
    local backpack = player:FindFirstChild("Backpack")
    local char = player.Character
    if backpack then
        local existing = backpack:FindFirstChild("影刃")
        if existing then existing:Destroy() end
    end
    if char then
        local equipped = char:FindFirstChild("影刃")
        if equipped then equipped:Destroy() end
    end

    -- ツール作成
    local tool = Instance.new("Tool")
    tool.Name = "影刃"
    tool.ToolTip = "闇と冷気を纏う、圧倒的な存在感の刀"
    tool.CanBeDropped = false
    tool.RequiresHandle = false

    -- メインハンドル（剣全体の基点）
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(0.8, 5, 0.8)
    handle.Transparency = 1
    handle.CanCollide = false
    handle.Anchored = false
    handle.Massless = true
    handle.Parent = tool

    -- 剣のグリップ位置設定
    tool.GripPos = Vector3.new(0, -1.5, 0)
    tool.GripForward = Vector3.new(0, 0, -1)
    tool.GripRight = Vector3.new(1, 0, 0)
    tool.GripUp = Vector3.new(0, 1, 0)

    -- ===== 刃の部分 =====
    local blade = Instance.new("Part")
    blade.Name = "Blade"
    blade.Size = Vector3.new(0.25, 3.5, 0.05)
    blade.Material = Enum.Material.Neon
    blade.Color = Color3.fromRGB(0, 0, 0)
    blade.Reflectance = 0.8
    blade.Transparency = 0.05
    blade.CanCollide = false
    blade.Parent = tool

    local bladeMesh = Instance.new("SpecialMesh")
    bladeMesh.MeshType = Enum.MeshType.FileMesh
    bladeMesh.MeshId = "rbxassetid://1070946" -- 刀のメッシュ
    bladeMesh.Scale = Vector3.new(0.2, 2.8, 0.04)
    bladeMesh.Parent = blade

    -- 刃の表面質感（鏡面ブラック）
    local surface = Instance.new("SurfaceAppearance")
    surface.ColorMap = "rbxassetid://148992348"
    surface.MetalnessMap = "rbxassetid://148992355"
    surface.RoughnessMap = "rbxassetid://148992394"
    surface.Parent = blade

    -- ===== 波紋模様（刃文） =====
    local hamon = Instance.new("Part")
    hamon.Name = "HamonPattern"
    hamon.Size = Vector3.new(0.26, 3.5, 0.02)
    hamon.Material = Enum.Material.Neon
    hamon.Color = Color3.fromRGB(20, 50, 150)
    hamon.Transparency = 0.7
    hamon.CanCollide = false
    hamon.Parent = tool

    local hamonMesh = Instance.new("SpecialMesh")
    hamonMesh.MeshType = Enum.MeshType.Cylinder
    hamonMesh.Scale = Vector3.new(1, 14, 0.1)
    hamonMesh.Parent = hamon

    -- ===== 鍔（ツバ）ドラゴンモチーフ =====
    local guard = Instance.new("Part")
    guard.Name = "Guard"
    guard.Size = Vector3.new(1.2, 0.1, 1.2)
    guard.Material = Enum.Material.Neon
    guard.Color = Color3.fromRGB(10, 20, 40)
    guard.Reflectance = 0.4
    guard.Transparency = 0.1
    guard.CanCollide = false
    guard.Parent = tool

    local guardMesh = Instance.new("SpecialMesh")
    guardMesh.MeshType = Enum.MeshType.FileMesh
    guardMesh.MeshId = "rbxassetid://1071366" -- ドラゴン風装飾
    guardMesh.Scale = Vector3.new(0.15, 0.02, 0.15)
    guardMesh.Parent = guard

    -- ===== 柄（グリップ）黒革巻き =====
    local grip = Instance.new("Part")
    grip.Name = "Grip"
    grip.Size = Vector3.new(0.35, 1.2, 0.35)
    grip.Material = Enum.Material.Neon
    grip.Color = Color3.fromRGB(15, 15, 25)
    grip.Transparency = 0.2
    grip.CanCollide = false
    grip.Parent = tool

    local gripMesh = Instance.new("SpecialMesh")
    gripMesh.MeshType = Enum.MeshType.Cylinder
    gripMesh.Scale = Vector3.new(1, 2.4, 1)
    gripMesh.Parent = grip

    -- 柄の装飾（龍彫刻）
    local gripDeco = Instance.new("Part")
    gripDeco.Name = "GripDecoration"
    gripDeco.Size = Vector3.new(0.4, 1.2, 0.4)
    gripDeco.Material = Enum.Material.Neon
    gripDeco.Color = Color3.fromRGB(30, 40, 80)
    gripDeco.Transparency = 0.8
    gripDeco.CanCollide = false
    gripDeco.Parent = tool

    local decoMesh = Instance.new("SpecialMesh")
    decoMesh.MeshType = Enum.MeshType.FileMesh
    decoMesh.MeshId = "rbxassetid://1071115" -- 装飾メッシュ
    decoMesh.Scale = Vector3.new(0.1, 0.3, 0.1)
    decoMesh.Parent = gripDeco

    -- ===== ポメル（柄頭）丸型 =====
    local pommel = Instance.new("Part")
    pommel.Name = "Pommel"
    pommel.Shape = Enum.PartType.Ball
    pommel.Size = Vector3.new(0.5, 0.5, 0.5)
    pommel.Material = Enum.Material.Neon
    pommel.Color = Color3.fromRGB(5, 10, 30)
    pommel.Reflectance = 0.3
    pommel.CanCollide = false
    pommel.Parent = tool

    -- ===== パーツ接続（ウェルド） =====
    local function weldParts(part0, part1, cframe)
        local weld = Instance.new("Weld")
        weld.Part0 = part0
        weld.Part1 = part1
        weld.C0 = cframe
        weld.Parent = part1
        return weld
    end

    -- 基準点をhandleに設定
    weldParts(handle, blade, CFrame.new(0, 1.8, 0))
    weldParts(handle, hamon, CFrame.new(0, 1.8, 0.03))
    weldParts(handle, guard, CFrame.new(0, 0.3, 0))
    weldParts(handle, grip, CFrame.new(0, -0.6, 0) * CFrame.Angles(0, 0, math.pi/2))
    weldParts(handle, gripDeco, CFrame.new(0, -0.6, 0))
    weldParts(handle, pommel, CFrame.new(0, -1.2, 0))

    -- ===== 特殊効果 =====

    -- 闇のオーラ（黒い煙）
    local darkAura = Instance.new("ParticleEmitter")
    darkAura.Name = "DarkAura"
    darkAura.Texture = "rbxassetid://243662263"
    darkAura.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 40))
    })
    darkAura.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.2),
        NumberSequenceKeypoint.new(1, 1)
    })
    darkAura.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(0.5, 0.3),
        NumberSequenceKeypoint.new(1, 1)
    })
    darkAura.Lifetime = NumberRange.new(0.8, 1.5)
    darkAura.Rate = 20
    darkAura.Speed = NumberRange.new(0.3, 0.8)
    darkAura.Rotation = NumberRange.new(0, 360)
    darkAura.VelocityInheritance = 0.2
    darkAura.Parent = blade

    -- 青みがかった冷気
    local coldAura = Instance.new("ParticleEmitter")
    coldAura.Name = "ColdAura"
    coldAura.Texture = "rbxassetid://243483364"
    coldAura.Color = ColorSequence.new(Color3.fromRGB(100, 150, 255))
    coldAura.Size = NumberSequence.new(0.1, 0.3)
    coldAura.Transparency = NumberSequence.new(0.4, 0.8)
    coldAura.Lifetime = NumberRange.new(0.5, 1)
    coldAura.Rate = 15
    coldAura.Speed = NumberRange.new(0.2, 0.5)
    coldAura.LightEmission = 0.5
    coldAura.Parent = blade

    -- 刃の青い発光（SF的要素）
    local edgeGlow = Instance.new("PointLight")
    edgeGlow.Name = "EdgeGlow"
    edgeGlow.Color = Color3.fromRGB(50, 100, 255)
    edgeGlow.Range = 8
    edgeGlow.Brightness = 1.2
    edgeGlow.Shadows = true
    edgeGlow.Parent = blade

    -- ===== サウンド =====
    local equipSound = Instance.new("Sound")
    equipSound.Name = "EquipSound"
    equipSound.SoundId = "rbxassetid://9125326378" -- 金属音
    equipSound.Volume = 0.5
    equipSound.Parent = handle

    local slashSound = Instance.new("Sound")
    slashSound.Name = "SlashSound"
    slashSound.SoundId = "rbxassetid://9119642507" -- 風切り音
    slashSound.Volume = 0.7
    slashSound.Parent = handle

    local humSound = Instance.new("Sound")
    humSound.Name = "HumSound"
    humSound.SoundId = "rbxassetid://9125144088" -- 低い唸り
    humSound.Looped = true
    humSound.Volume = 0.3
    humSound.Parent = handle

    -- ===== ツール機能 =====
    tool.Equipped:Connect(function()
        equipSound:Play()
        humSound:Play()
        darkAura.Rate = 35
        coldAura.Rate = 25
        
        -- 装備時に青い発光を強める
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(edgeGlow, tweenInfo, {Brightness = 2.5})
        tween:Play()
    end)

    tool.Unequipped:Connect(function()
        humSound:Stop()
        darkAura.Rate = 20
        coldAura.Rate = 15
        
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(edgeGlow, tweenInfo, {Brightness = 1.2})
        tween:Play()
    end)

    tool.Activated:Connect(function()
        slashSound:Play()
        
        -- 斬撃時の光の効果
        edgeGlow.Brightness = 4
        edgeGlow.Color = Color3.fromRGB(100, 200, 255)
        
        -- 青い閃光パーティクル
        local flash = Instance.new("ParticleEmitter")
        flash.Texture = "rbxassetid://241809795"
        flash.Color = ColorSequence.new(Color3.fromRGB(100, 200, 255))
        flash.Size = NumberSequence.new(0.2)
        flash.Transparency = NumberSequence.new(0, 1)
        flash.Lifetime = NumberRange.new(0.1, 0.3)
        flash.Rate = 100
        flash.Speed = NumberRange.new(5, 10)
        flash.Parent = blade
        
        -- アニメーション再生
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://5918726674" -- 剣振りアニメーション
            local animTrack = humanoid:LoadAnimation(animation)
            animTrack:Play(0.1, 1, 1)
        end
        
        wait(0.15)
        flash:Destroy()
        
        edgeGlow.Brightness = 1.2
        edgeGlow.Color = Color3.fromRGB(50, 100, 255)
    end)

    -- ツールをバックパックに追加
    tool.Parent = player:WaitForChild("Backpack")
    
    return tool
end

-- ===== UI 要素 =====

-- 武器生成セクション
local WeaponSection = MainTab:CreateSection("影刃の生成")

-- 生成ボタン
local GenerateButton = MainTab:CreateButton({
    Name = "影刃を生成する",
    Callback = function()
        local sword = CreateShadowBlade()
        if sword then
            Rayfield:Notify({
                Title = "生成完了",
                Content = "影刃がバックパックに追加されました",
                Duration = 5,
                Image = 4483362458,
            })
        end
    end,
})

-- 剣の詳細セクション
local DetailsSection = MainTab:CreateSection("武器仕様")

-- 仕様表示
MainTab:CreateLabel("【基本情報】")
MainTab:CreateLabel("名称: 影刃 (Kageba)")
MainTab:CreateLabel("全長: 約100cm")
MainTab:CreateLabel("重量: 1.2kg (片手扱いやすい)")

MainTab:CreateLabel("【材質】")
MainTab:CreateLabel("刃: 鏡面ブラック合金")
MainTab:CreateLabel("鍔: 闇鋼合金 (ドラゴン彫刻)")
MainTab:CreateLabel("柄: 黒魔革巻き")

MainTab:CreateLabel("【特殊効果】")
MainTab:CreateLabel("• 闇のオーラ放出")
MainTab:CreateLabel("• 冷気発生")
MainTab:CreateLabel("• 青みがかった光反射")

-- 設定セクション
local SettingsSection = MainTab:CreateSection("設定")

-- エフェクト強度調整
local AuraSlider = MainTab:CreateSlider({
    Name = "オーラ強度",
    Range = {0, 100},
    Increment = 1,
    Suffix = "%",
    CurrentValue = 50,
    Flag = "AuraIntensity",
    Callback = function(value)
        -- 保存用のグローバル変数
        _G.AuraIntensity = value / 100
    end,
})

-- 発光色調整
local GlowColor = MainTab:CreateColorPicker({
    Name = "発光色",
    Color = Color3.fromRGB(50, 100, 255),
    Flag = "GlowColor",
    Callback = function(color)
        _G.GlowColor = color
    end
})

-- 通知
Rayfield:Notify({
    Title = "システム起動",
    Content = "影刃生成システムの準備が整いました",
    Duration = 5,
    Image = 4483362458,
})

-- デフォルト設定
_G.AuraIntensity = 0.5
_G.GlowColor = Color3.fromRGB(50, 100, 255)

-- システム情報
print("影刃生成システム - 起動完了")
print("バージョン: 2.0")
print("仕様: ダークファンタジー × 近未来SF")
