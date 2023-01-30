
# ./big_files_search.sh /tmp 500000 file_grandi_in_tmp.txt

# In questo esempio, lo script cercherà  tutti i file grandi nella directory /tmp, dove un file grande è definito come avendo una dimensione maggiore di 500000 byte. 
# L'output, una lista dei file grandi e delle loro dimensioni, verrà salvato nel file specificato
#  ./big_files_search.sh /tmp 500000 file_grandi_in_tmp.txt
#  Roberto 

# Controllo se sono stati passati le variabile
if [ $# -lt 3 ]; then
  echo "Usage: $0 <dir> <min_size> <output_file>"
  exit 1
fi

# Cartella da cercare
dir=$1

# Dimensione minima
min_size=$2

# Output file
output_file=$3

# Trobo tutti i file piÃ¹ grandi seguendo i paramentri 
find "$dir" -type f -size +"$min_size"c -exec ls -lh {} \; | awk '{ print $5 " " $9 }' > "$output_file"

echo "Listato salvato in $output_file"
