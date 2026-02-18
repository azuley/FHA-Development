-- Universal Exploit - Example Usage
-- Demonstra como usar o exploit em seus próprios scripts

print("Universal Exploit Example Usage")
print("===============================")

-- Método 1: Carregar o exploit completo
print("\n[Método 1] Carregar exploit completo:")

local function loadFullExploit()
    print("  Carregando UniversalExploit.lua...")
    
    -- Verificar se o arquivo existe
    if readfile and isfile and isfile("UniversalExploit.lua") then
        local exploitCode = readfile("UniversalExploit.lua")
        local exploitFunc, err = loadstring(exploitCode)
        
        if exploitFunc then
            local success, result = pcall(exploitFunc)
            if success then
                print("  ✅ Exploit carregado com sucesso!")
                return result -- Retorna a ScreenGui
            else
                warn("  ❌ Erro ao executar: " .. tostring(result))
                return nil
            end
        else
            warn("  ❌ Erro ao compilar: " .. tostring(err))
            return nil
        end
    else
        print("  ⚠️ Arquivo não encontrado, criando interface básica...")
        
        -- Criar interface básica
        local CoreGui = game:GetService("CoreGui")
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "ExampleExploitUI"
        ScreenGui.Parent = CoreGui
        
        local MainFrame = Instance.new("Frame")
        MainFrame.Size = UDim2.new(0, 300, 0, 200)
        MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
        MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        MainFrame.Parent = ScreenGui
        
        print("  ✅ Interface básica criada")
        return ScreenGui
    end
end

-- Método 2: Usar apenas funções específicas
print("\n[Método 2] Usar funções específicas:")

local ExploitAPI = {}

-- Função de voo
function ExploitAPI:Fly(enable, speed)
    speed = speed or 50
    
    if enable then
        print("  Ativando voo (velocidade: " .. speed .. ")")
        
        -- Implementação básica de voo
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        
        local flyBodyVelocity = Instance.new("BodyVelocity")
        local flyBodyGyro = Instance.new("BodyGyro")
        
        local char = LocalPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                flyBodyVelocity.Parent = hrp
                flyBodyGyro.Parent = hrp
                
                -- Configurações
                flyBodyVelocity.MaxForce = Vector3.new(40000, 40000, 40000)
                flyBodyGyro.MaxTorque = Vector3.new(40000, 40000, 40000)
                
                -- Conexão para atualizar
                local connection
                connection = RunService.Heartbeat:Connect(function()
                    if not char or not hrp then
                        connection:Disconnect()
                        return
                    end
                    
                    local camera = workspace.CurrentCamera
                    flyBodyGyro.CFrame = camera.CFrame
                    
                    local velocity = Vector3.new(0, 0, 0)
                    
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        velocity = velocity + (camera.CFrame.LookVector * speed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        velocity = velocity - (camera.CFrame.LookVector * speed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        velocity = velocity - (camera.CFrame.RightVector * speed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        velocity = velocity + (camera.CFrame.RightVector * speed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        velocity = velocity + Vector3.new(0, speed, 0)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                        velocity = velocity - Vector3.new(0, speed, 0)
                    end
                    
                    flyBodyVelocity.Velocity = velocity
                end)
                
                print("  ✅ Voo ativado")
                return {
                    Disconnect = function()
                        connection:Disconnect()
                        flyBodyVelocity:Destroy()
                        flyBodyGyro:Destroy()
                        print("  Voo desativado")
                    end
                }
            end
        end
        
        return nil
    else
        print("  Desativando voo")
        return true
    end
end

-- Função de noclip
function ExploitAPI:Noclip(enable)
    if enable then
        print("  Ativando noclip")
        
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local RunService = game:GetService("RunService")
        
        local connection
        connection = RunService.Stepped:Connect(function()
            local char = LocalPlayer.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        
        print("  ✅ Noclip ativado")
        return {
            Disconnect = function()
                connection:Disconnect()
                print("  Noclip desativado")
            end
        }
    else
        print("  Desativando noclip")
        return true
    end
end

-- Função de ESP
function ExploitAPI:ESP(enable, color)
    color = color or Color3.fromRGB(255, 50, 50)
    
    if enable then
        print("  Ativando ESP (cor: " .. tostring(color) .. ")")
        
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local espObjects = {}
        
        -- Criar ESP para jogadores existentes
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local char = player.Character
                if char then
                    local highlight = Instance.new("Highlight")
                    highlight.FillColor = color
                    highlight.FillTransparency = 0.5
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.Parent = char
                    
                    espObjects[player] = highlight
                end
            end
        end
        
        -- Monitorar novos jogadores
        local addedConnection = Players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function(char)
                if player ~= LocalPlayer then
                    local highlight = Instance.new("Highlight")
                    highlight.FillColor = color
                    highlight.FillTransparency = 0.5
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.Parent = char
                    
                    espObjects[player] = highlight
                end
            end)
        end)
        
        -- Monitorar jogadores saindo
        local removedConnection = Players.PlayerRemoving:Connect(function(player)
            if espObjects[player] then
                espObjects[player]:Destroy()
                espObjects[player] = nil
            end
        end)
        
        print("  ✅ ESP ativado para " .. (#Players:GetPlayers() - 1) .. " jogadores")
        
        return {
            Disconnect = function()
                addedConnection:Disconnect()
                removedConnection:Disconnect()
                
                for _, highlight in pairs(espObjects) do
                    highlight:Destroy()
                end
                
                print("  ESP desativado")
            end,
            ChangeColor = function(newColor)
                color = newColor
                for _, highlight in pairs(espObjects) do
                    highlight.FillColor = newColor
                end
                print("  Cor do ESP alterada")
            end
        }
    else
        print("  Desativando ESP")
        return true
    end
end

-- Função de teleporte
function ExploitAPI:Teleport(position)
    print("  Teleportando para: " .. tostring(position))
    
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local char = LocalPlayer.Character
    
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(position)
            print("  ✅ Teleportado com sucesso")
            return true
        end
    end
    
    print("  ❌ Falha no teleporte")
    return false
end

-- Função de velocidade
function ExploitAPI:SetSpeed(speed)
    print("  Definindo velocidade para: " .. speed)
    
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local char = LocalPlayer.Character
    
    if char then
        local humanoid = char:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = speed
            print("  ✅ Velocidade alterada")
            return true
        end
    end
    
    print("  ❌ Falha ao alterar velocidade")
    return false
end

-- Função de força do pulo
function ExploitAPI:SetJumpPower(power)
    print("  Definindo força do pulo para: " .. power)
    
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local char = LocalPlayer.Character
    
    if char then
        local humanoid = char:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.JumpPower = power
            print("  ✅ Força do pulo alterada")
            return true
        end
    end
    
    print("  ❌ Falha ao alterar força do pulo")
    return false
end

-- Método 3: Interface simples
print("\n[Método 3] Criar interface simples:")

function ExploitAPI:CreateSimpleUI()
    print("  Criando interface simples...")
    
    local CoreGui = game:GetService("CoreGui")
    local UserInputService = game:GetService("UserInputService")
    
    -- Tela principal
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SimpleExploitUI"
    ScreenGui.Parent = CoreGui
    
    -- Frame principal
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 250, 0, 300)
    MainFrame.Position = UDim2.new(0, 20, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui
    
    -- Título
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    Title.Text = "Simple Exploit UI"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.Font = Enum.Font.GothamBold
    Title.Parent = MainFrame
    
    -- Botões
    local buttons = {
        {"Fly", function() print("Fly clicked") end},
        {"Noclip", function() print("Noclip clicked") end},
        {"ESP", function() print("ESP clicked") end},
        {"Speed+", function() print("Speed+ clicked") end},
        {"Teleport", function() print("Teleport clicked") end}
    }
    
    for i, buttonData in ipairs(buttons) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0.9, 0, 0, 40)
        button.Position = UDim2.new(0.05, 0, 0, 50 + (i-1)*45)
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        button.Text = buttonData[1]
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 14
        button.Font = Enum.Font.Gotham
        
        button.MouseButton1Click:Connect(buttonData[2])
        button.Parent = MainFrame
    end
    
    -- Toggle key
    local toggleKey = Enum.KeyCode.RightControl
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == toggleKey then
            MainFrame.Visible = not MainFrame.Visible
        end
    end)
    
    print("  ✅ Interface criada (toggle com RightControl)")
    return ScreenGui
end

-- Exemplo de uso
print("\n[EXEMPLO] Usando a API:")

-- Criar interface
local simpleUI = ExploitAPI:CreateSimpleUI()

-- Ativar funções
local flyController = ExploitAPI:Fly(true, 50)
local espController = ExploitAPI:ESP(true, Color3.fromRGB(0, 255, 0))

-- Alterar configurações do personagem
ExploitAPI:SetSpeed(100)
ExploitAPI:SetJumpPower(100)

-- Teleportar
ExploitAPI:Teleport(Vector3.new(0, 100, 0))

-- Desativar depois de 10 segundos (exemplo)
print("\n[EXEMPLO] Desativando em 10 segundos...")

wait(10)

if flyController and flyController.Disconnect then
    flyController:Disconnect()
end

if espController and espController.Disconnect then
    espController:Disconnect()
end

-- Resetar configurações
ExploitAPI:SetSpeed(16)
ExploitAPI:SetJumpPower(50)

print("\n✅ Exemplo concluído!")
print("\nResumo:")
print("- Use loadFullExploit() para carregar tudo")
print("- Use ExploitAPI para funções específicas")
print("- Crie sua própria interface com CreateSimpleUI()")

-- Expor API globalmente
getgenv().ExploitAPI = ExploitAPI

return ExploitAPI