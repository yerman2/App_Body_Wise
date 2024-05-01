// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CondonPage extends StatelessWidget {
  const CondonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 208, 138, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  print('Clic en Regresar');
                  // Agrega aquí la lógica para regresar
                  Navigator.pushNamed(context, '/info_page');
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back),
                    const SizedBox(width: 8.0),
                    Text(
                      'Regresar',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Image.asset(
                      'assets/images/condon.png',
                      fit: BoxFit.contain,
                      height: 100.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      'Métodos anticonceptivos',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/condonM.png',
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Preservativo \n masculino',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'El condón o preservativo masculino es un método anticonceptivo de barrera que bien utilizado evita embarazos no deseados y es, junto con el condón femenino, un método efectivo para prevenir el contagio de VIH e infecciones de transmisión sexual (ITS). (Valdez, Román & Cubillas, 2018)',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 18.0),
                        buildClickableText('¿Quiere Saber Más? Clic aquí',
                            'https://youtu.be/1ZgcGoTdz_g?si=IBnNZZlH3YUOjPO-'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/condonF.png',
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Preservativo \n femenino',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'El condón femenino (CF) es un condón elaborado con un material suave y delgado que se ajusta dentro de la vagina de la mujer. Al igual que el condón masculino, el condón femenino es un método de barrera, no permite el contacto del pene y el esperma con el cuello uterino y la vagina (Coalición para los insumos de salud reproductiva, 2014)',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 18.0),
                        buildClickableText('¿Quiere Saber Más? Clic aquí',
                            'https://youtu.be/3dilfsfB3rA?si=ZtVo-Hu69M9Pw3Pj'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/aguja.png',
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Anticonceptivos \n inyectables',

                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Los anticonceptivos inyectables combinados previenen la ovulación en el 99% de los casos, siempre y cuando se apliquen de manera correcta y regular. Se prescriben en dosis única, una vez al mes, lo que facilita el apego al tratamiento; además, son discretos y brindan confidencialidad. Después de suspender el tratamiento se recupera la fertilidad rápidamente. (Vallejo, 2019)',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 18.0),
                        buildClickableText('¿Quiere Saber Más? Clic aquí',
                            'https://youtu.be/SqG7j8c-7zc?si=JJXJSp1GRYuuc-Ar'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/solohormona.png',
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Pastillas de \n una sola hormona',

                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'La mayoría de las píldoras de progestágeno y los implantes de levonorgestrel inhiben la ovulación en el 50% a 60% de los ciclos. Las píldoras de desogestrel y el implante de etonogestrel y los inyectables liberan dosis más altas de esteroides e inhiben la ovulación con mayor frecuencia. ( ICMER, 2017 )',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 18.0),
                        buildClickableText('¿Quiere Saber Más? Clic aquí',
                            'https://www.youtube.com/watch?v=dKl3q_9P8SQ'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/AHE.png',
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Anticoncepción \n de Emergencia (AHE)',

                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'La eficiencia de la AE es por las diferencias entre individuos, periodo fértil de cada uno y momento del coito; en relaciones sexuales fuera del periodo fértil la eficacia anticonceptiva es de 100%, haya tomado o no AE (Vargas et al., 2016)',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 18.0),
                        buildClickableText('¿Quiere Saber Más? Clic aquí',
                            'https://youtu.be/o0ot8clpVGo?si=04MrvOBc-IOiht5K'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/DIU.png',
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Dispositivo \n Intrauterino (DIU)',

                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'El DIU de cobre evita más de 99% de embarazos y se recomienda para todas las mujeres, como primera línea; aunque no siempre es posible y para muchas mujeres es inaceptable o inadecuado; debe evitarse en mujeres con ETS por el mayor riesgo de enfermedad pélvica inflamatoria.(Vargas et al., 2016)',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 18.0),
                        buildClickableText('¿Quiere Saber Más? Clic aquí',
                            'https://youtu.be/O2xk6jCHV34?si=NJTmGSM0vwv-3e7A'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/subdermico.png',
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Implante \n subdérmico',

                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Los métodos más efectivos durante un período de hasta 5 años, dependiendo del implante. Al ser un método anticonceptivo de larga duración, es efectivo independientemente de cualquier acción de las personas usuarias, esto es, su eficacia no depende de lo que hace o no hace quien lo usa y ofrece en todas sus presentaciones una eficacia anticonceptiva mayor al 99% y alta tasa de adherencia al año (mayor al 80 %). Adicionalmente, su acción anticonceptiva es reversible de inmediato. (MSA, 2022)',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 18.0),
                        buildClickableText('¿Quiere Saber Más? Clic aquí',
                            'https://youtu.be/4gX8aFjZ5rI?si=ZswrizqIyz0r1ZsR'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/ligadura.png',
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Ligadura',

                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'La ligadura de trompas, también conocida como «unión de trompas» o «esterilización tubárica», es un tipo de anticonceptivo permanente. Durante la ligadura de trompas, las trompas de Falopio se cortan, ligan o bloquean para evitar el embarazo de forma permanente. ( Mayo Clinic,2023)',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 18.0),
                        buildClickableText('¿Quiere Saber Más? Clic aquí',
                            'https://youtu.be/7yn6UR297m4?si=lPv3I3SYeOWTLTB8'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/vasectomia.png',
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Implante \n subdérmico',

                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'La Vasectomía es un método anticonceptivo para el hombre fácil y muy seguro, que puede ser reversible pero mayoritariamente permanente. La Vasectomía es una técnica que consisten la sección de los conductos deferentes por los cuales llevan los espermatozoides desde los testículos hasta la uretra.Objetivos: El principal objetivo de la Vasectomía es evitar el embarazo, ya que se incluye dentro de los métodos anticonceptivos masculinos (David Padilla Góngora et al., 2018)',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 18.0),
                        buildClickableText('¿Quiere Saber Más? Clic aquí',
                            'https://youtu.be/sqswA_DGQM0?si=3raFc8D60WRP8TwY'),
                      ],
                    ),
                  ),
                ),
              ],
            ), 
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/anillo.png',
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Anillo \n vaginal',

                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Los anillos anticonceptivos contienen estrógeno y gestágeno y presentan el mismo mecanismo de acción que los anticonceptivos orales. Por ello resulta razonable suponer que también pueden ser utilizados en pauta extendida o continua con resultados similares a los de los anticonceptivos orales (Lete & Paz, 2020)',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 18.0),
                        buildClickableText('¿Quiere Saber Más? Clic aquí',
                            'https://youtu.be/Fub12ZODrXI?si=Q6OVstAO9wO3JwUX'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/parche.png',
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Parches',

                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Es un método altamente efectivo si se usa adecuadamente. El riesgo de un embarazo es mayor si la mujer no cambia el parche según las instrucciones. Para una mayor efectividad se recomienda combinarlo con el uso del condón. Contienen hormonas similares a las que produce el cuerpo de la mujer, las cuales inhiben la ovulación, cambia la consistencia de la capa interna del útero y las características del moco cervical, impidiendo de esta manera que ocurra un embarazo.(UNFPA, SEP , Secretaría de salud & Centro nacional de equidad de género y salud reproductiva, 2016)',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 18.0),
                        buildClickableText('¿Quiere Saber Más? Clic aquí',
                            'https://youtu.be/e9VOrpBdwts?si=yY2piUzyLVJ-Z6mG'),
                            
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClickableText(String text, String url) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: RichText(
        text: TextSpan(
          text: text,
          style: TextStyle(fontSize: 16, color: Colors.black),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launch(url);
            },
        ),
      ),
    );
  }
}
