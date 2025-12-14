import { sequelize } from "../config/database.js";
import { Report } from "./report.model.js";
import { ReportType } from "./reportType.model.js";
import { Status } from "./status.model.js";

export const initDb = async () => {
  try {
    await sequelize.sync();
    console.log("📁 Tablas sincronizadas correctamente");
  } catch (error) {
    console.error("❌ Error sincronizar base:", error);
  }
};

export { Report, ReportType, Status };
