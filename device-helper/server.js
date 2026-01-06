const express = require('express');
const os = require('os');

const app = express();
const PORT = 45673;

// ✅ CORS – allow everything (reduced security)
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET');
  res.setHeader('Access-Control-Allow-Headers', '*');
  next();
});

function getMacAddress() {
  const nets = os.networkInterfaces();
  for (const name of Object.keys(nets)) {
    for (const net of nets[name]) {
      if (!net.internal && net.mac && net.mac !== '00:00:00:00:00:00') {
        return net.mac;
      }
    }
  }
  return null;
}

app.get('/device-info', (req, res) => {
  res.json({ mac: getMacAddress() });
});

app.listen(PORT, '127.0.0.1', () => {
  console.log(`Device helper running at http://127.0.0.1:${PORT}`);
});