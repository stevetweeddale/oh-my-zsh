# ------------------------------------------------------------------------------
#          FILE:  drush.plugin.zsh
#   DESCRIPTION:  drush zsh integration.
# ------------------------------------------------------------------------------

# Ensure drush is available.
which drush > /dev/null || alias drush &> /dev/null || return

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function drupal_site() {
  f="${TMPDIR:-/tmp/}/drush-env/drush-drupal-site-$$"
  if [ -f $f ]
  then
    DRUPAL_SITE=$(cat "$f")
  fi

  [[ -n "$DRUPAL_SITE" ]] && printf "${1:-%s}" "$DRUPAL_SITE"
}

# @TODO I want to port the rest of the stuff from drush's example.bashrc to zsh and include it in here.