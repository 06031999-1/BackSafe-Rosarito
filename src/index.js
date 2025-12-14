import express from "express";

import cors from "cors";
import path from "path";
import { fileURLToPath } from "url";

import session from "express-session";
import helmet from "helmet";

import reportRoutes from "./routes/reportRoutes.js";
import csrfRoutes from "./routes/csrfRoutes.js";
import imageRoutes from "./routes/imageRoutes.js";
import authRoutes from "./routes/authRoutes.js";

import { apiLimiter } from "./middlewares/rateLimit.js";
import sequelize from "./config/database.js";
import swaggerUi from "swagger-ui-express";
import { swaggerSpec } from "./config/swagger.js";



const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);



const app = express();


// ✅ ÚNICA ruta correcta para imágenes
app.use("/uploads", express.static(path.resolve("uploads")));

/* ==========================
   🔐 SESSION
========================== */
app.use(session({
  secret: "alerta-rosarito-secret",
  resave: false,
  saveUninitialized: false,
  cookie: {
    httpOnly: true,
    sameSite: "lax"
  }
}));
app.use("/api/docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));
/* ==========================
   🛡 CORS
========================== */
const whitelist = [
  "http://localhost:5500",
  "http://127.0.0.1:5500"
];

app.use(cors({
  origin: whitelist,
  credentials: true
}));

/* ==========================
   MIDDLEWARES
========================== */
app.use(helmet());
app.use(express.json());
app.use("/uploads", express.static(path.resolve("uploads")));
app.use(
  "/uploads",
  express.static(path.join(__dirname, "../uploads"))
);



/* ==========================
   RUTAS
========================== */
app.use("/api/auth", authRoutes);
app.use("/api/csrf", csrfRoutes);
app.use("/api/reports", apiLimiter, reportRoutes);
app.use("/api/images", imageRoutes);



/* ==========================
   SWAGGER
========================== */
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));


/* ==========================
   BD + SERVIDOR
========================== */
(async () => {
  try {
    await sequelize.sync();
    console.log("🗄️ Base de datos sincronizada");

    app.listen(3000, () => {
      console.log("🚀 Servidor listo en http://localhost:3000");
    });
  } catch (error) {
    console.error("❌ Error al iniciar:", error);
  }
})();
