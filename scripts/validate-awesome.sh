#!/usr/bin/env bash
set -euo pipefail

fail=0

for required in README.md LICENSE CONTRIBUTING.md CODE_OF_CONDUCT.md CHANGELOG.md .gitignore docs/CURATION-POLICY.md; do
  if [ ! -f "$required" ]; then
    echo "missing: $required" >&2
    fail=1
  fi
done

for section in "Đây là gì" "Nội dung" "Đóng góp" "Giấy phép" "Tác giả"; do
  if ! grep -q "## $section" README.md; then
    echo "README missing section: $section" >&2
    fail=1
  fi
done

if grep -nE "https?://bit\.ly|https?://tinyurl\.com" README.md; then
  echo "shortened links are not allowed" >&2
  fail=1
fi

if ! grep -q "Lê Duy Khương (Daniel)" README.md; then
  echo "README missing attribution" >&2
  fail=1
fi

exit "$fail"
