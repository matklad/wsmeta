#!/usr/bin/env bash
set -e
cargo metadata | python3 -m json.tool > a.json
cargo metadata --no-deps | python3 -m json.tool > a-no-deps.json

pushd b
cargo metadata | python3 -m json.tool > ../b.json
cargo metadata --no-deps | python3 -m json.tool > ../b-no-deps.json
popd

echo 'diff a.json b.json'
diff a.json b.json || true

echo 'diff a-no-deps.json b-no-deps.json'
diff a-no-deps.json b-no-deps.json
