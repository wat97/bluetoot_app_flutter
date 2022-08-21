part of 'provider.dart';

class ProviderHome with ChangeNotifier {
  bool isLoading = true;
  late FlutterBlue flutterBlue;
  List<ScanResult> listBluetooth = [];

  setUp() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      flutterBlue = FlutterBlue.instance;
    });
  }

  scanBluetooth() async {
    print("scanan("+ (await flutterBlue.isOn).toString() +")");
    if (await flutterBlue.isOn) {
      isLoading = true;
      notifyListeners();
      // Start scanning
      flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
      var subscription = flutterBlue.scanResults.listen((results) {
        listBluetooth = [];
        isLoading = false;
        for (ScanResult model in results) {
          print("deviceName = ${model.device.name}, deviceId = ${model.device.id}");
          // if(model.device.name.isNotEmpty){
            listBluetooth.add(model);
            notifyListeners();
          // }
        }
        
      },);
      // isLoading = false;
      // notifyListeners();
    } else {
      print("Bluetooth Not On");
    }
  }

  connectDevice(ScanResult modelResult) async {
    print("kliked ${modelResult.device.name}");
    await modelResult.device.connect();
  }
  
}
