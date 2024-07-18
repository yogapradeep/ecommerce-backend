const express = require("express");
const router = express.Router();
const db = require("../db");

router.post("/", async (req, res) => {
  const { amount, user_id, products } = req.body;

  try {
    await db.query("BEGIN");

    const orderResult = await db.query(
      "INSERT INTO orders (amount, user_id, created_at) VALUES ($1, $2, $3) RETURNING *",
      [amount, user_id, new Date()]
    );
    await db.query("COMMIT");

    await db.query("BEGIN");

    const orderId = orderResult.rows[0].id;
    console.log("Created Order ID:", orderId);

    const chairPromises = products.chairs.map((chair_id) => {
      console.log(`Inserting chair_id ${chair_id} for order_id ${orderId}`);
      return db.query(
        "INSERT INTO order_chairs (order_id, chair_id) VALUES ($1, $2)",
        [orderId, chair_id]
      );
    });

    const tablePromises = products.tables.map((table_id) => {
      console.log(`Inserting table_id ${table_id} for order_id ${orderId}`);
      return db.query(
        "INSERT INTO order_tables (order_id, table_id) VALUES ($1, $2)",
        [orderId, table_id]
      );
    });

    const topPromises = products.tops.map((top_id) => {
      console.log(`Inserting top_id ${top_id} for order_id ${orderId}`);
      return db.query(
        "INSERT INTO order_tops (order_id, top_id) VALUES ($1, $2)",
        [orderId, top_id]
      );
    });

    const allPromises = [...chairPromises, ...tablePromises, ...topPromises];
    console.log("Number of promises to resolve:", allPromises.length);

    await Promise.all(allPromises);

    await db.query("COMMIT");
    console.log("Transaction committed successfully");

    res.json(orderResult.rows[0]);
  } catch (error) {
    await db.query("ROLLBACK");
    console.error("Transaction rolled back due to error:", error);
    res
      .status(500)
      .json({ error: "An error occurred while creating the order." });
  }
});

module.exports = router;
