#!/bin/bash

# Creates a decrypted copy of PDFs in current working directory

# Prerequisites: 
#
#   A file called password.txt in the current directory with the following contents <<
#    --password=THISISTHEPDFPASSWORD
#
#   Install qpdf (brew install qpdf on macos, apt-get install qpdf on ubuntu)

echo "Creating directory for decrypted files.."
mkdir -v decrypted

echo "Saving a decrypted copy of PDFs in current directory to ./decrypted/.."
shopt -s nullglob
for f in *.pdf
do
	echo "Removing password for: $f"
      qpdf --decrypt @password.txt "$f" "decrypted/$f"
done
