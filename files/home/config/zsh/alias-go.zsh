# Add go-related aliases
alias gor="go run ."
alias got="go test -v ./..."
alias goi="go install"
alias gou="go clean -i"
alias gob="go build"
alias gogo="cd $PROJECTS/Go"

# Add go-related functions
function gonew {
    base="github.com/flevin58"
    here=$(pwd)
    case "$1" in
    "")
        if [[ -f "$here/go.mod" ]]; then
            echo "go.mod already exists"
            return
        fi
        go mod init "$base/$(basename $here)"
        ;;
    *)
        if [[ -d $1 ]]; then
            echo "Folder $1 already exists"
            return
        fi
        if [[ "$1" == "$(basename $here)" ]]; then
            echo "You are aleady in folder $1"
            return
        fi
        mkdir $1
        chdir $1
        go mod init "$base/$1"
        git init
        ;;
    esac
}
