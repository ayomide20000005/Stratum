// stratum-backend/server.js
const express = require("express")
const app = express()

app.use(express.json())

app.use("/api/auth", require("./routes/auth"))
app.use("/api/artwork", require("./routes/artwork"))
app.use("/api/verify", require("./routes/verify"))

app.listen(3000, () => console.log("Stratum backend running on port 3000"))
