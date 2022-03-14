const express = require('express');
const app = express();
app.use(express.static('vue/dist'));
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/vue/dist/index.html');
});
app.get('/video', (req, res) => {
  res.sendFile(__dirname + '/prototype/index.html');
});
const port = 7005;
app.listen(port, () => { console.log(`listening on port ${port}`); });