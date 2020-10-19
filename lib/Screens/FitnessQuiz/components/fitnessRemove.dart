import 'package:bot_back_on_track/Screens/FitnessQuiz/components/body.dart';

import 'package:bot_back_on_track/constants.dart';
import 'package:flutter/material.dart';
//import 'package:smart_select/smart_select.dart';

/*class Body extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   // TODO: implement build
   throw UnimplementedError();
 }
}*/

/*class Body extends StatefulWidget {
 @override
 _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
 List<int> value = [2];
 List<S2Choice<int>> frameworks = [
   S2Choice<int>(value: 1, title: 'Ionic'),
   S2Choice<int>(value: 2, title: 'Flutter'),
   S2Choice<int>(value: 3, title: 'React Native'),
 ];

 @override
 Widget build(BuildContext context) {
   return SmartSelect<int>.multiple(
     title: 'Frameworks',
     value: value,
     //choiceItems: options,
     onChange: (state) => setState(() => value = state.value),
   );
 }
}*/

class ouchList {
  static var ouchies = [];
}

class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  MultiSelectDialog({Key key, this.items, this.initialSelectedValues})
      : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked, String itemName) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
        ouchList.ouchies.add(itemName);
      } else {
        _selectedValues.remove(itemValue);
        ouchList.ouchies.remove(itemName);
      }
    });
  }

  void check() {
    if (Body.bananaList.length > 0) {
      for (int i = 0; i < Body.bananaList.length; i++) {
        for (int j = 0; j < ouchList.ouchies.length; j++) {
          if (Body.bananaList[i] == (ouchList.ouchies[j])) {
            Body.bananaList.removeAt(i);
            //print("here");
          }
        }
      }
    }
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    check();
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Pain'),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL', style: TextStyle(color: kPrimaryColor)),
          onPressed: _onCancelTap,
        ),
        FlatButton(
          child: Text('OK', style: TextStyle(color: kPrimaryColor)),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) =>
          _onItemCheckedChange(item.value, checked, item.label),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class fitnessRemove extends StatefulWidget {
  //static var bananaList = [];
  @override
  _stateRemove createState() => _stateRemove();
}

class _stateRemove extends State<fitnessRemove> {
  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  void _showMultiSelect(BuildContext context) async {
    final items = <MultiSelectDialogItem<int>>[
      MultiSelectDialogItem(1, 'Knee Pain'),
      MultiSelectDialogItem(2, 'Calf Pain'),
      MultiSelectDialogItem(3, 'Ankle Pain'),
      MultiSelectDialogItem(4, 'Foot Pain'),
      MultiSelectDialogItem(5, 'Elbow Pain'),
      MultiSelectDialogItem(6, 'Finger Pain'),
      MultiSelectDialogItem(7, 'Shoulder Pain'),
    ];

    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          //initialSelectedValues: [1, 3].toSet(),
        );
      },
    );

    print(selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recovered"),
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*DropdownButton<ListItem>(
                value: _selectedItem,
                items: _dropdownMenuItems,
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                  });
                }),*/
                Text(
                  "What have you recovered from?",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 20),
                Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: RaisedButton(
                    color: kPrimaryColor,
                    child:
                        Text("Select", style: TextStyle(color: Colors.white)),
                    onPressed: () => _showMultiSelect(context),
                  ),
                ),
              ])),
    );
  }
}
