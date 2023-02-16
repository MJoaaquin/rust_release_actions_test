#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "You must pass the environment variables GIT_TAG_ENV and GIT_COMMIT_ENV as arguments."
  exit 1
fi

cat <<EOF > Cross.toml
[target.aarch64-unknown-linux-gnu]
pre-build = [
  "dpkg --add-architecture \$CROSS_DEB_ARCH",
  "apt-get update && apt-get install --assume-yes libssl-dev:\$CROSS_DEB_ARCH",
  "curl -fsSL 'https://github.com/pnpm/pnpm/releases/latest/download/pnpm-linuxstatic-x64' -o /bin/pnpm; chmod +x /bin/pnpm;",
]

[build.env]
passthrough = [
  "GIT_TAG=$1",
  "GIT_COMMIT=$2"
]
EOF

echo "The Cross.toml file has been successfully created with environment variables GIT_TAG=$1 and GIT_COMMIT=$2."
