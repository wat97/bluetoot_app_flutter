part of 'item.dart';

class ItemBluetooth extends StatelessWidget {
  final ScanResult model;
  final Function onTap;
  ItemBluetooth({
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: 5,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Text(
                  model.device.id.id +" "+ model.device.name + " " + model.advertisementData.localName,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  onTap();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                  ),
                  child: !model.advertisementData.connectable ? Text("ConnectTed") : Text("Connect") ,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
