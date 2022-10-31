const { faker } = require("@faker-js/faker");
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function main() {
  console.log("Start Seeding");

  /**
   * Candidates Section
   */
  let candidates = [];

  for (let i = 0; i < 5; i++) {
    candidates.push({
      id: i + 1,
      name: `${faker.name.firstName()} ${faker.name.lastName()}`,
    });
  }
  for (const i of candidates) {
    const responseInfo = await prisma.Candidates.create({
      data: i,
    });
    console.log("Created candidate: ", responseInfo);
  }

  /**
   * Application Section
   */
  let applications = [];
  //set one less application
  for (let i = 0; i < candidates.length - 1; i++) {
    applications.push({
      candidateId: i + 1,
      resume: `http://localhost:3000/Resume_${i + 1}.png`,
    });
  }

  for (const i of applications) {
    const responseInfo = await prisma.Applications.create({
      data: i,
    });
    console.log("Created application: ", responseInfo);
  }

  /**
   * Question Section
   */
  let questions = [];

  for (let i = 0; i < 5; i++) {
    questions.push({
      id: i + 1,
      question: faker.lorem.sentence(),
    });
  }

  for (const i of questions) {
    const responseInfo = await prisma.Questions.create({
      data: i,
    });
    console.log("Created question: ", responseInfo);
  }

  /**
   * Application Responses Section
   */
  let applicationResponses = [];

  for (let i = 0; i < applications.length; i++) {
    for (let j = 0; j < questions.length; j++) {
      applicationResponses.push({
        applicationId: i + 1,
        questionId: j + 1,
        userAnswer: faker.lorem.paragraph(),
      });
    }
  }

  for (const i of applicationResponses) {
    const responseInfo = await prisma.ApplicationResponses.create({
      data: i,
    });
    console.log("Created application question resonse: ", responseInfo);
  }

  console.log("Seeding Finished");
}
main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
