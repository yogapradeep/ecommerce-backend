const express = require("express");
const router = express.Router();
const db = require("../db");

router.post("/", async (req, res) => {
  const { name, email } = req.body;
  try {
    const result = await db.query(
      "INSERT INTO users (name, email) VALUES ($1, $2) RETURNING *",
      [name, email]
    );
    res.json(result.rows[0]);
  } catch (error) {
    console.error(error);
    res
      .status(500)
      .json({ error: "An error occurred while creating the user." });
  }
});

module.exports = router;
