import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/components/components.dart';
import 'package:newsapp/cubit/shop_cubit.dart';
import 'package:newsapp/cubit/states.dart';

class ShopLoginScreen extends StatelessWidget {
  const ShopLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LOGIN",
                        style: TextStyle(fontSize: 50),
                      ),
                      Text(
                        "Login Now To See Our Product ",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defultFormField(
                        validate: (String val) {
                          if (emailController.text.isEmpty) {
                            return "Plase Enter Email";
                          }
                        },
                        isPassowrd: false,
                        controller: emailController,
                        label: "Email",
                        icon: Icons.mail,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      defultFormField(
                        validate: (String val) {
                          if (passwordController.text.isEmpty) {
                            return "Plase Enter Password";
                          }
                        },
                        isPassowrd: ShopCubit.get(context).isPassword,
                        controller: passwordController,
                        label: "Password",
                        icon: Icons.lock,
                        suffixicon: ShopCubit.get(context).suffix,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: ConditionalBuilder(
                          condition: state is! LoadingPostLoginScreen,
                          builder: ((context) {
                            return defultButton(
                                text: "LOGIN",
                                elevation: 0,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    ShopCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                });
                          }),
                          fallback: (context) => CircularProgressIndicator(),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont Have An Account ? ",
                            style: TextStyle(fontSize: 15),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("Register Now"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
