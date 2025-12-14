import { Router } from "express";
import reportRoutes from "./reportRoutes.js";
import statusRoutes from "./statusRoutes.js";
import reportTypeRoutes from "./reportTypeRoutes.js";
import { sequelize } from "./config/database.js";
await sequelize.sync({ alter: true });

const router = Router();

router.use("/reports", reportRoutes);
router.use("/status", statusRoutes);
router.use("/report-types", reportTypeRoutes);

export default router;
