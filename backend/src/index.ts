import { authRoute } from "@/routes/auth-route";
import { Hono } from "hono";

const app = new Hono();

app.get("/", (c) => {
  return c.text("Hello Hono!");
});

app.route("/", authRoute);

export default app;
