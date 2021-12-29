if not game:IsLoaded() then
   game.Loaded:Wait()
end

if game.PlaceId == 6875469709 then
   local player = game:GetService("Players").LocalPlayer
   player.CharacterAdded:wait()
   local desc = game:GetService("Workspace").Map.Stages.Boosts[tostring(player.leaderstats.WORLD.Value)]:GetDescendants()
   local num = #desc

   local function collect()
      task.spawn(function()
         while task.wait() and num > 0 do
            for i,v in pairs(game:GetService("Workspace").Map.Stages.Boosts[game:GetService("Players").LocalPlayer.leaderstats.WORLD.Value]:GetChildren()) do
               if v:IsA("Model") and v.Parent ~= nil then
                  if tonumber(v.Parent.Name) == player.leaderstats.WORLD.Value then
                     task.wait(0.35)
                     firetouchinterest(player.Character:WaitForChild("HumanoidRootPart"), v.PrimaryPart, 0)
                     num = #desc
                  end
               end
            end
         end
      end)
   end
   collect()

   while task.wait() do
      game:GetService("ReplicatedStorage").RemoteEvent:FireServer({"WarpPlrToOtherMap", "Next"})
      game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui["Noti_Frame"].Visible = false
   end
end