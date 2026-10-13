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
