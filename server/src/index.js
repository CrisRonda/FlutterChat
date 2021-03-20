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
  console.log("START: POST /getoken");
  const { userId } = req.body;
  console.log("/getoken: ", req.body);

  try {
    if (userId) {
      console.log("/createUserToken: ", req.body);

      const userToken = client.createUserToken(userId);
      console.log("SUCCCESS: POST /getoken: ", req.body);
      res.status(200).send({ msj: "OK", token: userToken });
    } else {
      res.status(401).send({ error: "userId is required" });
    }
  } catch (error) {
    console.log("ERROR: POST /getoken", error);
    res.status(400).send({ error });
  }
});

app.listen(PORT, () => {
  console.log("ESCUCHANDO.....");
});
