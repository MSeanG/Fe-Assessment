import prisma from "../../../lib/prisma";

export default async function handle(req, res) {
  const applicationResponses = await prisma.applicationResponses.findMany();
  res.json(applicationResponses);
}
