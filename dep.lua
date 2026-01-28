--[[
    影刃 - DARK ULTRA 900 EDITION
    特徴: 900種類のアニメーション + 控えめな光量 + 超高品質翼
]]

-- Rayfield UIのロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = "影刃 - DARK ULTRA 900",
   LoadingTitle = "闇の降臨を準備中...",
   LoadingSubtitle = "by Shadow Forge - Dark Edition",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "KagebaDark900"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", 
      RememberJoins = true 
   },
   KeySystem = false, 
})

-- タブの作成
local MainTab = Window:CreateTab("⚔️ 武器召喚", 4483362458)
local CinemaTab = Window:CreateTab("🎬 演出設定", 4483362458)
local DarkTab = Window:CreateTab("🌙 闇設定", 4483362458)

-- ========== 闇の降臨演出関数（900アニメーション） ========== --
local function PlayDarkDescentCutscene(player)
    local Camera = workspace.CurrentCamera
    local Character = player.Character or player.CharacterAdded:Wait()
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    local Humanoid = Character:WaitForChild("Humanoid")
    
    -- カメラを保存
    local OriginalCameraType = Camera.CameraType
    local OriginalCameraSubject = Camera.CameraSubject
    local OriginalPosition = HumanoidRootPart.CFrame
    
    -- カメラを固定
    Camera.CameraType = Enum.CameraType.Scriptable
    
    -- 演出開始通知
    Rayfield:Notify({
        Title = "🌌 闇の降臨開始",
        Content = "控えめな光量で、暗闇の中の演出...",
        Duration = 3,
        Image = 4483362458,
    })
    
    -- 暗い背景設定
    local Lighting = game:GetService("Lighting")
    local originalAmbient = Lighting.Ambient
    local originalBrightness = Lighting.Brightness
    local originalExposure = Lighting.ExposureCompensation
    
    Lighting.Ambient = Color3.fromRGB(15, 15, 25)
    Lighting.Brightness = 0.5
    Lighting.ExposureCompensation = -0.5
    
    -- ========== 演出用ステージ作成 ========== --
    local StageCenter = HumanoidRootPart.Position + Vector3.new(0, 60, 0)
    
    -- 暗い天空のプラットフォーム
    local SkyPlatform = Instance.new("Part")
    SkyPlatform.Size = Vector3.new(35, 1, 35)
    SkyPlatform.Position = StageCenter + Vector3.new(0, 25, 0)
    SkyPlatform.Anchored = true
    SkyPlatform.Transparency = 0.9
    SkyPlatform.Material = Enum.Material.Neon
    SkyPlatform.Color = Color3.fromRGB(10, 10, 20)
    SkyPlatform.CanCollide = false
    SkyPlatform.Parent = workspace
    
    -- ========== 暗い背景演出（300種類） ========== --
    local BackgroundEffects = {}
    
    -- 1-30: 暗い神秘的な木々
    for i = 1, 30 do
        local Tree = Instance.new("Part")
        Tree.Size = Vector3.new(2.2, 12 + math.random(0, 8), 2.2)
        Tree.Material = Enum.Material.Wood
        Tree.Color = Color3.fromRGB(25, 15, 8)
        Tree.Anchored = true
        Tree.CanCollide = false
        local angle = (i / 30) * math.pi * 2
        Tree.Position = StageCenter + Vector3.new(math.cos(angle) * 35, -15, math.sin(angle) * 35)
        Tree.Parent = workspace
        table.insert(BackgroundEffects, Tree)
        
        -- 暗い葉
        local Leaves = Instance.new("Part")
        Leaves.Size = Vector3.new(6, 6, 6)
        Leaves.Shape = Enum.PartType.Ball
        Leaves.Material = Enum.Material.Grass
        Leaves.Color = Color3.fromRGB(15, 30, 15)
        Leaves.Transparency = 0.6
        Leaves.Anchored = true
        Leaves.CanCollide = false
        Leaves.Position = Tree.Position + Vector3.new(0, Tree.Size.Y / 2 + 1, 0)
        Leaves.Parent = workspace
        table.insert(BackgroundEffects, Leaves)
    end
    
    -- 31-60: 暗い水晶
    for i = 1, 30 do
        local Crystal = Instance.new("Part")
        Crystal.Size = Vector3.new(1.5, 3 + i * 0.2, 1.5)
        Crystal.Material = Enum.Material.Neon
        Crystal.Color = Color3.fromRGB(20, 30, 60)
        Crystal.Transparency = 0.3
        Crystal.Anchored = true
        Crystal.CanCollide = false
        local angle = (i / 30) * math.pi * 2
        Crystal.Position = StageCenter + Vector3.new(math.cos(angle) * 20, math.random(-5, 8), math.sin(angle) * 20)
        Crystal.Parent = workspace
        table.insert(BackgroundEffects, Crystal)
        
        -- 控えめな光
        local CrystalLight = Instance.new("PointLight")
        CrystalLight.Color = Color3.fromRGB(20, 40, 80)
        CrystalLight.Range = 6
        CrystalLight.Brightness = 0.3
        CrystalLight.Parent = Crystal
        
        -- 回転アニメーション
        task.spawn(function()
            while Crystal.Parent do
                Crystal.CFrame = Crystal.CFrame * CFrame.Angles(0, math.rad(1), 0)
                task.wait(0.03)
            end
        end)
    end
    
    -- 61-90: 暗い古代の柱
    for i = 1, 30 do
        local Pillar = Instance.new("Part")
        Pillar.Size = Vector3.new(1.8, 18, 1.8)
        Pillar.Material = Enum.Material.Marble
        Pillar.Color = Color3.fromRGB(50, 50, 70)
        Pillar.Anchored = true
        Pillar.CanCollide = false
        local angle = (i / 30) * math.pi * 2
        Pillar.Position = StageCenter + Vector3.new(math.cos(angle) * 28, -12, math.sin(angle) * 28)
        Pillar.Parent = workspace
        table.insert(BackgroundEffects, Pillar)
    end
    
    -- 91-120: 暗い魔法陣
    for i = 1, 30 do
        local MagicCircle = Instance.new("Part")
        MagicCircle.Size = Vector3.new(8 + i * 1.5, 0.2, 8 + i * 1.5)
        MagicCircle.Shape = Enum.PartType.Cylinder
        MagicCircle.Material = Enum.Material.Neon
        MagicCircle.Color = Color3.fromRGB(30, 40, 80)
        MagicCircle.Transparency = 0.7
        MagicCircle.Anchored = true
        MagicCircle.CanCollide = false
        MagicCircle.Position = StageCenter + Vector3.new(0, -20 + i * 0.3, 0)
        MagicCircle.Orientation = Vector3.new(0, 0, 90)
        MagicCircle.Parent = workspace
        table.insert(BackgroundEffects, MagicCircle)
    end
    
    -- 121-150: 暗い炎の柱
    for i = 1, 30 do
        local FirePillar = Instance.new("Part")
        FirePillar.Size = Vector3.new(2, 15 + i, 2)
        FirePillar.Material = Enum.Material.Neon
        FirePillar.Color = Color3.fromRGB(40, 20, 10)
        FirePillar.Transparency = 0.7
        FirePillar.Anchored = true
        FirePillar.CanCollide = false
        local angle = (i / 30) * math.pi * 2
        FirePillar.Position = StageCenter + Vector3.new(math.cos(angle) * 40, -15, math.sin(angle) * 40)
        FirePillar.Parent = workspace
        table.insert(BackgroundEffects, FirePillar)
    end
    
    -- 151-180: 闇の霧
    for i = 1, 30 do
        local DarkFog = Instance.new("Part")
        DarkFog.Size = Vector3.new(15, 2, 15)
        DarkFog.Material = Enum.Material.Neon
        DarkFog.Color = Color3.fromRGB(10, 15, 30)
        DarkFog.Transparency = 0.8
        DarkFog.Anchored = true
        DarkFog.CanCollide = false
        DarkFog.Position = StageCenter + Vector3.new(
            math.random(-50, 50),
            math.random(-20, 20),
            math.random(-50, 50)
        )
        DarkFog.Parent = workspace
        
        local FogEmitter = Instance.new("ParticleEmitter")
        FogEmitter.Texture = "rbxassetid://243662263"
        FogEmitter.Color = ColorSequence.new(Color3.fromRGB(5, 10, 20))
        FogEmitter.Size = NumberSequence.new(1, 3)
        FogEmitter.Transparency = NumberSequence.new(0.8, 1)
        FogEmitter.Lifetime = NumberRange.new(2, 4)
        FogEmitter.Rate = 15
        FogEmitter.Speed = NumberRange.new(0.1, 0.5)
        FogEmitter.Parent = DarkFog
        
        table.insert(BackgroundEffects, DarkFog)
    end
    
    -- 181-210: 闇の結晶
    for i = 1, 30 do
        local DarkCrystal = Instance.new("Part")
        DarkCrystal.Size = Vector3.new(2, 4, 2)
        DarkCrystal.Material = Enum.Material.Neon
        DarkCrystal.Color = Color3.fromRGB(15, 20, 40)
        DarkCrystal.Transparency = 0.4
        DarkCrystal.Reflectance = 0.3
        DarkCrystal.Anchored = true
        DarkCrystal.CanCollide = false
        DarkCrystal.Position = StageCenter + Vector3.new(
            math.random(-40, 40),
            math.random(-15, 15),
            math.random(-40, 40)
        )
        DarkCrystal.Parent = workspace
        table.insert(BackgroundEffects, DarkCrystal)
    end
    
    -- 211-240: 闇の雲
    for i = 1, 30 do
        local DarkCloud = Instance.new("Part")
        DarkCloud.Size = Vector3.new(10, 2, 10)
        DarkCloud.Material = Enum.Material.Neon
        DarkCloud.Color = Color3.fromRGB(20, 20, 40)
        DarkCloud.Transparency = 0.7
        DarkCloud.Anchored = true
        DarkCloud.CanCollide = false
        DarkCloud.Position = StageCenter + Vector3.new(
            math.random(-60, 60),
            math.random(10, 30),
            math.random(-60, 60)
        )
        DarkCloud.Parent = workspace
        table.insert(BackgroundEffects, DarkCloud)
    end
    
    -- 241-270: 闇の地面
    for i = 1, 30 do
        local DarkGround = Instance.new("Part")
        DarkGround.Size = Vector3.new(20, 1, 20)
        DarkGround.Material = Enum.Material.Concrete
        DarkGround.Color = Color3.fromRGB(10, 10, 15)
        DarkGround.Anchored = true
        DarkGround.CanCollide = false
        DarkGround.Position = StageCenter + Vector3.new(
            math.random(-70, 70),
            -20,
            math.random(-70, 70)
        )
        DarkGround.Parent = workspace
        table.insert(BackgroundEffects, DarkGround)
    end
    
    -- 271-300: 闇のオーブ
    for i = 1, 30 do
        local DarkOrb = Instance.new("Part")
        DarkOrb.Size = Vector3.new(3, 3, 3)
        DarkOrb.Shape = Enum.PartType.Ball
        DarkOrb.Material = Enum.Material.Neon
        DarkOrb.Color = Color3.fromRGB(10, 15, 30)
        DarkOrb.Transparency = 0.6
        DarkOrb.Anchored = true
        DarkOrb.CanCollide = false
        DarkOrb.Position = StageCenter + Vector3.new(
            math.random(-35, 35),
            math.random(-10, 10),
            math.random(-35, 35)
        )
        DarkOrb.Parent = workspace
        
        task.spawn(function()
            while DarkOrb.Parent do
                DarkOrb.Position = DarkOrb.Position + Vector3.new(
                    math.sin(tick() + i) * 0.05,
                    math.cos(tick() * 1.5 + i) * 0.05,
                    math.cos(tick() + i) * 0.05
                )
                task.wait(0.03)
            end
        end)
        
        table.insert(BackgroundEffects, DarkOrb)
    end
    
    -- ========== 階段の作成（暗い階段） ========== --
    local Stairs = {}
    local stairEffects = {}
    
    for i = 1, 10 do
        local Stair = Instance.new("Part")
        Stair.Size = Vector3.new(12, 0.7, 6)
        Stair.Position = SkyPlatform.Position - Vector3.new(0, i * 2.2, i * 2.2)
        Stair.Material = Enum.Material.Marble
        Stair.Color = Color3.fromRGB(10, 10, 20)
        Stair.Anchored = true
        Stair.CanCollide = true
        Stair.Transparency = 0.3
        Stair.Parent = workspace
        table.insert(Stairs, Stair)
        
        -- 階段の控えめな光
        local StairLight = Instance.new("PointLight")
        StairLight.Color = Color3.fromRGB(40, 60, 120)
        StairLight.Range = 8
        StairLight.Brightness = 0.4
        StairLight.Parent = Stair
        
        -- 階段の闇パーティクル
        local DarkParticle = Instance.new("ParticleEmitter")
        DarkParticle.Texture = "rbxassetid://243662263"
        DarkParticle.Color = ColorSequence.new(Color3.fromRGB(20, 30, 60))
        DarkParticle.Size = NumberSequence.new(0.1, 0.3)
        DarkParticle.Lifetime = NumberRange.new(1, 2)
        DarkParticle.Rate = 8
        DarkParticle.Speed = NumberRange.new(0.2, 0.8)
        DarkParticle.LightEmission = 0.2
        DarkParticle.Parent = Stair
        table.insert(stairEffects, DarkParticle)
    end
    
    -- ========== プレイヤーを天空に移動 ========== --
    HumanoidRootPart.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(0, 6, 0))
    
    -- ========== 暗い天使の翼（控えめな光） ========== --
    
    -- 左翼メイン
    local LeftWingMain = Instance.new("Part")
    LeftWingMain.Size = Vector3.new(0.5, 8, 4)
    LeftWingMain.Material = Enum.Material.Neon
    LeftWingMain.Color = Color3.fromRGB(180, 180, 200)
    LeftWingMain.Transparency = 0.3
    LeftWingMain.CanCollide = false
    LeftWingMain.Parent = Character
    
    local LeftWingMesh = Instance.new("SpecialMesh")
    LeftWingMesh.MeshType = Enum.MeshType.Wedge
    LeftWingMesh.Scale = Vector3.new(1, 1, 1)
    LeftWingMesh.Parent = LeftWingMain
    
    local LeftWingWeld = Instance.new("Weld")
    LeftWingWeld.Part0 = HumanoidRootPart
    LeftWingWeld.Part1 = LeftWingMain
    LeftWingWeld.C0 = CFrame.new(-1, 1.2, 0.6) * CFrame.Angles(0, math.rad(20), math.rad(-12))
    LeftWingWeld.Parent = HumanoidRootPart
    
    -- 左翼追加レイヤー
    local LeftWingLayer2 = LeftWingMain:Clone()
    LeftWingLayer2.Size = Vector3.new(0.3, 7, 3.5)
    LeftWingLayer2.Transparency = 0.5
    LeftWingLayer2.Color = Color3.fromRGB(200, 200, 220)
    LeftWingLayer2.Parent = Character
    
    local LeftWingWeld2 = Instance.new("Weld")
    LeftWingWeld2.Part0 = HumanoidRootPart
    LeftWingWeld2.Part1 = LeftWingLayer2
    LeftWingWeld2.C0 = CFrame.new(-1.3, 1, 0.4) * CFrame.Angles(0, math.rad(25), math.rad(-10))
    LeftWingWeld2.Parent = HumanoidRootPart
    
    -- 右翼メイン
    local RightWingMain = LeftWingMain:Clone()
    RightWingMain.Parent = Character
    
    local RightWingWeld = Instance.new("Weld")
    RightWingWeld.Part0 = HumanoidRootPart
    RightWingWeld.Part1 = RightWingMain
    RightWingWeld.C0 = CFrame.new(1, 1.2, 0.6) * CFrame.Angles(0, math.rad(-20), math.rad(12))
    RightWingWeld.Parent = HumanoidRootPart
    
    -- 右翼追加レイヤー
    local RightWingLayer2 = LeftWingLayer2:Clone()
    RightWingLayer2.Parent = Character
    
    local RightWingWeld2 = Instance.new("Weld")
    RightWingWeld2.Part0 = HumanoidRootPart
    RightWingWeld2.Part1 = RightWingLayer2
    RightWingWeld2.C0 = CFrame.new(1.3, 1, 0.4) * CFrame.Angles(0, math.rad(-25), math.rad(10))
    RightWingWeld2.Parent = HumanoidRootPart
    
    -- 翼の控えめなオーラ
    local WingAura1 = Instance.new("ParticleEmitter")
    WingAura1.Texture = "rbxassetid://241809795"
    WingAura1.Color = ColorSequence.new(Color3.fromRGB(180, 180, 220))
    WingAura1.Size = NumberSequence.new(0.2, 0.6)
    WingAura1.Transparency = NumberSequence.new(0.7, 1)
    WingAura1.Lifetime = NumberRange.new(1, 2)
    WingAura1.Rate = 15
    WingAura1.Speed = NumberRange.new(0.5, 1.5)
    WingAura1.LightEmission = 0.4
    WingAura1.Parent = LeftWingMain
    
    local WingAura2 = WingAura1:Clone()
    WingAura2.Parent = RightWingMain
    
    -- 翼の弱い光
    local WingLight = Instance.new("PointLight")
    WingLight.Color = Color3.fromRGB(180, 180, 220)
    WingLight.Range = 10
    WingLight.Brightness = 0.6
    WingLight.Parent = HumanoidRootPart
    
    -- ========== 暗い降臨サウンド ========== --
    local DescentSound = Instance.new("Sound")
    DescentSound.SoundId = "rbxassetid://1843463175"
    DescentSound.Volume = 0.6
    DescentSound.Pitch = 0.8
    DescentSound.Parent = HumanoidRootPart
    DescentSound:Play()
    
    -- ========== 10秒間の階段降りアニメーション（900種類） ========== --
    
    -- カメラアングル1: 暗い上空から
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(10, 20, 25), SkyPlatform.Position)
    
    task.wait(0.8)
    
    -- 【1-50】翼展開アニメーション（50種類）
    for i = 1, 50 do
        LeftWingWeld.C0 = LeftWingWeld.C0 * CFrame.Angles(0, 0, math.rad(-1.5))
        RightWingWeld.C0 = RightWingWeld.C0 * CFrame.Angles(0, 0, math.rad(1.5))
        
        LeftWingWeld2.C0 = LeftWingWeld2.C0 * CFrame.Angles(0, 0, math.rad(-1.2))
        RightWingWeld2.C0 = RightWingWeld2.C0 * CFrame.Angles(0, 0, math.rad(1.2))
        
        -- 弱い光の輪
        if i % 5 == 0 then
            local Halo = Instance.new("Part")
            Halo.Size = Vector3.new(0.3, 0.3, 0.3)
            Halo.Shape = Enum.PartType.Ball
            Halo.Material = Enum.Material.Neon
            Halo.Color = Color3.fromRGB(150, 150, 180)
            Halo.Transparency = 0.5
            Halo.Anchored = true
            Halo.CanCollide = false
            Halo.Position = HumanoidRootPart.Position + Vector3.new(0, 3, 0)
            Halo.Parent = workspace
            
            task.spawn(function()
                for j = 1, 20 do
                    Halo.Size = Halo.Size + Vector3.new(0.3, 0.3, 0.3)
                    Halo.Transparency = 0.5 + (j / 20) * 0.5
                    task.wait(0.015)
                end
                Halo:Destroy()
            end)
        end
        
        task.wait(0.02)
    end
    
    -- カメラアングル2: 正面から
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(0, 2, 25), SkyPlatform.Position)
    
    -- 【51-150】降臨準備エフェクト（100種類）
    for i = 1, 100 do
        -- 弱い光のパルス
        local DarkPulse = Instance.new("Part")
        DarkPulse.Size = Vector3.new(4 + i * 0.15, 4 + i * 0.15, 4 + i * 0.15)
        DarkPulse.Shape = Enum.PartType.Ball
        DarkPulse.Material = Enum.Material.Neon
        DarkPulse.Color = Color3.fromRGB(30, 40, 80)
        DarkPulse.Transparency = 0.7
        DarkPulse.Anchored = true
        DarkPulse.CanCollide = false
        DarkPulse.Position = HumanoidRootPart.Position
        DarkPulse.Parent = workspace
        
        task.delay(1, function() DarkPulse:Destroy() end)
        
        -- 暗い粒子
        if i % 3 == 0 then
            for j = 1, 2 do
                local DarkParticle = Instance.new("Part")
                DarkParticle.Size = Vector3.new(0.2, 0.2, 0.2)
                DarkParticle.Shape = Enum.PartType.Ball
                DarkParticle.Material = Enum.Material.Neon
                DarkParticle.Color = Color3.fromRGB(40, 50, 100)
                DarkParticle.Transparency = 0.4
                DarkParticle.Anchored = true
                DarkParticle.CanCollide = false
                local angle = ((i * 2 + j) / 200) * math.pi * 2
                DarkParticle.Position = HumanoidRootPart.Position + Vector3.new(
                    math.cos(angle) * 3, 
                    math.random(-2, 2), 
                    math.sin(angle) * 3
                )
                DarkParticle.Parent = workspace
                
                task.spawn(function()
                    for k = 1, 25 do
                        DarkParticle.Position = DarkParticle.Position + Vector3.new(
                            math.cos(angle) * 0.08,
                            0.03,
                            math.sin(angle) * 0.08
                        )
                        DarkParticle.Transparency = 0.4 + (k / 25) * 0.6
                        task.wait(0.02)
                    end
                    DarkParticle:Destroy()
                end)
            end
        end
        
        task.wait(0.02)
    end
    
    -- 【151-550】階段降下アニメーション（10ステップ × 40種類 = 400種類）
    for step = 1, 10 do
        local targetStair = Stairs[step]
        
        -- カメラ角度調整
        local camAngle = (step / 10) * math.pi
        Camera.CFrame = CFrame.new(
            targetStair.Position + Vector3.new(
                math.cos(camAngle) * 15, 
                5, 
                math.sin(camAngle) * 15
            ), 
            targetStair.Position + Vector3.new(0, 2, 0)
        )
        
        -- 消失エフェクト
        local DisappearEffect = Instance.new("Part")
        DisappearEffect.Size = Vector3.new(3, 3, 3)
        DisappearEffect.Shape = Enum.PartType.Ball
        DisappearEffect.Material = Enum.Material.Neon
        DisappearEffect.Color = Color3.fromRGB(60, 80, 120)
        DisappearEffect.Transparency = 0.3
        DisappearEffect.Anchored = true
        DisappearEffect.CanCollide = false
        DisappearEffect.Position = HumanoidRootPart.Position
        DisappearEffect.Parent = workspace
        
        task.spawn(function()
            for i = 1, 15 do
                DisappearEffect.Size = DisappearEffect.Size + Vector3.new(0.4, 0.4, 0.4)
                DisappearEffect.Transparency = 0.3 + (i / 15) * 0.7
                task.wait(0.02)
            end
            DisappearEffect:Destroy()
        end)
        
        -- テレポート
        task.wait(0.1)
        HumanoidRootPart.CFrame = CFrame.new(targetStair.Position + Vector3.new(0, 2, 0))
        
        -- 出現エフェクト
        local AppearEffect = Instance.new("Part")
        AppearEffect.Size = Vector3.new(0.5, 0.5, 0.5)
        AppearEffect.Shape = Enum.PartType.Ball
        AppearEffect.Material = Enum.Material.Neon
        AppearEffect.Color = Color3.fromRGB(80, 100, 150)
        AppearEffect.Transparency = 0.2
        AppearEffect.Anchored = true
        AppearEffect.CanCollide = false
        AppearEffect.Position = HumanoidRootPart.Position
        AppearEffect.Parent = workspace
        
        task.spawn(function()
            for i = 1, 15 do
                AppearEffect.Size = AppearEffect.Size + Vector3.new(0.5, 0.5, 0.5)
                AppearEffect.Transparency = 0.2 + (i / 15) * 0.8
                task.wait(0.02)
            end
            AppearEffect:Destroy()
        end)
        
        -- 階段ごとの40種類のエフェクト
        for effectIndex = 1, 40 do
            local effectType = effectIndex % 10
            
            -- 各エフェクトタイプの処理
            if effectType == 1 then
                -- 弱い光の柱
                local LightColumn = Instance.new("Part")
                LightColumn.Size = Vector3.new(0.6, 8, 0.6)
                LightColumn.Material = Enum.Material.Neon
                LightColumn.Color = Color3.fromRGB(60, 80, 140)
                LightColumn.Transparency = 0.6
                LightColumn.Anchored = true
                LightColumn.CanCollide = false
                local angle = (effectIndex / 40) * math.pi * 2
                LightColumn.Position = targetStair.Position + Vector3.new(
                    math.cos(angle) * 4, 
                    0, 
                    math.sin(angle) * 4
                )
                LightColumn.Parent = workspace
                
                task.delay(0.8, function() LightColumn:Destroy() end)
                
            elseif effectType == 2 then
                -- 暗い魔法陣
                local DarkCircle = Instance.new("Part")
                DarkCircle.Size = Vector3.new(5, 0.1, 5)
                DarkCircle.Shape = Enum.PartType.Cylinder
                DarkCircle.Material = Enum.Material.Neon
                DarkCircle.Color = Color3.fromRGB(40, 50, 100)
                DarkCircle.Transparency = 0.7
                DarkCircle.Anchored = true
                DarkCircle.CanCollide = false
                DarkCircle.Position = targetStair.Position
                DarkCircle.Orientation = Vector3.new(0, 0, 90)
                DarkCircle.Parent = workspace
                
                task.spawn(function()
                    for i = 1, 20 do
                        DarkCircle.CFrame = DarkCircle.CFrame * CFrame.Angles(0, math.rad(3), 0)
                        DarkCircle.Transparency = 0.7 + (i / 20) * 0.3
                        task.wait(0.02)
                    end
                    DarkCircle:Destroy()
                end)
                
            elseif effectType == 3 then
                -- 闇の霧
                local DarkMist = Instance.new("Part")
                DarkMist.Size = Vector3.new(4, 0.5, 4)
                DarkMist.Material = Enum.Material.Neon
                DarkMist.Color = Color3.fromRGB(20, 30, 50)
                DarkMist.Transparency = 0.8
                DarkMist.Anchored = true
                DarkMist.CanCollide = false
                local angle = (effectIndex / 40) * math.pi * 2
                DarkMist.Position = targetStair.Position + Vector3.new(
                    math.cos(angle) * 3, 
                    1, 
                    math.sin(angle) * 3
                )
                DarkMist.Parent = workspace
                
                task.delay(0.7, function() DarkMist:Destroy() end)
                
            elseif effectType == 4 then
                -- 弱い電撃
                local Lightning = Instance.new("Part")
                Lightning.Size = Vector3.new(0.3, 6, 0.3)
                Lightning.Material = Enum.Material.Neon
                Lightning.Color = Color3.fromRGB(70, 100, 180)
                Lightning.Transparency = 0.5
                Lightning.Anchored = true
                Lightning.CanCollide = false
                local angle = (effectIndex / 40) * math.pi * 2
                Lightning.Position = targetStair.Position + Vector3.new(
                    math.cos(angle) * 2.5, 
                    3, 
                    math.sin(angle) * 2.5
                )
                Lightning.Parent = workspace
                
                local LightningLight = Instance.new("PointLight")
                LightningLight.Color = Color3.fromRGB(70, 100, 180)
                LightningLight.Range = 8
                LightningLight.Brightness = 0.3
                LightningLight.Parent = Lightning
                
                task.delay(0.3, function() Lightning:Destroy() end)
                
            elseif effectType == 5 then
                -- 暗い星の軌跡
                local DarkStar = Instance.new("Part")
                DarkStar.Size = Vector3.new(0.25, 0.25, 0.25)
                DarkStar.Shape = Enum.PartType.Ball
                DarkStar.Material = Enum.Material.Neon
                DarkStar.Color = Color3.fromRGB(100, 120, 180)
                DarkStar.Transparency = 0.3
                DarkStar.Anchored = true
                DarkStar.CanCollide = false
                local angle = (effectIndex / 40) * math.pi * 2
                DarkStar.Position = HumanoidRootPart.Position + Vector3.new(
                    math.cos(angle) * 2, 
                    2, 
                    math.sin(angle) * 2
                )
                DarkStar.Parent = workspace
                
                task.spawn(function()
                    for i = 1, 30 do
                        DarkStar.Position = DarkStar.Position + Vector3.new(0, -0.15, 0)
                        DarkStar.Transparency = 0.3 + (i / 30) * 0.7
                        task.wait(0.015)
                    end
                    DarkStar:Destroy()
                end)
                
            elseif effectType == 6 then
                -- 闇のエネルギー波
                local DarkWave = Instance.new("Part")
                DarkWave.Size = Vector3.new(3, 0.1, 3)
                DarkWave.Shape = Enum.PartType.Cylinder
                DarkWave.Material = Enum.Material.Neon
                DarkWave.Color = Color3.fromRGB(30, 40, 80)
                DarkWave.Transparency = 0.6
                DarkWave.Anchored = true
                DarkWave.CanCollide = false
                DarkWave.Position = targetStair.Position
                DarkWave.Orientation = Vector3.new(0, 0, 90)
                DarkWave.Parent = workspace
                
                task.spawn(function()
                    for i = 1, 15 do
                        DarkWave.Size = DarkWave.Size + Vector3.new(0.8, 0, 0.8)
                        DarkWave.Transparency = 0.6 + (i / 15) * 0.4
                        task.wait(0.02)
                    end
                    DarkWave:Destroy()
                end)
                
            elseif effectType == 7 then
                -- 暗い結晶
                local DarkCrystal = Instance.new("Part")
                DarkCrystal.Size = Vector3.new(1, 3, 1)
                DarkCrystal.Material = Enum.Material.Neon
                DarkCrystal.Color = Color3.fromRGB(50, 60, 120)
                DarkCrystal.Transparency = 0.5
                DarkCrystal.Anchored = true
                DarkCrystal.CanCollide = false
                local angle = (effectIndex / 40) * math.pi * 2
                DarkCrystal.Position = targetStair.Position + Vector3.new(
                    math.cos(angle) * 3.5, 
                    0, 
                    math.sin(angle) * 3.5
                )
                DarkCrystal.Parent = workspace
                
                task.delay(0.9, function() DarkCrystal:Destroy() end)
                
            elseif effectType == 8 then
                -- 弱い炎
                local DarkFire = Instance.new("Part")
                DarkFire.Size = Vector3.new(1.5, 4, 1.5)
                DarkFire.Material = Enum.Material.Neon
                DarkFire.Color = Color3.fromRGB(60, 30, 20)
                DarkFire.Transparency = 0.7
                DarkFire.Anchored = true
                DarkFire.CanCollide = false
                local angle = (effectIndex / 40) * math.pi * 2
                DarkFire.Position = targetStair.Position + Vector3.new(
                    math.cos(angle) * 4, 
                    0, 
                    math.sin(angle) * 4
                )
                DarkFire.Parent = workspace
                
                task.delay(0.8, function() DarkFire:Destroy() end)
                
            elseif effectType == 9 then
                -- 暗い粒子群
                for j = 1, 3 do
                    local DarkParticle = Instance.new("Part")
                    DarkParticle.Size = Vector3.new(0.15, 0.15, 0.15)
                    DarkParticle.Shape = Enum.PartType.Ball
                    DarkParticle.Material = Enum.Material.Neon
                    DarkParticle.Color = Color3.fromRGB(40, 50, 90)
                    DarkParticle.Transparency = 0.4
                    DarkParticle.Anchored = true
                    DarkParticle.CanCollide = false
                    local angle2 = ((effectIndex * 3 + j) / 120) * math.pi * 2
                    DarkParticle.Position = HumanoidRootPart.Position + Vector3.new(
                        math.cos(angle2) * 2.5, 
                        1, 
                        math.sin(angle2) * 2.5
                    )
                    DarkParticle.Parent = workspace
                    
                    task.spawn(function()
                        for k = 1, 25 do
                            DarkParticle.Position = DarkParticle.Position + Vector3.new(
                                math.cos(angle2) * 0.06,
                                -0.1,
                                math.sin(angle2) * 0.06
                            )
                            DarkParticle.Transparency = 0.4 + (k / 25) * 0.6
                            task.wait(0.02)
                        end
                        DarkParticle:Destroy()
                    end)
                end
                
            elseif effectType == 0 then
                -- 暗い光のリング
                local DarkRing = Instance.new("Part")
                DarkRing.Size = Vector3.new(6, 0.1, 6)
                DarkRing.Shape = Enum.PartType.Cylinder
                DarkRing.Material = Enum.Material.Neon
                DarkRing.Color = Color3.fromRGB(70, 80, 140)
                DarkRing.Transparency = 0.6
                DarkRing.Anchored = true
                DarkRing.CanCollide = false
                DarkRing.Position = targetStair.Position
                DarkRing.Orientation = Vector3.new(0, 0, 90)
                DarkRing.Parent = workspace
                
                task.delay(0.7, function() DarkRing:Destroy() end)
            end
            
            task.wait(0.02)
        end
        
        task.wait(0.3)
    end
    
    -- 【551-650】着地後の演出（100種類）
    
    -- カメラアングル3: 上空から
    Camera.CFrame = CFrame.new(HumanoidRootPart.Position + Vector3.new(0, 20, 20), HumanoidRootPart.Position)
    
    for i = 1, 100 do
        -- 暗い衝撃波
        local DarkShockwave = Instance.new("Part")
        DarkShockwave.Size = Vector3.new(i * 0.3, 0.1, i * 0.3)
        DarkShockwave.Shape = Enum.PartType.Cylinder
        DarkShockwave.Material = Enum.Material.Neon
        DarkShockwave.Color = Color3.fromRGB(30, 40, 80)
        DarkShockwave.Transparency = 0.5 + (i / 100) * 0.4
        DarkShockwave.Anchored = true
        DarkShockwave.CanCollide = false
        DarkShockwave.Position = HumanoidRootPart.Position
        DarkShockwave.Orientation = Vector3.new(0, 0, 90)
        DarkShockwave.Parent = workspace
        
        task.delay(0.5, function() DarkShockwave:Destroy() end)
        
        -- 暗い光のオーブ
        if i % 4 == 0 then
            local DarkOrb = Instance.new("Part")
            DarkOrb.Size = Vector3.new(0.4, 0.4, 0.4)
            DarkOrb.Shape = Enum.PartType.Ball
            DarkOrb.Material = Enum.Material.Neon
            DarkOrb.Color = Color3.fromRGB(40, 50, 100)
            DarkOrb.Transparency = 0.3
            DarkOrb.Anchored = true
            DarkOrb.CanCollide = false
            local angle = (i / 100) * math.pi * 2
            DarkOrb.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * 5,
                3 + math.sin(i * 0.1) * 2,
                math.sin(angle) * 5
            )
            DarkOrb.Parent = workspace
            
            task.spawn(function()
                for j = 1, 30 do
                    local t = (tick() + i) * 1.5
                    DarkOrb.Position = HumanoidRootPart.Position + Vector3.new(
                        math.cos(t) * (5 - j * 0.1),
                        3 + math.sin(t * 2) * 1.5,
                        math.sin(t) * (5 - j * 0.1)
                    )
                    DarkOrb.Transparency = 0.3 + (j / 30) * 0.7
                    task.wait(0.02)
                end
                DarkOrb:Destroy()
            end)
        end
        
        task.wait(0.02)
    end
    
    -- 【651-750】翼フェードアウト演出（100種類）
    
    task.wait(0.3)
    
    for i = 1, 100 do
        local alpha = i / 100
        LeftWingMain.Transparency = 0.3 + alpha * 0.7
        RightWingMain.Transparency = 0.3 + alpha * 0.7
        LeftWingLayer2.Transparency = 0.5 + alpha * 0.5
        RightWingLayer2.Transparency = 0.5 + alpha * 0.5
        
        -- 暗い羽根が散る
        if i % 3 == 0 then
            local Feather = Instance.new("Part")
            Feather.Size = Vector3.new(0.3, 0.08, 0.5)
            Feather.Material = Enum.Material.Neon
            Feather.Color = Color3.fromRGB(150, 150, 180)
            Feather.Transparency = 0.4
            Feather.Anchored = true
            Feather.CanCollide = false
            
            local wingChoice = (i % 4 < 2) and LeftWingMain or RightWingMain
            Feather.Position = wingChoice.Position + Vector3.new(
                math.random(-1.5, 1.5),
                math.random(-0.8, 0.8),
                math.random(-1.5, 1.5)
            )
            Feather.Parent = workspace
            
            task.spawn(function()
                for j = 1, 40 do
                    Feather.Position = Feather.Position + Vector3.new(
                        math.random(-1, 1) * 0.05,
                        -0.1,
                        math.random(-1, 1) * 0.05
                    )
                    Feather.CFrame = Feather.CFrame * CFrame.Angles(
                        math.rad(math.random(-5, 5)),
                        math.rad(math.random(-5, 5)),
                        math.rad(math.random(-5, 5))
                    )
                    Feather.Transparency = 0.4 + (j / 40) * 0.6
                    task.wait(0.02)
                end
                Feather:Destroy()
            end)
        end
        
        task.wait(0.015)
    end
    
    -- 翼を削除
    LeftWingMain:Destroy()
    RightWingMain:Destroy()
    LeftWingLayer2:Destroy()
    RightWingLayer2:Destroy()
    WingLight:Destroy()
    
    -- 【751-850】フィナーレエフェクト（100種類）
    
    for i = 1, 100 do
        local camAngle = (i / 100) * math.pi * 2
        Camera.CFrame = CFrame.new(
            HumanoidRootPart.Position + Vector3.new(
                math.cos(camAngle) * 12,
                8 - (i / 100) * 4,
                math.sin(camAngle) * 12
            ),
            HumanoidRootPart.Position
        )
        
        -- 暗い螺旋状の光
        if i % 2 == 0 then
            local SpiralLight = Instance.new("Part")
            SpiralLight.Size = Vector3.new(0.3, 0.3, 0.3)
            SpiralLight.Shape = Enum.PartType.Ball
            SpiralLight.Material = Enum.Material.Neon
            SpiralLight.Color = Color3.fromRGB(40, 50, 100)
            SpiralLight.Transparency = 0.4
            SpiralLight.Anchored = true
            SpiralLight.CanCollide = false
            local spiralAngle = (i / 100) * math.pi * 5
            SpiralLight.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(spiralAngle) * 6,
                8 - i * 0.1,
                math.sin(spiralAngle) * 6
            )
            SpiralLight.Parent = workspace
            
            task.delay(1, function() SpiralLight:Destroy() end)
        end
        
        task.wait(0.02)
    end
    
    -- 【851-900】最終闇爆発演出（50種類）
    
    Camera.CFrame = CFrame.new(HumanoidRootPart.Position + Vector3.new(0, 6, 15), HumanoidRootPart.Position)
    
    for i = 1, 50 do
        local FinalDarkBurst = Instance.new("Part")
        FinalDarkBurst.Size = Vector3.new(i * 0.5, i * 0.5, i * 0.5)
        FinalDarkBurst.Shape = Enum.PartType.Ball
        FinalDarkBurst.Material = Enum.Material.Neon
        FinalDarkBurst.Color = Color3.fromRGB(20, 25, 50)
        FinalDarkBurst.Transparency = 0.5 + (i / 50) * 0.4
        FinalDarkBurst.Anchored = true
        FinalDarkBurst.CanCollide = false
        FinalDarkBurst.Position = HumanoidRootPart.Position
        FinalDarkBurst.Parent = workspace
        
        task.delay(0.6, function() FinalDarkBurst:Destroy() end)
        
        task.wait(0.02)
    end
    
    -- 最終暗いサウンド
    local FinalSound = Instance.new("Sound")
    FinalSound.SoundId = "rbxassetid://9125402735"
    FinalSound.Volume = 0.5
    FinalSound.Pitch = 0.7
    FinalSound.Parent = HumanoidRootPart
    FinalSound:Play()
    
    task.wait(1)
    
    -- プレイヤーを元の位置に戻す
    HumanoidRootPart.CFrame = OriginalPosition
    
    -- ライティングを戻す
    Lighting.Ambient = originalAmbient
    Lighting.Brightness = originalBrightness
    Lighting.ExposureCompensation = originalExposure
    
    -- カメラを戻す
    Camera.CameraType = OriginalCameraType
    Camera.CameraSubject = OriginalCameraSubject
    
    -- クリーンアップ
    task.wait(2)
    for _, effect in pairs(BackgroundEffects) do
        if effect and effect.Parent then
            effect:Destroy()
        end
    end
    for _, stair in pairs(Stairs) do
        if stair and stair.Parent then
            stair:Destroy()
        end
    end
    SkyPlatform:Destroy()
    
    Rayfield:Notify({
        Title = "🌙 闇の降臨完了",
        Content = "900種類の暗闇アニメーション演出終了",
        Duration = 3,
        Image = 4483362458,
    })
end

-- ========== 影刃生成関数 ========== --
local function CreateDarkKagebaBlade()
    local plr = game.Players.LocalPlayer
    local Character = plr.Character or plr.CharacterAdded:Wait()
    local Backpack = plr.Backpack
    
    if Backpack:FindFirstChild("影刃") or (Character and Character:FindFirstChild("影刃")) then
        Rayfield:Notify({
            Title = "⚠️ 警告",
            Content = "既に影刃を所持しています",
            Duration = 2,
            Image = 4483362458,
        })
        return
    end

    local tool = Instance.new("Tool", Backpack)
    tool.GripPos = Vector3.new(0, 0, -1.8)
    tool.GripForward = Vector3.new(0, -1, 0)
    tool.GripRight = Vector3.new(1, 0, 0)
    tool.GripUp = Vector3.new(0, 0, 1)
    tool.Name = "影刃"
    tool.TextureId = "rbxasset://Textures/Sword128.png"
    tool.RequiresHandle = true
    tool.CanBeDropped = false
    tool.ToolTip = "【影刃】闇と冷気を纏う伝説の黒刃"

    local Handle = Instance.new("Part", tool)
    Handle.Name = "Handle"
    Handle.Size = Vector3.new(0.3, 0.3, 0.3)
    Handle.Transparency = 1
    Handle.Anchored = false
    Handle.CanCollide = false

    local HandleGrip = Instance.new("Part", Handle)
    HandleGrip.Name = "HandleGrip"
    HandleGrip.Size = Vector3.new(0.28, 1.4, 0.28)
    HandleGrip.Material = Enum.Material.Fabric
    HandleGrip.Color = Color3.fromRGB(2, 2, 3)
    HandleGrip.CanCollide = false
    HandleGrip.Massless = true
    
    local GripMesh = Instance.new("SpecialMesh")
    GripMesh.MeshType = Enum.MeshType.Cylinder
    GripMesh.Parent = HandleGrip
    
    local GripWeld = Instance.new("Weld")
    GripWeld.Part0 = Handle
    GripWeld.Part1 = HandleGrip
    GripWeld.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, math.rad(90))
    GripWeld.Parent = Handle

    local Pommel = Instance.new("Part", Handle)
    Pommel.Shape = Enum.PartType.Ball
    Pommel.Size = Vector3.new(0.45, 0.45, 0.45)
    Pommel.Material = Enum.Material.Metal
    Pommel.Color = Color3.fromRGB(1, 1, 2)
    Pommel.Reflectance = 0.2
    Pommel.CanCollide = false
    Pommel.Massless = true
    
    local PommelWeld = Instance.new("Weld")
    PommelWeld.Part0 = Handle
    PommelWeld.Part1 = Pommel
    PommelWeld.C0 = CFrame.new(0, -0.85, 0)
    PommelWeld.Parent = Handle

    local Guard = Instance.new("Part", Handle)
    Guard.Size = Vector3.new(1.6, 0.22, 0.5)
    Guard.Material = Enum.Material.Metal
    Guard.Color = Color3.fromRGB(4, 4, 6)
    Guard.Reflectance = 0.15
    Guard.CanCollide = false
    Guard.Massless = true
    
    local GuardMesh = Instance.new("SpecialMesh")
    GuardMesh.MeshType = Enum.MeshType.FileMesh
    GuardMesh.MeshId = "rbxassetid://1082802"
    GuardMesh.Scale = Vector3.new(0.75, 0.38, 0.75)
    GuardMesh.Parent = Guard
    
    local GuardWeld = Instance.new("Weld")
    GuardWeld.Part0 = Handle
    GuardWeld.Part1 = Guard
    GuardWeld.C0 = CFrame.new(0, 0.7, 0) * CFrame.Angles(0, 0, math.rad(90))
    GuardWeld.Parent = Handle

    local Blade = Instance.new("Part", Handle)
    Blade.Name = "Blade"
    Blade.Size = Vector3.new(0.15, 4, 0.65)
    Blade.Material = Enum.Material.Glass
    Blade.Color = Color3.fromRGB(0, 0, 0)
    Blade.Reflectance = 0.3
    Blade.Transparency = 0.05
    Blade.CanCollide = false
    Blade.Massless = true
    
    local BladeMesh = Instance.new("SpecialMesh")
    BladeMesh.MeshType = Enum.MeshType.Wedge
    BladeMesh.Parent = Blade
    
    local BladeWeld = Instance.new("Weld")
    BladeWeld.Part0 = Handle
    BladeWeld.Part1 = Blade
    BladeWeld.C0 = CFrame.new(0, 2.9, 0) * CFrame.Angles(math.rad(180), 0, 0)
    BladeWeld.Parent = Handle

    -- 闇のオーラ（控えめ）
    local DarkAura = Instance.new("ParticleEmitter", Blade)
    DarkAura.Texture = "rbxassetid://243662263"
    DarkAura.Color = ColorSequence.new(Color3.fromRGB(0, 0, 5))
    DarkAura.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(0.5, 1.2),
        NumberSequenceKeypoint.new(1, 2)
    })
    DarkAura.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.6),
        NumberSequenceKeypoint.new(1, 1)
    })
    DarkAura.Lifetime = NumberRange.new(1, 2)
    DarkAura.Rate = 25
    DarkAura.Speed = NumberRange.new(0.5, 1.5)

    local Unsheath = Instance.new("Sound", Handle)
    Unsheath.SoundId = "rbxassetid://12222225"
    Unsheath.Volume = 0.7

    local SwordSlash = Instance.new("Sound", Handle)
    SwordSlash.SoundId = "rbxassetid://12222216"
    SwordSlash.Volume = 1

    local VerticalSlashAnim = Instance.new("Animation", tool)
    VerticalSlashAnim.AnimationId = "rbxassetid://186934658"
    local AnimTrack = plr.Character.Humanoid:LoadAnimation(VerticalSlashAnim)

    local db = true
    local da = false

    tool.Equipped:Connect(function()
        Unsheath:Play()
        DarkAura.Rate = 40
        
        wait(1)
        
        tool.Activated:Connect(function()
            if db == true then
                db = false
                SwordSlash:Play()
                AnimTrack:Play()
                
                wait()
                da = true
                db = true
                
                wait(1.5)
                da = false
                AnimTrack:Stop()
            end
        end)
    end)

    tool.Unequipped:Connect(function()
        DarkAura.Rate = 25
        da = false
        db = true
    end)

    Blade.Touched:Connect(function(hit)
        if da == true then
            local enemyHumanoid = hit.Parent:FindFirstChild("Humanoid")
            if enemyHumanoid ~= nil then
                enemyHumanoid:TakeDamage(40)
            end
        end
    end)

    Rayfield:Notify({
        Title = "⚔️ 影刃 - 召喚完了",
        Content = "闇の力が静かに解き放たれた",
        Duration = 4,
        Image = 4483362458,
    })
end

-- ========== メインタブ ========== --
local SummonButton = MainTab:CreateButton({
   Name = "⚔️ 影刃を召喚する（900演出版）",
   Callback = function()
        PlayDarkDescentCutscene(game.Players.LocalPlayer)
        wait(12)
        CreateDarkKagebaBlade()
   end,
})

local QuickSummonButton = MainTab:CreateButton({
   Name = "⚡ 影刃を即座に召喚（演出なし）",
   Callback = function()
        CreateDarkKagebaBlade()
   end,
})

-- ========== 演出タブ ========== --
CinemaTab:CreateLabel("🎬 闇の降臨演出の内容")
CinemaTab:CreateLabel("合計: 900種類のアニメーション")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("背景演出 (300種類):")
CinemaTab:CreateLabel("• 暗い神秘的な木々 x30")
CinemaTab:CreateLabel("• 暗い水晶 x30")
CinemaTab:CreateLabel("• 暗い古代の柱 x30")
CinemaTab:CreateLabel("• 暗い魔法陣 x30")
CinemaTab:CreateLabel("• 暗い炎の柱 x30")
CinemaTab:CreateLabel("• 闇の霧 x30")
CinemaTab:CreateLabel("• 闇の結晶 x30")
CinemaTab:CreateLabel("• 闇の雲 x30")
CinemaTab:CreateLabel("• 闇の地面 x30")
CinemaTab:CreateLabel("• 闇のオーブ x30")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("プレイヤー演出 (600種類):")
CinemaTab:CreateLabel("• 暗い天使の翼（2層）")
CinemaTab:CreateLabel("• 翼展開アニメーション x50")
CinemaTab:CreateLabel("• 降臨準備エフェクト x100")
CinemaTab:CreateLabel("• 階段降下（各40種） x400")
CinemaTab:CreateLabel("• 着地後の演出 x100")
CinemaTab:CreateLabel("• 翼フェードアウト x100")
CinemaTab:CreateLabel("• フィナーレエフェクト x100")
CinemaTab:CreateLabel("• 最終闇爆発 x50")

local TestButton = CinemaTab:CreateButton({
   Name = "🎬 演出のみをテスト再生",
   Callback = function()
        PlayDarkDescentCutscene(game.Players.LocalPlayer)
   end,
})

-- ========== 闇設定タブ ========== --
DarkTab:CreateLabel("🌙 闇の演出設定")
DarkTab:CreateLabel("明るさを抑えた暗闇テーマ")

local DarknessSlider = DarkTab:CreateSlider({
    Name = "闇の濃さ",
    Range = {0, 100},
    Increment = 1,
    Suffix = "%",
    CurrentValue = 70,
    Flag = "DarknessLevel",
    Callback = function(value)
        _G.DarknessLevel = value / 100
    end,
})

local WingBrightnessSlider = DarkTab:CreateSlider({
    Name = "翼の明るさ",
    Range = {10, 50},
    Increment = 1,
    Suffix = "%",
    CurrentValue = 30,
    Flag = "WingBrightness",
    Callback = function(value)
        _G.WingBrightness = value / 100
    end,
})

local ParticleDensitySlider = DarkTab:CreateSlider({
    Name = "粒子密度",
    Range = {20, 100},
    Increment = 1,
    Suffix = "%",
    CurrentValue = 50,
    Flag = "ParticleDensity",
    Callback = function(value)
        _G.ParticleDensity = value / 100
    end,
})

-- デフォルト設定
_G.DarknessLevel = 0.7
_G.WingBrightness = 0.3
_G.ParticleDensity = 0.5

Rayfield:Notify({
   Title = "🌙 影刃 DARK ULTRA 900",
   Content = "900種類の暗闇アニメーション搭載！\n控えめな光量で目に優しい",
   Duration = 5,
   Image = 4483362458,
})
