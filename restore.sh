TITLE="$1"
if [[ "$TITLE" == "" ]]; then
  echo "Usage: $0 <TITLE>"
  exit 1
fi

curl -su "$USER" "$ENDPOINT/$TITLE.tar.zst" | pv | zstd -d -T0 | tar xf -
