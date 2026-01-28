-- ===== RemoteEvent活用スクリプト集 =====
-- Turtle-Spyで発見したRemoteEventを応用

print("[RemoteEvent活用スクリプト] 読み込み中...")

-- ===== 1. マップ改造スクリプト =====
local MapModScript = {}

function MapModScript:VisualizeCoveredAreas()
   """隠し要素を可視化"""
   local hiddenFolder = workspace:FindFirstChild("HiddenAreas")
   if hiddenFolder then
      for _, part in pairs(hiddenFolder:FindFirstChildOfClass("Model", true)) do
         part.Transparency = 0.3  -- 透明度を上げて見やすくする
         if part:FindFirstChild("CanCollide") then
            part.CanCollide = false  -- ウォークスルー可能に
         end
      end
      print("[マップ改造] 隠しエリアを可視化しました")
   end
end

function MapModScript:EnableFlyMode()
   """飛行モード有効化"""
   local player = game.Players.LocalPlayer
   local character = player.Character or player.CharacterAdded:Wait()
   local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
   
   local bodyVelocity = Instance.new("BodyVelocity")
   bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
   bodyVelocity.Parent = humanoidRootPart
   
   local flying = true
   local speed = 50
   
   game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
      if gameProcessed then return end
      if input.KeyCode == Enum.KeyCode.F then
         flying = not flying
         print("[飛行] " .. (flying and "ON" or "OFF"))
      end
   end)
   
   game:GetService("RunService").Heartbeat:Connect(function()
      if flying then
         local camera = workspace.CurrentCamera
         bodyVelocity.Velocity = camera.CFrame.LookVector * speed
      end
   end)
   
   print("[飛行モード] 有効化しました (Fキーで切り替え)")
end

-- ===== 2. リソース無限スクリプト =====
local ResourceScript = {}

function ResourceScript:InfiniteGold()
   """金を無限に増やす"""
   local player = game.Players.LocalPlayer
   local leaderstats = player:WaitForChild("leaderstats")
   local gold = leaderstats:WaitForChild("Gold")
   
   spawn(function()
      while true do
         wait(0.1)
         gold.Value = gold.Value + 100
      end
   end)
   print("[リソース] 無限ゴールドが有効です")
end

function ResourceScript:DuplicateItems()
   """アイテムを複製する"""
   local player = game.Players.LocalPlayer
   local character = player.Character or player.CharacterAdded:Wait()
   local backpack = player:WaitForChild("Backpack")
   
   local itemsToDuplicate = {}
   
   for _, item in pairs(backpack:GetChildren()) do
      if item:IsA("Tool") then
         table.insert(itemsToDuplicate, item)
      end
   end
   
   for _, item in pairs(itemsToDuplicate) do
      local clone = item:Clone()
      clone.Parent = backpack
      print("[複製] " .. item.Name .. " を複製しました")
   end
end

-- ===== 3. UI改造スクリプト =====
local UiScript = {}

function UiScript:CreateCustomMenu()
   """カスタムメニューを作成"""
   local screenGui = Instance.new("ScreenGui")
   screenGui.Name = "CustomMenu"
   screenGui.ResetOnSpawn = false
   
   local frame = Instance.new("Frame")
   frame.Name = "MenuFrame"
   frame.Size = UDim2.new(0, 300, 0, 400)
   frame.Position = UDim2.new(0.7, 0, 0.1, 0)
   frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
   frame.BorderSizePixel = 0
   frame.Parent = screenGui
   
   local title = Instance.new("TextLabel")
   title.Name = "Title"
   title.Text = "カスタムメニュー"
   title.TextColor3 = Color3.fromRGB(255, 255, 255)
   title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
   title.Size = UDim2.new(1, 0, 0, 40)
   title.BorderSizePixel = 0
   title.Parent = frame
   
   local button1 = Instance.new("TextButton")
   button1.Name = "Button1"
   button1.Text = "飛行モード"
   button1.TextColor3 = Color3.fromRGB(255, 255, 255)
   button1.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
   button1.Size = UDim2.new(0.9, 0, 0, 40)
   button1.Position = UDim2.new(0.05, 0, 0.15, 0)
   button1.BorderSizePixel = 0
   button1.Parent = frame
   
   button1.MouseButton1Click:Connect(function()
      print("[メニュー] 飛行モードがクリックされました")
   end)
   
   screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
   print("[UI] カスタムメニューを作成しました")
end

function UiScript:ShowPlayerStats()
   """プレイヤーステータスを画面表示"""
   local player = game.Players.LocalPlayer
   local screenGui = Instance.new("ScreenGui")
   
   local statsLabel = Instance.new("TextLabel")
   statsLabel.Name = "StatsLabel"
   statsLabel.Size = UDim2.new(0, 300, 0, 200)
   statsLabel.Position = UDim2.new(0, 10, 0, 10)
   statsLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
   statsLabel.BackgroundTransparency = 0.5
   statsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
   statsLabel.TextSize = 14
   statsLabel.TextXAlignment = Enum.TextXAlignment.Left
   statsLabel.TextYAlignment = Enum.TextYAlignment.Top
   statsLabel.Parent = screenGui
   
   game:GetService("RunService").Heartbeat:Connect(function()
      local character = player.Character
      if character then
         local humanoid = character:FindFirstChild("Humanoid")
         local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
         
         if humanoid and humanoidRootPart then
            statsLabel.Text = string.format(
               "プレイヤー: %s\nHP: %d/%d\n位置: (%.1f, %.1f, %.1f)\nスピード: %.1f",
               player.Name,
               humanoid.Health,
               humanoid.MaxHealth,
               humanoidRootPart.Position.X,
               humanoidRootPart.Position.Y,
               humanoidRootPart.Position.Z,
               humanoidRootPart.AssemblyLinearVelocity.Magnitude
            )
         end
      end
   end)
   
   screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
   print("[UI] ステータス表示を有効化しました")
end

-- ===== 4. ゲーム機構改造スクリプト =====
local GameScript = {}

function GameScript:DisableGravity()
   """重力を無効化"""
   local player = game.Players.LocalPlayer
   local character = player.Character or player.CharacterAdded:Wait()
   local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
   
   local bodyVelocity = Instance.new("BodyVelocity")
   bodyVelocity.MaxForce = Vector3.new(0, 0, 0)
   bodyVelocity.Parent = humanoidRootPart
   
   print("[物理] 重力が無効化されました")
end

function GameScript:SpeedUpGameplay(multiplier)
   """ゲームスピードを上げる"""
   game:GetService("RunService").Heartbeat:Connect(function()
      game.Workspace.Gravity = 196.2 * (1 + (multiplier - 1))
   end)
   print("[ゲーム] スピードが " .. multiplier .. "倍になりました")
end

function GameScript:AutoRespawn()
   """自動リスポーン機能"""
   local player = game.Players.LocalPlayer
   
   player.CharacterAdded:Connect(function(character)
      local humanoid = character:WaitForChild("Humanoid")
      humanoid.Died:Connect(function()
         print("[リスポーン] 3秒後に再スポーンします...")
         wait(3)
         player:LoadCharacter()
      end)
   end)
   print("[オート] 自動リスポーンが有効です")
end

-- ===== 5. デバッグスクリプト =====
local DebugScript = {}

function DebugScript:ListAllRemotes()
   """すべてのRemoteEventを表示"""
   local remoteStorage = game:GetService("ReplicatedStorage")
   local remotes = remoteStorage:FindFirstChild("Remotes")
   
   if remotes then
      print("\n[=== RemoteEvent一覧 ===]")
      for _, remote in pairs(remotes:GetChildren()) do
         print("  " .. remote.Name .. " (" .. remote.ClassName .. ")")
      end
      print("[=====================]\n")
   end
end

function DebugScript:MonitorValueChanges(instance, propertyName)
   """プロパティの変更を監視"""
   local previousValue = instance[propertyName]
   
   instance:GetPropertyChangedSignal(propertyName):Connect(function()
      local newValue = instance[propertyName]
      print("[監視] " .. propertyName .. ": " .. tostring(previousValue) .. " → " .. tostring(newValue))
      previousValue = newValue
   end)
end

function DebugScript:ProfilePerformance()
   """パフォーマンスを測定"""
   local stats = {}
   
   game:GetService("RunService").Heartbeat:Connect(function()
      local memory = collectgarbage("count")
      table.insert(stats, memory)
      
      if #stats > 60 then
         table.remove(stats, 1)
      end
      
      local avgMemory = 0
      for _, m in pairs(stats) do
         avgMemory = avgMemory + m
      end
      avgMemory = avgMemory / #stats
      
      print("[パフォーマンス] メモリ使用量: " .. string.format("%.2f", avgMemory) .. " KB")
   end)
end

-- ===== 使用例 =====

print("\n[=== RemoteEvent活用スクリプト集 ===]")
print("以下の関数が利用可能です:\n")
print("マップ改造:")
print("  MapModScript:VisualizeCoveredAreas()")
print("  MapModScript:EnableFlyMode()\n")
print("リソース:")
print("  ResourceScript:InfiniteGold()")
print("  ResourceScript:DuplicateItems()\n")
print("UI改造:")
print("  UiScript:CreateCustomMenu()")
print("  UiScript:ShowPlayerStats()\n")
print("ゲーム機構:")
print("  GameScript:DisableGravity()")
print("  GameScript:SpeedUpGameplay(1.5)")
print("  GameScript:AutoRespawn()\n")
print("デバッグ:")
print("  DebugScript:ListAllRemotes()")
print("  DebugScript:MonitorValueChanges(instance, 'PropertyName')")
print("  DebugScript:ProfilePerformance()\n")
print("[===================================]\n")

print("[✓] RemoteEvent活用スクリプト集を読み込みました")
