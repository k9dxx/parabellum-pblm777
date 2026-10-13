#!/bin/bash
echo "[+] Atualizando o ecossistema PARABELLUM PBLM.777 para o nível supremo..."

# 1. Atualizar o CSS Global com animações Matrix, Glitch e Dark Red Supremo
cat << 'INNER_EOF' > css/style.css
:root {
    --bg-color: #030303;
    --card-bg: #080808;
    --primary-red: #ff003c;
    --dark-red: #60000a;
    --text-color: #f1f1f1;
    --text-muted: #888888;
    --border-color: #300008;
    --glow: 0 0 20px rgba(255, 0, 60, 0.5);
    --matrix-red: #ff1a40;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Courier New', Courier, monospace;
}

body {
    background-color: var(--bg-color);
    color: var(--text-color);
    overflow-x: hidden;
    position: relative;
}

/* Fundo Matrix Vermelho */
canvas#matrix-bg {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
    opacity: 0.15;
    pointer-events: none;
}

::-webkit-scrollbar {
    width: 6px;
}
::-webkit-scrollbar-track {
    background: var(--bg-color);
}
::-webkit-scrollbar-thumb {
    background: var(--primary-red);
    border-radius: 3px;
}

header {
    background: rgba(3, 3, 3, 0.9);
    backdrop-filter: blur(10px);
    border-bottom: 2px solid var(--primary-red);
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 30px;
    box-shadow: var(--glow);
}

.logo {
    color: var(--primary-red);
    font-weight: bold;
    font-size: 1.6rem;
    text-shadow: 0 0 10px var(--primary-red);
    text-decoration: none;
    letter-spacing: 3px;
}

nav ul {
    list-style: none;
    display: flex;
    gap: 15px;
    flex-wrap: wrap;
}

nav ul li a {
    color: var(--text-color);
    text-decoration: none;
    font-size: 0.85rem;
    transition: 0.3s;
    text-transform: uppercase;
    padding: 5px 10px;
    border-radius: 2px;
}

nav ul li a:hover, nav ul li a.active {
    color: #fff;
    background: var(--primary-red);
    box-shadow: var(--glow);
}

.container {
    max-width: 1200px;
    margin: 110px auto 50px auto;
    padding: 20px;
}

h1, h2 {
    color: var(--primary-red);
    text-transform: uppercase;
    margin-bottom: 20px;
    text-shadow: 0 0 12px rgba(255,0,60,0.4);
    letter-spacing: 2px;
}

.card {
    background-color: var(--card-bg);
    border: 1px solid var(--primary-red);
    padding: 25px;
    border-radius: 6px;
    box-shadow: var(--glow);
    margin-bottom: 20px;
    transition: 0.4s;
    position: relative;
    overflow: hidden;
}

.card:hover {
    transform: translateY(-3px);
    box-shadow: 0 0 30px rgba(255, 0, 60, 0.8);
    border-color: #ff3366;
}

.btn {
    background: transparent;
    color: var(--primary-red);
    border: 1px solid var(--primary-red);
    padding: 12px 25px;
    cursor: pointer;
    font-weight: bold;
    text-transform: uppercase;
    transition: 0.3s;
    box-shadow: var(--glow);
    display: inline-block;
    text-decoration: none;
    text-align: center;
    border-radius: 3px;
}

.btn:hover {
    background: var(--primary-red);
    color: #fff;
    box-shadow: 0 0 30px var(--primary-red);
}

input, textarea, select {
    width: 100%;
    padding: 12px;
    margin-bottom: 15px;
    background: #050505;
    border: 1px solid var(--dark-red);
    color: var(--text-color);
    border-radius: 4px;
    font-family: 'Courier New', Courier, monospace;
}

input:focus, textarea:focus {
    border-color: var(--primary-red);
    outline: none;
    box-shadow: var(--glow);
}

footer {
    text-align: center;
    padding: 25px;
    border-top: 1px solid var(--dark-red);
    color: var(--text-muted);
    font-size: 0.8rem;
    margin-top: 50px;
    background: #020202;
}

/* Efeito Glitch simples */
.glitch {
    position: relative;
    display: inline-block;
}
.glitch::after {
    content: attr(data-text);
    position: absolute;
    left: 2px;
    text-shadow: -2px 0 #ff003c;
    top: 0; color: #fff;
    background: var(--bg-color);
    overflow: clip;
    clip: rect(0, 900px, 0, 0);
    animation: noise-anim 2s infinite linear alternate-reverse;
}
@keyframes noise-anim {
    0% { clip: rect(12px, 9999px, 44px, 0); }
    50% { clip: rect(80px, 9999px, 2px, 0); }
    100% { clip: rect(30px, 9999px, 90px, 0); }
}
INNER_EOF

# 2. Script Matrix Global (js/matrix.js)
cat << 'INNER_EOF' > js/matrix.js
const canvas = document.createElement('canvas');
canvas.id = 'matrix-bg';
document.body.prepend(canvas);
const ctx = canvas.getContext('2d');

function resize() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
}
window.addEventListener('resize', resize);
resize();

const chars = 'PBLM77701ABCDEF0101XYZ⚡⚠️ROOT//SECURE';
const fontSize = 14;
let columns = canvas.width / fontSize;
const drops = [];
for (let i = 0; i < columns; i++) drops[i] = 1;

function drawMatrix() {
    ctx.fillStyle = 'rgba(3, 3, 3, 0.08)';
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    ctx.fillStyle = '#ff003c';
    ctx.font = fontSize + 'px monospace';

    for (let i = 0; i < drops.length; i++) {
        const text = chars.charAt(Math.floor(Math.random() * chars.length));
        ctx.fillText(text, i * fontSize, drops[i] * fontSize);
        if (drops[i] * fontSize > canvas.height && Math.random() > 0.975) drops[i] = 0;
        drops[i]++;
    }
}
setInterval(drawMatrix, 35);
INNER_EOF

# 3. index.html supremo
cat << 'INNER_EOF' > index.html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PARABELLUM | PBLM.777 [SUPREME CORE]</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <a href="index.html" class="logo glitch" data-text="PBLM.777">PBLM.777</a>
        <nav>
            <ul>
                <li><a href="index.html" class="active">Início</a></li>
                <li><a href="perfis.html">Perfis</a></li>
                <li><a href="terminal.html">Terminal</a></li>
                <li><a href="noticias.html">Notícias</a></li>
                <li><a href="galeria.html">Galeria</a></li>
                <li><a href="ferramentas.html">Ferramentas</a></li>
                <li><a href="login.html">Acesso Restrito</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <div class="card" style="text-align: center; padding: 70px 20px;">
            <h1 style="font-size: 2.5rem; margin-bottom: 15px;">PARABELLUM PBLM.777</h1>
            <p style="color: var(--text-muted); margin-bottom: 35px; font-size: 1.2rem;">Ecossistema Avançado de Inteligência, Criptografia e Operações de Rede.</p>
            <div style="display: flex; justify-content: center; gap: 15px; flex-wrap: wrap;">
                <a href="terminal.html" class="btn">🚀 Acessar Terminal Hacker</a>
                <a href="ferramentas.html" class="btn" style="background: var(--dark-red);">⚙️ Utilitários Core</a>
                <a href="login.html" class="btn">🔐 Painel Seguro</a>
            </div>
        </div>

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px;">
            <div class="card">
                <h3>⚡ Status da Rede</h3>
                <p style="color: #00ff66; margin-top: 10px;">[ONLINE] Servidores criptografados operando com zero latência em nós descentralizados.</p>
            </div>
            <div class="card">
                <h3>🛡️ Blindagem de Dados</h3>
                <p style="color: var(--text-muted); margin-top: 10px;">Protocolos de segurança integrados via Firebase Auth e túneis seguros AES-256.</p>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 PARABELLUM PBLM.777. Operação Global Autorizada.</p>
    </footer>
    <script src="js/matrix.js"></script>
</body>
</html>
INNER_EOF

# 4. perfis.html supremo
cat << 'INNER_EOF' > perfis.html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfis e Cargos | PBLM.777</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <a href="index.html" class="logo">PBLM.777</a>
        <nav>
            <ul>
                <li><a href="index.html">Início</a></li>
                <li><a href="perfis.html" class="active">Perfis</a></li>
                <li><a href="terminal.html">Terminal</a></li>
                <li><a href="noticias.html">Notícias</a></li>
                <li><a href="galeria.html">Galeria</a></li>
                <li><a href="ferramentas.html">Ferramentas</a></li>
                <li><a href="login.html">Acesso Restrito</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>HIERARQUIA DE OPERADORES SUPREME</h2>
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px;">
            <div class="card">
                <span style="color: var(--primary-red); font-size: 0.8rem; font-weight: bold;">[RANK: 01]</span>
                <h3 style="margin-top: 5px;">ROOT.777</h3>
                <p style="color: var(--primary-red); font-size: 0.9rem; margin-bottom: 10px;">Cargo: Arquiteto Principal</p>
                <p style="color: var(--text-muted); font-size: 0.85rem;">Controle supremo de infraestrutura, arquitetura de sistemas e diretrizes centrais do núcleo.</p>
            </div>
            <div class="card">
                <span style="color: var(--primary-red); font-size: 0.8rem; font-weight: bold;">[RANK: 02]</span>
                <h3 style="margin-top: 5px;">PBLM_SEC_01</h3>
                <p style="color: var(--primary-red); font-size: 0.9rem; margin-bottom: 10px;">Cargo: Operador de Redes & Infra</p>
                <p style="color: var(--text-muted); font-size: 0.85rem;">Monitoramento avançado de firewalls, contrainteligência cibernética e mitigação de ameaças.</p>
            </div>
            <div class="card">
                <span style="color: var(--primary-red); font-size: 0.8rem; font-weight: bold;">[RANK: 03]</span>
                <h3 style="margin-top: 5px;">GHOST_NODE</h3>
                <p style="color: var(--primary-red); font-size: 0.9rem; margin-bottom: 10px;">Cargo: Engenheiro de Software</p>
                <p style="color: var(--text-muted); font-size: 0.85rem;">Desenvolvimento de automações, interfaces imersivas e integração de protocolos de segurança.</p>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 PARABELLUM PBLM.777</p>
    </footer>
    <script src="js/matrix.js"></script>
</body>
</html>
INNER_EOF

# 5. terminal.html supremo com comandos imersivos e sons simulados
cat << 'INNER_EOF' > terminal.html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terminal Avançado | PBLM.777</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .terminal-box {
            background: rgba(0, 0, 0, 0.85);
            border: 1px solid var(--primary-red);
            height: 480px;
            padding: 20px;
            overflow-y: auto;
            font-family: 'Courier New', Courier, monospace;
            box-shadow: var(--glow);
            margin-bottom: 15px;
            border-radius: 4px;
        }
        .terminal-output {
            color: #00ff66;
            white-space: pre-wrap;
            margin-bottom: 10px;
            line-height: 1.5;
        }
        .terminal-input-line {
            display: flex;
            align-items: center;
        }
        .prompt-symbol {
            color: var(--primary-red);
            margin-right: 10px;
            font-weight: bold;
        }
        .terminal-input-line input {
            background: transparent;
            border: none;
            color: #00ff66;
            font-family: 'Courier New', Courier, monospace;
            font-size: 1rem;
            margin-bottom: 0;
            padding: 0;
        }
        .terminal-input-line input:focus {
            box-shadow: none;
            outline: none;
        }
    </style>
</head>
<body>
    <header>
        <a href="index.html" class="logo">PBLM.777</a>
        <nav>
            <ul>
                <li><a href="index.html">Início</a></li>
                <li><a href="perfis.html">Perfis</a></li>
                <li><a href="terminal.html" class="active">Terminal</a></li>
                <li><a href="noticias.html">Notícias</a></li>
                <li><a href="galeria.html">Galeria</a></li>
                <li><a href="ferramentas.html">Ferramentas</a></li>
                <li><a href="login.html">Acesso Restrito</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>CONSOLE DE COMANDO AVANÇADO // PBLM.777</h2>
        <div class="terminal-box" id="terminal-box">
            <div class="terminal-output">PARABELLUM Kernel v7.7.7-SUPREME [Secure Shell initialized]
Digite 'help' para listar os comandos operacionais disponíveis.
------------------------------------------------------------</div>
            <div id="history"></div>
        </div>
        <div class="terminal-input-line card" style="padding: 12px 18px; margin-bottom: 0;">
            <span class="prompt-symbol">root@pblm777:~$</span>
            <input type="text" id="term-input" autofocus autocomplete="off" placeholder="Digite um comando (ex: help, scan, ip, hack)...">
        </div>
    </div>

    <script src="js/matrix.js"></script>
    <script src="js/terminal.js"></script>
</body>
</html>
INNER_EOF

cat << 'INNER_EOF' > js/terminal.js
const terminalBox = document.getElementById('terminal-box');
const historyDiv = document.getElementById('history');
const termInput = document.getElementById('term-input');

const commandsHelp = `Comandos disponíveis no Sistema Supreme:
  help       - Exibe esta lista de comandos
  status     - Mostra o status atual da rede e nós PBLM.777
  clear      - Limpa a tela do terminal
  whoami     - Exibe identidade e privilégios da sessão atual
  scan       - Executa varredura profunda de portas e firewalls
  ip         - Exibe o endereço de IP simulado do nó atual
  hack       - Executa script de invasão simulada com bypass de root
  secret     - Acessa área secreta e restrita do núcleo`;

termInput.addEventListener('keydown', function(e) {
    if (e.key === 'Enter') {
        const cmd = termInput.value.trim();
        if (cmd === '') return;

        const cmdLine = document.createElement('div');
        cmdLine.innerHTML = `<span style="color:var(--primary-red);">root@pblm777:~$</span> ${escapeHtml(cmd)}`;
        historyDiv.appendChild(cmdLine);

        const respLine = document.createElement('div');
        respLine.className = 'terminal-output';
        respLine.innerHTML = processCommand(cmd);
        historyDiv.appendChild(respLine);

        termInput.value = '';
        terminalBox.scrollTop = terminalBox.scrollHeight;
    }
});

function processCommand(cmd) {
    switch(cmd.toLowerCase()) {
        case 'help':
            return commandsHelp;
        case 'status':
            return '[+] STATUS: Rede Operacional 100%\n[+] Firewalls: Blindados (AES-256)\n[+] Conexões Ativas: 777 nós descentralizados';
        case 'clear':
            historyDiv.innerHTML = '';
            return '';
        case 'whoami':
            return 'root_operator [PBLM.777 Highest Clearance Level]';
        case 'scan':
            return '[*] Iniciando varredura profunda...\n[+] Porta 22 (SSH): Segura\n[+] Porta 80 (HTTP): Ativa\n[+] Porta 777 (PBLM Core): Criptografada e Oculta\n[+] Nenhuma vulnerabilidade detectada.';
        case 'ip':
            return '[+] IP Público da Sessão: 192.168.77.7 [Rede Segura PBLM]';
        case 'hack':
            return '[!] INVASÃO SIMULADA: Executando payload...\n[████████████████████] 100%\n[+] Acesso root concedido com sucesso ao sub-núcleo!';
        case 'secret':
            return '[!] ALERTA: Redirecionando para área segura... Faça login em /login.html';
        default:
            return `Comando não reconhecido: '${escapeHtml(cmd)}'. Digite 'help' para ver os comandos válidos.`;
    }
}

function escapeHtml(text) {
    return text.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
}
INNER_EOF

# 6. noticias.html supremo
cat << 'INNER_EOF' > noticias.html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notícias | PBLM.777</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <a href="index.html" class="logo">PBLM.777</a>
        <nav>
            <ul>
                <li><a href="index.html">Início</a></li>
                <li><a href="perfis.html">Perfis</a></li>
                <li><a href="terminal.html">Terminal</a></li>
                <li><a href="noticias.html" class="active">Notícias</a></li>
                <li><a href="galeria.html">Galeria</a></li>
                <li><a href="ferramentas.html">Ferramentas</a></li>
                <li><a href="login.html">Acesso Restrito</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>BOLETINS DE INTELIGÊNCIA</h2>
        <div class="card">
            <span style="color: var(--text-muted); font-size: 0.8rem;">13.10.2026 // LOG: #777-SUPREME</span>
            <h3 style="margin-top: 5px;" class="glitch" data-text="Implantação do Núcleo Supreme v7.7.7">Implantação do Núcleo Supreme v7.7.7</h3>
            <p style="color: var(--text-muted); margin-top: 10px;">Atualização massiva de interface, com novos efeitos visuais imersivos, terminais aprimorados e segurança integrada Firebase.</p>
        </div>
        <div class="card">
            <span style="color: var(--text-muted); font-size: 0.8rem;">05.10.2026 // LOG: #777-B</span>
            <h3 style="margin-top: 5px;">Expansão dos Nós de Rede Descentralizados</h3>
            <p style="color: var(--text-muted); margin-top: 10px;">Novos comandos de varredura e resposta dinâmica foram incorporados ao console principal para operadores autorizados.</p>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 PARABELLUM PBLM.777</p>
    </footer>
    <script src="js/matrix.js"></script>
</body>
</html>
INNER_EOF

# 7. galeria.html supremo
cat << 'INNER_EOF' > galeria.html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Galeria | PBLM.777</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <a href="index.html" class="logo">PBLM.777</a>
        <nav>
            <ul>
                <li><a href="index.html">Início</a></li>
                <li><a href="perfis.html">Perfis</a></li>
                <li><a href="terminal.html">Terminal</a></li>
                <li><a href="noticias.html">Notícias</a></li>
                <li><a href="galeria.html" class="active">Galeria</a></li>
                <li><a href="ferramentas.html">Ferramentas</a></li>
                <li><a href="login.html">Acesso Restrito</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>REGISTROS VISUAIS CONFIDENCIAIS</h2>
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px;">
            <div class="card" style="text-align: center; padding: 50px 20px;">
                <p style="color: var(--primary-red); font-weight: bold; font-size: 1.1rem;">[ NODE_SCREEN_01 ]</p>
                <p style="color: var(--text-muted); font-size: 0.85rem; margin-top: 10px;">Visualização de fluxo de dados criptografados em tempo real.</p>
            </div>
            <div class="card" style="text-align: center; padding: 50px 20px;">
                <p style="color: var(--primary-red); font-weight: bold; font-size: 1.1rem;">[ NODE_SCREEN_02 ]</p>
                <p style="color: var(--text-muted); font-size: 0.85rem; margin-top: 10px;">Monitoramento de servidores e nós ativos na rede.</p>
            </div>
            <div class="card" style="text-align: center; padding: 50px 20px;">
                <p style="color: var(--primary-red); font-weight: bold; font-size: 1.1rem;">[ NODE_SCREEN_03 ]</p>
                <p style="color: var(--text-muted); font-size: 0.85rem; margin-top: 10px;">Arquitetura de rede isolada e segura PBLM.</p>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 PARABELLUM PBLM.777</p>
    </footer>
    <script src="js/matrix.js"></script>
</body>
</html>
INNER_EOF

# 8. ferramentas.html supremo com gerador de senha inteligente e Base64
cat << 'INNER_EOF' > ferramentas.html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ferramentas Avançadas | PBLM.777</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <a href="index.html" class="logo">PBLM.777</a>
        <nav>
            <ul>
                <li><a href="index.html">Início</a></li>
                <li><a href="perfis.html">Perfis</a></li>
                <li><a href="terminal.html">Terminal</a></li>
                <li><a href="noticias.html">Notícias</a></li>
                <li><a href="galeria.html">Galeria</a></li>
                <li><a href="ferramentas.html" class="active">Ferramentas</a></li>
                <li><a href="login.html">Acesso Restrito</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>UTILITÁRIOS SUPREME DE OPERAÇÃO</h2>
        
        <div class="card">
            <h3>Gerador de Chaves e Senhas Blindadas</h3>
            <p style="color: var(--text-muted); font-size: 0.85rem; margin-bottom: 15px;">Gere chaves aleatórias de alta complexidade com caracteres especiais.</p>
            <input type="text" id="pass-output" readonly placeholder="Clique no botão para gerar chave">
            <button class="btn" onclick="generatePass()">Gerar Chave Segura</button>
        </div>

        <div class="card">
            <h3>Codificador / Decodificador Base64</h3>
            <p style="color: var(--text-muted); font-size: 0.85rem; margin-bottom: 15px;">Converta textos normais em Base64 para transmissão segura.</p>
            <textarea id="b64-input" rows="3" placeholder="Digite o texto aqui..."></textarea>
            <div style="display: flex; gap: 10px;">
                <button class="btn" onclick="encodeB64()">Codificar</button>
                <button class="btn" style="background: var(--dark-red);" onclick="decodeB64()">Decodificar</button>
            </div>
        </div>
    </div>

    <script>
        function generatePass() {
            const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-=[]{}|;:,.<>?";
            let pass = "";
            for (let i = 0; i < 20; i++) {
                pass += chars.charAt(Math.floor(Math.random() * chars.length));
            }
            document.getElementById('pass-output').value = pass;
        }

        function encodeB64() {
            const val = document.getElementById('b64-input').value;
            try {
                document.getElementById('b64-input').value = btoa(val);
            } catch (e) {
                alert('Erro ao codificar.');
            }
        }

        function decodeB64() {
            const val = document.getElementById('b64-input').value;
            try {
                document.getElementById('b64-input').value = atob(val);
            } catch (e) {
                alert('Texto Base64 inválido.');
            }
        }
    </script>

    <footer>
        <p>&copy; 2026 PARABELLUM PBLM.777</p>
    </footer>
    <script src="js/matrix.js"></script>
</body>
</html>
INNER_EOF

# 9. login.html supremo
cat << 'INNER_EOF' > login.html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | PBLM.777</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <a href="index.html" class="logo">PBLM.777</a>
        <nav>
            <ul>
                <li><a href="index.html">Início</a></li>
                <li><a href="terminal.html">Terminal</a></li>
                <li><a href="login.html" class="active">Acesso Restrito</a></li>
            </ul>
        </nav>
    </header>

    <div class="container" style="max-width: 450px;">
        <div class="card">
            <h2>AUTENTICAÇÃO DE OPERADOR</h2>
            <form id="login-form">
                <label>E-mail:</label>
                <input type="email" id="email" required placeholder="operador@pblm777.net">
                
                <label>Senha:</label>
                <input type="password" id="password" required placeholder="********">

                <button type="submit" class="btn" style="width: 100%; margin-top: 10px;">Entrar no Sistema</button>
            </form>
            <p id="error-msg" style="color: var(--primary-red); margin-top: 15px; font-size: 0.9rem; text-align: center;"></p>
        </div>
    </div>

    <script type="module">
        import { initializeApp } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-app.js";
        import { getAuth, signInWithEmailAndPassword } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-auth.js";

        const firebaseConfig = {
            apiKey: "SUA_API_KEY",
            authDomain: "SEU_PROJETO.firebaseapp.com",
            projectId: "SEU_PROJETO",
            storageBucket: "SEU_PROJETO.appspot.com",
            messagingSenderId: "SEU_SENDER_ID",
            appId: "SEU_APP_ID"
        };

        const app = initializeApp(firebaseConfig);
        const auth = getAuth(app);

        document.getElementById('login-form').addEventListener('submit', async (e) => {
            e.preventDefault();
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const errorMsg = document.getElementById('error-msg');

            try {
                await signInWithEmailAndPassword(auth, email, password);
                window.location.href = 'dashboard.html';
            } catch (error) {
                errorMsg.innerText = "Erro de Acesso: " + error.message;
            }
        });
    </script>
    <script src="js/matrix.js"></script>
</body>
</html>
INNER_EOF

# 10. dashboard.html supremo
cat << 'INNER_EOF' > dashboard.html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel Seguro | PBLM.777</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <a href="index.html" class="logo">PBLM.777 // SEGURO</a>
        <nav>
            <ul>
                <li><a href="#" id="logout-btn" class="btn" style="padding: 5px 15px; font-size: 0.8rem;">Sair</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <div class="card">
            <h2>ÁREA RESTRITA DE OPERAÇÕES SUPREME</h2>
            <p>Bem-vindo ao painel confidencial. Acesso autorizado para <span id="user-email" style="color: var(--primary-red);"></span>.</p>
            <hr style="border-color: var(--dark-red); margin: 20px 0;">
            <p>Status do Nó: Conectado com sucesso ao banco de dados e autenticação segura do Firebase. Todos os sistemas operando sob criptografia total.</p>
        </div>
    </div>

    <script type="module">
        import { initializeApp } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-app.js";
        import { getAuth, onAuthStateChanged, signOut } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-auth.js";

        const firebaseConfig = {
            apiKey: "SUA_API_KEY",
            authDomain: "SEU_PROJETO.firebaseapp.com",
            projectId: "SEU_PROJETO",
            storageBucket: "SEU_PROJETO.appspot.com",
            messagingSenderId: "SEU_SENDER_ID",
            appId: "SEU_APP_ID"
        };

        const app = initializeApp(firebaseConfig);
        const auth = getAuth(app);

        onAuthStateChanged(auth, (user) => {
            if (user) {
                document.getElementById('user-email').innerText = user.email;
            } else {
                window.location.href = 'login.html';
            }
        });

        document.getElementById('logout-btn').addEventListener('click', () => {
            signOut(auth).then(() => {
                window.location.href = 'index.html';
            });
        });
    </script>
    <script src="js/matrix.js"></script>
</body>
</html>
INNER_EOF

echo "[+] Enviando atualizações supreme para o GitHub..."
git add .
git commit -m "feat: upgrade parabellum pblm777 to supreme version with matrix background and advanced tools"
git push origin main

echo "✅ PARABELLUM PBLM.777 SUPREME ATUALIZADO E ENVIADO COM SUCESSO!"
