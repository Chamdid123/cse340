app.get('/', async (req, res) => {
    const title = 'Home';

    try {
        const organizations = await getAllOrganizations();
        const projects = await getAllProjects();

        res.render('home', {
            title,
            organizations,
            projects
        });
    } catch (error) {
        console.error('Home page error:', error);
        res.status(500).send('Error loading home page');
    }
});