import 'package:aplicativo_series/star_rating.dart';
import 'package:flutter/material.dart';
import 'tv_show_models.dart';

class AddTvShowScreen extends StatefulWidget {
  const AddTvShowScreen({
    super.key,
    required this.addTvShow,
    required this.switchScreen,
  });

  final Function(TvShow) addTvShow;
  final Function(int) switchScreen;

  @override
  State<AddTvShowScreen> createState() => _AddTvShowScreenState();
}

class _AddTvShowScreenState extends State<AddTvShowScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _streamController = TextEditingController();
  final _summaryController = TextEditingController();
  var _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Adicionar Série',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Título'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o título da série';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _streamController,
                  decoration: InputDecoration(labelText: 'Stream'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o stream da série';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),
                TextFormField(
                  minLines: 3,
                  maxLines: 5,
                  controller: _summaryController,
                  decoration: InputDecoration(labelText: 'Sinopse'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a sinopse da série';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nota: ', style: TextStyle(fontSize: 16)),
                    StarRating(
                      onRatingChanged: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final newTvShow = TvShow(
                        title: _titleController.text,
                        stream: _streamController.text,
                        summary: _summaryController.text,
                        rating: _rating,
                      );

                      widget.addTvShow(newTvShow);
                      widget.switchScreen(0);
                    }
                  },
                  child: Text('Adicionar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
