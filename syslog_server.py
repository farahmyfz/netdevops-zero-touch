import socket

IP = "0.0.0.0" 
PORT = 5140

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((IP, PORT))

print(f"[*] Syslog Server berjalan. Mendengarkan di Port {PORT}...")
print("[*] Menunggu log dari router...\n")

while True:
    data, addr = sock.recvfrom(1024)
    # Menampilkan IP pengirim dan pesan log-nya di layar
    print(f"[{addr[0]}] -> {data.decode('utf-8').strip()}")
