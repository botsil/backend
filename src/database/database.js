import { Pool } from "pg";
import dotenv from "dotenv";

dotenv.config();

const databaseConfig = process.env.DATABASE_URL
  ? { connectionString: process.env.DATABASE_URL }
  : {
      host: process.env.POSTGRES_HOST,
      port: process.env.POSTGRES_PORT ? Number(process.env.POSTGRES_PORT) : undefined,
      database: process.env.POSTGRES_DB,
      user: process.env.POSTGRES_USER,
      password: process.env.POSTGRES_PASSWORD,
    };

const pool = new Pool(databaseConfig);

export default pool;
