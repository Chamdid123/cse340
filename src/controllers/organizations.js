app.get('/organizations', async (req, res) => {
    const title = 'Our Partner Organizations';

    try {
        const organizations = await getAllOrganizations();

        res.render('organizations', {
            title,
            organizations
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Error loading organizations');
    }
});