# Get start line of table
table_start="$(($(grep -n '## Job Postings' README.md | cut -d: -f1) + 4))"

# Extract table
table=$(sed -n "$table_start,$  p" README.md)

# Sort table
sorted_table=$(sort -t '|' -k 2 <<<"$table")

# Delete table
sed -i "$table_start,$  d" README.md

# Insert sorted table
echo "$sorted_table" >>README.md
