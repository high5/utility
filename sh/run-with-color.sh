# run-with-color.sh
# example
# run echo $(colored $lg "Start")
# run echo $(colored $lg "Finished!")
# run rm $dir
# etc..
red=31
yellow=33
cyan=36
#light green
lg=92

colored() {
  color=$1
  shift
  echo -e "\033[1;${color}m$@\033[0m"
}

run() {
  "$@"
  result=$?

  if [ $result -ne 0 ]
  then
    echo -n $(colored $red "Failed: ")
    echo -n $(colored $cyan "$@")
    echo $(colored $yellow " [$PWD]")
    exit $result
  fi

  return 0
}
