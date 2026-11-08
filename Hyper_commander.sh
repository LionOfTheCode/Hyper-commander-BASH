#! /usr/bin/env bash

print_welcome(){
	echo "Hello $USER!"
}

print_menu(){
	menu="------------------------------
| Hyper Commander            |
| 0: Exit                    |
| 1: OS info                 |
| 2: User info               |
| 3: File and Dir operations |
| 4: Find Executables        |
------------------------------"

	echo -e "$menu"

}

print_OS_info(){
	uname -no
}

print_user_info(){
	whoami
}

open_file(){
	echo "Not implemented!"
}

print_file_nav_menu(){
	echo -e "---------------------------------------------------
| 0 Main menu | 'up' To parent | 'name' To select |
---------------------------------------------------"
}

is_file_or_folder(){
	file_or_folder_found=false
    for item in "${file_arr[@]}"; do
      if [[ "$user_input" == "$item" ]]; then
        file_or_folder_found=true
        break
      fi
    done
}

print_file_ops_menu(){
	echo -e "---------------------------------------------------------------------
| 0 Back | 1 Delete | 2 Rename | 3 Make writable | 4 Make read-only |
---------------------------------------------------------------------"
}

remove_file(){
	rm "$file_name" && echo "$file_name has been deleted."
}

rename_file (){
	echo "Enter the new file name:"
	read new_file_name
	mv "$file_name" "$new_file_name" && echo "$file_name has been renamed as $new_file_name"	
}

give_666_perm(){
	chmod 666 "$file_name"
	echo "Permissions have been updated."
	ls -l "$file_name"
}

give_664_perm(){
	chmod 664 "$file_name"
	echo "Permissions have been updated."
	ls -l "$file_name"
}
	

file_ops(){
	file_name=$user_input
	while  true ; do
		print_file_ops_menu
		read user_input
		
		case "$user_input" in
			"1")
   					remove_file 
   					break;;
	   		"2")
	   				rename_file 
	   				break;;
	   		"3")
	   				give_666_perm 
	   				break;;
	   		"4")
	   				give_664_perm 
	   				break;;
	   		"0")
	   				break ;;
   		esac
		
	done
}

print_file_folder_ops(){
	if [[ -d "$user_input" ]]; then
		cd "$user_input"
	elif [[ -f "$user_input" ]]; then
		file_ops
	fi
}

print_file_dir_list(){
	echo "The list of files and directories:"
	file_arr=(*)
	for item in "${file_arr[@]}"; do
  		if [[ -f "$item" ]]; then
    			echo "F $item"
  		elif [[ -d "$item" ]]; then
    			echo "D $item"
  		fi
	done
}

up_command(){
	cd ..
}

print_invalid_input(){
	echo "Invalid input!"
}

print_file_dir_ops(){
	
 	while true ; do 
		print_file_dir_list	
		echo #To include empty new line
		print_file_nav_menu
		read user_input
			
		case "$user_input" in
			"up")
   					up_command ;;
	   		"0")
	   				break;;
	   		*)
	   				is_file_or_folder
	   				if [[ $file_or_folder_found == true ]]; then
	   					print_file_folder_ops
	   				else
	   					print_invalid_input
	   				fi
	   			;;
   		esac
   		
 	done
}

run_found_exec(){
	echo "Located in: $exec_path"
	echo "Enter arguments:"
	read -r exec_args
	"$exec_path" "$exec_args"

}

print_find_executables(){
	echo "Enter an executable name:"
	read exec_name
	exec_path=$(type -P "$exec_name")
	if [[ -n "$exec_path" ]]; then
		run_found_exec		
	else
		echo "The executable with that name does not exist!"
	fi
}

print_exit(){
	echo "Farewell!"
	exit

}

print_invalid_option(){
	echo "Invalid option!"
}


main(){
	print_welcome
	while  true ; do 
	
		print_menu
		read user_input
			
		case "$user_input" in
			"1")
   				print_OS_info ;;
   			"2")
   				print_user_info ;;
   			"3")
   				print_file_dir_ops ;;
   			"4")
   				print_find_executables ;;
   			"0")
   				print_exit ;;
   			*)
   				print_invalid_option ;;
   				
   		esac
   				
   	done

}

main