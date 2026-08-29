import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../../core/localization/locale_controller.dart';
import '../../../../core/motion/app_motion.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n/app_localizations.dart';

/// Dictates a search query.
///
/// Recognition runs on the device's own recogniser, so no audio leaves the
/// phone and there is no API key or per-request cost. Returns the transcript,
/// or null if the customer cancelled or nothing was heard.
Future<String?> showVoiceSearchSheet(BuildContext context) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    isDismissible: true,
    backgroundColor: Theme.of(context).colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (BuildContext context) => const _VoiceSearchSheet(),
  );
}

class _VoiceSearchSheet extends StatefulWidget {
  const _VoiceSearchSheet();

  @override
  State<_VoiceSearchSheet> createState() => _VoiceSearchSheetState();
}

enum _Phase { starting, listening, unavailable, denied }

class _VoiceSearchSheetState extends State<_VoiceSearchSheet>
    with SingleTickerProviderStateMixin {
  final SpeechToText _speech = SpeechToText();

  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  )..repeat(reverse: true);

  _Phase _phase = _Phase.starting;
  String _heard = '';

  /// 0..1, from the recogniser's own level meter. Drives the ring, so the
  /// animation reflects the room rather than a fixed loop.
  double _level = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _start());
  }

  @override
  void dispose() {
    _pulse.dispose();
    // Stop rather than cancel: stopping keeps whatever was already recognised.
    _speech.stop();
    super.dispose();
  }

  Future<void> _start() async {
    final bool ready = await _speech.initialize(
      onError: (SpeechRecognitionError error) {
        if (!mounted) return;
        // `notListening` simply means the recogniser timed out on silence,
        // which is not worth an error screen.
        if (error.errorMsg.contains('permission')) {
          setState(() => _phase = _Phase.denied);
        }
      },
      onStatus: (String status) {
        if (!mounted) return;
        if (status == 'done' || status == 'notListening') _finish();
      },
    );

    if (!mounted) return;
    if (!ready) {
      setState(() => _phase = _Phase.unavailable);
      return;
    }

    setState(() => _phase = _Phase.listening);

    // Match the app's language where the device supports it, so a Tamil
    // customer can dictate in Tamil rather than being forced into English.
    final String appLocale =
        context.read<LocaleController>().locale.toLanguageTag();
    final List<LocaleName> locales = await _speech.locales();
    final String? matched = locales
        .map((LocaleName l) => l.localeId)
        .cast<String?>()
        .firstWhere(
          (String? id) =>
              id != null &&
              id.replaceAll('_', '-').toLowerCase().startsWith(
                    appLocale.split('-').first.toLowerCase(),
                  ),
          orElse: () => null,
        );

    await _speech.listen(
      onResult: (SpeechRecognitionResult result) {
        if (!mounted) return;
        setState(() => _heard = result.recognizedWords);
        if (result.finalResult) _finish();
      },
      onSoundLevelChange: (double level) {
        if (!mounted) return;
        // The plugin reports roughly -2..10 on Android; normalise for the ring.
        setState(() => _level = level.clamp(0, 10) / 10);
      },
      listenOptions: SpeechListenOptions(
        localeId: matched,
        partialResults: true,
        cancelOnError: true,
        // Stops on its own three seconds after the customer finishes, and
        // never holds the microphone longer than twenty.
        listenFor: const Duration(seconds: 20),
        pauseFor: const Duration(seconds: 3),
      ),
    );
  }

  void _finish() {
    if (!mounted) return;
    final String text = _heard.trim();
    Navigator.of(context).pop(text.isEmpty ? null : text);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    final String title = switch (_phase) {
      _Phase.listening => l10n.listeningNow,
      _Phase.starting => l10n.listeningNow,
      _Phase.unavailable => l10n.voiceUnavailable,
      _Phase.denied => l10n.microphoneDenied,
    };

    final bool failed = _phase == _Phase.unavailable || _phase == _Phase.denied;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.outline,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 28),
          if (failed)
            Icon(Icons.mic_off_rounded, size: 56, color: theme.colorScheme.error)
          else
            _PulsingMic(pulse: _pulse, level: _level),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 10),
          // The transcript as it arrives, so the customer can see it is
          // working before it commits. Reserved height stops the sheet
          // jumping as words appear.
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 54),
            child: Text(
              _heard.isEmpty
                  ? (failed ? l10n.voiceUnavailableBody : l10n.speakNowHint)
                  : _heard,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: _heard.isEmpty
                  ? theme.textTheme.bodyMedium
                  : theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text(l10n.cancelLabel),
                ),
              ),
              if (!failed) ...<Widget>[
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    // Ends the wait early rather than sitting through the
                    // silence timeout once the customer has said their piece.
                    onPressed: _heard.trim().isEmpty ? null : _finish,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.greenDeep,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(l10n.searchTitle),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// The microphone, ringed by a halo that grows with what the mic is hearing.
class _PulsingMic extends StatelessWidget {
  const _PulsingMic({required this.pulse, required this.level});

  final AnimationController pulse;
  final double level;

  @override
  Widget build(BuildContext context) {
    // Reduced motion keeps the mic, drops the movement.
    if (AppMotion.reduced(context)) {
      return const _MicCircle(halo: 0);
    }

    return AnimatedBuilder(
      animation: pulse,
      builder: (BuildContext context, _) {
        // A breath when the room is quiet, the real level when it is not, so
        // the sheet never looks frozen while it waits.
        final double halo = level > 0.05 ? level : pulse.value * 0.35;
        return _MicCircle(halo: halo);
      },
    );
  }
}

class _MicCircle extends StatelessWidget {
  const _MicCircle({required this.halo});

  final double halo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 148,
      height: 148,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 96 + halo * 52,
            height: 96 + halo * 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greenDeep.withValues(alpha: 0.12 + halo * 0.10),
            ),
          ),
          Container(
            width: 84,
            height: 84,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greenDeep,
            ),
            child: const Icon(Icons.mic_rounded, size: 40, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
