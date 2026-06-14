#!/bin/bash
set -e

mkdir -p public

# Copy source HTML to output
cp src/index.html public/index.html

# Inject admin password from environment variable
if [ -n "$NEXT_PUBLIC_ADMIN_PW" ]; then
  sed -i "s/V_ADMIN_PASSWORD/$NEXT_PUBLIC_ADMIN_PW/g" public/index.html
  echo "✓ Admin password injected."
else
  echo "⚠ WARNING: NEXT_PUBLIC_ADMIN_PW is not set. Password will remain as placeholder."
fi

echo "✓ Build complete → public/index.html"
