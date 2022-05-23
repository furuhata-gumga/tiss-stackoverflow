import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiss/components/theme/theme.dart';
import 'package:tiss/screens/categories/categories_cubit.dart';
import 'package:tiss/screens/categories/title_cubit.dart';

import '../../components/button/button_iconRight.dart';
import '../../components/progress/progress_view.dart';
import '../../model/category.dart';
import 'categories_i18n.dart';

class CategoriesView extends StatelessWidget {
  final CategoriesViewLazyI18N _i18n;

  CategoriesView(this._i18n, {Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Categories",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xff00c9ff),
          elevation: 0.0,
          actions: [
            IconButtonRight(
              onClick: () {
                context.read<CategoriesCubit>().openModalAddCategory();
              },
              title: 'New category  ',
              icon: const Icon(Icons.add, size: 17, color: Color(0xfff2f2f2)),
              buttonColor: const Color(0xff32d3ff),
              textColor: const Color(0xfff2f2f2),
            )
          ],
        ),
        body: BlocConsumer<CategoriesCubit, CategoriesState>(
          listenWhen: (previous, current) =>
              current is AddCategoriesState || current is CloseCategoriesState,
          listener: (context, state) {
            if (state is AddCategoriesState) {
              addCateogryDialog(context);
            }
            if (state is CloseCategoriesState) {
              print('ff');
            }
          },
          builder: (context, state) {
            if (state is InitCategoriesState ||
                state is LoadingCategoriesState) {
              return ProgressView(message: 'Carregando categories');
            }
            if (state is AddingCategoriesState) {
              return ProgressView(message: 'Adicionando categoria');
            }
            if (state is LoadedCategoriesState) {
              final categories = state.categories;
              return categoriesList(context, categories);
            }
            return const Text('Unknown error');
          },
        ));
  }

  void addCateogryDialog(BuildContext blocContext) {
    showDialog(
      context: blocContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Criar nova categoria'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Título da categoria',
                  ),
                ),
                const SizedBox(height: 8),
                BlocBuilder<TitleCubit, TitleState>(
                  builder: (blocContext, staten) {
                    if (staten is TitleTrueState) {
                      return const Text('É necessário adicionar um título para a categoria', style: TextStyle(fontWeight: FontWeight.bold, color: redAlert),);
                    } else {
                      return const Text('');
                    }
                  },
                ),
                // Visibility(
                //   child: const Text('É necessário adicionar um título para a categoria', style: TextStyle(fontWeight: FontWeight.bold, color: redAlert),),
                //   visible: blocContext.watch<TitleCubit>().state == true,
                // ),
                const SizedBox(height: 8),
                const Text('Escolha uma cor para a categoria'),
                const SizedBox(height: 8),
                MaterialPicker(
                  pickerColor: blocContext.watch<CategoriesCubit>().getPickerColor(),
                  onColorChanged: (color) {
                    blocContext.read<CategoriesCubit>().changeColor(color);
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // define os botões na base do dialogo
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                if (_titleController.text.isEmpty) {
                  blocContext.read<TitleCubit>().setTrue();
                  // blocContext.read<CategoriesCubit>().reopenModal();
                } else {
                  blocContext.read<CategoriesCubit>().setColor();
                  blocContext.read<CategoriesCubit>().addCategory(_titleController.text);
                  blocContext.read<TitleCubit>().setFalse();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  SizedBox categoriesList(BuildContext context, List<Category> categories) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => {},
                  child: SizedBox(
                    width: 250,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                          color: category.color,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 20,
                            width: 100,
                            child: Text(
                              category.title,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Icon(Icons.brush),
              ],
            ),
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}
