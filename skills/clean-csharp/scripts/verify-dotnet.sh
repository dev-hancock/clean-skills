#!/usr/bin/env bash
# Build/test/optional format verification. May write build/restore caches and outputs; run only when authorised.
set -euo pipefail

usage() {
  echo "Usage: $0 <solution-or-project> [--test-target <test-project-or-solution>] [--configuration Release|Debug] [--format] [--no-tests] [--warnings-as-errors]" >&2
}

if [[ $# -lt 1 ]]; then usage; exit 2; fi
target="$1"; shift
test_target="$target"
configuration="Release"
format=false
no_tests=false
warnings_as_errors=false
while (($#)); do
  case "$1" in
    --test-target) [[ $# -ge 2 ]] || { usage; exit 2; }; test_target="$2"; shift 2 ;;
    --configuration) [[ $# -ge 2 ]] || { usage; exit 2; }; configuration="$2"; shift 2 ;;
    --format) format=true; shift ;;
    --no-tests) no_tests=true; shift ;;
    --warnings-as-errors) warnings_as_errors=true; shift ;;
    *) usage; echo "Unknown option: $1" >&2; exit 2 ;;
  esac
done

if [[ ! -f "$target" ]]; then echo "Target does not exist: $target" >&2; exit 2; fi
if ! command -v dotnet >/dev/null 2>&1; then echo "dotnet SDK not found" >&2; exit 127; fi

echo '== SDK =='
dotnet --version
echo "== Build: $target =="
build_args=(build "$target" --configuration "$configuration")
if [[ "$warnings_as_errors" == true ]]; then build_args+=(-warnaserror); fi
dotnet "${build_args[@]}"
if [[ "$no_tests" == false ]]; then
  if [[ ! -f "$test_target" ]]; then echo "Test target does not exist: $test_target" >&2; exit 2; fi
  echo "== Tests: $test_target =="
  dotnet test "$test_target" --configuration "$configuration"
  echo 'NOTE: Inspect test output; an exit code of 0 is not proof any tests were discovered.'
fi
if [[ "$format" == true ]]; then
  echo "== Format verification: $target =="
  dotnet format "$target" --verify-no-changes
fi
echo 'DONE: invoked commands completed successfully; inspect test discovery/results separately.'
