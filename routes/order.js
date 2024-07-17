const express = require("express");
const router = express.Router();
const prisma = require("../prisma");

router.post("/", async (req, res) => {
  const { amount, user_id, products } = req.body;
  const order = await prisma.order.create({
    data: {
      amount,
      user_id,
      createdAt: new Date(),
      chairs: {
        create: products.chairs.map((chair_id) => ({ chair_id })),
      },
      tables: {
        create: products.tables.map((table_id) => ({ table_id })),
      },
      tops: {
        create: products.tops.map((top_id) => ({ top_id })),
      },
    },
  });
  res.json(order);
});

module.exports = router;
