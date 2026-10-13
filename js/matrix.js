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
