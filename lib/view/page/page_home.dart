part of 'page.dart';

class PageHome extends StatefulWidget {
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<ProviderHome>(context, listen: false).setUp();
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ProviderHome>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () async => prov.scanBluetooth(),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          2,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: const Text(
                      "Scan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _buildUI(prov),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUI(ProviderHome prov) {
    if (prov.isLoading) {
      return Container(
        child: Center(
          child: const Text("Loading"),
        ),
      );
    } else if (prov.listBluetooth.length == 0) {
      return Align(
        child: Text(
          "Tidak Ada Data",
        ),
      );
    } else
      // return Container();
      return _bluetoothList(
        context,
        prov,
      );
  }

  Widget _bluetoothList(BuildContext context, ProviderHome prov) {
    return ListView.builder(
      itemCount: prov.listBluetooth.length,
      itemBuilder: (BuildContext context, int index) {
        // ScanResult model = prov.listBluetooth[index];
        return Container(
          child: ItemBluetooth(
            model: prov.listBluetooth[index],
            onTap: () async =>prov.connectDevice(
              prov.listBluetooth[index],
            ),
          ),
          // child: Text(prov.listBluetooth[index].advertisementData.localName),
        );
      },
    );
  }
}
