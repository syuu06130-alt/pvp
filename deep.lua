-- Rayfield UI 初期化
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- プレイヤーサービスの取得
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- メインウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = "影刃 - 闇の神器",
   LoadingTitle = "影刃召喚システム",
   LoadingSubtitle = "闇と冷気の剣を召喚中...",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ShadowBlade",
      FileName = "Config"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
})

-- メインメニュータブ
local MainTab = Window:CreateTab("剣管理", 4483362458)

-- 剣生成セクション
local SwordSection = MainTab:CreateSection("影刃の召喚")

-- 剣を生成する関数
local function createShadowBlade()
    -- 既存の剣を削除
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        local existingSword = backpack:FindFirstChild("影刃")
        if existingSword then
            existingSword:Destroy()
        end
    end
    
    -- ツールオブジェクトの作成
    local tool = Instance.new("Tool")
    tool.Name = "影刃"
    tool.ToolTip = "闇と冷気を纏う威圧的な剣"
    tool.CanBeDropped = false
    
    -- ハンドル（握り部分）
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(0.4, 0.8, 0.4)
    handle.Material = Enum.Material.Neon
    handle.Color = Color3.fromRGB(5, 5, 15)
    handle.Reflectance = 0.3
    handle.Transparency = 0.1
    handle.Parent = tool
    
    -- 特殊効果（闇のオーラ）
    local aura = Instance.new("ParticleEmitter")
    aura.Name = "DarkAura"
    aura.Texture = "rbxassetid://242877747"
    aura.Color = ColorSequence.new(Color3.fromRGB(10, 10, 30))
    aura.Transparency = NumberSequence.new(0.5)
    aura.Size = NumberSequence.new(0.2, 0.5)
    aura.Lifetime = NumberRange.new(1, 2)
    aura.Rate = 15
    aura.Speed = NumberRange.new(0.5, 1)
    aura.Parent = handle
    
    -- 冷気のエフェクト
    local coldEffect = Instance.new("ParticleEmitter")
    coldEffect.Name = "ColdEffect"
    coldEffect.Texture = "rbxassetid://243483364"
    coldEffect.Color = ColorSequence.new(Color3.fromRGB(150, 200, 255))
    coldEffect.Transparency = NumberSequence.new(0.3)
    coldEffect.Size = NumberSequence.new(0.1, 0.3)
    coldEffect.Lifetime = NumberRange.new(0.5, 1)
    coldEffect.Rate = 10
    coldEffect.VelocityInheritance = 0
    coldEffect.Parent = handle
    
    -- 刃のメイン部分
    local blade = Instance.new("Part")
    blade.Name = "Blade"
    blade.Size = Vector3.new(0.3, 3, 0.1)
    blade.Material = Enum.Material.Neon
    blade.Color = Color3.fromRGB(0, 0, 0)
    blade.Reflectance = 0.8
    blade.Transparency = 0.05
    blade.Parent = tool
    
    -- 刃のメッシュ（刀型）
    local bladeMesh = Instance.new("SpecialMesh")
    bladeMesh.MeshType = Enum.MeshType.FileMesh
    bladeMesh.MeshId = "rbxassetid://1070946"
    bladeMesh.Scale = Vector3.new(0.2, 2, 0.05)
    bladeMesh.Parent = blade
    
    -- 表面の質感
    local surface = Instance.new("SurfaceAppearance")
    surface.ColorMap = "rbxasset://textures/StudioToolbox/Materials/CharcoalSmooth.png"
    surface.MetalnessMap = "rbxassetid://148992355"
    surface.RoughnessMap = "rbxassetid://148992394"
    surface.Parent = blade
    
    -- 刃先の細い部分
    local tip = Instance.new("WedgePart")
    tip.Name = "Tip"
    tip.Size = Vector3.new(0.3, 0.3, 0.1)
    tip.Material = Enum.Material.Neon
    tip.Color = Color3.fromRGB(0, 10, 30)
    tip.Reflectance = 0.9
    tip.Parent = tool
    
    -- 波紋模様の装飾
    local pattern = Instance.new("Part")
    pattern.Name = "Pattern"
    pattern.Size = Vector3.new(0.35, 2.5, 0.15)
    pattern.Material = Enum.Material.Neon
    pattern.Color = Color3.fromRGB(20, 40, 100)
    pattern.Transparency = 0.7
    pattern.Parent = tool
    
    local patternMesh = Instance.new("SpecialMesh")
    patternMesh.MeshType = Enum.MeshType.Sphere
    patternMesh.Scale = Vector3.new(1, 10, 0.1)
    patternMesh.Parent = pattern
    
    -- 鍔（ツバ）部分
    local guard = Instance.new("Part")
    guard.Name = "Guard"
    guard.Size = Vector3.new(0.8, 0.1, 0.8)
    guard.Material = Enum.Material.Neon
    guard.Color = Color3.fromRGB(10, 10, 30)
    guard.Reflectance = 0.4
    guard.Parent = tool
    
    local guardMesh = Instance.new("SpecialMesh")
    guardMesh.MeshType = Enum.MeshType.FileMesh
    guardMesh.MeshId = "rbxassetid://1071366" -- ドラゴンモチーフ風
    guardMesh.Scale = Vector3.new(0.3, 0.1, 0.3)
    guardMesh.Parent = guard
    
    -- 柄の装飾
    local handleDeco = Instance.new("Part")
    handleDeco.Name = "HandleDecoration"
    handleDeco.Size = Vector3.new(0.45, 0.7, 0.45)
    handleDeco.Material = Enum.Material.Neon
    handleDeco.Color = Color3.fromRGB(15, 20, 40)
    handleDeco.Transparency = 0.3
    handleDeco.Parent = tool
    
    -- ポメル（柄頭）
    local pommel = Instance.new("Part")
    pommel.Name = "Pommel"
    pommel.Shape = Enum.PartType.Ball
    pommel.Size = Vector3.new(0.5, 0.5, 0.5)
    pommel.Material = Enum.Material.Neon
    pommel.Color = Color3.fromRGB(0, 0, 10)
    pommel.Reflectance = 0.3
    pommel.Parent = tool
    
    -- パーツの位置調整
    local weld = Instance.new("Weld")
    weld.Part0 = handle
    weld.C0 = CFrame.new(0, 0, 0)
    
    -- 刃の接続
    local bladeWeld = Instance.new("Weld")
    bladeWeld.Part0 = handle
    bladeWeld.Part1 = blade
    bladeWeld.C0 = CFrame.new(0, 1.5, 0)
    bladeWeld.Parent = blade
    
    -- 刃先の接続
    local tipWeld = Instance.new("Weld")
    tipWeld.Part0 = blade
    tipWeld.Part1 = tip
    tipWeld.C0 = CFrame.new(0, 1.65, 0)
    tipWeld.Parent = tip
    
    -- 波紋模様の接続
    local patternWeld = Instance.new("Weld")
    patternWeld.Part0 = blade
    patternWeld.Part1 = pattern
    patternWeld.C0 = CFrame.new(0, 0, 0.05)
    patternWeld.Parent = pattern
    
    -- 鍔の接続
    local guardWeld = Instance.new("Weld")
    guardWeld.Part0 = handle
    guardWeld.Part1 = guard
    guardWeld.C0 = CFrame.new(0, 0.45, 0)
    guardWeld.Parent = guard
    
    -- 柄装飾の接続
    local handleDecoWeld = Instance.new("Weld")
    handleDecoWeld.Part0 = handle
    handleDecoWeld.Part1 = handleDeco
    handleDecoWeld.C0 = CFrame.new(0, 0, 0)
    handleDecoWeld.Parent = handleDeco
    
    -- ポメルの接続
    local pommelWeld = Instance.new("Weld")
    pommelWeld.Part0 = handle
    pommelWeld.Part1 = pommel
    pommelWeld.C0 = CFrame.new(0, -0.65, 0)
    pommelWeld.Parent = pommel
    
    -- ツールのアクティブ時の効果
    tool.Activated:Connect(function()
        -- 青みがかった光のエフェクト
        local slash = Instance.new("ParticleEmitter")
        slash.Texture = "rbxassetid://243483372"
        slash.Color = ColorSequence.new(Color3.fromRGB(50, 100, 255))
        slash.Size = NumberSequence.new(0.5, 1)
        slash.Lifetime = NumberRange.new(0.3, 0.5)
        slash.Rate = 50
        slash.Speed = NumberRange.new(5, 10)
        slash.Parent = blade
        
        wait(0.2)
        slash:Destroy()
    end)
    
    -- 剣を持った時の環境効果
    tool.Equipped:Connect(function()
        -- 冷気エフェクトの強化
        coldEffect.Rate = 25
        
        -- 画面に微かなブルーム効果を追加（簡易版）
        local lighting = game:GetService("Lighting")
        local originalBrightness = lighting.Brightness
        local originalExposure = lighting.ExposureCompensation
        
        lighting.Brightness = originalBrightness * 0.9
        lighting.ExposureCompensation = originalExposure - 0.1
        
        tool.Unequipped:Connect(function()
            coldEffect.Rate = 10
            lighting.Brightness = originalBrightness
            lighting.ExposureCompensation = originalExposure
        end)
    end)
    
    -- バックパックに追加
    tool.Parent = player.Backpack
    
    -- 通知
    Rayfield:Notify({
        Title = "影刃 召喚完了",
        Content = "闇と冷気の剣があなたのバックパックに追加されました",
        Duration = 6.5,
        Image = 4483362458,
        Actions = {
            Ignore = {
                Name = "了解",
                Callback = function()
                end
            },
        },
    })
    
    return tool
end

-- 剣生成ボタン
local SwordButton = MainTab:CreateButton({
    Name = "影刃を召喚する",
    Callback = function()
        createShadowBlade()
    end,
})

-- 情報セクション
local InfoSection = MainTab:CreateSection("剣の詳細情報")

-- 剣の説明ラベル
MainTab:CreateLabel("名前: 影刃")
MainTab:CreateLabel("基本色: 鏡面ブラック + 青み")
MainTab:CreateLabel("形状: 刀型、直線的、鋭利")
MainTab:CreateLabel("装飾: ドラゴン・獣モチーフ")
MainTab:CreateLabel("特殊効果: 闇の気配 + 冷気オーラ")
MainTab:CreateLabel("テーマ: 威圧感と圧倒的存在感")

-- 警告メッセージ
MainTab:CreateParagraph({
    Title = "警告",
    Content = "この剣は闇の力を宿しています。取り扱いには十分注意してください。"
})

-- Rayfield UI の読み込み完了通知
Rayfield:Notify({
    Title = "影刃システム 起動",
    Content = "システムが正常に起動しました。剣を召喚する準備ができています。",
    Duration = 5,
    Image = 4483362458,
})
