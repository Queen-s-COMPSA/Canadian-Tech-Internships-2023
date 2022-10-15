table_start="$(($(grep -n '## Job Postings' README.md | cut -d: -f1) + 4))"

table=$(sed -n "$table_start,$  p" README.md)
sorted_table=$(sort -t '|' -k 2 <<< "$table")

sed -i "$table_start,$  d" README.md
echo "$sorted_table" >> README.md
