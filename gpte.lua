-- Rayfield UI統合スクリプト
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- UIウィンドウ作成
local Window = Rayfield:CreateWindow({
   Name = "影刃生成器",
   LoadingTitle = "影刃 Lua Generator",
   LoadingSubtitle = "Dark Fantasy + SF",
   ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "影刃設定"
   },
   Discord = {
       Enabled = false,
       Invite = "",
       RememberJoins = false
   }
})

-- 剣出現ボタン
Window:CreateButton({
   Name = "影刃を召喚",
   Callback = function()
       local player = game.Players.LocalPlayer
       local character = player.Character or player.CharacterAdded:Wait()

       -- 剣パーツ作成
       local sword = Instance.new("Tool")
       sword.Name = "影刃"
       sword.RequiresHandle = true
       sword.CanBeDropped = true

       local handle = Instance.new("Part")
       handle.Name = "Handle"
       handle.Size = Vector3.new(0.3, 4, 0.3)
       handle.Color = Color3.fromRGB(10,10,20) -- 真っ黒寄り青み
       handle.Material = Enum.Material.Metal
       handle.Reflectance = 0.3
       handle.TopSurface = Enum.SurfaceType.Smooth
       handle.BottomSurface = Enum.SurfaceType.Smooth
       handle.Parent = sword

       -- ブレードメッシュ
       local blade = Instance.new("SpecialMesh")
       blade.MeshType = Enum.MeshType.FileMesh
       blade.MeshId = "rbxassetid://0" -- 独自メッシュの場合は差し替え
       blade.TextureId = "rbxassetid://0" -- 刃文テクスチャ
       blade.Scale = Vector3.new(0.2,4,0.6)
       blade.Parent = handle

       -- 鍔（Guard）
       local guard = Instance.new("Part")
       guard.Name = "Guard"
       guard.Size = Vector3.new(1.5,0.3,0.5)
       guard.Color = Color3.fromRGB(5,5,15)
       guard.Material = Enum.Material.Metal
       guard.Reflectance = 0.4
       guard.Anchored = false
       guard.CanCollide = false
       guard.Parent = sword

       guard.CFrame = handle.CFrame * CFrame.new(0,1,0)

       -- 柄（Handle Decor）
       local grip = Instance.new("WedgePart")
       grip.Size = Vector3.new(0.4,1,0.4)
       grip.Color = Color3.fromRGB(0,0,0)
       grip.Material = Enum.Material.SmoothPlastic
       grip.Parent = sword
       grip.CFrame = handle.CFrame * CFrame.new(0,-2,0)

       -- ツール装備
       sword.Parent = player.Backpack

       -- 微かに闇オーラ
       local aura = Instance.new("PointLight")
       aura.Color = Color3.fromRGB(20,0,40)
       aura.Brightness = 0.5
       aura.Range = 6
       aura.Parent = handle

       print("影刃を召喚しました。")
   end
})
