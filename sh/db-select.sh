#! /bin/sh
show_mainmenu()
{
  while true; do
    cat <<EOF
menu(dev)
1:dev-master
2:dev-slave
3:exit
使用するDBナンバーを入力してください。
EOF
    read ACT_MAIN
    case ${ACT_MAIN} in
     1)
      echo '*****************'
      echo 'master'
      echo '*****************'
      mysql -u root -h localhost -D db_name --password=db_psw --prompt 'master> '
      break
      ;;
     2)
      echo '*****************'
      echo 'slave'
      echo '*****************'
      mysql -u root -h localhost -D db_name --password=db_psw --prompt 'slave> '
      break
      ;;
     3)
      echo '*****************'
      echo 'exit'
      echo '*****************'
      break
      ;;
     *)
      printf "error : invalid key"
      ;;
    esac
  done
}
show_mainmenu
