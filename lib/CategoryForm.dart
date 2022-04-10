import 'package:flutter/material.dart';
import 'backEnd/entities/category.dart';

enum TypeCategoryForm { read, add, save }

class CategoryForm extends StatefulWidget {
  final TypeCategoryForm typeCategoryForm;
  final Category? record;
  final Function? addOrSaveFunction;

  const CategoryForm(
      {Key? key, required this.typeCategoryForm, this.record, this.addOrSaveFunction})
      : super(key: key);

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final _formKey = GlobalKey<FormState>();

   final Map<String, Color?> color = {
    "blue": Colors.blue[200],
    "red": Colors.red[200],
    "purple": Colors.purple[200],
    "pink": Colors.pink[200],
  };

  String? _fieldValidator(String? value) {
    return value == null || value.isEmpty ? 'Please enter some text' : null;
  }

  TextEditingController sysUuidCtler = TextEditingController();
  TextEditingController nameCtler = TextEditingController();
  TextEditingController colorCtler = TextEditingController();
  TextEditingController descriptionCtler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.typeCategoryForm == TypeCategoryForm.read) {
      nameCtler.text = widget.record!.name;
      sysUuidCtler.text = widget.record!.sysUuid!;
      colorCtler.text = widget.record!.color!;
      descriptionCtler.text = widget.record!.description!;
    }

    return Scaffold(
      appBar: (widget.typeCategoryForm == TypeCategoryForm.read)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.lightBlue,
            )
          : null,
      body: Column(
        children: <Widget>[
          const CircleAvatar(backgroundColor: Colors.transparent, radius: 35),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                TextFormField(
                  controller: nameCtler,
                  decoration: const InputDecoration(
                      labelText: "Name", counter: SizedBox.shrink()),
                  maxLength: 15,
                  validator: (value) => _fieldValidator(value),
                ),
                TextFormField(
                  controller: descriptionCtler,
                  decoration: const InputDecoration(labelText: "Description"),
                  validator: (value) => _fieldValidator(value),
                ),
                TextFormField(
                  controller: colorCtler,
                  decoration: const InputDecoration(labelText: "Color"),
                  validator: (value) => _fieldValidator(value),
                ),
                Align(
                  child: ElevatedButton(
                    child: (widget.typeCategoryForm == TypeCategoryForm.add)
                        ? const Text("Add")
                        : const Text("Save"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          (widget.typeCategoryForm == TypeCategoryForm.add)
                              ? const SnackBar(
                                  content: Text('Submiting new record...'),
                                )
                              : const SnackBar(content: Text('Saving...')),
                        );

                        Category myTestCategory = Category(
                            sysUuid: (widget.typeCategoryForm == TypeCategoryForm.add)
                                ? null
                                : sysUuidCtler.text,
                            name: nameCtler.text,
                            color: colorCtler.text,
                            description: descriptionCtler.text);

                        widget.addOrSaveFunction!([myTestCategory.toJson()]);
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
