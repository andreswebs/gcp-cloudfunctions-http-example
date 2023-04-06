import { http } from '@google-cloud/functions-framework';

async function main(data: Record<string, unknown>) {
  console.log(JSON.stringify(data));
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
http('main', async (req, res) => {
  await main(req.body);
});
