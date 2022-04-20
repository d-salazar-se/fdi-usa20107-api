# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


### University

## FAE
faculty = Faculty.create(name: 'Facultad de Administración y Economía')
department = Department.create(name: 'Department 1', faculty: faculty)
Career.create([
  { name: 'Administración Pública', department: department },
  { name: 'Contador Público y Auditor (Diurno)', department: department },
  { name: 'Contador Público y Auditor (Vespertino)', department: department },
  { name: 'Ingeniería Comercial', department: department },
])

## Facultad de Ciencias Médicas
faculty = Faculty.create(name: 'Facultad de Ciencias Médicas')
department = Department.create(name: 'Department 1', faculty: faculty)
Career.create([
  { name: 'Enfermería', department: department },
  { name: 'Kinesiología', department: department },
  { name: 'Licenciatura en Ciencias de la Actividad Física/Entrenador Deportivo', department: department },
  { name: 'Licenciatura en Ciencias de la Actividad Física/Terapeuta en Actividad Física y Salud', department: department },
  { name: 'Medicina', department: department },
  { name: 'Obstetricia y Puericultura', department: department },
  { name: 'Pedagogía en Educación Física', department: department },
  { name: 'Terapia Ocupacional', department: department },
])

faculty = Faculty.create(name: 'Facultad de Ciencia')
department = Department.create(name: 'Department 1', faculty: faculty)
Career.create([
  { name: 'Analista en Computación Científica / Licenciatura en Ciencia de la Computación', department: department },
  { name: 'Astrofísica con Mención en Ciencia de Datos', department: department },
  { name: 'Ingeniería Estadística', department: department },
  { name: 'Ingeniería Física', department: department },
  { name: 'Ingeniería Matemática', department: department },
  { name: 'Pedagogía en Física y Matemática', department: department },
  { name: 'Pedagogía en Matemática y Computación', department: department }
])

faculty = Faculty.create(name: 'Programa de Bachillerato')
department = Department.create(name: 'Department 1', faculty: faculty)
Career.create([
  { name: 'Bachillerato en Ciencias y Humanidades', department: department }
])

faculty = Faculty.create(name: 'Facultad de Derecho')
department = Department.create(name: 'Department 1', faculty: faculty)
Career.create([
  { name: 'Derecho', department: department }
])

faculty = Faculty.create(name: 'Escuela de Arquitectura')
department = Department.create(name: 'Department 1', faculty: faculty)
Career.create([
  { name: 'Arquitectura', department: department }
])

faculty = Faculty.create(name: 'Facultad de Humanidades')
department = Department.create(name: 'Department 1', faculty: faculty)
Career.create([
  { name: 'Arquitectura', department: department },
  { name: 'Licenciatura en Estudios Internacionales', department: department },
  { name: 'Licenciatura en Historia', department: department },
  { name: 'Licenciatura en Lingüistica Aplicada a la Traducción en Inglés - Japonés e Inglés - Portugués', department: department },
  { name: 'Pedagogía en Castellano', department: department },
  { name: 'Pedagogía en Educación General Básica', department: department },
  { name: 'Pedagogía en Filosofía', department: department },
  { name: 'Pedagogía en Historia y Ciencias Sociales', department: department },
  { name: 'Pedagogía en Inglés', department: department },
  { name: 'Periodismo', department: department },
  { name: 'Psicología', department: department },
])

faculty = Faculty.create(name: 'Facultad de Ingeniería')
department = Department.create(name: 'Departamento de Ingeniería Química', faculty: faculty)
Career.create([
  { name: 'Ingeniería Civil en Biotecnología', department: department },
  { name: 'Ingeniería Civil en Química', department: department },
  { name: 'Ingeniería de Ejecución en Química', department: department },
])

department = Department.create(name: 'Departamento de Ingeniería en Obras Civiles', faculty: faculty)
Career.create([
  { name: 'Ingeniería Civil en Obras Civiles', department: department },
])

department = Department.create(name: 'Departamento de Ingeniería en Minas', faculty: faculty)
Career.create([
  { name: 'Ingeniería Civil en Minas', department: department },
  { name: 'Ingeniería de Ejecución en Minas', department: department },
])

department = Department.create(name: 'Departamento de Ingeniería Metalúrgica', faculty: faculty)
Career.create([
  { id: 808, name: 'Ingeniería Civil en Metalurgia', department: department },
  { id: 821, name: 'Ingeniería de Ejecución en Metalurgia', department: department },
])

department = Department.create(name: 'Departamento de Ingeniería Mecánica', faculty: faculty)
Career.create([
  { name: 'Ingeniería Civil en Mecánica', department: department },
  { name: 'Ingeniería de Ejecución en Mecánica', department: department },
  { name: 'Ingeniería de Ejecución en Climatización', department: department },
])

department = Department.create(name: 'Departamento de Ingeniería X', faculty: faculty)
Career.create([
  { name: 'Ingeniería Civil Biomédica', department: department },
  { name: 'Ingeniería Civil en Ambiente', department: department },
  { name: 'Ingeniería Civil en Electricidad', department: department },
  { name: 'Ingeniería Civil en Geografía', department: department },
  { name: 'Ingeniería Civil en Geomesura y Geomática', department: department },
  { name: 'Ingeniería Civil en Informática', department: department },
  { name: 'Ingeniería Civil en Telemática', department: department },
  { name: 'Ingeniería Civil Industrial', department: department },
  { name: 'Ingeniería Civil Mecatrónica', department: department },
  { name: 'Ingeniería de Ejecución en Computación e Informática', department: department },
  { name: 'Ingeniería de Ejecución en Electricidad', department: department },
  { name: 'Ingeniería de Ejecución en Geomesura', department: department },
  { name: 'Ingeniería de Ejecución Industrial', department: department }
])

faculty = Faculty.create(name: 'Facultad de Química y Biología')
department = Department.create(name: 'Department 1', faculty: faculty)
Career.create([
  { name: 'Bioquímica y Licenciatura en Bioquímica', department: department },
  { name: 'Pedagogía en Química y Biología', department: department },
  { name: 'Química y Farmacia', department: department },
  { name: 'Química y Licenciatura en Química', department: department },
  { name: 'Técnico Universitario en Análisis Químico y Físico (Diurno)', department: department },
  { name: 'Técnico Universitario en Análisis Químico y Físico (Vespertino)', department: department },
])

faculty = Faculty.create(name: 'Facultad Tecnológica')
department = Department.create(name: 'Department 1', faculty: faculty)
Career.create([
  { name: 'Diseño en Comunicación Visual', department: department },
  { name: 'Diseño Industrial', department: department },
  { name: 'Ingeniería de Alimentos', department: department },
  { name: 'Ingeniería en Agronegocios', department: department },
  { name: 'Publicidad', department: department },
  { name: 'Tecnología en Administracion de Personal', department: department },
  { name: 'Tecnología en Alimentos', department: department },
  { name: 'Tecnología en Automatización Industrial', department: department },
  { name: 'Tecnología en Construcciones', department: department },
  { name: 'Tecnología en Control Industrial', department: department },
  { name: 'Tecnología en Mantenimiento Industrial', department: department },
  { name: 'Tecnología en Telecomunicaciones', department: department },
])


