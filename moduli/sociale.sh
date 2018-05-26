#!/bin/bash

echo " "
PS3="Choose an option:"

select opt in "COLLECT INFO" "SECURITY ALERT" "EXIT"
do
    case "$opt" in
        'COLLECT INFO')
        cd collect
        sudo bash colleziona.sh
        cd - >> /dev/null
        ;;
        'SECURITY ALERT')

cd se
          sudo bash avviascam.sh
          cd - >> /dev/null
          ;;
          'EXIT')
          exit 0
          break;
          esac
          done
