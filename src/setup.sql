CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');


CREATE TABLE service_project (
  service_project_id SERIAL PRIMARY KEY,
  name VARCHAR(45) NOT NULL,
  description VARCHAR(255) NOT NULL,
  organization_id INT REFERENCES organization(organization_id)
  );

CREATE TABLE categories (
  categories_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
  );

  INSERT INTO categories (name) VALUES
  	("Environment"),
	  ("Education"),
	  ("Community Service"),
	  ("Health and wellness");

CREATE TABLE project_categories ( 
  categories_id INT NOT NULL,
  service_project_id INT NOT NULL,
  PRIMARY KEY (service_project_id, categories_id),
  FOREIGN KEY (categories_id) REFERENCES categories(categories_id),
  FOREIGN KEY (service_project_id) REFERENCES service_project(service_project_id)
  );
  select * from service_project
