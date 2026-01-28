-- ===== PVP強化スクリプト (RemoteEvent応用例) =====
-- Turtle-Spyで発見したRemoteEventを活用

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- 設定
local PvpConfig = {
   enableDamageBoost = true,
   damagMultiplier = 10,  -- ダメージを10倍に
   enableSpeedBoost = true,
   speedMultiplier = 2,   -- 速度を2倍に
   enableESP = true,      -- 敵を可視化
   enableAutoAttack = false  -- 自動攻撃
}

-- ===== RemoteEvent検索 =====

local function findRemote(name)
   local remoteStorage = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
   if remoteStorage then
      return remoteStorage:FindFirstChild(name)
   end
   return nil
end

-- 重要なRemoteEventを取得
local combatRemote = findRemote("Combat")
local healthRemote = findRemote("TakeDamage")
local movementRemote = findRemote("Movement")

print("[PVP強化] RemoteEvent検索完了")
if combatRemote then print("  Combat: 見つかりました") end
if healthRemote then print("  TakeDamage: 見つかりました") end
if movementRemote then print("  Movement: 見つかりました") end

-- ===== ダメージブースト =====

if PvpConfig.enableDamageBoost and combatRemote then
   function DealDamage(enemy, baseDamage)
      local boostedDamage = baseDamage * PvpConfig.damagMultiplier
      combatRemote:FireServer(enemy, boostedDamage)
      print("[ダメージ] " .. baseDamage .. " → " .. boostedDamage)
   end
   
   -- 例: マウスクリック時に自動ダメージ
   local UserInputService = game:GetService("UserInputService")
   UserInputService.InputBegan:Connect(function(input, gameProcessed)
      if gameProcessed then return end
      
      if input.KeyCode == Enum.KeyCode.E then
         -- 最も近い敵を探す
         local nearestEnemy = nil
         local nearestDistance = math.huge
         
         for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
               local distance = (player.Character.HumanoidRootPart.Position - Character.HumanoidRootPart.Position).Magnitude
               if distance < nearestDistance then
                  nearestDistance = distance
                  nearestEnemy = player.Character
               end
            end
         end
         
         if nearestEnemy then
            DealDamage(nearestEnemy, 50)
         end
      end
   end)
end

-- ===== スピードブースト =====

if PvpConfig.enableSpeedBoost then
   local Humanoid = Character:FindFirstChild("Humanoid")
   if Humanoid then
      local originalWalkSpeed = Humanoid.WalkSpeed
      Humanoid.WalkSpeed = originalWalkSpeed * PvpConfig.speedMultiplier
      print("[スピード] WalkSpeed x" .. PvpConfig.speedMultiplier)
   end
end

-- ===== ESP (敵を可視化) =====

if PvpConfig.enableESP then
   local function createESP(player)
      if player == LocalPlayer then return end
      if not player.Character then return end
      
      local character = player.Character
      local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
      
      if humanoidRootPart then
         -- キャラの周りに透明な枠を追加
         local billboard = Instance.new("Part")
         billboard.Shape = Enum.PartType.Ball
         billboard.Material = Enum.Material.Neon
         billboard.CanCollide = false
         billboard.CFrame = humanoidRootPart.CFrame
         billboard.Size = Vector3.new(3, 3, 3)
         billboard.Transparency = 0.7
         billboard.Color = Color3.fromRGB(255, 0, 0)  -- 赤色
         billboard.Parent = humanoidRootPart
         
         -- プレイヤー名を表示
         local humanoidLabel = Instance.new("TextLabel")
         humanoidLabel.Name = "PlayerNameTag"
         humanoidLabel.Text = player.Name
         humanoidLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
         humanoidLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
         humanoidLabel.BackgroundTransparency = 0.3
         humanoidLabel.Size = UDim2.new(4, 0, 1, 0)
         humanoidLabel.Position = UDim2.new(-2, 0, -2, 0)
         humanoidLabel.Parent = billboard
         
         print("[ESP] " .. player.Name .. " を可視化しました")
      end
   end
   
   -- 既存プレイヤーにESPを追加
   for _, player in pairs(Players:GetPlayers()) do
      createESP(player)
   end
   
   -- 新規プレイヤーにESPを追加
   Players.PlayerAdded:Connect(function(player)
      wait(1)
      createESP(player)
   end)
end

-- ===== 自動攻撃 =====

if PvpConfig.enableAutoAttack and combatRemote then
   spawn(function()
      while true do
         wait(0.5)
         
         -- 最も近い敵を自動攻撃
         local nearestEnemy = nil
         local nearestDistance = math.huge
         
         for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
               local distance = (player.Character.HumanoidRootPart.Position - Character.HumanoidRootPart.Position).Magnitude
               if distance < 50 and distance < nearestDistance then
                  nearestDistance = distance
                  nearestEnemy = player.Character
               end
            end
         end
         
         if nearestEnemy then
            DealDamage(nearestEnemy, 25)
         end
      end
   end)
end

-- ===== ステータス表示 =====

print("\n[=== PVP強化スクリプト起動 ===]")
print("ダメージブースト: " .. (PvpConfig.enableDamageBoost and "ON" or "OFF"))
print("スピードブースト: " .. (PvpConfig.enableSpeedBoost and "ON" or "OFF"))
print("ESP: " .. (PvpConfig.enableESP and "ON" or "OFF"))
print("自動攻撃: " .. (PvpConfig.enableAutoAttack and "ON" or "OFF"))
print("\n操作:")
print("  E キー: 最も近い敵にダメージを与える")
print("[==========================]\n")

-- ===== クリーンアップ =====

LocalPlayer.CharacterAdded:Connect(function(newCharacter)
   Character = newCharacter
   Humanoid = Character:WaitForChild("Humanoid")
   print("[再スポーン] スクリプトが新しいキャラで再実行されました")
end)

print("[✓] PVP強化スクリプト初期化完了")
