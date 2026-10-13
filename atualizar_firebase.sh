#!/bin/bash
API_KEY="AIzaSyAGeIG4QvCus6mDfX6R"
AUTH_DOMAIN="parabellum-pblm777.firebaseapp.com"
PROJECT_ID="parabellum-pblm777"
STORAGE_BUCKET="parabellum-pblm777.appspot.com"
SENDER_ID="1001374269945"
APP_ID="1:1001374269945:web:e0ca"

cat << 'INNER_LOGIN' > login.html
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
            apiKey: "$API_KEY",
            authDomain: "$AUTH_DOMAIN",
            projectId: "$PROJECT_ID",
            storageBucket: "$STORAGE_BUCKET",
            messagingSenderId: "$SENDER_ID",
            appId: "$APP_ID"
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
INNER_LOGIN

cat << 'INNER_DASH' > dashboard.html
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
            apiKey: "$API_KEY",
            authDomain: "$AUTH_DOMAIN",
            projectId: "$PROJECT_ID",
            storageBucket: "$STORAGE_BUCKET",
            messagingSenderId: "$SENDER_ID",
            appId: "$APP_ID"
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
INNER_DASH

echo "[+] Configurações do Firebase aplicadas com sucesso!"
git add login.html dashboard.html
git commit -m "fix: atualiza chaves reais do Firebase auth"
git push origin main
