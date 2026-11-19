app.get('/categories', async (req, res) => {
    const title = 'Service Project Categories';

    try {
        const categories = await getAllCategories();

        res.render('categories', {
            title,
            categories
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Error loading categories');
    }
});
