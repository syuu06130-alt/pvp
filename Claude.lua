--[[
    剣名: 影刃 (Kageba) - Final Edition
    テーマ: ダークファンタジー × 近未来SF
    特徴: 完全オリジナル黒刃、縦振り攻撃、召喚演出付き
]]

-- Rayfield UIのロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = "影刃 - Kageba Final",
   LoadingTitle = "闇を鍛造中...",
   LoadingSubtitle = "by Shadow Forge Final",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "KagebaFinal"
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
local EffectTab = Window:CreateTab("✨ 演出設定", 4483362458)

-- 召喚演出関数
local function PlaySummonCutscene(player)
    local Camera = workspace.CurrentCamera
    local Character = player.Character or player.CharacterAdded:Wait()
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    
    -- カメラを保存
    local OriginalCameraType = Camera.CameraType
    local OriginalCameraSubject = Camera.CameraSubject
    
    -- カメラを固定
    Camera.CameraType = Enum.CameraType.Scriptable
    
    -- 演出用パーツ（階段の上）
    local SummonPlatform = Instance.new("Part")
    SummonPlatform.Size = Vector3.new(20, 1, 20)
    SummonPlatform.Position = HumanoidRootPart.Position + Vector3.new(0, 15, 0)
    SummonPlatform.Anchored = true
    SummonPlatform.Transparency = 1
    SummonPlatform.CanCollide = false
    SummonPlatform.Parent = workspace
    
    -- 闇の背景（巨大な黒い球体）
    local DarkBackground = Instance.new("Part")
    DarkBackground.Size = Vector3.new(50, 50, 50)
    DarkBackground.Shape = Enum.PartType.Ball
    DarkBackground.Position = SummonPlatform.Position
    DarkBackground.Material = Enum.Material.Neon
    DarkBackground.Color = Color3.fromRGB(0, 0, 0)
    DarkBackground.Transparency = 0.3
    DarkBackground.Anchored = true
    DarkBackground.CanCollide = false
    DarkBackground.Parent = workspace
    
    -- 闇のオーラエフェクト
    local DarkAuraEffect = Instance.new("ParticleEmitter")
    DarkAuraEffect.Texture = "rbxassetid://243662263"
    DarkAuraEffect.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
    DarkAuraEffect.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 2),
        NumberSequenceKeypoint.new(0.5, 4),
        NumberSequenceKeypoint.new(1, 6)
    })
    DarkAuraEffect.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(1, 1)
    })
    DarkAuraEffect.Lifetime = NumberRange.new(2, 4)
    DarkAuraEffect.Rate = 100
    DarkAuraEffect.Speed = NumberRange.new(2, 5)
    DarkAuraEffect.SpreadAngle = Vector2.new(180, 180)
    DarkAuraEffect.Rotation = NumberRange.new(-180, 180)
    DarkAuraEffect.RotSpeed = NumberRange.new(-50, 50)
    DarkAuraEffect.Parent = DarkBackground
    
    -- 階段の作成
    local Stairs = {}
    for i = 1, 10 do
        local Stair = Instance.new("Part")
        Stair.Size = Vector3.new(6, 0.5, 3)
        Stair.Position = SummonPlatform.Position - Vector3.new(0, i * 1.5, i * 1.5)
        Stair.Material = Enum.Material.Neon
        Stair.Color = Color3.fromRGB(5, 5, 10)
        Stair.Anchored = true
        Stair.CanCollide = true
        Stair.Transparency = 0.3
        Stair.Parent = workspace
        table.insert(Stairs, Stair)
        
        -- 階段の縁の光
        local StairGlow = Instance.new("PointLight")
        StairGlow.Color = Color3.fromRGB(50, 80, 150)
        StairGlow.Range = 8
        StairGlow.Brightness = 1.5
        StairGlow.Parent = Stair
    end
    
    -- 剣のシルエット（上から降りてくる）
    local SwordSilhouette = Instance.new("Part")
    SwordSilhouette.Size = Vector3.new(0.3, 5, 0.8)
    SwordSilhouette.Position = SummonPlatform.Position + Vector3.new(0, 3, 0)
    SwordSilhouette.Material = Enum.Material.Neon
    SwordSilhouette.Color = Color3.fromRGB(0, 0, 0)
    SwordSilhouette.Transparency = 0
    SwordSilhouette.Anchored = true
    SwordSilhouette.CanCollide = false
    SwordSilhouette.Parent = workspace
    
    local SwordGlow = Instance.new("PointLight")
    SwordGlow.Color = Color3.fromRGB(50, 100, 200)
    SwordGlow.Range = 15
    SwordGlow.Brightness = 3
    SwordGlow.Parent = SwordSilhouette
    
    -- カメラアングル設定
    Camera.CFrame = CFrame.new(SummonPlatform.Position + Vector3.new(15, 5, 15), SummonPlatform.Position)
    
    -- 演出開始サウンド
    local SummonSound = Instance.new("Sound")
    SummonSound.SoundId = "rbxassetid://5095207895"
    SummonSound.Volume = 0.8
    SummonSound.Parent = SwordSilhouette
    SummonSound:Play()
    
    -- 通知
    Rayfield:Notify({
        Title = "🌑 影刃召喚儀式",
        Content = "闇の階段を降りて、伝説の刃が顕現する...",
        Duration = 3,
        Image = 4483362458,
    })
    
    -- 剣が降りてくるアニメーション
    local DescendDuration = 2
    local StartPos = SwordSilhouette.Position
    local EndPos = SummonPlatform.Position + Vector3.new(0, 1, 0)
    
    for i = 0, 1, 0.02 do
        SwordSilhouette.Position = StartPos:Lerp(EndPos, i)
        SwordSilhouette.Orientation = Vector3.new(0, i * 360 * 2, 0)
        task.wait(DescendDuration / 50)
    end
    
    -- 着地エフェクト
    local ImpactEffect = Instance.new("Part")
    ImpactEffect.Size = Vector3.new(1, 1, 1)
    ImpactEffect.Shape = Enum.PartType.Ball
    ImpactEffect.Position = EndPos
    ImpactEffect.Material = Enum.Material.Neon
    ImpactEffect.Color = Color3.fromRGB(0, 0, 0)
    ImpactEffect.Transparency = 0.2
    ImpactEffect.Anchored = true
    ImpactEffect.CanCollide = false
    ImpactEffect.Parent = workspace
    
    local ImpactSound = Instance.new("Sound")
    ImpactSound.SoundId = "rbxassetid://9125402735"
    ImpactSound.Volume = 1
    ImpactSound.Parent = ImpactEffect
    ImpactSound:Play()
    
    -- 衝撃波
    task.spawn(function()
        for i = 0, 1, 0.05 do
            ImpactEffect.Size = Vector3.new(1 + i * 20, 1 + i * 20, 1 + i * 20)
            ImpactEffect.Transparency = 0.2 + (i * 0.8)
            task.wait(0.03)
        end
        ImpactEffect:Destroy()
    end)
    
    wait(1)
    
    -- カメラを元に戻す
    Camera.CameraType = OriginalCameraType
    Camera.CameraSubject = OriginalCameraSubject
    
    -- 演出用オブジェクトを削除
    task.wait(1)
    DarkBackground:Destroy()
    SwordSilhouette:Destroy()
    SummonPlatform:Destroy()
    for _, stair in pairs(Stairs) do
        stair:Destroy()
    end
end

-- 剣生成関数
local function CreateKagebaFinal()
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
    tool.GripPos = Vector3.new(0, 0, -1.8)
    tool.GripForward = Vector3.new(0, -1, 0)
    tool.GripRight = Vector3.new(1, 0, 0)
    tool.GripUp = Vector3.new(0, 0, 1)
    tool.Name = "影刃"
    tool.TextureId = "rbxasset://Textures/Sword128.png"
    tool.RequiresHandle = true
    tool.CanBeDropped = false
    tool.ToolTip = "【影刃】闇と冷気を纏う伝説の黒刃 | ダメージ: 55 | 縦振り斬撃"

    -- ========== ハンドル（元のメッシュは使わない） ========== --
    local Handle = Instance.new("Part", tool)
    Handle.Name = "Handle"
    Handle.Size = Vector3.new(0.3, 0.3, 0.3)  -- 小さく透明にして実質非表示
    Handle.Transparency = 1
    Handle.Anchored = false
    Handle.CanCollide = false

    -- ========== 柄部分（黒革巻き） ========== --
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

    -- 柄の波紋装飾
    local GripPattern = Instance.new("Part", Handle)
    GripPattern.Size = Vector3.new(0.29, 1.35, 0.29)
    GripPattern.Material = Enum.Material.Neon
    GripPattern.Color = Color3.fromRGB(20, 30, 50)
    GripPattern.Transparency = 0.7
    GripPattern.CanCollide = false
    GripPattern.Massless = true
    
    local PatternMesh = Instance.new("SpecialMesh")
    PatternMesh.MeshType = Enum.MeshType.Cylinder
    PatternMesh.Scale = Vector3.new(0.96, 0.92, 0.96)
    PatternMesh.Parent = GripPattern
    
    local PatternWeld = Instance.new("Weld")
    PatternWeld.Part0 = Handle
    PatternWeld.Part1 = GripPattern
    PatternWeld.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, math.rad(90))
    PatternWeld.Parent = Handle

    -- ========== ポメル ========== --
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

    -- ========== 鍔（獣モチーフ） ========== --
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

    -- 鍔の獣の目
    local GuardEye1 = Instance.new("Part", Guard)
    GuardEye1.Size = Vector3.new(0.16, 0.16, 0.16)
    GuardEye1.Shape = Enum.PartType.Ball
    GuardEye1.Material = Enum.Material.Neon
    GuardEye1.Color = Color3.fromRGB(60, 100, 180)
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

    -- ========== 刃（完全オリジナル・黒） ========== --
    local Blade = Instance.new("Part", Handle)
    Blade.Name = "Blade"
    Blade.Size = Vector3.new(0.15, 4, 0.65)
    Blade.Material = Enum.Material.Glass
    Blade.Color = Color3.fromRGB(0, 0, 0)  -- 完全な黒
    Blade.Reflectance = 0.5
    Blade.Transparency = 0.03
    Blade.CanCollide = false
    Blade.Massless = true
    
    local BladeMesh = Instance.new("SpecialMesh")
    BladeMesh.MeshType = Enum.MeshType.Wedge
    BladeMesh.Scale = Vector3.new(1, 1, 1)
    BladeMesh.Parent = Blade
    
    local BladeWeld = Instance.new("Weld")
    BladeWeld.Part0 = Handle
    BladeWeld.Part1 = Blade
    BladeWeld.C0 = CFrame.new(0, 2.9, 0) * CFrame.Angles(math.rad(180), 0, 0)
    BladeWeld.Parent = Handle

    -- 刃の波紋（うっすら青）
    local BladeHamon = Instance.new("Part", Blade)
    BladeHamon.Size = Vector3.new(0.16, 3.9, 0.63)
    BladeHamon.Material = Enum.Material.Neon
    BladeHamon.Color = Color3.fromRGB(30, 50, 90)
    BladeHamon.Transparency = 0.8
    BladeHamon.CanCollide = false
    BladeHamon.Massless = true
    
    local HamonMesh = Instance.new("SpecialMesh")
    HamonMesh.MeshType = Enum.MeshType.Wedge
    HamonMesh.Scale = Vector3.new(0.97, 0.97, 0.97)
    HamonMesh.Parent = BladeHamon
    
    local HamonWeld = Instance.new("Weld")
    HamonWeld.Part0 = Blade
    HamonWeld.Part1 = BladeHamon
    HamonWeld.C0 = CFrame.new(0, 0, 0)
    HamonWeld.Parent = Blade

    -- ========== エフェクト（黒いオーラ） ========== --
    
    -- 黒い光
    local BladeLight = Instance.new("PointLight", Blade)
    BladeLight.Color = Color3.fromRGB(10, 20, 40)
    BladeLight.Range = 10
    BladeLight.Brightness = 1.8
    BladeLight.Shadows = true

    -- 黒いオーラ
    local DarkAura = Instance.new("ParticleEmitter", Blade)
    DarkAura.Texture = "rbxassetid://243662263"
    DarkAura.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))  -- 完全な黒
    DarkAura.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(0.5, 1.8),
        NumberSequenceKeypoint.new(1, 3)
    })
    DarkAura.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(0.3, 0.2),
        NumberSequenceKeypoint.new(1, 1)
    })
    DarkAura.Lifetime = NumberRange.new(1.5, 3)
    DarkAura.Rate = 35
    DarkAura.Speed = NumberRange.new(0.8, 2.5)
    DarkAura.SpreadAngle = Vector2.new(25, 25)
    DarkAura.Rotation = NumberRange.new(-180, 180)
    DarkAura.RotSpeed = NumberRange.new(-50, 50)
    DarkAura.LightEmission = 0
    DarkAura.ZOffset = -0.15

    -- 青みの粒子（控えめ）
    local BlueParticle = Instance.new("ParticleEmitter", Blade)
    BlueParticle.Texture = "rbxassetid://241809795"
    BlueParticle.Color = ColorSequence.new(Color3.fromRGB(40, 70, 120))
    BlueParticle.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.08),
        NumberSequenceKeypoint.new(1, 0.15)
    })
    BlueParticle.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(1, 1)
    })
    BlueParticle.Lifetime = NumberRange.new(0.7, 1.3)
    BlueParticle.Rate = 30
    BlueParticle.Speed = NumberRange.new(0.3, 1)
    BlueParticle.LightEmission = 0.8
    BlueParticle.LockedToPart = true

    -- 斬撃軌跡（黒メイン）
    local Trail = Instance.new("Trail", Blade)
    Trail.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 70, 120)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(10, 15, 30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }
    Trail.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.15),
        NumberSequenceKeypoint.new(0.5, 0.5),
        NumberSequenceKeypoint.new(1, 1)
    })
    Trail.Lifetime = 0.7
    Trail.MinLength = 0.05
    Trail.LightEmission = 0.5
    Trail.LightInfluence = 0.3
    Trail.Enabled = false
    
    local Att0 = Instance.new("Attachment", Blade)
    Att0.Position = Vector3.new(0, 2, 0)
    
    local Att1 = Instance.new("Attachment", Blade)
    Att1.Position = Vector3.new(0, -2, 0)
    
    Trail.Attachment0 = Att0
    Trail.Attachment1 = Att1

    -- ========== サウンド ========== --
    
    local Unsheath = Instance.new("Sound", Handle)
    Unsheath.SoundId = "rbxassetid://12222225"
    Unsheath.Volume = 1
    Unsheath.TimePosition = 0

    local SwordSlash = Instance.new("Sound", Handle)
    SwordSlash.SoundId = "rbxassetid://12222216"
    SwordSlash.Volume = 1.3
    SwordSlash.Pitch = 0.9
    SwordSlash.TimePosition = 0

    local HitSound = Instance.new("Sound", Handle)
    HitSound.SoundId = "rbxassetid://566593606"
    HitSound.Volume = 1.6
    HitSound.Pitch = 0.7

    -- ========== 縦振りアニメーション ========== --
    
    local VerticalSlashAnim = Instance.new("Animation", tool)
    VerticalSlashAnim.AnimationId = "rbxassetid://186934658"  -- 縦振りアニメーション
    local AnimTrack = plr.Character.Humanoid:LoadAnimation(VerticalSlashAnim)

    -- ========== 戦闘システム ========== --
    
    local db = true
    local da = false
    local hiddenfling = false

    tool.Equipped:Connect(function()
        Unsheath:Play()
        Trail.Enabled = true
        DarkAura.Rate = 55
        BladeLight.Brightness = 2.5
        
        wait(1)
        
        tool.Activated:Connect(function()
            if db == true then
                db = false
                SwordSlash:Play()
                AnimTrack:Play()
                
                -- 斬撃エフェクト強化
                BladeLight.Brightness = 4
                BladeLight.Color = Color3.fromRGB(50, 80, 150)
                DarkAura.Rate = 100
                
                wait()
                da = true
                db = true
                
                -- エフェクトリセット
                task.delay(0.6, function()
                    BladeLight.Brightness = 2.5
                    BladeLight.Color = Color3.fromRGB(10, 20, 40)
                    DarkAura.Rate = 55
                end)
                
                wait(1.5)
                da = false
                AnimTrack:Stop()
            end
        end)
    end)

    tool.Unequipped:Connect(function()
        Trail.Enabled = false
        DarkAura.Rate = 35
        BladeLight.Brightness = 1.8
        da = false
        db = true
    end)

    -- ========== ヒット判定 ========== --
    
    Blade.Touched:Connect(function(hit)
        if da == true then
            local enemyHumanoid = hit.Parent:FindFirstChild("Humanoid")
            if enemyHumanoid ~= nil then
                local enemy = game.Players:FindFirstChild(hit.Parent.Name)
                
                -- ダメージ処理
                enemyHumanoid:TakeDamage(55)
                HitSound:Play()
                
                -- ヒットエフェクト（黒い爆発）
                local HitEffect = Instance.new("Part")
                HitEffect.Size = Vector3.new(3, 3, 3)
                HitEffect.Shape = Enum.PartType.Ball
                HitEffect.Material = Enum.Material.Neon
                HitEffect.Color = Color3.fromRGB(0, 0, 0)
                HitEffect.Transparency = 0.15
                HitEffect.Anchored = true
                HitEffect.CanCollide = false
                HitEffect.CFrame = hit.CFrame
                HitEffect.Parent = workspace
                
                -- 闇侵食エフェクト
                local DarkEffect = Instance.new("ParticleEmitter")
                DarkEffect.Texture = "rbxassetid://243662263"
                DarkEffect.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
                DarkEffect.Size = NumberSequence.new(2.5)
                DarkEffect.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.3),
                    NumberSequenceKeypoint.new(1, 1)
                })
                DarkEffect.Lifetime = NumberRange.new(0.8)
                DarkEffect.Rate = 200
                DarkEffect.Speed = NumberRange.new(6)
                DarkEffect.SpreadAngle = Vector2.new(180, 180)
                DarkEffect.Parent = HitEffect
                DarkEffect.Enabled = true
                
                -- 青い衝撃波（控えめ）
                local ShockWave = Instance.new("Part")
                ShockWave.Size = Vector3.new(0.8, 0.8, 0.8)
                ShockWave.Shape = Enum.PartType.Ball
                ShockWave.Material = Enum.Material.Neon
                ShockWave.Color = Color3.fromRGB(40, 70, 120)
                ShockWave.Transparency = 0.4
                ShockWave.Anchored = true
                ShockWave.CanCollide = false
                ShockWave.CFrame = hit.CFrame
                ShockWave.Parent = workspace
                
                -- 拡散アニメーション
                task.spawn(function()
                    for i = 0, 1, 0.06 do
                        HitEffect.Size = HitEffect.Size + Vector3.new(1, 1, 1)
                        HitEffect.Transparency = 0.15 + (i * 0.85)
                        
                        ShockWave.Size = ShockWave.Size + Vector3.new(2, 2, 2)
                        ShockWave.Transparency = 0.4 + (i * 0.6)
                        
                        task.wait(0.025)
                    end
                    HitEffect:Destroy()
                    ShockWave:Destroy()
                end)
                
                -- Fling処理
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
        Content = "闇の力が解き放たれた。縦振りで敵を斬り裂け。",
        Duration = 4,
        Image = 4483362458,
    })
end

-- ========== メインタブ ========== --

local SummonButton = MainTab:CreateButton({
   Name = "⚔️ 影刃を召喚する（演出あり）",
   Callback = function()
        PlaySummonCutscene(game.Players.LocalPlayer)
        wait(5)
        CreateKagebaFinal()
   end,
})

local QuickSummonButton = MainTab:CreateButton({
   Name = "⚡ 影刃を即座に召喚（演出なし）",
   Callback = function()
        CreateKagebaFinal()
   end,
})

MainTab:CreateSection("--- 剣の詳細 ---")

MainTab:CreateLabel("名称: 影刃 (Kageba)")
MainTab:CreateLabel("形状: 完全オリジナル黒刃")
MainTab:CreateLabel("色: 鏡面ブラック（純黒）")
MainTab:CreateLabel("オーラ: 黒い闇のオーラ")
MainTab:CreateLabel("攻撃: 縦振り斬撃")
MainTab:CreateLabel("ダメージ: 55 + Fling効果")

-- ========== 演出設定タブ ========== --

EffectTab:CreateSection("--- 召喚演出について ---")

EffectTab:CreateLabel("演出内容:")
EffectTab:CreateLabel("1. 上空に闇の背景が出現")
EffectTab:CreateLabel("2. 階段が生成される")
EffectTab:CreateLabel("3. 剣が階段を降りてくる")
EffectTab:CreateLabel("4. 着地時に衝撃波が発生")
EffectTab:CreateLabel("5. 剣がバックパックに追加")

local TestCutsceneButton = EffectTab:CreateButton({
   Name = "🎬 召喚演出のみをテスト再生",
   Callback = function()
        PlaySummonCutscene(game.Players.LocalPlayer)
   end,
})

-- 起動通知
Rayfield:Notify({
   Title = "🌑 影刃鍛造システム起動",
   Content = "完全オリジナル黒刃、縦振り攻撃、召喚演出実装済み",
   Duration = 5,
   Image = 4483362458,
})
