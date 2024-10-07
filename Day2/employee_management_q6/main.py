# main.py

import tkinter as tk
from tkinter import filedialog, messagebox
from employee_data import Employee, employees_list
from styles import BACKGROUND_COLOR, TEXT_COLOR, BUTTON_COLOR, BUTTON_HOVER_COLOR
from PIL import Image, ImageTk

class EmployeeManagementApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Employee Management System")
        self.root.geometry("600x600")
        self.root.config(bg=BACKGROUND_COLOR)

        self.create_widgets()

    def create_widgets(self):
        # Labels
        tk.Label(self.root, text="First Name:", bg=BACKGROUND_COLOR, fg=TEXT_COLOR).pack(pady=5)
        self.first_name_entry = tk.Entry(self.root)
        self.first_name_entry.pack(pady=5)

        tk.Label(self.root, text="Last Name:", bg=BACKGROUND_COLOR, fg=TEXT_COLOR).pack(pady=5)
        self.last_name_entry = tk.Entry(self.root)
        self.last_name_entry.pack(pady=5)

        tk.Label(self.root, text="Profile Picture:", bg=BACKGROUND_COLOR, fg=TEXT_COLOR).pack(pady=5)
        self.picture_path = tk.StringVar()
        self.picture_entry = tk.Entry(self.root, textvariable=self.picture_path)
        self.picture_entry.pack(pady=5)

        tk.Button(self.root, text="Browse", command=self.browse_image, bg=BUTTON_COLOR, fg="white", activebackground=BUTTON_HOVER_COLOR).pack(pady=5)

        tk.Label(self.root, text="Status:", bg=BACKGROUND_COLOR, fg=TEXT_COLOR).pack(pady=5)
        self.status_var = tk.StringVar(value='active')
        tk.OptionMenu(self.root, self.status_var, 'active', 'absent', 'terminated').pack(pady=5)

        tk.Label(self.root, text="Level:", bg=BACKGROUND_COLOR, fg=TEXT_COLOR).pack(pady=5)
        self.level_entry = tk.Entry(self.root)
        self.level_entry.pack(pady=5)

        tk.Label(self.root, text="Qualifications:", bg=BACKGROUND_COLOR, fg=TEXT_COLOR).pack(pady=5)
        self.qualifications_entry = tk.Entry(self.root)
        self.qualifications_entry.pack(pady=5)

        tk.Label(self.root, text="Salary:", bg=BACKGROUND_COLOR, fg=TEXT_COLOR).pack(pady=5)
        self.salary_entry = tk.Entry(self.root)
        self.salary_entry.pack(pady=5)

        tk.Button(self.root, text="Add Employee", command=self.add_employee, bg=BUTTON_COLOR, fg="white", activebackground=BUTTON_HOVER_COLOR).pack(pady=20)

        self.employee_listbox = tk.Listbox(self.root, width=70, height=10)
        self.employee_listbox.pack(pady=20)

    def browse_image(self):
        file_path = filedialog.askopenfilename(filetypes=[("Image Files", "*.jpg *.jpeg *.png")])
        if file_path:
            self.picture_path.set(file_path)

    def add_employee(self):
        first_name = self.first_name_entry.get()
        last_name = self.last_name_entry.get()
        profile_picture = self.picture_path.get()
        status = self.status_var.get()
        level = self.level_entry.get()
        qualifications = self.qualifications_entry.get()
        salary = self.salary_entry.get()

        if not all([first_name, last_name, profile_picture, level, qualifications, salary]):
            messagebox.showerror("Input Error", "Please fill all fields!")
            return

        employee = Employee(first_name, last_name, profile_picture, status, level, qualifications, salary)
        employees_list.append(employee)
        self.update_employee_listbox()
        self.clear_entries()

    def update_employee_listbox(self):
        self.employee_listbox.delete(0, tk.END)
        for emp in employees_list:
            self.employee_listbox.insert(tk.END, f"{emp.first_name} {emp.last_name} - {emp.status}")

    def clear_entries(self):
        self.first_name_entry.delete(0, tk.END)
        self.last_name_entry.delete(0, tk.END)
        self.picture_path.set("")
        self.level_entry.delete(0, tk.END)
        self.qualifications_entry.delete(0, tk.END)
        self.salary_entry.delete(0, tk.END)

if __name__ == "__main__":
    root = tk.Tk()
    app = EmployeeManagementApp(root)
    root.mainloop()
