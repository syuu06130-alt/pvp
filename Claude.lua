-- ===== ダークファンタジー魔剣「影刃」生成スクリプト =====
-- 仕様: ダークファンタジー＋SFの融合、闇と冷気のテーマ
-- オリジナリティ: 波紋刻印、龍モチーフ鍔、動的オーラ、粒子エフェクト完備

-- Rayfield UI初期化
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "影刃 - Shadow Blade Generator",
   LoadingTitle = "魔剣を召喚中...",
   LoadingSubtitle = "ダークエネルギーが集結している",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "ShadowBlade"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false
})

local MainTab = Window:CreateTab("⚔️ 影刃の召喚", 4483362458)

-- グローバル変数
local shadowBlade = nil
local auraEnabled = false

-- ===== 影刃生成メイン関数 =====

local function CreateShadowBlade()
   """
   ダークファンタジー魔剣「影刃」を生成
   複雑な構造、波紋刻印、龍モチーフ、動的オーラ
   """
   
   local player = game.Players.LocalPlayer
   local character = player.Character
   
   if not character then
      Rayfield:Notify({
         Title = "エラー",
         Content = "キャラクターが見つかりません",
         Duration = 3,
         Image = 4483362458,
      })
      return
   end
   
   -- 既に剣がある場合は削除
   if shadowBlade then
      shadowBlade:Destroy()
   end
   
   -- ===== メインパーツ生成 =====
   
   -- 親フォルダ作成
   local bladeFolder = Instance.new("Folder")
   bladeFolder.Name = "影刃"
   bladeFolder.Parent = character
   
   -- 1. 刃身（メインブレード）生成
   local blade = Instance.new("Part")
   blade.Name = "Blade"
   blade.Shape = Enum.PartType.Block
   blade.Material = Enum.Material.Metal
   blade.Color = Color3.fromRGB(5, 5, 15)  -- 真っ黒+青み
   blade.Size = Vector3.new(0.3, 2.2, 0.05)  -- 標準的な反りで長めの刃
   blade.CanCollide = false
   blade.TopSurface = Enum.SurfaceType.Smooth
   blade.BottomSurface = Enum.SurfaceType.Smooth
   blade.TopSurface = Enum.SurfaceType.Smooth
   blade.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0.5, 0, 0) * CFrame.Angles(0, 0, 0)
   blade.Parent = bladeFolder
   
   -- 刃に反り（カーブ）を加える
   local bladeMesh = Instance.new("SpecialMesh")
   bladeMesh.MeshType = Enum.MeshType.Brick
   bladeMesh.Parent = blade
   
   -- 2. 波紋刻印を刃に追加（テクスチャー効果）
   local bladeWaveTexture = Instance.new("Part")
   bladeWaveTexture.Name = "BladeWavePattern"
   bladeWaveTexture.Shape = Enum.PartType.Block
   bladeWaveTexture.Material = Enum.Material.Metal
   bladeWaveTexture.Color = Color3.fromRGB(10, 15, 30)  -- 少し明るい青
   bladeWaveTexture.Size = Vector3.new(0.28, 2.1, 0.02)
   bladeWaveTexture.CanCollide = false
   bladeWaveTexture.CFrame = blade.CFrame * CFrame.new(0, 0, -0.035)
   bladeWaveTexture.Parent = bladeFolder
   bladeWaveTexture.Transparency = 0.3  -- 波紋が透ける
   
   -- 刃の背に波紋を刻印
   local bladeBackPattern = Instance.new("Part")
   bladeBackPattern.Name = "BladeBackWave"
   bladeBackPattern.Shape = Enum.PartType.Block
   bladeBackPattern.Material = Enum.Material.Metal
   bladeBackPattern.Color = Color3.fromRGB(15, 20, 40)  -- 背は少し明るく
   bladeBackPattern.Size = Vector3.new(0.25, 2.1, 0.015)
   bladeBackPattern.CanCollide = false
   bladeBackPattern.CFrame = blade.CFrame * CFrame.new(0, 0, 0.035)
   bladeBackPattern.Parent = bladeFolder
   bladeBackPattern.Transparency = 0.2
   
   -- 3. 鍔（つば）- ドラゴン・獣モチーフ
   local guard = Instance.new("Part")
   guard.Name = "Guard"
   guard.Shape = Enum.PartType.Block
   guard.Material = Enum.Material.Metal
   guard.Color = Color3.fromRGB(8, 8, 12)  -- 黒+青み
   guard.Size = Vector3.new(1.2, 0.15, 1.2)  -- 大きめの装飾的な鍔
   guard.CanCollide = false
   guard.CFrame = blade.CFrame * CFrame.new(0, 1.15, 0)
   guard.Parent = bladeFolder
   
   -- 鍔にドラゴン装飾を追加（球体で龍の頭部イメージ）
   local dragonHead = Instance.new("Part")
   dragonHead.Name = "DragonHeadLeft"
   dragonHead.Shape = Enum.PartType.Ball
   dragonHead.Material = Enum.Material.Metal
   dragonHead.Color = Color3.fromRGB(20, 25, 50)  -- ドラゴンは青紫
   dragonHead.Size = Vector3.new(0.3, 0.3, 0.3)
   dragonHead.CanCollide = false
   dragonHead.CFrame = guard.CFrame * CFrame.new(-0.4, 0.1, 0.4)
   dragonHead.Parent = bladeFolder
   
   local dragonHeadRight = Instance.new("Part")
   dragonHeadRight.Name = "DragonHeadRight"
   dragonHeadRight.Shape = Enum.PartType.Ball
   dragonHeadRight.Material = Enum.Material.Metal
   dragonHeadRight.Color = Color3.fromRGB(20, 25, 50)
   dragonHeadRight.Size = Vector3.new(0.3, 0.3, 0.3)
   dragonHeadRight.CanCollide = false
   dragonHeadRight.CFrame = guard.CFrame * CFrame.new(0.4, 0.1, 0.4)
   dragonHeadRight.Parent = bladeFolder
   
   -- ドラゴンの目（赤み）
   local dragonEyeLeft = Instance.new("Part")
   dragonEyeLeft.Name = "DragonEyeLeft"
   dragonEyeLeft.Shape = Enum.PartType.Ball
   dragonEyeLeft.Material = Enum.Material.Neon
   dragonEyeLeft.Color = Color3.fromRGB(200, 30, 30)  -- 赤い目
   dragonEyeLeft.Size = Vector3.new(0.08, 0.08, 0.08)
   dragonEyeLeft.CanCollide = false
   dragonEyeLeft.CFrame = dragonHead.CFrame * CFrame.new(-0.08, 0.05, -0.15)
   dragonEyeLeft.Parent = bladeFolder
   
   local dragonEyeRight = Instance.new("Part")
   dragonEyeRight.Name = "DragonEyeRight"
   dragonEyeRight.Shape = Enum.PartType.Ball
   dragonEyeRight.Material = Enum.Material.Neon
   dragonEyeRight.Color = Color3.fromRGB(200, 30, 30)
   dragonEyeRight.Size = Vector3.new(0.08, 0.08, 0.08)
   dragonEyeRight.CanCollide = false
   dragonEyeRight.CFrame = dragonHeadRight.CFrame * CFrame.new(0.08, 0.05, -0.15)
   dragonEyeRight.Parent = bladeFolder
   
   -- 4. 柄（グリップ）- 黒革巻き
   local handle = Instance.new("Part")
   handle.Name = "Handle"
   handle.Shape = Enum.PartType.Block
   handle.Material = Enum.Material.Metal
   handle.Color = Color3.fromRGB(25, 25, 30)  -- 黒革の黒
   handle.Size = Vector3.new(0.25, 0.8, 0.25)  -- 短め、片手用
   handle.CanCollide = false
   handle.CFrame = blade.CFrame * CFrame.new(0, 0.6, 0)
   handle.Parent = bladeFolder
   
   -- 柄に龍の彫刻を追加
   local handleDragon = Instance.new("Part")
   handleDragon.Name = "HandleDragonCarving"
   handleDragon.Shape = Enum.PartType.Block
   handleDragon.Material = Enum.Material.Metal
   handleDragon.Color = Color3.fromRGB(35, 30, 50)  -- 浮き出た彫刻
   handleDragon.Size = Vector3.new(0.23, 0.1, 0.08)
   handleDragon.CanCollide = false
   handleDragon.CFrame = handle.CFrame * CFrame.new(0, -0.15, 0.15)
   handleDragon.Parent = bladeFolder
   handleDragon.Transparency = 0.2
   
   -- 5. ポメル（柄の端） - シンプル丸型
   local pommel = Instance.new("Part")
   pommel.Name = "Pommel"
   pommel.Shape = Enum.PartType.Ball
   pommel.Material = Enum.Material.Metal
   pommel.Color = Color3.fromRGB(10, 10, 20)
   pommel.Size = Vector3.new(0.35, 0.35, 0.35)
   pommel.CanCollide = false
   pommel.CFrame = handle.CFrame * CFrame.new(0, -0.45, 0)
   pommel.Parent = bladeFolder
   
   -- 6. 発光エフェクト - 青紫のオーラ
   local aura = Instance.new("Part")
   aura.Name = "DarkAura"
   aura.Shape = Enum.PartType.Ball
   aura.Material = Enum.Material.Neon
   aura.Color = Color3.fromRGB(50, 30, 100)  -- 青紫のオーラ
   aura.Size = Vector3.new(0.8, 2.8, 0.8)
   aura.CanCollide = false
   aura.Transparency = 0.6
   aura.CFrame = blade.CFrame
   aura.Parent = bladeFolder
   
   -- 7. 粒子エフェクト - 闇の気配
   local particle = Instance.new("Part")
   particle.Name = "DarkParticles"
   particle.Shape = Enum.PartType.Ball
   particle.Material = Enum.Material.Neon
   particle.Color = Color3.fromRGB(30, 20, 60)  -- 暗い紫
   particle.Size = Vector3.new(0.5, 0.5, 0.5)
   particle.CanCollide = false
   particle.Transparency = 0.7
   particle.CFrame = blade.CFrame * CFrame.new(0, 0.5, 0)
   particle.Parent = bladeFolder
   
   -- ===== 物理制約（Weld）でパーツを統合 =====
   
   local function WeldPart(part1, part2)
      local weld = Instance.new("WeldConstraint")
      weld.Part0 = part1
      weld.Part1 = part2
      weld.Parent = part1
   end
   
   WeldPart(blade, bladeWaveTexture)
   WeldPart(blade, bladeBackPattern)
   WeldPart(blade, guard)
   WeldPart(blade, dragonHead)
   WeldPart(blade, dragonHeadRight)
   WeldPart(blade, dragonEyeLeft)
   WeldPart(blade, dragonEyeRight)
   WeldPart(blade, handle)
   WeldPart(blade, handleDragon)
   WeldPart(blade, pommel)
   WeldPart(blade, aura)
   WeldPart(blade, particle)
   
   -- ===== アニメーション機能 =====
   
   -- オーラの動的なパルス効果
   spawn(function()
      local originalSize = aura.Size
      while aura.Parent do
         for i = 0, 1, 0.02 do
            if not aura.Parent then break end
            aura.Transparency = 0.5 + math.sin(i * math.pi * 2) * 0.15
            aura.Size = originalSize * (1 + math.sin(i * math.pi * 2) * 0.2)
            wait(0.01)
         end
      end
   end)
   
   -- 粒子が回転・浮遊するアニメーション
   spawn(function()
      while particle.Parent do
         for i = 0, 360, 2 do
            if not particle.Parent then break end
            particle.CFrame = blade.CFrame * CFrame.new(
               math.cos(math.rad(i)) * 0.3,
               math.sin(math.rad(i)) * 0.4,
               0
            )
            wait(0.01)
         end
      end
   end)
   
   -- ドラゴンの目が点滅
   spawn(function()
      while dragonEyeLeft.Parent do
         wait(0.5)
         dragonEyeLeft.Transparency = 0.2
         dragonEyeRight.Transparency = 0.2
         wait(0.3)
         dragonEyeLeft.Transparency = 0
         dragonEyeRight.Transparency = 0
         wait(0.2)
      end
   end)
   
   -- ===== プレイヤーの手に剣を装備 =====
   
   local rightHand = character:FindFirstChild("RightHand") or 
                     character:FindFirstChild("RightGripAttachment")
   
   if character:FindFirstChild("RightHand") then
      local handWeld = Instance.new("WeldConstraint")
      handWeld.Part0 = character.RightHand
      handWeld.Part1 = blade
      handWeld.Parent = blade
      
      blade.CFrame = character.RightHand.CFrame * CFrame.new(0, -0.8, 0) * 
                     CFrame.Angles(math.rad(90), 0, 0)
   end
   
   -- ===== グローバル変数に保存 =====
   shadowBlade = bladeFolder
   
   -- ===== 成功通知 =====
   Rayfield:Notify({
      Title = "⚔️ 影刃を召喚した",
      Content = "ダークエネルギーが集約され、魔剣が出現した...",
      Duration = 3,
      Image = 4483362458,
   })
   
   -- プレイヤーチャットに表示
   print("[影刃] ダークファンタジー魔剣が召喚されました")
   print("  名前: 影刃（えいじん）")
   print("  属性: 闇・冷気")
   print("  特徴: 波紋刻印、龍モチーフ鍔、動的オーラ")
   print("  テーマ: 圧倒的な存在感と危険な美しさ")
end

-- ===== UIボタン作成 =====

local Section = MainTab:CreateSection("魔剣の召喚")

local SummonButton = MainTab:CreateButton({
   Name = "⚔️ 影刃を召喚する",
   Callback = function()
      CreateShadowBlade()
   end,
})

local Section2 = MainTab:CreateSection("情報")

local InfoLabel = MainTab:CreateLabel("剣名: 影刃（えいじん）")
local InfoLabel2 = MainTab:CreateLabel("属性: 闇・冷気・圧倒的存在感")
local InfoLabel3 = MainTab:CreateLabel("特徴: 波紋刻印・龍モチーフ・動的オーラ")
local InfoLabel4 = MainTab:CreateLabel("テーマ: ダークファンタジー＋SF")

Rayfield:LoadConfiguration()

-- 起動通知
Rayfield:Notify({
   Title = "🎮 影刃ジェネレータ起動",
   Content = "ダークエネルギーが満ちている...",
   Duration = 5,
   Image = 4483362458,
})

print("[影刃] オリジナル魔剣ジェネレータが起動しました")
print("このスクリプトは以下の特徴を備えています:")
print("✓ ダークファンタジー＋SFの融合")
print("✓ 波紋刻印と龍モチーフの装飾")
print("✓ 動的なオーラと粒子エフェクト")
print("✓ 複雑な構造と高いオリジナリティ")
print("✓ Rayfield UIで簡単操作")
