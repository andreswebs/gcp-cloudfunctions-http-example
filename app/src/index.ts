import { http } from '@google-cloud/functions-framework';

async function main(data: Record<string, unknown>) {
  console.log(JSON.stringify(data));
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
http('main', async (req, res) => {
  try {
    await main(req.body);
    return res.status(204).send();
  } catch (e) {
    console.error(e);
    return res
      .status(500)
      .json({ error: 'Internal Server Error', status: 500 });
  }
});
