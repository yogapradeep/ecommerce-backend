// prisma/seed.js
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function main() {
  await prisma.product.createMany({
    data: [
      {
        name: "Lounge Chair",
        price: 2000,
        category: "Chairs",
        image:
          "https://cdn.bbopokertables.com/upload/thumbnail/400/_upload_file_2019_5_201905020321189719702996_luna.jpg",
      },
      {
        name: "Dining Chair",
        price: 1800,
        category: "Chairs",
        image:
          "https://cdn.bbopokertables.com/upload/thumbnail/400/_upload_file_2015_10_20151016135262866286.jpg",
      },
      {
        name: "Table1",
        price: 3000,
        category: "Table",
        image:
          "https://cdn.bbopokertables.com/template/2022/selector/images/3-1.png",
      },
      {
        name: "Table2",
        price: 3200,
        category: "Table",
        image:
          "https://cdn.bbopokertables.com/template/asset/2021/11/prestige-x/Prestige-X-Gallery-Update-01.jpg",
      },
      {
        name: "Table3",
        price: 3100,
        category: "Table",
        image:
          "https://cdn.bbopokertables.com/template/asset/2021/11/prestige-x/Prestige-X-Gallery-Update-04.jpg",
      },
      {
        name: "Dining Top",
        price: 900,
        category: "Top",
        image:
          "https://cdn.bbopokertables.com/upload/file/temp/thumbnail_quality/75/600_400/_upload_file_2015_10_20151016140530233023.jpg",
      },
    ],
  });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
