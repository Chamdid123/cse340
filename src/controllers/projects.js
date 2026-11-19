app.get('/projects', async (req, res) => {
    const title = 'Service Projects';

    try {
        const projects = await getAllProjects();

        res.render('projects', {
            title,
            projects
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Error loading projects');
    }
});
