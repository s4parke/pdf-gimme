# pdf-gimme

Remove password encryption from PDF documents if you already know the password.

Requires [QPDF](https://github.com/qpdf/qpdf) and a bash-compatible shell.

## macOS (homebrew) instructions
1. Install qpdf: `brew install qpdf`
2. Make pdf-gimme.sh executable: `chmod 744 pdf-gimme.sh`
3. Copy the pdf password to `password.txt`
4. Move/copy the encrypted PDF files into a the working directory
5. Run the script: `./pdf-gimme.sh`
