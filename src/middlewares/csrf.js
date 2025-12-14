// src/middlewares/csrf.js
import crypto from "crypto";

// 🔐 Generar token CSRF
export function generarCSRF(req, res) {
  const token = crypto.randomBytes(32).toString("hex");
  req.session.csrfToken = token;

  res.json({
    ok: true,
    csrfToken: token
  });
}

// 🛡 Validar token CSRF
export function validarCSRF(req, res, next) {
  const tokenHeader = req.headers["x-csrf-token"];
  const tokenSession = req.session?.csrfToken;

  if (!tokenHeader || !tokenSession || tokenHeader !== tokenSession) {
    return res.status(403).json({
      ok: false,
      error: "Token CSRF inválido o ausente"
    });
  }

  next();
}
