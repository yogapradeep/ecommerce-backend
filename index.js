const express = require("express");
const userRouter = require("./routes/user");
const orderRouter = require("./routes/order");
const productRouter = require("./routes/product");
const cors = require("cors");

const app = express();
app.use(cors());

app.use(express.json());

app.use("/users", userRouter);
app.use("/orders", orderRouter);
app.use("/products", productRouter);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

module.exports = app;
