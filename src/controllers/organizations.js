import { getAllOrganizations, getOrganizationDetails } from "../models/organizations";
import { getProjectsByOrganizationId } from "../models/projects";

const showOrganizationsDetailsPage = async (req, res) => {
    const organizationId = req.params.id;

    const organizations = await getAllOrganizations();
    const title = 'organization Details';

    res.render('organizations', {
        title,
        organizations
    });
};
export { showOrganizationsPage, showOrganizationsDetailsPage };