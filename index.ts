import express from "express";

const app = express();

app.get("/", (req, res) => {
  res.send("<h1>hello world<h1/>");
});

app.get("/health", (req, res) => {
  res.status(200).json({ message: "Tiger zinda hai..." });
});

app.listen(4000, () => {
  console.log("server is listening of port 4000");
});
