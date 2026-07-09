# BOTSIL API

Backend API for the BOTSIL website. BOTSIL is a binational robotics team formed by Brazilian and Uruguayan students through the partnership between IFSul and UTEC.

This service provides the data used by the website, including team members, competitions, photos, and projects. The local database is seeded with information about the team and BRABOTS competitions.

## Technologies

- Node.js
- Express
- PostgreSQL
- pg
- dotenv
- cors
- Docker Compose
- pgAdmin

## Local Setup

Install dependencies:

```bash
npm install
```

Create your local environment file:

```bash
cp .env.example .env
```

Start PostgreSQL and pgAdmin:

```bash
docker compose up -d
```

Run the API in development mode:

```bash
npm run dev
```

By default, the API runs at `http://localhost:3333`.

## Environment Variables

- `DATABASE_URL`: optional full database connection string. When set, it takes precedence over the separate PostgreSQL variables.
- `POSTGRES_HOST`: PostgreSQL host used by the API when `DATABASE_URL` is not set.
- `POSTGRES_PORT`: local PostgreSQL port.
- `POSTGRES_DB`: database name.
- `POSTGRES_USER`: database user.
- `POSTGRES_PASSWORD`: database password.
- `PGADMIN_PORT`: local pgAdmin port.
- `PGADMIN_DEFAULT_EMAIL`: pgAdmin login email.
- `PGADMIN_DEFAULT_PASSWORD`: pgAdmin login password.
- `ALLOWED_CORS`: frontend origin allowed by CORS.
- `SV_PORT`: API server port.

## Database

The `docker-compose.yml` file starts PostgreSQL and mounts `init.sql` into the official Postgres entrypoint. On the first creation of the database volume, this file creates the tables and inserts the initial BOTSIL data, including members, photos, and BRABOTS competition records.

If the database volume already exists, Postgres will not run `init.sql` again automatically.

## Main Endpoints

- `GET /members`
- `GET /members/:id`
- `GET /competitions`
- `GET /competitions/:id`
- `GET /competitions/photos/:competition_id`
- `GET /photos/:type`
- `GET /projects`
- `GET /projects/:id`

## Scripts

- `npm run dev`: starts the API with Node.js watch mode.
