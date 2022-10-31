import prisma from "../../lib/prisma";

export default async function handle(req, res) {
  const questions = await prisma.questions.findMany();
  res.json(questions);
}
