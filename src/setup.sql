DROP TABLE IF EXISTS project_categories;
DROP TABLE IF EXISTS service_project;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS organization;

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
  location VARCHAR(150) NOT NULL,
  project_date DATE NOT NULL,
  organization_id INT REFERENCES organization(organization_id)
  );

INSERT INTO service_project (name, description, location, project_date, organization_id)
VALUES
    ('Community Center Roof Repair', 'Replacing damaged roofing panels with sustainable materials.', '120 Main St', '2026-11-28', 1),
    ('Solar Streetlight Installation', 'Installing solar-powered lights along neighborhood walkways.', 'Oak Avenue', '2026-12-03', 1),
    ('Wheelchair Ramp Build', 'Building accessible wooden ramps for senior residents.', '45 Elm Street', '2026-12-10', 1),
    ('Park Pavilion Restoration', 'Repainting and reinforcing the local park shelter.', 'Riverside Park', '2026-12-15', 1),
    ('School Library Shelving', 'Constructing bookshelves for the elementary school library.', 'Westside Elementary', '2027-01-08', 1),

    ('Neighborhood Garden Planting', 'Planting seasonal vegetables in raised community beds.', 'GreenHarvest Lot A', '2026-11-29', 2),
    ('Composting Workshop', 'Teaching backyard composting techniques to local families.', 'Community Greenhouse', '2026-12-05', 2),
    ('Orchard Pruning Day', 'Pruning fruit trees to improve spring harvest yields.', 'Eastside Orchard', '2026-12-12', 2),
    ('Seedling Giveaway', 'Distributing starter vegetable seedlings to residents.', 'Downtown Farmers Market', '2026-12-19', 2),
    ('Rainwater Harvesting Setup', 'Installing rain barrels at urban garden plots.', 'Southside Community Plot', '2027-01-10', 2),

    ('Winter Coat Drive', 'Collecting and sorting warm coats for local shelters.', 'UnityServe Hub', '2026-11-30', 3),
    ('Food Bank Packing', 'Packing weekly grocery boxes for families in need.', 'Metro Food Bank', '2026-12-06', 3),
    ('Senior Wellness Visits', 'Delivering care packages and visiting homebound seniors.', 'Sunset Senior Living', '2026-12-13', 3),
    ('Youth Tutoring Night', 'Providing after-school homework help for middle schoolers.', 'Public Library Room B', '2026-12-20', 3),
    ('River Trail Cleanup', 'Clearing litter and debris along the community walking trail.', 'Cedar River Trail', '2027-01-12', 3);
	
CREATE TABLE categories (
  categories_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
  );

  INSERT INTO categories (name) VALUES
  	('Environment'),
	  ('Education'),
	  ('Community Service'),
	  ('Health and wellness');

CREATE TABLE IF NOT EXISTS project_categories (
    service_project_id INTEGER NOT NULL REFERENCES service_project(service_project_id) ON DELETE CASCADE,
    categories_id INTEGER NOT NULL REFERENCES categories(categories_id) ON DELETE CASCADE,
    PRIMARY KEY (service_project_id, categories_id)
);

INSERT INTO project_categories(service_project_id, categories_id)VALUES
	(1,1),
	(1,3),
	(2,3),
	(2,4),
	(3,2),
	(3,3);

SELECT * FROM project_categories;