-- Находим игрока
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Ожидание появления персонажа
local character = player.Character or player.CharacterAdded:Wait()

-- Создаем новую часть (конус)
local cone = Instance.new("Part")
cone.Size = Vector3.new(1, 1, 1) -- Базовый размер
cone.BrickColor = BrickColor.new("White") -- Цвет (белый)
cone.Transparency = 0.3 -- Делаем конус слегка прозрачным
cone.Anchored = false
cone.CanCollide = false

-- Добавляем Mesh, чтобы форма была конусом
local mesh = Instance.new("SpecialMesh", cone)
mesh.MeshType = Enum.MeshType.FileMesh -- Используем файл Mesh
mesh.MeshId = "rbxassetid://1033714" -- ID стандартного конуса из библиотеки Roblox
mesh.Scale = Vector3.new(1.7, 1.1, 1.7) -- Уменьшенный размер конуса

-- Привязываем конус к голове
local weld = Instance.new("Weld")
weld.Part0 = character:FindFirstChild("Head") -- Привязываем к голове
weld.Part1 = cone
weld.C0 = CFrame.new(0, 0.90, 0) -- Регулировка позиции относительно головы

-- Присоединяем конус к персонажу
cone.Parent = character
weld.Parent = cone

-- Добавляем Highlight для подсветки конуса
local highlight = Instance.new("Highlight", cone)
highlight.Name = "ConeHighlight"
highlight.FillColor = Color3.fromRGB(255, 105, 180) -- Розовый цвет
highlight.FillTransparency = 0.5 -- Прозрачность (0 - непрозрачно, 1 - полностью прозрачно)
highlight.OutlineColor = Color3.fromRGB(255, 105, 180) -- Розовый контур
highlight.OutlineTransparency = 0 -- Контур непрозрачный
