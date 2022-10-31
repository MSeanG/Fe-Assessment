import prisma from "../../../lib/prisma";

export default async function handle(req, res) {
  const applications = await prisma.applications.findMany();
  res.json(applications);
}
