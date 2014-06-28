#
# Jacob Vallejo 2014
#
# Vars available to Gitlab, these are the defaults. If specified with
# setup, they will be dumped by default to GITLAB_VARS and then
# sourced any time this file is after setting defaults
#


GITLAB_DATA_PATH=${GITLAB_DATA_PATH:-"/opt/gitlab"}

# Source the locally defined vars if they exist.
GITLAB_VARS=${GITLAB_VARS:-$GITLAB_DATA_PATH/.vars.sh}
if [ -f "$GITLAB_VARS" ]; then
    source "$GITLAB_VARS"
fi


DB_HOST=${DB_HOST:-db}
DB_NAME=${DB_NAME:-gitlab}
DB_USER=${DB_USER:-gitlab}
DB_PASS=${DB_PASS:-gitlab_rocks}

SMTP_HOST=${SMTP_HOST:-smtp}
SMTP_PORT=${SMTP_PORT:-25}
SMTP_USER=${SMTP_USER:gitlab}
SMTP_PASS=${SMTP_PASS:gitlab}
SMTP_AUTH_METHOD=${SMTP_AUTH_METHOD:-login}

GITLAB_WEB_PORT=${GITLAB_WEB_PORT:-8080}
GITLAB_SSH_PORT=${GITLAB_SSH_PORT:-2222}

GITLAB_DOMAIN=${GITLAB_DOMAIN:-cs.witcsn.net}
GITLAB_HOST=${GITLAB_HOST:-"code.$GITLAB_DOMAIN"}


function glDumpEnv() {
    cat <<EOF
DB_HOST="$DB_HOST"
DB_NAME="$DB_NAME"
DB_USER="$DB_USER"
DB_PASS="${DB_PASS:-gitlab_rocks}"
DB_HOST="$DB_HOST"

SMTP_HOST="$SMTP_HOST"
SMTP_PORT="$SMTP_PORT"
SMTP_USER="$SMTP_USER"
SMTP_PASS="$SMTP_PASS"
SMTP_AUTH_METHOD="$SMTP_AUTH_METHOD"

GITLAB_DOMAIN="$GITLAB_DOMAIN"
GITLAB_HOST="code.$GITLAB_DOMAIN"

GITLAB_WEB_PORT="$GITLAB_WEB_PORT"
GITLAB_SSH_PORT="$GITLAB_SSH_PORT"

GITLAB_DATA_PATH="$GITLAB_DATA_PATH"

# This file, probably won't need to change this.
GITLAB_VARS="${GITLAB_VARS:-$GITLAB_DATA_PATH/.vars.sh}"
EOF
}

# Show vars if executed as script
# [ $(basename $0) = "vars.sh" ] && glDumpEnv
