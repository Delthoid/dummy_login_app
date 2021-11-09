import 'package:dummy_login_app/models/model.dart';
import 'package:dummy_login_app/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AlbumProvider provider;
  late Future<Album> futureAlbum;
  @override
  void initState() {
    // TODO: implement initState
    provider = Provider.of<AlbumProvider>(context, listen: false);
    futureAlbum = provider.fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Practice'),
      ),
      body: Container(
        child: Consumer<AlbumProvider>(
          builder: (context, album, child) {
            return FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.title);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                });
          },
        ),
      ),
    );
  }
}
