require("dotenv").config();
const express = require("express");
const cors = require("cors");
const fs = require("fs");
const path = require("path");
const db = require("./db");
const userRoutes = require("./routes/user");
const orderRoutes = require("./routes/order");
const productRoutes = require("./routes/products");

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.use("/api/users", userRoutes);
app.use("/api/orders", orderRoutes);
app.use("/api/products", productRoutes);

// Function to run the SQL script
const runSQLScript = async () => {
  const filePath = path.join(__dirname, "init.sql");
  const script = fs.readFileSync(filePath, "utf8");
  console.log("script", script);
  try {
    await db.query(script);
    console.log("Database initialized");
  } catch (error) {
    console.error("Error initializing database:", error);
  }
};

// Run the SQL script to initialize the database
runSQLScript();

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
