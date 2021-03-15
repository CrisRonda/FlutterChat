const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const stream = require("getstream");

const app = express();
const PORT = process.env.PORT || 3000;

const client = stream.connect(process.env.API_KEY, process.env.API_SECRET);

app.use(cors());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);
app.use(bodyParser.json());

app.post("/getToken", (req, res) => {
  const { userId } = req.body;
  try {
    if (userId) {
      const userToken = client.createUserToken("the-user-id");
      res.status(200).send({ msj: "OK", token: userToken });
    } else {
      res.status(401).send({ error: "userId is required" });
    }
  } catch (error) {
    res.status(400).send({ error });
  }
});

app.listen(PORT, () => {
  console.log("ESCUCHANDO.....");
});
