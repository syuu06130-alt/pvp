--[[
    剣名: 影刃 (Kageba) - Reforged Edition
    テーマ: ダークファンタジー × 近未来SF
    コンセプト: 圧倒的な存在感、危険で美しい黒き刃
    Author: Claude (Reforged)
]]

-- Rayfield UIのロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = "影刃 - Kageba Forge",
   LoadingTitle = "闇を鍛造中...",
   LoadingSubtitle = "by Shadow Forge Remastered",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "KagebaReforged"
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

-- 剣生成ロジック（超強化版）
local function CreateKagebaReforged()
    local Player = game.Players.LocalPlayer
    local Backpack = Player:WaitForChild("Backpack")
    local Character = Player.Character or Player.CharacterAdded:Wait()
    
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
    local Tool = Instance.new("Tool")
    Tool.Name = "影刃"
    Tool.RequiresHandle = true
    Tool.CanBeDropped = false
    Tool.Grip = CFrame.new(0, -1.5, 0) * CFrame.Angles(math.rad(-90), 0, 0)
    Tool.ToolTip = "【影刃】闇と冷気を纏う伝説の黒刃 | ダメージ: 45 | 特殊: 闇侵食"

    -- ========== ハンドル（柄部分）========== --
    local Handle = Instance.new("Part")
    Handle.Name = "Handle"
    Handle.Size = Vector3.new(0.25, 1.4, 0.25)
    Handle.Material = Enum.Material.Fabric
    Handle.Color = Color3.fromRGB(8, 8, 10)
    Handle.CanCollide = false
    Handle.Massless = true
    Handle.Parent = Tool

    -- 柄の装飾（龍模様彫刻）
    local HandleDecor = Instance.new("Part")
    HandleDecor.Size = Vector3.new(0.27, 1.35, 0.27)
    HandleDecor.Material = Enum.Material.SmoothPlastic
    HandleDecor.Color = Color3.fromRGB(15, 15, 20)
    HandleDecor.CanCollide = false
    HandleDecor.Massless = true
    HandleDecor.Parent = Handle
    
    local HandleMesh = Instance.new("SpecialMesh")
    HandleMesh.MeshType = Enum.MeshType.Cylinder
    HandleMesh.Scale = Vector3.new(1, 1, 1)
    HandleMesh.Parent = HandleDecor
    
    local HandleWeld = Instance.new("Weld")
    HandleWeld.Part0 = Handle
    HandleWeld.Part1 = HandleDecor
    HandleWeld.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, math.rad(90))
    HandleWeld.Parent = Handle

    -- 柄の波紋模様（青いライン）
    local HandlePattern = Instance.new("Part")
    HandlePattern.Size = Vector3.new(0.28, 1.3, 0.28)
    HandlePattern.Material = Enum.Material.Neon
    HandlePattern.Color = Color3.fromRGB(40, 70, 120)
    HandlePattern.Transparency = 0.8
    HandlePattern.CanCollide = false
    HandlePattern.Massless = true
    HandlePattern.Parent = Handle
    
    local PatternMesh = Instance.new("SpecialMesh")
    PatternMesh.MeshType = Enum.MeshType.Cylinder
    PatternMesh.Scale = Vector3.new(0.95, 0.9, 0.95)
    PatternMesh.Parent = HandlePattern
    
    local PatternWeld = Instance.new("Weld")
    PatternWeld.Part0 = Handle
    PatternWeld.Part1 = HandlePattern
    PatternWeld.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, math.rad(90))
    PatternWeld.Parent = Handle

    -- ========== ポメル（柄頭）========== --
    local Pommel = Instance.new("Part")
    Pommel.Shape = Enum.PartType.Ball
    Pommel.Size = Vector3.new(0.45, 0.45, 0.45)
    Pommel.Material = Enum.Material.Metal
    Pommel.Color = Color3.fromRGB(5, 5, 8)
    Pommel.Reflectance = 0.25
    Pommel.CanCollide = false
    Pommel.Massless = true
    Pommel.Parent = Handle
    
    local PommelWeld = Instance.new("Weld")
    PommelWeld.Part0 = Handle
    PommelWeld.Part1 = Pommel
    PommelWeld.C0 = CFrame.new(0, -0.85, 0)
    PommelWeld.Parent = Handle

    -- ========== 鍔（獣モチーフ）========== --
    local Guard = Instance.new("Part")
    Guard.Size = Vector3.new(1.5, 0.2, 0.5)
    Guard.Material = Enum.Material.Metal
    Guard.Color = Color3.fromRGB(12, 12, 18)
    Guard.Reflectance = 0.2
    Guard.CanCollide = false
    Guard.Massless = true
    Guard.Parent = Handle
    
    local GuardMesh = Instance.new("SpecialMesh")
    GuardMesh.MeshType = Enum.MeshType.FileMesh
    GuardMesh.MeshId = "rbxassetid://1082802"
    GuardMesh.Scale = Vector3.new(0.7, 0.35, 0.7)
    GuardMesh.Parent = Guard
    
    local GuardWeld = Instance.new("Weld")
    GuardWeld.Part0 = Handle
    GuardWeld.Part1 = Guard
    GuardWeld.C0 = CFrame.new(0, 0.7, 0) * CFrame.Angles(0, 0, math.rad(90))
    GuardWeld.Parent = Handle

    -- 鍔の装飾（獣の目のような発光）
    local GuardEye1 = Instance.new("Part")
    GuardEye1.Size = Vector3.new(0.15, 0.15, 0.15)
    GuardEye1.Shape = Enum.PartType.Ball
    GuardEye1.Material = Enum.Material.Neon
    GuardEye1.Color = Color3.fromRGB(100, 150, 255)
    GuardEye1.CanCollide = false
    GuardEye1.Massless = true
    GuardEye1.Parent = Guard
    
    local Eye1Weld = Instance.new("Weld")
    Eye1Weld.Part0 = Guard
    Eye1Weld.Part1 = GuardEye1
    Eye1Weld.C0 = CFrame.new(0.4, 0, 0)
    Eye1Weld.Parent = Guard
    
    local GuardEye2 = GuardEye1:Clone()
    GuardEye2.Parent = Guard
    local Eye2Weld = Instance.new("Weld")
    Eye2Weld.Part0 = Guard
    Eye2Weld.Part1 = GuardEye2
    Eye2Weld.C0 = CFrame.new(-0.4, 0, 0)
    Eye2Weld.Parent = Guard

    -- ========== 刃（鏡面ブラック・刀型）========== --
    local Blade = Instance.new("Part")
    Blade.Name = "Blade"
    Blade.Size = Vector3.new(0.18, 4.2, 0.7)
    Blade.Material = Enum.Material.Glass
    Blade.Color = Color3.fromRGB(3, 5, 10)
    Blade.Reflectance = 0.45
    Blade.Transparency = 0.05
    Blade.CanCollide = false
    Blade.Massless = true
    Blade.Parent = Handle
    
    local BladeMesh = Instance.new("SpecialMesh")
    BladeMesh.MeshType = Enum.MeshType.Wedge
    BladeMesh.Scale = Vector3.new(1, 1, 1)
    BladeMesh.Parent = Blade
    
    local BladeWeld = Instance.new("Weld")
    BladeWeld.Part0 = Handle
    BladeWeld.Part1 = Blade
    BladeWeld.C0 = CFrame.new(0, 3.1, 0) * CFrame.Angles(math.rad(180), 0, 0)
    BladeWeld.Parent = Handle

    -- 刃の波紋（刃文）エフェクト
    local BladeHamon = Instance.new("Part")
    BladeHamon.Size = Vector3.new(0.19, 4.1, 0.68)
    BladeHamon.Material = Enum.Material.Neon
    BladeHamon.Color = Color3.fromRGB(50, 100, 180)
    BladeHamon.Transparency = 0.75
    BladeHamon.CanCollide = false
    BladeHamon.Massless = true
    BladeHamon.Parent = Blade
    
    local HamonMesh = Instance.new("SpecialMesh")
    HamonMesh.MeshType = Enum.MeshType.Wedge
    HamonMesh.Scale = Vector3.new(0.98, 0.98, 0.98)
    HamonMesh.Parent = BladeHamon
    
    local HamonWeld = Instance.new("Weld")
    HamonWeld.Part0 = Blade
    HamonWeld.Part1 = BladeHamon
    HamonWeld.C0 = CFrame.new(0, 0, 0)
    HamonWeld.Parent = Blade

    -- 背の波紋刻印
    local BackPattern = Instance.new("Part")
    BackPattern.Size = Vector3.new(0.2, 3.8, 0.1)
    BackPattern.Material = Enum.Material.Neon
    BackPattern.Color = Color3.fromRGB(30, 60, 140)
    BackPattern.Transparency = 0.6
    BackPattern.CanCollide = false
    BackPattern.Massless = true
    BackPattern.Parent = Blade
    
    local BackWeld = Instance.new("Weld")
    BackWeld.Part0 = Blade
    BackWeld.Part1 = BackPattern
    BackWeld.C0 = CFrame.new(0.09, -0.2, 0)
    BackWeld.Parent = Blade

    -- ========== エフェクト群 ========== --
    
    -- 1. 青い光の反射（ポイントライト）
    local BladeLight = Instance.new("PointLight")
    BladeLight.Color = Color3.fromRGB(80, 140, 255)
    BladeLight.Range = 10
    BladeLight.Brightness = 2
    BladeLight.Shadows = true
    BladeLight.Parent = Blade

    -- 2. 闇のオーラ（黒い煙）
    local DarkAura = Instance.new("ParticleEmitter")
    DarkAura.Texture = "rbxassetid://243662263"
    DarkAura.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 5)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(10, 10, 20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }
    DarkAura.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(0.5, 1.2),
        NumberSequenceKeypoint.new(1, 2)
    })
    DarkAura.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.7),
        NumberSequenceKeypoint.new(0.3, 0.4),
        NumberSequenceKeypoint.new(1, 1)
    })
    DarkAura.Lifetime = NumberRange.new(1, 2.5)
    DarkAura.Rate = 25
    DarkAura.Speed = NumberRange.new(0.3, 1.5)
    DarkAura.SpreadAngle = Vector2.new(15, 15)
    DarkAura.Rotation = NumberRange.new(-180, 180)
    DarkAura.RotSpeed = NumberRange.new(-30, 30)
    DarkAura.LightEmission = 0
    DarkAura.ZOffset = -0.3
    DarkAura.Parent = Blade

    -- 3. 青い波紋粒子（SF感）
    local HamonParticle = Instance.new("ParticleEmitter")
    HamonParticle.Texture = "rbxassetid://241809795"
    HamonParticle.Color = ColorSequence.new(Color3.fromRGB(60, 150, 255))
    HamonParticle.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.08),
        NumberSequenceKeypoint.new(1, 0.15)
    })
    HamonParticle.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.2),
        NumberSequenceKeypoint.new(1, 1)
    })
    HamonParticle.Lifetime = NumberRange.new(0.5, 1)
    HamonParticle.Rate = 40
    HamonParticle.Speed = NumberRange.new(0.1, 0.5)
    HamonParticle.LightEmission = 1
    HamonParticle.LockedToPart = true
    HamonParticle.Parent = Blade

    -- 4. 斬撃軌跡（Trail）
    local Trail = Instance.new("Trail")
    Trail.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 140, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 60, 140)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }
    Trail.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(0.5, 0.6),
        NumberSequenceKeypoint.new(1, 1)
    })
    Trail.Lifetime = 0.5
    Trail.MinLength = 0.05
    Trail.LightEmission = 0.8
    Trail.LightInfluence = 0.2
    Trail.Enabled = false
    
    local Att0 = Instance.new("Attachment")
    Att0.Position = Vector3.new(0, 2, 0)
    Att0.Parent = Blade
    
    local Att1 = Instance.new("Attachment")
    Att1.Position = Vector3.new(0, -2, 0)
    Att1.Parent = Blade
    
    Trail.Attachment0 = Att0
    Trail.Attachment1 = Att1
    Trail.Parent = Blade

    -- ========== サウンド ========== --
    
    local EquipSound = Instance.new("Sound")
    EquipSound.SoundId = "rbxassetid://696495832"
    EquipSound.Volume = 0.8
    EquipSound.Parent = Handle

    local UnsheatheSound = Instance.new("Sound")
    UnsheatheSound.SoundId = "rbxassetid://566593606"
    UnsheatheSound.Volume = 0.6
    UnsheatheSound.Pitch = 0.9
    UnsheatheSound.Parent = Handle

    local SlashSound1 = Instance.new("Sound")
    SlashSound1.SoundId = "rbxassetid://12222095"
    SlashSound1.Volume = 1.2
    SlashSound1.Parent = Handle

    local SlashSound2 = Instance.new("Sound")
    SlashSound2.SoundId = "rbxassetid://566593606"
    SlashSound2.Volume = 1
    SlashSound2.Pitch = 1.1
    SlashSound2.Parent = Handle

    local HitSound = Instance.new("Sound")
    HitSound.SoundId = "rbxassetid://566593606"
    HitSound.Volume = 1.5
    HitSound.Pitch = 0.8
    HitSound.Parent = Handle

    -- ========== ツールイベント ========== --
    
    local IsAttacking = false
    local Combo = 0
    
    Tool.Equipped:Connect(function()
        EquipSound:Play()
        UnsheatheSound:Play()
        Trail.Enabled = true
        DarkAura.Rate = 40
        BladeLight.Brightness = 2.5
        
        -- 装備アニメーション
        local Humanoid = Character:FindFirstChild("Humanoid")
        if Humanoid then
            local Anim = Instance.new("Animation")
            Anim.AnimationId = "rbxassetid://507768375"
            local Track = Humanoid:LoadAnimation(Anim)
            Track:Play()
        end
    end)

    Tool.Unequipped:Connect(function()
        Trail.Enabled = false
        DarkAura.Rate = 25
        BladeLight.Brightness = 2
        IsAttacking = false
        Combo = 0
    end)

    Tool.Activated:Connect(function()
        if IsAttacking then return end
        IsAttacking = true
        
        Combo = Combo + 1
        if Combo > 3 then Combo = 1 end
        
        -- サウンド再生
        if Combo % 2 == 1 then
            SlashSound1:Play()
        else
            SlashSound2:Play()
        end
        
        -- 斬撃エフェクト強化
        BladeLight.Brightness = 4
        BladeLight.Color = Color3.fromRGB(150, 200, 255)
        
        -- アニメーション
        local Humanoid = Character:FindFirstChild("Humanoid")
        if Humanoid then
            local AnimIds = {
                "rbxassetid://507766388",
                "rbxassetid://507766666",
                "rbxassetid://507766951"
            }
            local Anim = Instance.new("Animation")
            Anim.AnimationId = AnimIds[Combo]
            local Track = Humanoid:LoadAnimation(Anim)
            Track:Play()
        end
        
        -- ヒット判定
        local Touched = {}
        local Connection
        Connection = Blade.Touched:Connect(function(hit)
            if hit.Parent and hit.Parent:FindFirstChild("Humanoid") and hit.Parent ~= Character then
                if not Touched[hit.Parent] then
                    Touched[hit.Parent] = true
                    local EnemyHumanoid = hit.Parent.Humanoid
                    
                    -- ダメージ（コンボで増加）
                    local Damage = 45 + (Combo * 5)
                    EnemyHumanoid:TakeDamage(Damage)
                    HitSound:Play()
                    
                    -- ヒットエフェクト（青黒い爆発）
                    local HitEffect = Instance.new("Part")
                    HitEffect.Size = Vector3.new(2, 2, 2)
                    HitEffect.Shape = Enum.PartType.Ball
                    HitEffect.Material = Enum.Material.Neon
                    HitEffect.Color = Color3.fromRGB(40, 80, 160)
                    HitEffect.Transparency = 0.3
                    HitEffect.Anchored = true
                    HitEffect.CanCollide = false
                    HitEffect.CFrame = hit.CFrame
                    HitEffect.Parent = workspace
                    
                    -- 闇侵食エフェクト
                    local DarkEffect = Instance.new("ParticleEmitter")
                    DarkEffect.Texture = "rbxassetid://243662263"
                    DarkEffect.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
                    DarkEffect.Size = NumberSequence.new(1.5)
                    DarkEffect.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.5),
                        NumberSequenceKeypoint.new(1, 1)
                    })
                    DarkEffect.Lifetime = NumberRange.new(0.5)
                    DarkEffect.Rate = 100
                    DarkEffect.Speed = NumberRange.new(3)
                    DarkEffect.SpreadAngle = Vector2.new(180, 180)
                    DarkEffect.Parent = HitEffect
                    DarkEffect.Enabled = true
                    
                    task.spawn(function()
                        for i = 0, 1, 0.1 do
                            HitEffect.Size = HitEffect.Size + Vector3.new(0.5, 0.5, 0.5)
                            HitEffect.Transparency = i
                            task.wait(0.05)
                        end
                        HitEffect:Destroy()
                    end)
                end
            end
        end)
        
        task.wait(0.6)
        
        -- エフェクトリセット
        BladeLight.Brightness = 2.5
        BladeLight.Color = Color3.fromRGB(80, 140, 255)
        
        if Connection then
            Connection:Disconnect()
        end
        
        IsAttacking = false
    end)

    -- バックパックに追加
    Tool.Parent = Backpack
    
    Rayfield:Notify({
        Title = "⚔️ 影刃 - 召喚完了",
        Content = "闇の力があなたの手に宿った。コンボ攻撃可能。",
        Duration = 4,
        Image = 4483362458,
    })
end

-- ========== UI ボタン ========== --

local SummonButton = Tab:CreateButton({
   Name = "⚔️ 影刃を召喚する",
   Callback = function()
        CreateKagebaReforged()
   end,
})

Tab:CreateSection("--- 剣の詳細 ---")

Tab:CreateLabel("名称: 影刃 (Kageba)")
Tab:CreateLabel("属性: 闇 × 冷気 × SF")
Tab:CreateLabel("基礎ダメージ: 45")
Tab:CreateLabel("特殊効果: 闇侵食（ヒット時）")
Tab:CreateLabel("コンボ: 3段階（ダメージ増加）")
Tab:CreateLabel("外見: 鏡面ブラック刀、青光波紋")

-- 起動通知
Rayfield:Notify({
   Title = "🌑 影刃鍛造システム起動",
   Content = "最高品質の闇の刃があなたを待つ...",
   Duration = 5,
   Image = 4483362458,
})
