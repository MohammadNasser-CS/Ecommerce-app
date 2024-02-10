import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/Utils/app_routes.dart';
import 'package:e_commerce/controllers/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/views/pages/login_page/widgets/login_social_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController,
      _passwordController,
      _usernameController;
  late FocusNode _emailFocusNode, _passwordFocusNode, _usernameFocusedNode;
  bool visibility = false;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _usernameFocusedNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      await BlocProvider.of<AuthCubit>(context).register(
        _emailController.text,
        _passwordController.text,
        _usernameController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 36,
                  ),
                  Text(
                    'Create Account',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Start learning with create account',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColor.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Username',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your username";
                      } else {
                        return null;
                      }
                    },
                    onEditingComplete: () {
                      _usernameFocusedNode.unfocus();
                      FocusScope.of(context).requestFocus(_emailFocusNode);
                    },
                    textInputAction: TextInputAction.next,
                    focusNode: _usernameFocusedNode,
                    keyboardType: TextInputType.emailAddress,
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your username',
                      prefixIcon: Icon(
                        Icons.person_outline,
                      ),
                      prefixIconColor: AppColor.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      } else {
                        return null;
                      }
                    },
                    onEditingComplete: () {
                      _emailFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    textInputAction: TextInputAction.next,
                    focusNode: _emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      prefixIconColor: AppColor.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      } else {
                        return null;
                      }
                    },
                    onEditingComplete: () {
                      _passwordFocusNode.unfocus();
                      register();
                    },
                    focusNode: _passwordFocusNode,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    obscureText: !visibility,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(
                        Icons.password,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(
                            () {
                              visibility = !visibility;
                            },
                          );
                        },
                        child: Icon(
                          visibility == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      suffixIconColor: AppColor.grey,
                      prefixIconColor: AppColor.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: BlocConsumer<AuthCubit, AuthState>(
                      bloc: BlocProvider.of<AuthCubit>(context),
                        listenWhen: (previous, current) =>
                            current is AuthSuccess || current is AuthError,
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Register Success!'),
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
                        buildWhen: (previous, current) =>
                            current is AuthLoading || current is AuthError,
                      builder: (context, state) {
                        if (state is AuthLoading) {
                            return ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).primaryColor,
                                foregroundColor: AppColor.white,
                              ),
                              child: const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            );
                          }
                        return ElevatedButton(
                          onPressed: register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: AppColor.white,
                          ),
                          child: Text(
                            'Create Account',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w600),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Or using other method',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColor.grey,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  LoginSocialItem(
                    icon: FontAwesomeIcons.google,
                    title: 'Sign Up with Google',
                    color: AppColor.red,
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  LoginSocialItem(
                    icon: FontAwesomeIcons.facebookF,
                    title: 'Sign Up with Facebook',
                    color: AppColor.blue,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}