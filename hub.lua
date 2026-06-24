-- Mathub - Version Basique
print("✅ Mathub chargé avec succès !")

-- Chargement de Rayfield UI (GUI gratuite et jolie)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ShaddowScripts/Rayfield/main/source"))()
local Window = Library:CreateWindow({
Name = "Mathub",
LoadingTitle = "Mathub",
LoadingSubtitle = "by toi",
ConfigurationSaving = false
})

local Tab = Window:CreateTab("Accueil", 4483362458)

Tab:CreateButton({
Name = "Test - Dire Bonjour",
Callback = function()
game.StarterGui:SetCore("SendNotification", {
Title = "Mathub";
Text = "Ça marche ! Bravo 🎉";
Duration = 5;
})
end
})

Tab:CreateButton({
Name = "Test - Speed",
Callback = function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end
})

print("Hub prêt !")
