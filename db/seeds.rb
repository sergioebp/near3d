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

Technology.create(name: 'FDM', description: "es el método de impresión 3D más común en impresoras 3D de escritorio. El filamento termoplástico se calienta y se extruye en coordenadas de X e Y a través del cabezal de extrusión, mientras que la superficie de impresión va bajando el objeto capa por capa en la dirección Z. De este modo el objeto se imprime de abajo hacia arriba. Si se diera el caso de que un modelo tuviera partes que sobresalen, necesitará estructuras de soporte que se puedan quitar una vez que la impresión haya finalizado. Este tipo de impresora 3D es una manera rentable de desarrollar un producto y de crear de forma rápida prototipos en los sectores de pequeñas empresas y la educación, ya que es capaz de fabricar piezas robustas de manera eficiente y rápida.")

Technology.create(name: 'SLA', description: "Esta tecnología funciona mediante la exposición de una capa de resina líquida fotosensible a un rayo láser UV para que se endurezca y se solidifique. Una vez que el láser recorre una capa de resina en el patrón deseado, este comienza a endurecerse. Acto seguido, la plataforma de impresión del modelo, situada en el tanque líquido de la impresora, baja una capa y el láser comienza a formar la siguiente capa. Cada capa se construye sobre la anterior. Al igual que en la tecnología de impresión 3D FDM, los objetos con partes sobresalientes impresos con estos tipos de impresoras 3D, necesitarán estructuras de soporte. Una vez completada la impresión, el objeto debe enjuagarse con un disolvente. En ocasiones también se hornea en un horno UV para finalizar el procesamiento. La tecnología SLA crea objetos con superficies lisas y mucho detalle. Es cada vez más popular en sectores como la joyería y la odontología cosmética para la creación de moldes maleables.")

Technology.create(name: 'DLP', description: "La tecnología DLP usa una red eléctrica de microespejos controlados por ordenador dispuestos en un molde sobre un chip semiconductor. Estos diminutos espejos se inclinan hacia adelante y hacia atrás. Cuando un espejo está inclinado, refleja la luz, lo que refleja un píxel brillante. Mientra que si el espejo está inclinado hacia el lado opuesto, el píxel se volverá oscuro. Este tipo de tecnología se usa en proyectores de películas, teléfonos móviles y también para la impresión en 3D. Uno de los beneficios que presenta para la impresión 3D es su velocidad: puede imprimir capas en un instante.")

Technology.create(name: 'SLS', description: "este tipo de impresora 3D utiliza material en polvo en el área de impresión. Se usa un láser para sinterizar selectivamente una capa de gránulos que une el material para crear una estructura sólida. Cuando el objeto está completamente formado, se deja enfriar en la máquina antes de retirarlo. El SLS es ampliamente utilizado para el desarrollo de productos y la creación rápida de prototipos orientados a industrias comerciales. Asimismo, es útil para la fabricación de productos finales de uso limitado, como piezas usadas en el sector industrial (por ejemplo, piezas de maquinarias). Los materiales utilizados en el SLS pueden variar desde nailon, vidrio y cerámica hasta aluminio, plata e incluso acero.Sin embargo, este tipo de impresora 3D requiere del uso de costosos láseres de alta potencia, lo que la sitúa un poco fuera del alcance del consumidor promedio.")

Technology.create(name: 'BJ', description: "Este tipo de impresión 3D se inventó en el MIT (Instituto Tecnológico de Massachusetts).La inyección de aglutinante es un proceso de fabricación aditiva. Este tipo de impresora 3D utiliza dos materiales: un material a base de polvo (a menudo yeso) y un agente adhesivo, que actúa uniendo las capas de polvo.  Por lo general, el aglutinante se extruye en forma líquida desde un cabezal de impresión al igual que en una impresora 2D de inyección de tinta convencional. Una vez que se termina una capa, la superficie de impresión baja y el proceso se vuelve a repetir. Puedes utilizar esta tecnología de impresión 3D con cerámica, metal, arena o plástico. Este tipo de impresoras 3D tiene una gran ventaja: puedes imprimir a todo color agregando pigmentos al aglutinante (normalmente cian, magenta, amarillo, negro y blanco).  Este aspecto lo convirtió en el método preferido para los populares selfies 3D. El inconveniente que presenta este método es que peligra la integridad estructural de los objetos. No obtendrás impresiones de alta resolución y resistentes, pero hay algunas excepciones.")