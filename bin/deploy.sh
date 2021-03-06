RELEASE=${1}

bash /app/updates/release-${RELEASE}.sh
if [ -z "$RELEASE" ]; then
  wp option update proud_release $RELEASE --allow-root
fi

wp core update-db --allow-root
wp w3-total-cache flush minify --allow-root
wp w3-total-cache flush all --allow-root
wp rewrite flush --allow-root
wp cache flush --allow-root