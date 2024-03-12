const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database(':memory:');

// Crear tablas
db.serialize(() => {
  db.run('CREATE TABLE IF NOT EXISTS mascotas (id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, raza TEXT, edad INTEGER, peso REAL, medicamento TEXT, cliente_id INTEGER)');
  db.run('CREATE TABLE IF NOT EXISTS clientes (id INTEGER PRIMARY KEY AUTOINCREMENT, cedula TEXT, nombres TEXT, apellidos TEXT, direccion TEXT, telefono TEXT)');
  db.run('CREATE TABLE IF NOT EXISTS medicamentos (id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, descripcion TEXT, dosis TEXT)');
});

// Insertar datos ramdon
function insertarDatosRandom() {
    const mascotas = [
      { identificacion: '123456789', nombre: 'Firulais', raza: 'Labrador', edad: 5, peso: 15, medicamento: 'Droga', cliente_id: 1 },
      { identificacion: '987654321', nombre: 'Bolita', raza: 'Pastor Aleman', edad: 3, peso: 10, medicamento: 'Vitamina', cliente_id: 2 },
      { identificacion: '111111111', nombre: 'Luna', raza: 'Gran Danés', edad: 2, peso: 20, medicamento: 'Antibiótico', cliente_id: 3 },
      { identificacion: '222222222', nombre: 'Pelusa', raza: 'Pug', edad: 1, peso: 5, medicamento: 'Antiparasitario', cliente_id: 4 },
      { identificacion: '333333333', nombre: 'Peludo', raza: 'Poodle', edad: 4, peso: 12, medicamento: 'Antiinflamatorio', cliente_id: 5 },
    ];
  
    const clientes = [
      { cedula: '123456789', nombres: 'Juan', apellidos: 'Pérez', direccion: 'Calle 123', telefono: '3001234567' },
      { cedula: '987654321', nombres: 'María', apellidos: 'García', direccion: 'Calle 456', telefono: '3009876543' },
      { cedula: '111111111', nombres: 'Carlos', apellidos: 'Rodríguez', direccion: 'Calle 789', telefono: '3001112222' },
      { cedula: '222222222', nombres: 'Laura', apellidos: 'Sánchez', direccion: 'Calle 101112', telefono: '3002223333' },
      { cedula: '333333333', nombres: 'Pedro', apellidos: 'López', direccion: 'Calle 131415', telefono: '3003334444' },
    ];
  
    const medicamentos = [
      { nombre: 'Droga', descripcion: 'Tratamiento para enfermedades del corazón', dosis: '10 mg' },
      { nombre: 'Vitamina', descripcion: 'Suplemento nutricional', dosis: '500 UI' },
      { nombre: 'Antibiótico', descripcion: 'Tratamiento para infecciones bacterianas', dosis: '250 mg' },
      { nombre: 'Antiparasitario', descripcion: 'Tratamiento para parásitos internos', dosis: '50 mg' },
      { nombre: 'Antiinflamatorio', descripcion: 'Tratamiento para inflamaciones', dosis: '100 mg' },
    ];
  
    const insertarRegistro = (tabla, registros) => {
      registros.forEach(registro => {
        const keys = Object.keys(registro);
        const values = keys.map(key => `'${registro[key]}'`).join(', ');
        db.run(`INSERT INTO ${tabla} (${keys.join(', ')}) VALUES (${values})`);
      });
    };
  
    insertarRegistro('clientes', clientes);
    insertarRegistro('medicamentos', medicamentos);
    insertarRegistro('mascotas', mascotas);
  }
  
  insertarDatosRandom();