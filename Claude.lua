--[[
    剣名: 影刃 (Kageba) - ULTIMATE 1500 CINEMATIC EDITION
    特徴: 1500種類の超本格アニメーション + リアルな3D背景構造
    改善: 全ての背景を本格的な3D構造で再構築
]]

-- Rayfield UIのロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = "影刃 - ULTIMATE 1500 CINEMATIC",
   LoadingTitle = "超本格演出準備中...",
   LoadingSubtitle = "by Shadow Forge Cinema Master",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "KagebaCinema1500"
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

-- ========== ヘルパー関数 ========== --

-- リアルな木を作成する関数
local function CreateRealisticTree(position, scale)
    local TreeParts = {}
    
    -- 主幹（下部 - 太い）
    local TrunkBase = Instance.new("Part")
    TrunkBase.Size = Vector3.new(3 * scale, 8 * scale, 3 * scale)
    TrunkBase.Material = Enum.Material.Wood
    TrunkBase.Color = Color3.fromRGB(45, 28, 15)
    TrunkBase.Anchored = true
    TrunkBase.CanCollide = false
    TrunkBase.Position = position
    TrunkBase.Parent = workspace
    table.insert(TreeParts, TrunkBase)
    
    -- 樹皮の凹凸（4方向）
    for i = 0, 3 do
        local BarkGroove = Instance.new("Part")
        BarkGroove.Size = Vector3.new(0.4 * scale, 7 * scale, 2.8 * scale)
        BarkGroove.Material = Enum.Material.Wood
        BarkGroove.Color = Color3.fromRGB(35, 22, 12)
        BarkGroove.Anchored = true
        BarkGroove.CanCollide = false
        local angle = (i / 4) * math.pi * 2
        BarkGroove.CFrame = CFrame.new(position) 
            * CFrame.Angles(0, angle, 0) 
            * CFrame.new(1.4 * scale, 0, 0)
        BarkGroove.Parent = workspace
        table.insert(TreeParts, BarkGroove)
    end
    
    -- 主幹（中部）
    local TrunkMid = Instance.new("Part")
    TrunkMid.Size = Vector3.new(2.4 * scale, 10 * scale, 2.4 * scale)
    TrunkMid.Material = Enum.Material.Wood
    TrunkMid.Color = Color3.fromRGB(50, 32, 18)
    TrunkMid.Anchored = true
    TrunkMid.CanCollide = false
    TrunkMid.Position = position + Vector3.new(0, 9 * scale, 0)
    TrunkMid.Parent = workspace
    table.insert(TreeParts, TrunkMid)
    
    -- 主幹（上部 - 細い）
    local TrunkTop = Instance.new("Part")
    TrunkTop.Size = Vector3.new(1.8 * scale, 8 * scale, 1.8 * scale)
    TrunkTop.Material = Enum.Material.Wood
    TrunkTop.Color = Color3.fromRGB(55, 35, 20)
    TrunkTop.Anchored = true
    TrunkTop.CanCollide = false
    TrunkTop.Position = position + Vector3.new(0, 18 * scale, 0)
    TrunkTop.Parent = workspace
    table.insert(TreeParts, TrunkTop)
    
    -- 根（8本）
    for i = 0, 7 do
        local Root = Instance.new("Part")
        Root.Size = Vector3.new(1.2 * scale, 3 * scale, 1.2 * scale)
        Root.Material = Enum.Material.Wood
        Root.Color = Color3.fromRGB(40, 25, 14)
        Root.Anchored = true
        Root.CanCollide = false
        local angle = (i / 8) * math.pi * 2
        Root.CFrame = CFrame.new(position + Vector3.new(0, -1.5 * scale, 0))
            * CFrame.Angles(math.rad(40), angle, 0)
            * CFrame.new(0, 1.5 * scale, 0)
        Root.Parent = workspace
        table.insert(TreeParts, Root)
        
        -- 根の先端
        local RootTip = Instance.new("Part")
        RootTip.Size = Vector3.new(0.8 * scale, 1.5 * scale, 0.8 * scale)
        RootTip.Material = Enum.Material.Wood
        RootTip.Color = Color3.fromRGB(35, 20, 10)
        RootTip.Anchored = true
        RootTip.CanCollide = false
        RootTip.CFrame = Root.CFrame * CFrame.new(0, 2.2 * scale, 0)
        RootTip.Parent = workspace
        table.insert(TreeParts, RootTip)
    end
    
    -- 大枝（6本）
    for i = 1, 6 do
        local height = 12 * scale + i * 2 * scale
        local BranchBase = Instance.new("Part")
        BranchBase.Size = Vector3.new(1.2 * scale, 6 * scale, 1.2 * scale)
        BranchBase.Material = Enum.Material.Wood
        BranchBase.Color = Color3.fromRGB(48, 30, 17)
        BranchBase.Anchored = true
        BranchBase.CanCollide = false
        local branchAngle = ((i - 1) / 6) * math.pi * 2 + math.rad(30 * i)
        BranchBase.CFrame = CFrame.new(position + Vector3.new(0, height, 0))
            * CFrame.Angles(math.rad(35 + i * 3), branchAngle, 0)
            * CFrame.new(0, 3 * scale, 0)
        BranchBase.Parent = workspace
        table.insert(TreeParts, BranchBase)
        
        -- 枝の中間部
        local BranchMid = Instance.new("Part")
        BranchMid.Size = Vector3.new(0.9 * scale, 4 * scale, 0.9 * scale)
        BranchMid.Material = Enum.Material.Wood
        BranchMid.Color = Color3.fromRGB(52, 33, 19)
        BranchMid.Anchored = true
        BranchMid.CanCollide = false
        BranchMid.CFrame = BranchBase.CFrame 
            * CFrame.Angles(math.rad(-15), 0, 0)
            * CFrame.new(0, 5 * scale, 0)
        BranchMid.Parent = workspace
        table.insert(TreeParts, BranchMid)
        
        -- 小枝（各大枝に4本）
        for j = 1, 4 do
            local SmallBranch = Instance.new("Part")
            SmallBranch.Size = Vector3.new(0.5 * scale, 2.5 * scale, 0.5 * scale)
            SmallBranch.Material = Enum.Material.Wood
            SmallBranch.Color = Color3.fromRGB(55, 35, 20)
            SmallBranch.Anchored = true
            SmallBranch.CanCollide = false
            local smallAngle = (j / 4) * math.pi * 2
            SmallBranch.CFrame = BranchMid.CFrame
                * CFrame.Angles(math.rad(45), smallAngle, 0)
                * CFrame.new(0, 2 * scale, 0)
            SmallBranch.Parent = workspace
            table.insert(TreeParts, SmallBranch)
        end
    end
    
    -- 葉のクラスター（20個）
    for i = 1, 20 do
        local LeafCluster = Instance.new("Part")
        LeafCluster.Size = Vector3.new(
            4 * scale + math.random(-10, 10) * 0.1 * scale,
            4 * scale + math.random(-10, 10) * 0.1 * scale,
            4 * scale + math.random(-10, 10) * 0.1 * scale
        )
        LeafCluster.Shape = Enum.PartType.Ball
        LeafCluster.Material = Enum.Material.Grass
        LeafCluster.Color = Color3.fromRGB(
            math.random(15, 25),
            math.random(70, 95),
            math.random(15, 25)
        )
        LeafCluster.Transparency = 0.3
        LeafCluster.Anchored = true
        LeafCluster.CanCollide = false
        local angle = (i / 20) * math.pi * 2
        local radius = math.random(2, 6) * scale
        local leafHeight = position.Y + 16 * scale + math.random(-4, 6) * scale
        LeafCluster.Position = Vector3.new(
            position.X + math.cos(angle) * radius,
            leafHeight,
            position.Z + math.sin(angle) * radius
        )
        LeafCluster.Parent = workspace
        table.insert(TreeParts, LeafCluster)
        
        -- 葉のパーティクル
        local LeafParticle = Instance.new("ParticleEmitter")
        LeafParticle.Texture = "rbxassetid://242911609"
        LeafParticle.Color = ColorSequence.new(Color3.fromRGB(20, 80, 20))
        LeafParticle.Size = NumberSequence.new(0.3)
        LeafParticle.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.5),
            NumberSequenceKeypoint.new(1, 1)
        })
        LeafParticle.Lifetime = NumberRange.new(2, 4)
        LeafParticle.Rate = 3
        LeafParticle.Speed = NumberRange.new(0.5, 1)
        LeafParticle.Rotation = NumberRange.new(0, 360)
        LeafParticle.RotSpeed = NumberRange.new(-40, 40)
        LeafParticle.Parent = LeafCluster
    end
    
    return TreeParts
end

-- リアルな古代遺跡の柱を作成
local function CreateAncientPillar(position, height, radius)
    local PillarParts = {}
    
    -- 基礎（3段）
    for i = 1, 3 do
        local BaseLayer = Instance.new("Part")
        BaseLayer.Size = Vector3.new(
            radius * 2 + (4 - i) * 0.5,
            1,
            radius * 2 + (4 - i) * 0.5
        )
        BaseLayer.Material = Enum.Material.Cobblestone
        BaseLayer.Color = Color3.fromRGB(80 - i * 10, 80 - i * 10, 90 - i * 10)
        BaseLayer.Anchored = true
        BaseLayer.CanCollide = false
        BaseLayer.Position = position + Vector3.new(0, -height/2 + (i - 1) * 1.2, 0)
        BaseLayer.Parent = workspace
        table.insert(PillarParts, BaseLayer)
    end
    
    -- 主柱（円柱）
    local MainPillar = Instance.new("Part")
    MainPillar.Size = Vector3.new(radius * 2, height, radius * 2)
    MainPillar.Shape = Enum.PartType.Cylinder
    MainPillar.Material = Enum.Material.Marble
    MainPillar.Color = Color3.fromRGB(140, 140, 155)
    MainPillar.Anchored = true
    MainPillar.CanCollide = false
    MainPillar.CFrame = CFrame.new(position) * CFrame.Angles(0, 0, math.rad(90))
    MainPillar.Parent = workspace
    table.insert(PillarParts, MainPillar)
    
    -- 縦溝（8本）
    for i = 0, 7 do
        local Groove = Instance.new("Part")
        Groove.Size = Vector3.new(0.4, height - 2, radius * 1.8)
        Groove.Material = Enum.Material.Marble
        Groove.Color = Color3.fromRGB(120, 120, 135)
        Groove.Anchored = true
        Groove.CanCollide = false
        local angle = (i / 8) * math.pi * 2
        Groove.CFrame = CFrame.new(position)
            * CFrame.Angles(0, angle, 0)
            * CFrame.new(radius * 0.9, 0, 0)
        Groove.Parent = workspace
        table.insert(PillarParts, Groove)
    end
    
    -- 横帯装飾（5段）
    for i = 1, 5 do
        local Band = Instance.new("Part")
        Band.Size = Vector3.new(radius * 2.2, 0.6, radius * 2.2)
        Band.Shape = Enum.PartType.Cylinder
        Band.Material = Enum.Material.Marble
        Band.Color = Color3.fromRGB(100, 100, 115)
        Band.Anchored = true
        Band.CanCollide = false
        local bandHeight = position.Y - height/2 + (i / 6) * height
        Band.CFrame = CFrame.new(position.X, bandHeight, position.Z) 
            * CFrame.Angles(0, 0, math.rad(90))
        Band.Parent = workspace
        table.insert(PillarParts, Band)
    end
    
    -- 柱頭（capital）
    local Capital = Instance.new("Part")
    Capital.Size = Vector3.new(radius * 2.8, 2, radius * 2.8)
    Capital.Material = Enum.Material.Marble
    Capital.Color = Color3.fromRGB(130, 130, 145)
    Capital.Anchored = true
    Capital.CanCollide = false
    Capital.Position = position + Vector3.new(0, height/2 + 1, 0)
    Capital.Parent = workspace
    table.insert(PillarParts, Capital)
    
    -- 柱頭装飾（4つの渦巻き）
    for i = 0, 3 do
        local Volute = Instance.new("Part")
        Volute.Size = Vector3.new(1.2, 1.2, 0.6)
        Volute.Shape = Enum.PartType.Ball
        Volute.Material = Enum.Material.Marble
        Volute.Color = Color3.fromRGB(110, 110, 125)
        Volute.Anchored = true
        Volute.CanCollide = false
        local angle = (i / 4) * math.pi * 2
        Volute.Position = position + Vector3.new(
            math.cos(angle) * radius * 1.2,
            height/2 + 1.5,
            math.sin(angle) * radius * 1.2
        )
        Volute.Parent = workspace
        table.insert(PillarParts, Volute)
    end
    
    -- ひび割れ・風化表現（ランダム配置）
    for i = 1, math.random(3, 6) do
        local Crack = Instance.new("Part")
        Crack.Size = Vector3.new(
            0.2,
            math.random(2, 6),
            radius * 1.6
        )
        Crack.Material = Enum.Material.Slate
        Crack.Color = Color3.fromRGB(60, 60, 70)
        Crack.Transparency = 0.4
        Crack.Anchored = true
        Crack.CanCollide = false
        local crackAngle = math.random(0, 360)
        local crackHeight = position.Y + math.random(-height/2 + 2, height/2 - 2)
        Crack.CFrame = CFrame.new(position.X, crackHeight, position.Z)
            * CFrame.Angles(math.rad(math.random(-20, 20)), math.rad(crackAngle), 0)
            * CFrame.new(radius * 0.95, 0, 0)
        Crack.Parent = workspace
        table.insert(PillarParts, Crack)
    end
    
    -- 苔の表現
    for i = 1, math.random(4, 8) do
        local Moss = Instance.new("Part")
        Moss.Size = Vector3.new(
            0.3,
            math.random(1, 3),
            radius * 1.5
        )
        Moss.Material = Enum.Material.Grass
        Moss.Color = Color3.fromRGB(10, math.random(40, 60), 10)
        Moss.Transparency = 0.3
        Moss.Anchored = true
        Moss.CanCollide = false
        local mossAngle = math.random(0, 360)
        local mossHeight = position.Y + math.random(-height/2, -height/4)
        Moss.CFrame = CFrame.new(position.X, mossHeight, position.Z)
            * CFrame.Angles(0, math.rad(mossAngle), 0)
            * CFrame.new(radius * 0.92, 0, 0)
        Moss.Parent = workspace
        table.insert(PillarParts, Moss)
    end
    
    return PillarParts
end

-- リアルな水晶クラスターを作成
local function CreateCrystalCluster(position, mainColor, clusterSize)
    local CrystalParts = {}
    
    -- 基盤岩
    local BaseRock = Instance.new("Part")
    BaseRock.Size = Vector3.new(clusterSize * 2, clusterSize * 0.5, clusterSize * 2)
    BaseRock.Material = Enum.Material.Rock
    BaseRock.Color = Color3.fromRGB(60, 60, 70)
    BaseRock.Anchored = true
    BaseRock.CanCollide = false
    BaseRock.Position = position
    BaseRock.Parent = workspace
    table.insert(CrystalParts, BaseRock)
    
    -- 中心の大結晶
    local MainCrystal = Instance.new("Part")
    MainCrystal.Size = Vector3.new(clusterSize * 0.8, clusterSize * 3, clusterSize * 0.8)
    MainCrystal.Material = Enum.Material.Neon
    MainCrystal.Color = mainColor
    MainCrystal.Transparency = 0.25
    MainCrystal.Anchored = true
    MainCrystal.CanCollide = false
    MainCrystal.CFrame = CFrame.new(position + Vector3.new(0, clusterSize * 1.5, 0))
        * CFrame.Angles(math.rad(math.random(-10, 10)), 0, math.rad(math.random(-10, 10)))
    MainCrystal.Parent = workspace
    table.insert(CrystalParts, MainCrystal)
    
    -- 六角形の面を作成（結晶の特徴）
    for i = 0, 5 do
        local Face = Instance.new("Part")
        Face.Size = Vector3.new(0.15, clusterSize * 2.8, clusterSize * 0.7)
        Face.Material = Enum.Material.Neon
        Face.Color = mainColor
        Face.Transparency = 0.3
        Face.Anchored = true
        Face.CanCollide = false
        local angle = (i / 6) * math.pi * 2
        Face.CFrame = MainCrystal.CFrame
            * CFrame.Angles(0, angle, 0)
            * CFrame.new(clusterSize * 0.35, 0, 0)
        Face.Parent = workspace
        table.insert(CrystalParts, Face)
    end
    
    -- 結晶の先端（ピラミッド状）
    local CrystalTip = Instance.new("Part")
    CrystalTip.Size = Vector3.new(clusterSize * 0.6, clusterSize * 1.2, clusterSize * 0.6)
    local CrystalMesh = Instance.new("SpecialMesh")
    CrystalMesh.MeshType = Enum.MeshType.FileMesh
    CrystalMesh.MeshId = "rbxassetid://9756362"
    CrystalMesh.Scale = Vector3.new(0.5, 1, 0.5)
    CrystalMesh.Parent = CrystalTip
    CrystalTip.Material = Enum.Material.Neon
    CrystalTip.Color = mainColor
    CrystalTip.Transparency = 0.2
    CrystalTip.Anchored = true
    CrystalTip.CanCollide = false
    CrystalTip.Position = MainCrystal.Position + Vector3.new(0, clusterSize * 2.1, 0)
    CrystalTip.Parent = workspace
    table.insert(CrystalParts, CrystalTip)
    
    -- 周囲の小結晶（12個）
    for i = 1, 12 do
        local SmallCrystal = Instance.new("Part")
        local size = clusterSize * (0.3 + math.random() * 0.4)
        SmallCrystal.Size = Vector3.new(size * 0.6, size * 2, size * 0.6)
        SmallCrystal.Material = Enum.Material.Neon
        -- 色相を少し変化させる
        local h, s, v = mainColor:ToHSV()
        SmallCrystal.Color = Color3.fromHSV((h + math.random(-10, 10) / 100) % 1, s, v)
        SmallCrystal.Transparency = 0.3
        SmallCrystal.Anchored = true
        SmallCrystal.CanCollide = false
        local angle = (i / 12) * math.pi * 2
        local radius = clusterSize * (0.7 + math.random() * 0.3)
        SmallCrystal.CFrame = CFrame.new(
            position + Vector3.new(
                math.cos(angle) * radius,
                size,
                math.sin(angle) * radius
            )
        ) * CFrame.Angles(
            math.rad(math.random(-15, 15)),
            math.rad(math.random(0, 360)),
            math.rad(math.random(-15, 15))
        )
        SmallCrystal.Parent = workspace
        table.insert(CrystalParts, SmallCrystal)
        
        -- 小結晶の先端
        local SmallTip = Instance.new("Part")
        SmallTip.Size = Vector3.new(size * 0.4, size * 0.8, size * 0.4)
        local SmallMesh = Instance.new("SpecialMesh")
        SmallMesh.MeshType = Enum.MeshType.FileMesh
        SmallMesh.MeshId = "rbxassetid://9756362"
        SmallMesh.Scale = Vector3.new(0.4, 1, 0.4)
        SmallMesh.Parent = SmallTip
        SmallTip.Material = Enum.Material.Neon
        SmallTip.Color = SmallCrystal.Color
        SmallTip.Transparency = 0.25
        SmallTip.Anchored = true
        SmallTip.CanCollide = false
        SmallTip.Position = SmallCrystal.Position + Vector3.new(0, size * 1.4, 0)
        SmallTip.Parent = workspace
        table.insert(CrystalParts, SmallTip)
    end
    
    -- 結晶内部の光
    local InnerLight = Instance.new("PointLight")
    InnerLight.Color = mainColor
    InnerLight.Range = clusterSize * 8
    InnerLight.Brightness = 0.8
    InnerLight.Parent = MainCrystal
    
    -- エネルギーパーティクル
    local CrystalParticle = Instance.new("ParticleEmitter")
    CrystalParticle.Texture = "rbxassetid://241809795"
    CrystalParticle.Color = ColorSequence.new(mainColor)
    CrystalParticle.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.2),
        NumberSequenceKeypoint.new(0.5, 0.4),
        NumberSequenceKeypoint.new(1, 0.1)
    })
    CrystalParticle.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(1, 1)
    })
    CrystalParticle.Lifetime = NumberRange.new(1.5, 3)
    CrystalParticle.Rate = 8
    CrystalParticle.Speed = NumberRange.new(0.5, 1.5)
    CrystalParticle.LightEmission = 0.6
    CrystalParticle.Parent = MainCrystal
    
    -- 回転アニメーション
    task.spawn(function()
        while MainCrystal.Parent do
            MainCrystal.CFrame = MainCrystal.CFrame * CFrame.Angles(0, math.rad(0.5), 0)
            task.wait(0.03)
        end
    end)
    
    return CrystalParts
end

-- 複雑な魔法陣システムを作成
local function CreateComplexMagicCircle(position, radius, mainColor)
    local CircleParts = {}
    
    -- 外円（メイン）
    local OuterRing = Instance.new("Part")
    OuterRing.Size = Vector3.new(radius * 2, 0.3, radius * 2)
    OuterRing.Shape = Enum.PartType.Cylinder
    OuterRing.Material = Enum.Material.Neon
    OuterRing.Color = mainColor
    OuterRing.Transparency = 0.4
    OuterRing.Anchored = true
    OuterRing.CanCollide = false
    OuterRing.CFrame = CFrame.new(position) * CFrame.Angles(0, 0, math.rad(90))
    OuterRing.Parent = workspace
    table.insert(CircleParts, OuterRing)
    
    -- 中円（3層）
    for i = 1, 3 do
        local MidRing = Instance.new("Part")
        local ringRadius = radius * (0.7 - i * 0.15)
        MidRing.Size = Vector3.new(ringRadius * 2, 0.25, ringRadius * 2)
        MidRing.Shape = Enum.PartType.Cylinder
        MidRing.Material = Enum.Material.Neon
        local h, s, v = mainColor:ToHSV()
        MidRing.Color = Color3.fromHSV((h + i * 0.05) % 1, s, v * 0.9)
        MidRing.Transparency = 0.45
        MidRing.Anchored = true
        MidRing.CanCollide = false
        MidRing.CFrame = CFrame.new(position + Vector3.new(0, i * 0.1, 0)) 
            * CFrame.Angles(0, 0, math.rad(90))
        MidRing.Parent = workspace
        table.insert(CircleParts, MidRing)
        
        -- 各円の回転設定
        task.spawn(function()
            local rotSpeed = (i % 2 == 0) and 0.8 or -0.8
            while MidRing.Parent do
                MidRing.CFrame = MidRing.CFrame * CFrame.Angles(0, math.rad(rotSpeed), 0)
                task.wait(0.03)
            end
        end)
    end
    
    -- ルーン文字風の装飾（12個）
    for i = 0, 11 do
        local Rune = Instance.new("Part")
        Rune.Size = Vector3.new(0.4, radius * 0.3, 0.2)
        Rune.Material = Enum.Material.Neon
        Rune.Color = mainColor
        Rune.Transparency = 0.3
        Rune.Anchored = true
        Rune.CanCollide = false
        local angle = (i / 12) * math.pi * 2
        Rune.CFrame = CFrame.new(position + Vector3.new(0, 0.2, 0))
            * CFrame.Angles(0, angle, math.rad(90))
            * CFrame.new(radius * 0.85, 0, 0)
        Rune.Parent = workspace
        table.insert(CircleParts, Rune)
        
        -- ルーンの装飾ライン
        for j = 1, 2 do
            local RuneLine = Instance.new("Part")
            RuneLine.Size = Vector3.new(0.15, radius * 0.15, 0.15)
            RuneLine.Material = Enum.Material.Neon
            RuneLine.Color = mainColor
            RuneLine.Transparency = 0.35
            RuneLine.Anchored = true
            RuneLine.CanCollide = false
            RuneLine.CFrame = Rune.CFrame 
                * CFrame.new(0, (j - 1.5) * radius * 0.12, 0)
            RuneLine.Parent = workspace
            table.insert(CircleParts, RuneLine)
        end
    end
    
    -- 幾何学模様（星型）
    for i = 0, 4 do
        local StarLine = Instance.new("Part")
        StarLine.Size = Vector3.new(0.25, radius * 1.4, 0.25)
        StarLine.Material = Enum.Material.Neon
        StarLine.Color = mainColor
        StarLine.Transparency = 0.5
        StarLine.Anchored = true
        StarLine.CanCollide = false
        local angle = (i / 5) * math.pi * 2
        StarLine.CFrame = CFrame.new(position + Vector3.new(0, 0.15, 0))
            * CFrame.Angles(0, angle, math.rad(90))
        StarLine.Parent = workspace
        table.insert(CircleParts, StarLine)
    end
    
    -- 中心のコア
    local Core = Instance.new("Part")
    Core.Size = Vector3.new(radius * 0.3, radius * 0.3, radius * 0.3)
    Core.Shape = Enum.PartType.Ball
    Core.Material = Enum.Material.Neon
    Core.Color = mainColor
    Core.Transparency = 0.2
    Core.Anchored = true
    Core.CanCollide = false
    Core.Position = position + Vector3.new(0, 0.3, 0)
    Core.Parent = workspace
    table.insert(CircleParts, Core)
    
    -- コアの光
    local CoreLight = Instance.new("PointLight")
    CoreLight.Color = mainColor
    CoreLight.Range = radius * 2
    CoreLight.Brightness = 1.2
    CoreLight.Parent = Core
    
    -- エネルギーパルス
    task.spawn(function()
        while Core.Parent do
            for i = 0, 10 do
                Core.Size = Vector3.new(
                    radius * 0.3 + i * 0.02,
                    radius * 0.3 + i * 0.02,
                    radius * 0.3 + i * 0.02
                )
                Core.Transparency = 0.2 + i * 0.05
                CoreLight.Brightness = 1.2 - i * 0.05
                task.wait(0.05)
            end
            for i = 10, 0, -1 do
                Core.Size = Vector3.new(
                    radius * 0.3 + i * 0.02,
                    radius * 0.3 + i * 0.02,
                    radius * 0.3 + i * 0.02
                )
                Core.Transparency = 0.2 + i * 0.05
                CoreLight.Brightness = 1.2 - i * 0.05
                task.wait(0.05)
            end
        end
    end)
    
    return CircleParts
end

-- 浮遊する複雑な岩石を作成
local function CreateFloatingRock(position, scale)
    local RockParts = {}
    
    -- メインボディ（不規則な形状）
    local MainRock = Instance.new("Part")
    MainRock.Size = Vector3.new(
        scale * 4 + math.random(-10, 10) * 0.1,
        scale * 3 + math.random(-10, 10) * 0.1,
        scale * 4 + math.random(-10, 10) * 0.1
    )
    MainRock.Material = Enum.Material.Rock
    MainRock.Color = Color3.fromRGB(70, 70, 80)
    MainRock.Anchored = true
    MainRock.CanCollide = false
    MainRock.Position = position
    MainRock.Orientation = Vector3.new(
        math.random(-30, 30),
        math.random(0, 360),
        math.random(-30, 30)
    )
    MainRock.Parent = workspace
    table.insert(RockParts, MainRock)
    
    -- 岩の突起部分（8個）
    for i = 1, 8 do
        local Protrusion = Instance.new("Part")
        Protrusion.Size = Vector3.new(
            scale * (1 + math.random() * 1.5),
            scale * (1 + math.random() * 2),
            scale * (1 + math.random() * 1.5)
        )
        Protrusion.Material = Enum.Material.Rock
        Protrusion.Color = Color3.fromRGB(
            math.random(60, 80),
            math.random(60, 80),
            math.random(70, 90)
        )
        Protrusion.Anchored = true
        Protrusion.CanCollide = false
        local angle = (i / 8) * math.pi * 2
        Protrusion.Position = position + Vector3.new(
            math.cos(angle) * scale * 2,
            math.random(-1, 1) * scale,
            math.sin(angle) * scale * 2
        )
        Protrusion.Orientation = Vector3.new(
            math.random(-45, 45),
            math.random(0, 360),
            math.random(-45, 45)
        )
        Protrusion.Parent = workspace
        table.insert(RockParts, Protrusion)
    end
    
    -- 結晶の付着（5個）
    for i = 1, 5 do
        local Crystal = Instance.new("Part")
        Crystal.Size = Vector3.new(
            scale * 0.4,
            scale * (1 + math.random() * 1.5),
            scale * 0.4
        )
        Crystal.Material = Enum.Material.Neon
        Crystal.Color = Color3.fromHSV(math.random(), 0.6, 0.8)
        Crystal.Transparency = 0.3
        Crystal.Anchored = true
        Crystal.CanCollide = false
        local angle = (i / 5) * math.pi * 2
        Crystal.Position = position + Vector3.new(
            math.cos(angle) * scale * 2.5,
            math.random(-2, 2) * scale * 0.5,
            math.sin(angle) * scale * 2.5
        )
        Crystal.Orientation = Vector3.new(
            math.random(-20, 20),
            math.random(0, 360),
            math.random(-20, 20)
        )
        Crystal.Parent = workspace
        table.insert(RockParts, Crystal)
        
        local CrystalLight = Instance.new("PointLight")
        CrystalLight.Color = Crystal.Color
        CrystalLight.Range = scale * 4
        CrystalLight.Brightness = 0.5
        CrystalLight.Parent = Crystal
    end
    
    -- 草や苔（ランダム）
    if math.random() > 0.5 then
        for i = 1, math.random(3, 6) do
            local Vegetation = Instance.new("Part")
            Vegetation.Size = Vector3.new(
                scale * 0.5,
                scale * 0.3,
                scale * 0.5
            )
            Vegetation.Material = Enum.Material.Grass
            Vegetation.Color = Color3.fromRGB(20, math.random(60, 90), 20)
            Vegetation.Transparency = 0.2
            Vegetation.Anchored = true
            Vegetation.CanCollide = false
            Vegetation.Position = position + Vector3.new(
                math.random(-2, 2) * scale,
                scale * 1.5 + math.random() * scale,
                math.random(-2, 2) * scale
            )
            Vegetation.Parent = workspace
            table.insert(RockParts, Vegetation)
        end
    end
    
    -- 浮遊アニメーション
    task.spawn(function()
        local startPos = position
        local time = 0
        while MainRock.Parent do
            time = time + 0.03
            local offset = Vector3.new(
                math.sin(time * 0.7) * scale * 0.5,
                math.sin(time * 1.2) * scale * 0.8,
                math.cos(time * 0.8) * scale * 0.5
            )
            MainRock.Position = startPos + offset
            MainRock.CFrame = MainRock.CFrame * CFrame.Angles(
                math.rad(0.2),
                math.rad(0.3),
                math.rad(0.15)
            )
            
            -- 突起も一緒に移動
            for j = 1, 8 do
                if RockParts[j + 1] and RockParts[j + 1].Parent then
                    local angle = (j / 8) * math.pi * 2
                    RockParts[j + 1].Position = startPos + offset + Vector3.new(
                        math.cos(angle) * scale * 2,
                        math.random(-1, 1) * scale,
                        math.sin(angle) * scale * 2
                    )
                end
            end
            
            task.wait(0.03)
        end
    end)
    
    return RockParts
end

-- 古代の像を作成
local function CreateAncientStatue(position, scale)
    local StatueParts = {}
    
    -- 台座
    local Pedestal = Instance.new("Part")
    Pedestal.Size = Vector3.new(scale * 4, scale * 2, scale * 4)
    Pedestal.Material = Enum.Material.Marble
    Pedestal.Color = Color3.fromRGB(120, 120, 130)
    Pedestal.Anchored = true
    Pedestal.CanCollide = false
    Pedestal.Position = position
    Pedestal.Parent = workspace
    table.insert(StatueParts, Pedestal)
    
    -- 台座の装飾
    for i = 0, 3 do
        local Decoration = Instance.new("Part")
        Decoration.Size = Vector3.new(scale * 3.5, scale * 0.4, scale * 0.8)
        Decoration.Material = Enum.Material.Marble
        Decoration.Color = Color3.fromRGB(100, 100, 110)
        Decoration.Anchored = true
        Decoration.CanCollide = false
        Decoration.CFrame = CFrame.new(position) 
            * CFrame.Angles(0, math.rad(i * 90), 0)
            * CFrame.new(0, scale * 0.8, scale * 1.8)
        Decoration.Parent = workspace
        table.insert(StatueParts, Decoration)
    end
    
    -- 像の下半身
    local LowerBody = Instance.new("Part")
    LowerBody.Size = Vector3.new(scale * 2.5, scale * 5, scale * 2)
    LowerBody.Material = Enum.Material.Marble
    LowerBody.Color = Color3.fromRGB(130, 130, 140)
    LowerBody.Anchored = true
    LowerBody.CanCollide = false
    LowerBody.Position = position + Vector3.new(0, scale * 3.5, 0)
    LowerBody.Parent = workspace
    table.insert(StatueParts, LowerBody)
    
    -- ローブの表現
    for i = 0, 7 do
        local RobeFold = Instance.new("Part")
        RobeFold.Size = Vector3.new(scale * 0.3, scale * 4, scale * 2)
        RobeFold.Material = Enum.Material.Marble
        RobeFold.Color = Color3.fromRGB(110, 110, 120)
        RobeFold.Anchored = true
        RobeFold.CanCollide = false
        local angle = (i / 8) * math.pi * 2
        RobeFold.CFrame = CFrame.new(position + Vector3.new(0, scale * 3.5, 0))
            * CFrame.Angles(0, angle, 0)
            * CFrame.new(scale * 1.1, 0, 0)
        RobeFold.Parent = workspace
        table.insert(StatueParts, RobeFold)
    end
    
    -- 像の上半身
    local UpperBody = Instance.new("Part")
    UpperBody.Size = Vector3.new(scale * 3, scale * 4, scale * 2.5)
    UpperBody.Material = Enum.Material.Marble
    UpperBody.Color = Color3.fromRGB(135, 135, 145)
    UpperBody.Anchored = true
    UpperBody.CanCollide = false
    UpperBody.Position = position + Vector3.new(0, scale * 8, 0)
    UpperBody.Parent = workspace
    table.insert(StatueParts, UpperBody)
    
    -- 腕（2本）
    for i = 0, 1 do
        local Arm = Instance.new("Part")
        Arm.Size = Vector3.new(scale * 1.2, scale * 4.5, scale * 1.2)
        Arm.Material = Enum.Material.Marble
        Arm.Color = Color3.fromRGB(130, 130, 140)
        Arm.Anchored = true
        Arm.CanCollide = false
        local side = (i == 0) and -1 or 1
        Arm.CFrame = CFrame.new(position + Vector3.new(side * scale * 2, scale * 7.5, 0))
            * CFrame.Angles(math.rad(30), 0, math.rad(side * 15))
        Arm.Parent = workspace
        table.insert(StatueParts, Arm)
        
        -- 手
        local Hand = Instance.new("Part")
        Hand.Size = Vector3.new(scale * 0.9, scale * 1.5, scale * 0.9)
        Hand.Material = Enum.Material.Marble
        Hand.Color = Color3.fromRGB(125, 125, 135)
        Hand.Anchored = true
        Hand.CanCollide = false
        Hand.Position = Arm.Position + Vector3.new(0, scale * -3, scale * 1.2)
        Hand.Parent = workspace
        table.insert(StatueParts, Hand)
    end
    
    -- 頭部
    local Head = Instance.new("Part")
    Head.Size = Vector3.new(scale * 2, scale * 2.5, scale * 2)
    Head.Material = Enum.Material.Marble
    Head.Color = Color3.fromRGB(135, 135, 145)
    Head.Anchored = true
    Head.CanCollide = false
    Head.Position = position + Vector3.new(0, scale * 11, 0)
    Head.Parent = workspace
    table.insert(StatueParts, Head)
    
    -- フード
    local Hood = Instance.new("Part")
    Hood.Size = Vector3.new(scale * 2.5, scale * 2, scale * 2.5)
    Hood.Material = Enum.Material.Marble
    Hood.Color = Color3.fromRGB(115, 115, 125)
    Hood.Anchored = true
    Hood.CanCollide = false
    Hood.Position = position + Vector3.new(0, scale * 12, scale * -0.3)
    Hood.Parent = workspace
    table.insert(StatueParts, Hood)
    
    -- 魔法のオーブ（手に持たせる）
    local MagicOrb = Instance.new("Part")
    MagicOrb.Size = Vector3.new(scale * 1.5, scale * 1.5, scale * 1.5)
    MagicOrb.Shape = Enum.PartType.Ball
    MagicOrb.Material = Enum.Material.Neon
    MagicOrb.Color = Color3.fromHSV(math.random(), 0.7, 0.9)
    MagicOrb.Transparency = 0.3
    MagicOrb.Anchored = true
    MagicOrb.CanCollide = false
    MagicOrb.Position = position + Vector3.new(0, scale * 6, scale * 2)
    MagicOrb.Parent = workspace
    table.insert(StatueParts, MagicOrb)
    
    local OrbLight = Instance.new("PointLight")
    OrbLight.Color = MagicOrb.Color
    OrbLight.Range = scale * 10
    OrbLight.Brightness = 1
    OrbLight.Parent = MagicOrb
    
    -- オーブのパーティクル
    local OrbParticle = Instance.new("ParticleEmitter")
    OrbParticle.Texture = "rbxassetid://241809795"
    OrbParticle.Color = ColorSequence.new(MagicOrb.Color)
    OrbParticle.Size = NumberSequence.new(0.3)
    OrbParticle.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.4),
        NumberSequenceKeypoint.new(1, 1)
    })
    OrbParticle.Lifetime = NumberRange.new(1, 2)
    OrbParticle.Rate = 15
    OrbParticle.Speed = NumberRange.new(0.5, 1.5)
    OrbParticle.LightEmission = 0.7
    OrbParticle.Parent = MagicOrb
    
    -- 風化のひび
    for i = 1, math.random(4, 7) do
        local Crack = Instance.new("Part")
        Crack.Size = Vector3.new(scale * 0.2, scale * math.random(2, 5), scale * 0.2)
        Crack.Material = Enum.Material.Slate
        Crack.Color = Color3.fromRGB(60, 60, 70)
        Crack.Transparency = 0.4
        Crack.Anchored = true
        Crack.CanCollide = false
        local targetPart = StatueParts[math.random(3, #StatueParts)]
        Crack.Position = targetPart.Position + Vector3.new(
            math.random(-1, 1) * scale * 0.8,
            math.random(-2, 2) * scale * 0.5,
            math.random(-1, 1) * scale * 0.8
        )
        Crack.Parent = workspace
        table.insert(StatueParts, Crack)
    end
    
    return StatueParts
end

-- 魔法の門（アーチ）を作成
local function CreateMagicGate(position, width, height)
    local GateParts = {}
    
    -- 左の柱
    local LeftPillar = Instance.new("Part")
    LeftPillar.Size = Vector3.new(width * 0.15, height, width * 0.15)
    LeftPillar.Material = Enum.Material.Marble
    LeftPillar.Color = Color3.fromRGB(90, 90, 110)
    LeftPillar.Anchored = true
    LeftPillar.CanCollide = false
    LeftPillar.Position = position + Vector3.new(-width/2, height/2, 0)
    LeftPillar.Parent = workspace
    table.insert(GateParts, LeftPillar)
    
    -- 右の柱
    local RightPillar = LeftPillar:Clone()
    RightPillar.Position = position + Vector3.new(width/2, height/2, 0)
    RightPillar.Parent = workspace
    table.insert(GateParts, RightPillar)
    
    -- 柱の装飾（各柱に5つ）
    for i = 0, 1 do
        local pillar = (i == 0) and LeftPillar or RightPillar
        for j = 1, 5 do
            local Band = Instance.new("Part")
            Band.Size = Vector3.new(width * 0.18, width * 0.08, width * 0.18)
            Band.Shape = Enum.PartType.Cylinder
            Band.Material = Enum.Material.Neon
            Band.Color = Color3.fromHSV((j / 5) * 0.3, 0.6, 0.8)
            Band.Transparency = 0.4
            Band.Anchored = true
            Band.CanCollide = false
            Band.CFrame = CFrame.new(pillar.Position + Vector3.new(0, height/2 - (j * height/6), 0))
                * CFrame.Angles(0, 0, math.rad(90))
            Band.Parent = workspace
            table.insert(GateParts, Band)
        end
    end
    
    -- アーチ（半円を複数パーツで表現）
    local archSegments = 12
    for i = 0, archSegments do
        local angle = (i / archSegments) * math.pi
        local ArchSegment = Instance.new("Part")
        ArchSegment.Size = Vector3.new(width * 0.15, width * 0.2, width * 0.15)
        ArchSegment.Material = Enum.Material.Marble
        ArchSegment.Color = Color3.fromRGB(95, 95, 115)
        ArchSegment.Anchored = true
        ArchSegment.CanCollide = false
        local x = math.cos(angle) * width/2
        local y = math.sin(angle) * width/2
        ArchSegment.CFrame = CFrame.new(position + Vector3.new(x, height + y, 0))
            * CFrame.Angles(0, 0, -angle)
        ArchSegment.Parent = workspace
        table.insert(GateParts, ArchSegment)
        
        -- アーチの光る装飾
        if i % 2 == 0 then
            local ArchLight = Instance.new("Part")
            ArchLight.Size = Vector3.new(width * 0.12, width * 0.12, width * 0.12)
            ArchLight.Shape = Enum.PartType.Ball
            ArchLight.Material = Enum.Material.Neon
            ArchLight.Color = Color3.fromHSV((i / archSegments) * 0.4, 0.7, 0.9)
            ArchLight.Transparency = 0.3
            ArchLight.Anchored = true
            ArchLight.CanCollide = false
            ArchLight.Position = ArchSegment.Position
            ArchLight.Parent = workspace
            table.insert(GateParts, ArchLight)
            
            local Light = Instance.new("PointLight")
            Light.Color = ArchLight.Color
            Light.Range = width * 0.8
            Light.Brightness = 0.8
            Light.Parent = ArchLight
        end
    end
    
    -- 門のポータル効果（中央）
    local PortalEffect = Instance.new("Part")
    PortalEffect.Size = Vector3.new(width * 0.9, height * 0.9, width * 0.05)
    PortalEffect.Material = Enum.Material.Neon
    PortalEffect.Color = Color3.fromRGB(100, 150, 200)
    PortalEffect.Transparency = 0.7
    PortalEffect.Anchored = true
    PortalEffect.CanCollide = false
    PortalEffect.Position = position + Vector3.new(0, height/2, 0)
    PortalEffect.Parent = workspace
    table.insert(GateParts, PortalEffect)
    
    -- ポータルのパーティクル
    local PortalParticle = Instance.new("ParticleEmitter")
    PortalParticle.Texture = "rbxassetid://241809795"
    PortalParticle.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 150, 200)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 100, 200)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 200, 150))
    })
    PortalParticle.Size = NumberSequence.new(0.5)
    PortalParticle.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.6),
        NumberSequenceKeypoint.new(1, 1)
    })
    PortalParticle.Lifetime = NumberRange.new(2, 4)
    PortalParticle.Rate = 25
    PortalParticle.Speed = NumberRange.new(1, 3)
    PortalParticle.Rotation = NumberRange.new(0, 360)
    PortalParticle.RotSpeed = NumberRange.new(-60, 60)
    PortalParticle.LightEmission = 0.6
    PortalParticle.Parent = PortalEffect
    
    -- ポータルの渦アニメーション
    task.spawn(function()
        while PortalEffect.Parent do
            PortalEffect.CFrame = PortalEffect.CFrame * CFrame.Angles(0, math.rad(1.5), 0)
            task.wait(0.03)
        end
    end)
    
    return GateParts
end

-- エネルギー結界ドームを作成
local function CreateEnergyDome(position, radius)
    local DomeParts = {}
    
    -- ドームの骨格（経線）
    for i = 0, 11 do
        local angle = (i / 12) * math.pi * 2
        for j = 0, 8 do
            local heightAngle = (j / 8) * (math.pi / 2)
            local Segment = Instance.new("Part")
            Segment.Size = Vector3.new(0.3, radius * 0.3, 0.3)
            Segment.Material = Enum.Material.Neon
            Segment.Color = Color3.fromHSV((i / 12) * 0.3, 0.6, 0.9)
            Segment.Transparency = 0.5
            Segment.Anchored = true
            Segment.CanCollide = false
            local x = math.cos(angle) * math.cos(heightAngle) * radius
            local y = math.sin(heightAngle) * radius
            local z = math.sin(angle) * math.cos(heightAngle) * radius
            Segment.Position = position + Vector3.new(x, y, z)
            Segment.Parent = workspace
            table.insert(DomeParts, Segment)
        end
    end
    
    -- ドームの骨格（緯線）
    for j = 1, 5 do
        local heightAngle = (j / 6) * (math.pi / 2)
        local ringRadius = math.cos(heightAngle) * radius
        for i = 0, 23 do
            local angle = (i / 24) * math.pi * 2
            local Ring = Instance.new("Part")
            Ring.Size = Vector3.new(0.25, radius * 0.15, 0.25)
            Ring.Material = Enum.Material.Neon
            Ring.Color = Color3.fromHSV(0.5 + (j / 5) * 0.2, 0.7, 0.85)
            Ring.Transparency = 0.55
            Ring.Anchored = true
            Ring.CanCollide = false
            local x = math.cos(angle) * ringRadius
            local y = math.sin(heightAngle) * radius
            local z = math.sin(angle) * ringRadius
            Ring.Position = position + Vector3.new(x, y, z)
            Ring.Parent = workspace
            table.insert(DomeParts, Ring)
        end
    end
    
    -- 頂点のオーブ
    local ApexOrb = Instance.new("Part")
    ApexOrb.Size = Vector3.new(radius * 0.3, radius * 0.3, radius * 0.3)
    ApexOrb.Shape = Enum.PartType.Ball
    ApexOrb.Material = Enum.Material.Neon
    ApexOrb.Color = Color3.fromRGB(150, 200, 255)
    ApexOrb.Transparency = 0.3
    ApexOrb.Anchored = true
    ApexOrb.CanCollide = false
    ApexOrb.Position = position + Vector3.new(0, radius, 0)
    ApexOrb.Parent = workspace
    table.insert(DomeParts, ApexOrb)
    
    local ApexLight = Instance.new("PointLight")
    ApexLight.Color = Color3.fromRGB(150, 200, 255)
    ApexLight.Range = radius * 2
    ApexLight.Brightness = 1.5
    ApexLight.Parent = ApexOrb
    
    -- エネルギーフィールドパーティクル
    local FieldParticle = Instance.new("ParticleEmitter")
    FieldParticle.Texture = "rbxassetid://241809795"
    FieldParticle.Color = ColorSequence.new(Color3.fromRGB(150, 200, 255))
    FieldParticle.Size = NumberSequence.new(0.2)
    FieldParticle.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(1, 1)
    })
    FieldParticle.Lifetime = NumberRange.new(2, 4)
    FieldParticle.Rate = 15
    FieldParticle.Speed = NumberRange.new(0.5)
    FieldParticle.LightEmission = 0.7
    FieldParticle.Parent = ApexOrb
    
    -- 脈動アニメーション
    task.spawn(function()
        while ApexOrb.Parent do
            for i = 0, 20 do
                local scale = 1 + math.sin(i / 20 * math.pi) * 0.2
                ApexOrb.Size = Vector3.new(
                    radius * 0.3 * scale,
                    radius * 0.3 * scale,
                    radius * 0.3 * scale
                )
                ApexLight.Brightness = 1.5 + math.sin(i / 20 * math.pi) * 0.5
                task.wait(0.05)
            end
        end
    end)
    
    return DomeParts
end

-- ========== 究極1500演出関数 ========== --
local function PlayUltimate1500Cutscene(player)
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
        Content = "1500種類の超本格演出...",
        Duration = 3,
        Image = 4483362458,
    })
    
    -- ========== 演出用ステージ作成 ========== --
    local StageCenter = HumanoidRootPart.Position + Vector3.new(0, 80, 0)
    
    -- 天空のプラットフォーム（複雑な構造）
    local SkyPlatform = Instance.new("Part")
    SkyPlatform.Size = Vector3.new(50, 1.5, 50)
    SkyPlatform.Position = StageCenter + Vector3.new(0, 30, 0)
    SkyPlatform.Anchored = true
    SkyPlatform.Transparency = 0.85
    SkyPlatform.Material = Enum.Material.Neon
    SkyPlatform.Color = Color3.fromRGB(15, 15, 35)
    SkyPlatform.CanCollide = false
    SkyPlatform.Parent = workspace
    
    -- プラットフォームの模様（魔法陣風）
    for i = 0, 11 do
        local Pattern = Instance.new("Part")
        Pattern.Size = Vector3.new(0.4, 1.6, 24)
        Pattern.Material = Enum.Material.Neon
        Pattern.Color = Color3.fromRGB(50, 80, 160)
        Pattern.Transparency = 0.4
        Pattern.Anchored = true
        Pattern.CanCollide = false
        local angle = (i / 12) * math.pi * 2
        Pattern.CFrame = CFrame.new(SkyPlatform.Position)
            * CFrame.Angles(0, angle, 0)
        Pattern.Parent = workspace
    end
    
    -- ========== 超本格背景演出（600種類） ========== --
    local BackgroundEffects = {}
    
    -- 【1-60】リアルな森システム（木15本 x 平均4パーツ = 60）
    for i = 1, 15 do
        local angle = (i / 15) * math.pi * 2
        local treePos = StageCenter + Vector3.new(
            math.cos(angle) * 40,
            -25,
            math.sin(angle) * 40
        )
        local treeParts = CreateRealisticTree(treePos, 0.8 + math.random() * 0.4)
        for _, part in ipairs(treeParts) do
            table.insert(BackgroundEffects, part)
        end
    end
    
    -- 【61-120】水晶クラスター（12個 x 平均5パーツ = 60）
    for i = 1, 12 do
        local angle = (i / 12) * math.pi * 2
        local crystalPos = StageCenter + Vector3.new(
            math.cos(angle) * 25,
            -5 + math.random(-5, 10),
            math.sin(angle) * 25
        )
        local hue = (i / 12)
        local crystalColor = Color3.fromHSV(hue, 0.7, 0.9)
        local crystalParts = CreateCrystalCluster(crystalPos, crystalColor, 2 + math.random())
        for _, part in ipairs(crystalParts) do
            table.insert(BackgroundEffects, part)
        end
    end
    
    -- 【121-240】古代遺跡の柱（12本 x 平均10パーツ = 120）
    for i = 1, 12 do
        local angle = (i / 12) * math.pi * 2
        local pillarPos = StageCenter + Vector3.new(
            math.cos(angle) * 32,
            -15,
            math.sin(angle) * 32
        )
        local pillarParts = CreateAncientPillar(pillarPos, 28, 2)
        for _, part in ipairs(pillarParts) do
            table.insert(BackgroundEffects, part)
        end
    end
    
    -- 【241-300】複雑な魔法陣（20個 x 平均3パーツ = 60）
    for i = 1, 20 do
        local circlePos = StageCenter + Vector3.new(
            0,
            -25 + i * 1.5,
            0
        )
        local hue = (i / 20)
        local circleColor = Color3.fromHSV(hue, 0.6, 0.8)
        local circleParts = CreateComplexMagicCircle(circlePos, 8 + i * 0.8, circleColor)
        for _, part in ipairs(circleParts) do
            table.insert(BackgroundEffects, part)
        end
    end
    
    -- 【301-420】浮遊岩石群（20個 x 平均6パーツ = 120）
    for i = 1, 20 do
        local angle = (i / 20) * math.pi * 2
        local rockPos = StageCenter + Vector3.new(
            math.cos(angle) * 45,
            15 + math.sin(i * 0.5) * 8,
            math.sin(angle) * 45
        )
        local rockParts = CreateFloatingRock(rockPos, 0.8 + math.random() * 0.6)
        for _, part in ipairs(rockParts) do
            table.insert(BackgroundEffects, part)
        end
    end
    
    -- 【421-540】古代の像（6体 x 平均20パーツ = 120）
    for i = 1, 6 do
        local angle = (i / 6) * math.pi * 2
        local statuePos = StageCenter + Vector3.new(
            math.cos(angle) * 38,
            -15,
            math.sin(angle) * 38
        )
        local statueParts = CreateAncientStatue(statuePos, 1.2)
        for _, part in ipairs(statueParts) do
            table.insert(BackgroundEffects, part)
        end
    end
    
    -- 【541-600】魔法の門（4つ x 平均15パーツ = 60）
    for i = 1, 4 do
        local angle = (i / 4) * math.pi * 2 + math.rad(45)
        local gatePos = StageCenter + Vector3.new(
            math.cos(angle) * 35,
            -10,
            math.sin(angle) * 35
        )
        local gateParts = CreateMagicGate(gatePos, 12, 20)
        for _, part in ipairs(gateParts) do
            table.insert(BackgroundEffects, part)
        end
    end
    
    -- エネルギー結界ドーム
    local domeParts = CreateEnergyDome(StageCenter, 50)
    for _, part in ipairs(domeParts) do
        table.insert(BackgroundEffects, part)
    end
    
    Rayfield:Notify({
        Title = "🌟 背景構築完了",
        Content = "600種類の本格3D構造",
        Duration = 2,
        Image = 4483362458,
    })
    
    -- 階段の作成（さらに複雑に）
    local Stairs = {}
    for i = 1, 12 do
        -- メイン階段
        local Stair = Instance.new("Part")
        Stair.Size = Vector3.new(14, 1.2, 7)
        Stair.Position = SkyPlatform.Position - Vector3.new(0, i * 2.8, i * 2.8)
        Stair.Material = Enum.Material.Marble
        Stair.Color = Color3.fromRGB(12, 12, 30)
        Stair.Anchored = true
        Stair.CanCollide = true
        Stair.Transparency = 0.1
        Stair.Parent = workspace
        table.insert(Stairs, Stair)
        
        -- 階段の側面装飾
        for side = -1, 1, 2 do
            local SideDecor = Instance.new("Part")
            SideDecor.Size = Vector3.new(1.5, 3, 7)
            SideDecor.Material = Enum.Material.Marble
            SideDecor.Color = Color3.fromRGB(20, 20, 40)
            SideDecor.Anchored = true
            SideDecor.CanCollide = false
            SideDecor.Position = Stair.Position + Vector3.new(side * 7.5, 1, 0)
            SideDecor.Parent = workspace
            table.insert(BackgroundEffects, SideDecor)
            
            -- 手すり
            local Handrail = Instance.new("Part")
            Handrail.Size = Vector3.new(0.4, 1.5, 6.5)
            Handrail.Material = Enum.Material.Neon
            Handrail.Color = Color3.fromRGB(60, 100, 180)
            Handrail.Transparency = 0.3
            Handrail.Anchored = true
            Handrail.CanCollide = false
            Handrail.Position = Stair.Position + Vector3.new(side * 8, 2.5, 0)
            Handrail.Parent = workspace
            table.insert(BackgroundEffects, Handrail)
        end
        
        -- 階段の発光ライン（5本）
        for j = 1, 5 do
            local StairLine = Instance.new("Part")
            StairLine.Size = Vector3.new(14, 0.15, 0.5)
            StairLine.Material = Enum.Material.Neon
            StairLine.Color = Color3.fromHSV((i / 12) * 0.3, 0.7, 0.9)
            StairLine.Transparency = 0.3
            StairLine.Anchored = true
            StairLine.CanCollide = false
            StairLine.Position = Stair.Position + Vector3.new(0, 0.7, -3.5 + (j * 1.5))
            StairLine.Parent = workspace
            table.insert(BackgroundEffects, StairLine)
        end
        
        -- 階段の複雑な魔法陣
        local StairCircle = CreateComplexMagicCircle(
            Stair.Position + Vector3.new(0, 1, 0),
            5,
            Color3.fromHSV((i / 12) * 0.4, 0.6, 0.85)
        )
        for _, part in ipairs(StairCircle) do
            table.insert(BackgroundEffects, part)
        end
        
        -- 階段のポイントライト
        local StairLight = Instance.new("PointLight")
        StairLight.Color = Color3.fromRGB(70, 120, 200)
        StairLight.Range = 12
        StairLight.Brightness = 0.8
        StairLight.Parent = Stair
    end
    
    -- プレイヤーを天空に移動
    HumanoidRootPart.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(0, 10, 0))
    
    -- カメラ設定（見やすい位置から開始）
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(15, 10, 20), SkyPlatform.Position)
    
    -- ========== 続きは次のレスポンスで... ========== --
    -- (文字数制限のため、ここで一旦分割します)
    
    Rayfield:Notify({
        Title = "✨ ステージ準備完了",
        Content = "演出を開始します...",
        Duration = 2,
        Image = 4483362458,
    })
    
    task.wait(1)
    
    -- ========== 暗めの超高品質天使の翼（前回と同じ） ========== --
    
    -- 左翼メイン
    local LeftWingMain = Instance.new("Part")
    LeftWingMain.Size = Vector3.new(0.5, 11, 5.5)
    LeftWingMain.Material = Enum.Material.Neon
    LeftWingMain.Color = Color3.fromRGB(180, 180, 190)
    LeftWingMain.Transparency = 0.5
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
    
    local RightWingMain = LeftWingMain:Clone()
    RightWingMain.Parent = Character
    
    local RightWingWeld = Instance.new("Weld")
    RightWingWeld.Part0 = HumanoidRootPart
    RightWingWeld.Part1 = RightWingMain
    RightWingWeld.C0 = CFrame.new(1.2, 1.5, 0.8) * CFrame.Angles(0, math.rad(-25), math.rad(15))
    RightWingWeld.Parent = HumanoidRootPart
    
    local RightWingLayer2 = LeftWingLayer2:Clone()
    RightWingLayer2.Parent = Character
    
    local RightWingWeld2 = Instance.new("Weld")
    RightWingWeld2.Part0 = HumanoidRootPart
    RightWingWeld2.Part1 = RightWingLayer2
    RightWingWeld2.C0 = CFrame.new(1.5, 1.3, 0.6) * CFrame.Angles(0, math.rad(-30), math.rad(12))
    RightWingWeld2.Parent = HumanoidRootPart
    
    local RightWingLayer3 = LeftWingLayer3:Clone()
    RightWingLayer3.Parent = Character
    
    local RightWingWeld3 = Instance.new("Weld")
    RightWingWeld3.Part0 = HumanoidRootPart
    RightWingWeld3.Part1 = RightWingLayer3
    RightWingWeld3.C0 = CFrame.new(1.8, 1.1, 0.4) * CFrame.Angles(0, math.rad(-35), math.rad(10))
    RightWingWeld3.Parent = HumanoidRootPart
    
    local LeftFeathers = {}
    local RightFeathers = {}
    
    for i = 1, 6 do
        local LeftFeather = Instance.new("Part")
        LeftFeather.Size = Vector3.new(0.2, 3.5 + i * 0.5, 1.8)
        LeftFeather.Material = Enum.Material.Neon
        LeftFeather.Color = Color3.fromRGB(190, 190, 200)
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
    
    local WingLight = Instance.new("PointLight")
    WingLight.Color = Color3.fromRGB(200, 200, 210)
    WingLight.Range = 8
    WingLight.Brightness = 0.6
    WingLight.Parent = HumanoidRootPart
    
    -- 降臨サウンド
    local DescentSound = Instance.new("Sound")
    DescentSound.SoundId = "rbxassetid://1843463175"
    DescentSound.Volume = 0.7
    DescentSound.Parent = HumanoidRootPart
    DescentSound:Play()
    
    -- ========== 900種類のプレイヤーアニメーション ========== --
    
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(12, 8, 15), SkyPlatform.Position)
    task.wait(0.5)
    
    -- 【1-30】翼展開
    for i = 1, 30 do
        LeftWingWeld.C0 = LeftWingWeld.C0 * CFrame.Angles(0, 0, math.rad(-1.5))
        RightWingWeld.C0 = RightWingWeld.C0 * CFrame.Angles(0, 0, math.rad(1.5))
        LeftWingWeld2.C0 = LeftWingWeld2.C0 * CFrame.Angles(0, 0, math.rad(-1.3))
        RightWingWeld2.C0 = RightWingWeld2.C0 * CFrame.Angles(0, 0, math.rad(1.3))
        LeftWingWeld3.C0 = LeftWingWeld3.C0 * CFrame.Angles(0, 0, math.rad(-1.1))
        RightWingWeld3.C0 = RightWingWeld3.C0 * CFrame.Angles(0, 0, math.rad(1.1))
        
        for _, feather in ipairs(LeftFeathers) do
            feather.weld.C0 = feather.weld.C0 * CFrame.Angles(0, 0, math.rad(-0.9))
        end
        for _, feather in ipairs(RightFeathers) do
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
    
    Camera.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(20, 5, 5), SkyPlatform.Position)
    
    -- 【81-500】階段降下アニメーション（各ステップ35種類 x 12ステップ = 420種類）
    for step = 1, 12 do
        local targetStair = Stairs[step]
        
        -- 【1-5】消失エフェクト群
        for i = 1, 5 do
            local DisappearEffect = Instance.new("Part")
            DisappearEffect.Size = Vector3.new(2 + i * 0.5, 2 + i * 0.5, 2 + i * 0.5)
            DisappearEffect.Shape = Enum.PartType.Ball
            DisappearEffect.Material = Enum.Material.Neon
            DisappearEffect.Color = Color3.fromHSV((i / 5) * 0.3, 0.6, 0.9)
            DisappearEffect.Transparency = 0.3 + i * 0.1
            DisappearEffect.Anchored = true
            DisappearEffect.CanCollide = false
            DisappearEffect.Position = HumanoidRootPart.Position
            DisappearEffect.Parent = workspace
            
            task.spawn(function()
                for j = 1, 15 do
                    DisappearEffect.Size = DisappearEffect.Size + Vector3.new(0.4, 0.4, 0.4)
                    DisappearEffect.Transparency = 0.3 + i * 0.1 + (j / 15) * 0.5
                    task.wait(0.01)
                end
                DisappearEffect:Destroy()
            end)
        end
        
        task.wait(0.12)
        HumanoidRootPart.CFrame = CFrame.new(targetStair.Position + Vector3.new(0, 2.5, 0))
        
        -- 【6-10】出現エフェクト群
        for i = 1, 5 do
            local AppearEffect = Instance.new("Part")
            AppearEffect.Size = Vector3.new(1.5, 10 + i * 2, 1.5)
            AppearEffect.Material = Enum.Material.Neon
            AppearEffect.Color = Color3.fromHSV(0.5 + (i / 5) * 0.2, 0.7, 0.85)
            AppearEffect.Transparency = 0.4 + i * 0.08
            AppearEffect.Anchored = true
            AppearEffect.CanCollide = false
            local angle = (i / 5) * math.pi * 2
            AppearEffect.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * 2,
                0,
                math.sin(angle) * 2
            )
            AppearEffect.Parent = workspace
            
            task.spawn(function()
                for j = 1, 12 do
                    AppearEffect.Transparency = 0.4 + i * 0.08 + (j / 12) * 0.5
                    task.wait(0.02)
                end
                AppearEffect:Destroy()
            end)
        end
        
        -- 【11】着地音
        local StepSound = Instance.new("Sound")
        StepSound.SoundId = "rbxassetid://5095207895"
        StepSound.Volume = 0.4
        StepSound.Pitch = 0.85 + (step * 0.08)
        StepSound.Parent = targetStair
        StepSound:Play()
        task.delay(1, function() StepSound:Destroy() end)
        
        -- 【12-16】足元の複雑な魔法陣（5層）
        for i = 1, 5 do
            local FootCircle = Instance.new("Part")
            FootCircle.Size = Vector3.new(4 + i * 1.5, 0.15, 4 + i * 1.5)
            FootCircle.Shape = Enum.PartType.Cylinder
            FootCircle.Material = Enum.Material.Neon
            FootCircle.Color = Color3.fromHSV((step / 12) * 0.4 + (i / 5) * 0.1, 0.7, 0.85)
            FootCircle.Transparency = 0.3 + i * 0.1
            FootCircle.Anchored = true
            FootCircle.CanCollide = false
            FootCircle.Position = targetStair.Position + Vector3.new(0, 0.6 + i * 0.05, 0)
            FootCircle.Orientation = Vector3.new(0, 0, 90)
            FootCircle.Parent = workspace
            
            task.spawn(function()
                local rotSpeed = (i % 2 == 0) and 5 or -5
                for j = 1, 20 do
                    FootCircle.CFrame = FootCircle.CFrame * CFrame.Angles(0, math.rad(rotSpeed), 0)
                    FootCircle.Transparency = 0.3 + i * 0.1 + (j / 20) * 0.5
                    task.wait(0.02)
                end
                FootCircle:Destroy()
            end)
        end
        
        -- 【17-24】周囲の光の柱（8本）
        for angle = 0, 315, 45 do
            local LightBeam = Instance.new("Part")
            LightBeam.Size = Vector3.new(0.8, 12, 0.8)
            LightBeam.Material = Enum.Material.Neon
            LightBeam.Color = Color3.fromHSV((angle / 360) * 0.4, 0.6, 0.9)
            LightBeam.Transparency = 0.4
            LightBeam.Anchored = true
            LightBeam.CanCollide = false
            local rad = math.rad(angle)
            LightBeam.Position = targetStair.Position + Vector3.new(
                math.cos(rad) * 6,
                6,
                math.sin(rad) * 6
            )
            LightBeam.Parent = workspace
            
            local BeamLight = Instance.new("PointLight")
            BeamLight.Color = LightBeam.Color
            BeamLight.Range = 8
            BeamLight.Brightness = 0.8
            BeamLight.Parent = LightBeam
            
            task.delay(0.6, function() LightBeam:Destroy() end)
        end
        
        -- 【25-29】エネルギー波紋（5層）
        for i = 1, 5 do
            task.spawn(function()
                task.wait(i * 0.06)
                local EnergyRing = Instance.new("Part")
                EnergyRing.Size = Vector3.new(2, 0.2, 2)
                EnergyRing.Shape = Enum.PartType.Cylinder
                EnergyRing.Material = Enum.Material.Neon
                EnergyRing.Color = Color3.fromHSV(0.6 + (i / 5) * 0.2, 0.7, 0.85)
                EnergyRing.Transparency = 0.3
                EnergyRing.Anchored = true
                EnergyRing.CanCollide = false
                EnergyRing.Position = targetStair.Position
                EnergyRing.Orientation = Vector3.new(0, 0, 90)
                EnergyRing.Parent = workspace
                
                for j = 1, 25 do
                    EnergyRing.Size = EnergyRing.Size + Vector3.new(i * 0.6, 0, i * 0.6)
                    EnergyRing.Transparency = 0.3 + (j / 25) * 0.7
                    task.wait(0.015)
                end
                EnergyRing:Destroy()
            end)
        end
        
        -- 【30-35】追加の属性エフェクト（6種類）
        -- 炎の渦
        local FireSpiral = Instance.new("Part")
        FireSpiral.Size = Vector3.new(2.5, 6, 2.5)
        FireSpiral.Material = Enum.Material.Neon
        FireSpiral.Color = Color3.fromRGB(220, 120, 30)
        FireSpiral.Transparency = 0.5
        FireSpiral.Anchored = true
        FireSpiral.CanCollide = false
        FireSpiral.Position = targetStair.Position + Vector3.new(5, 3, 0)
        FireSpiral.Parent = workspace
        
        local FireParticle = Instance.new("ParticleEmitter")
        FireParticle.Texture = "rbxassetid://6101261905"
        FireParticle.Color = ColorSequence.new(Color3.fromRGB(220, 100, 25))
        FireParticle.Size = NumberSequence.new(1.2)
        FireParticle.Lifetime = NumberRange.new(0.4)
        FireParticle.Rate = 25
        FireParticle.Speed = NumberRange.new(2)
        FireParticle.LightEmission = 0.6
        FireParticle.Parent = FireSpiral
        task.delay(0.7, function() FireSpiral:Destroy() end)
        
        -- 氷の結晶
        local IceShard = Instance.new("Part")
        IceShard.Size = Vector3.new(1.2, 5, 1.2)
        IceShard.Material = Enum.Material.Ice
        IceShard.Color = Color3.fromRGB(130, 180, 220)
        IceShard.Transparency = 0.3
        IceShard.Reflectance = 0.5
        IceShard.Anchored = true
        IceShard.CanCollide = false
        IceShard.Position = targetStair.Position + Vector3.new(-5, 2.5, 0)
        IceShard.Orientation = Vector3.new(15, 0, 0)
        IceShard.Parent = workspace
        task.delay(0.7, function() IceShard:Destroy() end)
        
        -- 電撃
        local Lightning = Instance.new("Part")
        Lightning.Size = Vector3.new(0.4, 10, 0.4)
        Lightning.Material = Enum.Material.Neon
        Lightning.Color = Color3.fromRGB(110, 160, 240)
        Lightning.Transparency = 0.2
        Lightning.Anchored = true
        Lightning.CanCollide = false
        Lightning.Position = targetStair.Position + Vector3.new(0, 5, 5)
        Lightning.Parent = workspace
        
        local LightningGlow = Instance.new("PointLight")
        LightningGlow.Color = Color3.fromRGB(110, 160, 240)
        LightningGlow.Range = 15
        LightningGlow.Brightness = 2
        LightningGlow.Parent = Lightning
        task.delay(0.25, function() Lightning:Destroy() end)
        
        -- 闇のオーラ
        local DarkAura = Instance.new("Part")
        DarkAura.Size = Vector3.new(4, 8, 4)
        DarkAura.Material = Enum.Material.Neon
        DarkAura.Color = Color3.fromRGB(20, 20, 30)
        DarkAura.Transparency = 0.6
        DarkAura.Anchored = true
        DarkAura.CanCollide = false
        DarkAura.Position = targetStair.Position + Vector3.new(0, 4, -5)
        DarkAura.Parent = workspace
        
        local DarkParticle = Instance.new("ParticleEmitter")
        DarkParticle.Texture = "rbxassetid://243662263"
        DarkParticle.Color = ColorSequence.new(Color3.fromRGB(30, 30, 40))
        DarkParticle.Size = NumberSequence.new(1)
        DarkParticle.Lifetime = NumberRange.new(1)
        DarkParticle.Rate = 20
        DarkParticle.Speed = NumberRange.new(1.5)
        DarkParticle.Parent = DarkAura
        task.delay(0.7, function() DarkAura:Destroy() end)
        
        -- 聖なる光
        local HolyLight = Instance.new("Part")
        HolyLight.Size = Vector3.new(1.5, 15, 1.5)
        HolyLight.Material = Enum.Material.Neon
        HolyLight.Color = Color3.fromRGB(255, 250, 200)
        HolyLight.Transparency = 0.4
        HolyLight.Anchored = true
        HolyLight.CanCollide = false
        HolyLight.Position = HumanoidRootPart.Position + Vector3.new(0, 7.5, 0)
        HolyLight.Parent = workspace
        task.delay(0.7, function() HolyLight:Destroy() end)
        
        -- 大地の隆起
        local EarthSpike = Instance.new("Part")
        EarthSpike.Size = Vector3.new(2, 6, 2)
        EarthSpike.Material = Enum.Material.Rock
        EarthSpike.Color = Color3.fromRGB(100, 80, 60)
        EarthSpike.Anchored = true
        EarthSpike.CanCollide = false
        EarthSpike.Position = targetStair.Position + Vector3.new(3, 3, 3)
        EarthSpike.Orientation = Vector3.new(20, 30, 0)
        EarthSpike.Parent = workspace
        task.delay(0.7, function() EarthSpike:Destroy() end)
        
        -- カメラをプレイヤーに追従
        local camAngle = (step / 12) * math.pi * 0.8
        Camera.CFrame = CFrame.new(
            HumanoidRootPart.Position + Vector3.new(
                math.cos(camAngle) * 15, 
                7, 
                math.sin(camAngle) * 12
            ), 
            HumanoidRootPart.Position
        )
        
        task.wait(0.8)
    end
    
    -- 【501-650】着地後の大演出（150種類）
    Camera.CFrame = CFrame.new(HumanoidRootPart.Position + Vector3.new(15, 20, 18), HumanoidRootPart.Position)
    
    for i = 1, 150 do
        if i <= 40 then
            -- 巨大衝撃波
            local MassiveShockwave = Instance.new("Part")
            MassiveShockwave.Size = Vector3.new(i * 3, 0.6, i * 3)
            MassiveShockwave.Shape = Enum.PartType.Cylinder
            MassiveShockwave.Material = Enum.Material.Neon
            MassiveShockwave.Color = Color3.fromHSV((i / 40), 0.5, 0.9)
            MassiveShockwave.Transparency = 0.2 + (i / 40) * 0.7
            MassiveShockwave.Anchored = true
            MassiveShockwave.CanCollide = false
            MassiveShockwave.Position = HumanoidRootPart.Position
            MassiveShockwave.Orientation = Vector3.new(0, 0, 90)
            MassiveShockwave.Parent = workspace
            task.delay(0.6, function() MassiveShockwave:Destroy() end)
            
        elseif i <= 80 then
            -- 地面から光の柱噴出
            local GroundLight = Instance.new("Part")
            GroundLight.Size = Vector3.new(2, 25, 2)
            GroundLight.Material = Enum.Material.Neon
            GroundLight.Color = Color3.fromHSV(((i - 40) / 40) * 0.4, 0.6, 0.9)
            GroundLight.Transparency = 0.4
            GroundLight.Anchored = true
            GroundLight.CanCollide = false
            local angle = ((i - 40) / 40) * math.pi * 2
            GroundLight.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * (8 + (i - 40) * 0.5), 
                -10, 
                math.sin(angle) * (8 + (i - 40) * 0.5)
            )
            GroundLight.Parent = workspace
            task.delay(0.8, function() GroundLight:Destroy() end)
            
        elseif i <= 120 then
            -- 光のオーブ乱舞
            local DancingOrb = Instance.new("Part")
            DancingOrb.Size = Vector3.new(0.6, 0.6, 0.6)
            DancingOrb.Shape = Enum.PartType.Ball
            DancingOrb.Material = Enum.Material.Neon
            DancingOrb.Color = Color3.fromHSV(((i - 80) / 40), 0.7, 0.9)
            DancingOrb.Transparency = 0.2
            DancingOrb.Anchored = true
            DancingOrb.CanCollide = false
            local angle = ((i - 80) / 40) * math.pi * 2
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
                        math.cos(t) * (6 - j * 0.14),
                        5 + math.sin(t * 2.5) * 2,
                        math.sin(t) * (6 - j * 0.14)
                    )
                    DancingOrb.Transparency = 0.2 + (j / 40) * 0.8
                    task.wait(0.02)
                end
                DancingOrb:Destroy()
            end)
            
        else
            -- エネルギー渦
            local EnergyVortex = Instance.new("Part")
            EnergyVortex.Size = Vector3.new(0.5, 0.5, 0.5)
            EnergyVortex.Shape = Enum.PartType.Ball
            EnergyVortex.Material = Enum.Material.Neon
            EnergyVortex.Color = Color3.fromHSV(((i - 120) / 30), 0.6, 0.85)
            EnergyVortex.Transparency = 0.3
            EnergyVortex.Anchored = true
            EnergyVortex.CanCollide = false
            local angle = ((i - 120) / 30) * math.pi * 5
            EnergyVortex.Position = HumanoidRootPart.Position + Vector3.new(
                math.cos(angle) * 10,
                3,
                math.sin(angle) * 10
            )
            EnergyVortex.Parent = workspace
            
            task.spawn(function()
                for j = 1, 30 do
                    angle = angle + math.rad(10)
                    EnergyVortex.Position = HumanoidRootPart.Position + Vector3.new(
                        math.cos(angle) * (10 - j * 0.3),
                        3 - j * 0.08,
                        math.sin(angle) * (10 - j * 0.3)
                    )
                    EnergyVortex.Transparency = 0.3 + (j / 30) * 0.7
                    task.wait(0.02)
                end
                EnergyVortex:Destroy()
            end)
        end
        
        task.wait(0.025)
    end
    
    -- 【651-750】翼フェードアウト演出（100種類）
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
            Feather.Size = Vector3.new(0.4, 0.1, 0.7)
            Feather.Material = Enum.Material.Neon
            Feather.Color = Color3.fromRGB(200, 200, 210)
            Feather.Transparency = 0.2
            Feather.Anchored = true
            Feather.CanCollide = false
            
            local wingChoice = (i % 6 < 3) and LeftWingMain or RightWingMain
            Feather.Position = wingChoice.Position + Vector3.new(
                math.random(-3, 3),
                math.random(-2, 2),
                math.random(-3, 3)
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
    
    -- 【751-850】フィナーレ螺旋エフェクト（100種類）
    for i = 1, 100 do
        local camAngle = (i / 100) * math.pi * 1.8
        Camera.CFrame = CFrame.new(
            HumanoidRootPart.Position + Vector3.new(
                math.cos(camAngle) * 12,
                8 - (i / 100) * 3,
                math.sin(camAngle) * 12
            ),
            HumanoidRootPart.Position
        )
        
        local SpiralLight = Instance.new("Part")
        SpiralLight.Size = Vector3.new(0.5, 0.5, 0.5)
        SpiralLight.Shape = Enum.PartType.Ball
        SpiralLight.Material = Enum.Material.Neon
        SpiralLight.Color = Color3.fromHSV((i / 100), 0.9, 0.85)
        SpiralLight.Transparency = 0.3
        SpiralLight.Anchored = true
        SpiralLight.CanCollide = false
        local spiralAngle = (i / 100) * math.pi * 6
        SpiralLight.Position = HumanoidRootPart.Position + Vector3.new(
            math.cos(spiralAngle) * 8,
            10 - i * 0.14,
            math.sin(spiralAngle) * 8
        )
        SpiralLight.Parent = workspace
        
        task.delay(1.2, function() SpiralLight:Destroy() end)
        
        task.wait(0.02)
    end
    
    -- 【851-900】最終大爆発演出（50種類） + 剣の具現化（50種類）
    Camera.CFrame = CFrame.new(HumanoidRootPart.Position + Vector3.new(0, 7, 16), HumanoidRootPart.Position)
    
    -- 大爆発パート
    for i = 1, 50 do
        local FinalBurst = Instance.new("Part")
        FinalBurst.Size = Vector3.new(i * 0.8, i * 0.8, i * 0.8)
        FinalBurst.Shape = Enum.PartType.Ball
        FinalBurst.Material = Enum.Material.Neon
        FinalBurst.Color = Color3.fromHSV((i / 50), 0.6, 0.9)
        FinalBurst.Transparency = 0.3 + (i / 50) * 0.6
        FinalBurst.Anchored = true
        FinalBurst.CanCollide = false
        FinalBurst.Position = HumanoidRootPart.Position
        FinalBurst.Parent = workspace
        
        task.delay(0.7, function() FinalBurst:Destroy() end)
        
        task.wait(0.03)
    end
    
    -- 剣の具現化パート
    local SwordFormationPos = HumanoidRootPart.Position + Vector3.new(0, 3, 0)
    
    for i = 1, 50 do
        -- 剣のシルエット形成
        local SwordFragment = Instance.new("Part")
        SwordFragment.Size = Vector3.new(0.3, 2 + i * 0.08, 0.3)
        SwordFragment.Material = Enum.Material.Neon
        SwordFragment.Color = Color3.fromRGB(0, 0, 0)
        SwordFragment.Transparency = 0.8 - (i / 50) * 0.6
        SwordFragment.Anchored = true
        SwordFragment.CanCollide = false
        local angle = (i / 50) * math.pi * 2
        SwordFragment.Position = SwordFormationPos + Vector3.new(
            math.cos(angle) * (3 - i * 0.05),
            0,
            math.sin(angle) * (3 - i * 0.05)
        )
        SwordFragment.Orientation = Vector3.new(0, math.deg(angle), 0)
        SwordFragment.Parent = workspace
        
        task.spawn(function()
            for j = 1, 20 do
                SwordFragment.Position = SwordFragment.Position + Vector3.new(
                    -math.cos(angle) * 0.12,
                    0.1,
                    -math.sin(angle) * 0.12
                )
                task.wait(0.02)
            end
            SwordFragment:Destroy()
        end)
        
        task.wait(0.025)
    end
    
    -- 最終エフェクト音
    local FinalSound = Instance.new("Sound")
    FinalSound.SoundId = "rbxassetid://9125402735"
    FinalSound.Volume = 0.8
    FinalSound.Parent = HumanoidRootPart
    FinalSound:Play()
    
    task.wait(1.2)
    
    -- プレイヤーを元の位置に戻す
    HumanoidRootPart.CFrame = OriginalPosition
    
    -- カメラを戻す
    Camera.CameraType = OriginalCameraType
    Camera.CameraSubject = OriginalCameraSubject
    
    -- クリーンアップ
    task.wait(2.5)
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
        Content = "1500種類の超本格演出終了",
        Duration = 3,
        Image = 4483362458,
    })
end

-- ========== 剣生成関数（前回と同じ） ========== --
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
   Name = "⚔️ 影刃を召喚する（1500演出版）",
   Callback = function()
        PlayUltimate1500Cutscene(game.Players.LocalPlayer)
        wait(25)
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
CinemaTab:CreateLabel("🎬 究極1500演出の内容")
CinemaTab:CreateLabel("合計: 1500種類のアニメーション")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("🏛️ 本格3D背景（600種類）:")
CinemaTab:CreateLabel("• リアルな森（15本の木構造）")
CinemaTab:CreateLabel("• 水晶クラスター（12個）")
CinemaTab:CreateLabel("• 古代遺跡の柱（12本）")
CinemaTab:CreateLabel("• 複雑な魔法陣（20個）")
CinemaTab:CreateLabel("• 浮遊岩石群（20個）")
CinemaTab:CreateLabel("• 古代の像（6体）")
CinemaTab:CreateLabel("• 魔法の門（4つ）")
CinemaTab:CreateLabel("• エネルギー結界ドーム")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("⚔️ プレイヤー演出（900種類）:")
CinemaTab:CreateLabel("• 翼展開 x30")
CinemaTab:CreateLabel("• 降臨準備 x50")
CinemaTab:CreateLabel("• 階段降下（各35種）x420")
CinemaTab:CreateLabel("• 着地大演出 x150")
CinemaTab:CreateLabel("• 翼フェード x100")
CinemaTab:CreateLabel("• フィナーレ螺旋 x100")
CinemaTab:CreateLabel("• 最終爆発 + 剣具現化 x100")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("✨ 全て本格的な3D構造")
CinemaTab:CreateLabel("✨ カメラ位置最適化済み")

local TestButton = CinemaTab:CreateButton({
   Name = "🎬 演出のみをテスト再生",
   Callback = function()
        PlayUltimate1500Cutscene(game.Players.LocalPlayer)
   end,
})

Rayfield:Notify({
   Title = "🌟 影刃 ULTIMATE 1500",
   Content = "超本格1500アニメーション！",
   Duration = 5,
   Image = 4483362458,
})
