DROP TABLE IF EXISTS pl_org_jn;
DROP TABLE IF EXISTS pl_group_jn;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS organisations;

CREATE TABLE organisations(
  id SERIAL2 PRIMARY KEY,
  o_name VARCHAR(255)
);

CREATE TABLE groups(
  id SERIAL2 PRIMARY KEY,
  g_name VARCHAR(255),
  org_id INT4 REFERENCES organisations(id) ON DELETE CASCADE
);

CREATE TABLE players(
  id SERIAL2 PRIMARY KEY,
  p_name VARCHAR(255),
  rating INT4,
  picture VARCHAR(255),
  primary_org_id INT4 REFERENCES organisations(id) ON DELETE CASCADE,
  primary_group_id INT4 REFERENCES groups(id) ON DELETE CASCADE
);

CREATE TABLE games(
  id SERIAL2 PRIMARY KEY,
  p1_id INT4 REFERENCES players(id) ON DELETE CASCADE,
  p2_id INT4 REFERENCES players(id) ON DELETE CASCADE,
  p1_score INT4,
  p2_score INT4,
  tstamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(2),
  p1_org_id INT4 REFERENCES organisations(id) ON DELETE CASCADE,
  p2_org_id INT4 REFERENCES organisations(id) ON DELETE CASCADE,
  p1_group_id INT4 REFERENCES groups(id) ON DELETE CASCADE,
  p2_group_id INT4 REFERENCES groups(id) ON DELETE CASCADE,
  location_id INT4 REFERENCES organisations(id) ON DELETE CASCADE
);

CREATE TABLE pl_group_jn(
  p_g_id SERIAL2 PRIMARY KEY,
  p_id INT4 REFERENCES players(id) ON DELETE CASCADE,
  group_id INT4 REFERENCES groups(id) ON DELETE CASCADE
);

CREATE TABLE pl_org_jn(
  id SERIAL2 PRIMARY KEY,
  p_id INT4 REFERENCES players(id) ON DELETE CASCADE,
  org_id INT4 REFERENCES groups(id) ON DELETE CASCADE,
  primary_org BOOLEAN
);

