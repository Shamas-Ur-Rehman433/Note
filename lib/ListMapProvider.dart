import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier {
  List<Map<String,String>> _mdata=[];



  void addData(Map<String,String> data){
    _mdata.add(data);
    notifyListeners();
  }

  void removedata(int index){
    _mdata.removeAt(index);
    notifyListeners();
  }

  void updateData(int index, String title, String description) {
    if (index >= 0 && index < _mdata.length) {
      _mdata[index] = {
        'title': title,
        'description': description,
      }; // Update the data at the specified index
      notifyListeners();
    }
  }


  List<Map<String, String>> getdata() {
    return _mdata;
  }
}
