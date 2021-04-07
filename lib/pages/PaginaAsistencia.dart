import 'package:flutter/material.dart';

class PaginaAsistencia extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Formacion',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Hora',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Encargado',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Programacion orientada a objetos')),
            DataCell(Text('01:00-02:00')),
            DataCell(Text('Instr. Katerine')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Aplicaciones moviles')),
            DataCell(Text('09:00-11:00')),
            DataCell(Text('Instr. Yeison')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Transversal: Ingles')),
            DataCell(Text('08:00-09:00')),
            DataCell(Text('Instr. ingles')),
          ],
        ),
         DataRow(
          cells: <DataCell>[
            DataCell(Text('Riesgos laborales')),
            DataCell(Text('10:00-10:00')),
            DataCell(Text('Instr. Ada')),
          ],
        ),
         DataRow(
          cells: <DataCell>[
            DataCell(Text('Boostrap')),
            DataCell(Text('08:00_09:00')),
            DataCell(Text('Instr. Jairo')),
          ],
        ),
      ],
    );
  }
}
