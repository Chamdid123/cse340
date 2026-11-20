import express from 'express';

import { showHomePage } from './controllers/index.js';
import { showOrganizationDetailsPage } from './controllers/organizations.js';
import { showProjectsPage } from './controllers/projects';
import { showCategoriesPage } from './controllers/categories';
import { testErrorPage } from './controllers/errors';

const router = express.Router();

router.get('/', showHomePage);
router.get('/organization/:id', showOrganizationsDetailsPage);
router.get('/projects', showProjectsPage);
router.get('/categories', showCategoriesPage);

router.get('/test-error', testErrorPage);

export default router;