fetch('http://127.0.0.1:45673/device-info')
  .then(r => r.json())
  .then(console.log);