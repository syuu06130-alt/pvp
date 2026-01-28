--[[
    剣名: 影刃 (Kageba)
    テーマ: ダークファンタジー x 近未来SF
    Author: Gemini
]]

-- Rayfield UIのロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = "Shadow Blade Weaponry",
   LoadingTitle = "Forging Darkness...",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "ShadowBlade"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", 
      RememberJoins = true 
   },
   KeySystem = false, 
})

-- タブの作成
local Tab = Window:CreateTab("Armory", 4483362458) -- 剣のアイコン

-- 剣生成ロジック
local function CreateShadowBlade()
    local Player = game.Players.LocalPlayer
    local Backpack = Player:WaitForChild("Backpack")
    
    -- すでに持っている場合は削除（重複防止）
    if Backpack:FindFirstChild("影刃") or (Player.Character and Player.Character:FindFirstChild("影刃")) then
        Rayfield:Notify({
            Title = "Notification",
            Content = "You already wield the Shadow Blade.",
            Duration = 3,
            Image = 4483362458,
        })
        return
    end

    -- ツール本体
    local Tool = Instance.new("Tool")
    Tool.Name = "影刃"
    Tool.Grip = CFrame.new(0, -1.2, 0) * CFrame.Angles(0, math.pi, 0) -- 持ち位置調整
    Tool.ToolTip = "闇と冷気を纏う、伝説の黒き刃"

    -- ハンドル（柄＋刃の基部）
    local Handle = Instance.new("Part")
    Handle.Name = "Handle"
    Handle.Size = Vector3.new(1, 4, 1) -- ヒットボックス
    Handle.Transparency = 0 -- メッシュで上書きするため0だが、MeshIdで形状制御
    Handle.CanCollide = false
    Handle.Parent = Tool

    -- メッシュ（刀形状のベース）
    local Mesh = Instance.new("SpecialMesh")
    Mesh.MeshId = "rbxassetid://5624773824" -- 洗練された刀のメッシュID
    Mesh.TextureId = "" -- テクスチャを剥がして黒単色にする
    Mesh.Scale = Vector3.new(0.8, 0.8, 1.2) -- 少し長細く、鋭く
    Mesh.VertexColor = Vector3.new(0, 0, 0) -- 完全な黒
    Mesh.Parent = Handle

    -- 質感設定（鏡面ブラック、滑らかで冷たい金属感）
    Handle.Material = Enum.Material.Glass -- ガラス素材で光沢と透明感（SF感）を出す
    Handle.Color = Color3.fromRGB(5, 5, 8) -- ほぼ黒だが、わずかに青みを含ませる
    Handle.Reflectance = 0.3 -- 中程度の反射

    -- [[ SF・オーラエフェクト ]] --

    -- 1. 波紋（Hamon）の表現：刃に沿う青い光
    local EdgeLight = Instance.new("PointLight")
    EdgeLight.Color = Color3.fromRGB(50, 100, 255) -- 冷たい青
    EdgeLight.Range = 6
    EdgeLight.Brightness = 1.5
    EdgeLight.Shadows = true
    EdgeLight.Parent = Handle

    -- 2. 闇の気配（黒い煙）
    local DarkAura = Instance.new("ParticleEmitter")
    DarkAura.Texture = "rbxassetid://243662263" -- 煙テクスチャ
    DarkAura.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 30))
    }
    DarkAura.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.2),
        NumberSequenceKeypoint.new(1, 1.5)
    })
    DarkAura.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.8),
        NumberSequenceKeypoint.new(0.5, 0.5),
        NumberSequenceKeypoint.new(1, 1)
    })
    DarkAura.Lifetime = NumberRange.new(0.5, 1.2)
    DarkAura.Rate = 15
    DarkAura.Speed = NumberRange.new(0.5, 1)
    DarkAura.SpreadAngle = Vector2.new(0, 360)
    DarkAura.LightEmission = 0 -- 光を吸収するような黒
    DarkAura.ZOffset = -0.5
    DarkAura.Name = "Darkness"
    DarkAura.Parent = Handle

    -- 3. デジタル・波紋（青い粒子）
    local SciFiGlow = Instance.new("ParticleEmitter")
    SciFiGlow.Texture = "rbxassetid://241809795" -- キラキラ光る粒子
    SciFiGlow.Color = ColorSequence.new(Color3.fromRGB(0, 200, 255))
    SciFiGlow.Size = NumberSequence.new(0.05)
    SciFiGlow.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1)
    })
    SciFiGlow.Lifetime = NumberRange.new(0.3, 0.6)
    SciFiGlow.Rate = 20
    SciFiGlow.Speed = NumberRange.new(0, 0.1)
    SciFiGlow.LightEmission = 1 -- 発光
    SciFiGlow.LockedToPart = true -- 刃に張り付くような動き（波紋の表現）
    SciFiGlow.Name = "HamonSciFi"
    SciFiGlow.Parent = Handle

    -- サウンド（装備音・振る音）
    local EquipSound = Instance.new("Sound")
    EquipSound.SoundId = "rbxassetid://696495832" -- SFチックな抜刀音
    EquipSound.Volume = 1
    EquipSound.Parent = Handle

    local SlashSound = Instance.new("Sound")
    SlashSound.SoundId = "rbxassetid://566593606" --鋭い風切り音
    SlashSound.Volume = 1.5
    SlashSound.Parent = Handle

    -- 動作スクリプト（ローカル動作）
    -- 注: クライアントサイド生成のため、複雑なダメージ処理はゲームの仕様に依存しますが、
    -- ここでは振るモーションと音を再生する簡易機能を付与します。
    Tool.Equipped:Connect(function()
        EquipSound:Play()
        -- 装備時にオーラを強める
        DarkAura.Rate = 30
    end)

    Tool.Unequipped:Connect(function()
        DarkAura.Rate = 15
    end)

    Tool.Activated:Connect(function()
        SlashSound:Play()
        
        -- 振った瞬間の視覚効果（残像のような発光）
        local OriginalColor = EdgeLight.Color
        EdgeLight.Color = Color3.fromRGB(150, 255, 255)
        EdgeLight.Brightness = 3
        task.wait(0.1)
        EdgeLight.Color = OriginalColor
        EdgeLight.Brightness = 1.5

        -- 標準のアニメーション再生
        local Animation = Instance.new("Animation")
        Animation.AnimationId = "rbxassetid://15684346808" -- 汎用的なスラッシュアニメーション
        local Track = Player.Character.Humanoid:LoadAnimation(Animation)
        Track:Play()
    end)

    -- プレイヤーに渡す
    Tool.Parent = Backpack
    
    Rayfield:Notify({
        Title = "Weapon Forged",
        Content = "The Shadow Blade [影刃] is now yours.",
        Duration = 3,
        Image = 4483362458,
    })
end

-- ボタンの作成
local Button = Tab:CreateButton({
   Name = "Summon Shadow Blade [影刃]",
   Callback = function()
        CreateShadowBlade()
   end,
})

-- UIの通知
Rayfield:Notify({
   Title = "System Ready",
   Content = "Shadow Blade Script Loaded.",
   Duration = 5,
   Image = 4483362458,
})
