import prisma from "../../../lib/prisma";

const handle = async (req, res) => {
  const { path } = req.query;

  if (req.method === "GET") {
    handleGET(path[0], res);
  } else if (req.method === "PATCH") {
    if (path[1] === "comment") handleCommentPATCH(path[0], req, res);
  } else {
    res.status(405).send();
  }
};

const handleGET = async (id, res) => {
  const applicationResponse = await prisma.applicationResponses.findMany({
    where: {
      applicationId: parseInt(id),
    },
  });
  res.json(applicationResponse);
};

const handleCommentPATCH = async (id, req, res) => {
  const { comment } = req.body;
  const applicationResponse = await prisma.applicationResponses.update({
    where: {
      id: parseInt(id),
    },
    data: {
      comment: comment,
    },
  });
  res.json(applicationResponse);
};

export default handle;
