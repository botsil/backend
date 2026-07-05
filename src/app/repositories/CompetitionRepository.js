import pool from "../../database/database.js";
import { Competition } from "../entities/Competition.js";

export class CompetitionRepository {
  async findById(id) {
    const query =
      "SELECT * FROM competitions WHERE id = $1 ORDER BY initial_date ASC";
    const { rows } = await pool.query(query, [id]);
    return rows.length > 0 ? new Competition(rows[0]) : null;
  }

  async findAll() {
    const query = "SELECT * FROM competitions ORDER BY initial_date ASC";
    const { rows } = await pool.query(query);
    return rows.map((row) => new Competition(row));
  }
}
