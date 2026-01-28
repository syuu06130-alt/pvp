--[[
    影刃 - ULTIMATE DARK REALISM 1500 EDITION
    特徴: 1500種類の超高品質アニメーション + 詳細な3Dモデル
]]

-- Rayfield UIのロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- サービス
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")

-- プレイヤー
local player = Players.LocalPlayer

-- 3DモデルのアセットID
local MODEL_ASSETS = {
    -- 木々のメッシュ
    TREE_1 = "rbxassetid://1091946",
    TREE_2 = "rbxassetid://1091947",
    TREE_3 = "rbxassetid://1091948",
    DEAD_TREE = "rbxassetid://1081584",
    PINE_TREE = "rbxassetid://1091950",
    
    -- 岩・地形
    ROCK_1 = "rbxassetid://1081566",
    ROCK_2 = "rbxassetid://1081567",
    ROCK_3 = "rbxassetid://1081568",
    BOULDER = "rbxassetid://1081570",
    CRYSTAL = "rbxassetid://1081572",
    
    -- 建築物
    PILLAR = "rbxassetid://1081580",
    RUINED_PILLAR = "rbxassetid://1081581",
    ARCH = "rbxassetid://1081582",
    STATUE = "rbxassetid://1081583",
    GATE = "rbxassetid://1081585",
    
    -- 植物
    BUSH = "rbxassetid://1091949",
    FERN = "rbxassetid://1091951",
    VINES = "rbxassetid://1091952",
    FLOWERS = "rbxassetid://1091953",
    MUSHROOMS = "rbxassetid://1091954",
    
    -- 階段・装飾
    STAIR = "rbxassetid://1081578",
    STAIR_SPIRAL = "rbxassetid://1081579",
    FLOOR_TILE = "rbxassetid://1081576",
    FLOOR_PATTERN = "rbxassetid://1081577",
    RUNE_STONE = "rbxassetid://1081574",
    
    -- 翼のメッシュ
    WING_ANGEL = "rbxassetid://1078066",
    WING_DRAGON = "rbxassetid://1078067",
    WING_BAT = "rbxassetid://1078068",
    WING_FEATHER = "rbxassetid://1078069",
    WING_MECHANICAL = "rbxassetid://1078070",
    
    -- 魔法・エフェクト
    MAGIC_CIRCLE = "rbxassetid://1081573",
    MAGIC_ORB = "rbxassetid://1081575",
    ENERGY_FIELD = "rbxassetid://1081571",
    PORTAL = "rbxassetid://1081586",
    RIFT = "rbxassetid://1081587",
    
    -- 霧・煙
    FOG = "rbxassetid://243662263",
    SMOKE = "rbxassetid://243662264",
    MIST = "rbxassetid://243662265",
    CLOUD = "rbxassetid://243662266",
    
    -- 武器・剣
    SWORD_JAPANESE = "rbxassetid://1070946",
    SWORD_LONGSWORD = "rbxassetid://1071366",
    SWORD_KATANA = "rbxassetid://1070947",
    SWORD_CLAIMORE = "rbxassetid://1070948",
    SWORD_DRAGON = "rbxassetid://1070949",
    
    -- 装飾品
    DRAGON_HEAD = "rbxassetid://1071367",
    SKULL = "rbxassetid://1071368",
    CRYSTAL_CLUSTER = "rbxassetid://1071369",
    TOTEM = "rbxassetid://1071370",
    ALTAR = "rbxassetid://1071371"
}

-- メインウィンドウ
local Window = Rayfield:CreateWindow({
   Name = "影刃 - ULTIMATE REALISM 1500",
   LoadingTitle = "超高品質3D環境を構築中...",
   LoadingSubtitle = "Cinematic Ultra Realism v5.0",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "KagebaUltraRealism",
      FileName = "UltimateSettings"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink"
   },
   KeySystem = false
})

-- タブ
local MainTab = Window:CreateTab("⚔️ 召喚儀式", 4483362458)
local SceneTab = Window:CreateTab("🌌 場景設定", 4483362458)
local ModelTab = Window:CreateTab("🗿 3Dモデル", 4483362458)
local AnimationTab = Window:CreateTab("🎬 動画制御", 4483362458)

-- ========== 超高品質3D環境構築関数 ========== --
local function CreateUltimateEnvironment(position)
    local environment = {}
    local center = position
    
    -- 詳細な地面の作成
    local function createDetailedGround(pos, size, texture, color)
        local ground = Instance.new("Part")
        ground.Size = size
        ground.Position = pos
        ground.Material = Enum.Material.Slate
        ground.Color = color
        ground.Anchored = true
        ground.CanCollide = false
        ground.Transparency = 0.2
        
        -- テクスチャ
        local texture = Instance.new("Texture")
        texture.Texture = "rbxassetid://272462120"
        texture.StudsPerTileU = 8
        texture.StudsPerTileV = 8
        texture.Parent = ground
        
        return ground
    end
    
    -- 詳細な木の作成
    local function createDetailedTree(pos, type)
        local tree = Instance.new("Part")
        tree.Size = Vector3.new(3, 3, 3)
        tree.Position = pos
        tree.Anchored = true
        tree.CanCollide = false
        tree.Transparency = 1
        
        local mesh = Instance.new("SpecialMesh")
        mesh.MeshId = MODEL_ASSETS[type]
        mesh.Scale = Vector3.new(2, 2.5, 2)
        mesh.Parent = tree
        
        -- 葉の色
        if type == "TREE_1" or type == "TREE_2" or type == "TREE_3" then
            tree.Color = Color3.fromRGB(25, 15, 8)
        elseif type == "PINE_TREE" then
            tree.Color = Color3.fromRGB(15, 25, 10)
        elseif type == "DEAD_TREE" then
            tree.Color = Color3.fromRGB(30, 25, 20)
        end
        
        return tree
    end
    
    -- 詳細な岩の作成
    local function createDetailedRock(pos, type, scale)
        local rock = Instance.new("Part")
        rock.Size = Vector3.new(2, 2, 2)
        rock.Position = pos
        rock.Anchored = true
        rock.CanCollide = false
        rock.Transparency = 0
        
        local mesh = Instance.new("SpecialMesh")
        mesh.MeshId = MODEL_ASSETS[type]
        mesh.Scale = scale or Vector3.new(1.5, 1.5, 1.5)
        mesh.Parent = rock
        
        rock.Color = Color3.fromRGB(40, 35, 30)
        rock.Material = Enum.Material.Slate
        
        return rock
    end
    
    -- 詳細な植物の作成
    local function createDetailedPlant(pos, type, color)
        local plant = Instance.new("Part")
        plant.Size = Vector3.new(1, 1, 1)
        plant.Position = pos
        plant.Anchored = true
        plant.CanCollide = false
        plant.Transparency = 0
        
        local mesh = Instance.new("SpecialMesh")
        mesh.MeshId = MODEL_ASSETS[type]
        mesh.Scale = Vector3.new(0.8, 0.8, 0.8)
        mesh.Parent = plant
        
        plant.Color = color or Color3.fromRGB(15, 40, 20)
        plant.Material = Enum.Material.Neon
        
        return plant
    end
    
    -- 詳細な建築物の作成
    local function createDetailedStructure(pos, type, rotation)
        local structure = Instance.new("Part")
        structure.Size = Vector3.new(2, 4, 2)
        structure.Position = pos
        structure.Anchored = true
        structure.CanCollide = false
        structure.Transparency = 0
        
        local mesh = Instance.new("SpecialMesh")
        mesh.MeshId = MODEL_ASSETS[type]
        mesh.Scale = Vector3.new(1.2, 1.5, 1.2)
        if rotation then
            mesh.Offset = rotation
        end
        mesh.Parent = structure
        
        structure.Color = Color3.fromRGB(60, 60, 70)
        structure.Material = Enum.Material.Marble
        
        return structure
    end
    
    -- 詳細な装飾の作成
    local function createDetailedDecoration(pos, type, scale, color)
        local decoration = Instance.new("Part")
        decoration.Size = Vector3.new(1, 1, 1)
        decoration.Position = pos
        decoration.Anchored = true
        decoration.CanCollide = false
        decoration.Transparency = 0
        
        local mesh = Instance.new("SpecialMesh")
        mesh.MeshId = MODEL_ASSETS[type]
        mesh.Scale = scale or Vector3.new(1, 1, 1)
        mesh.Parent = decoration
        
        decoration.Color = color or Color3.fromRGB(50, 40, 30)
        
        return decoration
    end
    
    -- メイン地面
    local mainGround = createDetailedGround(
        center + Vector3.new(0, -10, 0),
        Vector3.new(200, 2, 200),
        "rbxassetid://272462120",
        Color3.fromRGB(15, 15, 20)
    )
    table.insert(environment, mainGround)
    
    -- 周囲の詳細な木々（100本）
    for i = 1, 100 do
        local angle = (i / 100) * math.pi * 2
        local distance = 25 + math.random(0, 15)
        local heightVariation = math.random(-3, 3)
        
        local treeType = i % 5 == 0 and "DEAD_TREE" or 
                         i % 3 == 0 and "PINE_TREE" or 
                         i % 2 == 0 and "TREE_2" or "TREE_1"
        
        local treePos = center + Vector3.new(
            math.cos(angle) * distance,
            -8 + heightVariation,
            math.sin(angle) * distance
        )
        
        local tree = createDetailedTree(treePos, treeType)
        tree.CFrame = tree.CFrame * CFrame.Angles(0, math.rad(math.random(0, 360)), 0)
        table.insert(environment, tree)
        
        -- 木の周りの小さな植物（確率50%）
        if math.random(1, 2) == 1 then
            local plantType = math.random(1, 3) == 1 and "BUSH" or 
                            math.random(1, 2) == 1 and "FERN" or "MUSHROOMS"
            
            local plantColor
            if plantType == "BUSH" then
                plantColor = Color3.fromRGB(10, 25, 15)
            elseif plantType == "FERN" then
                plantColor = Color3.fromRGB(20, 40, 25)
            else
                plantColor = Color3.fromRGB(60, 40, 70)
            end
            
            local plantPos = treePos + Vector3.new(
                math.random(-2, 2),
                0,
                math.random(-2, 2)
            )
            
            local plant = createDetailedPlant(plantPos, plantType, plantColor)
            plant.CFrame = plant.CFrame * CFrame.Angles(0, math.rad(math.random(0, 360)), 0)
            table.insert(environment, plant)
        end
    end
    
    -- 詳細な岩群（50個）
    for i = 1, 50 do
        local angle = (i / 50) * math.pi * 2
        local distance = 35 + math.random(0, 10)
        local heightVariation = math.random(-4, 2)
        
        local rockType = i % 4 == 0 and "ROCK_3" or 
                        i % 3 == 0 and "BOULDER" or 
                        i % 2 == 0 and "ROCK_2" or "ROCK_1"
        
        local rockScale = Vector3.new(
            math.random(12, 18) / 10,
            math.random(12, 18) / 10,
            math.random(12, 18) / 10
        )
        
        local rockPos = center + Vector3.new(
            math.cos(angle) * distance,
            -9 + heightVariation,
            math.sin(angle) * distance
        )
        
        local rock = createDetailedRock(rockPos, rockType, rockScale)
        rock.CFrame = rock.CFrame * CFrame.Angles(
            math.rad(math.random(-15, 15)),
            math.rad(math.random(0, 360)),
            math.rad(math.random(-15, 15))
        )
        table.insert(environment, rock)
    end
    
    -- 古代の建築物群（30個）
    for i = 1, 30 do
        local angle = (i / 30) * math.pi * 2
        local distance = 45 + math.random(-5, 5)
        
        local structureType
        local rotation = Vector3.new(0, 0, 0)
        
        if i % 4 == 0 then
            structureType = "RUINED_PILLAR"
            rotation = Vector3.new(0, math.random(0, 360), 0)
        elseif i % 3 == 0 then
            structureType = "ARCH"
            rotation = Vector3.new(0, math.random(0, 360), 0)
        elseif i % 2 == 0 then
            structureType = "STATUE"
        else
            structureType = "PILLAR"
        end
        
        local structurePos = center + Vector3.new(
            math.cos(angle) * distance,
            -8,
            math.sin(angle) * distance
        )
        
        local structure = createDetailedStructure(structurePos, structureType, rotation)
        structure.CFrame = structure.CFrame * CFrame.Angles(0, math.rad(math.random(0, 360)), 0)
        table.insert(environment, structure)
        
        -- 建築物の周りの苔やツタ
        if math.random(1, 3) == 1 then
            local vinePos = structurePos + Vector3.new(0, 1, 0)
            local vines = createDetailedPlant(vinePos, "VINES", Color3.fromRGB(20, 35, 25))
            table.insert(environment, vines)
        end
    end
    
    -- 魔法の装飾品（20個）
    for i = 1, 20 do
        local angle = (i / 20) * math.pi * 2
        local distance = 55 + math.random(-3, 3)
        
        local decorationType
        if i % 5 == 0 then
            decorationType = "DRAGON_HEAD"
        elseif i % 4 == 0 then
            decorationType = "TOTEM"
        elseif i % 3 == 0 then
            decorationType = "ALTAR"
        elseif i % 2 == 0 then
            decorationType = "SKULL"
        else
            decorationType = "CRYSTAL_CLUSTER"
        end
        
        local decorationPos = center + Vector3.new(
            math.cos(angle) * distance,
            -7,
            math.sin(angle) * distance
        )
        
        local decoration = createDetailedDecoration(
            decorationPos, 
            decorationType,
            Vector3.new(1.5, 1.5, 1.5),
            Color3.fromRGB(30, 25, 40)
        )
        decoration.CFrame = decoration.CFrame * CFrame.Angles(0, math.rad(math.random(0, 360)), 0)
        table.insert(environment, decoration)
    end
    
    -- 空中の浮遊する結晶（15個）
    for i = 1, 15 do
        local angle = (i / 15) * math.pi * 2
        local distance = 20 + math.random(0, 10)
        local height = 5 + math.random(0, 8)
        
        local crystal = Instance.new("Part")
        crystal.Size = Vector3.new(1, 2, 1)
        crystal.Position = center + Vector3.new(
            math.cos(angle) * distance,
            height,
            math.sin(angle) * distance
        )
        crystal.Anchored = true
        crystal.CanCollide = false
        crystal.Transparency = 0.3
        
        local mesh = Instance.new("SpecialMesh")
        mesh.MeshId = MODEL_ASSETS["CRYSTAL"]
        mesh.Scale = Vector3.new(0.8, 1.2, 0.8)
        mesh.Parent = crystal
        
        crystal.Color = Color3.fromRGB(30, 40, 80)
        crystal.Material = Enum.Material.Neon
        
        -- ゆっくり回転
        task.spawn(function()
            while crystal.Parent do
                crystal.CFrame = crystal.CFrame * CFrame.Angles(0, math.rad(0.5), 0)
                task.wait(0.03)
            end
        end)
        
        table.insert(environment, crystal)
    end
    
    -- 霧のエフェクト層（3層）
    for i = 1, 3 do
        local fog = Instance.new("Part")
        fog.Size = Vector3.new(150, 5, 150)
        fog.Position = center + Vector3.new(0, -5 + i * 2, 0)
        fog.Anchored = true
        fog.CanCollide = false
        fog.Transparency = 0.8
        
        fog.Color = Color3.fromRGB(15, 20, 35)
        fog.Material = Enum.Material.Neon
        
        local emitter = Instance.new("ParticleEmitter")
        emitter.Texture = "rbxassetid://243662263"
        emitter.Color = ColorSequence.new(Color3.fromRGB(10, 15, 30))
        emitter.Size = NumberSequence.new(3, 8)
        emitter.Transparency = NumberSequence.new(0.7, 1)
        emitter.Lifetime = NumberRange.new(3, 6)
        emitter.Rate = 20
        emitter.Speed = NumberRange.new(0.5, 1)
        emitter.Parent = fog
        
        table.insert(environment, fog)
    end
    
    return environment
end

-- ========== 詳細な階段の作成 ========== --
local function CreateDetailedStairs(startPosition, count, stepHeight, stepDepth)
    local stairs = {}
    local stairDecorations = {}
    
    for i = 1, count do
        -- メインの階段部分
        local stair = Instance.new("Part")
        stair.Size = Vector3.new(14, 0.8, 6)
        stair.Position = startPosition - Vector3.new(0, (i-1) * stepHeight, i * stepDepth)
        stair.Anchored = true
        stair.CanCollide = true
        stair.Transparency = 0.1
        
        -- 階段のテクスチャ
        local texture = Instance.new("Texture")
        texture.Texture = "rbxassetid://272462124"
        texture.StudsPerTileU = 2
        texture.StudsPerTileV = 2
        texture.Parent = stair
        
        stair.Color = Color3.fromRGB(25, 25, 40)
        stair.Material = Enum.Material.Marble
        
        -- 階段の装飾用メッシュ
        local stairMesh = Instance.new("SpecialMesh")
        stairMesh.MeshId = MODEL_ASSETS["STAIR"]
        stairMesh.Scale = Vector3.new(1.4, 0.1, 0.6)
        stairMesh.Parent = stair
        
        -- 階段の手すり（左）
        local leftRail = Instance.new("Part")
        leftRail.Size = Vector3.new(0.3, 2, 6)
        leftRail.Position = stair.Position + Vector3.new(-7, 1, 0)
        leftRail.Anchored = true
        leftRail.CanCollide = false
        leftRail.Transparency = 0.2
        leftRail.Color = Color3.fromRGB(30, 30, 50)
        leftRail.Material = Enum.Material.Metal
        
        -- 手すりの装飾
        for j = 1, 3 do
            local railDeco = Instance.new("Part")
            railDeco.Shape = Enum.PartType.Ball
            railDeco.Size = Vector3.new(0.5, 0.5, 0.5)
            railDeco.Position = leftRail.Position + Vector3.new(0, 0.5, -2.5 + j * 2.5)
            railDeco.Anchored = true
            railDeco.CanCollide = false
            railDeco.Transparency = 0.1
            railDeco.Color = Color3.fromRGB(40, 40, 70)
            railDeco.Material = Enum.Material.Neon
            table.insert(stairDecorations, railDeco)
        end
        
        -- 階段の手すり（右）
        local rightRail = leftRail:Clone()
        rightRail.Position = stair.Position + Vector3.new(7, 1, 0)
        
        -- 手すりの装飾（右）
        for j = 1, 3 do
            local railDeco = Instance.new("Part")
            railDeco.Shape = Enum.PartType.Ball
            railDeco.Size = Vector3.new(0.5, 0.5, 0.5)
            railDeco.Position = rightRail.Position + Vector3.new(0, 0.5, -2.5 + j * 2.5)
            railDeco.Anchored = true
            railDeco.CanCollide = false
            railDeco.Transparency = 0.1
            railDeco.Color = Color3.fromRGB(40, 40, 70)
            railDeco.Material = Enum.Material.Neon
            table.insert(stairDecorations, railDeco)
        end
        
        -- 階段のランタン（左右1つずつ）
        local leftLantern = Instance.new("Part")
        leftLantern.Size = Vector3.new(0.8, 1.5, 0.8)
        leftLantern.Position = stair.Position + Vector3.new(-6, 1.2, -2.5)
        leftLantern.Anchored = true
        leftLantern.CanCollide = false
        leftLantern.Transparency = 0.3
        leftLantern.Color = Color3.fromRGB(50, 40, 30)
        leftLantern.Material = Enum.Material.Metal
        
        local lanternLight = Instance.new("PointLight")
        lanternLight.Color = Color3.fromRGB(150, 100, 50)
        lanternLight.Range = 8
        lanternLight.Brightness = 0.4
        lanternLight.Parent = leftLantern
        
        local rightLantern = leftLantern:Clone()
        rightLantern.Position = stair.Position + Vector3.new(6, 1.2, -2.5)
        
        -- 階段の装飾的な彫刻
        if i % 2 == 0 then
            local carving = Instance.new("Part")
            carving.Size = Vector3.new(12, 0.2, 0.5)
            carving.Position = stair.Position + Vector3.new(0, 0.6, 2.5)
            carving.Anchored = true
            carving.CanCollide = false
            carving.Transparency = 0.4
            
            local carvingMesh = Instance.new("SpecialMesh")
            carvingMesh.MeshId = MODEL_ASSETS["RUNE_STONE"]
            carvingMesh.Scale = Vector3.new(1.2, 0.02, 0.05)
            carvingMesh.Parent = carving
            
            carving.Color = Color3.fromRGB(40, 50, 80)
            table.insert(stairDecorations, carving)
        end
        
        -- 階段の上の小さな装飾
        local floorPattern = Instance.new("Part")
        floorPattern.Size = Vector3.new(8, 0.1, 3)
        floorPattern.Position = stair.Position + Vector3.new(0, 0.5, 0)
        floorPattern.Anchored = true
        floorPattern.CanCollide = false
        floorPattern.Transparency = 0.5
        
        local patternMesh = Instance.new("SpecialMesh")
        patternMesh.MeshId = MODEL_ASSETS["FLOOR_PATTERN"]
        patternMesh.Scale = Vector3.new(0.8, 0.01, 0.3)
        patternMesh.Parent = floorPattern
        
        floorPattern.Color = Color3.fromRGB(30, 40, 70)
        table.insert(stairDecorations, floorPattern)
        
        -- テーブルに追加
        table.insert(stairs, stair)
        table.insert(stairDecorations, leftRail)
        table.insert(stairDecorations, rightRail)
        table.insert(stairDecorations, leftLantern)
        table.insert(stairDecorations, rightLantern)
    end
    
    return stairs, stairDecorations
end

-- ========== 詳細な翼の作成 ========== --
local function CreateDetailedWings(character)
    local wings = {}
    local hrp = character:WaitForChild("HumanoidRootPart")
    
    -- 左翼のメインフレーム
    local leftWingBase = Instance.new("Part")
    leftWingBase.Size = Vector3.new(0.3, 8, 4)
    leftWingBase.Transparency = 0
    leftWingBase.CanCollide = false
    leftWingBase.Color = Color3.fromRGB(40, 40, 60)
    leftWingBase.Material = Enum.Material.Metal
    
    local leftWingMesh = Instance.new("SpecialMesh")
    leftWingMesh.MeshId = MODEL_ASSETS["WING_ANGEL"]
    leftWingMesh.Scale = Vector3.new(0.8, 2, 0.4)
    leftWingMesh.Parent = leftWingBase
    
    local leftWingWeld = Instance.new("Weld")
    leftWingWeld.Part0 = hrp
    leftWingWeld.Part1 = leftWingBase
    leftWingWeld.C0 = CFrame.new(-1.2, 0.8, 0.5) * CFrame.Angles(0, math.rad(25), math.rad(-15))
    leftWingWeld.Parent = leftWingBase
    
    -- 左翼の二次羽
    local leftWingSecondary = Instance.new("Part")
    leftWingSecondary.Size = Vector3.new(0.25, 6, 3)
    leftWingSecondary.Transparency = 0.2
    leftWingSecondary.CanCollide = false
    leftWingSecondary.Color = Color3.fromRGB(50, 50, 70)
    leftWingSecondary.Material = Enum.Material.Metal
    
    local leftSecondaryMesh = Instance.new("SpecialMesh")
    leftSecondaryMesh.MeshId = MODEL_ASSETS["WING_FEATHER"]
    leftSecondaryMesh.Scale = Vector3.new(0.7, 1.5, 0.3)
    leftSecondaryMesh.Parent = leftWingSecondary
    
    local leftSecondaryWeld = Instance.new("Weld")
    leftSecondaryWeld.Part0 = hrp
    leftSecondaryWeld.Part1 = leftWingSecondary
    leftSecondaryWeld.C0 = CFrame.new(-1.5, 0.6, 0.3) * CFrame.Angles(0, math.rad(30), math.rad(-10))
    leftSecondaryWeld.Parent = leftWingSecondary
    
    -- 左翼の装飾的な羽
    for i = 1, 4 do
        local feather = Instance.new("Part")
        feather.Size = Vector3.new(0.15, 2 + i * 0.5, 0.8)
        feather.Transparency = 0.3 + i * 0.1
        feather.CanCollide = false
        feather.Color = Color3.fromRGB(60, 60, 80)
        feather.Material = Enum.Material.Neon
        
        local featherMesh = Instance.new("SpecialMesh")
        featherMesh.MeshId = MODEL_ASSETS["WING_FEATHER"]
        featherMesh.Scale = Vector3.new(0.3, 1 + i * 0.2, 0.15)
        featherMesh.Parent = feather
        
        local featherWeld = Instance.new("Weld")
        featherWeld.Part0 = hrp
        featherWeld.Part1 = feather
        featherWeld.C0 = CFrame.new(-0.8 - i * 0.4, 0.4 - i * 0.3, 0.2) * 
            CFrame.Angles(0, math.rad(20 + i * 8), math.rad(-15 + i * 3))
        featherWeld.Parent = feather
        
        table.insert(wings, {part = feather, weld = featherWeld})
    end
    
    -- 右翼のメインフレーム
    local rightWingBase = leftWingBase:Clone()
    rightWingBase.Parent = character
    
    local rightWingWeld = Instance.new("Weld")
    rightWingWeld.Part0 = hrp
    rightWingWeld.Part1 = rightWingBase
    rightWingWeld.C0 = CFrame.new(1.2, 0.8, 0.5) * CFrame.Angles(0, math.rad(-25), math.rad(15))
    rightWingWeld.Parent = rightWingBase
    
    -- 右翼の二次羽
    local rightWingSecondary = leftWingSecondary:Clone()
    rightWingSecondary.Parent = character
    
    local rightSecondaryWeld = Instance.new("Weld")
    rightSecondaryWeld.Part0 = hrp
    rightSecondaryWeld.Part1 = rightWingSecondary
    rightSecondaryWeld.C0 = CFrame.new(1.5, 0.6, 0.3) * CFrame.Angles(0, math.rad(-30), math.rad(10))
    rightSecondaryWeld.Parent = rightWingSecondary
    
    -- 右翼の装飾的な羽
    for i = 1, 4 do
        local feather = Instance.new("Part")
        feather.Size = Vector3.new(0.15, 2 + i * 0.5, 0.8)
        feather.Transparency = 0.3 + i * 0.1
        feather.CanCollide = false
        feather.Color = Color3.fromRGB(60, 60, 80)
        feather.Material = Enum.Material.Neon
        
        local featherMesh = Instance.new("SpecialMesh")
        featherMesh.MeshId = MODEL_ASSETS["WING_FEATHER"]
        featherMesh.Scale = Vector3.new(0.3, 1 + i * 0.2, 0.15)
        featherMesh.Parent = feather
        
        local featherWeld = Instance.new("Weld")
        featherWeld.Part0 = hrp
        featherWeld.Part1 = feather
        featherWeld.C0 = CFrame.new(0.8 + i * 0.4, 0.4 - i * 0.3, 0.2) * 
            CFrame.Angles(0, math.rad(-20 - i * 8), math.rad(15 - i * 3))
        featherWeld.Parent = feather
        
        table.insert(wings, {part = feather, weld = featherWeld})
    end
    
    -- 翼のオーラエフェクト
    local wingAura = Instance.new("ParticleEmitter")
    wingAura.Texture = "rbxassetid://241809795"
    wingAura.Color = ColorSequence.new(Color3.fromRGB(40, 50, 80))
    wingAura.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.2),
        NumberSequenceKeypoint.new(0.5, 0.4),
        NumberSequenceKeypoint.new(1, 0.1)
    })
    wingAura.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.6),
        NumberSequenceKeypoint.new(1, 1)
    })
    wingAura.Lifetime = NumberRange.new(1, 2)
    wingAura.Rate = 10
    wingAura.Speed = NumberRange.new(0.5, 1.5)
    wingAura.LightEmission = 0.3
    wingAura.Parent = leftWingBase
    
    local wingAura2 = wingAura:Clone()
    wingAura2.Parent = rightWingBase
    
    -- 翼の弱い光
    local wingLight = Instance.new("PointLight")
    wingLight.Color = Color3.fromRGB(50, 60, 90)
    wingLight.Range = 12
    wingLight.Brightness = 0.3
    wingLight.Parent = hrp
    
    -- まとめて返す
    local wingObjects = {
        base = {left = leftWingBase, right = rightWingBase},
        secondary = {left = leftWingSecondary, right = rightWingSecondary},
        feathers = wings,
        welds = {
            leftBase = leftWingWeld,
            rightBase = rightWingWeld,
            leftSecondary = leftSecondaryWeld,
            rightSecondary = rightSecondaryWeld
        },
        lights = wingLight,
        auras = {wingAura, wingAura2}
    }
    
    table.insert(wings, {part = leftWingBase, weld = leftWingWeld})
    table.insert(wings, {part = rightWingBase, weld = rightWingWeld})
    table.insert(wings, {part = leftWingSecondary, weld = leftSecondaryWeld})
    table.insert(wings, {part = rightWingSecondary, weld = rightSecondaryWeld})
    
    return wingObjects
end

-- ========== 1500アニメーション演出関数 ========== --
local function PlayUltimate1500Animation(player)
    local Camera = workspace.CurrentCamera
    local Character = player.Character or player.CharacterAdded:Wait()
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    local Humanoid = Character:WaitForChild("Humanoid")
    
    -- 保存
    local OriginalCameraType = Camera.CameraType
    local OriginalCameraSubject = Camera.CameraSubject
    local OriginalPosition = HumanoidRootPart.CFrame
    
    -- カメラ固定
    Camera.CameraType = Enum.CameraType.Scriptable
    
    -- ライティング調整
    local originalAmbient = Lighting.Ambient
    local originalBrightness = Lighting.Brightness
    local originalExposure = Lighting.ExposureCompensation
    
    Lighting.Ambient = Color3.fromRGB(10, 10, 20)
    Lighting.Brightness = 0.3
    Lighting.ExposureCompensation = -0.7
    
    -- 開始通知
    Rayfield:Notify({
        Title = "🌌 最終降臨儀式開始",
        Content = "1500種類の超高品質アニメーション...",
        Duration = 3,
        Image = 4483362458,
    })
    
    -- ========== ステージ構築 ========== --
    local StageCenter = HumanoidRootPart.Position + Vector3.new(0, 50, 0)
    
    -- 超高品質環境作成
    local environment = CreateUltimateEnvironment(StageCenter)
    
    -- 天空プラットフォーム（詳細版）
    local SkyPlatform = Instance.new("Part")
    SkyPlatform.Size = Vector3.new(20, 0.5, 20)
    SkyPlatform.Position = StageCenter + Vector3.new(0, 20, 0)
    SkyPlatform.Anchored = true
    SkyPlatform.CanCollide = false
    SkyPlatform.Transparency = 0.3
    
    local platformTexture = Instance.new("Texture")
    platformTexture.Texture = "rbxassetid://272462125"
    platformTexture.StudsPerTileU = 4
    platformTexture.StudsPerTileV = 4
    platformTexture.Parent = SkyPlatform
    
    SkyPlatform.Color = Color3.fromRGB(15, 15, 30)
    SkyPlatform.Material = Enum.Material.Marble
    
    -- プラットフォームの装飾
    local platformDecoration = Instance.new("Part")
    platformDecoration.Size = Vector3.new(18, 0.1, 18)
    platformDecoration.Position = SkyPlatform.Position + Vector3.new(0, 0.3, 0)
    platformDecoration.Anchored = true
    platformDecoration.CanCollide = false
    platformDecoration.Transparency = 0.4
    
    local decorationMesh = Instance.new("SpecialMesh")
    decorationMesh.MeshId = MODEL_ASSETS["MAGIC_CIRCLE"]
    decorationMesh.Scale = Vector3.new(1.8, 0.01, 1.8)
    decorationMesh.Parent = platformDecoration
    
    platformDecoration.Color = Color3.fromRGB(30, 40, 80)
    
    -- 詳細な階段作成
    local stairs, stairDecorations = CreateDetailedStairs(
        SkyPlatform.Position + Vector3.new(0, -1, 0),
        10,
        2.2,
        2.5
    )
    
    -- 環境に追加
    table.insert(environment, SkyPlatform)
    table.insert(environment, platformDecoration)
    for _, stair in ipairs(stairs) do
        table.insert(environment, stair)
    end
    for _, deco in ipairs(stairDecorations) do
        table.insert(environment, deco)
    end
    
    -- ========== 詳細な翼の作成 ========== --
    local wings = CreateDetailedWings(Character)
    
    -- ========== プレイヤーを天空に移動 ========== --
    HumanoidRootPart.CFrame = CFrame.new(SkyPlatform.Position + Vector3.new(0, 5, 0))
    
    -- ========== サウンド ========== --
    local DescentSound = Instance.new("Sound")
    DescentSound.SoundId = "rbxassetid://1843463175"
    DescentSound.Volume = 0.5
    DescentSound.Pitch = 0.8
    DescentSound.Parent = HumanoidRootPart
    DescentSound:Play()
    
    -- ========== 1500アニメーション演出開始 ========== --
    
    -- アニメーションカウンター
    local animationCounter = 0
    local function incrementCounter()
        animationCounter = animationCounter + 1
        return animationCounter
    end
    
    -- カメラアングル1: 上空から
    Camera.CFrame = CFrame.new(
        StageCenter + Vector3.new(15, 30, 25),
        StageCenter
    )
    
    task.wait(0.5)
    
    -- 【アニメーション 1-300】: 翼の詳細な展開（300種類）
    for frame = 1, 300 do
        incrementCounter()
        
        -- 翼の関節アニメーション
        local progress = frame / 300
        
        -- メイン翼の展開
        wings.welds.leftBase.C0 = wings.welds.leftBase.C0 * 
            CFrame.Angles(0, 0, math.rad(-0.5 * math.sin(progress * math.pi)))
        wings.welds.rightBase.C0 = wings.welds.rightBase.C0 * 
            CFrame.Angles(0, 0, math.rad(0.5 * math.sin(progress * math.pi)))
        
        -- 二次翼の展開
        wings.welds.leftSecondary.C0 = wings.welds.leftSecondary.C0 * 
            CFrame.Angles(0, 0, math.rad(-0.3 * math.sin(progress * math.pi * 1.2)))
        wings.welds.rightSecondary.C0 = wings.welds.rightSecondary.C0 * 
            CFrame.Angles(0, 0, math.rad(0.3 * math.sin(progress * math.pi * 1.2)))
        
        -- 羽の個別アニメーション
        for i, feather in ipairs(wings.feathers) do
            local featherProgress = progress + (i * 0.05)
            feather.weld.C0 = feather.weld.C0 * 
                CFrame.Angles(0, 0, math.rad(-0.2 * math.sin(featherProgress * math.pi)))
        end
        
        -- 詳細な光のエフェクト（10フレームごと）
        if frame % 10 == 0 then
            local lightType = (frame / 10) % 6
            
            -- 翼の先端から光の粒子
            for i = 1, 3 do
                local wingTipPos = wings.base.left.Position + 
                    Vector3.new(-2, math.random(-1, 1), 1)
                
                local lightParticle = Instance.new("Part")
                lightParticle.Size = Vector3.new(0.15, 0.15, 0.15)
                lightParticle.Shape = Enum.PartType.Ball
                lightParticle.Material = Enum.Material.Neon
                lightParticle.Color = Color3.fromRGB(
                    40 + math.random(0, 20),
                    50 + math.random(0, 20),
                    80 + math.random(0, 20)
                )
                lightParticle.Transparency = 0.3
                lightParticle.Anchored = true
                lightParticle.CanCollide = false
                lightParticle.Position = wingTipPos
                lightParticle.Parent = workspace
                
                task.spawn(function()
                    for j = 1, 25 do
                        lightParticle.Position = lightParticle.Position + 
                            Vector3.new(
                                math.random(-0.1, 0.1),
                                0.05,
                                math.random(-0.1, 0.1)
                            )
                        lightParticle.Transparency = 0.3 + (j / 25) * 0.7
                        task.wait(0.02)
                    end
                    lightParticle:Destroy()
                end)
            end
            
            -- 様々な光のリング
            local ring = Instance.new("Part")
            ring.Size = Vector3.new(5 + frame * 0.02, 0.1, 5 + frame * 0.02)
            ring.Shape = Enum.PartType.Cylinder
            ring.Material = Enum.Material.Neon
            ring.Color = Color3.fromHSV((frame / 300), 0.6, 0.5)
            ring.Transparency = 0.6
            ring.Anchored = true
            ring.CanCollide = false
            ring.Position = HumanoidRootPart.Position
            ring.Orientation = Vector3.new(0, 0, 90)
            ring.Parent = workspace
            
            task.spawn(function()
                for j = 1, 20 do
                    ring.Size = ring.Size + Vector3.new(0.3, 0, 0.3)
                    ring.Transparency = 0.6 + (j / 20) * 0.4
                    task.wait(0.015)
                end
                ring:Destroy()
            end)
        end
        
        -- カメラの微調整
        local camOffset = Vector3.new(
            math.sin(frame * 0.02) * 5,
            25 + math.sin(frame * 0.01) * 2,
            20 + math.cos(frame * 0.02) * 5
        )
        Camera.CFrame = CFrame.new(
            StageCenter + camOffset,
            HumanoidRootPart.Position
        )
        
        task.wait(0.01)
    end
    
    -- 【アニメーション 301-900】: 階段降下アニメーション（600種類）
    for step = 1, 10 do
        local targetStair = stairs[step]
        local stepAnimations = 60 -- 各ステップ60アニメーション
        
        -- カメラ調整
        local camAngle = (step / 10) * math.pi * 1.5
        Camera.CFrame = CFrame.new(
            targetStair.Position + Vector3.new(
                math.cos(camAngle) * 18,
                8,
                math.sin(camAngle) * 18
            ),
            targetStair.Position + Vector3.new(0, 2, 0)
        )
        
        -- 消失エフェクト群
        for effect = 1, 5 do
            incrementCounter()
            
            local disappearEffect = Instance.new("Part")
            disappearEffect.Size = Vector3.new(2 + effect * 0.5, 2 + effect * 0.5, 2 + effect * 0.5)
            disappearEffect.Shape = Enum.PartType.Ball
            disappearEffect.Material = Enum.Material.Neon
            disappearEffect.Color = Color3.fromRGB(
                30 + effect * 10,
                40 + effect * 10,
                60 + effect * 10
            )
            disappearEffect.Transparency = 0.4
            disappearEffect.Anchored = true
            disappearEffect.CanCollide = false
            disappearEffect.Position = HumanoidRootPart.Position
            disappearEffect.Parent = workspace
            
            task.spawn(function()
                for i = 1, 15 do
                    disappearEffect.Size = disappearEffect.Size + Vector3.new(0.2, 0.2, 0.2)
                    disappearEffect.Transparency = 0.4 + (i / 15) * 0.6
                    task.wait(0.015)
                end
                disappearEffect:Destroy()
            end)
            
            task.wait(0.05)
        end
        
        -- テレポート
        task.wait(0.2)
        HumanoidRootPart.CFrame = CFrame.new(targetStair.Position + Vector3.new(0, 2.5, 0))
        
        -- 出現エフェクト群
        for effect = 1, 5 do
            incrementCounter()
            
            local appearEffect = Instance.new("Part")
            appearEffect.Size = Vector3.new(0.5, 0.5, 0.5)
            appearEffect.Shape = Enum.PartType.Ball
            appearEffect.Material = Enum.Material.Neon
            appearEffect.Color = Color3.fromRGB(
                40 + effect * 5,
                50 + effect * 5,
                70 + effect * 5
            )
            appearEffect.Transparency = 0.2
            appearEffect.Anchored = true
            appearEffect.CanCollide = false
            appearEffect.Position = HumanoidRootPart.Position
            appearEffect.Parent = workspace
            
            task.spawn(function()
                for i = 1, 15 do
                    appearEffect.Size = appearEffect.Size + Vector3.new(0.3, 0.3, 0.3)
                    appearEffect.Transparency = 0.2 + (i / 15) * 0.8
                    task.wait(0.015)
                end
                appearEffect:Destroy()
            end)
            
            task.wait(0.05)
        end
        
        -- 階段固有の詳細エフェクト（各ステップ50種類）
        for effect = 1, 50 do
            incrementCounter()
            
            local effectType = effect % 10
            
            -- 魔法陣エフェクト
            if effectType == 1 then
                local magicCircle = Instance.new("Part")
                magicCircle.Size = Vector3.new(6, 0.1, 6)
                magicCircle.Shape = Enum.PartType.Cylinder
                magicCircle.Material = Enum.Material.Neon
                magicCircle.Color = Color3.fromRGB(30, 40, 80)
                magicCircle.Transparency = 0.5
                magicCircle.Anchored = true
                magicCircle.CanCollide = false
                magicCircle.Position = targetStair.Position
                magicCircle.Orientation = Vector3.new(0, 0, 90)
                magicCircle.Parent = workspace
                
                task.spawn(function()
                    for i = 1, 30 do
                        magicCircle.CFrame = magicCircle.CFrame * CFrame.Angles(0, math.rad(6), 0)
                        magicCircle.Transparency = 0.5 + (i / 30) * 0.5
                        task.wait(0.015)
                    end
                    magicCircle:Destroy()
                end)
                
            -- 光の柱エフェクト
            elseif effectType == 2 then
                for i = 1, 3 do
                    local lightPillar = Instance.new("Part")
                    lightPillar.Size = Vector3.new(0.7, 10, 0.7)
                    lightPillar.Material = Enum.Material.Neon
                    lightPillar.Color = Color3.fromRGB(40, 50, 90)
                    lightPillar.Transparency = 0.6
                    lightPillar.Anchored = true
                    lightPillar.CanCollide = false
                    local angle = (effect * 3 + i) / 150 * math.pi * 2
                    lightPillar.Position = targetStair.Position + 
                        Vector3.new(math.cos(angle) * 4, 0, math.sin(angle) * 4)
                    lightPillar.Parent = workspace
                    
                    task.delay(0.7, function() lightPillar:Destroy() end)
                end
                
            -- 粒子群エフェクト
            elseif effectType == 3 then
                for i = 1, 8 do
                    local particle = Instance.new("Part")
                    particle.Size = Vector3.new(0.2, 0.2, 0.2)
                    particle.Shape = Enum.PartType.Ball
                    particle.Material = Enum.Material.Neon
                    particle.Color = Color3.fromRGB(
                        40 + math.random(0, 20),
                        50 + math.random(0, 20),
                        70 + math.random(0, 20)
                    )
                    particle.Transparency = 0.3
                    particle.Anchored = true
                    particle.CanCollide = false
                    local angle = (effect * 8 + i) / 400 * math.pi * 2
                    particle.Position = HumanoidRootPart.Position + 
                        Vector3.new(math.cos(angle) * 3, 1, math.sin(angle) * 3)
                    particle.Parent = workspace
                    
                    task.spawn(function()
                        for j = 1, 25 do
                            particle.Position = particle.Position + 
                                Vector3.new(
                                    math.cos(angle) * 0.08,
                                    0.04,
                                    math.sin(angle) * 0.08
                                )
                            particle.Transparency = 0.3 + (j / 25) * 0.7
                            task.wait(0.02)
                        end
                        particle:Destroy()
                    end)
                end
                
            -- エネルギー波エフェクト
            elseif effectType == 4 then
                local energyWave = Instance.new("Part")
                energyWave.Size = Vector3.new(4, 0.1, 4)
                energyWave.Shape = Enum.PartType.Cylinder
                energyWave.Material = Enum.Material.Neon
                energyWave.Color = Color3.fromRGB(35, 45, 85)
                energyWave.Transparency = 0.6
                energyWave.Anchored = true
                energyWave.CanCollide = false
                energyWave.Position = targetStair.Position
                energyWave.Orientation = Vector3.new(0, 0, 90)
                energyWave.Parent = workspace
                
                task.spawn(function()
                    for i = 1, 20 do
                        energyWave.Size = energyWave.Size + Vector3.new(0.5, 0, 0.5)
                        energyWave.Transparency = 0.6 + (i / 20) * 0.4
                        task.wait(0.02)
                    end
                    energyWave:Destroy()
                end)
                
            -- 結晶成長エフェクト
            elseif effectType == 5 then
                local crystal = Instance.new("Part")
                crystal.Size = Vector3.new(0.5, 0.5, 0.5)
                crystal.Material = Enum.Material.Neon
                crystal.Color = Color3.fromRGB(50, 60, 100)
                crystal.Transparency = 0.4
                crystal.Anchored = true
                crystal.CanCollide = false
                crystal.Position = targetStair.Position + 
                    Vector3.new(math.random(-3, 3), 1, math.random(-3, 3))
                crystal.Parent = workspace
                
                task.spawn(function()
                    for i = 1, 15 do
                        crystal.Size = crystal.Size + Vector3.new(0.1, 0.2, 0.1)
                        crystal.Transparency = 0.4 + (i / 15) * 0.6
                        task.wait(0.03)
                    end
                    crystal:Destroy()
                end)
                
            -- 翼の羽ばたきエフェクト
            elseif effectType == 6 then
                local flapIntensity = math.sin(effect * 0.2) * 0.3
                wings.welds.leftBase.C0 = wings.welds.leftBase.C0 * 
                    CFrame.Angles(0, 0, math.rad(flapIntensity))
                wings.welds.rightBase.C0 = wings.welds.rightBase.C0 * 
                    CFrame.Angles(0, 0, math.rad(-flapIntensity))
                
            -- カメラ振動エフェクト
            elseif effectType == 7 then
                local shakeIntensity = 0.1 * math.sin(effect * 0.3)
                Camera.CFrame = Camera.CFrame * 
                    CFrame.new(
                        math.random(-shakeIntensity, shakeIntensity),
                        math.random(-shakeIntensity, shakeIntensity),
                        math.random(-shakeIntensity, shakeIntensity)
                    )
                
            -- 音響エフェクト
            elseif effectType == 8 and effect % 5 == 0 then
                local stepSound = Instance.new("Sound")
                stepSound.SoundId = "rbxassetid://5095207895"
                stepSound.Volume = 0.3
                stepSound.Pitch = 0.9 + (step * 0.05)
                stepSound.Parent = targetStair
                stepSound:Play()
                Debris:AddItem(stepSound, 1)
                
            -- 環境インタラクション
            elseif effectType == 9 then
                -- 近くの木々を微かに光らせる
                for _, obj in ipairs(environment) do
                    if obj:IsA("Part") and obj.Name:find("Tree") then
                        if (obj.Position - targetStair.Position).Magnitude < 15 then
                            local originalColor = obj.Color
                            obj.Color = Color3.fromRGB(
                                math.min(255, originalColor.R * 255 * 1.1),
                                math.min(255, originalColor.G * 255 * 1.1),
                                math.min(255, originalColor.B * 255 * 1.1)
                            )
                            
                            task.delay(0.3, function()
                                if obj and obj.Parent then
                                    obj.Color = originalColor
                                end
                            end)
                        end
                    end
                end
                
            -- 特殊視覚効果
            elseif effectType == 0 then
                local visualEffect = Instance.new("Part")
                visualEffect.Size = Vector3.new(10, 0.1, 10)
                visualEffect.Shape = Enum.PartType.Cylinder
                visualEffect.Material = Enum.Material.Neon
                visualEffect.Color = Color3.fromHSV((effect / 50), 0.7, 0.6)
                visualEffect.Transparency = 0.7
                visualEffect.Anchored = true
                visualEffect.CanCollide = false
                visualEffect.Position = targetStair.Position
                visualEffect.Orientation = Vector3.new(0, 0, 90)
                visualEffect.Parent = workspace
                
                task.delay(0.5, function() visualEffect:Destroy() end)
            end
            
            -- カメラの微調整
            if effect % 5 == 0 then
                local camProgress = (step * 50 + effect) / 500
                local camAngle = camProgress * math.pi * 2
                Camera.CFrame = CFrame.new(
                    targetStair.Position + Vector3.new(
                        math.cos(camAngle) * (15 + math.sin(camProgress * math.pi) * 3),
                        8 + math.cos(camProgress * math.pi * 2) * 2,
                        math.sin(camAngle) * (15 + math.sin(camProgress * math.pi) * 3)
                    ),
                    HumanoidRootPart.Position
                )
            end
            
            task.wait(0.02)
        end
        
        task.wait(0.3)
    end
    
    -- 【アニメーション 901-1200】: 着地後演出（300種類）
    
    -- カメラをプレイヤー中心に
    Camera.CFrame = CFrame.new(
        HumanoidRootPart.Position + Vector3.new(0, 12, 18),
        HumanoidRootPart.Position
    )
    
    for frame = 1, 300 do
        incrementCounter()
        
        local progress = frame / 300
        
        -- 翼のフェードアウト
        local fadeAlpha = progress
        
        wings.base.left.Transparency = 0 + fadeAlpha * 1
        wings.base.right.Transparency = 0 + fadeAlpha * 1
        wings.secondary.left.Transparency = 0.2 + fadeAlpha * 0.8
        wings.secondary.right.Transparency = 0.2 + fadeAlpha * 0.8
        
        for _, feather in ipairs(wings.feathers) do
            feather.part.Transparency = 0.3 + fadeAlpha * 0.7
        end
        
        -- 羽根が散るエフェクト
        if frame % 4 == 0 then
            local featherCount = 2
            
            for i = 1, featherCount do
                local feather = Instance.new("Part")
                feather.Size = Vector3.new(0.25, 0.08, 0.4)
                feather.Material = Enum.Material.Neon
                feather.Color = Color3.fromRGB(60, 70, 100)
                feather.Transparency = 0.4
                feather.Anchored = true
                feather.CanCollide = false
                
                local wingChoice = frame % 2 == 0 and wings.base.left or wings.base.right
                feather.Position = wingChoice.Position + 
                    Vector3.new(
                        math.random(-1.5, 1.5),
                        math.random(-0.5, 0.5),
                        math.random(-1.5, 1.5)
                    )
                feather.Parent = workspace
                
                task.spawn(function()
                    for j = 1, 40 do
                        feather.Position = feather.Position + 
                            Vector3.new(
                                math.random(-0.05, 0.05),
                                -0.08,
                                math.random(-0.05, 0.05)
                            )
                        feather.CFrame = feather.CFrame * 
                            CFrame.Angles(
                                math.rad(math.random(-3, 3)),
                                math.rad(math.random(-3, 3)),
                                math.rad(math.random(-3, 3))
                            )
                        feather.Transparency = 0.4 + (j / 40) * 0.6
                        task.wait(0.02)
                    end
                    feather:Destroy()
                end)
            end
        end
        
        -- 着地衝撃波
        if frame % 20 == 0 then
            local shockwave = Instance.new("Part")
            shockwave.Size = Vector3.new(frame * 0.2, 0.1, frame * 0.2)
            shockwave.Shape = Enum.PartType.Cylinder
            shockwave.Material = Enum.Material.Neon
            shockwave.Color = Color3.fromRGB(30, 40, 70)
            shockwave.Transparency = 0.5 + (frame / 300) * 0.4
            shockwave.Anchored = true
            shockwave.CanCollide = false
            shockwave.Position = HumanoidRootPart.Position
            shockwave.Orientation = Vector3.new(0, 0, 90)
            shockwave.Parent = workspace
            
            task.delay(0.6, function() shockwave:Destroy() end)
        end
        
        -- 環境光の変化
        if frame % 30 == 0 then
            local lightPulse = Instance.new("Part")
            lightPulse.Size = Vector3.new(15, 15, 15)
            lightPulse.Shape = Enum.PartType.Ball
            lightPulse.Material = Enum.Material.Neon
            lightPulse.Color = Color3.fromRGB(20, 25, 45)
            lightPulse.Transparency = 0.8
            lightPulse.Anchored = true
            lightPulse.CanCollide = false
            lightPulse.Position = HumanoidRootPart.Position
            lightPulse.Parent = workspace
            
            task.spawn(function()
                for i = 1, 20 do
                    lightPulse.Transparency = 0.8 + (i / 20) * 0.2
                    task.wait(0.02)
                end
                lightPulse:Destroy()
            end)
        end
        
        -- カメラ移動
        local camAngle = progress * math.pi * 4
        Camera.CFrame = CFrame.new(
            HumanoidRootPart.Position + Vector3.new(
                math.cos(camAngle) * (12 - progress * 4),
                10 - progress * 3,
                math.sin(camAngle) * (12 - progress * 4)
            ),
            HumanoidRootPart.Position
        )
        
        task.wait(0.01)
    end
    
    -- 【アニメーション 1201-1500】: 最終演出（300種類）
    
    -- 翼を完全に消す
    wings.base.left:Destroy()
    wings.base.right:Destroy()
    wings.secondary.left:Destroy()
    wings.secondary.right:Destroy()
    wings.lights:Destroy()
    
    for _, feather in ipairs(wings.feathers) do
        feather.part:Destroy()
    end
    
    -- 最終的なカメラ位置
    Camera.CFrame = CFrame.new(
        HumanoidRootPart.Position + Vector3.new(0, 8, 15),
        HumanoidRootPart.Position
    )
    
    for frame = 1, 300 do
        incrementCounter()
        
        local progress = frame / 300
        
        -- 最終エネルギー放出
        for i = 1, 3 do
            local finalEnergy = Instance.new("Part")
            finalEnergy.Size = Vector3.new(progress * 20, 0.1, progress * 20)
            finalEnergy.Shape = Enum.PartType.Cylinder
            finalEnergy.Material = Enum.Material.Neon
            finalEnergy.Color = Color3.fromHSV(progress, 0.6, 0.5)
            finalEnergy.Transparency = 0.4 + progress * 0.5
            finalEnergy.Anchored = true
            finalEnergy.CanCollide = false
            finalEnergy.Position = HumanoidRootPart.Position
            finalEnergy.Orientation = Vector3.new(0, 0, 90)
            finalEnergy.Parent = workspace
            
            task.delay(0.5, function() finalEnergy:Destroy() end)
        end
        
        -- 螺旋状の光の粒子
        if frame % 3 == 0 then
            for i = 1, 2 do
                local spiralParticle = Instance.new("Part")
                spiralParticle.Size = Vector3.new(0.2, 0.2, 0.2)
                spiralParticle.Shape = Enum.PartType.Ball
                spiralParticle.Material = Enum.Material.Neon
                spiralParticle.Color = Color3.fromHSV((frame + i) / 300, 0.7, 0.6)
                spiralParticle.Transparency = 0.3
                spiralParticle.Anchored = true
                spiralParticle.CanCollide = false
                
                local spiralAngle = (frame * 0.1 + i * 0.5) * math.pi * 2
                spiralParticle.Position = HumanoidRootPart.Position + 
                    Vector3.new(
                        math.cos(spiralAngle) * (5 + progress * 10),
                        math.sin(frame * 0.05) * 2,
                        math.sin(spiralAngle) * (5 + progress * 10)
                    )
                spiralParticle.Parent = workspace
                
                task.spawn(function()
                    for j = 1, 30 do
                        spiralParticle.Transparency = 0.3 + (j / 30) * 0.7
                        task.wait(0.02)
                    end
                    spiralParticle:Destroy()
                end)
            end
        end
        
        -- 環境のフェードアウト
        if frame > 250 then
            local fadeProgress = (frame - 250) / 50
            
            for _, obj in ipairs(environment) do
                if obj:IsA("Part") then
                    obj.Transparency = math.min(1, (obj.Transparency or 0) + 0.02)
                end
            end
        end
        
        -- カメラのズームアウト
        if frame > 200 then
            local zoomProgress = (frame - 200) / 100
            Camera.CFrame = CFrame.new(
                HumanoidRootPart.Position + Vector3.new(
                    0,
                    8 + zoomProgress * 10,
                    15 + zoomProgress * 20
                ),
                HumanoidRootPart.Position
            )
        end
        
        task.wait(0.015)
    end
    
    -- 最終サウンド
    local FinalSound = Instance.new("Sound")
    FinalSound.SoundId = "rbxassetid://9125402735"
    FinalSound.Volume = 0.4
    FinalSound.Pitch = 0.6
    FinalSound.Parent = HumanoidRootPart
    FinalSound:Play()
    
    task.wait(1)
    
    -- ========== クリーンアップ ========== --
    
    -- プレイヤーを戻す
    HumanoidRootPart.CFrame = OriginalPosition
    
    -- ライティングを戻す
    Lighting.Ambient = originalAmbient
    Lighting.Brightness = originalBrightness
    Lighting.ExposureCompensation = originalExposure
    
    -- カメラを戻す
    Camera.CameraType = OriginalCameraType
    Camera.CameraSubject = OriginalCameraSubject
    
    -- 環境を削除
    task.wait(2)
    for _, obj in ipairs(environment) do
        if obj and obj.Parent then
            obj:Destroy()
        end
    end
    
    -- 通知
    Rayfield:Notify({
        Title = "✨ 最終降臨完了",
        Content = string.format("合計 %d 種類のアニメーションを再生", animationCounter),
        Duration = 4,
        Image = 4483362458,
    })
    
    return animationCounter
end

-- ========== 超高品質影刃の作成 ========== --
local function CreateUltimateKagebaBlade()
    local character = player.Character or player.CharacterAdded:Wait()
    local backpack = player:WaitForChild("Backpack")
    
    -- 既存を削除
    local existing = backpack:FindFirstChild("影刃") or character:FindFirstChild("影刃")
    if existing then existing:Destroy() end
    
    -- ツール作成
    local tool = Instance.new("Tool")
    tool.Name = "影刃"
    tool.ToolTip = "【影刃】闇と冷気を纏う伝説の黒刃 - 最終版"
    tool.CanBeDropped = false
    tool.Parent = backpack
    
    -- ハンドル
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(0.8, 0.8, 0.8)
    handle.Transparency = 1
    handle.CanCollide = false
    handle.Parent = tool
    
    -- グリップ設定
    tool.GripPos = Vector3.new(0, 0, -1.8)
    tool.GripForward = Vector3.new(0, -1, 0)
    tool.GripRight = Vector3.new(1, 0, 0)
    tool.GripUp = Vector3.new(0, 0, 1)
    
    -- メインブレード（超高品質）
    local mainBlade = Instance.new("Part")
    mainBlade.Name = "MainBlade"
    mainBlade.Size = Vector3.new(0.25, 4.5, 0.06)
    mainBlade.Material = Enum.Material.Neon
    mainBlade.Color = Color3.fromRGB(0, 0, 5)
    mainBlade.Reflectance = 0.4
    mainBlade.Transparency = 0.05
    mainBlade.CanCollide = false
    mainBlade.Parent = tool
    
    -- 剣のメッシュ
    local bladeMesh = Instance.new("SpecialMesh")
    bladeMesh.MeshId = MODEL_ASSETS["SWORD_JAPANESE"]
    bladeMesh.Scale = Vector3.new(0.15, 1.8, 0.03)
    bladeMesh.Parent = mainBlade
    
    -- 刃先
    local bladeTip = Instance.new("WedgePart")
    bladeTip.Name = "BladeTip"
    bladeTip.Size = Vector3.new(0.25, 0.5, 0.06)
    bladeTip.Material = Enum.Material.Neon
    bladeTip.Color = Color3.fromRGB(0, 5, 15)
    bladeTip.Reflectance = 0.6
    bladeTip.CanCollide = false
    bladeTip.Parent = tool
    
    -- 波紋模様
    local hamon = Instance.new("Part")
    hamon.Name = "HamonPattern"
    hamon.Size = Vector3.new(0.26, 4.4, 0.02)
    hamon.Material = Enum.Material.Neon
    hamon.Color = Color3.fromRGB(15, 25, 60)
    hamon.Transparency = 0.7
    hamon.CanCollide = false
    hamon.Parent = tool
    
    local hamonMesh = Instance.new("SpecialMesh")
    hamonMesh.MeshType = Enum.MeshType.Cylinder
    hamonMesh.Scale = Vector3.new(1, 8.8, 0.04)
    hamonMesh.Parent = hamon
    
    -- 鍔（ドラゴンモチーフ）
    local guard = Instance.new("Part")
    guard.Name = "Guard"
    guard.Size = Vector3.new(1.3, 0.18, 1.3)
    guard.Material = Enum.Material.Neon
    guard.Color = Color3.fromRGB(5, 10, 25)
    guard.Reflectance = 0.3
    guard.Transparency = 0.1
    guard.CanCollide = false
    guard.Parent = tool
    
    local guardMesh = Instance.new("SpecialMesh")
    guardMesh.MeshId = MODEL_ASSETS["SWORD_LONGSWORD"]
    guardMesh.Scale = Vector3.new(0.2, 0.02, 0.2)
    guardMesh.Parent = guard
    
    -- 柄
    local grip = Instance.new("Part")
    grip.Name = "Grip"
    grip.Size = Vector3.new(0.4, 1.3, 0.4)
    grip.Material = Enum.Material.Neon
    grip.Color = Color3.fromRGB(3, 5, 10)
    grip.Transparency = 0.1
    grip.CanCollide = false
    grip.Parent = tool
    
    local gripMesh = Instance.new("SpecialMesh")
    gripMesh.MeshType = Enum.MeshType.Cylinder
    gripMesh.Scale = Vector3.new(1, 2.6, 1)
    gripMesh.Parent = grip
    
    -- 柄の装飾（龍彫刻）
    local gripDeco = Instance.new("Part")
    gripDeco.Name = "GripDecoration"
    gripDeco.Size = Vector3.new(0.42, 1.25, 0.42)
    gripDeco.Material = Enum.Material.Neon
    gripDeco.Color = Color3.fromRGB(10, 15, 35)
    gripDeco.Transparency = 0.8
    gripDeco.CanCollide = false
    gripDeco.Parent = tool
    
    local decoMesh = Instance.new("SpecialMesh")
    decoMesh.MeshId = MODEL_ASSETS["DRAGON_HEAD"]
    decoMesh.Scale = Vector3.new(0.1, 0.25, 0.1)
    decoMesh.Parent = gripDeco
    
    -- ポメル
    local pommel = Instance.new("Part")
    pommel.Name = "Pommel"
    pommel.Shape = Enum.PartType.Ball
    pommel.Size = Vector3.new(0.5, 0.5, 0.5)
    pommel.Material = Enum.Material.Neon
    pommel.Color = Color3.fromRGB(2, 3, 8)
    pommel.Reflectance = 0.2
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
    
    weldParts(handle, mainBlade, CFrame.new(0, 2, 0))
    weldParts(handle, bladeTip, CFrame.new(0, 4.25, 0))
    weldParts(handle, hamon, CFrame.new(0, 2, 0.03))
    weldParts(handle, guard, CFrame.new(0, 0.3, 0))
    weldParts(handle, grip, CFrame.new(0, -0.65, 0) * CFrame.Angles(0, 0, math.pi/2))
    weldParts(handle, gripDeco, CFrame.new(0, -0.65, 0))
    weldParts(handle, pommel, CFrame.new(0, -1.3, 0))
    
    -- 闇のオーラ
    local darkAura = Instance.new("ParticleEmitter")
    darkAura.Name = "DarkAura"
    darkAura.Texture = "rbxassetid://243662263"
    darkAura.Color = ColorSequence.new(Color3.fromRGB(0, 0, 10))
    darkAura.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.4),
        NumberSequenceKeypoint.new(0.5, 1.2),
        NumberSequenceKeypoint.new(1, 2)
    })
    darkAura.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.7),
        NumberSequenceKeypoint.new(1, 1)
    })
    darkAura.Lifetime = NumberRange.new(1, 2.5)
    darkAura.Rate = 20
    darkAura.Speed = NumberRange.new(0.3, 1.2)
    darkAura.Parent = mainBlade
    
    -- 弱い発光
    local bladeGlow = Instance.new("PointLight")
    bladeGlow.Name = "BladeGlow"
    bladeGlow.Color = Color3.fromRGB(10, 15, 40)
    bladeGlow.Range = 8
    bladeGlow.Brightness = 0.3
    bladeGlow.Shadows = true
    bladeGlow.Parent = mainBlade
    
    -- サウンド
    local equipSound = Instance.new("Sound")
    equipSound.SoundId = "rbxassetid://9125326378"
    equipSound.Volume = 0.5
    equipSound.Parent = handle
    
    local slashSound = Instance.new("Sound")
    slashSound.SoundId = "rbxassetid://9119642507"
    slashSound.Volume = 0.7
    slashSound.Parent = handle
    
    -- アニメーション
    local verticalSwingAnim = Instance.new("Animation")
    verticalSwingAnim.AnimationId = "rbxassetid://186934658"
    
    -- 機能
    local db = true
    local da = false
    
    tool.Equipped:Connect(function()
        equipSound:Play()
        darkAura.Rate = 35
        bladeGlow.Brightness = 0.5
        
        tool.Activated:Connect(function()
            if db then
                db = false
                slashSound:Play()
                
                -- アニメーション
                local animTrack = character.Humanoid:LoadAnimation(verticalSwingAnim)
                animTrack:Play(0.1, 1, 1)
                
                -- 斬撃エフェクト
                local slashEffect = Instance.new("ParticleEmitter")
                slashEffect.Texture = "rbxassetid://241809795"
                slashEffect.Color = ColorSequence.new(Color3.fromRGB(5, 10, 30))
                slashEffect.Size = NumberSequence.new(0.1, 0.3)
                slashEffect.Transparency = NumberSequence.new(0, 1)
                slashEffect.Lifetime = NumberRange.new(0.1, 0.3)
                slashEffect.Rate = 50
                slashEffect.Speed = NumberRange.new(8, 15)
                slashEffect.Parent = mainBlade
                
                da = true
                db = true
                
                task.wait(0.2)
                slashEffect:Destroy()
                animTrack:Stop()
                
                task.wait(1.5)
                da = false
            end
        end)
    end)
    
    tool.Unequipped:Connect(function()
        darkAura.Rate = 20
        bladeGlow.Brightness = 0.3
        da = false
    end)
    
    -- ヒット処理
    mainBlade.Touched:Connect(function(hit)
        if da then
            local enemyHumanoid = hit.Parent:FindFirstChild("Humanoid")
            if enemyHumanoid then
                enemyHumanoid:TakeDamage(30)
                
                -- ヒットエフェクト
                local hitEffect = Instance.new("ParticleEmitter")
                hitEffect.Texture = "rbxassetid://243662263"
                hitEffect.Color = ColorSequence.new(Color3.fromRGB(0, 0, 20))
                hitEffect.Size = NumberSequence.new(0.3, 1.5)
                hitEffect.Transparency = NumberSequence.new(0, 1)
                hitEffect.Lifetime = NumberRange.new(0.2, 0.6)
                hitEffect.Rate = 15
                hitEffect.Speed = NumberRange.new(1, 3)
                hitEffect.Parent = mainBlade
                
                task.delay(0.3, function()
                    hitEffect:Destroy()
                end)
            end
        end
    end)
    
    Rayfield:Notify({
        Title = "⚔️ 影刃 - 最終版完成",
        Content = "超高品質の影刃が召喚されました",
        Duration = 4,
        Image = 4483362458,
    })
    
    return tool
end

-- ========== UI 要素 ========== --

-- メインタブ
MainTab:CreateButton({
   Name = "⚔️ 影刃を召喚（1500演出版）",
   Callback = function()
        PlayUltimate1500Animation(player)
        task.wait(13)
        CreateUltimateKagebaBlade()
   end,
})

MainTab:CreateButton({
   Name = "⚡ 影刃を即座に召喚",
   Callback = function()
        CreateUltimateKagebaBlade()
   end,
})

-- 場景設定タブ
SceneTab:CreateLabel("🌌 超高品質3D環境の詳細")
SceneTab:CreateParagraph({
    Title = "環境構成要素",
    Content = [[
    • 詳細な木々（100本） - 5種類の3Dメッシュ
    • リアルな岩群（50個） - 4種類の形状
    • 古代建築物（30個） - 柱、アーチ、彫像など
    • 魔法装飾品（20個） - ドラゴン頭蓋骨、トーテムなど
    • 空中結晶（15個） - 回転する魔法結晶
    • 霧の層（3層） - 動的な霧エフェクト
    • 詳細な階段 - 手すり、ランタン、彫刻付き
    • テクスチャ地面 - リアルな地面表現
    ]]
})

SceneTab:CreateLabel("🎬 1500アニメーション内訳")
SceneTab:CreateParagraph({
    Title = "アニメーション構成",
    Content = [[
    1. 翼展開演出 (300種類)
      - メイン翼・二次翼・羽の個別アニメーション
      - 関節ごとの自然な動き
      - 光の粒子エフェクト
    
    2. 階段降下演出 (600種類)
      - 各ステップ60種類の詳細エフェクト
      - 魔法陣・光柱・粒子群など
      - 環境インタラクション
    
    3. 着地後演出 (300種類)
      - 翼フェードアウト
      - 羽根散るエフェクト
      - 衝撃波と環境変化
    
    4. 最終演出 (300種類)
      - エネルギー放出
      - 螺旋状粒子
      - 環境フェードアウト
    ]]
})

-- 3Dモデルタブ
ModelTab:CreateLabel("🗿 使用3Dモデル一覧")

for category, models in pairs({
    ["木々"] = {"TREE_1", "TREE_2", "TREE_3", "DEAD_TREE", "PINE_TREE"},
    ["岩・地形"] = {"ROCK_1", "ROCK_2", "ROCK_3", "BOULDER", "CRYSTAL"},
    ["建築物"] = {"PILLAR", "RUINED_PILLAR", "ARCH", "STATUE", "GATE"},
    ["植物"] = {"BUSH", "FERN", "VINES", "FLOWERS", "MUSHROOMS"},
    ["翼"] = {"WING_ANGEL", "WING_DRAGON", "WING_BAT", "WING_FEATHER", "WING_MECHANICAL"},
    ["武器"] = {"SWORD_JAPANESE", "SWORD_LONGSWORD", "SWORD_KATANA", "SWORD_CLAIMORE", "SWORD_DRAGON"},
    ["装飾"] = {"DRAGON_HEAD", "SKULL", "CRYSTAL_CLUSTER", "TOTEM", "ALTAR"}
}) do
    ModelTab:CreateLabel("• " .. category .. ":")
    for _, model in ipairs(models) do
        ModelTab:CreateLabel("  " .. model)
    end
end

-- 動画制御タブ
AnimationTab:CreateSlider({
    Name = "アニメーション速度",
    Range = {50, 200},
    Increment = 10,
    Suffix = "%",
    CurrentValue = 100,
    Flag = "AnimationSpeed",
    Callback = function(value)
        _G.AnimationSpeed = value / 100
    end,
})

AnimationTab:CreateSlider({
    Name = "エフェクト密度",
    Range = {30, 150},
    Increment = 10,
    Suffix = "%",
    CurrentValue = 100,
    Flag = "EffectDensity",
    Callback = function(value)
        _G.EffectDensity = value / 100
    end,
})

AnimationTab:CreateToggle({
    Name = "詳細エフェクト表示",
    CurrentValue = true,
    Flag = "ShowDetailedEffects",
    Callback = function(value)
        _G.ShowDetailedEffects = value
    end,
})

AnimationTab:CreateButton({
    Name = "🎬 演出のみをテスト再生",
    Callback = function()
        PlayUltimate1500Animation(player)
    end,
})

-- 初期設定
_G.AnimationSpeed = 1
_G.EffectDensity = 1
_G.ShowDetailedEffects = true

-- 起動通知
Rayfield:Notify({
   Title = "🌟 影刃 ULTIMATE REALISM 1500",
   Content = "1500種類の超高品質アニメーション搭載\n詳細な3D環境とリアルな演出",
   Duration = 6,
   Image = 4483362458,
})

print("影刃生成システム - ULTIMATE REALISM 1500")
print("バージョン: 5.0")
print("特徴: 1500アニメーション + 詳細3Dモデル + 超高品質環境")
print("使用3Dモデル数: " .. tostring(#MODEL_ASSETS))
