--[[
    剣名: 影刃 (Kageba) - ULTIMATE 500 ANIMATION EDITION
    特徴: 500種類のアニメーション演出 + 超高品質翼 + 光量調整
]]

-- Rayfield UIのロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = "影刃 - ULTIMATE 500",
   LoadingTitle = "超絶豪華演出準備中...",
   LoadingSubtitle = "by Shadow Forge Cinema Pro",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "KagebaCinema500"
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

-- ========== 超絶豪華召喚演出関数（500アニメーション） ========== --
local function PlayUltimate500Cutscene(player)
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
        Content = "500種類の超絶豪華演出...",
        Duration = 3,
        Image = 4483362458,
    })
    
    -- ========== 演出用ステージ作成 ========== --
    local StageCenter = HumanoidRootPart.Position + Vector3.new(0, 60, 0)
    
    -- 天空のプラットフォーム
    local SkyPlatform = Instance.new("Part")
    SkyPlatform.Size = Vector3.new(35, 1, 35)
    SkyPlatform.Position = StageCenter + Vector3.new(0, 25, 0)
    SkyPlatform.Anchored = true
    SkyPlatform.Transparency = 0.8
    SkyPlatform.Material = Enum.Material.Neon
    SkyPlatform.Color = Color3.fromRGB(20, 20, 40)
    SkyPlatform.CanCollide = false
    SkyPlatform.Parent = workspace
    
    -- ========== 背景演出（150種類） ========== --
    local BackgroundEffects = {}
    
    -- 1-15: 神秘的な木々（改良版）
    for i = 1, 15 do
        local Tree = Instance.new("Part")
        Tree.Size = Vector3.new(2.5, 18 + math.random(0, 12), 2.5)
        Tree.Material = Enum.Material.Wood
        Tree.Color = Color3.fromRGB(35, 20, 12)
        Tree.Anchored = true
        Tree.CanCollide = false
        local angle = (i / 15) * math.pi * 2
        Tree.Position = StageCenter + Vector3.new(math.cos(angle) * 30, -8, math.sin(angle) * 30)
        Tree.Parent = workspace
        table.insert(BackgroundEffects, Tree)
        
        -- 木の葉エフェクト（改良）
        local Leaves = Instance.new("Part")
        Leaves.Size = Vector3.new(7, 7, 7)
        Leaves.Shape = Enum.PartType.Ball
        Leaves.Material = Enum.Material.Grass
        Leaves.Color = Color3.fromRGB(10, math.random(80, 120), 10)
        Leaves.Transparency = 0.4
        Leaves.Anchored = true
        Leaves.CanCollide = false
        Leaves.Position = Tree.Position + Vector3.new(0, Tree.Size.Y / 2 + 2, 0)
        Leaves.Parent = workspace
        table.insert(BackgroundEffects, Leaves)
        
        -- 木の枝
        for b = 1, 3 do
            local Branch = Instance.new("Part")
            Branch.Size = Vector3.new(1, 6, 1)
            Branch.Material = Enum.Material.Wood
            Branch.Color = Color3.fromRGB(40, 25, 15)
            Branch.Anchored = true
            Branch.CanCollide = false
            local branchAngle = (b / 3) * math.pi * 2
            Branch.CFrame = CFrame.new(Tree.Position + Vector3.new(0, Tree.Size.Y / 2 - 3, 0)) 
                * CFrame.Angles(math.rad(45), branchAngle, 0)
                * CFrame.new(0, 3, 0)
            Branch.Parent = workspace
            table.insert(BackgroundEffects, Branch)
        end
    end
    
    -- 16-30: 多様な水晶（15種類）
    for i = 1, 15 do
        local Crystal = Instance.new("Part")
        Crystal.Size = Vector3.new(1.8, 5 + i * 0.3, 1.8)
        Crystal.Material = Enum.Material.Neon
        local hue = (i / 15)
        Crystal.Color = Color3.fromHSV(hue, 0.7, 0.9)
        Crystal.Transparency = 0.2
        Crystal.Anchored = true
        Crystal.CanCollide = false
        local angle = (i / 15) * math.pi * 2
        Crystal.Position = StageCenter + Vector3.new(math.cos(angle) * 18, math.random(-2, 12), math.sin(angle) * 18)
        Crystal.Parent = workspace
        table.insert(BackgroundEffects, Crystal)
        
        -- 水晶の光（控えめ）
        local CrystalLight = Instance.new("PointLight")
        CrystalLight.Color = Crystal.Color
        CrystalLight.Range = 10
        CrystalLight.Brightness = 1
        CrystalLight.Parent = Crystal
        
        -- 水晶パーティクル
        local CrystalParticle = Instance.new("ParticleEmitter")
        CrystalParticle.Texture = "rbxassetid://241809795"
        CrystalParticle.Color = ColorSequence.new(Crystal.Color)
        CrystalParticle.Size = NumberSequence.new(0.2)
        CrystalParticle.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.5),
            NumberSequenceKeypoint.new(1, 1)
        })
        CrystalParticle.Lifetime = NumberRange.new(1, 2)
        CrystalParticle.Rate = 8
        CrystalParticle.Speed = NumberRange.new(0.5)
        CrystalParticle.LightEmission = 0.5
        CrystalParticle.Parent = Crystal
        
        -- 回転アニメーション
        task.spawn(function()
            while Crystal.Parent do
                Crystal.CFrame = Crystal.CFrame * CFrame.Angles(0, math.rad(1.5), 0)
                task.wait(0.03)
            end
        end)
    end
    
    -- 31-50: 古代の柱と装飾（20種類）
    for i = 1, 10 do
        local Pillar = Instance.new("Part")
        Pillar.Size = Vector3.new(2.2, 25, 2.2)
        Pillar.Material = Enum.Material.Marble
        Pillar.Color = Color3.fromRGB(180, 180, 200)
        Pillar.Anchored = true
        Pillar.CanCollide = false
        local angle = (i / 10) * math.pi * 2
        Pillar.Position = StageCenter + Vector3.new(math.cos(angle) * 24, -12, math.sin(angle) * 24)
        Pillar.Parent = workspace
        table.insert(BackgroundEffects, Pillar)
        
        -- 柱の装飾
        local PillarTop = Instance.new("Part")
        PillarTop.Size = Vector3.new(3.5, 1.2, 3.5)
        PillarTop.Material = Enum.Material.Marble
        PillarTop.Color = Color3.fromRGB(160, 160, 180)
        PillarTop.Anchored = true
        PillarTop.CanCollide = false
        PillarTop.Position = Pillar.Position + Vector3.new(0, 12.5, 0)
        PillarTop.Parent = workspace
        table.insert(BackgroundEffects, PillarTop)
    end
    
    -- 51-65: 多層魔法陣（15種類）
    for i = 1, 15 do
        local MagicCircle = Instance.new("Part")
        MagicCircle.Size = Vector3.new(12 + i * 2, 0.3, 12 + i * 2)
        MagicCircle.Shape = Enum.PartType.Cylinder
        MagicCircle.Material = Enum.Material.Neon
        local hue = (i / 15)
        MagicCircle.Color = Color3.fromHSV(hue, 0.8, 0.7)
        MagicCircle.Transparency = 0.5 + (i * 0.02)
        MagicCircle.Anchored = true
        MagicCircle.CanCollide = false
        MagicCircle.Position = StageCenter + Vector3.new(0, -18 + i * 0.5, 0)
        MagicCircle.Orientation = Vector3.new(0, 0, 90)
        MagicCircle.Parent = workspace
        table.insert(BackgroundEffects, MagicCircle)
        
        -- 回転速度を層ごとに変える
        task.spawn(function()
            while MagicCircle.Parent do
                local speed = (i % 2 == 0) and 1 or -1
                MagicCircle.CFrame = MagicCircle.CFrame * CFrame.Angles(0, math.rad(0.8 * speed), 0)
                task.wait(0.03)
            end
        end)
    end
    
    -- 66-80: 浮遊する魔導書（15種類）
    for i = 1, 15 do
        local Book = Instance.new("Part")
        Book.Size = Vector3.new(1.8, 0.4, 2.5)
        Book.Material = Enum.Material.SmoothPlastic
        local bookColors = {
            Color3.fromRGB(100, 40, 20),
            Color3.fromRGB(20, 60, 100),
            Color3.fromRGB(80, 20, 80)
        }
        Book.Color = bookColors[((i - 1) % 3) + 1]
        Book.Anchored = true
        Book.CanCollide = false
        local angle = (i / 15) * math.pi * 2
        Book.Position = StageCenter + Vector3.new(math.cos(angle) * 12, 3 + math.sin(i) * 2, math.sin(angle) * 12)
        Book.Parent = workspace
        table.insert(BackgroundEffects, Book)
        
        -- 本の光り（控えめ）
        local BookGlow = Instance.new("PointLight")
        BookGlow.Color = Book.Color
        BookGlow.Range = 6
        BookGlow.Brightness = 0.5
        BookGlow.Parent = Book
        
        -- ページめくりアニメーション
        task.spawn(function()
            while Book.Parent do
                Book.CFrame = Book.CFrame * CFrame.Angles(math.rad(0.8), math.rad(0.4), 0)
                Book.Position = Book.Position + Vector3.new(0, math.sin(tick() * 1.5 + i) * 0.03, 0)
                task.wait(0.03)
            end
        end)
    end
    
    -- 81-95: 炎の柱（15種類）
    for i = 1, 15 do
        local FirePillar = Instance.new("Part")
        FirePillar.Size = Vector3.new(2.5, 20 + i, 2.5)
        FirePillar.Material = Enum.Material.Neon
        FirePillar.Color = Color3.fromRGB(255, 80 + i * 5, 0)
        FirePillar.Transparency = 0.6
        FirePillar.Anchored = true
        FirePillar.CanCollide = false
        local angle = (i / 15) * math.pi * 2
        FirePillar.Position = StageCenter + Vector3.new(math.cos(angle) * 35, -10, math.sin(angle) * 35)
        FirePillar.Parent = workspace
        table.insert(BackgroundEffects, FirePillar)
        
        -- 炎パーティクル（控えめ）
        local Fire = Instance.new("ParticleEmitter")
        Fire.Texture = "rbxassetid://6101261905"
        Fire.Color = ColorSequence.new(Color3.fromRGB(255, 100 + i * 5, 0))
        Fire.Size = NumberSequence.new(2)
        Fire.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.6),
            NumberSequenceKeypoint.new(1, 1)
        })
        Fire.Lifetime = NumberRange.new(0.8, 1.5)
        Fire.Rate = 25
        Fire.Speed = NumberRange.new(3)
        Fire.LightEmission = 0.7
        Fire.Parent = FirePillar
    end
    
    -- 96-110: 星空フィールド（15種類）
    for i = 1, 15 do
        local StarField = Instance.new("Part")
        StarField.Size = Vector3.new(70, 70, 0.5)
        StarField.Material = Enum.Material.Neon
        StarField.Color = Color3.fromRGB(8, 8, 25)
        StarField.Transparency = 0.8
        StarField.Anchored = true
        StarField.CanCollide = false
        StarField.Position = StageCenter + Vector3.new(0, 35, -35 + i * 2)
        StarField.Parent = workspace
        table.insert(BackgroundEffects, StarField)
        
        -- 星パーティクル（控えめ）
        local Stars = Instance.new("ParticleEmitter")
        Stars.Texture = "rbxassetid://241809795"
        Stars.Color = ColorSequence.new(Color3.fromRGB(200, 200, 255))
        Stars.Size = NumberSequence.new(0.2)
        Stars.Lifetime = NumberRange.new(2, 4)
        Stars.Rate = 15
        Stars.Speed = NumberRange.new(0.3)
        Stars.LightEmission = 0.8
        Stars.Parent = StarField
    end
    
    -- 111-125: 氷の結晶（15種類）
    for i = 1, 15 do
        local IceCrystal = Instance.new("Part")
        IceCrystal.Size = Vector3.new(1.5, 4 + i * 0.4, 1.5)
        IceCrystal.Material = Enum.Material.Ice
        IceCrystal.Color = Color3.fromRGB(150, 200, 255)
        IceCrystal.Transparency = 0.3
        IceCrystal.Reflectance = 0.5
        IceCrystal.Anchored = true
        IceCrystal.CanCollide = false
        local angle = (i / 15) * math.pi * 2
        IceCrystal.Position = StageCenter + Vector3.new(math.cos(angle) * 22, -5 + i * 0.5, math.sin(angle) * 22)
        IceCrystal.Orientation = Vector3.new(math.random(-15, 15), math.random(0, 360), math.random(-15, 15))
        IceCrystal.Parent = workspace
        table.insert(BackgroundEffects, IceCrystal)
    end
    
    -- 126-140: 雷雲（15種類）
    for i = 1, 15 do
        local ThunderCloud = Instance.new("Part")
        ThunderCloud.Size = Vector3.new(8 + i, 3, 8 + i)
        ThunderCloud.Material = Enum.Material.Neon
        ThunderCloud.Color = Color3.fromRGB(40, 40, 60)
        ThunderCloud.Transparency = 0.7
        ThunderCloud.Anchored = true
        ThunderCloud.CanCollide = false
        local angle = (i / 15) * math.pi * 2
        ThunderCloud.Position = StageCenter + Vector3.new(math.cos(angle) * 28, 25 + i, math.sin(angle) * 28)
        ThunderCloud.Parent = workspace
        table.insert(BackgroundEffects, ThunderCloud)
        
        -- 雷エフェクト
        task.spawn(function()
            while ThunderCloud.Parent do
                wait(math.random(2, 5))
                local Lightning = Instance.new("Part")
                Lightning.Size = Vector3.new(0.4, 15, 0.4)
                Lightning.Material = Enum.Material.Neon
                Lightning.Color = Color3.fromRGB(150, 200, 255)
                Lightning.Transparency = 0.2
                Lightning.Anchored = true
                Lightning.CanCollide = false
                Lightning.Position = ThunderCloud.Position - Vector3.new(0, 10, 0)
                Lightning.Parent = workspace
                
                task.delay(0.2, function() Lightning:Destroy() end)
            end
        end)
    end
    
    -- 141-150: 浮遊島（10種類）
    for i = 1, 10 do
        local FloatingIsland = Instance.new("Part")
        FloatingIsland.Size = Vector3.new(6 + i, 2, 6 + i)
        FloatingIsland.Material = Enum.Material.Grass
        FloatingIsland.Color = Color3.fromRGB(60, 80, 40)
        FloatingIsland.Anchored = true
        FloatingIsland.CanCollide = false
        local angle = (i / 10) * math.pi * 2
        FloatingIsland.Position = StageCenter + Vector3.new(math.cos(angle) * 40, 15 + math.sin(i) * 5, math.sin(angle) * 40)
        FloatingIsland.Parent = workspace
        table.insert(BackgroundEffects, FloatingIsland)
    end
    
    -- ========== 階段の作成（高品質版） ========== --
    local Stairs = {}
    for i = 1, 10 do
        local Stair = Instance.new("Part")
        Stair.Size = Vector3.new(10, 0.8, 5)
        Stair.Position = SkyPlatform.Position - Vector3.new(0, i * 2.5, i * 2.5)
        Stair.Material = Enum.Material.Marble
        Stair.Color = Color3.fromRGB(15, 15, 30)
        Stair.Anchored = true
        Stair.CanCollide = true
        Stair.Transparency = 0.1
        Stair.Parent = workspace
        table.insert(Stairs, Stair)
        
        -- 階段の装飾ライン
        for j = 1, 2 do
            local StairLine = Instance.new("Part")
            StairLine.Size = Vector3.new(10, 0.1, 0.3)
            StairLine.Material = Enum.Material.Neon
            StairLine.Color = Color3.fromRGB(60, 100, 200)
            StairLine.Transparency = 0.3
            StairLine.Anchored = true
            StairLine.CanCollide = false
            StairLine.Position = Stair.Position + Vector3.new(0, 0.5, -2 + (j * 2))
            StairLine.Parent = workspace
            table.insert(BackgroundEffects, StairLine)
        end
        
        -- 階段の光（控えめ）
        local StairLight = Instance.new("PointLight")
        StairLight.Color = Color3.fromRGB(80, 120, 200)
        StairLight.Range = 10
        StairLight.Brightness = 0.8
        StairLight.Parent = Stair
        
        -- 階段のパーティクル（控えめ）
        local StairParticle = Instance.new("ParticleEmitter")
        StairParticle.Texture = "rbxassetid://241809795"
        StairParticle.Color = ColorSequence.new(Color3.fromRGB(100, 140, 220))
        StairParticle.Size = NumberSequence.new(0.15)
        StairParticle.Lifetime = NumberRange.new(1, 2)
        StairParticle.Rate = 10
        StairParticle.Speed = NumberRange.new(0.5)
        StairParticle.LightEmission = 0.6
        StairParticle.Parent = Stair
    end
    
    -- ========== プレイヤーを天空に移動 ========== --
    HumanoidRootPart.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(0, 8, 0))
    
    -- ========== 超高品質な天使の翼（大幅改良版） ========== --
    
    -- 左翼メイン
    local LeftWingMain = Instance.new("Part")
    LeftWingMain.Size = Vector3.new(0.6, 10, 5)
    LeftWingMain.Material = Enum.Material.Neon
    LeftWingMain.Color = Color3.fromRGB(245, 245, 255)
    LeftWingMain.Transparency = 0.2
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
    
    -- 左翼追加レイヤー（羽毛感）
    local LeftWingLayer2 = LeftWingMain:Clone()
    LeftWingLayer2.Size = Vector3.new(0.4, 9, 4.5)
    LeftWingLayer2.Transparency = 0.4
    LeftWingLayer2.Color = Color3.fromRGB(255, 255, 255)
    LeftWingLayer2.Parent = Character
    
    local LeftWingWeld2 = Instance.new("Weld")
    LeftWingWeld2.Part0 = HumanoidRootPart
    LeftWingWeld2.Part1 = LeftWingLayer2
    LeftWingWeld2.C0 = CFrame.new(-1.5, 1.3, 0.6) * CFrame.Angles(0, math.rad(30), math.rad(-12))
    LeftWingWeld2.Parent = HumanoidRootPart
    
    -- 左翼追加レイヤー3
    local LeftWingLayer3 = LeftWingMain:Clone()
    LeftWingLayer3.Size = Vector3.new(0.3, 8, 4)
    LeftWingLayer3.Transparency = 0.5
    LeftWingLayer3.Color = Color3.fromRGB(255, 250, 250)
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
    
    -- 右翼追加レイヤー
    local RightWingLayer2 = LeftWingLayer2:Clone()
    RightWingLayer2.Parent = Character
    
    local RightWingWeld2 = Instance.new("Weld")
    RightWingWeld2.Part0 = HumanoidRootPart
    RightWingWeld2.Part1 = RightWingLayer2
    RightWingWeld2.C0 = CFrame.new(1.5, 1.3, 0.6) * CFrame.Angles(0, math.rad(-30), math.rad(12))
    RightWingWeld2.Parent = HumanoidRootPart
    
    -- 右翼追加レイヤー3
    local RightWingLayer3 = LeftWingLayer3:Clone()
    RightWingLayer3.Parent = Character
    
    local RightWingWeld3 = Instance.new("Weld")
    RightWingWeld3.Part0 = HumanoidRootPart
    RightWingWeld3.Part1 = RightWingLayer3
    RightWingWeld3.C0 = CFrame.new(1.8, 1.1, 0.4) * CFrame.Angles(0, math.rad(-35), math.rad(10))
    RightWingWeld3.Parent = HumanoidRootPart
    
    -- 翼の羽毛ディテール（左右それぞれ5枚）
    local LeftFeathers = {}
    local RightFeathers = {}
    
    for i = 1, 5 do
        local LeftFeather = Instance.new("Part")
        LeftFeather.Size = Vector3.new(0.2, 3 + i * 0.5, 1.5)
        LeftFeather.Material = Enum.Material.Neon
        LeftFeather.Color = Color3.fromRGB(250, 250, 255)
        LeftFeather.Transparency = 0.3
        LeftFeather.CanCollide = false
        LeftFeather.Parent = Character
        
        local LeftFeatherMesh = Instance.new("SpecialMesh")
        LeftFeatherMesh.MeshType = Enum.MeshType.Wedge
        LeftFeatherMesh.Parent = LeftFeather
        
        local LeftFeatherWeld = Instance.new("Weld")
        LeftFeatherWeld.Part0 = HumanoidRootPart
        LeftFeatherWeld.Part1 = LeftFeather
        LeftFeatherWeld.C0 = CFrame.new(-0.8 - i * 0.3, 1.5 - i * 0.4, 0.5) 
            * CFrame.Angles(0, math.rad(20 + i * 5), math.rad(-18 + i * 2))
        LeftFeatherWeld.Parent = HumanoidRootPart
        table.insert(LeftFeathers, {part = LeftFeather, weld = LeftFeatherWeld})
        
        local RightFeather = LeftFeather:Clone()
        RightFeather.Parent = Character
        
        local RightFeatherWeld = Instance.new("Weld")
        RightFeatherWeld.Part0 = HumanoidRootPart
        RightFeatherWeld.Part1 = RightFeather
        RightFeatherWeld.C0 = CFrame.new(0.8 + i * 0.3, 1.5 - i * 0.4, 0.5) 
            * CFrame.Angles(0, math.rad(-20 - i * 5), math.rad(18 - i * 2))
        RightFeatherWeld.Parent = HumanoidRootPart
        table.insert(RightFeathers, {part = RightFeather, weld = RightFeatherWeld})
    end
    
    -- 翼の神聖なオーラ（控えめ）
    local WingAura1 = Instance.new("ParticleEmitter")
    WingAura1.Texture = "rbxassetid://241809795"
    WingAura1.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
    WingAura1.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(1, 0.8)
    })
    WingAura1.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(1, 1)
    })
    WingAura1.Lifetime = NumberRange.new(1, 2)
    WingAura1.Rate = 25
    WingAura1.Speed = NumberRange.new(1, 2)
    WingAura1.LightEmission = 0.7
    WingAura1.Parent = LeftWingMain
    
    local WingAura2 = WingAura1:Clone()
    WingAura2.Parent = RightWingMain
    
    -- 翼の光（控えめ）
    local WingLight = Instance.new("PointLight")
    WingLight.Color = Color3.fromRGB(255, 255, 255)
    WingLight.Range = 12
    WingLight.Brightness = 1.2
    WingLight.Parent = HumanoidRootPart
    
    -- ========== 天から降臨サウンド ========== --
    local DescentSound = Instance.new("Sound")
    DescentSound.SoundId = "rbxassetid://1843463175"
    DescentSound.Volume = 0.8
    DescentSound.Parent = HumanoidRootPart
    DescentSound:Play()
    
    -- ========== プレイヤーアニメーション350種類 ========== --
    
    -- カメラアングル1: 上空斜め後ろから
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(15, 25, 35), SkyPlatform.Position)
    
    task.wait(0.8)
    
    -- 【1-20】翼展開アニメーション（20種類）
    for i = 1, 20 do
        -- メイン翼展開
        LeftWingWeld.C0 = LeftWingWeld.C0 * CFrame.Angles(0, 0, math.rad(-2))
        RightWingWeld.C0 = RightWingWeld.C0 * CFrame.Angles(0, 0, math.rad(2))
        
        -- レイヤー2展開
        LeftWingWeld2.C0 = LeftWingWeld2.C0 * CFrame.Angles(0, 0, math.rad(-1.8))
        RightWingWeld2.C0 = RightWingWeld2.C0 * CFrame.Angles(0, 0, math.rad(1.8))
        
        -- レイヤー3展開
        LeftWingWeld3.C0 = LeftWingWeld3.C0 * CFrame.Angles(0, 0, math.rad(-1.5))
        RightWingWeld3.C0 = RightWingWeld3.C0 * CFrame.Angles(0, 0, math.rad(1.5))
        
        -- 羽毛展開
        for j, feather in ipairs(LeftFeathers) do
            feather.weld.C0 = feather.weld.C0 * CFrame.Angles(0, 0, math.rad(-1.2))
        end
        for j, feather in ipairs(RightFeathers) do
            feather.weld.C0 = feather.weld.C0 * CFrame.Angles(0, 0, math.rad(1.2))
        end
        
        -- 聖なる光の輪
        local Halo = Instance.new("Part")
        Halo.Size = Vector3.new(0.4, 0.4, 0.4)
        Halo.Shape = Enum.PartType.Ball
        Halo.Material = Enum.Material.Neon
        Halo.Color = Color3.fromRGB(255, 250, 200)
        Halo.Transparency = 0.3
        Halo.Anchored = true
        Halo.CanCollide = false
        Halo.Position = HumanoidRootPart.Position + Vector3.new(0, 4, 0)
        Halo.Parent = workspace
        
        task.spawn(function()
            for j = 1, 25 do
                Halo.Size = Halo.Size + Vector3.new(0.4, 0.4, 0.4)
                Halo.Transparency = 0.3 + (j / 25) * 0.7
                task.wait(0.015)
            end
            Halo:Destroy()
        end)
        
        task.wait(0.08)
    end
    
    -- カメラアングル2: 正面から
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(0, 3, 30), SkyPlatform.Position)
    
    -- 【21-50】降臨準備エフェクト（30種類）
    for i = 1, 30 do
        -- 神聖なオーラ
        local DivinePulse = Instance.new("Part")
        DivinePulse.Size = Vector3.new(6 + i * 0.2, 6 + i * 0.2, 6 + i * 0.2)
        DivinePulse.Shape = Enum.PartType.Ball
        DivinePulse.Material = Enum.Material.Neon
        DivinePulse.Color = Color3.fromHSV((i / 30), 0.3, 1)
        DivinePulse.Transparency = 0.6 + (i / 30) * 0.3
        DivinePulse.Anchored = true
        DivinePulse.CanCollide = false
        DivinePulse.Position = HumanoidRootPart.Position
        DivinePulse.Parent = workspace
        
        task.delay(1, function() DivinePulse:Destroy() end)
        
        -- 光の粒子群
        for j = 1, 3 do
            local LightOrb = Instance.new("Part")
            LightOrb.Size = Vector3.new(0.25, 0.25, 0.25)
            LightOrb.Shape = Enum.PartType.Ball
            LightOrb.Material = Enum.Material.Neon
            LightOrb.Color = Color3.fromRGB(255, 255, 240 + j * 5)
            LightOrb.Transparency = 0.2
            LightOrb.Anchored = true
            LightOrb.CanCollide = false
            local angle = ((i * 3 + j) / 90) * math.pi * 2
            LightOrb.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * 4, 
                math.random(-3, 3), 
                math.sin(angle) * 4
            )
            LightOrb.Parent = workspace
            
            task.spawn(function()
                for k = 1, 20 do
                    LightOrb.Position = LightOrb.Position + Vector3.new(
                        math.cos(angle) * 0.1,
                        0.05,
                        math.sin(angle) * 0.1
                    )
                    LightOrb.Transparency = 0.2 + (k / 20) * 0.8
                    task.wait(0.03)
                end
                LightOrb:Destroy()
            end)
        end
        
        task.wait(0.06)
    end
    
    -- カメラアングル3: 横から
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(40, 5, 0), SkyPlatform.Position)
    
    -- 【51-150】階段降下アニメーション（各ステップ10種類 x 10ステップ = 100種類）
    for step = 1, 10 do
        local targetStair = Stairs[step]
        
        -- 【1】消失エフェクト - 光の爆発
        local DisappearBurst = Instance.new("Part")
        DisappearBurst.Size = Vector3.new(4, 4, 4)
        DisappearBurst.Shape = Enum.PartType.Ball
        DisappearBurst.Material = Enum.Material.Neon
        DisappearBurst.Color = Color3.fromRGB(255, 255, 255)
        DisappearBurst.Transparency = 0.1
        DisappearBurst.Anchored = true
        DisappearBurst.CanCollide = false
        DisappearBurst.Position = HumanoidRootPart.Position
        DisappearBurst.Parent = workspace
        
        task.spawn(function()
            for i = 1, 20 do
                DisappearBurst.Size = DisappearBurst.Size + Vector3.new(0.5, 0.5, 0.5)
                DisappearBurst.Transparency = 0.1 + (i / 20) * 0.9
                task.wait(0.015)
            end
            DisappearBurst:Destroy()
        end)
        
        -- テレポート
        task.wait(0.15)
        HumanoidRootPart.CFrame = CFrame.new(targetStair.Position + Vector3.new(0, 2.5, 0))
        
        -- 【2】出現エフェクト - 光の柱
        local AppearPillar = Instance.new("Part")
        AppearPillar.Size = Vector3.new(3, 15, 3)
        AppearPillar.Material = Enum.Material.Neon
        AppearPillar.Color = Color3.fromRGB(200, 220, 255)
        AppearPillar.Transparency = 0.4
        AppearPillar.Anchored = true
        AppearPillar.CanCollide = false
        AppearPillar.Position = HumanoidRootPart.Position
        AppearPillar.Parent = workspace
        
        task.spawn(function()
            for i = 1, 15 do
                AppearPillar.Transparency = 0.4 + (i / 15) * 0.6
                task.wait(0.02)
            end
            AppearPillar:Destroy()
        end)
        
        -- 【3】着地音
        local StepSound = Instance.new("Sound")
        StepSound.SoundId = "rbxassetid://5095207895"
        StepSound.Volume = 0.4
        StepSound.Pitch = 0.9 + (step * 0.08)
        StepSound.Parent = targetStair
        StepSound:Play()
        task.delay(1, function() StepSound:Destroy() end)
        
        -- 【4】足元の魔法陣
        local FootCircle = Instance.new("Part")
        FootCircle.Size = Vector3.new(8, 0.2, 8)
        FootCircle.Shape = Enum.PartType.Cylinder
        FootCircle.Material = Enum.Material.Neon
        FootCircle.Color = Color3.fromRGB(120, 160, 255)
        FootCircle.Transparency = 0.3
        FootCircle.Anchored = true
        FootCircle.CanCollide = false
        FootCircle.Position = targetStair.Position + Vector3.new(0, 0.5, 0)
        FootCircle.Orientation = Vector3.new(0, 0, 90)
        FootCircle.Parent = workspace
        
        task.spawn(function()
            for i = 1, 25 do
                FootCircle.CFrame = FootCircle.CFrame * CFrame.Angles(0, math.rad(8), 0)
                FootCircle.Transparency = 0.3 + (i / 25) * 0.7
                task.wait(0.02)
            end
            FootCircle:Destroy()
        end)
        
        -- 【5】周囲の光の柱
        for angle = 0, 270, 90 do
            local LightBeam = Instance.new("Part")
            LightBeam.Size = Vector3.new(0.8, 12, 0.8)
            LightBeam.Material = Enum.Material.Neon
            LightBeam.Color = Color3.fromRGB(180, 200, 255)
            LightBeam.Transparency = 0.4
            LightBeam.Anchored = true
            LightBeam.CanCollide = false
            local rad = math.rad(angle)
            LightBeam.Position = targetStair.Position + Vector3.new(math.cos(rad) * 5, 0, math.sin(rad) * 5)
            LightBeam.Parent = workspace
            
            task.delay(0.6, function() LightBeam:Destroy() end)
        end
        
        -- 【6】エネルギー波紋
        for i = 1, 3 do
            task.spawn(function()
                task.wait(i * 0.1)
                local EnergyRing = Instance.new("Part")
                EnergyRing.Size = Vector3.new(2, 0.2, 2)
                EnergyRing.Shape = Enum.PartType.Cylinder
                EnergyRing.Material = Enum.Material.Neon
                EnergyRing.Color = Color3.fromRGB(150, 180, 255)
                EnergyRing.Transparency = 0.3
                EnergyRing.Anchored = true
                EnergyRing.CanCollide = false
                EnergyRing.Position = targetStair.Position
                EnergyRing.Orientation = Vector3.new(0, 0, 90)
                EnergyRing.Parent = workspace
                
                for j = 1, 20 do
                    EnergyRing.Size = EnergyRing.Size + Vector3.new(i * 0.5, 0, i * 0.5)
                    EnergyRing.Transparency = 0.3 + (j / 20) * 0.7
                    task.wait(0.02)
                end
                EnergyRing:Destroy()
            end)
        end
        
        -- 【7】炎の渦
        local FireSpiral = Instance.new("Part")
        FireSpiral.Size = Vector3.new(2.5, 6, 2.5)
        FireSpiral.Material = Enum.Material.Neon
        FireSpiral.Color = Color3.fromRGB(255, 140, 40)
        FireSpiral.Transparency = 0.5
        FireSpiral.Anchored = true
        FireSpiral.CanCollide = false
        FireSpiral.Position = targetStair.Position + Vector3.new(4, 2, 0)
        FireSpiral.Parent = workspace
        
        local FireEmit = Instance.new("ParticleEmitter")
        FireEmit.Texture = "rbxassetid://6101261905"
        FireEmit.Color = ColorSequence.new(Color3.fromRGB(255, 120, 30))
        FireEmit.Size = NumberSequence.new(1.2)
        FireEmit.Lifetime = NumberRange.new(0.4)
        FireEmit.Rate = 30
        FireEmit.Speed = NumberRange.new(2)
        FireEmit.LightEmission = 0.6
        FireEmit.Parent = FireSpiral
        
        task.delay(0.7, function() FireSpiral:Destroy() end)
        
        -- 【8】氷の結晶
        local IceShard = Instance.new("Part")
        IceShard.Size = Vector3.new(1, 5, 1)
        IceShard.Material = Enum.Material.Ice
        IceShard.Color = Color3.fromRGB(150, 200, 255)
        IceShard.Transparency = 0.3
        IceShard.Anchored = true
        IceShard.CanCollide = false
        IceShard.Position = targetStair.Position + Vector3.new(-4, 2, 0)
        IceShard.Orientation = Vector3.new(15, 0, 0)
        IceShard.Parent = workspace
        
        task.delay(0.7, function() IceShard:Destroy() end)
        
        -- 【9】電撃
        local Lightning = Instance.new("Part")
        Lightning.Size = Vector3.new(0.35, 10, 0.35)
        Lightning.Material = Enum.Material.Neon
        Lightning.Color = Color3.fromRGB(120, 180, 255)
        Lightning.Transparency = 0.2
        Lightning.Anchored = true
        Lightning.CanCollide = false
        Lightning.Position = targetStair.Position + Vector3.new(0, 5, 4)
        Lightning.Parent = workspace
        
        local LightningGlow = Instance.new("PointLight")
        LightningGlow.Color = Color3.fromRGB(120, 180, 255)
        LightningGlow.Range = 12
        LightningGlow.Brightness = 2
        LightningGlow.Parent = Lightning
        
        task.delay(0.25, function() Lightning:Destroy() end)
        
        -- 【10】星の軌跡群
        for i = 1, 8 do
            local Star = Instance.new("Part")
            Star.Size = Vector3.new(0.3, 0.3, 0.3)
            Star.Shape = Enum.PartType.Ball
            Star.Material = Enum.Material.Neon
            Star.Color = Color3.fromRGB(255, 255, math.random(200, 255))
            Star.Transparency = 0.1
            Star.Anchored = true
            Star.CanCollide = false
            local angle = (i / 8) * math.pi * 2
            Star.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * 2.5, 
                3, 
                math.sin(angle) * 2.5
            )
            Star.Parent = workspace
            
            task.spawn(function()
                for j = 1, 35 do
                    Star.Position = Star.Position + Vector3.new(0, -0.15, 0)
                    Star.Transparency = 0.1 + (j / 35) * 0.9
                    task.wait(0.015)
                end
                Star:Destroy()
            end)
        end
        
        -- カメラをプレイヤーに追従
        local camAngle = (step / 10) * math.pi
        Camera.CFrame = CFrame.new(
            HumanoidRootPart.Position + Vector3.new(
                math.cos(camAngle) * 18, 
                8, 
                math.sin(camAngle) * 18
            ), 
            HumanoidRootPart.Position
        )
        
        task.wait(0.85)
    end
    
    -- 【151-200】着地後の大演出（50種類）
    
    -- カメラアングル4: 上空から俯瞰
    Camera.CFrame = CFrame.new(HumanoidRootPart.Position + Vector3.new(0, 35, 25), HumanoidRootPart.Position)
    
    for i = 1, 50 do
        if i <= 15 then
            -- 【151-165】巨大衝撃波
            local MassiveShockwave = Instance.new("Part")
            MassiveShockwave.Size = Vector3.new(i * 3, 0.6, i * 3)
            MassiveShockwave.Shape = Enum.PartType.Cylinder
            MassiveShockwave.Material = Enum.Material.Neon
            MassiveShockwave.Color = Color3.fromHSV((i / 15), 0.6, 1)
            MassiveShockwave.Transparency = 0.2 + (i / 15) * 0.7
            MassiveShockwave.Anchored = true
            MassiveShockwave.CanCollide = false
            MassiveShockwave.Position = HumanoidRootPart.Position
            MassiveShockwave.Orientation = Vector3.new(0, 0, 90)
            MassiveShockwave.Parent = workspace
            
            task.delay(0.6, function() MassiveShockwave:Destroy() end)
            
        elseif i <= 30 then
            -- 【166-180】地面から光の柱噴出
            local GroundLight = Instance.new("Part")
            GroundLight.Size = Vector3.new(2, 25, 2)
            GroundLight.Material = Enum.Material.Neon
            GroundLight.Color = Color3.fromRGB(200, 220, 255)
            GroundLight.Transparency = 0.4
            GroundLight.Anchored = true
            GroundLight.CanCollide = false
            local angle = ((i - 15) / 15) * math.pi * 2
            GroundLight.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * (8 + (i - 15)), 
                -10, 
                math.sin(angle) * (8 + (i - 15))
            )
            GroundLight.Parent = workspace
            
            task.delay(0.8, function() GroundLight:Destroy() end)
            
        else
            -- 【181-200】光のオーブ乱舞
            local DancingOrb = Instance.new("Part")
            DancingOrb.Size = Vector3.new(0.6, 0.6, 0.6)
            DancingOrb.Shape = Enum.PartType.Ball
            DancingOrb.Material = Enum.Material.Neon
            DancingOrb.Color = Color3.fromHSV(((i - 30) / 20), 0.8, 1)
            DancingOrb.Transparency = 0.2
            DancingOrb.Anchored = true
            DancingOrb.CanCollide = false
            local angle = ((i - 30) / 20) * math.pi * 2
            DancingOrb.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * 6,
                5 + math.sin(i * 0.5) * 3,
                math.sin(angle) * 6
            )
            DancingOrb.Parent = workspace
            
            task.spawn(function()
                for j = 1, 40 do
                    local t = (tick() + i) * 2
                    DancingOrb.Position = HumanoidRootPart.Position + Vector3.new(
                        math.cos(t) * (6 - j * 0.1),
                        5 + math.sin(t * 2) * 2,
                        math.sin(t) * (6 - j * 0.1)
                    )
                    DancingOrb.Transparency = 0.2 + (j / 40) * 0.8
                    task.wait(0.02)
                end
                DancingOrb:Destroy()
            end)
        end
        
        task.wait(0.04)
    end
    
    -- 【201-250】翼フェードアウト演出（50種類）
    
    task.wait(0.3)
    
    for i = 1, 50 do
        -- 翼の透明度変更
        local alpha = i / 50
        LeftWingMain.Transparency = 0.2 + alpha * 0.8
        RightWingMain.Transparency = 0.2 + alpha * 0.8
        LeftWingLayer2.Transparency = 0.4 + alpha * 0.6
        RightWingLayer2.Transparency = 0.4 + alpha * 0.6
        LeftWingLayer3.Transparency = 0.5 + alpha * 0.5
        RightWingLayer3.Transparency = 0.5 + alpha * 0.5
        
        for _, feather in ipairs(LeftFeathers) do
            feather.part.Transparency = 0.3 + alpha * 0.7
        end
        for _, feather in ipairs(RightFeathers) do
            feather.part.Transparency = 0.3 + alpha * 0.7
        end
        
        -- 羽根が散る
        if i % 2 == 0 then
            local Feather = Instance.new("Part")
            Feather.Size = Vector3.new(0.4, 0.1, 0.7)
            Feather.Material = Enum.Material.Neon
            Feather.Color = Color3.fromRGB(255, 255, 255)
            Feather.Transparency = 0.2
            Feather.Anchored = true
            Feather.CanCollide = false
            
            local wingChoice = (i % 4 < 2) and LeftWingMain or RightWingMain
            Feather.Position = wingChoice.Position + Vector3.new(
                math.random(-2, 2),
                math.random(-1, 1),
                math.random(-2, 2)
            )
            Feather.Parent = workspace
            
            task.spawn(function()
                for j = 1, 50 do
                    Feather.Position = Feather.Position + Vector3.new(
                        math.random(-1, 1) * 0.08,
                        -0.12,
                        math.random(-1, 1) * 0.08
                    )
                    Feather.CFrame = Feather.CFrame * CFrame.Angles(
                        math.rad(math.random(-8, 8)),
                        math.rad(math.random(-8, 8)),
                        math.rad(math.random(-8, 8))
                    )
                    Feather.Transparency = 0.2 + (j / 50) * 0.8
                    task.wait(0.025)
                end
                Feather:Destroy()
            end)
        end
        
        task.wait(0.04)
    end
    
    -- 翼と羽毛を削除
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
    
    -- 【251-300】フィナーレエフェクト（50種類）
    
    -- カメラアングル5: プレイヤーを中心に回転
    for i = 1, 50 do
        local camAngle = (i / 50) * math.pi * 2
        Camera.CFrame = CFrame.new(
            HumanoidRootPart.Position + Vector3.new(
                math.cos(camAngle) * 15,
                10 - (i / 50) * 5,
                math.sin(camAngle) * 15
            ),
            HumanoidRootPart.Position
        )
        
        -- 螺旋状の光
        local SpiralLight = Instance.new("Part")
        SpiralLight.Size = Vector3.new(0.5, 0.5, 0.5)
        SpiralLight.Shape = Enum.PartType.Ball
        SpiralLight.Material = Enum.Material.Neon
        SpiralLight.Color = Color3.fromHSV((i / 50), 1, 1)
        SpiralLight.Transparency = 0.3
        SpiralLight.Anchored = true
        SpiralLight.CanCollide = false
        local spiralAngle = (i / 50) * math.pi * 6
        SpiralLight.Position = HumanoidRootPart.Position + Vector3.new(
            math.cos(spiralAngle) * 8,
            10 - i * 0.15,
            math.sin(spiralAngle) * 8
        )
        SpiralLight.Parent = workspace
        
        task.delay(1.2, function() SpiralLight:Destroy() end)
        
        task.wait(0.035)
    end
    
    -- 【301-350】最終爆発演出（50種類）
    
    -- カメラを固定
    Camera.CFrame = CFrame.new(HumanoidRootPart.Position + Vector3.new(0, 8, 20), HumanoidRootPart.Position)
    
    for i = 1, 50 do
        -- 最終エネルギー爆発
        local FinalBurst = Instance.new("Part")
        FinalBurst.Size = Vector3.new(i * 0.8, i * 0.8, i * 0.8)
        FinalBurst.Shape = Enum.PartType.Ball
        FinalBurst.Material = Enum.Material.Neon
        FinalBurst.Color = Color3.fromHSV((i / 50), 0.7, 1)
        FinalBurst.Transparency = 0.3 + (i / 50) * 0.6
        FinalBurst.Anchored = true
        FinalBurst.CanCollide = false
        FinalBurst.Position = HumanoidRootPart.Position
        FinalBurst.Parent = workspace
        
        task.delay(0.8, function() FinalBurst:Destroy() end)
        
        task.wait(0.035)
    end
    
    -- 最終エフェクト音
    local FinalSound = Instance.new("Sound")
    FinalSound.SoundId = "rbxassetid://9125402735"
    FinalSound.Volume = 0.9
    FinalSound.Parent = HumanoidRootPart
    FinalSound:Play()
    
    task.wait(1)
    
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
        Content = "500種類のアニメーション演出終了",
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
   Name = "⚔️ 影刃を召喚する（500演出版）",
   Callback = function()
        PlayUltimate500Cutscene(game.Players.LocalPlayer)
        wait(15)
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
CinemaTab:CreateLabel("🎬 超絶豪華演出の内容")
CinemaTab:CreateLabel("合計: 500種類のアニメーション")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("背景演出 (150種類):")
CinemaTab:CreateLabel("• 神秘的な木々 + 枝 x30")
CinemaTab:CreateLabel("• 多様な水晶 x15")
CinemaTab:CreateLabel("• 古代の柱 + 装飾 x20")
CinemaTab:CreateLabel("• 多層魔法陣 x15")
CinemaTab:CreateLabel("• 浮遊する魔導書 x15")
CinemaTab:CreateLabel("• 炎の柱 x15")
CinemaTab:CreateLabel("• 星空フィールド x15")
CinemaTab:CreateLabel("• 氷の結晶 x15")
CinemaTab:CreateLabel("• 雷雲 + 雷 x15")
CinemaTab:CreateLabel("• 浮遊島 x10")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("プレイヤー演出 (350種類):")
CinemaTab:CreateLabel("• 超高品質3層翼 + 羽毛")
CinemaTab:CreateLabel("• 翼展開 x20")
CinemaTab:CreateLabel("• 降臨準備 x30")
CinemaTab:CreateLabel("• 階段降下 (各10種) x100")
CinemaTab:CreateLabel("• 着地大演出 x50")
CinemaTab:CreateLabel("• 翼フェード x50")
CinemaTab:CreateLabel("• フィナーレ x50")
CinemaTab:CreateLabel("• 最終爆発 x50")

local TestButton = CinemaTab:CreateButton({
   Name = "🎬 演出のみをテスト再生",
   Callback = function()
        PlayUltimate500Cutscene(game.Players.LocalPlayer)
   end,
})

Rayfield:Notify({
   Title = "🌟 影刃 ULTIMATE 500",
   Content = "500種類の超絶豪華アニメーション！",
   Duration = 5,
   Image = 4483362458,
})
