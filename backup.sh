TITLE="$1"
DIR="$2"
if [[ "$TITLE" == "" ]]; then
  echo "Usage: $0 <TITLE> [DIR]"
  exit 1
fi
: "${DIR:=backup}"

tar cpf - "$DIR" | zstd -c -T0 | pv | curl -T - -su "$USER" "$ENDPOINT/$TITLE.tar.zst"
