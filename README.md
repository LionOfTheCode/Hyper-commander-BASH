# Hyper Commander

A Bash-based command-line file manager that provides basic system information, user information, file and directory navigation, file operations, and executable lookup.

## Features

- Displays a welcome message for the current user
- Shows operating system information
- Shows current user information
- Lists files and directories in the current directory
- Navigates into directories
- Moves to the parent directory
- Performs basic file operations:
  - Delete files
  - Rename files
  - Make files writable
  - Make files read-only
- Searches for executables available in the system `PATH`
- Runs found executables with user-provided arguments
- Interactive menu-based interface

## Requirements

- Bash
- Unix-like operating system such as Linux or macOS

## Usage

Save the script to a file, for example:

```bash
hyper_commander.sh
```

Make it executable:

```bash
chmod +x hyper_commander.sh
```

Run it:

```bash
./hyper_commander.sh
```

## Main Menu

When started, the program displays the following menu:

```text
------------------------------
| Hyper Commander            |
| 0: Exit                    |
| 1: OS info                 |
| 2: User info               |
| 3: File and Dir operations |
| 4: Find Executables        |
------------------------------
```

## Menu Options

| Option | Description |
|---|---|
| `0` | Exit the program |
| `1` | Display operating system information |
| `2` | Display the current username |
| `3` | Open file and directory operations |
| `4` | Search for and run an executable |

## File and Directory Operations

The file and directory operations menu lists items in the current directory.

Files are displayed with the `F` prefix:

```text
F filename.txt
```

Directories are displayed with the `D` prefix:

```text
D folder_name
```

Navigation options:

| Input | Action |
|---|---|
| `0` | Return to the main menu |
| `up` | Move to the parent directory |
| `name` | Select a file or directory by name |

If a directory is selected, the program enters that directory.

If a file is selected, the file operations menu is displayed.

## File Operations

When a file is selected, the following menu is shown:

```text
---------------------------------------------------------------------
| 0 Back | 1 Delete | 2 Rename | 3 Make writable | 4 Make read-only |
---------------------------------------------------------------------
```

| Option | Description |
|---|---|
| `0` | Go back |
| `1` | Delete the selected file |
| `2` | Rename the selected file |
| `3` | Change file permissions to `666` |
| `4` | Change file permissions to `664` |

## Find Executables

The program can search for an executable by name using the system `PATH`.

Example executable names:

```text
ls
echo
pwd
python
```

If the executable is found, the program displays its location and asks for arguments.

If the executable is not found, it prints:

```text
The executable with that name does not exist!
```

## Notes

- File deletion is permanent and does not move files to trash.
- File permission changes use `chmod`.
- The executable search relies on `type -P`.
- The script is interactive and expects input from the terminal.

## Exit

Choose option `0` from the main menu to exit the program.

The program prints:

```text
Farewell!
```
