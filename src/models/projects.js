import db from './db.js';

const getAllProjects = async () => {
    const query = `
        SELECT
            service_project.service_project_id,
            service_project.name,
            service_project.description,
            organization.name AS organization_name
        FROM public.service_project
        JOIN public.organization
        ON service_project.organization_id =
           organization.organization_id
        ORDER BY service_project.service_project_id;
    `;

    const result = await db.query(query);

    return result.rows;
};

export { getAllProjects };