#!/bin/bash

# Creates a decrypted copy of PDFs in current working directory

if [! command -v qpdf &> /dev/null]; then
    echo "QPDF could not be found. Try installing it and make sure qpdf is in your PATH."
    exit
fi

if [! -d "./decrypted" ]; then
    echo "Creating directory for decrypted files.."
    mkdir -v decrypted
fi

if [! -s "./password.txt" ]; then
    echo "password.txt file could not be found. Make sure it is in the current directory."
    exit
fi

echo "Saving a decrypted copy of PDFs in current directory to ./decrypted/.."
shopt -s nullglob
for f in *.pdf
do
    echo "Renaming encrypted PDF.."
    cp -v "$f" "encrypted.$f"
    echo "Removing encryption for $f"
    qpdf --decrypt @password.txt "$f" --replace-input --removeRestrictions
done
