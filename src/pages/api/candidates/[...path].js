import prisma from "../../../lib/prisma";
import { equals } from "../../../lib/helpers";
const handle = async (req, res) => {
  const catchAllRoute = ["applications", "application-responses", "questions"];
  const { path } = req.query;

  if (req.method !== "GET") {
    res.status(405).send();
  } else if (!equals(catchAllRoute, path)) {
    res.status(404).send();
  } else handleGET(res);
};

const handleGET = async (res) => {
  const candidates = await prisma.candidates.findMany({
    include: {
      applications: {
        include: {
          applicationResponses: {
            include: {
              questions: true,
            },
          },
        },
      },
    },
  });
  res.status(200).json(candidates);
};

export default handle;
