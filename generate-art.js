// Void Resonance - A meditation on negative space
const { createCanvas } = require('canvas');
const canvas = createCanvas(1200, 1600);
const ctx = canvas.getContext('2d');

// Deep void background - not pure black but near-void
ctx.fillStyle = '#0a0a0c';
ctx.fillRect(0, 0, 1200, 1600);

// Subtle noise texture for depth
const imageData = ctx.getImageData(0, 0, 1200, 1600);
for (let i = 0; i < imageData.data.length; i += 4) {
  const noise = (Math.random() - 0.5) * 8;
  imageData.data[i] = Math.max(0, Math.min(255, imageData.data[i] + noise));
  imageData.data[i + 1] = Math.max(0, Math.min(255, imageData.data[i + 1] + noise));
  imageData.data[i + 2] = Math.max(0, Math.min(255, imageData.data[i + 2] + noise));
}
ctx.putImageData(imageData, 0, 0);

// The Void Resonance - concentric circles emanating light
const centerX = 600;
const centerY = 650;

// Perfect circles radiating outward - study in void and presence
const circles = [
  { radius: 280, alpha: 0.03, color: '26, 38, 59' },
  { radius: 220, alpha: 0.05, color: '34, 50, 78' },
  { radius: 160, alpha: 0.08, color: '52, 79, 129' },
  { radius: 110, alpha: 0.12, color: '78, 118, 183' },
  { radius: 70, alpha: 0.25, color: '116, 170, 230' },
  { radius: 40, alpha: 0.5, color: '174, 210, 255' },
  { radius: 15, alpha: 0.9, color: '220, 240, 255' },
];

circles.forEach(({ radius, alpha, color }) => {
  ctx.beginPath();
  ctx.arc(centerX, centerY, radius, 0, Math.PI * 2);
  ctx.fillStyle = `rgba(${color}, ${alpha})`;
  ctx.fill();
});

// Single luminous point at center
const gradient = ctx.createRadialGradient(centerX, centerY, 0, centerX, centerY, 20);
gradient.addColorStop(0, 'rgba(255, 255, 255, 0.95)');
gradient.addColorStop(0.5, 'rgba(200, 230, 255, 0.6)');
gradient.addColorStop(1, 'rgba(100, 150, 220, 0)');
ctx.beginPath();
ctx.arc(centerX, centerY, 20, 0, Math.PI * 2);
ctx.fillStyle = gradient;
ctx.fill();

// Golden thread - the only warm accent
ctx.beginPath();
ctx.moveTo(200, 1200);
ctx.bezierCurveTo(350, 1100, 450, 1250, 600, 1200);
ctx.bezierCurveTo(750, 1150, 850, 1300, 1000, 1200);
ctx.strokeStyle = 'rgba(212, 175, 55, 0.4)';
ctx.lineWidth = 0.5;
ctx.stroke();

// Grid lines suggesting measurement of void
ctx.strokeStyle = 'rgba(255, 255, 255, 0.03)';
ctx.lineWidth = 0.5;

// Horizontal
for (let y = 200; y < 1600; y += 150) {
  ctx.beginPath();
  ctx.moveTo(100, y);
  ctx.lineTo(1100, y);
  ctx.stroke();
}

// Vertical
for (let x = 150; x < 1200; x += 150) {
  ctx.beginPath();
  ctx.moveTo(x, 100);
  ctx.lineTo(x, 1500);
  ctx.stroke();
}

// Typography - monumental and silent
ctx.fillStyle = 'rgba(255, 255, 255, 0.9)';
ctx.font = 'bold 72px Georgia';
ctx.textAlign = 'center';
ctx.fillText('VOID', 600, 280);

ctx.fillStyle = 'rgba(255, 255, 255, 0.5)';
ctx.font = '18px Georgia';
ctx.letterSpacing = '8px';
ctx.fillText('R  E  S  O  N  A  N  C  E', 600, 320);

// Reference markers - like scientific notation for the invisible
ctx.fillStyle = 'rgba(255, 255, 255, 0.15)';
ctx.font = '10px monospace';
ctx.textAlign = 'left';
const markers = [
  { text: 'fig. 01', x: 100, y: 1450 },
  { text: 'observation: void as presence', x: 100, y: 1470 },
  { text: 'scale: 1:∞', x: 100, y: 1490 },
  { text: '2026', x: 1050, y: 1490 },
];
markers.forEach(({ text, x, y }) => {
  ctx.fillText(text, x, y);
});

// Final perfect circle outline - the only perfect geometry announced
ctx.beginPath();
ctx.arc(600, 650, 280, 0, Math.PI * 2);
ctx.strokeStyle = 'rgba(255, 255, 255, 0.08)';
ctx.lineWidth = 1;
ctx.stroke();

const fs = require('fs');
const buffer = canvas.toBuffer('image/png');
fs.writeFileSync('/Users/minimax/.openclaw/workspace/void-resonance.png', buffer);
console.log('Created void-resonance.png');
