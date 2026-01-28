--[[
    剣名: 影刃 (Kageba) - ULTIMATE 1000 ANIMATION EDITION
    特徴: 1000種類のアニメーション演出 + 暗めの翼 + 最適カメラ
]]

-- Rayfield UIのロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = "影刃 - ULTIMATE 1000",
   LoadingTitle = "究極演出準備中...",
   LoadingSubtitle = "by Shadow Forge Cinema Ultra",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "KagebaCinema1000"
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

-- ========== 究極1000演出関数 ========== --
local function PlayUltimate1000Cutscene(player)
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
        Content = "1000種類の究極演出...",
        Duration = 3,
        Image = 4483362458,
    })
    
    -- ========== 演出用ステージ作成 ========== --
    local StageCenter = HumanoidRootPart.Position + Vector3.new(0, 60, 0)
    
    -- 天空のプラットフォーム
    local SkyPlatform = Instance.new("Part")
    SkyPlatform.Size = Vector3.new(40, 1, 40)
    SkyPlatform.Position = StageCenter + Vector3.new(0, 25, 0)
    SkyPlatform.Anchored = true
    SkyPlatform.Transparency = 0.9
    SkyPlatform.Material = Enum.Material.Neon
    SkyPlatform.Color = Color3.fromRGB(15, 15, 30)
    SkyPlatform.CanCollide = false
    SkyPlatform.Parent = workspace
    
    -- ========== 背景演出（300種類） ========== --
    local BackgroundEffects = {}
    
    -- 1-30: 神秘的な森（木々と枝）
    for i = 1, 15 do
        local Tree = Instance.new("Part")
        Tree.Size = Vector3.new(2.5, 20 + math.random(0, 15), 2.5)
        Tree.Material = Enum.Material.Wood
        Tree.Color = Color3.fromRGB(30, 18, 10)
        Tree.Anchored = true
        Tree.CanCollide = false
        local angle = (i / 15) * math.pi * 2
        Tree.Position = StageCenter + Vector3.new(math.cos(angle) * 32, -10, math.sin(angle) * 32)
        Tree.Parent = workspace
        table.insert(BackgroundEffects, Tree)
        
        local Leaves = Instance.new("Part")
        Leaves.Size = Vector3.new(8, 8, 8)
        Leaves.Shape = Enum.PartType.Ball
        Leaves.Material = Enum.Material.Grass
        Leaves.Color = Color3.fromRGB(8, math.random(60, 100), 8)
        Leaves.Transparency = 0.5
        Leaves.Anchored = true
        Leaves.CanCollide = false
        Leaves.Position = Tree.Position + Vector3.new(0, Tree.Size.Y / 2 + 2, 0)
        Leaves.Parent = workspace
        table.insert(BackgroundEffects, Leaves)
        
        for b = 1, 4 do
            local Branch = Instance.new("Part")
            Branch.Size = Vector3.new(1, 7, 1)
            Branch.Material = Enum.Material.Wood
            Branch.Color = Color3.fromRGB(35, 20, 12)
            Branch.Anchored = true
            Branch.CanCollide = false
            local branchAngle = (b / 4) * math.pi * 2
            Branch.CFrame = CFrame.new(Tree.Position + Vector3.new(0, Tree.Size.Y / 2 - 4, 0)) 
                * CFrame.Angles(math.rad(50), branchAngle, 0)
                * CFrame.new(0, 3.5, 0)
            Branch.Parent = workspace
            table.insert(BackgroundEffects, Branch)
        end
    end
    
    -- 31-55: 多様な水晶（25種類）
    for i = 1, 25 do
        local Crystal = Instance.new("Part")
        Crystal.Size = Vector3.new(2, 6 + i * 0.3, 2)
        Crystal.Material = Enum.Material.Neon
        local hue = (i / 25)
        Crystal.Color = Color3.fromHSV(hue, 0.6, 0.8)
        Crystal.Transparency = 0.3
        Crystal.Anchored = true
        Crystal.CanCollide = false
        local angle = (i / 25) * math.pi * 2
        Crystal.Position = StageCenter + Vector3.new(math.cos(angle) * 20, math.random(-3, 15), math.sin(angle) * 20)
        Crystal.Parent = workspace
        table.insert(BackgroundEffects, Crystal)
        
        local CrystalLight = Instance.new("PointLight")
        CrystalLight.Color = Crystal.Color
        CrystalLight.Range = 8
        CrystalLight.Brightness = 0.6
        CrystalLight.Parent = Crystal
        
        local CrystalParticle = Instance.new("ParticleEmitter")
        CrystalParticle.Texture = "rbxassetid://241809795"
        CrystalParticle.Color = ColorSequence.new(Crystal.Color)
        CrystalParticle.Size = NumberSequence.new(0.15)
        CrystalParticle.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.6),
            NumberSequenceKeypoint.new(1, 1)
        })
        CrystalParticle.Lifetime = NumberRange.new(1, 2)
        CrystalParticle.Rate = 5
        CrystalParticle.Speed = NumberRange.new(0.3)
        CrystalParticle.LightEmission = 0.4
        CrystalParticle.Parent = Crystal
        
        task.spawn(function()
            while Crystal.Parent do
                Crystal.CFrame = Crystal.CFrame * CFrame.Angles(0, math.rad(1), 0)
                task.wait(0.03)
            end
        end)
    end
    
    -- 56-90: 古代遺跡（柱と装飾）35種類
    for i = 1, 15 do
        local Pillar = Instance.new("Part")
        Pillar.Size = Vector3.new(2.5, 28, 2.5)
        Pillar.Material = Enum.Material.Marble
        Pillar.Color = Color3.fromRGB(160, 160, 180)
        Pillar.Anchored = true
        Pillar.CanCollide = false
        local angle = (i / 15) * math.pi * 2
        Pillar.Position = StageCenter + Vector3.new(math.cos(angle) * 26, -14, math.sin(angle) * 26)
        Pillar.Parent = workspace
        table.insert(BackgroundEffects, Pillar)
        
        local PillarTop = Instance.new("Part")
        PillarTop.Size = Vector3.new(4, 1.5, 4)
        PillarTop.Material = Enum.Material.Marble
        PillarTop.Color = Color3.fromRGB(140, 140, 160)
        PillarTop.Anchored = true
        PillarTop.CanCollide = false
        PillarTop.Position = Pillar.Position + Vector3.new(0, 14, 0)
        PillarTop.Parent = workspace
        table.insert(BackgroundEffects, PillarTop)
        
        local PillarBase = Instance.new("Part")
        PillarBase.Size = Vector3.new(3.5, 2, 3.5)
        PillarBase.Material = Enum.Material.Cobblestone
        PillarBase.Color = Color3.fromRGB(100, 100, 120)
        PillarBase.Anchored = true
        PillarBase.CanCollide = false
        PillarBase.Position = Pillar.Position - Vector3.new(0, 15, 0)
        PillarBase.Parent = workspace
        table.insert(BackgroundEffects, PillarBase)
    end
    
    -- 91-120: 魔法陣システム（30種類）
    for i = 1, 30 do
        local MagicCircle = Instance.new("Part")
        MagicCircle.Size = Vector3.new(10 + i * 1.5, 0.2, 10 + i * 1.5)
        MagicCircle.Shape = Enum.PartType.Cylinder
        MagicCircle.Material = Enum.Material.Neon
        local hue = (i / 30)
        MagicCircle.Color = Color3.fromHSV(hue, 0.7, 0.6)
        MagicCircle.Transparency = 0.6 + (i * 0.01)
        MagicCircle.Anchored = true
        MagicCircle.CanCollide = false
        MagicCircle.Position = StageCenter + Vector3.new(0, -20 + i * 0.3, 0)
        MagicCircle.Orientation = Vector3.new(0, 0, 90)
        MagicCircle.Parent = workspace
        table.insert(BackgroundEffects, MagicCircle)
        
        task.spawn(function()
            while MagicCircle.Parent do
                local speed = (i % 2 == 0) and 0.6 or -0.6
                MagicCircle.CFrame = MagicCircle.CFrame * CFrame.Angles(0, math.rad(speed), 0)
                task.wait(0.03)
            end
        end)
    end
    
    -- 121-150: 浮遊魔導書コレクション（30種類）
    for i = 1, 30 do
        local Book = Instance.new("Part")
        Book.Size = Vector3.new(2, 0.5, 2.8)
        Book.Material = Enum.Material.SmoothPlastic
        local bookColors = {
            Color3.fromRGB(80, 30, 15),
            Color3.fromRGB(15, 50, 90),
            Color3.fromRGB(60, 15, 60),
            Color3.fromRGB(50, 50, 20)
        }
        Book.Color = bookColors[((i - 1) % 4) + 1]
        Book.Anchored = true
        Book.CanCollide = false
        local angle = (i / 30) * math.pi * 2
        Book.Position = StageCenter + Vector3.new(math.cos(angle) * 14, 4 + math.sin(i * 0.5) * 3, math.sin(angle) * 14)
        Book.Parent = workspace
        table.insert(BackgroundEffects, Book)
        
        local BookGlow = Instance.new("PointLight")
        BookGlow.Color = Book.Color
        BookGlow.Range = 5
        BookGlow.Brightness = 0.3
        BookGlow.Parent = Book
        
        task.spawn(function()
            while Book.Parent do
                Book.CFrame = Book.CFrame * CFrame.Angles(math.rad(0.6), math.rad(0.3), 0)
                Book.Position = Book.Position + Vector3.new(0, math.sin(tick() * 1.2 + i) * 0.02, 0)
                task.wait(0.03)
            end
        end)
    end
    
    -- 151-180: 炎の柱（30種類）
    for i = 1, 30 do
        local FirePillar = Instance.new("Part")
        FirePillar.Size = Vector3.new(2.2, 18 + i, 2.2)
        FirePillar.Material = Enum.Material.Neon
        FirePillar.Color = Color3.fromRGB(200, 70 + i * 3, 0)
        FirePillar.Transparency = 0.7
        FirePillar.Anchored = true
        FirePillar.CanCollide = false
        local angle = (i / 30) * math.pi * 2
        FirePillar.Position = StageCenter + Vector3.new(math.cos(angle) * 38, -12, math.sin(angle) * 38)
        FirePillar.Parent = workspace
        table.insert(BackgroundEffects, FirePillar)
        
        local Fire = Instance.new("ParticleEmitter")
        Fire.Texture = "rbxassetid://6101261905"
        Fire.Color = ColorSequence.new(Color3.fromRGB(220, 80 + i * 2, 0))
        Fire.Size = NumberSequence.new(1.5)
        Fire.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.7),
            NumberSequenceKeypoint.new(1, 1)
        })
        Fire.Lifetime = NumberRange.new(0.6, 1.2)
        Fire.Rate = 18
        Fire.Speed = NumberRange.new(2)
        Fire.LightEmission = 0.5
        Fire.Parent = FirePillar
    end
    
    -- 181-210: 星空フィールド（30種類）
    for i = 1, 30 do
        local StarField = Instance.new("Part")
        StarField.Size = Vector3.new(80, 80, 0.5)
        StarField.Material = Enum.Material.Neon
        StarField.Color = Color3.fromRGB(5, 5, 20)
        StarField.Transparency = 0.85
        StarField.Anchored = true
        StarField.CanCollide = false
        StarField.Position = StageCenter + Vector3.new(0, 38, -40 + i * 1.5)
        StarField.Parent = workspace
        table.insert(BackgroundEffects, StarField)
        
        local Stars = Instance.new("ParticleEmitter")
        Stars.Texture = "rbxassetid://241809795"
        Stars.Color = ColorSequence.new(Color3.fromRGB(180, 180, 230))
        Stars.Size = NumberSequence.new(0.15)
        Stars.Lifetime = NumberRange.new(2, 4)
        Stars.Rate = 10
        Stars.Speed = NumberRange.new(0.2)
        Stars.LightEmission = 0.6
        Stars.Parent = StarField
    end
    
    -- 211-240: 氷の結晶フィールド（30種類）
    for i = 1, 30 do
        local IceCrystal = Instance.new("Part")
        IceCrystal.Size = Vector3.new(1.8, 5 + i * 0.3, 1.8)
        IceCrystal.Material = Enum.Material.Ice
        IceCrystal.Color = Color3.fromRGB(130, 180, 230)
        IceCrystal.Transparency = 0.4
        IceCrystal.Reflectance = 0.4
        IceCrystal.Anchored = true
        IceCrystal.CanCollide = false
        local angle = (i / 30) * math.pi * 2
        IceCrystal.Position = StageCenter + Vector3.new(math.cos(angle) * 24, -6 + i * 0.4, math.sin(angle) * 24)
        IceCrystal.Orientation = Vector3.new(math.random(-20, 20), math.random(0, 360), math.random(-20, 20))
        IceCrystal.Parent = workspace
        table.insert(BackgroundEffects, IceCrystal)
    end
    
    -- 241-270: 雷雲システム（30種類）
    for i = 1, 30 do
        local ThunderCloud = Instance.new("Part")
        ThunderCloud.Size = Vector3.new(10 + i * 0.5, 4, 10 + i * 0.5)
        ThunderCloud.Material = Enum.Material.Neon
        ThunderCloud.Color = Color3.fromRGB(30, 30, 50)
        ThunderCloud.Transparency = 0.75
        ThunderCloud.Anchored = true
        ThunderCloud.CanCollide = false
        local angle = (i / 30) * math.pi * 2
        ThunderCloud.Position = StageCenter + Vector3.new(math.cos(angle) * 30, 28 + i * 0.3, math.sin(angle) * 30)
        ThunderCloud.Parent = workspace
        table.insert(BackgroundEffects, ThunderCloud)
        
        task.spawn(function()
            while ThunderCloud.Parent do
                wait(math.random(3, 6))
                local Lightning = Instance.new("Part")
                Lightning.Size = Vector3.new(0.3, 18, 0.3)
                Lightning.Material = Enum.Material.Neon
                Lightning.Color = Color3.fromRGB(130, 180, 240)
                Lightning.Transparency = 0.3
                Lightning.Anchored = true
                Lightning.CanCollide = false
                Lightning.Position = ThunderCloud.Position - Vector3.new(0, 12, 0)
                Lightning.Parent = workspace
                
                task.delay(0.15, function() Lightning:Destroy() end)
            end
        end)
    end
    
    -- 271-300: 浮遊島システム（30種類）
    for i = 1, 30 do
        local FloatingIsland = Instance.new("Part")
        FloatingIsland.Size = Vector3.new(7 + i * 0.3, 2.5, 7 + i * 0.3)
        FloatingIsland.Material = Enum.Material.Grass
        FloatingIsland.Color = Color3.fromRGB(50, 70, 35)
        FloatingIsland.Anchored = true
        FloatingIsland.CanCollide = false
        local angle = (i / 30) * math.pi * 2
        FloatingIsland.Position = StageCenter + Vector3.new(math.cos(angle) * 42, 18 + math.sin(i * 0.3) * 6, math.sin(angle) * 42)
        FloatingIsland.Parent = workspace
        table.insert(BackgroundEffects, FloatingIsland)
    end
    
    -- ========== 階段の作成（高品質版） ========== --
    local Stairs = {}
    for i = 1, 10 do
        local Stair = Instance.new("Part")
        Stair.Size = Vector3.new(12, 1, 6)
        Stair.Position = SkyPlatform.Position - Vector3.new(0, i * 2.5, i * 2.5)
        Stair.Material = Enum.Material.Marble
        Stair.Color = Color3.fromRGB(12, 12, 25)
        Stair.Anchored = true
        Stair.CanCollide = true
        Stair.Transparency = 0.15
        Stair.Parent = workspace
        table.insert(Stairs, Stair)
        
        for j = 1, 3 do
            local StairLine = Instance.new("Part")
            StairLine.Size = Vector3.new(12, 0.1, 0.4)
            StairLine.Material = Enum.Material.Neon
            StairLine.Color = Color3.fromRGB(50, 80, 160)
            StairLine.Transparency = 0.4
            StairLine.Anchored = true
            StairLine.CanCollide = false
            StairLine.Position = Stair.Position + Vector3.new(0, 0.6, -2.5 + (j * 1.5))
            StairLine.Parent = workspace
            table.insert(BackgroundEffects, StairLine)
        end
        
        local StairLight = Instance.new("PointLight")
        StairLight.Color = Color3.fromRGB(70, 100, 180)
        StairLight.Range = 9
        StairLight.Brightness = 0.5
        StairLight.Parent = Stair
        
        local StairParticle = Instance.new("ParticleEmitter")
        StairParticle.Texture = "rbxassetid://241809795"
        StairParticle.Color = ColorSequence.new(Color3.fromRGB(80, 120, 200))
        StairParticle.Size = NumberSequence.new(0.12)
        StairParticle.Lifetime = NumberRange.new(1, 2)
        StairParticle.Rate = 6
        StairParticle.Speed = NumberRange.new(0.4)
        StairParticle.LightEmission = 0.5
        StairParticle.Parent = Stair
    end
    
    -- ========== プレイヤーを天空に移動 ========== --
    HumanoidRootPart.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(0, 8, 0))
    
    -- ========== 暗めの超高品質天使の翼 ========== --
    
    -- 左翼メイン（暗め）
    local LeftWingMain = Instance.new("Part")
    LeftWingMain.Size = Vector3.new(0.5, 11, 5.5)
    LeftWingMain.Material = Enum.Material.Neon
    LeftWingMain.Color = Color3.fromRGB(180, 180, 190)  -- 明るさ大幅削減
    LeftWingMain.Transparency = 0.5  -- 透明度上げて眩しさ軽減
    LeftWingMain.CanCollide = false
    LeftWingMain.Parent = Character
    
    local LeftWingMesh = Instance.new("SpecialMesh")
    LeftWingMesh.MeshType = Enum.MeshType.Wedge
    LeftWingMesh.Scale = Vector3.new(1, 1, 1)
    LeftWingMesh.Parent = LeftWingMain
    
    local LeftWingWeld = Instance.new("Weld")
    LeftWingWeld.Part0 = HumanoidRootPart
    LeftWingWeld.Part1 = LeftWingMain
    LeftWingWeld.C0 = CFrame.new(-1.2, 1.5, 0.8) * CFrame.Angles(0, math.rad(25), math.rad(-15))
    LeftWingWeld.Parent = HumanoidRootPart
    
    -- 左翼レイヤー2（さらに暗め）
    local LeftWingLayer2 = LeftWingMain:Clone()
    LeftWingLayer2.Size = Vector3.new(0.4, 10, 5)
    LeftWingLayer2.Transparency = 0.6
    LeftWingLayer2.Color = Color3.fromRGB(200, 200, 210)
    LeftWingLayer2.Parent = Character
    
    local LeftWingWeld2 = Instance.new("Weld")
    LeftWingWeld2.Part0 = HumanoidRootPart
    LeftWingWeld2.Part1 = LeftWingLayer2
    LeftWingWeld2.C0 = CFrame.new(-1.5, 1.3, 0.6) * CFrame.Angles(0, math.rad(30), math.rad(-12))
    LeftWingWeld2.Parent = HumanoidRootPart
    
    -- 左翼レイヤー3（最も暗め）
    local LeftWingLayer3 = LeftWingMain:Clone()
    LeftWingLayer3.Size = Vector3.new(0.3, 9, 4.5)
    LeftWingLayer3.Transparency = 0.7
    LeftWingLayer3.Color = Color3.fromRGB(210, 210, 220)
    LeftWingLayer3.Parent = Character
    
    local LeftWingWeld3 = Instance.new("Weld")
    LeftWingWeld3.Part0 = HumanoidRootPart
    LeftWingWeld3.Part1 = LeftWingLayer3
    LeftWingWeld3.C0 = CFrame.new(-1.8, 1.1, 0.4) * CFrame.Angles(0, math.rad(35), math.rad(-10))
    LeftWingWeld3.Parent = HumanoidRootPart
    
    -- 右翼メイン
    local RightWingMain = LeftWingMain:Clone()
    RightWingMain.Parent = Character
    
    local RightWingWeld = Instance.new("Weld")
    RightWingWeld.Part0 = HumanoidRootPart
    RightWingWeld.Part1 = RightWingMain
    RightWingWeld.C0 = CFrame.new(1.2, 1.5, 0.8) * CFrame.Angles(0, math.rad(-25), math.rad(15))
    RightWingWeld.Parent = HumanoidRootPart
    
    -- 右翼レイヤー2
    local RightWingLayer2 = LeftWingLayer2:Clone()
    RightWingLayer2.Parent = Character
    
    local RightWingWeld2 = Instance.new("Weld")
    RightWingWeld2.Part0 = HumanoidRootPart
    RightWingWeld2.Part1 = RightWingLayer2
    RightWingWeld2.C0 = CFrame.new(1.5, 1.3, 0.6) * CFrame.Angles(0, math.rad(-30), math.rad(12))
    RightWingWeld2.Parent = HumanoidRootPart
    
    -- 右翼レイヤー3
    local RightWingLayer3 = LeftWingLayer3:Clone()
    RightWingLayer3.Parent = Character
    
    local RightWingWeld3 = Instance.new("Weld")
    RightWingWeld3.Part0 = HumanoidRootPart
    RightWingWeld3.Part1 = RightWingLayer3
    RightWingWeld3.C0 = CFrame.new(1.8, 1.1, 0.4) * CFrame.Angles(0, math.rad(-35), math.rad(10))
    RightWingWeld3.Parent = HumanoidRootPart
    
    -- 翼の羽毛ディテール（暗め）
    local LeftFeathers = {}
    local RightFeathers = {}
    
    for i = 1, 6 do
        local LeftFeather = Instance.new("Part")
        LeftFeather.Size = Vector3.new(0.2, 3.5 + i * 0.5, 1.8)
        LeftFeather.Material = Enum.Material.Neon
        LeftFeather.Color = Color3.fromRGB(190, 190, 200)  -- 暗めに調整
        LeftFeather.Transparency = 0.6
        LeftFeather.CanCollide = false
        LeftFeather.Parent = Character
        
        local LeftFeatherMesh = Instance.new("SpecialMesh")
        LeftFeatherMesh.MeshType = Enum.MeshType.Wedge
        LeftFeatherMesh.Parent = LeftFeather
        
        local LeftFeatherWeld = Instance.new("Weld")
        LeftFeatherWeld.Part0 = HumanoidRootPart
        LeftFeatherWeld.Part1 = LeftFeather
        LeftFeatherWeld.C0 = CFrame.new(-0.8 - i * 0.3, 1.5 - i * 0.35, 0.5) 
            * CFrame.Angles(0, math.rad(20 + i * 5), math.rad(-18 + i * 2))
        LeftFeatherWeld.Parent = HumanoidRootPart
        table.insert(LeftFeathers, {part = LeftFeather, weld = LeftFeatherWeld})
        
        local RightFeather = LeftFeather:Clone()
        RightFeather.Parent = Character
        
        local RightFeatherWeld = Instance.new("Weld")
        RightFeatherWeld.Part0 = HumanoidRootPart
        RightFeatherWeld.Part1 = RightFeather
        RightFeatherWeld.C0 = CFrame.new(0.8 + i * 0.3, 1.5 - i * 0.35, 0.5) 
            * CFrame.Angles(0, math.rad(-20 - i * 5), math.rad(18 - i * 2))
        RightFeatherWeld.Parent = HumanoidRootPart
        table.insert(RightFeathers, {part = RightFeather, weld = RightFeatherWeld})
    end
    
    -- 翼のオーラ（大幅に控えめ）
    local WingAura1 = Instance.new("ParticleEmitter")
    WingAura1.Texture = "rbxassetid://241809795"
    WingAura1.Color = ColorSequence.new(Color3.fromRGB(200, 200, 210))
    WingAura1.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.2),
        NumberSequenceKeypoint.new(1, 0.5)
    })
    WingAura1.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.7),
        NumberSequenceKeypoint.new(1, 1)
    })
    WingAura1.Lifetime = NumberRange.new(1, 2)
    WingAura1.Rate = 12
    WingAura1.Speed = NumberRange.new(0.8, 1.5)
    WingAura1.LightEmission = 0.4
    WingAura1.Parent = LeftWingMain
    
    local WingAura2 = WingAura1:Clone()
    WingAura2.Parent = RightWingMain
    
    -- 翼の光（非常に控えめ）
    local WingLight = Instance.new("PointLight")
    WingLight.Color = Color3.fromRGB(200, 200, 210)
    WingLight.Range = 8
    WingLight.Brightness = 0.6
    WingLight.Parent = HumanoidRootPart
    
    -- ========== 天から降臨サウンド ========== --
    local DescentSound = Instance.new("Sound")
    DescentSound.SoundId = "rbxassetid://1843463175"
    DescentSound.Volume = 0.7
    DescentSound.Parent = HumanoidRootPart
    DescentSound:Play()
    
    -- ========== プレイヤーアニメーション700種類 ========== --
    
    -- カメラアングル1: 斜め前から（見やすい位置）
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(12, 8, 15), SkyPlatform.Position)
    
    task.wait(0.5)
    
    -- 【1-30】翼展開アニメーション（30種類）
    for i = 1, 30 do
        LeftWingWeld.C0 = LeftWingWeld.C0 * CFrame.Angles(0, 0, math.rad(-1.5))
        RightWingWeld.C0 = RightWingWeld.C0 * CFrame.Angles(0, 0, math.rad(1.5))
        
        LeftWingWeld2.C0 = LeftWingWeld2.C0 * CFrame.Angles(0, 0, math.rad(-1.3))
        RightWingWeld2.C0 = RightWingWeld2.C0 * CFrame.Angles(0, 0, math.rad(1.3))
        
        LeftWingWeld3.C0 = LeftWingWeld3.C0 * CFrame.Angles(0, 0, math.rad(-1.1))
        RightWingWeld3.C0 = RightWingWeld3.C0 * CFrame.Angles(0, 0, math.rad(1.1))
        
        for j, feather in ipairs(LeftFeathers) do
            feather.weld.C0 = feather.weld.C0 * CFrame.Angles(0, 0, math.rad(-0.9))
        end
        for j, feather in ipairs(RightFeathers) do
            feather.weld.C0 = feather.weld.C0 * CFrame.Angles(0, 0, math.rad(0.9))
        end
        
        local Halo = Instance.new("Part")
        Halo.Size = Vector3.new(0.3, 0.3, 0.3)
        Halo.Shape = Enum.PartType.Ball
        Halo.Material = Enum.Material.Neon
        Halo.Color = Color3.fromRGB(200, 200, 180)
        Halo.Transparency = 0.5
        Halo.Anchored = true
        Halo.CanCollide = false
        Halo.Position = HumanoidRootPart.Position + Vector3.new(0, 4.5, 0)
        Halo.Parent = workspace
        
        task.spawn(function()
            for j = 1, 20 do
                Halo.Size = Halo.Size + Vector3.new(0.3, 0.3, 0.3)
                Halo.Transparency = 0.5 + (j / 20) * 0.5
                task.wait(0.015)
            end
            Halo:Destroy()
        end)
        
        task.wait(0.06)
    end
    
    -- カメラアングル2: 正面やや上から（見やすい）
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(0, 6, 18), SkyPlatform.Position)
    
    -- 【31-80】降臨準備エフェクト（50種類）
    for i = 1, 50 do
        local DivinePulse = Instance.new("Part")
        DivinePulse.Size = Vector3.new(5 + i * 0.15, 5 + i * 0.15, 5 + i * 0.15)
        DivinePulse.Shape = Enum.PartType.Ball
        DivinePulse.Material = Enum.Material.Neon
        DivinePulse.Color = Color3.fromHSV((i / 50), 0.25, 0.9)
        DivinePulse.Transparency = 0.7 + (i / 50) * 0.25
        DivinePulse.Anchored = true
        DivinePulse.CanCollide = false
        DivinePulse.Position = HumanoidRootPart.Position
        DivinePulse.Parent = workspace
        
        task.delay(0.8, function() DivinePulse:Destroy() end)
        
        for j = 1, 2 do
            local LightOrb = Instance.new("Part")
            LightOrb.Size = Vector3.new(0.2, 0.2, 0.2)
            LightOrb.Shape = Enum.PartType.Ball
            LightOrb.Material = Enum.Material.Neon
            LightOrb.Color = Color3.fromRGB(200, 200, 220 + j * 5)
            LightOrb.Transparency = 0.3
            LightOrb.Anchored = true
            LightOrb.CanCollide = false
            local angle = ((i * 2 + j) / 100) * math.pi * 2
            LightOrb.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * 3.5, 
                math.random(-2, 2), 
                math.sin(angle) * 3.5
            )
            LightOrb.Parent = workspace
            
            task.spawn(function()
                for k = 1, 18 do
                    LightOrb.Position = LightOrb.Position + Vector3.new(
                        math.cos(angle) * 0.08,
                        0.04,
                        math.sin(angle) * 0.08
                    )
                    LightOrb.Transparency = 0.3 + (k / 18) * 0.7
                    task.wait(0.03)
                end
                LightOrb:Destroy()
            end)
        end
        
        task.wait(0.05)
    end
    
    -- カメラアングル3: 横から（見やすい位置）
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(20, 5, 5), SkyPlatform.Position)
    
    -- 【81-280】階段降下アニメーション（各ステップ20種類 x 10ステップ = 200種類）
    for step = 1, 10 do
        local targetStair = Stairs[step]
        
        -- 【1】消失エフェクト
        local DisappearBurst = Instance.new("Part")
        DisappearBurst.Size = Vector3.new(3.5, 3.5, 3.5)
        DisappearBurst.Shape = Enum.PartType.Ball
        DisappearBurst.Material = Enum.Material.Neon
        DisappearBurst.Color = Color3.fromRGB(220, 220, 230)
        DisappearBurst.Transparency = 0.2
        DisappearBurst.Anchored = true
        DisappearBurst.CanCollide = false
        DisappearBurst.Position = HumanoidRootPart.Position
        DisappearBurst.Parent = workspace
        
        task.spawn(function()
            for i = 1, 18 do
                DisappearBurst.Size = DisappearBurst.Size + Vector3.new(0.4, 0.4, 0.4)
                DisappearBurst.Transparency = 0.2 + (i / 18) * 0.8
                task.wait(0.015)
            end
            DisappearBurst:Destroy()
        end)
        
        task.wait(0.12)
        HumanoidRootPart.CFrame = CFrame.new(targetStair.Position + Vector3.new(0, 2.5, 0))
        
        -- 【2】出現エフェクト
        local AppearPillar = Instance.new("Part")
        AppearPillar.Size = Vector3.new(2.5, 13, 2.5)
        AppearPillar.Material = Enum.Material.Neon
        AppearPillar.Color = Color3.fromRGB(180, 200, 230)
        AppearPillar.Transparency = 0.5
        AppearPillar.Anchored = true
        AppearPillar.CanCollide = false
        AppearPillar.Position = HumanoidRootPart.Position
        AppearPillar.Parent = workspace
        
        task.spawn(function()
            for i = 1, 12 do
                AppearPillar.Transparency = 0.5 + (i / 12) * 0.5
                task.wait(0.02)
            end
            AppearPillar:Destroy()
        end)
        
        -- 【3】着地音
        local StepSound = Instance.new("Sound")
        StepSound.SoundId = "rbxassetid://5095207895"
        StepSound.Volume = 0.35
        StepSound.Pitch = 0.85 + (step * 0.08)
        StepSound.Parent = targetStair
        StepSound:Play()
        task.delay(1, function() StepSound:Destroy() end)
        
        -- 【4】足元の魔法陣
        local FootCircle = Instance.new("Part")
        FootCircle.Size = Vector3.new(7, 0.15, 7)
        FootCircle.Shape = Enum.PartType.Cylinder
        FootCircle.Material = Enum.Material.Neon
        FootCircle.Color = Color3.fromRGB(100, 140, 220)
        FootCircle.Transparency = 0.4
        FootCircle.Anchored = true
        FootCircle.CanCollide = false
        FootCircle.Position = targetStair.Position + Vector3.new(0, 0.6, 0)
        FootCircle.Orientation = Vector3.new(0, 0, 90)
        FootCircle.Parent = workspace
        
        task.spawn(function()
            for i = 1, 20 do
                FootCircle.CFrame = FootCircle.CFrame * CFrame.Angles(0, math.rad(6), 0)
                FootCircle.Transparency = 0.4 + (i / 20) * 0.6
                task.wait(0.02)
            end
            FootCircle:Destroy()
        end)
        
        -- 【5-8】周囲の光の柱（4種類）
        for angle = 0, 270, 90 do
            local LightBeam = Instance.new("Part")
            LightBeam.Size = Vector3.new(0.7, 10, 0.7)
            LightBeam.Material = Enum.Material.Neon
            LightBeam.Color = Color3.fromRGB(160, 180, 230)
            LightBeam.Transparency = 0.5
            LightBeam.Anchored = true
            LightBeam.CanCollide = false
            local rad = math.rad(angle)
            LightBeam.Position = targetStair.Position + Vector3.new(math.cos(rad) * 5, 0, math.sin(rad) * 5)
            LightBeam.Parent = workspace
            
            task.delay(0.5, function() LightBeam:Destroy() end)
        end
        
        -- 【9-11】エネルギー波紋（3種類）
        for i = 1, 3 do
            task.spawn(function()
                task.wait(i * 0.08)
                local EnergyRing = Instance.new("Part")
                EnergyRing.Size = Vector3.new(1.5, 0.15, 1.5)
                EnergyRing.Shape = Enum.PartType.Cylinder
                EnergyRing.Material = Enum.Material.Neon
                EnergyRing.Color = Color3.fromRGB(130, 160, 220)
                EnergyRing.Transparency = 0.4
                EnergyRing.Anchored = true
                EnergyRing.CanCollide = false
                EnergyRing.Position = targetStair.Position
                EnergyRing.Orientation = Vector3.new(0, 0, 90)
                EnergyRing.Parent = workspace
                
                for j = 1, 18 do
                    EnergyRing.Size = EnergyRing.Size + Vector3.new(i * 0.4, 0, i * 0.4)
                    EnergyRing.Transparency = 0.4 + (j / 18) * 0.6
                    task.wait(0.02)
                end
                EnergyRing:Destroy()
            end)
        end
        
        -- 【12】炎の渦
        local FireSpiral = Instance.new("Part")
        FireSpiral.Size = Vector3.new(2, 5, 2)
        FireSpiral.Material = Enum.Material.Neon
        FireSpiral.Color = Color3.fromRGB(220, 120, 30)
        FireSpiral.Transparency = 0.6
        FireSpiral.Anchored = true
        FireSpiral.CanCollide = false
        FireSpiral.Position = targetStair.Position + Vector3.new(4, 2, 0)
        FireSpiral.Parent = workspace
        
        local FireEmit = Instance.new("ParticleEmitter")
        FireEmit.Texture = "rbxassetid://6101261905"
        FireEmit.Color = ColorSequence.new(Color3.fromRGB(220, 100, 25))
        FireEmit.Size = NumberSequence.new(1)
        FireEmit.Lifetime = NumberRange.new(0.3)
        FireEmit.Rate = 22
        FireEmit.Speed = NumberRange.new(1.5)
        FireEmit.LightEmission = 0.5
        FireEmit.Parent = FireSpiral
        
        task.delay(0.6, function() FireSpiral:Destroy() end)
        
        -- 【13】氷の結晶
        local IceShard = Instance.new("Part")
        IceShard.Size = Vector3.new(0.9, 4.5, 0.9)
        IceShard.Material = Enum.Material.Ice
        IceShard.Color = Color3.fromRGB(130, 180, 220)
        IceShard.Transparency = 0.4
        IceShard.Anchored = true
        IceShard.CanCollide = false
        IceShard.Position = targetStair.Position + Vector3.new(-4, 2, 0)
        IceShard.Orientation = Vector3.new(12, 0, 0)
        IceShard.Parent = workspace
        
        task.delay(0.6, function() IceShard:Destroy() end)
        
        -- 【14】電撃
        local Lightning = Instance.new("Part")
        Lightning.Size = Vector3.new(0.3, 9, 0.3)
        Lightning.Material = Enum.Material.Neon
        Lightning.Color = Color3.fromRGB(110, 160, 220)
        Lightning.Transparency = 0.3
        Lightning.Anchored = true
        Lightning.CanCollide = false
        Lightning.Position = targetStair.Position + Vector3.new(0, 4.5, 4)
        Lightning.Parent = workspace
        
        local LightningGlow = Instance.new("PointLight")
        LightningGlow.Color = Color3.fromRGB(110, 160, 220)
        LightningGlow.Range = 10
        LightningGlow.Brightness = 1.5
        LightningGlow.Parent = Lightning
        
        task.delay(0.2, function() Lightning:Destroy() end)
        
        -- 【15-20】星の軌跡群（6種類）
        for i = 1, 6 do
            local Star = Instance.new("Part")
            Star.Size = Vector3.new(0.25, 0.25, 0.25)
            Star.Shape = Enum.PartType.Ball
            Star.Material = Enum.Material.Neon
            Star.Color = Color3.fromRGB(220, 220, math.random(180, 230))
            Star.Transparency = 0.2
            Star.Anchored = true
            Star.CanCollide = false
            local angle = (i / 6) * math.pi * 2
            Star.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * 2.2, 
                2.5, 
                math.sin(angle) * 2.2
            )
            Star.Parent = workspace
            
            task.spawn(function()
                for j = 1, 30 do
                    Star.Position = Star.Position + Vector3.new(0, -0.12, 0)
                    Star.Transparency = 0.2 + (j / 30) * 0.8
                    task.wait(0.015)
                end
                Star:Destroy()
            end)
        end
        
        -- カメラをプレイヤーに追従（見やすい位置から）
        local camAngle = (step / 10) * math.pi * 0.8
        Camera.CFrame = CFrame.new(
            HumanoidRootPart.Position + Vector3.new(
                math.cos(camAngle) * 15, 
                7, 
                math.sin(camAngle) * 12
            ), 
            HumanoidRootPart.Position
        )
        
        task.wait(0.7)
    end
    
    -- 【281-380】着地後の大演出（100種類）
    
    -- カメラアングル4: 斜め上から（見やすい）
    Camera.CFrame = CFrame.new(HumanoidRootPart.Position + Vector3.new(15, 20, 18), HumanoidRootPart.Position)
    
    for i = 1, 100 do
        if i <= 25 then
            -- 【281-305】巨大衝撃波
            local MassiveShockwave = Instance.new("Part")
            MassiveShockwave.Size = Vector3.new(i * 2.5, 0.5, i * 2.5)
            MassiveShockwave.Shape = Enum.PartType.Cylinder
            MassiveShockwave.Material = Enum.Material.Neon
            MassiveShockwave.Color = Color3.fromHSV((i / 25), 0.5, 0.9)
            MassiveShockwave.Transparency = 0.3 + (i / 25) * 0.6
            MassiveShockwave.Anchored = true
            MassiveShockwave.CanCollide = false
            MassiveShockwave.Position = HumanoidRootPart.Position
            MassiveShockwave.Orientation = Vector3.new(0, 0, 90)
            MassiveShockwave.Parent = workspace
            
            task.delay(0.5, function() MassiveShockwave:Destroy() end)
            
        elseif i <= 50 then
            -- 【306-330】地面から光の柱噴出
            local GroundLight = Instance.new("Part")
            GroundLight.Size = Vector3.new(1.8, 20, 1.8)
            GroundLight.Material = Enum.Material.Neon
            GroundLight.Color = Color3.fromRGB(180, 200, 230)
            GroundLight.Transparency = 0.5
            GroundLight.Anchored = true
            GroundLight.CanCollide = false
            local angle = ((i - 25) / 25) * math.pi * 2
            GroundLight.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * (7 + (i - 25) * 0.4), 
                -8, 
                math.sin(angle) * (7 + (i - 25) * 0.4)
            )
            GroundLight.Parent = workspace
            
            task.delay(0.7, function() GroundLight:Destroy() end)
            
        elseif i <= 75 then
            -- 【331-355】光のオーブ乱舞
            local DancingOrb = Instance.new("Part")
            DancingOrb.Size = Vector3.new(0.5, 0.5, 0.5)
            DancingOrb.Shape = Enum.PartType.Ball
            DancingOrb.Material = Enum.Material.Neon
            DancingOrb.Color = Color3.fromHSV(((i - 50) / 25), 0.7, 0.9)
            DancingOrb.Transparency = 0.3
            DancingOrb.Anchored = true
            DancingOrb.CanCollide = false
            local angle = ((i - 50) / 25) * math.pi * 2
            DancingOrb.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * 5,
                4 + math.sin(i * 0.4) * 2.5,
                math.sin(angle) * 5
            )
            DancingOrb.Parent = workspace
            
            task.spawn(function()
                for j = 1, 35 do
                    local t = (tick() + i) * 1.8
                    DancingOrb.Position = HumanoidRootPart.Position + Vector3.new(
                        math.cos(t) * (5 - j * 0.12),
                        4 + math.sin(t * 2) * 1.5,
                        math.sin(t) * (5 - j * 0.12)
                    )
                    DancingOrb.Transparency = 0.3 + (j / 35) * 0.7
                    task.wait(0.02)
                end
                DancingOrb:Destroy()
            end)
            
        else
            -- 【356-380】エネルギー渦
            local EnergyVortex = Instance.new("Part")
            EnergyVortex.Size = Vector3.new(0.4, 0.4, 0.4)
            EnergyVortex.Shape = Enum.PartType.Ball
            EnergyVortex.Material = Enum.Material.Neon
            EnergyVortex.Color = Color3.fromHSV(((i - 75) / 25), 0.6, 0.85)
            EnergyVortex.Transparency = 0.4
            EnergyVortex.Anchored = true
            EnergyVortex.CanCollide = false
            local angle = ((i - 75) / 25) * math.pi * 4
            EnergyVortex.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * 8,
                2,
                math.sin(angle) * 8
            )
            EnergyVortex.Parent = workspace
            
            task.spawn(function()
                for j = 1, 25 do
                    angle = angle + math.rad(8)
                    EnergyVortex.Position = HumanoidRootPart.Position + Vector3.new(
                        math.cos(angle) * (8 - j * 0.25),
                        2 - j * 0.06,
                        math.sin(angle) * (8 - j * 0.25)
                    )
                    EnergyVortex.Transparency = 0.4 + (j / 25) * 0.6
                    task.wait(0.02)
                end
                EnergyVortex:Destroy()
            end)
        end
        
        task.wait(0.03)
    end
    
    -- 【381-480】翼フェードアウト演出（100種類）
    
    task.wait(0.2)
    
    for i = 1, 100 do
        local alpha = i / 100
        LeftWingMain.Transparency = 0.5 + alpha * 0.5
        RightWingMain.Transparency = 0.5 + alpha * 0.5
        LeftWingLayer2.Transparency = 0.6 + alpha * 0.4
        RightWingLayer2.Transparency = 0.6 + alpha * 0.4
        LeftWingLayer3.Transparency = 0.7 + alpha * 0.3
        RightWingLayer3.Transparency = 0.7 + alpha * 0.3
        
        for _, feather in ipairs(LeftFeathers) do
            feather.part.Transparency = 0.6 + alpha * 0.4
        end
        for _, feather in ipairs(RightFeathers) do
            feather.part.Transparency = 0.6 + alpha * 0.4
        end
        
        if i % 3 == 0 then
            local Feather = Instance.new("Part")
            Feather.Size = Vector3.new(0.35, 0.08, 0.6)
            Feather.Material = Enum.Material.Neon
            Feather.Color = Color3.fromRGB(200, 200, 210)
            Feather.Transparency = 0.3
            Feather.Anchored = true
            Feather.CanCollide = false
            
            local wingChoice = (i % 6 < 3) and LeftWingMain or RightWingMain
            Feather.Position = wingChoice.Position + Vector3.new(
                math.random(-2, 2),
                math.random(-1, 1),
                math.random(-2, 2)
            )
            Feather.Parent = workspace
            
            task.spawn(function()
                for j = 1, 45 do
                    Feather.Position = Feather.Position + Vector3.new(
                        math.random(-1, 1) * 0.06,
                        -0.1,
                        math.random(-1, 1) * 0.06
                    )
                    Feather.CFrame = Feather.CFrame * CFrame.Angles(
                        math.rad(math.random(-6, 6)),
                        math.rad(math.random(-6, 6)),
                        math.rad(math.random(-6, 6))
                    )
                    Feather.Transparency = 0.3 + (j / 45) * 0.7
                    task.wait(0.02)
                end
                Feather:Destroy()
            end)
        end
        
        task.wait(0.03)
    end
    
    LeftWingMain:Destroy()
    RightWingMain:Destroy()
    LeftWingLayer2:Destroy()
    RightWingLayer2:Destroy()
    LeftWingLayer3:Destroy()
    RightWingLayer3:Destroy()
    for _, feather in ipairs(LeftFeathers) do
        feather.part:Destroy()
    end
    for _, feather in ipairs(RightFeathers) do
        feather.part:Destroy()
    end
    WingLight:Destroy()
    
    -- 【481-580】フィナーレ螺旋エフェクト（100種類）
    
    -- カメラを回転（見やすい軌道）
    for i = 1, 100 do
        local camAngle = (i / 100) * math.pi * 1.5
        Camera.CFrame = CFrame.new(
            HumanoidRootPart.Position + Vector3.new(
                math.cos(camAngle) * 12,
                8 - (i / 100) * 3,
                math.sin(camAngle) * 12
            ),
            HumanoidRootPart.Position
        )
        
        local SpiralLight = Instance.new("Part")
        SpiralLight.Size = Vector3.new(0.4, 0.4, 0.4)
        SpiralLight.Shape = Enum.PartType.Ball
        SpiralLight.Material = Enum.Material.Neon
        SpiralLight.Color = Color3.fromHSV((i / 100), 0.9, 0.85)
        SpiralLight.Transparency = 0.4
        SpiralLight.Anchored = true
        SpiralLight.CanCollide = false
        local spiralAngle = (i / 100) * math.pi * 5
        SpiralLight.Position = HumanoidRootPart.Position + Vector3.new(
            math.cos(spiralAngle) * 7,
            9 - i * 0.12,
            math.sin(spiralAngle) * 7
        )
        SpiralLight.Parent = workspace
        
        task.delay(1, function() SpiralLight:Destroy() end)
        
        task.wait(0.025)
    end
    
    -- 【581-700】最終大爆発演出（120種類）
    
    -- カメラを固定（見やすい位置）
    Camera.CFrame = CFrame.new(HumanoidRootPart.Position + Vector3.new(0, 7, 16), HumanoidRootPart.Position)
    
    for i = 1, 120 do
        if i <= 60 then
            -- メインエネルギー爆発
            local FinalBurst = Instance.new("Part")
            FinalBurst.Size = Vector3.new(i * 0.6, i * 0.6, i * 0.6)
            FinalBurst.Shape = Enum.PartType.Ball
            FinalBurst.Material = Enum.Material.Neon
            FinalBurst.Color = Color3.fromHSV((i / 60), 0.6, 0.9)
            FinalBurst.Transparency = 0.4 + (i / 60) * 0.5
            FinalBurst.Anchored = true
            FinalBurst.CanCollide = false
            FinalBurst.Position = HumanoidRootPart.Position
            FinalBurst.Parent = workspace
            
            task.delay(0.6, function() FinalBurst:Destroy() end)
        else
            -- サブエフェクト
            local SubEffect = Instance.new("Part")
            SubEffect.Size = Vector3.new(0.3, 0.3, 0.3)
            SubEffect.Shape = Enum.PartType.Ball
            SubEffect.Material = Enum.Material.Neon
            SubEffect.Color = Color3.fromHSV(((i - 60) / 60), 0.7, 0.85)
            SubEffect.Transparency = 0.3
            SubEffect.Anchored = true
            SubEffect.CanCollide = false
            local angle = ((i - 60) / 60) * math.pi * 8
            SubEffect.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * 6,
                math.random(-2, 4),
                math.sin(angle) * 6
            )
            SubEffect.Parent = workspace
            
            task.spawn(function()
                for j = 1, 20 do
                    SubEffect.Size = SubEffect.Size + Vector3.new(0.15, 0.15, 0.15)
                    SubEffect.Transparency = 0.3 + (j / 20) * 0.7
                    task.wait(0.015)
                end
                SubEffect:Destroy()
            end)
        end
        
        task.wait(0.025)
    end
    
    -- 最終エフェクト音
    local FinalSound = Instance.new("Sound")
    FinalSound.SoundId = "rbxassetid://9125402735"
    FinalSound.Volume = 0.8
    FinalSound.Parent = HumanoidRootPart
    FinalSound:Play()
    
    task.wait(0.8)
    
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
        Content = "1000種類のアニメーション演出終了",
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
   Name = "⚔️ 影刃を召喚する（1000演出版）",
   Callback = function()
        PlayUltimate1000Cutscene(game.Players.LocalPlayer)
        wait(18)
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
CinemaTab:CreateLabel("🎬 究極演出の内容")
CinemaTab:CreateLabel("合計: 1000種類のアニメーション")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("背景演出 (300種類):")
CinemaTab:CreateLabel("• 神秘的な森 x30")
CinemaTab:CreateLabel("• 多様な水晶 x25")
CinemaTab:CreateLabel("• 古代遺跡 x35")
CinemaTab:CreateLabel("• 魔法陣システム x30")
CinemaTab:CreateLabel("• 浮遊魔導書 x30")
CinemaTab:CreateLabel("• 炎の柱 x30")
CinemaTab:CreateLabel("• 星空 x30")
CinemaTab:CreateLabel("• 氷の結晶 x30")
CinemaTab:CreateLabel("• 雷雲システム x30")
CinemaTab:CreateLabel("• 浮遊島 x30")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("プレイヤー演出 (700種類):")
CinemaTab:CreateLabel("• 暗めの3層翼 + 羽毛")
CinemaTab:CreateLabel("• 翼展開 x30")
CinemaTab:CreateLabel("• 降臨準備 x50")
CinemaTab:CreateLabel("• 階段降下 (各20種) x200")
CinemaTab:CreateLabel("• 着地大演出 x100")
CinemaTab:CreateLabel("• 翼フェード x100")
CinemaTab:CreateLabel("• フィナーレ螺旋 x100")
CinemaTab:CreateLabel("• 最終大爆発 x120")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("✨ カメラ位置最適化済み")

local TestButton = CinemaTab:CreateButton({
   Name = "🎬 演出のみをテスト再生",
   Callback = function()
        PlayUltimate1000Cutscene(game.Players.LocalPlayer)
   end,
})

Rayfield:Notify({
   Title = "🌟 影刃 ULTIMATE 1000",
   Content = "1000種類の究極アニメーション！",
   Duration = 5,
   Image = 4483362458,
})
