import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const String _path = '[Patterns]';

class AuthTemplate extends StatelessWidget {
  const AuthTemplate({super.key, this.isSignUp = false});

  final bool isSignUp;

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;
    final ColorScheme cs = Theme.of(context).colorScheme;

    return AppScaffold(
      body: AppAuthCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(child: AppBrandLogo()),
            const SizedBox(height: AppSpacing.xxl),
            Text(
              isSignUp ? 'Crea tu cuenta' : 'Bienvenido de nuevo',
              style: text.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              isSignUp
                  ? 'Encuentra tu próximo hogar cerca del campus.'
                  : 'Ingresa para continuar con tu búsqueda.',
              style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xxl),
            if (isSignUp) ...[
              const AppTextField(
                label: 'Nombre completo',
                hintText: 'Juan Pérez',
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
            const AppTextField(
              label: 'Correo',
              hintText: 'tu@correo.com',
              prefixIcon: Icons.mail_outline,
            ),
            const SizedBox(height: AppSpacing.lg),
            const AppTextField(
              label: 'Contraseña',
              hintText: '••••••••',
              obscureText: true,
              prefixIcon: Icons.lock_outline,
            ),
            if (!isSignUp)
              Align(
                alignment: Alignment.centerRight,
                child: AppTextButton(
                  label: '¿Olvidaste tu contraseña?',
                  onPressed: () {},
                ),
              ),
            const SizedBox(height: AppSpacing.xl),
            AppPrimaryButton(
              label: isSignUp ? 'Crear cuenta' : 'Ingresar',
              expanded: true,
              onPressed: () {},
            ),
            const SizedBox(height: AppSpacing.xl),
            const AppLabeledDivider(label: 'o continúa con'),
            const SizedBox(height: AppSpacing.lg),
            AppGoogleButton(label: 'Continuar con Google', onPressed: () {}),
            const SizedBox(height: AppSpacing.lg),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isSignUp ? '¿Ya tienes cuenta?' : '¿No tienes cuenta?',
                  style: text.bodyMedium,
                ),
                AppTextButton(
                  label: isSignUp ? 'Inicia sesión' : 'Regístrate',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

@UseCase(name: 'Sign in', type: AuthTemplate, path: _path)
Widget authTemplateSignIn(BuildContext context) {
  return const AuthTemplate();
}

@UseCase(name: 'Sign up', type: AuthTemplate, path: _path)
Widget authTemplateSignUp(BuildContext context) {
  return const AuthTemplate(isSignUp: true);
}
