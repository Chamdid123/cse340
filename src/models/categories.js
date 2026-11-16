import db from './db.js'

const getAllCategories = async () => {
  const query = `
        SELECT catergories_id, name, 
      FROM public.catergories
      ORDER BY name;
    `;

  const result = await db.query(query);

  return result.rows;
}

export { getAllCategories }