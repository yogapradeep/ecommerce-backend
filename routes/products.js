const express = require("express");
const router = express.Router();
const db = require("../db");

router.get("/", async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM products");
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res
      .status(500)
      .json({ error: "An error occurred while fetching products." });
  }
});

module.exports = router;
