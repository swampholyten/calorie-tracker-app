import { auth } from "@/lib/auth";
import { authMiddleware } from "@/middlewares/auth-middleware";
import { Hono } from "hono";

export const authRoute = new Hono<{
  Variables: {
    user: typeof auth.$Infer.Session.user | null;
    session: typeof auth.$Infer.Session.session | null;
  };
}>();

authRoute.use("*", authMiddleware);

authRoute.on(["POST", "GET"], "/api/auth/**", (c) => auth.handler(c.req.raw));

authRoute.get("/session", async (c) => {
  const session = c.get("session");
  const user = c.get("user");

  if (!user) return c.body(null, 401);

  return c.json({
    session,
    user,
  });
});
