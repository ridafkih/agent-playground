const PORT = Number(process.env.PORT) || 4000;

Bun.serve({
  port: PORT,
  fetch(req) {
    const url = new URL(req.url);

    if (url.pathname === "/health") {
      return Response.json({ status: "ok" });
    }

    return new Response("Not found", { status: 404 });
  },
});

console.log(`API running on http://localhost:${PORT}`);
