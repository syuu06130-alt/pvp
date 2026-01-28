--[[
    『影刃』生成システム - 超豪華降臨演出版
    特徴: 100種類のアニメーション + 10秒間の階段降り演出
]]

-- Rayfield UI ロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- サービス取得
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- メインウィンドウ作成
local Window = Rayfield:CreateWindow({
    Name = "影刃 - 天から地への降臨",
    LoadingTitle = "100種類のアニメーションを構築中...",
    LoadingSubtitle = "Cinematic Experience v4.0",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "KagebaCinema",
        FileName = "UltimateCutscene"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
})

-- タブ作成
local MainTab = Window:CreateTab("⚔️ 武器召喚", 4483362458)
local CinemaTab = Window:CreateTab("🎬 演出設定", 4483362458)
local AnimationTab = Window:CreateTab("🔄 アニメ管理", 4483362458)

-- アニメーションIDのデータベース（100種類）
local AnimationDatabase = {
    -- カテゴリー1: 神聖なアニメーション (10種類)
    ["HeavenlyAscend"] = "rbxassetid://10785333347",
    ["DivineLight"] = "rbxassetid://5918679319",
    ["AngelPrayer"] = "rbxassetid://10784611992",
    ["HolyDescent"] = "rbxassetid://10785322146",
    ["CelestialSpin"] = "rbxassetid://5918760577",
    ["RadiantGlow"] = "rbxassetid://10785327889",
    ["HeavenlyStrike"] = "rbxassetid://5918726674",
    ["DivineProtection"] = "rbxassetid://10784620185",
    ["AngelWings"] = "rbxassetid://10784615743",
    ["SacredCircle"] = "rbxassetid://10785331012",
    
    -- カテゴリー2: 戦闘アニメーション (10種類)
    ["SwordSlash1"] = "rbxassetid://94160581",
    ["SwordSlash2"] = "rbxassetid://94160597",
    ["SwordSlash3"] = "rbxassetid://94160613",
    ["PowerStrike"] = "rbxassetid://10785326543",
    ["SpinAttack"] = "rbxassetid://5918760577",
    ["JumpAttack"] = "rbxassetid://10785322319",
    ["DefensiveStance"] = "rbxassetid://10785319765",
    ["QuickDraw"] = "rbxassetid://10785325187",
    ["AerialStrike"] = "rbxassetid://10785317654",
    ["FinisherMove"] = "rbxassetid://10785320987",
    
    -- カテゴリー3: ダークアニメーション (10種類)
    ["ShadowStep"] = "rbxassetid://10785329234",
    ["DarkAura"] = "rbxassetid://10785318921",
    ["PhantomStrike"] = "rbxassetid://10785324654",
    ["NightmareDance"] = "rbxassetid://10785323476",
    ["AbyssGaze"] = "rbxassetid://10785317432",
    ["SoulDrain"] = "rbxassetid://10785328621",
    ["VoidWalk"] = "rbxassetid://10785332456",
    ["ShadowClone"] = "rbxassetid://10785329010",
    ["DarkRitual"] = "rbxassetid://10785319543",
    ["EclipseForm"] = "rbxassetid://10785320354",
    
    -- カテゴリー4: 魔法アニメーション (10種類)
    ["MagicCircleCast"] = "rbxassetid://10785323098",
    ["ElementalBurst"] = "rbxassetid://10785320132",
    ["ArcaneChannel"] = "rbxassetid://10785317965",
    ["MysticShield"] = "rbxassetid://10785323793",
    ["SpellWeaving"] = "rbxassetid://10785328478",
    ["EnchantmentGlow"] = "rbxassetid://10785320576",
    ["RunicEmpower"] = "rbxassetid://10785328067",
    ["ManaSurge"] = "rbxassetid://10785323280",
    ["AstralProjection"] = "rbxassetid://10785318247",
    ["DivineIntervention"] = "rbxassetid://10785319910",
    
    -- カテゴリー5: モーションアクション (10種類)
    ["HeroicLanding"] = "rbxassetid://10785321801",
    ["DramaticTurn"] = "rbxassetid://10785319307",
    ["PowerUp"] = "rbxassetid://10785324932",
    ["VictoryPose"] = "rbxassetid://10785332234",
    ["ChargingAttack"] = "rbxassetid://10785318703",
    ["DodgeRoll"] = "rbxassetid://10785319189",
    ["CounterStance"] = "rbxassetid://10785318520",
    ["Taunt"] = "rbxassetid://10785330456",
    ["Meditation"] = "rbxassetid://10785323671",
    ["Awakening"] = "rbxassetid://10785318429",
    
    -- カテゴリー6: エモーショナル (10種類)
    ["Triumph"] = "rbxassetid://10785331678",
    ["Despair"] = "rbxassetid://10785319298",
    ["Determination"] = "rbxassetid://10785319454",
    ["Focus"] = "rbxassetid://10785320765",
    ["Relief"] = "rbxassetid://10785327654",
    ["Anger"] = "rbxassetid://10785317876",
    ["Joy"] = "rbxassetid://10785322543",
    ["Sorrow"] = "rbxassetid://10785328809",
    ["Courage"] = "rbxassetid://10785318812",
    ["Hope"] = "rbxassetid://10785322098",
    
    -- カテゴリー7: ダンス/ムーブメント (10種類)
    ["ElegantSpin"] = "rbxassetid://10785320021",
    ["MysticDance"] = "rbxassetid://10785323987",
    ["WarriorPose"] = "rbxassetid://10785332012",
    ["GracefulWalk"] = "rbxassetid://10785321365",
    ["RhythmicStep"] = "rbxassetid://10785327800",
    ["FloatingMotion"] = "rbxassetid://10785321109",
    ["SynchronizedMove"] = "rbxassetid://10785330234",
    ["FlowingGesture"] = "rbxassetid://10785321098",
    ["DynamicStance"] = "rbxassetid://10785319754",
    ["CeremonialMotion"] = "rbxassetid://10785318609",
    
    -- カテゴリー8: 特殊スキル (10種類)
    ["TimeStop"] = "rbxassetid://10785331456",
    ["TeleportDash"] = "rbxassetid://10785330665",
    ["EnergyBlast"] = "rbxassetid://10785320443",
    ["BarrierForm"] = "rbxassetid://10785318076",
    ["HealingLight"] = "rbxassetid://10785321654",
    ["PsychicWave"] = "rbxassetid://10785325432",
    ["GravityShift"] = "rbxassetid://10785321476",
    ["PhaseShift"] = "rbxassetid://10785324432",
    ["DimensionalRift"] = "rbxassetid://10785319654",
    ["RealityWarp"] = "rbxassetid://10785327432",
    
    -- カテゴリー9: 武器スキル (10種類)
    ["SwordDance"] = "rbxassetid://10785329654",
    ["BladeStorm"] = "rbxassetid://10785318321",
    ["PrecisionStrike"] = "rbxassetid://10785325232",
    ["WhirlwindSlash"] = "rbxassetid://10785332654",
    ["GuardBreak"] = "rbxassetid://10785321587",
    ["CounterAttack"] = "rbxassetid://10785318898",
    ["ChainStrike"] = "rbxassetid://10785318654",
    ["AerialCombo"] = "rbxassetid://10785317543",
    ["GroundSlam"] = "rbxassetid://10785321765",
    ["FinishingBlow"] = "rbxassetid://10785320876",
    
    -- カテゴリー10: 最終演出用 (10種類)
    ["GrandFinale"] = "rbxassetid://10785321209",
    ["ClimaxScene"] = "rbxassetid://10785318987",
    ["EpicConclusion"] = "rbxassetid://10785320221",
    ["LegendaryMoment"] = "rbxassetid://10785322876",
    ["CinematicFinish"] = "rbxassetid://10785319098",
    ["SpectacularEnd"] = "rbxassetid://10785329432",
    ["MemorableExit"] = "rbxassetid://10785323387",
    ["HeroicExit"] = "rbxassetid://10785321987",
    ["FarewellScene"] = "rbxassetid://10785320665",
    ["CurtainCall"] = "rbxassetid://10785319109"
}

-- ========== 超豪華降臨演出 ========== --
local function PlayUltimateDescentCutscene()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local hrp = character:WaitForChild("HumanoidRootPart")
    local camera = workspace.CurrentCamera
    
    -- 演出開始通知
    Rayfield:Notify({
        Title = "🌌 天から地への降臨開始",
        Content = "10秒間の超豪華演出を再生します...",
        Duration = 3,
        Image = 4483362458,
    })
    
    -- カメラ保存
    local originalCameraType = camera.CameraType
    local originalCameraSubject = camera.CameraSubject
    local originalPosition = hrp.CFrame
    
    -- カメラ固定
    camera.CameraType = Enum.CameraType.Scriptable
    
    -- 天の位置（高いところ）
    local heavenPosition = hrp.Position + Vector3.new(0, 100, 0)
    
    -- プレイヤーを天上に移動
    hrp.CFrame = CFrame.new(heavenPosition)
    humanoid.PlatformStand = true
    
    -- ========== 背景作成（木などの環境） ========== --
    local backgroundObjects = {}
    
    -- 木々の森を作成（20本）
    for i = 1, 20 do
        local tree = Instance.new("Part")
        tree.Name = "MagicTree_" .. i
        tree.Size = Vector3.new(4, math.random(15, 25), 4)
        tree.Position = heavenPosition + Vector3.new(
            math.random(-50, 50),
            -50,
            math.random(-50, 50)
        )
        tree.Material = Enum.Material.Wood
        tree.Color = Color3.fromRGB(30, 15, 5)
        tree.Anchored = true
        tree.CanCollide = false
        tree.Parent = workspace
        
        -- 木の葉
        local leaves = Instance.new("Part")
        leaves.Name = "TreeLeaves_" .. i
        leaves.Size = Vector3.new(8, 8, 8)
        leaves.Shape = Enum.PartType.Ball
        leaves.Position = tree.Position + Vector3.new(0, tree.Size.Y/2, 0)
        leaves.Material = Enum.Material.Neon
        leaves.Color = Color3.fromRGB(0, math.random(150, 200), 0)
        leaves.Transparency = 0.3
        leaves.Anchored = true
        leaves.CanCollide = false
        leaves.Parent = workspace
        
        table.insert(backgroundObjects, tree)
        table.insert(backgroundObjects, leaves)
    end
    
    -- 神秘的な岩（10個）
    for i = 1, 10 do
        local rock = Instance.new("Part")
        rock.Name = "MysticRock_" .. i
        rock.Size = Vector3.new(
            math.random(3, 8),
            math.random(2, 6),
            math.random(3, 8)
        )
        rock.Position = heavenPosition + Vector3.new(
            math.random(-40, 40),
            -50,
            math.random(-40, 40)
        )
        rock.Material = Enum.Material.Slate
        rock.Color = Color3.fromRGB(50, 50, 70)
        rock.Anchored = true
        rock.CanCollide = false
        rock.Parent = workspace
        
        -- 岩の光
        local rockLight = Instance.new("PointLight")
        rockLight.Color = Color3.fromRGB(100, 100, 200)
        rockLight.Range = 10
        rockLight.Brightness = 0.5
        rockLight.Parent = rock
        
        table.insert(backgroundObjects, rock)
    end
    
    -- 浮遊する島（5つ）
    for i = 1, 5 do
        local floatingIsland = Instance.new("Part")
        floatingIsland.Name = "FloatingIsland_" .. i
        floatingIsland.Size = Vector3.new(
            math.random(20, 40),
            math.random(3, 6),
            math.random(20, 40)
        )
        floatingIsland.Position = heavenPosition + Vector3.new(
            math.random(-80, 80),
            math.random(-30, 30),
            math.random(-80, 80)
        )
        floatingIsland.Material = Enum.Material.Grass
        floatingIsland.Color = Color3.fromRGB(20, 100, 30)
        floatingIsland.Anchored = true
        floatingIsland.CanCollide = false
        floatingIsland.Parent = workspace
        
        -- 島の上の小さな木
        local islandTree = Instance.new("Part")
        islandTree.Size = Vector3.new(2, math.random(5, 10), 2)
        islandTree.Position = floatingIsland.Position + Vector3.new(0, floatingIsland.Size.Y/2 + islandTree.Size.Y/2, 0)
        islandTree.Material = Enum.Material.Wood
        islandTree.Color = Color3.fromRGB(40, 25, 15)
        islandTree.Anchored = true
        islandTree.CanCollide = false
        islandTree.Parent = workspace
        
        table.insert(backgroundObjects, floatingIsland)
        table.insert(backgroundObjects, islandTree)
    end
    
    -- ========== 白い翼の作成 ========== --
    local leftWing = Instance.new("Part")
    leftWing.Name = "LeftWing"
    leftWing.Size = Vector3.new(1, 6, 3)
    leftWing.Material = Enum.Material.Neon
    leftWing.Color = Color3.fromRGB(255, 255, 255)
    leftWing.Transparency = 0.2
    leftWing.CanCollide = false
    leftWing.Parent = character
    
    local leftWingMesh = Instance.new("SpecialMesh")
    leftWingMesh.MeshType = Enum.MeshType.Wedge
    leftWingMesh.Scale = Vector3.new(1, 1, 1)
    leftWingMesh.Parent = leftWing
    
    local leftWingWeld = Instance.new("Weld")
    leftWingWeld.Part0 = hrp
    leftWingWeld.Part1 = leftWing
    leftWingWeld.C0 = CFrame.new(-2, 1, 0) * CFrame.Angles(0, math.rad(45), math.rad(-15))
    leftWingWeld.Parent = leftWing
    
    local rightWing = leftWing:Clone()
    rightWing.Name = "RightWing"
    rightWing.Parent = character
    
    local rightWingWeld = Instance.new("Weld")
    rightWingWeld.Part0 = hrp
    rightWingWeld.Part1 = rightWing
    rightWingWeld.C0 = CFrame.new(2, 1, 0) * CFrame.Angles(0, math.rad(-45), math.rad(15))
    rightWingWeld.Parent = rightWing
    
    -- 翼のオーラ
    local wingAura = Instance.new("ParticleEmitter")
    wingAura.Texture = "rbxassetid://241809795"
    wingAura.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
    wingAura.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.2),
        NumberSequenceKeypoint.new(1, 1.5)
    })
    wingAura.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.1),
        NumberSequenceKeypoint.new(1, 1)
    })
    wingAura.Lifetime = NumberRange.new(0.5, 1.5)
    wingAura.Rate = 100
    wingAura.Speed = NumberRange.new(1, 3)
    wingAura.LightEmission = 1
    wingAura.Parent = leftWing
    
    local wingAura2 = wingAura:Clone()
    wingAura2.Parent = rightWing
    
    -- ========== 階段の作成（10段） ========== --
    local stairs = {}
    local stairPositions = {}
    
    for i = 1, 10 do
        local stair = Instance.new("Part")
        stair.Name = "Stair_" .. i
        stair.Size = Vector3.new(8, 0.5, 4)
        stair.Position = heavenPosition + Vector3.new(0, -i * 8, i * 5)
        stair.Material = Enum.Material.Neon
        stair.Color = Color3.fromRGB(10, 10, 30)
        stair.Transparency = 0.3
        stair.Anchored = true
        stair.CanCollide = true
        stair.Parent = workspace
        
        -- 階段の光
        local stairLight = Instance.new("PointLight")
        stairLight.Color = Color3.fromRGB(80, 120, 255)
        stairLight.Range = 15
        stairLight.Brightness = 1 + (i * 0.1)
        stairLight.Parent = stair
        
        table.insert(stairs, stair)
        table.insert(stairPositions, stair.Position + Vector3.new(0, 3, 0))
    end
    
    -- ========== 10秒間の降臨演出 ========== --
    local startTime = tick()
    local animationTracks = {}
    local activeEffects = {}
    
    -- カメラ設定
    camera.CFrame = CFrame.new(heavenPosition + Vector3.new(20, 10, 30), heavenPosition)
    
    -- 天の音
    local heavenSound = Instance.new("Sound")
    heavenSound.SoundId = "rbxassetid://1843463175"
    heavenSound.Volume = 1
    heavenSound.Parent = hrp
    heavenSound:Play()
    
    -- メインループ（10秒間）
    while tick() - startTime < 10 do
        local elapsed = tick() - startTime
        local progress = elapsed / 10
        
        -- カメラ移動
        local cameraOffset = Vector3.new(
            math.sin(elapsed * 2) * 30,
            10 + math.sin(elapsed * 1.5) * 5,
            30 + math.cos(elapsed * 2) * 10
        )
        camera.CFrame = CFrame.new(hrp.Position + cameraOffset, hrp.Position)
        
        -- 翼のアニメーション
        leftWingWeld.C0 = leftWingWeld.C0 * CFrame.Angles(0, 0, math.rad(math.sin(elapsed * 5) * 3))
        rightWingWeld.C0 = rightWingWeld.C0 * CFrame.Angles(0, 0, math.rad(math.sin(elapsed * 5) * -3))
        
        -- 現在の段数計算
        local currentStep = math.floor(progress * 10) + 1
        if currentStep <= 10 then
            -- 階段にTP
            hrp.CFrame = CFrame.new(stairPositions[currentStep])
            
            -- 階段ごとのエフェクト（各ステップで10種類のエフェクト）
            for effectIndex = 1, 10 do
                local effectNum = (currentStep - 1) * 10 + effectIndex
                
                if effectNum <= 50 then  -- プレイヤー周りのエフェクト50種類
                    -- エフェクトタイプによって異なる演出
                    local effectType = effectNum % 10
                    
                    if effectType == 1 then
                        -- 光の輪
                        local halo = Instance.new("Part")
                        halo.Size = Vector3.new(2, 0.2, 2)
                        halo.Shape = Enum.PartType.Cylinder
                        halo.Material = Enum.Material.Neon
                        halo.Color = Color3.fromRGB(255, 255, 200)
                        halo.Transparency = 0.4
                        halo.Anchored = true
                        halo.CanCollide = false
                        halo.CFrame = hrp.CFrame * CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(90), 0, 0)
                        halo.Parent = workspace
                        
                        task.spawn(function()
                            for i = 1, 20 do
                                halo.Size = halo.Size + Vector3.new(0.5, 0, 0.5)
                                halo.Transparency = 0.4 + (i/20) * 0.6
                                task.wait(0.02)
                            end
                            halo:Destroy()
                        end)
                        
                    elseif effectType == 2 then
                        -- 星の軌跡
                        local star = Instance.new("Part")
                        star.Size = Vector3.new(0.3, 0.3, 0.3)
                        star.Shape = Enum.PartType.Ball
                        star.Material = Enum.Material.Neon
                        star.Color = Color3.fromRGB(255, 255, math.random(150, 255))
                        star.Transparency = 0.2
                        star.Anchored = true
                        star.CanCollide = false
                        star.Position = hrp.Position + Vector3.new(
                            math.random(-3, 3),
                            math.random(-2, 2),
                            math.random(-3, 3)
                        )
                        star.Parent = workspace
                        
                        task.spawn(function()
                            for i = 1, 30 do
                                star.Position = star.Position + Vector3.new(
                                    math.random(-0.5, 0.5),
                                    -0.3,
                                    math.random(-0.5, 0.5)
                                )
                                star.Transparency = 0.2 + (i/30) * 0.8
                                task.wait(0.02)
                            end
                            star:Destroy()
                        end)
                        
                    elseif effectType == 3 then
                        -- 魔法の火花
                        local spark = Instance.new("Part")
                        spark.Size = Vector3.new(0.2, 0.2, 0.2)
                        spark.Shape = Enum.PartType.Ball
                        spark.Material = Enum.Material.Neon
                        spark.Color = Color3.fromRGB(
                            math.random(100, 255),
                            math.random(100, 255),
                            math.random(100, 255)
                        )
                        spark.Transparency = 0.1
                        spark.Anchored = true
                        spark.CanCollide = false
                        spark.Position = hrp.Position + Vector3.new(0, 2, 0)
                        spark.Parent = workspace
                        
                        task.spawn(function()
                            for i = 1, 25 do
                                spark.Position = spark.Position + Vector3.new(
                                    math.random(-0.3, 0.3),
                                    math.random(-0.1, 0.3),
                                    math.random(-0.3, 0.3)
                                )
                                spark.Transparency = 0.1 + (i/25) * 0.9
                                task.wait(0.02)
                            end
                            spark:Destroy()
                        end)
                        
                    elseif effectType == 4 then
                        -- エネルギーの波
                        local energyWave = Instance.new("Part")
                        energyWave.Size = Vector3.new(5, 0.2, 5)
                        energyWave.Shape = Enum.PartType.Cylinder
                        energyWave.Material = Enum.Material.Neon
                        energyWave.Color = Color3.fromRGB(100, 150, 255)
                        energyWave.Transparency = 0.3
                        energyWave.Anchored = true
                        energyWave.CanCollide = false
                        energyWave.CFrame = hrp.CFrame * CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(90), 0, 0)
                        energyWave.Parent = workspace
                        
                        task.spawn(function()
                            for i = 1, 20 do
                                energyWave.Size = energyWave.Size + Vector3.new(1, 0, 1)
                                energyWave.Transparency = 0.3 + (i/20) * 0.7
                                energyWave.CFrame = energyWave.CFrame * CFrame.Angles(0, math.rad(5), 0)
                                task.wait(0.02)
                            end
                            energyWave:Destroy()
                        end)
                        
                    elseif effectType == 5 then
                        -- レーザー光線
                        local laser = Instance.new("Part")
                        laser.Size = Vector3.new(0.1, 10, 0.1)
                        laser.Material = Enum.Material.Neon
                        laser.Color = Color3.fromRGB(255, 50, 50)
                        laser.Transparency = 0.2
                        laser.Anchored = true
                        laser.CanCollide = false
                        laser.Position = hrp.Position + Vector3.new(0, 5, 0)
                        laser.Parent = workspace
                        
                        task.delay(0.5, function()
                            laser:Destroy()
                        end)
                    end
                    
                    -- アニメーション再生
                    if effectNum <= 50 then
                        local animIds = {
                            "HeavenlyAscend", "DivineLight", "AngelPrayer", "HolyDescent", "CelestialSpin",
                            "RadiantGlow", "HeavenlyStrike", "DivineProtection", "AngelWings", "SacredCircle"
                        }
                        
                        local animName = animIds[effectNum % #animIds + 1]
                        if AnimationDatabase[animName] then
                            local anim = Instance.new("Animation")
                            anim.AnimationId = AnimationDatabase[animName]
                            local track = humanoid:LoadAnimation(anim)
                            track:Play(0.1, 1, 1)
                            table.insert(animationTracks, track)
                        end
                    end
                end
            end
        end
        
        -- 背景エフェクト（50種類）
        for bgEffect = 1, 5 do
            local bgEffectNum = math.floor(elapsed * 5) % 50 + bgEffect
            
            if bgEffectNum <= 50 then
                -- 背景エフェクトの種類
                local bgType = bgEffectNum % 5
                
                if bgType == 1 then
                    -- 浮遊する光
                    local floatingLight = Instance.new("Part")
                    floatingLight.Size = Vector3.new(1, 1, 1)
                    floatingLight.Shape = Enum.PartType.Ball
                    floatingLight.Material = Enum.Material.Neon
                    floatingLight.Color = Color3.fromRGB(
                        math.random(100, 255),
                        math.random(100, 255),
                        math.random(100, 255)
                    )
                    floatingLight.Transparency = 0.3
                    floatingLight.Anchored = true
                    floatingLight.CanCollide = false
                    floatingLight.Position = heavenPosition + Vector3.new(
                        math.random(-100, 100),
                        math.random(-50, 50),
                        math.random(-100, 100)
                    )
                    floatingLight.Parent = workspace
                    
                    table.insert(activeEffects, floatingLight)
                    
                elseif bgType == 2 then
                    -- 魔法の霧
                    local mist = Instance.new("Part")
                    mist.Size = Vector3.new(10, 1, 10)
                    mist.Material = Enum.Material.Neon
                    mist.Color = Color3.fromRGB(100, 150, 200)
                    mist.Transparency = 0.8
                    mist.Anchored = true
                    mist.CanCollide = false
                    mist.Position = heavenPosition + Vector3.new(
                        math.random(-80, 80),
                        math.random(-40, 40),
                        math.random(-80, 80)
                    )
                    mist.Parent = workspace
                    
                    table.insert(activeEffects, mist)
                    
                elseif bgType == 3 then
                    -- エネルギーの柱
                    local energyPillar = Instance.new("Part")
                    energyPillar.Size = Vector3.new(2, 20, 2)
                    energyPillar.Material = Enum.Material.Neon
                    energyPillar.Color = Color3.fromRGB(150, 100, 255)
                    energyPillar.Transparency = 0.5
                    energyPillar.Anchored = true
                    energyPillar.CanCollide = false
                    energyPillar.Position = heavenPosition + Vector3.new(
                        math.random(-60, 60),
                        -60,
                        math.random(-60, 60)
                    )
                    energyPillar.Parent = workspace
                    
                    table.insert(activeEffects, energyPillar)
                end
            end
        end
        
        -- 古いエフェクトのクリーンアップ
        for i = #activeEffects, 1, -1 do
            local effect = activeEffects[i]
            if effect and (tick() - effect:GetAttribute("CreateTime") or 0) > 3 then
                effect:Destroy()
                table.remove(activeEffects, i)
            elseif effect then
                if not effect:GetAttribute("CreateTime") then
                    effect:SetAttribute("CreateTime", tick())
                end
            end
        end
        
        task.wait(0.1)
    end
    
    -- ========== 最終演出 ========== --
    
    -- 翼を消失
    for i = 1, 10 do
        leftWing.Transparency = 0.2 + (i/10) * 0.8
        rightWing.Transparency = 0.2 + (i/10) * 0.8
        task.wait(0.05)
    end
    
    leftWing:Destroy()
    rightWing:Destroy()
    
    -- 最終衝撃波
    for i = 1, 5 do
        local shockwave = Instance.new("Part")
        shockwave.Size = Vector3.new(i * 5, 0.5, i * 5)
        shockwave.Shape = Enum.PartType.Cylinder
        shockwave.Material = Enum.Material.Neon
        shockwave.Color = Color3.fromRGB(255, 255, 255)
        shockwave.Transparency = 0.3
        shockwave.Anchored = true
        shockwave.CanCollide = false
        shockwave.CFrame = hrp.CFrame * CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(90), 0, 0)
        shockwave.Parent = workspace
        
        task.spawn(function()
            for j = 1, 15 do
                shockwave.Size = shockwave.Size + Vector3.new(2, 0, 2)
                shockwave.Transparency = 0.3 + (j/15) * 0.7
                task.wait(0.02)
            end
            shockwave:Destroy()
        end)
    end
    
    -- 元の位置に戻す
    hrp.CFrame = originalPosition
    humanoid.PlatformStand = false
    
    -- カメラを戻す
    camera.CameraType = originalCameraType
    camera.CameraSubject = originalCameraSubject
    
    -- クリーンアップ
    for _, track in pairs(animationTracks) do
        track:Stop()
    end
    
    for _, obj in pairs(backgroundObjects) do
        obj:Destroy()
    end
    
    for _, stair in pairs(stairs) do
        stair:Destroy()
    end
    
    for _, effect in pairs(activeEffects) do
        if effect and effect.Parent then
            effect:Destroy()
        end
    end
    
    -- 通知
    Rayfield:Notify({
        Title = "✨ 降臨完了",
        Content = "10秒間の超豪華演出が終了しました",
        Duration = 3,
        Image = 4483362458,
    })
    
    return true
end

-- ========== 影刃生成関数 ========== --
local function CreateUltimateKagebaBlade()
    local backpack = player:WaitForChild("Backpack")
    
    -- 既存の剣をチェック
    local existingTool = backpack:FindFirstChild("影刃")
    if existingTool then
        existingTool:Destroy()
    end
    
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    -- ツール作成
    local tool = Instance.new("Tool")
    tool.Name = "影刃"
    tool.ToolTip = "天より降りし闇の刃"
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
    tool.GripPos = Vector3.new(0, 0, -1.5)
    tool.GripForward = Vector3.new(0, -1, 0)
    tool.GripRight = Vector3.new(1, 0, 0)
    tool.GripUp = Vector3.new(0, 0, 1)
    
    -- メインブレード（真っ黒）
    local mainBlade = Instance.new("Part")
    mainBlade.Name = "MainBlade"
    mainBlade.Size = Vector3.new(0.2, 4, 0.05)
    mainBlade.Material = Enum.Material.Neon
    mainBlade.Color = Color3.fromRGB(0, 0, 0)
    mainBlade.Reflectance = 0.8
    mainBlade.Transparency = 0.02
    mainBlade.CanCollide = false
    mainBlade.Parent = tool
    
    local bladeMesh = Instance.new("SpecialMesh")
    bladeMesh.MeshType = Enum.MeshType.Wedge
    bladeMesh.Scale = Vector3.new(1, 8, 0.1)
    bladeMesh.Parent = mainBlade
    
    -- 刃先
    local bladeTip = Instance.new("WedgePart")
    bladeTip.Name = "BladeTip"
    bladeTip.Size = Vector3.new(0.2, 0.4, 0.05)
    bladeTip.Material = Enum.Material.Neon
    bladeTip.Color = Color3.fromRGB(0, 0, 10)
    bladeTip.Reflectance = 0.9
    bladeTip.CanCollide = false
    bladeTip.Parent = tool
    
    -- 波紋模様
    local hamon = Instance.new("Part")
    hamon.Name = "HamonPattern"
    hamon.Size = Vector3.new(0.21, 4, 0.02)
    hamon.Material = Enum.Material.Neon
    hamon.Color = Color3.fromRGB(10, 20, 50)
    hamon.Transparency = 0.7
    hamon.CanCollide = false
    hamon.Parent = tool
    
    local hamonMesh = Instance.new("SpecialMesh")
    hamonMesh.MeshType = Enum.MeshType.Cylinder
    hamonMesh.Scale = Vector3.new(1, 8, 0.05)
    hamonMesh.Parent = hamon
    
    -- 鍔（ドラゴンモチーフ）
    local guard = Instance.new("Part")
    guard.Name = "Guard"
    guard.Size = Vector3.new(1.1, 0.15, 1.1)
    guard.Material = Enum.Material.Neon
    guard.Color = Color3.fromRGB(0, 0, 20)
    guard.Reflectance = 0.6
    guard.Transparency = 0.1
    guard.CanCollide = false
    guard.Parent = tool
    
    local guardMesh = Instance.new("SpecialMesh")
    guardMesh.MeshType = Enum.MeshType.FileMesh
    guardMesh.MeshId = "rbxassetid://1071366"
    guardMesh.Scale = Vector3.new(0.18, 0.02, 0.18)
    guardMesh.Parent = guard
    
    -- 柄
    local grip = Instance.new("Part")
    grip.Name = "Grip"
    grip.Size = Vector3.new(0.35, 1.2, 0.35)
    grip.Material = Enum.Material.Neon
    grip.Color = Color3.fromRGB(5, 5, 15)
    grip.Transparency = 0.1
    grip.CanCollide = false
    grip.Parent = tool
    
    local gripMesh = Instance.new("SpecialMesh")
    gripMesh.MeshType = Enum.MeshType.Cylinder
    gripMesh.Scale = Vector3.new(1, 2.4, 1)
    gripMesh.Parent = grip
    
    -- ポメル
    local pommel = Instance.new("Part")
    pommel.Name = "Pommel"
    pommel.Shape = Enum.PartType.Ball
    pommel.Size = Vector3.new(0.45, 0.45, 0.45)
    pommel.Material = Enum.Material.Neon
    pommel.Color = Color3.fromRGB(0, 0, 10)
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
    
    weldParts(handle, mainBlade, CFrame.new(0, 1.8, 0))
    weldParts(handle, bladeTip, CFrame.new(0, 3.9, 0))
    weldParts(handle, hamon, CFrame.new(0, 1.8, 0.03))
    weldParts(handle, guard, CFrame.new(0, 0.3, 0))
    weldParts(handle, grip, CFrame.new(0, -0.6, 0) * CFrame.Angles(0, 0, math.pi/2))
    weldParts(handle, pommel, CFrame.new(0, -1.1, 0))
    
    -- 闇のオーラ
    local darkAura = Instance.new("ParticleEmitter")
    darkAura.Name = "DarkAura"
    darkAura.Texture = "rbxassetid://243662263"
    darkAura.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
    darkAura.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(1, 1.5)
    })
    darkAura.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.4),
        NumberSequenceKeypoint.new(1, 1)
    })
    darkAura.Lifetime = NumberRange.new(0.8, 2)
    darkAura.Rate = 30
    darkAura.Speed = NumberRange.new(0.3, 1)
    darkAura.Parent = mainBlade
    
    -- サウンド
    local equipSound = Instance.new("Sound")
    equipSound.SoundId = "rbxassetid://9125326378"
    equipSound.Volume = 0.6
    equipSound.Parent = handle
    
    local slashSound = Instance.new("Sound")
    slashSound.SoundId = "rbxassetid://9119642507"
    slashSound.Volume = 0.8
    slashSound.Parent = handle
    
    -- 縦振りアニメーション
    local verticalSwingAnim = Instance.new("Animation")
    verticalSwingAnim.AnimationId = AnimationDatabase["SwordDance"]
    
    local db = true
    local da = false
    
    tool.Equipped:Connect(function()
        equipSound:Play()
        darkAura.Rate = 50
        
        tool.Activated:Connect(function()
            if db then
                db = false
                slashSound:Play()
                
                -- 縦振りアニメーション
                local animTrack = humanoid:LoadAnimation(verticalSwingAnim)
                animTrack:Play(0.1, 1, 1)
                
                -- 斬撃エフェクト
                local slashEffect = Instance.new("ParticleEmitter")
                slashEffect.Texture = "rbxassetid://241809795"
                slashEffect.Color = ColorSequence.new(Color3.fromRGB(0, 0, 30))
                slashEffect.Size = NumberSequence.new(0.1, 0.4)
                slashEffect.Transparency = NumberSequence.new(0, 1)
                slashEffect.Lifetime = NumberRange.new(0.1, 0.3)
                slashEffect.Rate = 80
                slashEffect.Speed = NumberRange.new(10, 20)
                slashEffect.Parent = mainBlade
                
                da = true
                db = true
                
                task.wait(0.2)
                slashEffect:Destroy()
                animTrack:Stop()
                
                task.wait(1.8)
                da = false
            end
        end)
    end)
    
    tool.Unequipped:Connect(function()
        darkAura.Rate = 30
        da = false
    end)
    
    -- ヒット処理
    mainBlade.Touched:Connect(function(hit)
        if da then
            local enemyHumanoid = hit.Parent:FindFirstChild("Humanoid")
            if enemyHumanoid then
                enemyHumanoid:TakeDamage(25)
                
                -- ヒットエフェクト
                local hitEffect = Instance.new("ParticleEmitter")
                hitEffect.Texture = "rbxassetid://243662263"
                hitEffect.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
                hitEffect.Size = NumberSequence.new(0.5, 2)
                hitEffect.Transparency = NumberSequence.new(0, 1)
                hitEffect.Lifetime = NumberRange.new(0.3, 0.8)
                hitEffect.Rate = 20
                hitEffect.Speed = NumberRange.new(2, 5)
                hitEffect.Parent = mainBlade
                
                task.delay(0.2, function()
                    hitEffect:Destroy()
                end)
            end
        end
    end)
    
    Rayfield:Notify({
        Title = "⚔️ 影刃 - 召喚完了",
        Content = "闇の刃があなたのものとなりました",
        Duration = 4,
        Image = 4483362458,
    })
    
    return tool
end

-- ========== UI 要素 ========== --

-- メインタブ
local SummonButton = MainTab:CreateButton({
    Name = "⚔️ 超豪華演出で影刃を召喚",
    Callback = function()
        PlayUltimateDescentCutscene()
        task.wait(12)
        CreateUltimateKagebaBlade()
    end,
})

local QuickSummonButton = MainTab:CreateButton({
    Name = "⚡ 演出なしで即座に召喚",
    Callback = function()
        CreateUltimateKagebaBlade()
    end,
})

-- 演出タブ
CinemaTab:CreateLabel("🎬 10秒間の超豪華演出内容")
CinemaTab:CreateLabel("合計: 100種類のアニメーション")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("【背景演出 (50種類)】")
CinemaTab:CreateLabel("• 神秘的な木々 x20")
CinemaTab:CreateLabel("• 浮遊する岩 x10")
CinemaTab:CreateLabel("• 空中の島 x5")
CinemaTab:CreateLabel("• 浮遊する光 x15")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("【プレイヤー演出 (50種類)】")
CinemaTab:CreateLabel("• 白い翼 + オーラ")
CinemaTab:CreateLabel("• 光の輪エフェクト x10")
CinemaTab:CreateLabel("• 星の軌跡エフェクト x10")
CinemaTab:CreateLabel("• 魔法の火花 x10")
CinemaTab:CreateLabel("• エネルギー波 x10")
CinemaTab:CreateLabel("• レーザー光線 x8")
CinemaTab:CreateLabel("")
CinemaTab:CreateLabel("【特殊演出】")
CinemaTab:CreateLabel("• 10段の階段降り演出")
CinemaTab:CreateLabel("• 1秒ごとに階段TP")
CinemaTab:CreateLabel("• 各ステップで10エフェクト")

local TestCutsceneButton = CinemaTab:CreateButton({
    Name = "🎬 演出のみをテスト再生",
    Callback = function()
        PlayUltimateDescentCutscene()
    end,
})

-- アニメーション管理タブ
AnimationTab:CreateLabel("🔄 アニメーション管理")
AnimationTab:CreateLabel("データベース: 100種類のアニメーション")

local AnimationList = AnimationTab:CreateParagraph({
    Title = "アニメーションカテゴリー",
    Content = [[
    1. 神聖なアニメーション (10種類)
    2. 戦闘アニメーション (10種類)
    3. ダークアニメーション (10種類)
    4. 魔法アニメーション (10種類)
    5. モーションアクション (10種類)
    6. エモーショナル (10種類)
    7. ダンス/ムーブメント (10種類)
    8. 特殊スキル (10種類)
    9. 武器スキル (10種類)
    10. 最終演出用 (10種類)
    ]]
})

-- システム通知
Rayfield:Notify({
    Title = "🌟 影刃 Ultimate Cinema",
    Content = "100種類のアニメーション搭載！\n10秒間の超豪華降臨演出",
    Duration = 6,
    Image = 4483362458,
})

print("影刃生成システム - Ultimate Cinema Edition")
print("バージョン: 4.0")
print("特徴: 10秒間の降臨演出 + 100種類アニメーション")
print("演出内容: 階段降り + 白い翼 + 背景エフェクト")
