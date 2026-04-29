// stratum-backend/routes/artwork.js
const express = require("express")
const router = express.Router()

router.get("/", (req, res) => {
  res.json({ message: "Get all artworks — connect database here" })
})

router.post("/", (req, res) => {
  res.json({ message: "Create artwork ledger — connect database here" })
})

module.exports = router
