import 'package:flutter/material.dart';
import 'package:flutter_application_1/backEnd/entities/Category.dart';

enum ActionForm { read, add, save }

class FormCategory extends StatefulWidget {
  final ActionForm actionForm;
  final Category? record;
  final String logoInitial;
  final Object repositoryObject;
  final Function saveOrAddFunc;

  const FormCategory(
      {Key? key,
      required this.actionForm,
      required this.record,
      required this.logoInitial,
      required this.repositoryObject,
      required this.saveOrAddFunc})
      : super(key: key);

  @override
  State<FormCategory> createState() => _FormCategoryState();
}

class _FormCategoryState extends State<FormCategory> {
  final _formKey = GlobalKey<FormState>();

  String? _fieldValidator(String? value) {
    return value == null || value.isEmpty ? 'Please enter some text' : null;
  }

  TextEditingController categorySysUuidCtler = TextEditingController();
  TextEditingController categoryNameCtler = TextEditingController();
  TextEditingController categoryColorCtler = TextEditingController();
  TextEditingController categotyDescriptionCtler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.actionForm == ActionForm.read) {
      categorySysUuidCtler.text = widget.record!.sysUuid!;
      categoryNameCtler.text = widget.record!.name;
      categoryColorCtler.text = widget.record!.color!;
      categotyDescriptionCtler.text = widget.record!.description!;
    }

    return Scaffold(
      appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.cyan,
            ),
      body: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Text(
                widget.logoInitial,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                TextFormField(
                  controller: categoryNameCtler,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    counter: SizedBox.shrink(),
                  ),
                  maxLength: 15,
                  validator: (value) => _fieldValidator(value),
                ),
                TextFormField(
                  controller: categoryColorCtler,
                  decoration: const InputDecoration(labelText: "Color"),
                  validator: (value) => _fieldValidator(value),
                ),
                TextFormField(
                  controller: categotyDescriptionCtler,
                  decoration: const InputDecoration(labelText: "Description"),
                  validator: (value) => _fieldValidator(value),
                ),
                Align(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.cyan),
                    child: (widget.actionForm == ActionForm.add)
                        ? const Text("Add")
                        : const Text("Save"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          (widget.actionForm == ActionForm.add)
                              ? const SnackBar(
                                  content: Text('Submiting new record...'),
                                )
                              : const SnackBar(content: Text('Saving...')),
                        );

                        Category myTestCategory = Category(
                            sysUuid: (widget.actionForm == ActionForm.add)
                                ? null
                                : categorySysUuidCtler.text,
                            name: categoryNameCtler.text,
                            color: categoryColorCtler.text,
                            description: categotyDescriptionCtler.text);

                        if (widget.actionForm == ActionForm.add) {
                          widget.saveOrAddFunc([myTestCategory.toJson()]);
                        } else {
                          widget.saveOrAddFunc([myTestCategory.toJson()]);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
