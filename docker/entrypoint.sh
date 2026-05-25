##!/bin/sh
#set -e

# Copy config from app to picoclaw home
#mkdir -p "${HOME}/.picoclaw"
#cp /app/config/config.json "${HOME}/.picoclaw/config.json"

# Replace environment variables in config
#sed -i "s|\\$TELEGRAM_BOT_TOKEN|${TELEGRAM_BOT_TOKEN}|g" "${HOME}/.picoclaw/config.json"
#sed -i "s|\\$GROQ_API_KEY|${GROQ_API_KEY}|g" "${HOME}/.picoclaw/config.json"
#sed -i "s|\\$TELEGRAM_USER_ID|${TELEGRAM_USER_ID}|g" "${HOME}/.picoclaw/config.json"

# Remove stale PID file
#rm -f "${HOME}/.picoclaw/.picoclaw.pid"

#exec picoclaw gateway "$@"
#!/bin/sh
set -e

# Copy config template from app to picoclaw home
mkdir -p "${HOME}/.picoclaw"

# Substitute env vars into config. envsubst does literal substitution
# with no regex interpretation, so secrets containing : / & \ are safe.
envsubst '${TELEGRAM_BOT_TOKEN} ${GROQ_API_KEY} ${TELEGRAM_USER_ID}' \
  < /app/config/config.json \
  > "${HOME}/.picoclaw/config.json"

# Remove stale PID file
rm -f "${HOME}/.picoclaw/.picoclaw.pid"

exec picoclaw gateway "$@"
