#!/usr/bin/python3

"""
Read and write to the heap memory

Usage: read_write_heap.py pid search_string replace_string

Arguments:
pid: The process ID of the target process
search_string: The string to search for in the heap memory
replace_string: The string to replace the search_string with

"""
import sys

def find_and_replace_string(pid, search_string, replace_string):
    """Finds a string in the heap memory of a process and replaces it with another string."""

    try:
        with open(f"/proc/{pid}/maps", "r") as maps_file:
            for line in maps_file:
                if "heap" in line:
                    heap_address = line.split()[0]
                    break
            else:
                print("Heap not found.")
                return

        with open(f"/proc/{pid}/mem", "r+b") as mem_file:
            mem_file.seek(int(heap_address.split('-')[0], 16))
            data = mem_file.read(1024) 
            
            if search_string.encode() in data:
                new_data = data.replace(search_string.encode(), replace_string.encode())
                mem_file.seek(int(heap_address.split('-')[0], 16))
                mem_file.write(new_data)
            else:
                print(f"'{search_string}' not found in heap memory.")
    except FileNotFoundError:
        print(f"Process with PID {pid} does not exist.")
    except PermissionError:
        print(f"Permission denied to access process {pid}. You may need to run as root.")
    except Exception as e:
        print(f"An error occurred: {e}")


if __name__ == "__main__":

    if len(sys.argv) != 4:
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)
    
    pid = sys.argv[1]
    search_string = sys.argv[2]
    replace_string = sys.argv[3]

    find_and_replace_string(pid, search_string, replace_string)
