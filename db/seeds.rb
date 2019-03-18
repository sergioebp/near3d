# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.destroy_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Technology.destroy_all
Design.destroy_all
Store.destroy_all
Suggestion.destroy_all
User.destroy_all

#Creación de usuarios
8.times do
    User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123456')
end

#Creación de diseños
diseño1 = Design.new(name: 'Dinosaurio', description: 'Juguete con articulaciones funcionales. no necesita soportes, imprime y usa.', public: true, user_id: (rand((User.first.id)..(User.last.id))))
diseño1.save 
diseño1.file.attach(io: File.open(Rails.root.join('app', 'assets', 'stl', 'Flexi-Rex-improved.stl')), filename: 'Flexi-Rex-improved.stl')

diseño2 = Design.new(name: 'Trapezoide', description: 'Es como un remolino, para imprimirla recuerda generar soportes', public: true, user_id: rand(User.first.id..User.last.id))
diseño2.save
diseño2.file.attach(io: File.open(Rails.root.join('app', 'assets', 'stl', 'TrapezoidThread.stl')), filename: 'TrapezoidThread.stl')

diseño3 = Design.new(name: 'Camión de juguete', description: 'versión 3 del camión de juguete, después de imprimir aplica fuerza para liberar el eje de rotación', public: true, user_id: (rand((User.first.id)..(User.last.id))))
diseño3.save 
diseño3.file.attach(io: File.open(Rails.root.join('app', 'assets', 'stl', 'toy-truck10-v3a.stl')), filename: 'toy-truck10-v3a.stl')

diseño4 = Design.new(name: 'sujetacolores', description: 'sujetacolores con forma geométrica básica para facilidad de impresión, no necesita soportes', public: true, user_id: (rand((User.first.id)..(User.last.id))))
diseño4.save 
diseño4.file.attach(io: File.open(Rails.root.join('app', 'assets', 'stl', 'Lee_Smith_Pen_Holder.STL')), filename: 'Lee_Smith_Pen_Holder.STL')

#Creación de tiendas
3.times do 
    Store.create(name: Faker::Company.name, description: Faker::Company.catch_phrase, address: Faker::Address.full_address, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, active: true)
end

#Creación de dueños de tiendas
12.times do
    Userstore.create(user_id: (rand((User.first.id)..(User.last.id))), store_id: (rand((Store.first.id)..(Store.last.id))))
end

#Creación de impresoras
impresora1 = Printer.new(name: 'Impresora 3d Finder', store_id: (rand((Store.first.id)..(Store.last.id))), base_price: (rand(1000..5000)), hour_price: (rand(1000..5000)), description: "La impresora FlashForge Finder, a parte de ser muy bonita, es una impresora súper segura para usarse, funcional y eficaz, inclusive los más pequeños pueden usarla sin problemas. Esta impresora, es la indicada para la familia y que los pequeños se introduzcan en el  mundo de la impresión, ya que cuenta sólo con cama fría, por ende utiliza sólo filamentos PLA, que a su vez, es el material más seguro, dado que no es tóxico, por ser derivado de la fécula de maíz. Sin duda, la mejor opción llena de dinamismo, perfecto para toda la familia.", dimention_x: 140, dimention_y: 140, dimention_z: 140)
impresora1.save
impresora1.image.attach(io: File.open('/home/lenovo/Escritorio/Near3d/app/assets/images/impresora_3d_1.jpg'), filename: 'impresora_3d_1.jpg')

impresora2 = Printer.new(name: 'Impresora 3d Prusa I3 A6 ', store_id: (rand((Store.first.id)..(Store.last.id))), base_price: (rand(1000..5000)), hour_price: (rand(1000..5000)), description: "Area De Trabajo Util: 220mm*220mm*250mm
Materiales que soporta: PLA, ABS, etc de 1.75mm
Capas: 0.1-0.4mm
Superficie de Impresion: Cama Caliente De Aluminio
Estructura de acrilico de 8mm
Varillas De Acero Inoxidable
Voltaje De Funcionamiento 220v (Incluye Fuente, Cable y ficha con tierra incluida lista para usar)
Soporta Formatos STL,G-code
Soporta Memoria SD (Se la entrega con una memoria de 16Gb de regalo y lector usb de regalo)
Incluye Display LCD y una perilla pera controlar toda la maquina (ademas incluye un buzzer con sonido).", dimention_x: 220, dimention_y: 220, dimention_z: 250)
impresora2.save
impresora2.image.attach(io: File.open('/home/lenovo/Escritorio/Near3d/app/assets/images/impresora_3d_2.jpg'), filename: 'impresora_3d_2.jpg')

impresora3 = Printer.new(name: 'IMPRESORA 3D FORMLABS / FORM 2', store_id: (rand((Store.first.id)..(Store.last.id))), base_price: (rand(1000..5000)), hour_price: (rand(1000..5000)), description: "EL CORAZÓN DE LA MÁQUINA ES UN MOTOR ÓPTICO DE GRAN ALCANCE, UN LÁSER DE PRECISIÓN DE 250 W, ES GUIADO POR GALVANÓMETROS HECHOS A MEDIDA, PARA ENTREGA IMPRESIONES GRANDES CON DETALLES ESPECTACULARES. LA MEJOR IMPRESORA 3D DE ESCRITORIO JAMÁS CREADA", dimention_x: 145, dimention_y: 145, dimention_z: 175)
impresora3.save
impresora3.image.attach(io: File.open('/home/lenovo/Escritorio/Near3d/app/assets/images/impresora_3d_3.png'), filename: 'impresora_3d_3.png')

impresora4 = Printer.new(name: '3D KREATOR MOTION - Impresora 3D', store_id: (rand((Store.first.id)..(Store.last.id))), base_price: (rand(1000..5000)), hour_price: (rand(1000..5000)), description: "La impresora 3D KREATOR MOTION fue desarrollada gracias a una colaboración entre el Departamento de Mecatrónica de la Facultad de Ingeniería Eléctrica de la Universidad Tecnológica de Silesia (Polonia) y el equipo de investigación científica formado los mejores ingenieros y profesionales de la Universidad AGH de ciencia y Tecnología de Cracovia (Polonia).

Después de ser presentada delante del Parlamento Europeo conmemorando los diez años de pertenencia de Polonia a la UE, ha conseguido ganar diferentes premios de diseño y versatilidad (IDOL 2014, TARBUD 2015,Medalla de oro en la Feria de Kielce y el premio al Mejor diseño en el Arena Design 2016 en Polonia).", dimention_x: 200, dimention_y: 200, dimention_z: 190)
impresora4.save
impresora4.image.attach(io: File.open('/home/lenovo/Escritorio/Near3d/app/assets/images/impresora_3d_4.jpg'), filename: 'impresora_3d_4.jpg')

impresora5 = Printer.new(name: 'IMPRESORA 3D XYZ DA VINCI 1.0A', store_id: (rand((Store.first.id)..(Store.last.id))), base_price: (rand(1000..5000)), hour_price: (rand(1000..5000)), description: "La impresora Da Vinci 1.0 A permite la creación de diseños propios a color, con un material altamente resistente. Sin duda, la herramienta que necesitas para potenciar tu negocio o para uso personal. Es un equipo monocolor que imprime material ABS/PLA, permitiéndote tener más y mejores posibilidades de crear diseños. Cuenta con autonomía, ya que tiene la capacidad de imprimir sin la necesidad de estar conectada a un computador y es muy fácil uso, pues no es necesario ser un experto para aprender a usarla y te harás un experto en cuestión de minutos.", dimention_x: 200, dimention_y: 200, dimention_z: 200)
impresora5.save
impresora5.image.attach(io: File.open('/home/lenovo/Escritorio/Near3d/app/assets/images/impresora_3d_5.jpg'), filename: 'impresora_3d_5.jpg')

impresora6 = Printer.new(name: 'mElephant Impresora 3D', store_id: (rand((Store.first.id)..(Store.last.id))), base_price: (rand(1000..5000)), hour_price: (rand(1000..5000)), description: "Tanto la precisión como la exactitud important en la impresión 3D. mElephant tiene la correa dentada y el tornillo con el mismo paso, alcanza una alta-precisión en los ejes XY con una resolución de 0.1mm, y una resolución de cada capa de 0.1-0.3mm, lo que significa que puedes producir exactamente el diseño que realices.", dimention_x: 416, dimention_y: 344, dimention_z: 330)
impresora6.save
impresora6.image.attach(io: File.open('/home/lenovo/Escritorio/Near3d/app/assets/images/impresora_3d_6.jpg'), filename: 'impresora_3d_6.jpg')

#Creación de tecnologías
Technology.create(name: 'FDM', description: "es el método de impresión 3D más común en impresoras 3D de escritorio. El filamento termoplástico se calienta y se extruye en coordenadas de X e Y a través del cabezal de extrusión, mientras que la superficie de impresión va bajando el objeto capa por capa en la dirección Z. De este modo el objeto se imprime de abajo hacia arriba. Si se diera el caso de que un modelo tuviera partes que sobresalen, necesitará estructuras de soporte que se puedan quitar una vez que la impresión haya finalizado. Este tipo de impresora 3D es una manera rentable de desarrollar un producto y de crear de forma rápida prototipos en los sectores de pequeñas empresas y la educación, ya que es capaz de fabricar piezas robustas de manera eficiente y rápida.")

Technology.create(name: 'SLA', description: "Esta tecnología funciona mediante la exposición de una capa de resina líquida fotosensible a un rayo láser UV para que se endurezca y se solidifique. Una vez que el láser recorre una capa de resina en el patrón deseado, este comienza a endurecerse. Acto seguido, la plataforma de impresión del modelo, situada en el tanque líquido de la impresora, baja una capa y el láser comienza a formar la siguiente capa. Cada capa se construye sobre la anterior. Al igual que en la tecnología de impresión 3D FDM, los objetos con partes sobresalientes impresos con estos tipos de impresoras 3D, necesitarán estructuras de soporte. Una vez completada la impresión, el objeto debe enjuagarse con un disolvente. En ocasiones también se hornea en un horno UV para finalizar el procesamiento. La tecnología SLA crea objetos con superficies lisas y mucho detalle. Es cada vez más popular en sectores como la joyería y la odontología cosmética para la creación de moldes maleables.")

Technology.create(name: 'DLP', description: "La tecnología DLP usa una red eléctrica de microespejos controlados por ordenador dispuestos en un molde sobre un chip semiconductor. Estos diminutos espejos se inclinan hacia adelante y hacia atrás. Cuando un espejo está inclinado, refleja la luz, lo que refleja un píxel brillante. Mientra que si el espejo está inclinado hacia el lado opuesto, el píxel se volverá oscuro. Este tipo de tecnología se usa en proyectores de películas, teléfonos móviles y también para la impresión en 3D. Uno de los beneficios que presenta para la impresión 3D es su velocidad: puede imprimir capas en un instante.")

Technology.create(name: 'SLS', description: "este tipo de impresora 3D utiliza material en polvo en el área de impresión. Se usa un láser para sinterizar selectivamente una capa de gránulos que une el material para crear una estructura sólida. Cuando el objeto está completamente formado, se deja enfriar en la máquina antes de retirarlo. El SLS es ampliamente utilizado para el desarrollo de productos y la creación rápida de prototipos orientados a industrias comerciales. Asimismo, es útil para la fabricación de productos finales de uso limitado, como piezas usadas en el sector industrial (por ejemplo, piezas de maquinarias). Los materiales utilizados en el SLS pueden variar desde nailon, vidrio y cerámica hasta aluminio, plata e incluso acero.Sin embargo, este tipo de impresora 3D requiere del uso de costosos láseres de alta potencia, lo que la sitúa un poco fuera del alcance del consumidor promedio.")

Technology.create(name: 'BJ', description: "Este tipo de impresión 3D se inventó en el MIT (Instituto Tecnológico de Massachusetts).La inyección de aglutinante es un proceso de fabricación aditiva. Este tipo de impresora 3D utiliza dos materiales: un material a base de polvo (a menudo yeso) y un agente adhesivo, que actúa uniendo las capas de polvo.  Por lo general, el aglutinante se extruye en forma líquida desde un cabezal de impresión al igual que en una impresora 2D de inyección de tinta convencional. Una vez que se termina una capa, la superficie de impresión baja y el proceso se vuelve a repetir. Puedes utilizar esta tecnología de impresión 3D con cerámica, metal, arena o plástico. Este tipo de impresoras 3D tiene una gran ventaja: puedes imprimir a todo color agregando pigmentos al aglutinante (normalmente cian, magenta, amarillo, negro y blanco).  Este aspecto lo convirtió en el método preferido para los populares selfies 3D. El inconveniente que presenta este método es que peligra la integridad estructural de los objetos. No obtendrás impresiones de alta resolución y resistentes, pero hay algunas excepciones.")