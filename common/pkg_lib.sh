
# $1 - destdir, $2 - url
start_installation() {
    wget "$2"
    archive_name="$(basename $2)"
    dir_name=$(tar -tf "$archive_name" | head -1 | cut -f1 -d"/")
    tar -xf "$archive_name"
    cd $dir_name
    "configure" "$1"
    "build" "$1"
    "install" "$1"
    cd ..
}