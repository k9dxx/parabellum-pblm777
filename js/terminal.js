const terminalBox = document.getElementById('terminal-box');
const historyDiv = document.getElementById('history');
const termInput = document.getElementById('term-input');

const commandsHelp = `Comandos disponíveis:
  help       - Exibe esta lista de comandos
  status     - Mostra o status atual da rede PBLM.777
  clear      - Limpa a tela do terminal
  whoami     - Exibe identidade da sessão atual
  scan       - Executa varredura de portas simulada
  secret     - Acessa área secreta do sistema`;

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
            return '[+] STATUS: Rede Operacional\n[+] Firewalls: Ativos\n[+] Criptografia: AES-256 (Ativa)';
        case 'clear':
            historyDiv.innerHTML = '';
            return '';
        case 'whoami':
            return 'root_operator [PBLM.777 Authorized Access]';
        case 'scan':
            return '[*] Iniciando varredura...\n[+] Porta 22 (SSH): Aberta\n[+] Porta 80 (HTTP): Segura\n[+] Porta 777 (PBLM Core): Criptografada';
        case 'secret':
            return '[!] ALERTA: Redirecionando para área segura... Faça login em /login.html';
        default:
            return `Comando não reconhecido: '${escapeHtml(cmd)}'. Digite 'help' para ajuda.`;
    }
}

function escapeHtml(text) {
    return text.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
}
