# All executable checks enter full validation unless explicitly extended below.
# Fast membership is listed here, independently of target naming conventions.
set(AVM_FAST_CHECKS
    avm_core_fast_run
    avm_format_long_long_tests_run
    avm_push16_tests_run avm_stack_bounds_tests_run
    avm_timer0_tests_run avm_display_system_tests_run
    avm_audio_core_isa_run avm_audio_core_audio_run
    avm_audio_demo_integration_run avm_audio_playlist_assets_run avm_audio_formatter_run
    avm_audio_export_c_run avm_audio_export_cpp_run avm_music_tests_run
    avm_runner_cli_tests_run
    avm_math_fast avm_math_accuracy_fast avm_trig_accelerators_run)
set(AVM_EXTENDED_CHECKS
    avm_lldb_long_replay_run
    avm_prof_throughput_run avm_trap_lookup_bench_run
    avm_math_accuracy_tests_run avm_complex_reference_tests_run)
