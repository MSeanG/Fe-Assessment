import prisma from "../../../lib/prisma";

const handle = async (req, res) => {
  const { path } = req.query;
  if (req.method === "GET" && path[1] === "application-responses") {
    handleCombo(path[0], res);
  } else if (req.method === "GET") {
    handleGET(path[0], res);
  } else {
    res.status(405).send();
  }
};

const handleGET = async (id, res) => {
  const applicationResponse = await prisma.applications.findUnique({
    where: {
      candidateId: parseInt(id),
    },
  });
  res.json(applicationResponse);
};

const handleCombo = async (id, res) => {
  const applicationResponse = await prisma.applications.findMany({
    include: {
      applicationResponses: true,
    },
    where: {
      candidateId: parseInt(id),
    },
  });
  res.json(applicationResponse);
};
export default handle;
