const express = require('express');
const cors = require('cors'); 
const mySql = require('mysql2');

const app = express();
app.use(cors());

const db = mySql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'catalogo'
});

app.get('/api/productos', (req, res) => {
    const {nombre} =  req.query;
    let sql = 'SELECT p.*, c.nombre AS categoria from productos p  left join categorias c ON p.categoria_id = c.id_categoria'
    const params = [];
    if (nombre) {
        sql += ' WHERE p.nombre LIKE ?';
        params.push(`%${nombre}%`);
    }

    db.query(sql, params, (err, result) => {
    if (err) {
        console.error('Error MySQL:', err.message);
        return res.status(500).json({ error: err.message });
    }
    res.json(result);
});

});
app.listen(5013, () => {
    console.log('Servidor corriendo en el puerto 5013');
});