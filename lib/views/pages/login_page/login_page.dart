import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/Utils/app_routes.dart';
import 'package:e_commerce/controllers/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/views/pages/login_page/widgets/login_social_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  String? _email, _password;
  late FocusNode _emailFocusNode, _passwordFocusNode;
  bool visibility = false;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login(VoidCallback loginF) {
    if (_formKey.currentState!.validate()) {
      loginF();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    return BlocListener<AuthCubit, AuthState>(
      bloc: cubit,
      listenWhen: (previous, current) =>
          current is AuthSuccess || current is AuthError,
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Success'),
            ),
          );
          Navigator.of(context).pushNamed(AppRoutes.home);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    Text(
                      'Login Account!',
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Please, login with registerd account',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColor.grey,
                          ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      onEditingComplete: () {
                        _emailFocusNode.unfocus();
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => _email = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Pleas enter your email";
                        } else if (!value.contains('@')) {
                          return "Pleas enter a valid email";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Email',
                        prefixIcon: Icon(Icons.email_outlined),
                        prefixIconColor: AppColor.grey,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Password',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      onChanged: (value) => _password = value,
                      obscureText: !visibility,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Pleas enter your password";
                        } else {
                          return null;
                        }
                      },
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () {
                        _passwordFocusNode.unfocus();
                        if (_formKey.currentState!.validate()) {
                          cubit.login(
                              _emailController.text, _passwordController.text);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              visibility = !visibility;
                            });
                          },
                          child: Icon(visibility
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                        ),
                        prefixIconColor: AppColor.grey,
                        suffixIconColor: AppColor.grey,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password?',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: BlocBuilder<AuthCubit, AuthState>(
                        bloc: cubit,
                        buildWhen: (previous, current) =>
                            current is AuthLoading || current is AuthError,
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return ElevatedButton(
                                onPressed: null,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    foregroundColor: AppColor.white),
                                child: const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                ));
                          } else {
                            return ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.login(_emailController.text,
                                      _passwordController.text);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  foregroundColor: AppColor.white),
                              child: Text(
                                'Sign In',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: AppColor.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Or using Other Method',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    LoginSocialItem(
                      icon: FontAwesomeIcons.google,
                      title: 'Sing in with google',
                      color: AppColor.red,
                      onTap: () {},
                    ),
                    const SizedBox(height: 12.0),
                    LoginSocialItem(
                      icon: FontAwesomeIcons.facebookF,
                      title: 'Sing in with facebook',
                      color: Colors.blue,
                      onTap: () {},
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.grey),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Register',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
   //    showModalBottomSheet(
                      //   isScrollControlled: true,
                      //   useSafeArea: true,
                      //   context: context,
                      //   builder: (context) => ForgetPasswordMoadlSheetWidget(
                      //     email: _emailController.text.toString(),
                      //   ),
                      // );