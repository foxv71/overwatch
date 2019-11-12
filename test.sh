#!/bin/bash


###Welcome message###
echo "Welcome to overwatch again"

####Select loop###
select opt in "users" "software"

do
###Case statment for select loop var###
  case $opt in




    "users" )

    select users in "add user" "remove user" "update user password" "list users" "back"

    do

      case $users in

        "add user" )
        read -p "Please input new user name :" username
        sudo adduser "$username"

          ;;

          "remove user" )
          read -p "Please input the user name :" username
          sudo deluser "$username"

          ;;

          "update user password")
          read -p "Please input the user name :" username
          sudo passwd "$username"

          ;;

          "list users")
        sudo cat /etc/passwd | grep /home/ | cut -d ":" -f1

        ;;


        "back")
        break

        ;;


      esac


    done

      ;;







      "software")

      if [[ -f /usr/bin/apt ]]; then

        select software in "install" "reinstall" "update" "remove" "back"

          do

        case $software in
          "install" )

          read -p "Input the name of the software to install :" softwarename

          sudo apt install "$softwarename"

            ;;

            "reinstall")

            read -p "Input the name of the software to reinstall :" softwarename

            sudo apt install --reinstall "$softwarename"

            ;;

            "update")

            select update in "update all" "update one package"
            do

              case $update in

                "update all" )

                sudo apt update && sudo apt upgrade

                break
                  ;;

                  "update one package")

                  read -p "Input the name of the package you wish to update :" packagename

                  sudo apt-get --only-upgrade install "$packagename"

                  break
                  ;;
              esac


            done

            ;;

            "remove")

            read -p "Input the name of the package you wish to remove :" packagename

            sudo apt autoremove "$packagename"

            ;;

            "back")
            break

            ;;
        esac
done

      elif [[ -f /usr/bin/yum ]]; then



        select software in "install" "reinstall" "update" "remove" "back"

        do

        case $software in
          "install" )

          read -p "Input the name of the package you wish to install :" packagename

          sudo dnf install "$packagename"

          echo "Yum that taste good!"
            ;;

            "reinstall")

            read -p "Input the name of the package you wish to reinstall :" packagename

            sudo dnf reinstall "$packagename"

            ;;

            "update")

            select update in "update all" "update one package"
            do

              case $update in

                "update all" )

                sudo dnf update

                break
                  ;;

                  "update one package")

                  read -p "Input the name of the package you wish to update :" packagename

                  sudo dnf update "$packagename"

                  break
                  ;;
              esac


            done

            ;;

            "remove")

            read -p "Input the name of the package you wish to remove :" packagename

            sudo yum remove "$packagename"

            ;;

            "back")
            break

            ;;
        esac
      done
      fi


      ;;
  esac


done
