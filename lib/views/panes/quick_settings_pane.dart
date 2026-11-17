import 'dart:io';

import 'package:material_3_expressive/material_3_expressive.dart';
import 'package:material_ui/material_ui.dart';

class QuickSettingsPane extends StatelessWidget {
  const QuickSettingsPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isLinux
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              _buildPowerOption(
                label: 'Sleep',
                icon: M3EIcons.do_not_disturb_on_rounded,
                color: Color.fromARGB(255, 0, 188, 212),
                onPressed: () {
                  Process.run('systemctl', ['suspend']);
                },
              ),
              _buildPowerOption(
                label: 'Restart',
                icon: M3EIcons.autorenew_rounded,
                color: Color.fromARGB(255, 255, 152, 0),
                onPressed: () {
                  Process.run('reboot', []);
                },
              ),
              _buildPowerOption(
                label: 'Shut down',
                icon: M3EIcons.power_settings_new_rounded,
                color: Color.fromARGB(255, 244, 67, 54),
                onPressed: () {
                  Process.run('shutdown', ['--now']);
                },
              ),
            ],
          )
        : Center(child: Text('No power options'));
  }

  Widget _buildPowerOption({
    required String label,
    required IconData icon,
    required Color color,
    Function? onPressed,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4,
      children: [
        M3EIconButton(
          decoration: M3EIconButtonDecoration(
            backgroundColor: WidgetStatePropertyAll(color),
            foregroundColor: WidgetStatePropertyAll(
              Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          icon: Icon(icon),
          onPressed: () {
            if (onPressed != null) onPressed();
          },
          tooltip: label,
        ),
      ],
    );
  }
}
