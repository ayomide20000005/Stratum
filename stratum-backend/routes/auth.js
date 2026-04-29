// stratum-backend/routes/auth.js
const express = require("express")
const router = express.Router()

router.post("/register", (req, res) => {
  res.json({ message: "Register endpoint — connect Supabase auth here" })
})

router.post("/login", (req, res) => {
  res.json({ message: "Login endpoint — connect Supabase auth here" })
})

module.exports = router
