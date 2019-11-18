#!/bin/bash


###Welcome message####
echo "Welcome to overwatch suports redhat & debian based distros"

####Select loop###
select opt in "users" "software" "services" "firewall" "logs"

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

      "services")

      select services in "service status" "list all services" "start service" "stop service" "restart service" "enable service" "disable service" "back"

      do
        case $services in
          "service status" )

          read -p "Input the name of the service to check :" servicename

          systemctl status "$servicename"

            ;;

            "list all services" )

            systemctl list-unit-files

            ;;

            "start service" )

            read -p "Input the name of the service to start :" servicename

            sudo systemctl start "$servicename"

            ;;

            "stop service" )

            read -p "Input the name of the service to stop :" servicename

            sudo systemctl stop "$servicename"

            ;;

            "restart service" )

            read -p "Input the name of the service to restart :" servicename

            sudo systemctl restart "$servicename"

            ;;

            "enable service" )

            read -p "Input the name of the service to restart :" servicename

            sudo systemctl enable "$servicename"

            ;;

            "disable service" )

            read -p "Input the name of the service to restart :" servicename

            sudo systemctl disable "$servicename"

            ;;

            "back" )

            break

            ;;




        esac

      done
  esac


done
