import 'package:open_data_sakhalin/models/data_set_row_value.dart';

class DataSetRow {
  String name;
  bool isSelected = false;
  List<DataSetRowValue> values;
  DataSetRow({this.name, this.values});
}