import db from './db.js'

const getAllcategories = async () => {
    const query = `
        SELECT catergories_id, name, 
      FROM public.catergories;
    `;

    const result = await db.query(query);

    return result.rows;
}

export { getAllcategories }