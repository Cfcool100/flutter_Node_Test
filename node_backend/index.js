const app = require('./app');
const db = require('./config/db');
const UserModel = require('./models/user.model');

const port = process.env.PORT

app.get('/', (req, res) =>{
  res.send("hello world");
});

app.listen(port, () =>{
  console.log(`listening on port: http://localhost:${port}`);
});