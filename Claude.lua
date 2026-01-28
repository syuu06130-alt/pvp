--[[
    剣名: 影刃 (Kageba) - Ultimate Edition
    テーマ: ダークファンタジー × 近未来SF
    ベース: Classic Sword System
]]

-- Rayfield UIのロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = "影刃 - Kageba Ultimate",
   LoadingTitle = "闇を鍛造中...",
   LoadingSubtitle = "by Shadow Forge Ultimate",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "KagebaUltimate"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", 
      RememberJoins = true 
   },
   KeySystem = false, 
})

-- タブの作成
local Tab = Window:CreateTab("⚔️ 武器庫", 4483362458)

-- 剣生成関数
local function CreateKagebaUltimate()
    local plr = game.Players.LocalPlayer
    local Character = plr.Character or plr.CharacterAdded:Wait()
    local Backpack = plr.Backpack
    
    -- 重複防止
    if Backpack:FindFirstChild("影刃") or (Character and Character:FindFirstChild("影刃")) then
        Rayfield:Notify({
            Title = "⚠️ 警告",
            Content = "既に影刃を所持しています",
            Duration = 2,
            Image = 4483362458,
        })
        return
    end

    -- ========== ツール本体 ========== --
    local tool = Instance.new("Tool", Backpack)
    tool.GripPos = Vector3.new(0, 0, -2)
    tool.GripForward = Vector3.new(0, -1, 0)
    tool.GripRight = Vector3.new(1, 0, 0)
    tool.GripUp = Vector3.new(0, 0, 1)
    tool.Name = "影刃"
    tool.TextureId = "rbxasset://Textures/Sword128.png"
    tool.RequiresHandle = true
    tool.CanBeDropped = false
    tool.ToolTip = "【影刃】闇と冷気を纏う伝説の黒刃 | ダメージ: 50 | 特殊: 闇侵食"

    -- ========== ハンドル ========== --
    local Handle = Instance.new("Part", tool)
    Handle.Name = "Handle"
    Handle.Size = Vector3.new(1, 0.8, 5)
    Handle.Anchored = false
    Handle.CanCollide = false
    Handle.Material = Enum.Material.Glass
    Handle.Color = Color3.fromRGB(3, 5, 10)
    Handle.Reflectance = 0.5
    Handle.Transparency = 0.05

    -- ========== メッシュ（刀型） ========== --
    local mesh = Instance.new("SpecialMesh", Handle)
    mesh.MeshId = "rbxasset://fonts/sword.mesh"
    mesh.TextureId = ""  -- テクスチャなし（黒一色）
    mesh.Scale = Vector3.new(1.2, 1.2, 1.5)
    mesh.Offset = Vector3.new(0, 0, 0)
    mesh.VertexColor = Vector3.new(0, 0, 0)  -- 真っ黒

    -- ========== 柄の装飾部分 ========== --
    local HandleDecor = Instance.new("Part", Handle)
    HandleDecor.Name = "HandleDecor"
    HandleDecor.Size = Vector3.new(0.3, 1.5, 0.3)
    HandleDecor.Material = Enum.Material.Fabric
    HandleDecor.Color = Color3.fromRGB(8, 8, 10)
    HandleDecor.CanCollide = false
    HandleDecor.Massless = true
    
    local HandleMesh = Instance.new("SpecialMesh")
    HandleMesh.MeshType = Enum.MeshType.Cylinder
    HandleMesh.Parent = HandleDecor
    
    local HandleWeld = Instance.new("Weld")
    HandleWeld.Part0 = Handle
    HandleWeld.Part1 = HandleDecor
    HandleWeld.C0 = CFrame.new(0, -2.2, 0) * CFrame.Angles(0, 0, math.rad(90))
    HandleWeld.Parent = Handle

    -- 柄の波紋模様
    local HandlePattern = Instance.new("Part", Handle)
    HandlePattern.Size = Vector3.new(0.32, 1.45, 0.32)
    HandlePattern.Material = Enum.Material.Neon
    HandlePattern.Color = Color3.fromRGB(40, 70, 120)
    HandlePattern.Transparency = 0.75
    HandlePattern.CanCollide = false
    HandlePattern.Massless = true
    
    local PatternMesh = Instance.new("SpecialMesh")
    PatternMesh.MeshType = Enum.MeshType.Cylinder
    PatternMesh.Scale = Vector3.new(0.95, 0.9, 0.95)
    PatternMesh.Parent = HandlePattern
    
    local PatternWeld = Instance.new("Weld")
    PatternWeld.Part0 = Handle
    PatternWeld.Part1 = HandlePattern
    PatternWeld.C0 = CFrame.new(0, -2.2, 0) * CFrame.Angles(0, 0, math.rad(90))
    PatternWeld.Parent = Handle

    -- ========== ポメル ========== --
    local Pommel = Instance.new("Part", Handle)
    Pommel.Shape = Enum.PartType.Ball
    Pommel.Size = Vector3.new(0.5, 0.5, 0.5)
    Pommel.Material = Enum.Material.Metal
    Pommel.Color = Color3.fromRGB(5, 5, 8)
    Pommel.Reflectance = 0.3
    Pommel.CanCollide = false
    Pommel.Massless = true
    
    local PommelWeld = Instance.new("Weld")
    PommelWeld.Part0 = Handle
    PommelWeld.Part1 = Pommel
    PommelWeld.C0 = CFrame.new(0, -3.2, 0)
    PommelWeld.Parent = Handle

    -- ========== 鍔（獣モチーフ） ========== --
    local Guard = Instance.new("Part", Handle)
    Guard.Size = Vector3.new(1.8, 0.25, 0.6)
    Guard.Material = Enum.Material.Metal
    Guard.Color = Color3.fromRGB(12, 12, 18)
    Guard.Reflectance = 0.25
    Guard.CanCollide = false
    Guard.Massless = true
    
    local GuardMesh = Instance.new("SpecialMesh")
    GuardMesh.MeshType = Enum.MeshType.FileMesh
    GuardMesh.MeshId = "rbxassetid://1082802"
    GuardMesh.Scale = Vector3.new(0.8, 0.4, 0.8)
    GuardMesh.Parent = Guard
    
    local GuardWeld = Instance.new("Weld")
    GuardWeld.Part0 = Handle
    GuardWeld.Part1 = Guard
    GuardWeld.C0 = CFrame.new(0, -1.2, 0) * CFrame.Angles(0, 0, math.rad(90))
    GuardWeld.Parent = Handle

    -- 鍔の獣の目（発光装飾）
    local GuardEye1 = Instance.new("Part", Guard)
    GuardEye1.Size = Vector3.new(0.18, 0.18, 0.18)
    GuardEye1.Shape = Enum.PartType.Ball
    GuardEye1.Material = Enum.Material.Neon
    GuardEye1.Color = Color3.fromRGB(100, 150, 255)
    GuardEye1.CanCollide = false
    GuardEye1.Massless = true
    
    local Eye1Weld = Instance.new("Weld")
    Eye1Weld.Part0 = Guard
    Eye1Weld.Part1 = GuardEye1
    Eye1Weld.C0 = CFrame.new(0.5, 0, 0)
    Eye1Weld.Parent = Guard
    
    local GuardEye2 = GuardEye1:Clone()
    GuardEye2.Parent = Guard
    local Eye2Weld = Instance.new("Weld")
    Eye2Weld.Part0 = Guard
    Eye2Weld.Part1 = GuardEye2
    Eye2Weld.C0 = CFrame.new(-0.5, 0, 0)
    Eye2Weld.Parent = Guard

    -- ========== エフェクト群 ========== --
    
    -- 青い光の反射
    local BladeLight = Instance.new("PointLight", Handle)
    BladeLight.Color = Color3.fromRGB(80, 140, 255)
    BladeLight.Range = 12
    BladeLight.Brightness = 2.5
    BladeLight.Shadows = true

    -- 闇のオーラ
    local DarkAura = Instance.new("ParticleEmitter", Handle)
    DarkAura.Texture = "rbxassetid://243662263"
    DarkAura.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 5)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(10, 10, 20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }
    DarkAura.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.4),
        NumberSequenceKeypoint.new(0.5, 1.5),
        NumberSequenceKeypoint.new(1, 2.5)
    })
    DarkAura.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.6),
        NumberSequenceKeypoint.new(0.3, 0.3),
        NumberSequenceKeypoint.new(1, 1)
    })
    DarkAura.Lifetime = NumberRange.new(1.2, 2.8)
    DarkAura.Rate = 30
    DarkAura.Speed = NumberRange.new(0.5, 2)
    DarkAura.SpreadAngle = Vector2.new(20, 20)
    DarkAura.Rotation = NumberRange.new(-180, 180)
    DarkAura.RotSpeed = NumberRange.new(-40, 40)
    DarkAura.LightEmission = 0
    DarkAura.ZOffset = -0.2

    -- 青い波紋粒子
    local HamonParticle = Instance.new("ParticleEmitter", Handle)
    HamonParticle.Texture = "rbxassetid://241809795"
    HamonParticle.Color = ColorSequence.new(Color3.fromRGB(60, 150, 255))
    HamonParticle.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.1),
        NumberSequenceKeypoint.new(1, 0.2)
    })
    HamonParticle.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.1),
        NumberSequenceKeypoint.new(1, 1)
    })
    HamonParticle.Lifetime = NumberRange.new(0.6, 1.2)
    HamonParticle.Rate = 50
    HamonParticle.Speed = NumberRange.new(0.2, 0.8)
    HamonParticle.LightEmission = 1
    HamonParticle.LockedToPart = true

    -- 斬撃軌跡
    local Trail = Instance.new("Trail", Handle)
    Trail.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 140, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 60, 140)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }
    Trail.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.2),
        NumberSequenceKeypoint.new(0.5, 0.5),
        NumberSequenceKeypoint.new(1, 1)
    })
    Trail.Lifetime = 0.6
    Trail.MinLength = 0.05
    Trail.LightEmission = 0.9
    Trail.LightInfluence = 0.1
    Trail.Enabled = false
    
    local Att0 = Instance.new("Attachment", Handle)
    Att0.Position = Vector3.new(0, 2.5, 0)
    
    local Att1 = Instance.new("Attachment", Handle)
    Att1.Position = Vector3.new(0, -2.5, 0)
    
    Trail.Attachment0 = Att0
    Trail.Attachment1 = Att1

    -- ========== サウンド ========== --
    
    local Unsheath = Instance.new("Sound", Handle)
    Unsheath.SoundId = "rbxassetid://12222225"
    Unsheath.Volume = 1
    Unsheath.TimePosition = 0

    local SwordSlash = Instance.new("Sound", Handle)
    SwordSlash.SoundId = "rbxassetid://12222216"
    SwordSlash.Volume = 1.2
    SwordSlash.TimePosition = 0

    local HitSound = Instance.new("Sound", Handle)
    HitSound.SoundId = "rbxassetid://566593606"
    HitSound.Volume = 1.5
    HitSound.Pitch = 0.75

    -- ========== アニメーション ========== --
    
    local Anim = Instance.new("Animation", tool)
    Anim.AnimationId = "rbxassetid://94161088"
    local AnimTrack = plr.Character.Humanoid:LoadAnimation(Anim)

    -- ========== 戦闘システム ========== --
    
    local db = true
    local da = false
    local hiddenfling = false

    tool.Equipped:Connect(function()
        Unsheath:Play()
        Trail.Enabled = true
        DarkAura.Rate = 50
        BladeLight.Brightness = 3
        
        wait(1)
        
        tool.Activated:Connect(function()
            if db == true then
                db = false
                SwordSlash:Play()
                AnimTrack:Play()
                
                -- 斬撃エフェクト強化
                BladeLight.Brightness = 5
                BladeLight.Color = Color3.fromRGB(150, 200, 255)
                
                wait()
                da = true
                db = true
                
                -- エフェクトリセット
                task.delay(0.5, function()
                    BladeLight.Brightness = 3
                    BladeLight.Color = Color3.fromRGB(80, 140, 255)
                end)
                
                wait(2)
                da = false
                AnimTrack:Stop()
            end
        end)
    end)

    tool.Unequipped:Connect(function()
        Trail.Enabled = false
        DarkAura.Rate = 30
        BladeLight.Brightness = 2.5
        da = false
        db = true
    end)

    -- ========== ヒット判定 ========== --
    
    Handle.Touched:Connect(function(hit)
        if da == true then
            local enemyHumanoid = hit.Parent:FindFirstChild("Humanoid")
            if enemyHumanoid ~= nil then
                local enemy = game.Players:FindFirstChild(hit.Parent.Name)
                
                -- ダメージ処理
                enemyHumanoid:TakeDamage(50)
                HitSound:Play()
                
                -- ヒットエフェクト（青黒い爆発）
                local HitEffect = Instance.new("Part")
                HitEffect.Size = Vector3.new(2.5, 2.5, 2.5)
                HitEffect.Shape = Enum.PartType.Ball
                HitEffect.Material = Enum.Material.Neon
                HitEffect.Color = Color3.fromRGB(40, 80, 160)
                HitEffect.Transparency = 0.2
                HitEffect.Anchored = true
                HitEffect.CanCollide = false
                HitEffect.CFrame = hit.CFrame
                HitEffect.Parent = workspace
                
                -- 闇侵食エフェクト
                local DarkEffect = Instance.new("ParticleEmitter")
                DarkEffect.Texture = "rbxassetid://243662263"
                DarkEffect.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
                DarkEffect.Size = NumberSequence.new(2)
                DarkEffect.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.4),
                    NumberSequenceKeypoint.new(1, 1)
                })
                DarkEffect.Lifetime = NumberRange.new(0.6)
                DarkEffect.Rate = 150
                DarkEffect.Speed = NumberRange.new(5)
                DarkEffect.SpreadAngle = Vector2.new(180, 180)
                DarkEffect.Parent = HitEffect
                DarkEffect.Enabled = true
                
                -- 青い衝撃波
                local ShockWave = Instance.new("Part")
                ShockWave.Size = Vector3.new(0.5, 0.5, 0.5)
                ShockWave.Shape = Enum.PartType.Ball
                ShockWave.Material = Enum.Material.Neon
                ShockWave.Color = Color3.fromRGB(80, 140, 255)
                ShockWave.Transparency = 0.3
                ShockWave.Anchored = true
                ShockWave.CanCollide = false
                ShockWave.CFrame = hit.CFrame
                ShockWave.Parent = workspace
                
                -- 拡散アニメーション
                task.spawn(function()
                    for i = 0, 1, 0.08 do
                        HitEffect.Size = HitEffect.Size + Vector3.new(0.8, 0.8, 0.8)
                        HitEffect.Transparency = 0.2 + (i * 0.8)
                        
                        ShockWave.Size = ShockWave.Size + Vector3.new(1.5, 1.5, 1.5)
                        ShockWave.Transparency = 0.3 + (i * 0.7)
                        
                        task.wait(0.03)
                    end
                    HitEffect:Destroy()
                    ShockWave:Destroy()
                end)
                
                -- Fling処理（元のコードベース）
                if enemy and enemy.Name ~= plr.Name then
                    if not game:GetService("ReplicatedStorage"):FindFirstChild("juisdfj0i32i0eidsuf0iok") then
                        hiddenfling = true
                        local detection = Instance.new("Decal")
                        detection.Name = "juisdfj0i32i0eidsuf0iok"
                        detection.Parent = game:GetService("ReplicatedStorage")
                        
                        task.spawn(function()
                            local hrp, c, vel, movel = nil, nil, nil, 0.1
                            while hiddenfling do
                                game:GetService("RunService").Heartbeat:Wait()
                                local lp = game.Players.LocalPlayer
                                c = lp.Character
                                hrp = c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
                                
                                if hrp and hrp.Parent then
                                    vel = hrp.Velocity
                                    hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
                                    game:GetService("RunService").RenderStepped:Wait()
                                    if hrp and hrp.Parent then
                                        hrp.Velocity = vel
                                    end
                                    game:GetService("RunService").Stepped:Wait()
                                    if hrp and hrp.Parent then
                                        hrp.Velocity = vel + Vector3.new(0, movel, 0)
                                        movel = movel * -1
                                    end
                                end
                            end
                        end)
                    end
                end
            end
        end
        
        wait(2)
        hiddenfling = false
    end)

    Rayfield:Notify({
        Title = "⚔️ 影刃 - 召喚完了",
        Content = "闇の力が解き放たれた。敵を斬り裂け。",
        Duration = 4,
        Image = 4483362458,
    })
end

-- ========== UI ボタン ========== --

local SummonButton = Tab:CreateButton({
   Name = "⚔️ 影刃を召喚する",
   Callback = function()
        CreateKagebaUltimate()
   end,
})

Tab:CreateSection("--- 剣の詳細 ---")

Tab:CreateLabel("名称: 影刃 (Kageba)")
Tab:CreateLabel("属性: 闇 × 冷気 × SF")
Tab:CreateLabel("ダメージ: 50")
Tab:CreateLabel("特殊効果: 闇侵食 + Fling")
Tab:CreateLabel("外見: 鏡面ブラック刀、青光波紋")
Tab:CreateLabel("装飾: 獣モチーフ鍔、龍彫刻柄")

-- 起動通知
Rayfield:Notify({
   Title = "🌑 影刃鍛造システム起動",
   Content = "最高品質の闇の刃があなたを待つ...",
   Duration = 5,
   Image = 4483362458,
})
