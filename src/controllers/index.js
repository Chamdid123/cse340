const showHomePage = async (req, res) => {
    const title = 'Home';

    res.render('home', {
        title,
        organizations,
        projects
    });
};
export { showHomePage };