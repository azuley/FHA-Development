# Universal Roblox Exploit

**Versão:** 2.1.0  
**Criado por:** Mika  
**Compatível com:** Synapse X, KRNL, Script-Ware, Fluxus, e outros executors

## 📋 Descrição

Um exploit/script profissional para Roblox com interface gráfica completa, desenvolvido em Luau. Inclui diversas funcionalidades de hack, menu interativo e sistema de configuração.

## 🚀 Funcionalidades

### 🎮 Movimentação
- **Fly:** Sistema de voo completo (WASD + Espaço/Shift)
- **Noclip:** Atravessar paredes e objetos
- **Speed Hack:** Alterar velocidade de movimento
- **Jump Power:** Alterar força do pulo
- **Infinite Jump:** Pulo infinito (mantenha Espaço)

### 👁️ Visual
- **ESP:** Ver jogadores através das paredes
- **Chams:** (Em desenvolvimento)
- **Fullbright:** (Em desenvolvimento)

### 📍 Teleporte
- Teleporte para locais pré-definidos
- Teleporte para outros jogadores
- Sistema de seleção de alvo

### ⚙️ Sistema
- Interface gráfica arrastável
- Sistema de abas organizado
- Configurações salvas
- Keybind personalizável (RightControl padrão)
- Anti-AFK automático

## 🛠️ Instalação

### Método 1: Executor Direto
1. Abra o Roblox e entre em um jogo
2. Execute seu executor (Synapse, KRNL, etc.)
3. Cole o conteúdo de `UniversalExploit.lua` e execute

### Método 2: Loader
1. Execute `Loader.lua` primeiro
2. O loader detectará automaticamente seu executor
3. Carregará o exploit principal

## 🎯 Controles

| Tecla | Função |
|-------|--------|
| **RightControl** | Abrir/Fechar interface |
| **W/A/S/D** | Movimento (modo fly) |
| **Espaço** | Voar para cima / Pulo infinito |
| **Shift** | Voar para baixo |

## 📁 Estrutura de Arquivos

```
UniversalExploit/
├── UniversalExploit.lua  # Script principal
├── Loader.lua           # Carregador automático
└── README.md           # Esta documentação
```

## 🔧 Funções API (para desenvolvedores)

O script expõe funções úteis através do `getgenv()`:

```lua
-- Teleportar para jogador
UniversalExploitUtils:TeleportToPlayer("NomeDoJogador")

-- Alterar velocidade
UniversalExploitUtils:SetSpeed(100)

-- Alterar força do pulo
UniversalExploitUtils:SetJumpPower(150)
```

## ⚠️ Avisos

1. **Use por sua conta e risco**
2. Pode causar banimento em alguns jogos
3. Algumas funcionalidades podem não funcionar em todos os executors
4. Mantenha atualizado para evitar detecção

## 🔄 Atualizações

### v2.1.0
- Interface redesenhada
- Sistema de abas melhorado
- ESP otimizado
- Fly mais suave
- Sistema de configuração

### v2.0.0
- Recodificação completa
- Sistema modular
- Melhor performance
- Mais estável

## 🐛 Reportar Bugs

Problemas conhecidos:
1. ESP pode não funcionar em alguns jogos
2. Fly pode ser instável com alta latência
3. Interface pode sobrepor elementos do jogo

## 📝 Notas Técnicas

- Desenvolvido em Luau puro
- Compatível com a maioria dos executors
- Sistema de detecção automática
- Otimizado para performance
- Código limpo e comentado

## 👨‍💻 Para Desenvolvedores

O código está organizado em seções:
1. **Configuração:** Variáveis globais
2. **GUI:** Interface gráfica
3. **Features:** Funcionalidades do exploit
4. **Eventos:** Handlers e conexões
5. **Utils:** Funções auxiliares

## ⭐ Recursos Avançados

### Sistema de Fly
```lua
-- Usa BodyVelocity e BodyGyro
-- Controle por câmera
-- Velocidade ajustável
```

### Sistema ESP
```lua
-- Highlight + BillboardGui
-- Atualização em tempo real
-- Cores personalizáveis
```

### Sistema de Configuração
```lua
-- Configurações salvas
-- Keybinds personalizáveis
-- Tema claro/escuro
```

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Add nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto é para fins educacionais. Use com responsabilidade.

---

**Criado por Mika**  
**Última atualização:** 2024