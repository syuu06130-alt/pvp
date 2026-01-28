-- ============================================
-- 影刃 (Kage-Tetsu) - Shadow Blade Generator
-- オリジナルダークファンタジー仕様
-- ============================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ============================================
-- UI生成
-- ============================================
local Window = Rayfield:CreateWindow({
    Name = "影刃 - Shadow Blade",
    LoadingTitle = "影刃ジェネレーター",
    LoadingSubtitle = "闇の剣を召喚中...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ShadowBladeConfig",
        FileName = "config"
    },
    Icon = 0,
    Theme = "Dark"
})

-- ============================================
-- 剣生成メインロジック
-- ============================================

-- 剣パーツ生成関数
local function CreateShadowBlade()
    local player = game.Players.LocalPlayer
    if not player or not player.Character then return end
    
    local character = player.Character
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    -- =======================================
    -- 既存の剣を削除
    -- =======================================
    local existingSword = character:FindFirstChild("ShadowBlade")
    if existingSword then existingSword:Destroy() end
    
    -- =======================================
    -- 剣全体のグループ作成
    -- =======================================
    local Sword = Instance.new("Model")
    Sword.Name = "ShadowBlade"
    Sword.Parent = character
    
    -- =======================================
    -- 【刃部分】- 鏡面ブラック、波紋パターン
    -- =======================================
    local Blade = Instance.new("Part")
    Blade.Name = "Blade"
    Blade.Shape = Enum.PartType.Block
    Blade.Size = Vector3.new(0.3, 2.2, 0.05)
    Blade.Color = Color3.fromRGB(10, 15, 25)  -- 真っ黒+ほんのり青
    Blade.Material = Enum.Material.Metal
    Blade.CanCollide = true
    Blade.Parent = Sword
    
    -- 刃の光の反射調整（微かな青の光彩）
    local BladeTexture = Instance.new("SurfaceGui")
    BladeTexture.Parent = Blade
    BladeTexture.Face = Enum.NormalId.Top
    
    local BladeLabel = Instance.new("TextLabel")
    BladeLabel.BackgroundColor3 = Color3.fromRGB(30, 50, 80)
    BladeLabel.BackgroundTransparency = 0.85
    BladeLabel.Size = UDim2.new(1, 0, 1, 0)
    BladeLabel.Text = ""
    BladeLabel.Parent = BladeTexture
    
    -- 刃文（波紋）パターンを視覚的に表現
    local WavePattern = Instance.new("TextLabel")
    WavePattern.Text = "〜〜〜〜〜"  -- 波紋を表現
    WavePattern.TextColor3 = Color3.fromRGB(100, 130, 180)
    WavePattern.BackgroundTransparency = 1
    WavePattern.Size = UDim2.new(1, 0, 1, 0)
    WavePattern.Font = Enum.Font.GothamBold
    WavePattern.TextSize = 14
    WavePattern.TextStrokeTransparency = 0.5
    WavePattern.TextStrokeColor3 = Color3.fromRGB(20, 40, 70)
    WavePattern.Parent = BladeTexture
    
    -- =======================================
    -- 【刃の背部】- 波紋刻印入り
    -- =======================================
    local BladeBack = Instance.new("Part")
    BladeBack.Name = "BladeBack"
    BladeBack.Shape = Enum.PartType.Block
    BladeBack.Size = Vector3.new(0.2, 2.2, 0.03)
    BladeBack.Color = Color3.fromRGB(15, 20, 35)
    BladeBack.Material = Enum.Material.Metal
    BladeBack.Parent = Sword
    
    -- =======================================
    -- 【鍔（つば）】- ドラゴン・獣モチーフ
    -- =======================================
    local Guard = Instance.new("Part")
    Guard.Name = "Guard"
    Guard.Shape = Enum.PartType.Block
    Guard.Size = Vector3.new(1.2, 0.35, 0.4)
    Guard.Color = Color3.fromRGB(20, 25, 40)
    Guard.Material = Enum.Material.Metal
    Guard.CanCollide = true
    Guard.Parent = Sword
    
    -- 鍔の装飾（ドラゴン顔）
    local GuardDecor = Instance.new("SurfaceGui")
    GuardDecor.Parent = Guard
    GuardDecor.Face = Enum.NormalId.Top
    
    local DragonIcon = Instance.new("TextLabel")
    DragonIcon.Text = "🐉"  -- ドラゴンモチーフ
    DragonIcon.TextSize = 50
    DragonIcon.BackgroundTransparency = 1
    DragonIcon.Size = UDim2.new(1, 0, 1, 0)
    DragonIcon.Parent = GuardDecor
    
    -- =======================================
    -- 【柄（グリップ）】- 黒革巻き、龍彫刻
    -- =======================================
    local Handle = Instance.new("Part")
    Handle.Name = "Handle"
    Handle.Shape = Enum.PartType.Block
    Handle.Size = Vector3.new(0.35, 1.0, 0.3)
    Handle.Color = Color3.fromRGB(25, 15, 10)  -- 黒革色
    Handle.Material = Enum.Material.Leather
    Handle.CanCollide = false
    Handle.Parent = Sword
    
    -- 柄の彫刻装飾（龍パターン）
    local HandlePattern = Instance.new("SurfaceGui")
    HandlePattern.Parent = Handle
    HandlePattern.Face = Enum.NormalId.Front
    
    local RyuPattern = Instance.new("TextLabel")
    RyuPattern.Text = "竜"  -- 龍漢字
    RyuPattern.TextColor3 = Color3.fromRGB(100, 120, 150)
    RyuPattern.BackgroundTransparency = 1
    RyuPattern.Size = UDim2.new(1, 0, 0.5, 0)
    RyuPattern.Font = Enum.Font.GothamBold
    RyuPattern.TextSize = 32
    RyuPattern.Parent = HandlePattern
    
    local WaveMarkHandle = Instance.new("TextLabel")
    WaveMarkHandle.Text = "∿∿∿"  -- 波紋を表現
    WaveMarkHandle.TextColor3 = Color3.fromRGB(80, 100, 130)
    WaveMarkHandle.BackgroundTransparency = 1
    WaveMarkHandle.Size = UDim2.new(1, 0, 0.5, 0)
    WaveMarkHandle.Position = UDim2.new(0, 0, 0.5, 0)
    WaveMarkHandle.Font = Enum.Font.Gotham
    WaveMarkHandle.TextSize = 14
    WaveMarkHandle.Parent = HandlePattern
    
    -- =======================================
    -- 【ポメル】- シンプル丸型
    -- =======================================
    local Pommel = Instance.new("Part")
    Pommel.Name = "Pommel"
    Pommel.Shape = Enum.PartType.Ball
    Pommel.Size = Vector3.new(0.4, 0.4, 0.4)
    Pommel.Color = Color3.fromRGB(30, 20, 15)
    Pommel.Material = Enum.Material.Metal
    Pommel.CanCollide = false
    Pommel.Parent = Sword
    
    -- =======================================
    -- 【各パーツの位置配置】
    -- =======================================
    local guardY = 0
    local bladeY = guardY + 1.25
    local handleY = guardY - 0.65
    local pommelY = handleY - 0.6
    
    Guard.Position = humanoidRootPart.Position + Vector3.new(1.5, 0.8, 0)
    Blade.Position = Guard.Position + Vector3.new(0, bladeY, 0)
    BladeBack.Position = Blade.Position + Vector3.new(0, 0, 0.04)
    Handle.Position = Guard.Position + Vector3.new(0, handleY, 0)
    Pommel.Position = Handle.Position + Vector3.new(0, pommelY, 0)
    
    -- =======================================
    -- 【剣全体をプレイヤーの右手に装備】
    -- =======================================
    local RightHand = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Hand")
    if RightHand then
        local Weld = Instance.new("WeldConstraint")
        Weld.Part0 = RightHand
        Weld.Part1 = Guard
        Weld.Parent = Guard
    else
        -- フォールバック：HumanoidRootPartに接続
        local Weld = Instance.new("WeldConstraint")
        Weld.Part0 = humanoidRootPart
        Weld.Part1 = Guard
        Weld.Parent = Guard
    end
    
    -- =======================================
    -- 【闇のオーラエフェクト】
    -- =======================================
    local function CreateDarkAura()
        local auraParticles = Instance.new("ParticleEmitter")
        auraParticles.Parent = Blade
        auraParticles.Texture = "rbxasset://textures/Particles/smoke_main.dds"
        auraParticles.Rate = 15
        auraParticles.Lifetime = NumberRange.new(1.5, 2.5)
        auraParticles.Speed = NumberRange.new(0.5, 1.5)
        auraParticles.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 50, 100)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 15, 25))
        })
        auraParticles.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.5),
            NumberSequenceKeypoint.new(1, 1)
        })
        auraParticles.Rotation = NumberRange.new(0, 360)
        auraParticles.RotSpeed = NumberRange.new(-200, 200)
        auraParticles.Enabled = true
    end
    
    CreateDarkAura()
    
    -- =======================================
    -- 【発光効果】- 微かな青光
    -- =======================================
    local BlueGlow = Instance.new("PointLight")
    BlueGlow.Parent = Blade
    BlueGlow.Brightness = 0.5
    BlueGlow.Range = 10
    BlueGlow.Color = Color3.fromRGB(100, 130, 180)
    
    -- =======================================
    -- 【プレイヤーへの通知】
    -- =======================================
    Rayfield:Notify({
        Title = "影刃 - Shadow Blade",
        Content = "暗黒の剣『影刃』が現われた...",
        Duration = 3,
        Image = 0
    })
    
    -- デバッグ情報出力
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("【 影刃 (Kage-Tetsu) - Shadow Blade 】")
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("✓ 刃：鏡面ブラック (色: RGB 10, 15, 25)")
    print("✓ 刃文：波紋パターン (青みかかった反射)")
    print("✓ 鍔：ドラゴンモチーフ装飾")
    print("✓ 柄：黒革巻き (龍彫刻入り)")
    print("✓ ポメル：シンプル丸型")
    print("✓ オーラ：闇の気配 (パーティクル + 青光)")
    print("✓ 装備位置：右手")
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
end

-- ============================================
-- UIボタン作成
-- ============================================
local Tab = Window:CreateTab("剣生成", 0)

Tab:CreateButton({
    Name = "⚔️ 影刃を召喚する",
    Callback = function()
        CreateShadowBlade()
    end
})

-- ============================================
-- スクリプト情報タブ
-- ============================================
local InfoTab = Window:CreateTab("情報", 0)

InfoTab:CreateLabel("【影刃 - Shadow Blade】")
InfoTab:CreateLabel("世界観：ダークファンタジー＋SF")
InfoTab:CreateLabel("テーマ：闇と冷気、圧倒的な存在感")
InfoTab:CreateLabel("")
InfoTab:CreateLabel("仕様:")
InfoTab:CreateLabel("• 基本色：真っ黒＋青み")
InfoTab:CreateLabel("• 質感：鏡面ブラック＆冷たい金属感")
InfoTab:CreateLabel("• 刃：刀寄り、シャープで直線的")
InfoTab:CreateLabel("• 刃文：波紋パターン（背部にも）")
InfoTab:CreateLabel("• 鍔：大きめ装飾的、ドラゴンモチーフ")
InfoTab:CreateLabel("• 柄：黒革巻き、龍彫刻、波紋反映")
InfoTab:CreateLabel("• ポメル：シンプル丸型")
InfoTab:CreateLabel("• 特殊効果：闇のオーラ＋青光")

Rayfield:LoadConfiguration()
