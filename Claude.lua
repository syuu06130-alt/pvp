--[[
    剣名: 影刃 (Kageba) - Ultimate Cutscene Edition
    特徴: 100種類のアニメーション演出 + プレイヤー降臨演出
]]

-- Rayfield UIのロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = "影刃 - Ultimate Cutscene",
   LoadingTitle = "超豪華演出準備中...",
   LoadingSubtitle = "by Shadow Forge Cinema",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "KagebaCinema"
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

-- ========== 超豪華召喚演出関数 ========== --
local function PlayUltimateCutscene(player)
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
        Title = "🎬 影刃召喚儀式開始",
        Content = "天から降臨する伝説の戦士...",
        Duration = 3,
        Image = 4483362458,
    })
    
    -- ========== 演出用ステージ作成 ========== --
    local StageCenter = HumanoidRootPart.Position + Vector3.new(0, 50, 0)
    
    -- 天空のプラットフォーム
    local SkyPlatform = Instance.new("Part")
    SkyPlatform.Size = Vector3.new(30, 1, 30)
    SkyPlatform.Position = StageCenter + Vector3.new(0, 20, 0)
    SkyPlatform.Anchored = true
    SkyPlatform.Transparency = 1
    SkyPlatform.CanCollide = false
    SkyPlatform.Parent = workspace
    
    -- ========== 背景演出（50種類） ========== --
    local BackgroundEffects = {}
    
    -- 1-10: 神秘的な木々
    for i = 1, 10 do
        local Tree = Instance.new("Part")
        Tree.Size = Vector3.new(3, 15 + math.random(0, 10), 3)
        Tree.Material = Enum.Material.Wood
        Tree.Color = Color3.fromRGB(40, 25, 15)
        Tree.Anchored = true
        Tree.CanCollide = false
        local angle = (i / 10) * math.pi * 2
        Tree.Position = StageCenter + Vector3.new(math.cos(angle) * 25, -5, math.sin(angle) * 25)
        Tree.Parent = workspace
        table.insert(BackgroundEffects, Tree)
        
        -- 木の葉エフェクト
        local Leaves = Instance.new("Part")
        Leaves.Size = Vector3.new(6, 6, 6)
        Leaves.Shape = Enum.PartType.Ball
        Leaves.Material = Enum.Material.Neon
        Leaves.Color = Color3.fromRGB(0, math.random(100, 150), 0)
        Leaves.Transparency = 0.5
        Leaves.Anchored = true
        Leaves.CanCollide = false
        Leaves.Position = Tree.Position + Vector3.new(0, Tree.Size.Y / 2, 0)
        Leaves.Parent = workspace
        table.insert(BackgroundEffects, Leaves)
    end
    
    -- 11-20: 浮遊する水晶
    for i = 1, 10 do
        local Crystal = Instance.new("Part")
        Crystal.Size = Vector3.new(2, 4, 2)
        Crystal.Material = Enum.Material.Neon
        Crystal.Color = Color3.fromRGB(math.random(50, 150), math.random(50, 150), 255)
        Crystal.Transparency = 0.3
        Crystal.Anchored = true
        Crystal.CanCollide = false
        local angle = (i / 10) * math.pi * 2
        Crystal.Position = StageCenter + Vector3.new(math.cos(angle) * 15, math.random(0, 10), math.sin(angle) * 15)
        Crystal.Parent = workspace
        table.insert(BackgroundEffects, Crystal)
        
        -- 水晶の光
        local CrystalLight = Instance.new("PointLight")
        CrystalLight.Color = Crystal.Color
        CrystalLight.Range = 15
        CrystalLight.Brightness = 2
        CrystalLight.Parent = Crystal
        
        -- 回転アニメーション
        task.spawn(function()
            while Crystal.Parent do
                Crystal.CFrame = Crystal.CFrame * CFrame.Angles(0, math.rad(2), 0)
                task.wait(0.03)
            end
        end)
    end
    
    -- 21-30: 古代の柱
    for i = 1, 10 do
        local Pillar = Instance.new("Part")
        Pillar.Size = Vector3.new(2, 20, 2)
        Pillar.Material = Enum.Material.Marble
        Pillar.Color = Color3.fromRGB(200, 200, 220)
        Pillar.Anchored = true
        Pillar.CanCollide = false
        local angle = (i / 10) * math.pi * 2
        Pillar.Position = StageCenter + Vector3.new(math.cos(angle) * 20, -10, math.sin(angle) * 20)
        Pillar.Parent = workspace
        table.insert(BackgroundEffects, Pillar)
        
        -- 柱の装飾
        local PillarTop = Instance.new("Part")
        PillarTop.Size = Vector3.new(3, 1, 3)
        PillarTop.Material = Enum.Material.Marble
        PillarTop.Color = Color3.fromRGB(180, 180, 200)
        PillarTop.Anchored = true
        PillarTop.CanCollide = false
        PillarTop.Position = Pillar.Position + Vector3.new(0, 10, 0)
        PillarTop.Parent = workspace
        table.insert(BackgroundEffects, PillarTop)
    end
    
    -- 31-35: 魔法陣
    for i = 1, 5 do
        local MagicCircle = Instance.new("Part")
        MagicCircle.Size = Vector3.new(15 + i * 3, 0.5, 15 + i * 3)
        MagicCircle.Shape = Enum.PartType.Cylinder
        MagicCircle.Material = Enum.Material.Neon
        MagicCircle.Color = Color3.fromRGB(100, 50, 200)
        MagicCircle.Transparency = 0.6
        MagicCircle.Anchored = true
        MagicCircle.CanCollide = false
        MagicCircle.Position = StageCenter + Vector3.new(0, -15 + i, 0)
        MagicCircle.Orientation = Vector3.new(0, 0, 90)
        MagicCircle.Parent = workspace
        table.insert(BackgroundEffects, MagicCircle)
        
        -- 回転
        task.spawn(function()
            while MagicCircle.Parent do
                MagicCircle.CFrame = MagicCircle.CFrame * CFrame.Angles(0, math.rad(1 * i), 0)
                task.wait(0.03)
            end
        end)
    end
    
    -- 36-40: 浮遊する本
    for i = 1, 5 do
        local Book = Instance.new("Part")
        Book.Size = Vector3.new(1.5, 0.3, 2)
        Book.Material = Enum.Material.SmoothPlastic
        Book.Color = Color3.fromRGB(100, 50, 20)
        Book.Anchored = true
        Book.CanCollide = false
        local angle = (i / 5) * math.pi * 2
        Book.Position = StageCenter + Vector3.new(math.cos(angle) * 10, 5, math.sin(angle) * 10)
        Book.Parent = workspace
        table.insert(BackgroundEffects, Book)
        
        -- ページめくりアニメーション
        task.spawn(function()
            while Book.Parent do
                Book.CFrame = Book.CFrame * CFrame.Angles(math.rad(1), math.rad(0.5), 0)
                Book.Position = Book.Position + Vector3.new(0, math.sin(tick() * 2) * 0.05, 0)
                task.wait(0.03)
            end
        end)
    end
    
    -- 41-45: 炎の柱
    for i = 1, 5 do
        local FirePillar = Instance.new("Part")
        FirePillar.Size = Vector3.new(3, 25, 3)
        FirePillar.Material = Enum.Material.Neon
        FirePillar.Color = Color3.fromRGB(255, 100, 0)
        FirePillar.Transparency = 0.4
        FirePillar.Anchored = true
        FirePillar.CanCollide = false
        local angle = (i / 5) * math.pi * 2
        FirePillar.Position = StageCenter + Vector3.new(math.cos(angle) * 30, -5, math.sin(angle) * 30)
        FirePillar.Parent = workspace
        table.insert(BackgroundEffects, FirePillar)
        
        -- 炎パーティクル
        local Fire = Instance.new("ParticleEmitter")
        Fire.Texture = "rbxassetid://6101261905"
        Fire.Color = ColorSequence.new(Color3.fromRGB(255, 150, 0))
        Fire.Size = NumberSequence.new(3)
        Fire.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.5),
            NumberSequenceKeypoint.new(1, 1)
        })
        Fire.Lifetime = NumberRange.new(1, 2)
        Fire.Rate = 50
        Fire.Speed = NumberRange.new(5)
        Fire.Parent = FirePillar
    end
    
    -- 46-50: 星空エフェクト
    for i = 1, 5 do
        local StarField = Instance.new("Part")
        StarField.Size = Vector3.new(60, 60, 0.5)
        StarField.Material = Enum.Material.Neon
        StarField.Color = Color3.fromRGB(10, 10, 30)
        StarField.Transparency = 0.7
        StarField.Anchored = true
        StarField.CanCollide = false
        StarField.Position = StageCenter + Vector3.new(0, 30, -30 + i * 3)
        StarField.Parent = workspace
        table.insert(BackgroundEffects, StarField)
        
        -- 星パーティクル
        local Stars = Instance.new("ParticleEmitter")
        Stars.Texture = "rbxassetid://241809795"
        Stars.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
        Stars.Size = NumberSequence.new(0.3)
        Stars.Lifetime = NumberRange.new(2, 4)
        Stars.Rate = 30
        Stars.Speed = NumberRange.new(0.5)
        Stars.LightEmission = 1
        Stars.Parent = StarField
    end
    
    -- ========== 階段の作成 ========== --
    local Stairs = {}
    for i = 1, 10 do
        local Stair = Instance.new("Part")
        Stair.Size = Vector3.new(8, 0.6, 4)
        Stair.Position = SkyPlatform.Position - Vector3.new(0, i * 2, i * 2)
        Stair.Material = Enum.Material.Neon
        Stair.Color = Color3.fromRGB(10, 10, 20)
        Stair.Anchored = true
        Stair.CanCollide = true
        Stair.Transparency = 0.2
        Stair.Parent = workspace
        table.insert(Stairs, Stair)
        
        -- 階段の光
        local StairLight = Instance.new("PointLight")
        StairLight.Color = Color3.fromRGB(80, 120, 255)
        StairLight.Range = 12
        StairLight.Brightness = 2
        StairLight.Parent = Stair
        
        -- 階段のパーティクル
        local StairParticle = Instance.new("ParticleEmitter")
        StairParticle.Texture = "rbxassetid://241809795"
        StairParticle.Color = ColorSequence.new(Color3.fromRGB(100, 150, 255))
        StairParticle.Size = NumberSequence.new(0.2)
        StairParticle.Lifetime = NumberRange.new(1, 2)
        StairParticle.Rate = 20
        StairParticle.Speed = NumberRange.new(1)
        StairParticle.LightEmission = 1
        StairParticle.Parent = Stair
    end
    
    -- ========== プレイヤーを天空に移動 ========== --
    HumanoidRootPart.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(0, 5, 0))
    
    -- ========== 白い翼の追加 ========== --
    local LeftWing = Instance.new("Part")
    LeftWing.Size = Vector3.new(0.5, 8, 4)
    LeftWing.Material = Enum.Material.Neon
    LeftWing.Color = Color3.fromRGB(255, 255, 255)
    LeftWing.Transparency = 0.3
    LeftWing.CanCollide = false
    LeftWing.Parent = Character
    
    local LeftWingMesh = Instance.new("SpecialMesh")
    LeftWingMesh.MeshType = Enum.MeshType.Wedge
    LeftWingMesh.Parent = LeftWing
    
    local LeftWingWeld = Instance.new("Weld")
    LeftWingWeld.Part0 = HumanoidRootPart
    LeftWingWeld.Part1 = LeftWing
    LeftWingWeld.C0 = CFrame.new(-1, 1, 0.5) * CFrame.Angles(0, math.rad(30), math.rad(-20))
    LeftWingWeld.Parent = HumanoidRootPart
    
    local RightWing = LeftWing:Clone()
    RightWing.Parent = Character
    
    local RightWingWeld = Instance.new("Weld")
    RightWingWeld.Part0 = HumanoidRootPart
    RightWingWeld.Part1 = RightWing
    RightWingWeld.C0 = CFrame.new(1, 1, 0.5) * CFrame.Angles(0, math.rad(-30), math.rad(20))
    RightWingWeld.Parent = HumanoidRootPart
    
    -- 翼のオーラ
    local WingAura1 = Instance.new("ParticleEmitter")
    WingAura1.Texture = "rbxassetid://241809795"
    WingAura1.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
    WingAura1.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(1, 1.5)
    })
    WingAura1.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(1, 1)
    })
    WingAura1.Lifetime = NumberRange.new(1, 2)
    WingAura1.Rate = 50
    WingAura1.Speed = NumberRange.new(2, 4)
    WingAura1.LightEmission = 1
    WingAura1.Parent = LeftWing
    
    local WingAura2 = WingAura1:Clone()
    WingAura2.Parent = RightWing
    
    -- ========== 天から降臨サウンド ========== --
    local DescentSound = Instance.new("Sound")
    DescentSound.SoundId = "rbxassetid://1843463175"
    DescentSound.Volume = 1
    DescentSound.Parent = HumanoidRootPart
    DescentSound:Play()
    
    -- ========== プレイヤーアニメーション50種類 ========== --
    
    -- カメラアングル1: 上空から
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(0, 30, 30), SkyPlatform.Position)
    
    task.wait(1)
    
    -- 1-10: 翼を広げる演出
    for i = 1, 10 do
        LeftWingWeld.C0 = LeftWingWeld.C0 * CFrame.Angles(0, 0, math.rad(-3))
        RightWingWeld.C0 = RightWingWeld.C0 * CFrame.Angles(0, 0, math.rad(3))
        
        -- 光の輪
        local Halo = Instance.new("Part")
        Halo.Size = Vector3.new(0.5, 0.5, 0.5)
        Halo.Shape = Enum.PartType.Ball
        Halo.Material = Enum.Material.Neon
        Halo.Color = Color3.fromRGB(255, 255, 200)
        Halo.Transparency = 0.4
        Halo.Anchored = true
        Halo.CanCollide = false
        Halo.Position = HumanoidRootPart.Position + Vector3.new(0, 3, 0)
        Halo.Parent = workspace
        
        task.spawn(function()
            for j = 1, 20 do
                Halo.Size = Halo.Size + Vector3.new(0.5, 0.5, 0.5)
                Halo.Transparency = 0.4 + (j / 20) * 0.6
                task.wait(0.02)
            end
            Halo:Destroy()
        end)
        
        task.wait(0.1)
    end
    
    -- カメラアングル2: 横から
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(40, 0, 0), SkyPlatform.Position)
    
    -- 11-20: 階段を降りるアニメーション開始準備
    for i = 1, 10 do
        -- 全身発光
        local BodyGlow = Instance.new("PointLight")
        BodyGlow.Color = Color3.fromRGB(255, 255, 255)
        BodyGlow.Range = 15 + i
        BodyGlow.Brightness = 3
        BodyGlow.Parent = HumanoidRootPart
        
        task.delay(0.5, function()
            BodyGlow:Destroy()
        end)
        
        -- 光の粒子
        local LightParticle = Instance.new("Part")
        LightParticle.Size = Vector3.new(0.3, 0.3, 0.3)
        LightParticle.Shape = Enum.PartType.Ball
        LightParticle.Material = Enum.Material.Neon
        LightParticle.Color = Color3.fromRGB(255, 255, math.random(200, 255))
        LightParticle.Transparency = 0.2
        LightParticle.Anchored = true
        LightParticle.CanCollide = false
        local angle = (i / 10) * math.pi * 2
        LightParticle.Position = HumanoidRootPart.Position + Vector3.new(math.cos(angle) * 3, math.random(-2, 2), math.sin(angle) * 3)
        LightParticle.Parent = workspace
        
        task.delay(1, function()
            LightParticle:Destroy()
        end)
        
        task.wait(0.1)
    end
    
    -- カメラアングル3: 正面から
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(0, 0, 25), SkyPlatform.Position)
    
    -- 21-30: 階段を一歩ずつ降りる（各ステップで複数演出）
    for step = 1, 10 do
        local targetStair = Stairs[step]
        
        -- TPアニメーション
        -- 消失エフェクト
        local DisappearEffect = Instance.new("Part")
        DisappearEffect.Size = Vector3.new(3, 3, 3)
        DisappearEffect.Shape = Enum.PartType.Ball
        DisappearEffect.Material = Enum.Material.Neon
        DisappearEffect.Color = Color3.fromRGB(255, 255, 255)
        DisappearEffect.Transparency = 0.2
        DisappearEffect.Anchored = true
        DisappearEffect.CanCollide = false
        DisappearEffect.Position = HumanoidRootPart.Position
        DisappearEffect.Parent = workspace
        
        task.spawn(function()
            for i = 1, 15 do
                DisappearEffect.Size = DisappearEffect.Size + Vector3.new(0.3, 0.3, 0.3)
                DisappearEffect.Transparency = 0.2 + (i / 15) * 0.8
                task.wait(0.02)
            end
            DisappearEffect:Destroy()
        end)
        
        -- テレポート
        HumanoidRootPart.CFrame = CFrame.new(targetStair.Position + Vector3.new(0, 2, 0))
        
        -- 出現エフェクト
        local AppearEffect = Instance.new("Part")
        AppearEffect.Size = Vector3.new(0.5, 0.5, 0.5)
        AppearEffect.Shape = Enum.PartType.Ball
        AppearEffect.Material = Enum.Material.Neon
        AppearEffect.Color = Color3.fromRGB(255, 255, 255)
        AppearEffect.Transparency = 0
        AppearEffect.Anchored = true
        AppearEffect.CanCollide = false
        AppearEffect.Position = HumanoidRootPart.Position
        AppearEffect.Parent = workspace
        
        task.spawn(function()
            for i = 1, 15 do
                AppearEffect.Size = AppearEffect.Size + Vector3.new(0.5, 0.5, 0.5)
                AppearEffect.Transparency = (i / 15)
                task.wait(0.02)
            end
            AppearEffect:Destroy()
        end)
        
        -- 階段着地音
        local StepSound = Instance.new("Sound")
        StepSound.SoundId = "rbxassetid://5095207895"
        StepSound.Volume = 0.5
        StepSound.Pitch = 1 + (step * 0.05)
        StepSound.Parent = targetStair
        StepSound:Play()
        task.delay(1, function() StepSound:Destroy() end)
        
        -- 階段周りのエフェクト (5種類 x 10ステップ = 50)
        for effectNum = 1, 5 do
            local angle = (effectNum / 5) * math.pi * 2
            
            if effectNum == 1 then
                -- 光の柱
                local LightBeam = Instance.new("Part")
                LightBeam.Size = Vector3.new(1, 10, 1)
                LightBeam.Material = Enum.Material.Neon
                LightBeam.Color = Color3.fromRGB(255, 255, 200)
                LightBeam.Transparency = 0.5
                LightBeam.Anchored = true
                LightBeam.CanCollide = false
                LightBeam.Position = targetStair.Position + Vector3.new(math.cos(angle) * 4, 0, math.sin(angle) * 4)
                LightBeam.Parent = workspace
                task.delay(0.8, function() LightBeam:Destroy() end)
                
            elseif effectNum == 2 then
                -- 魔法陣の輝き
                local MagicGlow = Instance.new("Part")
                MagicGlow.Size = Vector3.new(6, 0.2, 6)
                MagicGlow.Shape = Enum.PartType.Cylinder
                MagicGlow.Material = Enum.Material.Neon
                MagicGlow.Color = Color3.fromRGB(150, 100, 255)
                MagicGlow.Transparency = 0.4
                MagicGlow.Anchored = true
                MagicGlow.CanCollide = false
                MagicGlow.Position = targetStair.Position
                MagicGlow.Orientation = Vector3.new(0, 0, 90)
                MagicGlow.Parent = workspace
                
                task.spawn(function()
                    for i = 1, 20 do
                        MagicGlow.CFrame = MagicGlow.CFrame * CFrame.Angles(0, math.rad(5), 0)
                        task.wait(0.03)
                    end
                    MagicGlow:Destroy()
                end)
                
            elseif effectNum == 3 then
                -- 炎の渦
                local FireVortex = Instance.new("Part")
                FireVortex.Size = Vector3.new(2, 5, 2)
                FireVortex.Material = Enum.Material.Neon
                FireVortex.Color = Color3.fromRGB(255, 150, 0)
                FireVortex.Transparency = 0.6
                FireVortex.Anchored = true
                FireVortex.CanCollide = false
                FireVortex.Position = targetStair.Position + Vector3.new(math.cos(angle) * 5, 2, math.sin(angle) * 5)
                FireVortex.Parent = workspace
                
                local FireParticle = Instance.new("ParticleEmitter")
                FireParticle.Texture = "rbxassetid://6101261905"
                FireParticle.Color = ColorSequence.new(Color3.fromRGB(255, 100, 0))
                FireParticle.Size = NumberSequence.new(1.5)
                FireParticle.Lifetime = NumberRange.new(0.5)
                FireParticle.Rate = 30
                FireParticle.Speed = NumberRange.new(3)
                FireParticle.Parent = FireVortex
                
                task.delay(0.8, function() FireVortex:Destroy() end)
                
            elseif effectNum == 4 then
                -- 電撃
                local Lightning = Instance.new("Part")
                Lightning.Size = Vector3.new(0.3, 8, 0.3)
                Lightning.Material = Enum.Material.Neon
                Lightning.Color = Color3.fromRGB(100, 200, 255)
                Lightning.Transparency = 0.3
                Lightning.Anchored = true
                Lightning.CanCollide = false
                Lightning.Position = targetStair.Position + Vector3.new(math.cos(angle) * 3, 4, math.sin(angle) * 3)
                Lightning.Parent = workspace
                
                local LightningLight = Instance.new("PointLight")
                LightningLight.Color = Color3.fromRGB(100, 200, 255)
                LightningLight.Range = 15
                LightningLight.Brightness = 5
                LightningLight.Parent = Lightning
                
                task.delay(0.3, function() Lightning:Destroy() end)
                
            elseif effectNum == 5 then
                -- 星の軌跡
                local StarTrail = Instance.new("Part")
                StarTrail.Size = Vector3.new(0.5, 0.5, 0.5)
                StarTrail.Shape = Enum.PartType.Ball
                StarTrail.Material = Enum.Material.Neon
                StarTrail.Color = Color3.fromRGB(255, 255, math.random(150, 255))
                StarTrail.Transparency = 0.2
                StarTrail.Anchored = true
                StarTrail.CanCollide = false
                StarTrail.Position = HumanoidRootPart.Position + Vector3.new(math.cos(angle) * 2, 2, math.sin(angle) * 2)
                StarTrail.Parent = workspace
                
                task.spawn(function()
                    for i = 1, 30 do
                        StarTrail.Position = StarTrail.Position + Vector3.new(0, -0.2, 0)
                        StarTrail.Transparency = 0.2 + (i / 30) * 0.8
                        task.wait(0.02)
                    end
                    StarTrail:Destroy()
                end)
            end
        end
        
        -- カメラをプレイヤーに追従
        Camera.CFrame = CFrame.new(HumanoidRootPart.Position + Vector3.new(10, 5, 15), HumanoidRootPart.Position)
        
        task.wait(1)
    end
    
    -- 31-40: 最終階段到着後の演出
    for i = 1, 10 do
        -- 衝撃波
        local Shockwave = Instance.new("Part")
        Shockwave.Size = Vector3.new(i * 2, 0.5, i * 2)
        Shockwave.Shape = Enum.PartType.Cylinder
        Shockwave.Material = Enum.Material.Neon
        Shockwave.Color = Color3.fromRGB(255, 255, 255)
        Shockwave.Transparency = 0.3 + (i / 10) * 0.7
        Shockwave.Anchored = true
        Shockwave.CanCollide = false
        Shockwave.Position = HumanoidRootPart.Position
        Shockwave.Orientation = Vector3.new(0, 0, 90)
        Shockwave.Parent = workspace
        
        task.delay(0.5, function() Shockwave:Destroy() end)
        
        task.wait(0.1)
    end
    
    -- 41-50: 翼を消失させる演出
    for i = 1, 10 do
        LeftWing.Transparency = 0.3 + (i / 10) * 0.7
        RightWing.Transparency = 0.3 + (i / 10) * 0.7
        
        -- 羽根が散る
        local Feather = Instance.new("Part")
        Feather.Size = Vector3.new(0.3, 0.1, 0.5)
        Feather.Material = Enum.Material.Neon
        Feather.Color = Color3.fromRGB(255, 255, 255)
        Feather.Transparency = 0.2
        Feather.Anchored = true
        Feather.CanCollide = false
        Feather.Position = LeftWing.Position
        Feather.Parent = workspace
        
        task.spawn(function()
            for j = 1, 40 do
                Feather.Position = Feather.Position + Vector3.new(math.random(-1, 1) * 0.1, -0.2, math.random(-1, 1) * 0.1)
                Feather.CFrame = Feather.CFrame * CFrame.Angles(math.rad(5), math.rad(5), math.rad(5))
                Feather.Transparency = 0.2 + (j / 40) * 0.8
                task.wait(0.03)
            end
            Feather:Destroy()
        end)
        
        task.wait(0.1)
    end
    
    -- 翼を削除
    LeftWing:Destroy()
    RightWing:Destroy()
    
    -- 最終エフェクト音
    local FinalSound = Instance.new("Sound")
    FinalSound.SoundId = "rbxassetid://9125402735"
    FinalSound.Volume = 1.2
    FinalSound.Parent = HumanoidRootPart
    FinalSound:Play()
    
    -- プレイヤーを元の位置に戻す
    HumanoidRootPart.CFrame = OriginalPosition
    
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
        Title = "✨ 降臨完了",
        Content = "伝説の戦士が地上に舞い降りた",
        Duration = 3,
        Image = 4483362458,
    })
end

-- ========== 剣生成関数 ========== --
local function CreateKagebaFinal()
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
    HandleGrip.Color = Color3.fromRGB(3, 3, 5)
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
    Pommel.Color = Color3.fromRGB(2, 2, 4)
    Pommel.Reflectance = 0.3
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
    Guard.Color = Color3.fromRGB(8, 8, 12)
    Guard.Reflectance = 0.25
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
    Blade.Reflectance = 0.5
    Blade.Transparency = 0.03
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

    local DarkAura = Instance.new("ParticleEmitter", Blade)
    DarkAura.Texture = "rbxassetid://243662263"
    DarkAura.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
    DarkAura.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(0.5, 1.8),
        NumberSequenceKeypoint.new(1, 3)
    })
    DarkAura.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(1, 1)
    })
    DarkAura.Lifetime = NumberRange.new(1.5, 3)
    DarkAura.Rate = 35
    DarkAura.Speed = NumberRange.new(0.8, 2.5)

    local Unsheath = Instance.new("Sound", Handle)
    Unsheath.SoundId = "rbxassetid://12222225"
    Unsheath.Volume = 1

    local SwordSlash = Instance.new("Sound", Handle)
    SwordSlash.SoundId = "rbxassetid://12222216"
    SwordSlash.Volume = 1.3

    local VerticalSlashAnim = Instance.new("Animation", tool)
    VerticalSlashAnim.AnimationId = "rbxassetid://186934658"
    local AnimTrack = plr.Character.Humanoid:LoadAnimation(VerticalSlashAnim)

    local db = true
    local da = false

    tool.Equipped:Connect(function()
        Unsheath:Play()
        DarkAura.Rate = 55
        
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
        DarkAura.Rate = 35
        da = false
        db = true
    end)

    Blade.Touched:Connect(function(hit)
        if da == true then
            local enemyHumanoid = hit.Parent:FindFirstChild("Humanoid")
            if enemyHumanoid ~= nil then
                enemyHumanoid:TakeDamage(55)
            end
        end
    end)

    Rayfield:Notify({
        Title = "⚔️ 影刃 - 召喚完了",
        Content = "闇の力が解き放たれた",
        Duration = 4,
        Image = 4483362458,
    })
end

-- ========== メインタブ ========== --
local SummonButton = MainTab:CreateButton({
   Name = "⚔️ 影刃を召喚する（超豪華演出）",
   Callback = function()
        PlayUltimateCutscene(game.Players.LocalPlayer)
        wait(12)
        CreateKagebaFinal()
   end,
})

local QuickSummonButton = MainTab:CreateButton({
   Name = "⚡ 影刃を即座に召喚（演出なし）",
   Callback = function()
        CreateKagebaFinal()
   end,
})

-- ========== 演出タブ ========== --
CinemaTab:CreateLabel("🎬 超豪華演出の内容")
CinemaTab:CreateLabel("合計: 100種類のアニメーション")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("背景演出 (50種類):")
CinemaTab:CreateLabel("• 神秘的な木々 x10")
CinemaTab:CreateLabel("• 浮遊水晶 x10")
CinemaTab:CreateLabel("• 古代の柱 x10")
CinemaTab:CreateLabel("• 魔法陣 x5")
CinemaTab:CreateLabel("• 浮遊する本 x5")
CinemaTab:CreateLabel("• 炎の柱 x5")
CinemaTab:CreateLabel("• 星空 x5")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("プレイヤー演出 (50種類):")
CinemaTab:CreateLabel("• 白い翼 + オーラ")
CinemaTab:CreateLabel("• 翼を広げる x10")
CinemaTab:CreateLabel("• 全身発光 x10")
CinemaTab:CreateLabel("• 階段降下 (各5種) x10")
CinemaTab:CreateLabel("• 衝撃波 x10")
CinemaTab:CreateLabel("• 翼消失 x10")

local TestButton = CinemaTab:CreateButton({
   Name = "🎬 演出のみをテスト再生",
   Callback = function()
        PlayUltimateCutscene(game.Players.LocalPlayer)
   end,
})

Rayfield:Notify({
   Title = "🌟 影刃 Ultimate Cutscene",
   Content = "100種類のアニメーション搭載！",
   Duration = 5,
   Image = 4483362458,
})
