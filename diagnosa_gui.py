from pyswip import Prolog
import tkinter as tk
from tkinter import messagebox

def jalankan_diagnosa():
    prolog = Prolog()
    prolog.consult("diagnosa_pokemon.pl")

    hasil = list(prolog.query("diagnosa(Kode, Nama)"))
    
    if hasil:
        kode = hasil[0]['Kode']
        nama = hasil[0]['Nama']
        messagebox.showinfo("Hasil Diagnosa", f"Status Abnormal Terdeteksi:\nKode: {kode.upper()}\nNama: {nama.capitalize()}")
    else:
        messagebox.showinfo("Hasil Diagnosa", "Tidak ditemukan status abnormal yang cocok.")

# GUI
root = tk.Tk()
root.title("Sistem Pakar Diagnosa Pokémon")

label = tk.Label(root, text="Klik tombol di bawah untuk menjalankan diagnosa Charizard", font=("Arial", 12))
label.pack(pady=20)

btn = tk.Button(root, text="Diagnosa Sekarang", command=jalankan_diagnosa, font=("Arial", 12), bg="orange")
btn.pack(pady=10)

root.mainloop()
