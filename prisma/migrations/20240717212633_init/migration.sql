-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Order" (
    "id" SERIAL NOT NULL,
    "amount" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderChairs" (
    "id" SERIAL NOT NULL,
    "order_id" INTEGER NOT NULL,
    "chair_id" INTEGER NOT NULL,

    CONSTRAINT "OrderChairs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderTables" (
    "id" SERIAL NOT NULL,
    "order_id" INTEGER NOT NULL,
    "table_id" INTEGER NOT NULL,

    CONSTRAINT "OrderTables_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderTops" (
    "id" SERIAL NOT NULL,
    "order_id" INTEGER NOT NULL,
    "top_id" INTEGER NOT NULL,

    CONSTRAINT "OrderTops_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "category" TEXT NOT NULL,
    "image" TEXT NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderChairs" ADD CONSTRAINT "OrderChairs_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderChairs" ADD CONSTRAINT "OrderChairs_chair_id_fkey" FOREIGN KEY ("chair_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderTables" ADD CONSTRAINT "OrderTables_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderTables" ADD CONSTRAINT "OrderTables_table_id_fkey" FOREIGN KEY ("table_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderTops" ADD CONSTRAINT "OrderTops_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderTops" ADD CONSTRAINT "OrderTops_top_id_fkey" FOREIGN KEY ("top_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
