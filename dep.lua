--[[
    『影刃』生成システム - 闇の降臨
    テーマ: ダークファンタジー × 近未来SF
    仕様: 完全な黒い剣 + 縦振りアニメーション + 降臨エフェクト
]]

-- Rayfield UI ロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- サービス取得
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- メインウィンドウ作成
local Window = Rayfield:CreateWindow({
    Name = "影刃 召喚システム",
    LoadingTitle = "闇の降臨を準備中...",
    LoadingSubtitle = "Kageba Forge v3.0",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "KagebaConfig",
        FileName = "ShadowBladeV3"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
})

-- メインタブ作成
local MainTab = Window:CreateTab("闇の武器庫", 4483362458)
local WeaponSection = MainTab:CreateSection("影刃の召喚")

-- 剣生成関数
local function CreateKagebaBlade()
    -- 既存の剣をチェック
    local existingTool = backpack:FindFirstChild("影刃")
    if existingTool then
        existingTool:Destroy()
        Rayfield:Notify({
            Title = "更新",
            Content = "既存の影刃を強化しました",
            Duration = 3,
            Image = 4483362458,
        })
    end

    -- キャラクターがロードされるまで待機
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    -- 攻撃状態変数
    local da = false
    local db = true
    
    -- ツール作成
    local tool = Instance.new("Tool")
    tool.Name = "影刃"
    tool.ToolTip = "闇より降臨する、圧倒的な存在感の刀"
    tool.CanBeDropped = false
    
    -- ハンドル作成
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(1, 0.8, 4)
    handle.Transparency = 0.8  -- 半透明で目立たなく
    handle.CanCollide = false
    handle.Anchored = false
    handle.Parent = tool
    
    -- グリップ設定 - 縦持ち用
    tool.GripPos = Vector3.new(0, 0, -1.5)
    tool.GripForward = Vector3.new(0, -1, 0)
    tool.GripRight = Vector3.new(1, 0, 0)
    tool.GripUp = Vector3.new(0, 0, 1)
    
    -- ==== 新しい剣のデザイン ====
    
    -- メインブレード（完全な黒）
    local mainBlade = Instance.new("Part")
    mainBlade.Name = "MainBlade"
    mainBlade.Size = Vector3.new(0.25, 4, 0.05)
    mainBlade.Material = Enum.Material.Neon
    mainBlade.Color = Color3.fromRGB(0, 0, 0)
    mainBlade.Reflectance = 0.7
    mainBlade.Transparency = 0.05
    mainBlade.CanCollide = false
    mainBlade.Parent = tool
    
    local bladeMesh = Instance.new("SpecialMesh")
    bladeMesh.MeshType = Enum.MeshType.Wedge
    bladeMesh.Scale = Vector3.new(1, 8, 0.2)
    bladeMesh.Offset = Vector3.new(0, 0, 0)
    bladeMesh.Parent = mainBlade
    
    -- 鋭い先端
    local bladeTip = Instance.new("WedgePart")
    bladeTip.Name = "BladeTip"
    bladeTip.Size = Vector3.new(0.25, 0.3, 0.05)
    bladeTip.Material = Enum.Material.Neon
    bladeTip.Color = Color3.fromRGB(0, 0, 0)
    bladeTip.Reflectance = 0.8
    bladeTip.CanCollide = false
    bladeTip.Parent = tool
    
    -- 波紋模様（青みを帯びた黒）
    local hamonPattern = Instance.new("Part")
    hamonPattern.Name = "HamonPattern"
    hamonPattern.Size = Vector3.new(0.26, 4, 0.02)
    hamonPattern.Material = Enum.Material.Neon
    hamonPattern.Color = Color3.fromRGB(5, 10, 30)
    hamonPattern.Transparency = 0.6
    hamonPattern.CanCollide = false
    hamonPattern.Parent = tool
    
    local hamonMesh = Instance.new("SpecialMesh")
    hamonMesh.MeshType = Enum.MeshType.Cylinder
    hamonMesh.Scale = Vector3.new(1, 8, 0.1)
    hamonMesh.Parent = hamonPattern
    
    -- 鍔（ドラゴンモチーフ、黒装飾）
    local guard = Instance.new("Part")
    guard.Name = "Guard"
    guard.Size = Vector3.new(1.2, 0.1, 1.2)
    guard.Material = Enum.Material.Neon
    guard.Color = Color3.fromRGB(0, 0, 0)
    guard.Reflectance = 0.5
    guard.Transparency = 0.1
    guard.CanCollide = false
    guard.Parent = tool
    
    local guardMesh = Instance.new("SpecialMesh")
    guardMesh.MeshType = Enum.MeshType.FileMesh
    guardMesh.MeshId = "rbxassetid://1071366"
    guardMesh.Scale = Vector3.new(0.2, 0.02, 0.2)
    guardMesh.Parent = guard
    
    -- 柄（黒革巻き）
    local grip = Instance.new("Part")
    grip.Name = "Grip"
    grip.Size = Vector3.new(0.4, 1, 0.4)
    grip.Material = Enum.Material.Neon
    grip.Color = Color3.fromRGB(10, 10, 15)
    grip.Transparency = 0.2
    grip.CanCollide = false
    grip.Parent = tool
    
    local gripMesh = Instance.new("SpecialMesh")
    gripMesh.MeshType = Enum.MeshType.Cylinder
    gripMesh.Scale = Vector3.new(1, 2, 1)
    gripMesh.Parent = grip
    
    -- 柄の装飾（龍彫刻、黒）
    local gripDeco = Instance.new("Part")
    gripDeco.Name = "GripDecoration"
    gripDeco.Size = Vector3.new(0.42, 0.95, 0.42)
    gripDeco.Material = Enum.Material.Neon
    gripDeco.Color = Color3.fromRGB(15, 20, 30)
    gripDeco.Transparency = 0.7
    gripDeco.CanCollide = false
    gripDeco.Parent = tool
    
    local decoMesh = Instance.new("SpecialMesh")
    decoMesh.MeshType = Enum.MeshType.FileMesh
    decoMesh.MeshId = "rbxassetid://1071115"
    decoMesh.Scale = Vector3.new(0.12, 0.25, 0.12)
    decoMesh.Parent = gripDeco
    
    -- ポメル（丸型、黒）
    local pommel = Instance.new("Part")
    pommel.Name = "Pommel"
    pommel.Shape = Enum.PartType.Ball
    pommel.Size = Vector3.new(0.5, 0.5, 0.5)
    pommel.Material = Enum.Material.Neon
    pommel.Color = Color3.fromRGB(5, 5, 10)
    pommel.Reflectance = 0.4
    pommel.CanCollide = false
    pommel.Parent = tool
    
    -- パーツ接続
    local function weldParts(part0, part1, cframe)
        local weld = Instance.new("Weld")
        weld.Part0 = part0
        weld.Part1 = part1
        weld.C0 = cframe
        weld.Parent = part1
        return weld
    end
    
    -- 接続設定
    weldParts(handle, mainBlade, CFrame.new(0, 1.8, 0))
    weldParts(handle, bladeTip, CFrame.new(0, 3.9, 0))
    weldParts(handle, hamonPattern, CFrame.new(0, 1.8, 0.03))
    weldParts(handle, guard, CFrame.new(0, 0.3, 0))
    weldParts(handle, grip, CFrame.new(0, -0.6, 0) * CFrame.Angles(0, 0, math.pi/2))
    weldParts(handle, gripDeco, CFrame.new(0, -0.6, 0))
    weldParts(handle, pommel, CFrame.new(0, -1.1, 0))
    
    -- ==== 特殊効果（黒いオーラ）====
    
    -- 闇のオーラ（完全な黒）
    local darkAura = Instance.new("ParticleEmitter")
    darkAura.Name = "DarkAura"
    darkAura.Texture = "rbxassetid://243662263"
    darkAura.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 10))
    })
    darkAura.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.1),
        NumberSequenceKeypoint.new(1, 1.2)
    })
    darkAura.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(0.5, 0.3),
        NumberSequenceKeypoint.new(1, 1)
    })
    darkAura.Lifetime = NumberRange.new(0.7, 1.5)
    darkAura.Rate = 18
    darkAura.Speed = NumberRange.new(0.2, 0.5)
    darkAura.Rotation = NumberRange.new(0, 360)
    darkAura.VelocityInheritance = 0.1
    darkAura.Parent = mainBlade
    
    -- 冷気（黒い霧）
    local coldMist = Instance.new("ParticleEmitter")
    coldMist.Name = "ColdMist"
    coldMist.Texture = "rbxassetid://243483364"
    coldMist.Color = ColorSequence.new(Color3.fromRGB(10, 15, 30))
    coldMist.Size = NumberSequence.new(0.05, 0.3)
    coldMist.Transparency = NumberSequence.new(0.4, 0.9)
    coldMist.Lifetime = NumberRange.new(0.4, 1.0)
    coldMist.Rate = 12
    coldMist.Speed = NumberRange.new(0.1, 0.4)
    coldMist.LightEmission = 0.1
    coldMist.Parent = mainBlade
    
    -- 微かな黒い発光
    local darkGlow = Instance.new("PointLight")
    darkGlow.Name = "DarkGlow"
    darkGlow.Color = Color3.fromRGB(5, 10, 20)
    darkGlow.Range = 6
    darkGlow.Brightness = 0.8
    darkGlow.Shadows = true
    darkGlow.Parent = mainBlade
    
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
    
    local darkHumSound = Instance.new("Sound")
    darkHumSound.Name = "DarkHumSound"
    darkHumSound.SoundId = "rbxassetid://9125144088"
    darkHumSound.Looped = true
    darkHumSound.Volume = 0.15
    darkHumSound.Parent = handle
    
    -- ==== 降臨エフェクト用のオブジェクト ====
    local descentEffect = Instance.new("Part")
    descentEffect.Name = "DescentEffect"
    descentEffect.Size = Vector3.new(5, 0.1, 5)
    descentEffect.Transparency = 1
    descentEffect.Anchored = true
    descentEffect.CanCollide = false
    descentEffect.Parent = workspace
    
    local descentAura = Instance.new("ParticleEmitter")
    descentAura.Texture = "rbxassetid://243662263"
    descentAura.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
    descentAura.Size = NumberSequence.new(2, 5)
    descentAura.Transparency = NumberSequence.new(0.3, 1)
    descentAura.Lifetime = NumberRange.new(1, 2)
    descentAura.Rate = 50
    descentAura.Speed = NumberRange.new(0, 1)
    descentAura.SpreadAngle = Vector2.new(0, 360)
    descentAura.Parent = descentEffect
    
    local darkRays = Instance.new("Part")
    darkRays.Name = "DarkRays"
    darkRays.Size = Vector3.new(10, 10, 10)
    darkRays.Transparency = 1
    darkRays.Anchored = true
    darkRays.CanCollide = false
    darkRays.Parent = workspace
    
    local rayEmitter = Instance.new("ParticleEmitter")
    rayEmitter.Texture = "rbxassetid://243483372"
    rayEmitter.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
    rayEmitter.Size = NumberSequence.new(0.5, 2)
    rayEmitter.Transparency = NumberSequence.new(0.2, 1)
    rayEmitter.Lifetime = NumberRange.new(0.5, 1)
    rayEmitter.Rate = 30
    rayEmitter.Speed = NumberRange.new(5, 15)
    rayEmitter.VelocitySpread = 180
    rayEmitter.Parent = darkRays
    
    -- ==== 縦振りアニメーション ====
    local verticalSwingAnim = Instance.new("Animation")
    verticalSwingAnim.Name = "VerticalSwing"
    verticalSwingAnim.AnimationId = "rbxassetid://5918726674"
    
    local descentAnim = Instance.new("Animation")
    descentAnim.Name = "DescentAnimation"
    descentAnim.AnimationId = "rbxassetid://10785333347" -- 降臨アニメーション
    
    -- ==== ツール機能 ====
    
    -- 降臨エフェクト関数
    local function playDescentEffect()
        if character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local position = hrp.Position + Vector3.new(0, 20, 0)
            
            -- エフェクト位置設定
            descentEffect.Position = position + Vector3.new(0, -10, 0)
            darkRays.Position = position
            
            -- エフェクト有効化
            descentAura.Enabled = true
            rayEmitter.Enabled = true
            
            -- 階段状に降りてくるアニメーション
            local animTrack = humanoid:LoadAnimation(descentAnim)
            animTrack:Play()
            
            -- エフェクトのフェードアウト
            task.wait(2)
            descentAura.Enabled = false
            rayEmitter.Enabled = false
            
            -- エフェクトオブジェクト削除
            task.wait(1)
            descentEffect:Destroy()
            darkRays:Destroy()
        end
    end
    
    -- 装備時（降臨エフェクト発動）
    tool.Equipped:Connect(function()
        equipSound:Play()
        unsheatheSound:Play()
        darkHumSound:Play()
        
        -- 降臨エフェクト再生
        playDescentEffect()
        
        -- エフェクト強化
        darkAura.Rate = 25
        coldMist.Rate = 20
        darkGlow.Brightness = 1.2
        
        -- アクティベートイベント
        tool.Activated:Connect(function()
            if db == true then
                db = false
                slashSound:Play()
                
                -- 縦振りアニメーション再生
                local animTrack = humanoid:LoadAnimation(verticalSwingAnim)
                animTrack:Play(0.1, 1, 1)
                
                -- 斬撃エフェクト（黒い閃光）
                darkGlow.Brightness = 2.5
                darkGlow.Color = Color3.fromRGB(10, 20, 40)
                
                local slashEffect = Instance.new("ParticleEmitter")
                slashEffect.Texture = "rbxassetid://241809795"
                slashEffect.Color = ColorSequence.new(Color3.fromRGB(0, 0, 10))
                slashEffect.Size = NumberSequence.new(0.1, 0.4)
                slashEffect.Transparency = NumberSequence.new(0, 1)
                slashEffect.Lifetime = NumberRange.new(0.1, 0.3)
                slashEffect.Rate = 60
                slashEffect.Speed = NumberRange.new(8, 15)
                slashEffect.Parent = mainBlade
                
                da = true
                db = true
                
                -- エフェクト解除
                task.wait(0.2)
                slashEffect:Destroy()
                darkGlow.Brightness = 1.2
                darkGlow.Color = Color3.fromRGB(5, 10, 20)
                
                task.wait(1.8)
                da = false
                animTrack:Stop()
            end
        end)
    end)
    
    -- 非装備時
    tool.Unequipped:Connect(function()
        darkHumSound:Stop()
        
        -- エフェクト弱化
        darkAura.Rate = 18
        coldMist.Rate = 12
        darkGlow.Brightness = 0.8
    end)
    
    -- ヒット処理
    handle.Touched:Connect(function(n)
        if da == true then
            local o = n.Parent:FindFirstChild("Humanoid")
            if o ~= nil then
                local p = Players:FindFirstChild(n.Parent.Name)
                if p and p ~= player then
                    -- ヒットエフェクト
                    local hitEffect = Instance.new("ParticleEmitter")
                    hitEffect.Texture = "rbxassetid://243662263"
                    hitEffect.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
                    hitEffect.Size = NumberSequence.new(0.5, 1)
                    hitEffect.Transparency = NumberSequence.new(0, 1)
                    hitEffect.Lifetime = NumberRange.new(0.3, 0.6)
                    hitEffect.Rate = 20
                    hitEffect.Speed = NumberRange.new(2, 5)
                    hitEffect.Parent = mainBlade
                    
                    task.wait(0.1)
                    hitEffect:Destroy()
                end
            end
        end
    end)
    
    -- ツールをバックパックに追加
    tool.Parent = backpack
    
    -- 通知
    Rayfield:Notify({
        Title = "影刃 降臨完了",
        Content = "闇より影刃が降り立ちました",
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

-- 追加機能タブ
local EffectsTab = Window:CreateTab("特殊効果", 4483362458)
local EffectsSection = EffectsTab:CreateSection("降臨エフェクト設定")

-- オーラ強度調整
local AuraIntensitySlider = EffectsTab:CreateSlider({
    Name = "闇オーラ強度",
    Range = {0, 100},
    Increment = 1,
    Suffix = "%",
    CurrentValue = 50,
    Flag = "DarkAuraIntensity",
    Callback = function(value)
        _G.DarkAuraIntensity = value / 100
    end,
})

-- 降臨エフェクトオン/オフ
local DescentEffectToggle = EffectsTab:CreateToggle({
    Name = "降臨エフェクト",
    CurrentValue = true,
    Flag = "DescentEffectEnabled",
    Callback = function(value)
        _G.DescentEffectEnabled = value
    end,
})

-- 縦振りアニメーション強度
local SwingIntensitySlider = EffectsTab:CreateSlider({
    Name = "斬撃強度",
    Range = {50, 200},
    Increment = 10,
    Suffix = "%",
    CurrentValue = 100,
    Flag = "SwingIntensity",
    Callback = function(value)
        _G.SwingIntensity = value / 100
    end,
})

-- デフォルト設定
_G.DarkAuraIntensity = 0.5
_G.DescentEffectEnabled = true
_G.SwingIntensity = 1.0

-- ==== UI 要素 ====

-- 生成ボタン
local GenerateButton = MainTab:CreateButton({
    Name = "影刃を降臨させる",
    Callback = function()
        CreateKagebaBlade()
    end,
})

-- 武器情報セクション
local InfoSection = MainTab:CreateSection("影刃 - 闇の降臨")

MainTab:CreateLabel("【完全な闇の剣】")
MainTab:CreateLabel("基本色: 真っ黒 + 微かな青み")
MainTab:CreateLabel("質感: 鏡面ブラック")
MainTab:CreateLabel("刃文: 黒い波紋模様")
MainTab:CreateLabel("鍔: ドラゴン・獣モチーフ（黒）")
MainTab:CreateLabel("柄: 黒革巻き + 龍彫刻")

MainTab:CreateParagraph({
    Title = "新機能",
    Content = "・完全な黒い剣デザイン\n・縦振り専用アニメーション\n・上からの降臨エフェクト\n・黒いオーラと背景エフェクト"
})

-- システム通知
Rayfield:Notify({
    Title = "闇の降臨システム 起動",
    Content = "影刃召喚システムが準備完了しました\n完全な闇の剣が降臨します",
    Duration = 5,
    Image = 4483362458,
})

print("影刃生成システム - 闇の降臨バージョン")
print("バージョン: 3.0")
print("特徴: 完全な黒 + 縦振りアニメーション + 降臨エフェクト")
