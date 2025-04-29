#!/bin/bash
# run function in all dirs
# expects a function name
allDirs() {
  dirs=()
  while IFS='' read -r line; do dirs+=("$line"); done < <(find . -maxdepth 2 -type d)
  for dir in "${dirs[@]}"; do
    $1 "$dir"
  done
}

runGet() {
  cd "$1" || return
  if [ -f "pubspec.yaml" ]; then
    flutter clean && flutter pub get
  fi
  cd - >/dev/null || return
}

flutter clean

allDirs "runGet"

# generate localization keys
cd "core" || exit
dart run easy_localization:generate -f keys -o locale_keys.g.dart -O lib/src/localization/generated -S resources/lang

# generate data layer files
cd "../data" || exit
dart run build_runner build --delete-conflicting-outputs

# generate auto route modules
if [ -d '../features' ]; then
  cd "../features"
  find . -mindepth 1 -maxdepth 1 -type d -exec sh -c 'cd "$0" && echo "$0" && dart run build_runner build --delete-conflicting-outputs' {} \;
fi

# generate auto route files
cd "../navigation" || exit
dart run build_runner build --delete-conflicting-outputs
