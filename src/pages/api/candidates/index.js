import prisma from "../../../lib/prisma";

export default async function handle(req, res) {
  const candidates = await prisma.candidates.findMany();
  res.json(candidates);
}
