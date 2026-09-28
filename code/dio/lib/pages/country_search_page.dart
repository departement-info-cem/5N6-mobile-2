import 'package:dio/dio.dart';
import 'package:dio_demo/network/api_client.dart';
import 'package:dio_demo/network/dto/country_details_response.dart';
import 'package:dio_demo/services/country_service.dart';
import 'package:flutter/material.dart';

class CountrySearchPage extends StatefulWidget {
  const CountrySearchPage({super.key});

  @override
  State<CountrySearchPage> createState() => _CountrySearchPageState();
}

class _CountrySearchPageState extends State<CountrySearchPage> {
  final TextEditingController _countryTextController = TextEditingController(
    text: 'peru',
  );
  final CountryService _countryService = CountryService(CountryApiClient());
  List<CountryDetailsResponse> _countries = [];

  Future<void> _getCountryDetailsAwait() async {
    // Ressemble à la syntaxe utilisée en C# et en Javascript
    try {
      final List<CountryDetailsResponse> response = await _countryService
          .getCountryDetails(_countryTextController.text);
      print(response);
      setState(() {
        _countries = response;
      });
    } on DioException catch (e) {
      print(e.error);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.response!.data["errors"][0]["message"])),
      );
    }
  }

  void _getCountryDetailsThen() {
    // Première ligne exécutée ci dessous
    _countryService
        .getCountryDetails(_countryTextController.text)
        .then(
          // Ce qu'on fait quand tout s'est passé comme on le souhaite
          (List<CountryDetailsResponse> response) {
            // Troisième ligne exécutée, lorsque l'appel HTTP est terminé
            print(response);
            setState(() {
              _countries = response;
            });
          },
          // Ce qu'on fait quand une erreur est survenue
          onError: (e) {
            print(e);
            if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.response!.data["errors"][0]["message"])),
            );
          },
        );
    // Deuxième ligne exécutée
    print('allo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DIO"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _countryTextController,
              decoration: InputDecoration(
                // Si vous voulez tester, le nom des pays doivent être en anglais. "uni" est un bon terme de recherche.                hintText: 'Ex : peru',
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _getCountryDetailsAwait,
                  child: Text("Appel avec await"),
                ),
                ElevatedButton(
                  onPressed: _getCountryDetailsThen,
                  child: Text("Appel avec then"),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _countries.length,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    Text(
                      _countries[index].emoji,
                      style: TextStyle(fontSize: 32),
                    ),
                    SizedBox(width: 24),
                    Flexible(child: Text(_countries[index].description)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
