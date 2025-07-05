#!/bin/bash
if [ $# -lt 1 ]; then
    echo "Usage: $0 wordlist.txt"
    exit 1
fi

INPUT=$1
OUTPUT="leet_word.txt"

echo "[*] Input: $INPUT"
echo "[*] Output: $OUTPUT"

rm -f $OUTPUT

while read word; do
    echo "$word" >> $OUTPUT

    echo "$word" | sed -e '
        s/a/4/g; s/A/4/g;
        s/e/3/g; s/E/3/g;
        s/i/1/g; s/I/1/g;
        s/o/0/g; s/O/0/g;
        s/s/5/g; s/S/5/g;
        s/t/7/g; s/T/7/g;
        s/g/9/g; s/G/9/g;
        s/z/2/g; s/Z/2/g;
    ' >> $OUTPUT

done < "$INPUT"

sort -u $OUTPUT -o $OUTPUT

echo "[+] Done! Saved as $OUTPUT 🎉"

#input="$1"
#output="leet"
#sed -e 's/a/4/g' -e 's/e/3/g' -e 's/i/1/g' -e 's/l/1/g' -e 's/o/0/g' -e 's/s/5/g' -e 's/t/7/g' "$input" > 1337.txt
#cat "$input" 1337.txt | tr '[:upper:]' '[:lower:]' > "$output" && rm 1337.txt
