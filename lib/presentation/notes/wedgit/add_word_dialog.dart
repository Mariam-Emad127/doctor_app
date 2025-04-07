import 'package:flutter/material.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});
  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  final GlobalKey<FormState>formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: AnimatedContainer(
            padding:const EdgeInsets.all(15),
            duration: const Duration(milliseconds: 750),
          //  color: Color(WriteDataCubit.get(context).colorCode),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  //ArabicOrEnglishWidget(
                   // colorCode: WriteDataCubit.get(context).colorCode,
                   // arabicIsSelected: WriteDataCubit.get(context).isArabic,
                  //),
                  const SizedBox(height: 8,),

                 // ColorsWidget(activeColorCode: WriteDataCubit.get(context).colorCode),
                  const SizedBox(height: 10,),

                  //App(formKey: formKey, label: "New Word"),
                  TextFormField(
                    key: formKey,
                    decoration:   InputDecoration( 
        label: Text( "New Word"),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:const BorderSide(color: Colors.white,width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:const BorderSide(color: Colors.white,width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:const BorderSide(color: Colors.red,width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:const BorderSide(color: Colors.red,width: 2),
        ),
      )
  
 ),
                  const SizedBox(height: 15,),

                   IconButton(
                    icon: Icon(Icons.abc_outlined),
                   // colorCode: WriteDataCubit.get(context).colorCode, 
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        //WriteDataCubit.get(context).addWord();
                        //ReadDataCubit.get(context).getWords();
                      }
                    },
                  ),
                ],
              ),
            ),
          )
       
      
    );
  }

  //SnackBar _getSnackBar(String message) => SnackBar(content: Text(message),backgroundColor: ColorManager.red,);
}